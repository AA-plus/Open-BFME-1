"""Staged claims refuse new unclaimed definitions, not debt already at HEAD."""

import csv
import subprocess
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[1]))
import find_declared_unmatched as claims  # noqa: E402

SOURCE = "game/GameEngine/Source/Common/RatchetOwner.cpp"


def _git(root, *args):
    subprocess.run(["git", "-c", "user.name=t", "-c", "user.email=t@t", *args],
                   cwd=root, check=True, capture_output=True)


def _write(root, body, ledger_rows):
    ledger = root / "targets/game/reverse/functions.csv"
    ledger.parent.mkdir(parents=True, exist_ok=True)
    with ledger.open("w", newline="") as handle:
        writer = csv.writer(handle)
        writer.writerow(["name", "export_rva", "target_rva", "target_size",
                         "source", "status", "notes"])
        writer.writerows([[name, "", "0x00123400", "12", SOURCE, "matched", ""]
                          for name in ledger_rows])
    source = root / SOURCE
    source.parent.mkdir(parents=True, exist_ok=True)
    source.write_text(body, encoding="utf-8")
    _git(root, "add", "targets/game/reverse/functions.csv", SOURCE)


def _run(root, monkeypatch, capsys):
    monkeypatch.setattr(claims, "ROOT", root)
    monkeypatch.setattr(claims, "FUNCTIONS_CSV", root / "targets/game/reverse/functions.csv")
    monkeypatch.setattr(claims, "CLAIMS_WHITELIST", root / "none.txt")
    monkeypatch.setattr(sys, "argv", ["find_declared_unmatched.py", "--fail", "--staged", SOURCE])
    try:
        claims.main()
    except SystemExit as exc:
        return exc.code, capsys.readouterr().out
    return 0, capsys.readouterr().out


BASE = ("void RatchetOwner::kept() {}\n"
        "void RatchetOwner::inherited() {}\n"
        "void RatchetOwner::wrongCopy() {}\n")
ROWS = ["?kept@RatchetOwner@@QAEXXZ"]


def _head(tmp_path):
    _git(tmp_path, "init", "-q")
    _write(tmp_path, BASE, ROWS)
    _git(tmp_path, "commit", "-q", "-m", "base")


def test_removing_one_unclaimed_definition_is_not_blamed_for_another(tmp_path, monkeypatch, capsys):
    _head(tmp_path)
    _write(tmp_path, BASE.replace("void RatchetOwner::wrongCopy() {}\n", ""), ROWS)
    code, output = _run(tmp_path, monkeypatch, capsys)
    assert code == 0, output
    assert "already present at HEAD" in output


def test_a_new_unclaimed_definition_is_still_refused(tmp_path, monkeypatch, capsys):
    _head(tmp_path)
    _write(tmp_path, BASE + "void RatchetOwner::added() {}\n", ROWS)
    code, output = _run(tmp_path, monkeypatch, capsys)
    assert code == 1
    assert "RatchetOwner::added" in output and "RatchetOwner::inherited" not in output


def test_retiring_a_row_exposes_its_definition(tmp_path, monkeypatch, capsys):
    _head(tmp_path)
    _write(tmp_path, BASE, ROWS + ["?inherited@RatchetOwner@@QAEXXZ"])
    _git(tmp_path, "commit", "-q", "-m", "claim")
    _write(tmp_path, BASE, ROWS)
    code, output = _run(tmp_path, monkeypatch, capsys)
    assert code == 1
    assert "RatchetOwner::inherited" in output
