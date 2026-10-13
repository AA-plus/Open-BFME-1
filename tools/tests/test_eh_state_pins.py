import re
import shutil
import subprocess
import sys
from pathlib import Path

import pytest

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import build  # noqa: E402
import eh_state_pins as ep  # noqa: E402

# two temporaries in exclusive scopes share a frame slot, so their unwind
# funclets are byte-identical labels bound to different states
SOURCE = r"""
#include <windows.h>
struct S { S(); ~S(); int x; };
__declspec(noinline) S::S() : x(0) {}
__declspec(noinline) S::~S() { x = 1; }
__declspec(noinline) void use(S &s) { if (s.x == 7) throw 1; }
__declspec(noinline) void parent(int a)
{
    if (a) { S t; use(t); } else { S t; use(t); }
    if (a > 1) { S u; use(u); } else { S u; use(u); }
}
int WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int) { parent(0); return 0; }
"""


def fixture_commands(vc, out, *, windows):
    # Linux must launch the Windows tools through Wine and translate every
    # path argument; direct .exe execution only works on a Windows host.
    runner = []
    path = str
    if not windows:
        wine = shutil.which("wine")
        assert wine is not None, "wine not found: the integration fixture requires Wine"
        runner = [wine]
        path = build.wine_path
    return (
        [*runner, str(vc / "bin" / "cl.exe"), "/nologo", "/c", "/MD", "/O2", "/EHsc", "/Gy",
         f"/I{path(vc / 'include')}", f"/I{path(vc / 'PlatformSDK' / 'Include')}",
         f"/Fo{path(out / 't.obj')}", path(out / "t.cpp")],
        [*runner, str(vc / "bin" / "link.exe"), "/NOLOGO", "/NODEFAULTLIB", "/INCREMENTAL:NO",
         "/SUBSYSTEM:WINDOWS", "/SAFESEH:NO", f"/MAP:{path(out / 't.map')}",
         f"/OUT:{path(out / 't.exe')}", path(out / "t.obj"),
         path(vc / "lib" / "msvcrt.lib"), path(vc / "lib" / "kernel32.lib")]
    )


@pytest.fixture(scope="module")
def linked(tmp_path_factory):
    try:
        root = build.vc71_root()
    except SystemExit:
        pytest.skip("VC 7.1 toolchain not present")
    env = build.compiler_environment(root, None)
    vc = root / "Vc7"
    out = tmp_path_factory.mktemp("ehpins")
    (out / "t.cpp").write_text(SOURCE, encoding="ascii")
    for command in fixture_commands(vc, out, windows=sys.platform == "win32"):
        proc = subprocess.run(command, capture_output=True, text=True, env=env)
        assert proc.returncode == 0, proc.stdout + proc.stderr
    text = (out / "t.map").read_text(encoding="latin-1")
    rva = int(re.search(r"\?parent@@YAXH@Z\s+([0-9a-f]{8})", text).group(1), 16) - 0x400000
    obj = ep.Obj((out / "t.obj").read_bytes())
    retail = ep.Retail(out / "t.exe")
    FIXTURE.update(obj_path=out / "t.obj", exe=out / "t.exe", parent_rva=rva)
    return obj, ep.tables(obj, {"?parent@@YAXH@Z": rva}, retail)


# paths of the compiled fixture, for tests that drive main()/--fix end to end
FIXTURE = {}


def row(address):
    return {"target_rva": f"0x{address:08X}"}


def test_tables_agree_on_every_to_state(linked):
    obj, tables = linked
    assert len(tables) == 1
    t = tables[0]
    assert t["theirs"] and [x for x, _ in t["ours"]] == [x for x, _ in t["theirs"]]


def test_the_state_label_is_proven_and_its_twin_is_wrong(linked):
    obj, tables = linked
    ours, theirs = tables[0]["ours"], tables[0]["theirs"]
    twins_seen = 0
    for state, ((_, label), (_, address)) in enumerate(zip(ours, theirs)):
        if label is None:
            continue
        good = ep.judge(obj, tables, row(address), label)
        assert good["verdict"] == "proven", good
        for twin in good["twins"]:
            if any(lab == twin and a == address for (_, lab), (_, a) in zip(ours, theirs)):
                continue  # the twin is also bound to this address
            bad = ep.judge(obj, tables, row(address), twin)
            assert bad["verdict"] == "wrong" and bad["correct"] == label and bad["ambiguous"]
            twins_seen += 1
    assert twins_seen > 0, "the fixture no longer produces byte-identical funclets"


def test_an_address_no_parent_reaches_is_unprovable(linked):
    obj, tables = linked
    label = next(lab for _, lab in tables[0]["ours"] if lab)
    assert ep.judge(obj, tables, row(0x10), label)["verdict"] == "unprovable"
    assert ep.judge(obj, tables, row(0x10), "$L999999")["verdict"] == "unprovable"


def test_a_pin_the_object_no_longer_defines_is_stale_with_the_state_label(linked):
    obj, tables = linked
    ours, theirs = tables[0]["ours"], tables[0]["theirs"]
    state = next(i for i, (_, lab) in enumerate(ours) if lab)
    got = ep.judge(obj, tables, row(theirs[state][1]), "$L999999")
    assert got["verdict"] == "stale" and got["correct"] == ours[state][1] and not got["pin_defined"]


def test_label_of_reads_object_symbol_or_name():
    assert ep.label_of({"name": "?a_1@@YAXXZ", "notes": "x;object-symbol=$L4571;y"}) == "$L4571"
    assert ep.label_of({"name": "$L314", "notes": ""}) == "$L314"
    assert ep.label_of({"name": "?f@@YAXXZ", "notes": "object-symbol=_$E1"}) is None


@pytest.mark.parametrize("windows", [False, True])
def test_fixture_commands_use_host_runner_and_translate_all_paths(monkeypatch, tmp_path, windows):
    vc, out = tmp_path / "VC with spaces", tmp_path / "output with spaces"
    monkeypatch.setattr(shutil, "which", lambda name: "/usr/bin/wine" if name == "wine" else None)
    translated = []
    def wine_path(path):
        translated.append(path)
        return "Z:" + str(path)
    monkeypatch.setattr(build, "wine_path", wine_path)
    compile_cmd, link_cmd = fixture_commands(vc, out, windows=windows)
    prefix = [] if windows else ["/usr/bin/wine"]
    assert compile_cmd[:len(prefix) + 1] == prefix + [str(vc / "bin" / "cl.exe")]
    assert link_cmd[:len(prefix) + 1] == prefix + [str(vc / "bin" / "link.exe")]
    paths = [vc / "include", vc / "PlatformSDK" / "Include", out / "t.obj", out / "t.cpp",
             out / "t.map", out / "t.exe", out / "t.obj", vc / "lib" / "msvcrt.lib",
             vc / "lib" / "kernel32.lib"]
    assert translated == ([] if windows else paths)
    mapped = lambda path: str(path) if windows else "Z:" + str(path)
    assert compile_cmd[-4:] == ["/I" + mapped(paths[0]), "/I" + mapped(paths[1]),
                               "/Fo" + mapped(paths[2]), mapped(paths[3])]
    assert link_cmd[-5:] == ["/MAP:" + mapped(paths[4]), "/OUT:" + mapped(paths[5]),
                            *(mapped(path) for path in paths[6:])]


def test_fixture_requires_wine_on_non_windows(monkeypatch, tmp_path):
    monkeypatch.setattr(shutil, "which", lambda name: None)
    with pytest.raises(AssertionError, match="wine not found"):
        fixture_commands(tmp_path, tmp_path, windows=False)


def _missing_run(monkeypatch, tmp_path, argv):
    rows = [{"name": "$L100", "target_rva": "0x00100000", "source": "game/a.cpp", "notes": ""},
            {"name": "?f@@YAXXZ", "target_rva": "0x00100100", "source": "game/a.cpp", "notes": ""}]
    monkeypatch.setattr(build, "load_function_rows", lambda: rows)
    monkeypatch.setattr(build, "row_object", lambda r: tmp_path / "absent.obj")
    monkeypatch.setattr(build, "ledger_object_symbol", lambda r: r["name"])
    monkeypatch.setattr(ep, "Retail", lambda: type("R", (), {"action_index": lambda self: {}})())
    applied = []
    monkeypatch.setattr(ep, "apply_fixes", lambda fixes, model: applied.append(fixes))
    code = ep.main([*argv, "--out", str(tmp_path / "out")])
    return code, applied


def test_a_missing_object_fails_and_names_the_source_to_build(monkeypatch, tmp_path, capsys):
    code, _ = _missing_run(monkeypatch, tmp_path, [])
    out = capsys.readouterr().out
    assert code == 2
    assert "./build.sh game/a.cpp" in out


def test_fix_writes_nothing_while_an_object_is_missing(monkeypatch, tmp_path, capsys):
    code, applied = _missing_run(monkeypatch, tmp_path, ["--fix", "--model", "m"])
    assert code == 2 and applied == []
    assert "--fix refused" in capsys.readouterr().out


def test_a_byte_twin_told_apart_by_state_index_counts_as_unique(linked):
    # the unwind map names the action at each state index and the native
    # compile emits the $L for that same index: that proof makes a twin unique
    obj, tables = linked
    ours, theirs = tables[0]["ours"], tables[0]["theirs"]
    proven = 0
    for (_, label), (_, address) in zip(ours, theirs):
        if label is None:
            continue
        got = ep.judge(obj, tables, row(address), label)
        if not got["twins"]:
            continue
        assert got["verdict"] == "proven" and got["unique"] and got["twin_proof"] == "state-index"
        assert ep.kind_of(got) == "twin-proven"
        stale = ep.judge(obj, tables, row(address), "$L999999")
        assert stale["verdict"] == "stale" and stale["unique"] and stale["correct"] == label
        proven += 1
    assert proven > 0, "the fixture no longer produces byte-identical funclets"


def test_a_byte_twin_no_state_proves_stays_ambiguous(linked):
    obj, tables = linked
    ours, theirs = tables[0]["ours"], tables[0]["theirs"]
    label = next(lab for (_, lab), (_, a) in zip(ours, theirs)
                 if lab and ep.judge(obj, tables, row(a), lab)["twins"])
    got = ep.judge(obj, tables, row(0x10), label)
    assert got["verdict"] == "unprovable" and got["ambiguous"] and not got["unique"]
    assert ep.kind_of(got) == "ambiguous"


def test_kind_of_columns():
    assert ep.kind_of({"ambiguous": None}) == "unknown"
    assert ep.kind_of({"verdict": "proven", "ambiguous": False, "unique": True}) == "unique"
    assert ep.kind_of({"verdict": "proven", "ambiguous": True, "unique": True}) == "twin-proven"
    assert ep.kind_of({"verdict": "unprovable", "ambiguous": True, "unique": False}) == "ambiguous"
    assert ep.kind_of({"verdict": "unprovable", "ambiguous": False, "unique": False}) == "unanchored"
    assert ep.kind_of({"verdict": "split", "ambiguous": False, "unique": False}) == "split"
    assert ep.kind_of({"verdict": "split", "ambiguous": True, "unique": False}) == "split"


class FakeObj:
    """judge() reads only `defined` and `signature`."""

    def __init__(self, sigs):
        self.defined = {name: [{}] for name in sigs}
        self.sigs = sigs

    def signature(self, name):
        return self.sigs[name]


F = 0x1000


def test_split_without_twins_is_split_and_never_unique():
    obj = FakeObj({"$L1": b"a", "$L2": b"b"})
    tables = [{"parent": "P", "ours": [(-1, "$L1"), (0, "$L2")], "theirs": [(-1, F), (0, F)]}]
    got = ep.judge(obj, tables, row(F), "$L1")
    assert got["verdict"] == "split" and not got["twins"]
    assert got["unique"] is False and ep.kind_of(got) == "split"


def test_an_unprovable_pin_whose_label_is_gone_is_never_unique(linked):
    obj, tables = linked
    got = ep.judge(obj, tables, row(0x10), "$L999999")
    assert got["verdict"] == "unprovable" and got["twins"] == []
    assert got["unique"] is False and ep.kind_of(got) == "unanchored"


def test_a_state_without_an_object_action_never_proposes_none():
    obj = FakeObj({"$L1": b"a"})
    alone = [{"parent": "P", "ours": [(-1, None)], "theirs": [(-1, F)]}]
    got = ep.judge(obj, alone, row(F), "$L1")
    assert got["verdict"] == "unprovable" and got.get("correct") is None
    gone = ep.judge(obj, alone, row(F), "$L7")
    assert gone["verdict"] == "unprovable" and gone.get("correct") is None
    mixed = [{"parent": "P", "ours": [(-1, None), (0, "$L1")], "theirs": [(-1, F), (0, F)]}]
    assert ep.judge(obj, mixed, row(F), "$L1")["verdict"] == "proven"
    stale = ep.judge(obj, mixed, row(F), "$L7")
    assert stale["verdict"] == "stale" and stale["correct"] == "$L1"


def test_a_differing_parent_leaves_a_twin_unproven():
    obj = FakeObj({"$L1": b"a", "$L2": b"a"})
    tables = [{"parent": "P", "ours": [(-1, "$L1")], "theirs": [(-1, F)]},
              {"parent": "Q", "ours": [(-1, "$L2"), (0, "$L9")], "theirs": [(-1, F)]}]
    got = ep.judge(obj, tables, row(F), "$L1")
    assert got["verdict"] == "proven" and got["unique"] is False and ep.kind_of(got) == "ambiguous"


def _judged_main(monkeypatch, tmp_path, verdicts, argv):
    """main() over rows whose verdicts are fixed, recording what --fix gets."""
    rows = [{"name": f"uw_{i}", "target_rva": f"0x{0x100 + i:08X}", "source": "game/a.cpp",
             "notes": f"gen-funclet;object-symbol=$L{i}"} for i in range(len(verdicts))]
    obj_path = tmp_path / "a.obj"
    obj_path.write_bytes(b"")
    monkeypatch.setattr(build, "load_function_rows", lambda: rows)
    monkeypatch.setattr(build, "row_object", lambda r: obj_path)
    monkeypatch.setattr(build, "ledger_object_symbol", lambda r: r["name"])
    monkeypatch.setattr(ep, "Obj", lambda data: object())
    monkeypatch.setattr(ep, "tables", lambda obj, local, retail: [])
    monkeypatch.setattr(ep, "Retail", lambda: type("R", (), {"action_index": lambda self: {}})())
    by_rva = {int(r["target_rva"], 16): v for r, v in zip(rows, verdicts)}
    monkeypatch.setattr(ep, "judge", lambda obj, t, r, label: dict(by_rva[int(r["target_rva"], 16)]))
    applied = []
    monkeypatch.setattr(ep, "apply_fixes", lambda fixes, model: applied.append(dict(fixes)))
    code = ep.main([*argv, "--out", str(tmp_path / "out")])
    return code, applied


def test_fix_takes_only_unique_wrong_or_stale_rows(monkeypatch, tmp_path):
    common = {"parents": [], "twins": ["$L99"], "ambiguous": True, "pin_defined": True}
    verdicts = [
        {**common, "verdict": "wrong", "correct": "$L50", "unique": True},
        {**common, "verdict": "stale", "correct": "$L51", "unique": False},
        {**common, "verdict": "split", "labels": ["$L52", "$L53"], "unique": False},
        {**common, "verdict": "unprovable", "why": "x", "unique": True},
        {**common, "verdict": "wrong", "correct": None, "unique": True},
    ]
    code, applied = _judged_main(monkeypatch, tmp_path, verdicts, ["--fix", "--model", "m"])
    assert code == 1
    assert applied == [{("uw_0", 0x100): ("$L0", "$L50", "")}]


def test_fix_repoints_a_wrong_mapping_end_to_end(linked, monkeypatch, tmp_path):
    """A 'retail' whose unwind map swaps two states' actions disagrees with the
    object, so the pin at one state's address is wrong; --fix rewrites the
    ledger row's object-symbol to the label retail's state names."""
    obj, tables = linked
    ours = tables[0]["ours"]
    real = ep.Retail(FIXTURE["exe"])
    theirs = real.unwind(FIXTURE["parent_rva"], ep.Obj(FIXTURE["obj_path"].read_bytes())
                         .handler_of(obj.defined["?parent@@YAXH@Z"][0])[0][0])
    # two states with distinct labels whose sole retail actions we swap
    states = [i for i, (_, lab) in enumerate(ours) if lab
              and sum(1 for _, a in theirs if a == theirs[i][1]) == 1]
    i, j = next((a, b) for a in states for b in states
                if a < b and ours[a][1] != ours[b][1] and theirs[a][1] != theirs[b][1])
    swapped = list(theirs)
    swapped[i], swapped[j] = (theirs[i][0], theirs[j][1]), (theirs[j][0], theirs[i][1])

    class Swapped(ep.Retail):
        def __init__(self):
            super().__init__(FIXTURE["exe"])

        def unwind(self, parent_rva, offset):
            return swapped

    address, pinned, want = theirs[i][1], ours[i][1], ours[j][1]
    ledger = tmp_path / "functions.csv"
    header = "name,alias,target_rva,target_size,source,status,notes\r\n"
    funclet = (f"uw_x,,0x{address:08X},4,game/t.cpp,matched,"
               f"gen-funclet;parent=?parent@@YAXH@Z;object-symbol={pinned}\r\n")
    parent = f"?parent@@YAXH@Z,,0x{FIXTURE['parent_rva']:08X},16,game/t.cpp,matched,\r\n"
    ledger.write_bytes((header + funclet + parent).encode())
    rows = [{"name": "uw_x", "target_rva": f"0x{address:08X}", "source": "game/t.cpp",
             "notes": f"gen-funclet;parent=?parent@@YAXH@Z;object-symbol={pinned}"},
            {"name": "?parent@@YAXH@Z", "target_rva": f"0x{FIXTURE['parent_rva']:08X}",
             "source": "game/t.cpp", "notes": ""}]
    monkeypatch.setattr(build, "FUNCTIONS", ledger)
    monkeypatch.setattr(build, "load_function_rows", lambda: rows)
    monkeypatch.setattr(build, "row_object", lambda r: FIXTURE["obj_path"])
    monkeypatch.setattr(build, "ledger_object_symbol", lambda r: r["name"])
    monkeypatch.setattr(ep, "Retail", Swapped)
    built = []
    monkeypatch.setattr(ep.subprocess, "run", lambda cmd, **kw: built.append(cmd) or
                        subprocess.CompletedProcess(cmd, 0, "", ""))
    import gate_writers
    monkeypatch.setattr(gate_writers, "stamp", lambda *a: None)
    code = ep.main(["--fix", "--model", "m", "--out", str(tmp_path / "out")])
    assert code == 1
    text = ledger.read_bytes().decode()
    assert f"object-symbol={want};eh-state-pin {pinned}->{want}" in text
    assert f"object-symbol={pinned};" not in text.split("\r\n")[1]
    assert text.split("\r\n")[2] == parent.rstrip("\r\n")
    assert built and "game/t.cpp" in built[0]


def test_fix_restores_the_ledger_when_byte_verify_fails(monkeypatch, tmp_path):
    """owner verdict 2026-10-13 (adversarial review round 2: test gaps): a
    failed build.py verify leaves functions.csv byte-identical to before."""
    ledger = tmp_path / "functions.csv"
    raw = (b"name,alias,target_rva,target_size,source,status,notes\r\n"
           b"uw_x,,0x00000100,4,game/t.cpp,matched,gen-funclet;object-symbol=$L1\r\n")
    ledger.write_bytes(raw)
    monkeypatch.setattr(build, "FUNCTIONS", ledger)
    monkeypatch.setattr(ep.subprocess, "run", lambda cmd, **kw: subprocess.CompletedProcess(cmd, 1, "bad", ""))
    with pytest.raises(SystemExit, match="ledger restored"):
        ep.apply_fixes({("uw_x", 0x100): ("$L1", "$L2", "0")}, "m")
    assert ledger.read_bytes() == raw
