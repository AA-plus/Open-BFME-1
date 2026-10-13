"""row_extent refuses new rows that start mid-body or swallow int3 padding.

Fixtures are the retail image and Ghidra inventory, as the two retired MASM
rows were in HEAD before fdd547e52f and d7c355102d.
"""
import sys
from pathlib import Path

import pytest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import row_extent

ROOT = Path(__file__).resolve().parents[2]
GHIDRA = ROOT / "targets/game/reverse/ghidra_functions.csv"


@pytest.fixture(scope="module")
def env():
    import build
    try:
        build.read_target_bytes(0x1000, 1)
    except Exception as error:  # the retail image is a per-host input
        pytest.skip(f"retail image unavailable: {error}")
    return row_extent.load_ghidra(GHIDRA), build.read_target_bytes


def row(name, rva, size, notes="", status="matched"):
    return {"name": name, "rva": rva, "size": size, "notes": notes,
            "status": status, "source": "game/x.asm"}


def refusals(env, new):
    sizes, read = env
    return row_extent.check([], [new], sizes, read)


def test_handle_request_join_refused(env):
    found = refusals(env, row("?handleRequestJoin@LANAPI@@IAEXPAULANMessage@@I@Z",
                              0x005A565D, 1119))
    assert len(found) == 1
    assert "starts inside Ghidra function 0x005A5650/118" in found[0]


def test_generate_particle_info_refused(env):
    found = refusals(env, row("?generateParticleInfo@ParticleSystem@@IAEPBVParticleInfo@@HH@Z",
                              0x006008AF, 1257))
    assert len(found) == 1
    assert "starts inside Ghidra function 0x00600890/46" in found[0]


def test_span_over_padding_refused_even_at_a_real_start(env):
    # 0x005A5650 is a real start; 1119 B runs over padding into 0x005A56F0.
    found = refusals(env, row("?x@@YAXXZ", 0x005A5650, 0x5A56F0 - 0x5A5650 + 16))
    assert len(found) == 1 and "int3 padding" in found[0]
    assert "0x005A56F0" in found[0]


def test_boundary_aligned_rows_pass(env):
    for rva, size in [(0x005A5650, 118), (0x005A56F0, 481), (0x00600890, 46),
                      (0x006008D0, 178)]:
        assert refusals(env, row("?ok@@YAXXZ", rva, size)) == []


def test_start_inside_matched_row_refused(env):
    sizes, read = env
    host = row("?host@@YAXXZ", 0x005A56F0, 481)
    found = row_extent.check([host], [host, row("?mid@@YAXXZ", 0x005A5700, 16)],
                             {}, read)
    assert len(found) == 1 and "matched row ?host@@YAXXZ" in found[0]


def test_funclet_and_thunk_exempt(env):
    assert refusals(env, row("?mid@@YAXXZ", 0x005A565D, 1119,
                             notes="parent=?x@@YAXXZ")) == []
    assert refusals(env, row("?mid@@YAXXZ", 0x005A565D, 1119,
                             notes="object-symbol=$L1")) == []
    assert refusals(env, row("?j_00001005@@YAXXZ", 0x1005, 5)) == []


def test_existing_rows_not_rejudged(env):
    sizes, read = env
    bad = row("?handleRequestJoin@LANAPI@@IAEXPAULANMessage@@I@Z", 0x005A565D, 1119)
    assert row_extent.check([bad], [bad], sizes, read) == []


def test_moved_row_is_judged(env):
    sizes, read = env
    before = row("?x@@YAXXZ", 0x005A5650, 118)
    after = row("?x@@YAXXZ", 0x005A565D, 1119)
    assert len(row_extent.check([before], [after], sizes, read)) == 1


# Adversarial review round 1 (RE-1..RE-6).

def test_re1_notes_substrings_do_not_exempt(env):
    for notes in ("see grandparent=none", "object-symbol=whatever",
                  "object-symbol=?probe@@YAXXZ"):
        assert len(refusals(env, row("?probe@@YAXXZ", 0x005A565D, 1119, notes=notes))) == 1


def test_re1_compiler_label_object_symbol_exempt(env):
    assert refusals(env, row("?probe@@YAXXZ", 0x005A565D, 1119,
                             notes="object-symbol=$L1234")) == []


def test_re2_only_real_ilt_thunks_exempt(env):
    assert len(refusals(env, row("?j_probe@@YAXXZ", 0x005A565D, 1119))) == 1
    assert len(refusals(env, row("?j_005A5650@@YAXXZ", 0x005A5650,
                                 0x5A56F0 - 0x5A5650 + 16))) == 1
    sizes, read = env
    assert read(0x1005, 1) == b"\xe9"
    assert refusals(env, row("?j_00001005@@YAXXZ", 0x1005, 5)) == []


def test_re3_status_or_note_flip_is_rejudged(env):
    sizes, read = env
    parked = row("?probe@@YAXXZ", 0x005A565D, 1119, notes="parent=?x@@YAXXZ",
                 status="unmatched")
    live = row("?probe@@YAXXZ", 0x005A565D, 1119)
    assert row_extent.check([], [parked], sizes, read) == []
    assert len(row_extent.check([parked], [live], sizes, read)) == 1


def test_re4_split_after_internal_ret_refused(env):
    # 0x0005B7F0 follows an internal ret inside Ghidra 0x0005B7A0/87.
    found = refusals(env, row("?tail@@YAXXZ", 0x0005B7F0, 7))
    assert len(found) == 1 and "0x0005B7A0" in found[0]
    # A C3 byte that is an operand (mov al, bl) is no boundary either.
    assert len(refusals(env, row("?mid@@YAXXZ", 0x00232265, 11))) == 1


def test_re5_catch_funclet_merged_by_ghidra_passes(env):
    # mov eax, <continuation in 0x00718B70>; ret
    assert refusals(env, row("?Rva00718D05CatchForward@@YAPAXXZ", 0x00718D05, 17)) == []


def test_re6_unmapped_rva_refused_not_crash(env):
    found = refusals(env, row("?probe@@YAXXZ", 0x02000000, 16))
    assert len(found) == 1 and "cannot read the retail image" in found[0]


def test_re6_missing_image_refused_not_crash():
    def read(rva, count):
        raise FileNotFoundError("no exe")
    found = row_extent.check([], [row("?probe@@YAXXZ", 0x005A5650, 118)], {}, read)
    assert len(found) == 1 and "no exe" in found[0]


def test_span_over_matched_row_refused(env):
    sizes, read = env
    host = row("?next@@YAXXZ", 0x005A56F0, 481)
    found = row_extent.check([host], [host, row("?wide@@YAXXZ", 0x005A5650, 0xA4)],
                             {}, read)
    assert len(found) == 1 and "0x005A56F0" in found[0]
