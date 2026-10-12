"""A diff that re-shows existing __emit lines as -/+ pairs is not a lift."""
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import conversion_gate as gate

PATH = "game/GameEngineDevice/Source/W3DDevice/GameClient/W3DBridgeBuffer.cpp"
HEAD = ["--- a/" + PATH, "+++ b/" + PATH]


def test_reshown_emit_lines_cancel():
    # re_attempts 0x006D88A0: removing ~W3DBridge re-showed existing __emit lines.
    lines = HEAD + [
        "-W3DBridge::~W3DBridge() {}",
        "-        __emit 0x8B __emit 0x44",
        "-        __emit 0xC3",
        "+        __emit 0x8B __emit 0x44",
        "+        __emit 0xC3",
    ]
    assert gate.added_lift_lines("o", "n", lines) == []


def test_new_emit_still_refused():
    lines = HEAD + [
        "-        __emit 0xC3",
        "+        __emit 0xC3",
        "+        __emit 0x90",
    ]
    failures = gate.added_lift_lines("o", "n", lines)
    assert len(failures) == 1 and "0x90" in failures[0][1]


def test_reshown_emit_in_other_file_does_not_cancel():
    lines = ["--- a/game/A.cpp", "+++ b/game/A.cpp", "-        __emit 0xC3",
             "--- a/game/B.cpp", "+++ b/game/B.cpp", "+        __emit 0xC3"]
    assert len(gate.added_lift_lines("o", "n", lines)) == 1


if __name__ == "__main__":
    for name, fn in list(globals().items()):
        if name.startswith("test_"):
            fn()
    print("ok")
