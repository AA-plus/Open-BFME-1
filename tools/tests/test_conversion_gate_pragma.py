"""Rule A2 keys asm-only bodies by signature; a preprocessor line is not one.

re_attempts 59378/59379: deleting two naked dumps from
fx_particle_system_bulk.cpp left an /alternatename pragma pair in front of
the next, unchanged naked destructor, so its header read
`#pragma ... __declspec(naked) X::~X()` and the gate reported it as added.
"""
import os
import subprocess
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import conversion_gate  # noqa: E402
import progress  # noqa: E402

BODY = "{\n    __asm {\n        mov eax, ecx\n        xor ecx, ecx\n        mov [eax], ecx\n        ret\n    }\n}\n"
PRAGMA = '#pragma comment(linker, "/alternatename:?a@@YAXXZ=?b@@YAXXZ")\n'


def test_pragma_line_is_not_part_of_the_signature():
    text = "void helper();\n" + PRAGMA + "__declspec(naked) void Kept()\n" + BODY
    assert [b["signature"] for b in progress.asm_only_bodies(text)] == ["__declspec(naked) void Kept()"]


def _gate(tmp_path, before, after):
    git = lambda *a: subprocess.run(["git", "-C", str(tmp_path), *a], check=True,
                                    capture_output=True, text=True).stdout
    git("init", "-q")
    (tmp_path / "game").mkdir()
    (tmp_path / "game/a.cpp").write_text(before)
    git("add", ".")
    git("-c", "user.name=t", "-c", "user.email=t@t", "commit", "-qm", "base")
    (tmp_path / "game/a.cpp").write_text(after)
    git("add", ".")
    here = os.getcwd()
    os.chdir(tmp_path)
    try:
        return conversion_gate.added_asm_only_bodies("HEAD", ":")
    finally:
        os.chdir(here)


def test_deleting_a_dump_before_a_pragma_does_not_charge_the_next_body(tmp_path):
    dropped = "__declspec(naked) void Dropped()\n" + BODY
    before = "void helper() {}\n" + PRAGMA + dropped + "\n__declspec(naked) void Kept()\n" + BODY
    after = "void helper() {}\n" + PRAGMA + "\n__declspec(naked) void Kept()\n" + BODY
    assert _gate(tmp_path, before, after) == []


def test_a_new_asm_body_after_a_pragma_is_still_refused(tmp_path):
    before = "void helper() {}\n"
    after = before + PRAGMA + "__declspec(naked) void Added()\n" + BODY
    assert [p for p, _ in _gate(tmp_path, before, after)] == ["game/a.cpp"]


def _both_rules(tmp_path, before, after):
    """(Rule A2 offences, Rule A offending paths) for one staged edit."""
    asm_only = _gate(tmp_path, before, after)
    here = os.getcwd()
    os.chdir(tmp_path)
    try:
        lifts = conversion_gate.added_lift_lines("HEAD", ":")
    finally:
        os.chdir(here)
    return [p for p, _ in asm_only], [p for p, _ in lifts]


def test_retyping_an_existing_naked_body_adds_no_lift(tmp_path):
    # re_attempts 59794: CommUdpProcess gained a tick parameter, body unchanged.
    before = "void helper() {}\n__declspec(naked) int Process()\n" + BODY
    after = "void helper() {}\n__declspec(naked) int Process(unsigned tick)\n" + BODY
    assert _both_rules(tmp_path, before, after) == ([], [])


def test_swapping_one_naked_body_for_another_is_still_refused(tmp_path):
    before = "void helper() {}\n__declspec(naked) int Process()\n" + BODY
    after = "void helper() {}\n__declspec(naked) int Other()\n" + BODY
    assert _both_rules(tmp_path, before, after) == (["game/a.cpp"], ["game/a.cpp"])


def test_a_second_naked_overload_is_still_refused(tmp_path):
    before = "void helper() {}\n__declspec(naked) int Process()\n" + BODY
    after = before + "__declspec(naked) int Process(unsigned tick)\n" + BODY
    assert _both_rules(tmp_path, before, after) == (["game/a.cpp"], ["game/a.cpp"])
