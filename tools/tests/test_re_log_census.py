#!/usr/bin/env python3
"""A link-lane verdict names the census it was judged against (re_log census=):
the census of the index link_check judged that row's file with, never merely
the newest one or the last index loaded in the checkout."""
import json
import sys
from pathlib import Path

import pytest

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "tools"))

import re_log  # noqa: E402  (path insert must precede the import)

JUDGED = "7d308168db"


@pytest.fixture
def log(tmp_path, monkeypatch):
    path = tmp_path / "targets/game/reverse" / "re_attempts.log"
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text("", encoding="utf-8")
    receipts = tmp_path / "build/link_census/evaluated"
    receipts.mkdir(parents=True)
    for name, source in (("?find@Owner@@QBEXXZ", "game/A.cpp"), ("?other@Owner@@QBEXXZ", "game/B.cpp")):
        (receipts / f"0x009ca040-{name.strip('?@')[:8]}.json").write_text(
            json.dumps({"census": JUDGED if source == "game/A.cpp" else "5f10bce6ba", "name": name,
                        "source": source}), encoding="utf-8")
    # the newest census is another one: the tag must not come from it
    (path.parent / "link_census_history.csv").write_text("date,commit\n2026-10-10 14:00,5f10bce6ba\n",
                                                          encoding="utf-8")
    monkeypatch.setattr(re_log, "RE_ATTEMPTS", path)
    monkeypatch.setattr(re_log, "EVALUATED", receipts)
    monkeypatch.setenv("BFME_MODEL", "test-model")
    monkeypatch.delenv("BFME_RUN_ID", raising=False)
    re_log._reset()
    try:
        yield path
    finally:
        re_log._reset()


def record(log, status, evidence, rva="0x009CA040"):
    re_log._record(["?find@Owner@@QBEXXZ", rva, "21", status, evidence])
    return log.read_text(encoding="utf-8").splitlines()[-1].split("\t")[4]


def test_a_link_lane_deferral_carries_the_census_its_row_was_judged_at(log):
    evidence = record(log, "blocked", "false-reject link_check: selected _M_find not retail; LINKED0->0 t=4")
    assert evidence.endswith(f"census={JUDGED} census-source=game/A.cpp")
    assert re_log.census_of(evidence) == JUDGED and re_log.census_source_of(evidence) == "game/A.cpp"
    assert re_log.census_of(record(log, "blocked", "caller stays LINKED 0 -> 0 blocker=stl/x")) == JUDGED
    assert re_log.census_of(record(log, "refuted", "the respelling targets another body")) == JUDGED


def test_a_row_no_check_judged_carries_no_census(log):
    assert "census=" not in record(log, "blocked", "link_check wrong_selected t=2", rva="0x009CA050")


def test_a_row_judged_in_two_files_carries_no_census(log):
    receipts = re_log.EVALUATED
    (receipts / "0x009ca040-twin.json").write_text(
        json.dumps({"census": "5f10bce6ba", "name": "?find@Owner@@QBEXXZ", "source": "game/Moved.cpp"}),
        encoding="utf-8")
    assert "census=" not in record(log, "blocked", "link_check wrong_selected t=2")


def test_other_verdicts_carry_no_census(log):
    assert "census=" not in record(log, "landed", "link_check LINKS 0 -> 334")       # a resolution
    assert "census=" not in record(log, "blocked", "regalloc wall blocker=regalloc t=40")  # byte lane
    assert "census=" not in record(log, "blocked", "the linked list walk differs blocker=layout t=30")


def test_an_explicit_census_is_kept_in_any_case(log):
    assert re_log.census_of(record(log, "blocked", "link_check census=5f10bce6ba t=2")) == "5f10bce6ba"
    evidence = record(log, "blocked", "link_check census=7D308168DB t=2")
    assert evidence.count("census=") == 1 and re_log.census_of(evidence) == "7d308168db"


def test_the_tagged_census_is_read_back_from_the_latest_record(log):
    record(log, "blocked", "link_check wrong_selected t=2")
    fields = re_log.latest_records(log)[0x009CA040]
    assert fields[3] == "blocked" and re_log.census_of(fields[4]) == JUDGED
