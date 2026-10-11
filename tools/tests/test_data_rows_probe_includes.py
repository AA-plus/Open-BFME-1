"""Data-row probes resolve headers the way the byte gate does (re_attempts 59857)."""
import subprocess
import sys
import types
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import data_rows  # noqa: E402


def _fake_build(tmp_path):
    sweep = tmp_path / "sweep"
    sweep.mkdir()
    return types.SimpleNamespace(_SWEEP_INCLUDE_DIRS=[sweep, tmp_path / "absent"],
                                 wine_path=lambda d: f"W:{d.name}")


def _runner(monkeypatch, outputs):
    calls = []

    def run(command, **kwargs):
        calls.append((command, kwargs["env"]))
        code, text = outputs[len(calls) - 1]
        return subprocess.CompletedProcess(command, code, text, "")
    monkeypatch.setattr(subprocess, "run", run)
    return calls


def test_missing_include_retries_with_the_sweep_dirs(monkeypatch, tmp_path):
    calls = _runner(monkeypatch, [(2, "x.cpp(7) : fatal error C1083: Cannot open include file: 'windows.h'"),
                                  (0, "")])
    proc = data_rows._run_probe(_fake_build(tmp_path), ["cl", "probe.cpp"], {"INCLUDE": "VC"})
    assert proc.returncode == 0
    assert calls[1][0] == ["cl", "probe.cpp", "-IW:sweep"]
    assert calls[1][1]["INCLUDE"] == "VC;W:sweep"


def test_other_compile_errors_are_not_retried(monkeypatch, tmp_path):
    calls = _runner(monkeypatch, [(2, "error C2065: undeclared identifier")])
    proc = data_rows._run_probe(_fake_build(tmp_path), ["cl", "probe.cpp"], {"INCLUDE": "VC"})
    assert proc.returncode == 2 and len(calls) == 1
