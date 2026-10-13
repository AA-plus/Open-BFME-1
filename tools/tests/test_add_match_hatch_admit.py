"""add_match admits a verified row's object-symbol= in the escape-hatch register only
when it names a compiler label (`_$E8`, `$L12`, `__ehhandler$...`); an alias to a
real function, or one typed into functions.csv by hand, stays refused growth."""
import os
import subprocess
import sys
from pathlib import Path

import pytest

TOOLS = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(TOOLS))
import add_match  # noqa: E402
import hatch_counters  # noqa: E402

LEDGER = "targets/game/reverse/functions.csv"
HEADER = "name,export_rva,target_rva,target_size,source,status,notes\n"


def git(root, *args):
    env = dict(os.environ, GIT_AUTHOR_NAME="t", GIT_COMMITTER_NAME="t", GIT_AUTHOR_EMAIL="",
               GIT_COMMITTER_EMAIL="")
    got = subprocess.run(["git", "-C", str(root), *args], capture_output=True, text=True, env=env)
    assert got.returncode == 0, got.stderr
    return got.stdout


@pytest.mark.parametrize("notes, admitted", [
    ("object-symbol=_$E8; native PointGroup initializer", True),
    ("object-symbol=$L4571", True),
    ("x;object-symbol=__ehhandler$?f@@YAXXZ;y", True),
    ("object-symbol=?realName@Thing@@QAEXXZ", False),
    ("object-symbol=_$E8junk more", False),
    ("plain notes", False),
])
def test_compiler_label_pattern(notes, admitted):
    assert bool(add_match.COMPILER_LABEL.search(notes)) is admitted


@pytest.fixture
def tree(tmp_path, monkeypatch):
    (tmp_path / LEDGER).parent.mkdir(parents=True)
    (tmp_path / LEDGER).write_text(HEADER, newline="\n")
    git(tmp_path, "init", "-q")
    git(tmp_path, "config", "core.autocrlf", "false")
    monkeypatch.setattr(hatch_counters, "ROOT", tmp_path)
    git(tmp_path, "add", ".")
    hatch_counters.write(hatch_counters.tree_scan(), mode="enforce")
    git(tmp_path, "add", ".")
    git(tmp_path, "commit", "-qm", "init")
    monkeypatch.chdir(tmp_path)
    return tmp_path


def append_and_admit(root, row, rva, notes):
    before = (root / LEDGER).read_bytes()
    (root / LEDGER).write_bytes(before + row.encode() + b"\n")
    add_match.admit_compiler_label_alias(root, notes, rva, before)


def gate(root):
    git(root, "add", ".")
    errors, _, hard = hatch_counters.check_staged()
    return errors + hard


def test_verified_compiler_label_rows_pass_and_others_are_refused(tree):
    append_and_admit(tree, "?d_1@@YAXXZ,,0x00C6DE20,26,game/a.cpp,matched,object-symbol=_$E8", 0xC6DE20,
                     "object-symbol=_$E8")
    append_and_admit(tree, "?d_2@@YAXXZ,,0x00C70890,20,game/b.cpp,matched,object-symbol=_$E2", 0xC70890,
                     "object-symbol=_$E2")
    assert gate(tree) == []                      # two tool admissions in one commit
    append_and_admit(tree, "?alias@@YAXXZ,,0x00001000,5,game/c.cpp,matched,object-symbol=?real@@YAXXZ",
                     0x1000, "object-symbol=?real@@YAXXZ")
    problems = gate(tree)
    assert problems and all("0x00001000" in p for p in problems)


def test_landing_a_row_leaves_unrelated_register_lines_byte_for_byte(tree):
    """owner_queue 132: an add_match run rewrites only the register lines of the rows it
    lands; an unrelated line's (stale) allow= marker survives untouched."""
    append_and_admit(tree, "?d_1@@YAXXZ,,0x00BF3B38,9,game/a.cpp,matched,object-symbol=$L1", 0xBF3B38,
                     "object-symbol=$L1")
    append_and_admit(tree, "?d_9@@YAXXZ,,0x00BF4000,9,game/z.cpp,matched,object-symbol=$L9", 0xBF4000,
                     "object-symbol=$L9")
    git(tree, "add", ".")
    git(tree, "commit", "-qm", "landed")
    register = tree / hatch_counters.BASELINE
    stale = [l for l in register.read_text().splitlines() if "0x00BF3B38" in l]
    assert len(stale) == 1 and "\tallow=" in stale[0]          # committed, now inert marker
    # a later label run that lands an unrelated row X
    append_and_admit(tree, "?d_2@@YAXXZ,,0x00C70890,20,game/b.cpp,matched,object-symbol=_$E2", 0xC70890,
                     "object-symbol=_$E2")
    lines = register.read_text().splitlines()
    assert stale[0] in lines
    assert any("0x00C70890" in l and "\tallow=" in l for l in lines)
    assert gate(tree) == []
    # a replacement that retires 0x00BF4000 drops only that line
    before = (tree / LEDGER).read_bytes()
    (tree / LEDGER).write_bytes(before.replace(
        b"?d_9@@YAXXZ,,0x00BF4000,9,game/z.cpp,matched,object-symbol=$L9\n",
        b"?real@@YAXXZ,,0x00BF4004,5,game/z.cpp,matched,\n"))
    add_match.admit_compiler_label_alias(tree, "", 0xBF4004, before, 0xBF4000)
    lines = register.read_text().splitlines()
    assert stale[0] in lines
    assert not any("0x00BF4000" in l for l in lines)
    assert gate(tree) == []


def test_scoped_run_still_tightens_stale_high_lines(tree):
    """Review HC-1: a hand-deleted alias row's register line shrinks on the next scoped
    add_match run, so re-adding that alias by hand is refused again."""
    append_and_admit(tree, "?d_1@@YAXXZ,,0x00004000,9,game/a.cpp,matched,object-symbol=$L1", 0x4000,
                     "object-symbol=$L1")
    append_and_admit(tree, "?d_3@@YAXXZ,,0x00005000,9,game/c.cpp,matched,object-symbol=$L3", 0x5000,
                     "object-symbol=$L3")
    git(tree, "add", ".")
    git(tree, "commit", "-qm", "landed")
    register = tree / hatch_counters.BASELINE
    marked = [l for l in register.read_text().splitlines() if "0x00005000" in l][0]
    ledger = tree / LEDGER
    ledger.write_bytes(ledger.read_bytes().replace(
        b"?d_1@@YAXXZ,,0x00004000,9,game/a.cpp,matched,object-symbol=$L1\n", b""))
    git(tree, "add", ".")
    git(tree, "commit", "-qm", "hand delete")
    append_and_admit(tree, "?d_2@@YAXXZ,,0x00C70890,20,game/b.cpp,matched,object-symbol=_$E2", 0xC70890,
                     "object-symbol=_$E2")
    lines = register.read_text().splitlines()
    assert not any("0x00004000" in l for l in lines)
    assert marked in lines
    assert gate(tree) == []
    git(tree, "commit", "-qm", "x")
    append_and_admit(tree, "?alias@@YAXXZ,,0x00004000,5,game/d.cpp,matched,object-symbol=?real@@YAXXZ",
                     0x4000, "object-symbol=?real@@YAXXZ")
    problems = gate(tree)
    assert problems and all("0x00004000" in p for p in problems)


def test_a_replacement_alone_drops_the_retired_label_line(tree):
    # review round 2 (2026-10-13, N2): with a commit between the label row and its
    # replacement, a replacement that writes no new label must still rescan the
    # retired RVA's token and drop its line
    append_and_admit(tree, "?d_9@@YAXXZ,,0x00BF4000,9,game/z.cpp,matched,object-symbol=$L9",
                     0xBF4000, "object-symbol=$L9")
    git(tree, "add", "."); git(tree, "commit", "-qm", "c")
    led = tree / LEDGER
    led.write_bytes(led.read_bytes() + b"?p@@YAXXZ,,0x00002000,5,game/p.cpp,matched,\n")
    git(tree, "add", "."); git(tree, "commit", "-qm", "d")
    before = led.read_bytes()
    led.write_bytes(before.replace(
        b"?d_9@@YAXXZ,,0x00BF4000,9,game/z.cpp,matched,object-symbol=$L9\n",
        b"?real@@YAXXZ,,0x00BF4004,5,game/z.cpp,matched,\n"))
    add_match.admit_compiler_label_alias(tree, "", 0xBF4004, before, 0xBF4000)
    assert "0x00BF4000" not in (tree / hatch_counters.BASELINE).read_text()
