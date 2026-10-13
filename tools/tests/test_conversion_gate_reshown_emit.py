"""Rule A: an __emit line re-shown inside its own function is not a new lift,
but emitted bytes never move between functions or files (function-scoped;
approved by the project lead 2026-10-12)."""
import os
import subprocess
import sys
import tempfile
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import conversion_gate as gate  # noqa: E402

W3D = "game/GameEngineDevice/Source/W3DDevice/GameClient/W3DBridgeBuffer.cpp"


def _gate(before, after):
    """Run Rule A on a staged change: before/after map path -> text (None = absent)."""
    with tempfile.TemporaryDirectory() as tmp:
        git = lambda *a: subprocess.run(["git", "-C", tmp, *a], check=True,
                                        capture_output=True, text=True).stdout
        git("init", "-q")

        def write(files):
            for path, text in files.items():
                full = Path(tmp) / path
                if text is None:
                    if full.exists():
                        full.unlink()
                    continue
                full.parent.mkdir(parents=True, exist_ok=True)
                full.write_text(text)
        write(before)
        git("add", "-A")
        git("-c", "user.name=t", "-c", "user.email=t@t", "commit", "-qm", "base", "--allow-empty")
        write(after)
        git("add", "-A")
        here = os.getcwd()
        os.chdir(tmp)
        try:
            return gate.added_lift_lines("HEAD", ":")
        finally:
            os.chdir(here)


LOAD = ("__declspec(naked) Bool W3DBridge::load(enum BodyDamageType s)\n{\n\t__asm {\n"
        "\t__emit 0x6a;\n\t__emit 0xff;\n\t__emit 0xc3;\n\t}\n}\n")
DTOR = "W3DBridge::~W3DBridge(void)\n{\n\tclearBridge();\n}\n\n"


def test_reshown_emit_in_same_function_passes():
    # re_attempts 0x006D88A0: deleting ~W3DBridge re-shows load()'s __emit lines
    # when git aligns the hunk differently; simulate by also reformatting them.
    before = {W3D: DTOR + LOAD}
    after = {W3D: LOAD.replace("\t__emit 0x6a;\n\t__emit 0xff;", "\t__emit 0x6a; __emit 0xff;")}
    assert _gate(before, after) == []


def test_new_emit_fails():
    before = {W3D: LOAD}
    after = {W3D: LOAD.replace("__emit 0xc3;", "__emit 0x90;\n\t__emit 0xc3;")}
    assert len(_gate(before, after)) == 1


def test_new_function_with_emit_fails():
    before = {"game/a.cpp": "void Clean() { }\n"}
    after = {"game/a.cpp": "void Clean() { }\n__declspec(naked) void Dump() { __asm { __emit 0xc3 } }\n"}
    assert len(_gate(before, after)) == 1


def test_cross_file_move_fails():
    dump = "__declspec(naked) void Dump() {\n __asm {\n  __emit 0xc3\n }\n}\n"
    before = {"game/a.cpp": dump, "game/b.cpp": "void Dump2()\n{\n __asm {\n }\n}\n"}
    after = {"game/a.cpp": None, "game/b.cpp": "void Dump2()\n{\n __asm {\n  __emit 0xc3\n }\n}\n"}
    assert len(_gate(before, after)) == 1


def test_emit_cannot_move_between_functions_in_same_file():
    before = {"game/a.cpp": ("__declspec(naked) void ExistingDump()\n{\n __asm {\n  __emit 0x90\n  __emit 0xc3\n }\n}\n"
                             "void CleanFunction()\n{\n int x = 0;\n}\n")}
    after = {"game/a.cpp": ("__declspec(naked) void ExistingDump()\n{\n __asm {\n  __emit 0xc3\n }\n}\n"
                            "void CleanFunction()\n{\n int x = 0;\n __asm { __emit 0x90 }\n}\n")}
    assert len(_gate(before, after)) == 1


def test_deleted_function_frees_nothing():
    before = {"game/a.cpp": "void A()\n{\n __asm { __emit 0x90 }\n}\nvoid B()\n{\n}\n"}
    after = {"game/a.cpp": "void B()\n{\n __asm { __emit 0x90 }\n}\n"}
    assert len(_gate(before, after)) == 1


if __name__ == "__main__":
    for name, fn in list(globals().items()):
        if name.startswith("test_"):
            fn()
    print("ok")
