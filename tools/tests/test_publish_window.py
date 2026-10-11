"""The cooperative publish window, reusable gate evidence, and multi-commit
landing units (linking_plan.md workstream G; header-wide landings)."""
import json
import os
import shutil
import stat
import subprocess
import sys
from pathlib import Path

import pytest

TOOLS = Path(__file__).resolve().parents[1]
REPO = TOOLS.parent
sys.path.insert(0, str(TOOLS))
sys.path.insert(0, str(TOOLS / "tests"))

import gate_evidence  # noqa: E402
import publish_window as pw  # noqa: E402
from test_landing_service import world, git, origin_files  # noqa: E402,F401


def _git(cwd, *args):
    return subprocess.run(["git", *args], cwd=cwd, check=True, capture_output=True,
                          text=True).stdout.strip()


@pytest.fixture
def clones(tmp_path, monkeypatch):
    monkeypatch.delenv(pw.TOKEN_ENV, raising=False)
    origin = tmp_path / "origin.git"
    _git(tmp_path, "init", "-q", "--bare", str(origin))
    out = {}
    for name in ("service", "seat"):
        clone = tmp_path / name
        _git(tmp_path, "init", "-q", str(clone))
        _git(clone, "remote", "add", "origin", str(origin))
        _git(clone, "config", "user.name", name)
        _git(clone, "config", "user.email", f"{name}@example.com")
        _git(clone, "config", "core.hooksPath", "no-hooks")
        assert Path(_git(clone, "remote", "get-url", "origin")) == origin   # never the real origin
        out[name] = clone
    out["origin"] = origin
    return out


def test_one_holder_at_a_time_and_its_own_pushes_pass(clones, monkeypatch):
    token = pw.open_window(30, purpose="header stack", owner="svc", root=clones["service"])
    with pytest.raises(pw.WindowHeld):
        pw.open_window(30, owner="rival", root=clones["seat"])
    allowed, why = pw.check(root=clones["seat"])
    assert not allowed and "svc" in why and "header stack" in why
    monkeypatch.setenv(pw.TOKEN_ENV, token)
    assert pw.check(root=clones["seat"])[0]
    monkeypatch.delenv(pw.TOKEN_ENV)
    assert not pw.close_window("not-the-token", root=clones["seat"])
    assert pw.close_window(token, root=clones["service"])
    assert pw.check(root=clones["seat"]) == (True, "")


def test_an_expired_window_is_taken_over_and_blocks_nothing(clones):
    pw.open_window(-1, owner="crashed", root=clones["service"])
    assert pw.check(root=clones["seat"]) == (True, "")
    token = pw.open_window(30, owner="next", root=clones["seat"])
    assert pw.read(root=clones["service"])[1]["nonce"] == token


def test_an_unreachable_origin_does_not_block_pushes(clones):
    _git(clones["seat"], "remote", "set-url", "origin", str(clones["origin"].parent / "gone.git"))
    allowed, why = pw.check(root=clones["seat"])
    assert allowed and "not checking" in why


def test_the_pre_push_hook_refuses_master_while_someone_else_holds_the_window(clones, monkeypatch):
    seat = clones["seat"]
    (seat / "tools").mkdir()
    shutil.copy(TOOLS / "publish_window.py", seat / "tools" / "publish_window.py")
    # the hook's ledger and spelling guards run before the window check; this seat has no ledgers
    (seat / "tools" / "ledger_guard.py").write_text("raise SystemExit(0)\n")
    (seat / "tools" / "check_case_collisions.py").write_text("raise SystemExit(0)\n")
    token = pw.open_window(30, purpose="header stack", owner="svc", root=clones["service"])
    hook = REPO / ".githooks" / "pre-push"
    line = "refs/heads/master " + "1" * 40 + " refs/heads/master " + "0" * 40 + "\n"

    def run(env_token=None):
        env = {k: v for k, v in os.environ.items() if k != pw.TOKEN_ENV}
        if env_token:
            env[pw.TOKEN_ENV] = env_token
        return subprocess.run(["bash", str(hook), "origin", str(clones["origin"])], cwd=seat,
                              env=env, input=line, capture_output=True, text=True)
    blocked = run()
    assert blocked.returncode != 0 and "publish window" in blocked.stderr
    held = run(token)               # the holder gets past the window (and fails later, on the fake sha)
    assert "publish window held" not in held.stderr and "unavailable" in held.stderr
    other_ref = subprocess.run(["bash", str(hook), "origin", "x"], cwd=seat, input=line.replace(
        "refs/heads/master", "refs/heads/topic"), capture_output=True, text=True)
    assert "publish window" not in other_ref.stderr
    window_ref = subprocess.run(["bash", str(hook), "origin", "x"], cwd=seat, input=line.replace(
        "refs/heads/master", pw.REF), capture_output=True, text=True)
    assert window_ref.returncode == 0          # the lock marker itself is not gated


def test_gate_evidence_is_opt_in_exact_tree_and_full_covers_scoped(clones, monkeypatch):
    seat = clones["seat"]
    (seat / "a.txt").write_text("a\n")
    _git(seat, "add", "a.txt")
    _git(seat, "commit", "-q", "-m", "a")
    first = _git(seat, "rev-parse", "HEAD")
    gate_evidence.record(first, "full", root=seat)
    monkeypatch.delenv(gate_evidence.ENABLE, raising=False)
    assert not gate_evidence.reusable(first, "full", root=seat)[0]          # opt-in only
    monkeypatch.setenv(gate_evidence.ENABLE, "1")
    assert gate_evidence.reusable(first, "full", root=seat)[0]
    assert gate_evidence.reusable(first, "scoped", root=seat)[0]            # full covers scoped
    (seat / "a.txt").write_text("b\n")
    _git(seat, "commit", "-q", "-am", "b")
    assert not gate_evidence.reusable("HEAD", "full", root=seat)[0]        # a different tree
    _git(seat, "commit", "-q", "--allow-empty", "-m", "same tree")
    gate_evidence.record("HEAD", "scoped", root=seat, selectors=["game/a.cpp"], base=first)
    assert not gate_evidence.reusable("HEAD", "full", root=seat)[0]        # scoped never covers full
    assert gate_evidence.reusable("HEAD", "scoped", root=seat, selectors=["game/a.cpp"])[0]
    assert not gate_evidence.reusable("HEAD", "scoped", root=seat,
                                      selectors=["game/a.cpp", "game/b.cpp"])[0]
    assert not gate_evidence.reusable("HEAD", "scoped", root=seat)[0]       # scope must be named


def test_a_multi_commit_unit_lands_whole_under_the_window(world, monkeypatch):
    service, unit, origin = world
    monkeypatch.delenv(pw.TOKEN_ENV, raising=False)
    seat = service.repo.parent / "seat"
    git(seat, "fetch", "-q", "origin", "master")
    git(seat, "reset", "-q", "--hard", "FETCH_HEAD")
    base = git(seat, "rev-parse", "HEAD")
    for name in ("header.h", "user.cpp"):
        (seat / name).write_text(name + "\n")
        git(seat, "add", name)
        git(seat, "commit", "-q", "-m", f"{name}\n\nVerifier-Change: none, fixture")
    stack = seat.parent / "stack.patch"
    stack.write_bytes(subprocess.run(["git", "format-patch", "--stdout", f"{base}..HEAD"], cwd=seat,
                                     check=True, capture_output=True).stdout)
    uid = service.enqueue(stack)
    seen = []
    real_gate = service._gate

    def gate(base_sha, tip):
        # the pregate runs outside the window (others may push); the in-window
        # gate runs while anybody else's push to master is refused
        saved = os.environ.pop(pw.TOKEN_ENV, None)
        seen.append(pw.check(root=seat)[0])
        if saved is not None:
            os.environ[pw.TOKEN_ENV] = saved
        return real_gate(base_sha, tip)
    service._gate = gate
    result = service.run_once(window=True)
    assert result["landed"] == [uid] and seen == [True, False]
    assert result["pregate_seconds"] >= 0
    assert {"header.h", "user.cpp"} <= set(origin_files(origin))
    receipt = json.loads((service.state / "receipts" / f"{uid}.json").read_text())
    assert len(receipt["commits"]) == 2 and receipt["commit"] == receipt["commits"][-1]
    assert pw.read(root=service.repo) == (None, None)                     # closed afterwards
    assert pw.TOKEN_ENV not in os.environ


# ---- 2026-09-30 review (review_20260930_0251.md) ----

def test_a_narrow_scoped_record_never_skips_a_wider_gate(tmp_path):
    # review_five_probes.py: the same tip pushed onto an older base changes two
    # headers instead of one; the narrow record from the first push let the
    # wider gate (which fails on b.cpp) be skipped.
    repo = tmp_path / "repo"
    _git(tmp_path, "init", "-q", str(repo))
    for key, value in (("user.name", "t"), ("user.email", "t@example.com"), ("core.hooksPath", "no-hooks")):
        _git(repo, "config", key, value)
    for sub_dir in ("tools", ".githooks", "game", "targets/game/reverse"):
        (repo / sub_dir).mkdir(parents=True)
    (repo / "targets/game/reverse/functions.csv").write_text("name,source,status\n")
    shutil.copy(REPO / ".githooks" / "pre-push", repo / ".githooks" / "pre-push")
    shutil.copy(TOOLS / "gate_evidence.py", repo / "tools" / "gate_evidence.py")
    for name in ("check_csv", "one_identity", "target_hooks", "conversion_gate", "name_regression",
                 "name_history", "name_oracle", "retired_guard", "doc_budget", "ea_name_guard",
                 "pin_consistency", "b_pin_check", "delta_sources", "protected_paths", "ledger_guard",
                 "check_case_collisions"):
        (repo / f"tools/{name}.py").write_text("import sys\nsys.exit(0)\n")
    (repo / "tools/layout_migration.py").write_text("import sys\nsys.exit(1)\n")
    (repo / "tools/header_dependents.py").write_text(
        "import subprocess,sys\n"
        "paths=subprocess.check_output(['git','diff','--name-only',sys.argv[2],sys.argv[3],'--','game'])"
        ".decode().splitlines()\n"
        "for p in paths:\n if p.endswith('.h'): print(p[:-2]+'.cpp')\n")
    (repo / "build.sh").write_text('#!/usr/bin/env bash\nprintf "%s\\n" "$@" >> gate_calls.txt\n'
                                   'case "$*" in *b.cpp*) exit 1;; esac\n')
    (repo / "game/a.h").write_text("old\n")
    (repo / "game/b.h").write_text("old\n")
    _git(repo, "add", "--", ".githooks", "tools", "build.sh", "game", "targets")
    _git(repo, "update-index", "--chmod=+x", "build.sh")
    (repo / "build.sh").chmod(0o755)  # Index mode does not change the worktree mode.
    _git(repo, "commit", "-q", "-m", "initial")
    older = _git(repo, "rev-parse", "HEAD")
    (repo / "game/b.h").write_text("bad b\n")
    _git(repo, "commit", "-q", "-am", "header b")
    newer = _git(repo, "rev-parse", "HEAD")
    (repo / "game/a.h").write_text("new a\n")
    _git(repo, "commit", "-q", "-am", "header a")
    tip = _git(repo, "rev-parse", "HEAD")

    def hook(base, reuse=True):
        env = {k: v for k, v in os.environ.items() if k != gate_evidence.ENABLE}
        if reuse:
            env[gate_evidence.ENABLE] = "1"
        return subprocess.run(["bash", ".githooks/pre-push", "origin", "unused"], cwd=repo, env=env,
                              input=f"refs/heads/topic {tip} refs/heads/topic {base}\n",
                              capture_output=True, text=True)
    assert hook(newer).returncode == 0                  # narrow: only a.cpp, green, recorded
    assert hook(older).returncode != 0                  # wider: b.cpp is red, reuse must not hide it
    assert hook(older, reuse=False).returncode != 0
    again = hook(newer)                                  # no reuse any more: it gates again
    assert again.returncode == 0 and "REUSING" not in again.stderr


def test_closing_someone_elses_window_needs_the_token_or_an_explicit_force(clones):
    token = pw.open_window(30, owner="holder", purpose="stack", root=clones["service"])
    assert not pw.close_window(root=clones["seat"])                     # tokenless: refused
    assert not pw.close_window("wrong", root=clones["seat"])
    assert pw.read(root=clones["service"])[1]["nonce"] == token
    assert pw.close_window(force=True, root=clones["seat"])             # explicit, logged
    log = Path(_git(clones["seat"], "rev-parse", "--absolute-git-dir")) / "bfme-window-forced.log"
    assert "forced close" in log.read_text() and "holder" in log.read_text()
    assert pw.read(root=clones["service"]) == (None, None)


# ---- short renewable lease (owner request 2026-09-30) ----

def test_a_window_is_a_short_lease_its_holder_renews(clones, monkeypatch):
    assert pw.LEASE_MINUTES <= 10
    nonce = pw.open_window(owner="drainer", root=clones["service"])
    token, info = pw.read(root=clones["service"])
    assert info["expires"] - info["opened"] <= pw.LEASE_MINUTES * 60
    expires = pw.renew_window(nonce, 5, root=clones["service"])
    new_token, info = pw.read(root=clones["service"])
    assert expires and new_token != token and info["nonce"] == nonce
    monkeypatch.setenv(pw.TOKEN_ENV, nonce)                  # the holder's pushes still pass
    assert pw.check(root=clones["seat"])[0]
    monkeypatch.delenv(pw.TOKEN_ENV)
    assert pw.renew_window("not-ours", 5, root=clones["seat"]) is None
    assert pw.close_window(nonce, root=clones["service"])


def test_a_dead_holder_blocks_only_until_its_short_lease_expires(clones):
    pw.open_window(-0.01, owner="crashed drainer", root=clones["service"])   # never renewed
    assert pw.check(root=clones["seat"]) == (True, "")


def _later(monkeypatch, minutes):
    real = pw.time.time
    monkeypatch.setattr(pw.time, "time", lambda: real() + minutes * 60)


def test_renewals_never_carry_a_window_past_its_hold_cap(clones, monkeypatch):
    nonce = pw.open_window(owner="drainer", root=clones["service"])
    opened = pw.read(root=clones["service"])[1]["opened"]
    _later(monkeypatch, pw.MAX_HOLD_MINUTES - 2)
    expires = pw.renew_window(nonce, pw.LEASE_MINUTES, root=clones["service"])
    assert expires == opened + pw.MAX_HOLD_MINUTES * 60      # clipped to the cap
    _later(monkeypatch, pw.MAX_HOLD_MINUTES + 1)
    assert pw.renew_window(nonce, pw.LEASE_MINUTES, root=clones["service"]) is None


def test_a_window_past_its_hold_cap_blocks_nothing_and_is_taken_over(clones, monkeypatch):
    pw.open_window(owner="hog", root=clones["service"])
    info = pw.read(root=clones["service"])[1]
    opened = info["opened"] - (pw.MAX_HOLD_MINUTES + 1) * 60                     # renewed all along,
    body = dict(info, opened=opened, expires=opened + pw.MAX_HOLD_MINUTES * 60 + 200)   # its lease past the cap
    new = pw._commit(body, clones["service"])
    _git(clones["service"], "push", "-q", "origin", f"+{new}:{pw.REF}")
    allowed, why = pw.check(root=clones["seat"])
    assert allowed and "hog" in why and "hold cap" in why
    token = pw.open_window(owner="next", root=clones["seat"])
    assert pw.read(root=clones["service"])[1]["nonce"] == token


def test_open_caps_its_lease_and_status_shows_the_time_held(clones, monkeypatch, capsys):
    pw.open_window(10 * pw.MAX_HOLD_MINUTES, owner="svc", root=clones["service"])
    info = pw.read(root=clones["service"])[1]
    assert info["expires"] - info["opened"] <= pw.MAX_HOLD_MINUTES * 60
    monkeypatch.setattr(pw, "ROOT", clones["seat"])          # status reads the test origin
    assert pw.main(["status"]) == 0
    assert f"LIVE held 0/{pw.MAX_HOLD_MINUTES} min" in capsys.readouterr().out


def test_the_drainer_renews_while_working_closes_and_logs_its_hold(world, monkeypatch):
    service, unit, origin = world
    monkeypatch.delenv(pw.TOKEN_ENV, raising=False)
    uid = service.enqueue(unit("renewed_window"))
    real_gate = service._gate
    renewals = []
    real_renew = pw.renew_window

    def counting(*args, **kwargs):
        renewals.append(1)
        return real_renew(*args, **kwargs)
    monkeypatch.setattr(pw, "renew_window", counting)

    def slow_gate(base, tip):
        import time
        time.sleep(4)                                       # longer than a renewal interval
        return real_gate(base, tip)
    service._gate = slow_gate
    result = service.run_once(window=True, window_minutes=0.05)     # 3 s lease, renew each 1 s
    assert result["landed"] == [uid] and renewals and "window_lost" not in result
    assert result["window_held_seconds"] > 0
    assert pw.read(root=service.repo) == (None, None)
    logged = json.loads((service.state / "windows.log").read_text().splitlines()[-1])
    assert logged["held"] == result["window_held_seconds"] and logged["landed"] == 1


def test_the_window_closes_even_when_the_pass_fails(world, monkeypatch):
    service, unit, origin = world
    monkeypatch.delenv(pw.TOKEN_ENV, raising=False)
    service.enqueue(unit("boom"))

    def boom(*args, **kwargs):
        raise RuntimeError("gate host fell over")
    service._gate = boom
    with pytest.raises(RuntimeError):
        service.run_once(window=True)
    assert pw.read(root=service.repo) == (None, None)


def test_no_new_pass_starts_after_the_hold_cap(world, monkeypatch):
    service, unit, origin = world
    monkeypatch.delenv(pw.TOKEN_ENV, raising=False)
    uid = service.enqueue(unit("capped"))
    result = service.run_once(window=True, max_hold=-1)       # cap already reached
    assert result["landed"] == [] and result["deferred"] == [uid]
    assert [r["id"] for r in service.queued()] == [uid]       # stays queued
    assert pw.read(root=service.repo) == (None, None)


def test_an_ignored_included_input_that_changes_is_caught_by_the_next_push(tmp_path):
    # Review cycle 6/7: the reverted ordinary-path reuse (6089f82afc) let a push
    # skip byte verification after an ignored, #included file changed. Kept as
    # a permanent guard: even with BFME_REUSE_GATE_EVIDENCE=1 the ordinary
    # pre-push path byte-verifies every push, so the change fails the gate.
    repo = tmp_path / "repo"
    _git(tmp_path, "init", "-q", str(repo))
    for key, value in (("user.name", "t"), ("user.email", "t@example.com"), ("core.hooksPath", "no-hooks")):
        _git(repo, "config", key, value)
    for sub_dir in ("tools", ".githooks", "game", "targets/game/reverse"):
        (repo / sub_dir).mkdir(parents=True)
    (repo / "targets/game/reverse/functions.csv").write_text("name,source,status\nf,game/a.cpp,matched\n")
    shutil.copy(REPO / ".githooks" / "pre-push", repo / ".githooks" / "pre-push")
    shutil.copy(TOOLS / "gate_evidence.py", repo / "tools" / "gate_evidence.py")
    for name in ("check_csv", "one_identity", "target_hooks", "conversion_gate", "name_regression",
                 "name_history", "name_oracle", "retired_guard", "doc_budget", "ea_name_guard",
                 "pin_consistency", "b_pin_check", "delta_sources", "header_dependents", "ledger_guard",
                 "check_case_collisions"):
        (repo / f"tools/{name}.py").write_text("import sys\nsys.exit(0)\n")
    (repo / "tools/layout_migration.py").write_text("import sys\nsys.exit(1)\n")
    (repo / "tools/verification_cache.py").write_text(
        "import sys\nargs = sys.argv\n"
        "if 'prepare' in args:\n    print(open(args[args.index('--selectors-file') + 1]).read(), end='')\n")
    (repo / "build.sh").write_text("#!/usr/bin/env bash\ngrep -q bad game/generated.h && exit 1\nexit 0\n")
    (repo / ".gitignore").write_text("game/generated.h\n")
    (repo / "game/generated.h").write_text("good\n")
    (repo / "game/a.cpp").write_text('#include "generated.h"\nint a;\n')
    _git(repo, "add", ".")
    _git(repo, "update-index", "--chmod=+x", "build.sh")
    (repo / "build.sh").chmod(0o755)  # The hook executes this worktree file directly.
    _git(repo, "commit", "-q", "-m", "base")
    base = _git(repo, "rev-parse", "HEAD")
    (repo / "game/a.cpp").write_text('#include "generated.h"\nint a = 1;\n')
    _git(repo, "commit", "-q", "-am", "change")
    tip = _git(repo, "rev-parse", "HEAD")

    def hook():
        env = dict(os.environ, **{gate_evidence.ENABLE: "1"})
        return subprocess.run(["bash", ".githooks/pre-push", "origin", "unused"], cwd=repo, env=env,
                              input=f"refs/heads/topic {tip} refs/heads/topic {base}\n",
                              capture_output=True, text=True)
    assert hook().returncode == 0
    (repo / "game/generated.h").write_text("bad\n")          # ignored, included, changed
    again = hook()
    assert again.returncode != 0 and "reused" not in again.stdout


# ---- push: publish through the window (Open-BFME-2, 2026-10-11) ----

def _commit_file(clone, name, text, message):
    (clone / name).write_text(text)
    _git(clone, "add", name)
    _git(clone, "commit", "-qm", message)


def _seeded(clones):
    """origin/master holds one commit; the seat works on a branch from it."""
    _commit_file(clones["service"], "a.txt", "a\n", "base")
    _git(clones["service"], "push", "-q", "origin", "HEAD:refs/heads/master")
    _git(clones["seat"], "fetch", "-q", "origin", "master")
    _git(clones["seat"], "checkout", "-q", "-B", "work", "FETCH_HEAD")
    _commit_file(clones["seat"], "b.txt", "b\n", "seat work")
    return clones["seat"]


def _master_log(clones):
    return _git(clones["origin"], "log", "--format=%s", "master").splitlines()


def _hook(clone, body):
    """A pre-push hook for this clone only (the fixture's hooksPath holds none)."""
    hooks = clone / "test-hooks"
    hooks.mkdir(exist_ok=True)
    script = hooks / "pre-push"
    # As the real pre-push: read the refs git writes (an unread pipe can stall git),
    # and pass the window's own lock-marker pushes (open, renew, close) untouched.
    script.write_text('#!/bin/sh\nrefs=$(cat)\ncase "$refs" in *refs/landing/*) exit 0 ;; esac\n' + body,
                      newline="\n")
    script.chmod(script.stat().st_mode | stat.S_IEXEC)
    _git(clone, "config", "core.hooksPath", str(hooks).replace("\\", "/"))


def test_push_rebases_publishes_under_the_window_and_closes_it(clones):
    seat = _seeded(clones)
    _commit_file(clones["service"], "c.txt", "c\n", "meanwhile")      # master moved since the seat branched
    _git(clones["service"], "push", "-q", "origin", "HEAD:refs/heads/master")
    _hook(seat, f'git ls-remote origin {pw.REF} > window-during-push.txt\n'
                f'env | grep -q "^{pw.TOKEN_ENV}=" && echo token >> window-during-push.txt\nexit 0\n')
    assert pw.push("seat work", root=seat) == 0
    assert _master_log(clones) == ["seat work", "meanwhile", "base"]
    during = (seat / "window-during-push.txt").read_text()
    assert pw.REF in during and "token" in during                     # held, and the hook saw our token
    assert pw.read(root=seat) == (None, None)                         # closed afterwards


def test_push_waits_while_someone_else_holds_the_window(clones, monkeypatch):
    seat = _seeded(clones)
    rival = pw.open_window(owner="rival", purpose="long gate", root=clones["service"])
    waits = []

    def sleep(seconds):
        waits.append(seconds)
        pw.close_window(rival, root=clones["service"])                # the rival finishes
    monkeypatch.setattr(pw.time, "sleep", sleep)
    assert pw.push("seat work", root=seat) == 0
    assert len(waits) == 1 and 30 <= waits[0] <= 300
    assert _master_log(clones)[0] == "seat work"


def test_push_gives_up_after_its_wait(clones, monkeypatch):
    seat = _seeded(clones)
    pw.open_window(owner="rival", root=clones["service"])
    monkeypatch.setattr(pw.time, "sleep", lambda seconds: None)
    assert pw.push("seat work", root=seat, wait_minutes=0) == 1
    assert _master_log(clones) == ["base"]


def test_a_rebase_conflict_pushes_nothing_and_leaves_no_rebase_behind(clones):
    seat = _seeded(clones)
    _commit_file(seat, "a.txt", "seat\n", "seat edits a")
    _commit_file(clones["service"], "a.txt", "service\n", "service edits a")
    _git(clones["service"], "push", "-q", "origin", "HEAD:refs/heads/master")
    assert pw.push("seat work", root=seat) == 9
    assert _master_log(clones) == ["service edits a", "base"]
    git_dir = Path(_git(seat, "rev-parse", "--absolute-git-dir"))
    assert not (git_dir / "rebase-merge").exists() and not (git_dir / "rebase-apply").exists()
    assert pw.read(root=seat) == (None, None)


def test_a_hook_refusal_is_returned_not_retried(clones):
    seat = _seeded(clones)
    _hook(seat, 'echo attempt >> attempts.txt\necho "PRE-PUSH FAILED: byte gate" >&2\nexit 1\n')
    assert pw.push("seat work", root=seat) != 0
    assert (seat / "attempts.txt").read_text().splitlines() == ["attempt"]
    assert _master_log(clones) == ["base"] and pw.read(root=seat) == (None, None)


def test_a_hook_refusal_is_not_retried_even_when_master_moved_meanwhile(clones):
    """Port review: a refusal while another checkout advanced master was rebased
    and re-run; only git's own race rejection is retried."""
    seat = _seeded(clones)
    service = str(clones["service"]).replace("\\", "/")
    _hook(seat, 'echo attempt >> attempts.txt\n'
                '(unset GIT_DIR GIT_WORK_TREE GIT_INDEX_FILE GIT_PREFIX\n'
                f' cd "{service}" && git commit -q --allow-empty -m mover && git push -q origin HEAD:refs/heads/master)\n'
                'echo "PRE-PUSH FAILED: byte gate" >&2\nexit 1\n')
    assert pw.push("seat work", root=seat) != 0
    assert (seat / "attempts.txt").read_text().splitlines() == ["attempt"]


def test_push_refuses_a_rebase_already_in_progress_and_keeps_its_resolution(clones):
    """Port review BLOCKER: a paused conflicted rebase was aborted, its staged
    resolution lost."""
    seat = _seeded(clones)
    _commit_file(seat, "a.txt", "seat\n", "seat edits a")
    _commit_file(clones["service"], "a.txt", "service\n", "service edits a")
    _git(clones["service"], "push", "-q", "origin", "HEAD:refs/heads/master")
    _git(seat, "fetch", "-q", "origin", "master")
    assert subprocess.run(["git", "rebase", "FETCH_HEAD"], cwd=seat, capture_output=True).returncode
    (seat / "a.txt").write_text("resolved\n")
    _git(seat, "add", "a.txt")
    assert pw.push("seat work", root=seat) == 8
    git_dir = Path(_git(seat, "rev-parse", "--absolute-git-dir"))
    assert (git_dir / "rebase-merge").exists() or (git_dir / "rebase-apply").exists()
    assert _git(seat, "diff", "--cached", "--", "a.txt") and (seat / "a.txt").read_text() == "resolved\n"
    assert pw.read(root=seat) == (None, None)                         # no window was opened


def test_push_refuses_a_remote_whose_push_url_differs(clones, tmp_path):
    seat = _seeded(clones)
    elsewhere = tmp_path / "elsewhere.git"
    _git(tmp_path, "init", "-q", "--bare", str(elsewhere))
    _git(seat, "remote", "set-url", "--push", "origin", str(elsewhere))
    assert pw.push("seat work", root=seat) == 8
    assert pw.read(root=seat) == (None, None)


def test_a_window_that_will_not_close_is_reported_with_its_close_command(clones, monkeypatch, capsys):
    seat = _seeded(clones)
    monkeypatch.setattr(pw, "close_window", lambda *a, **k: False)
    monkeypatch.setattr(pw.time, "sleep", lambda seconds: None)
    assert pw.push("seat work", root=seat) == 0                        # the work did land
    err = capsys.readouterr().err
    nonce = pw.read(root=seat)[1]["nonce"]
    assert "still open" in err and f"python3 tools/publish_window.py close {nonce}" in err


def test_renewal_retries_a_failed_push_and_stops_only_on_confirmed_loss(monkeypatch):
    import threading
    monkeypatch.setattr(pw, "LEASE_MINUTES", 0.0015)                  # renew every ~0.03 s
    monkeypatch.setattr(pw, "RENEW_RETRY_SECONDS", 0.01)
    calls, owner = [], {"nonce": "a" * 32}
    monkeypatch.setattr(pw, "renew_window", lambda *a, **k: calls.append(1) and None)   # every push fails
    now = time_now = pw.time.time()
    monkeypatch.setattr(pw, "read", lambda *a, **k: ("sha", dict(owner, opened=time_now, expires=time_now + 600)))
    stop, lost = threading.Event(), threading.Event()
    worker = threading.Thread(target=pw._renew_until, args=("a" * 32, stop, lost, "origin", None), daemon=True)
    worker.start()
    pw.time.sleep(0.3)
    assert len(calls) >= 3 and not lost.is_set()                     # still ours: retried, not abandoned
    owner["nonce"] = "b" * 32                                          # now someone else's
    worker.join(timeout=2)
    assert lost.is_set() and not worker.is_alive()
    stop.set()
    assert now


def test_metadata_without_a_bounded_opening_blocks_one_lease_at_most(clones, monkeypatch):
    """Port review: a valid nonce with no opening, or an expiry a year out, held
    master past the hold cap."""
    now = pw.time.time()
    good = {"nonce": "c" * 32, "opened": now, "expires": now + 600}
    assert pw.valid(good)
    for bad in ({"nonce": "c" * 32, "expires": now + 600},                          # no opening
                dict(good, expires=now + 365 * 86400),                              # past the cap
                dict(good, opened=float("nan")), dict(good, expires=float("inf")),
                dict(good, opened=True), dict(good, opened=now + 3600)):            # bool, future
        assert not pw.valid(bad), bad
    body = {"nonce": "c" * 32, "owner": "hog", "expires": int(now + 365 * 86400)}
    _git(clones["service"], "push", "-q", "origin", f"+{pw._commit(body, clones['service'])}:{pw.REF}")
    assert not pw.check(root=clones["seat"])[0]                        # unknown: blocks, for one lease
    _later(monkeypatch, pw.LEASE_MINUTES + 1)
    assert pw.check(root=clones["seat"])[0]


def test_a_push_that_loses_its_race_rebases_and_tries_again(clones):
    """A checkout whose hook predates the window can still push meanwhile; the
    push then fails on a moved master, and `push` rebases and tries again."""
    seat = _seeded(clones)
    service = str(clones["service"]).replace("\\", "/")
    _hook(seat, 'if [ ! -f raced.txt ]; then\n'
                '    touch raced.txt\n'
                '    (unset GIT_DIR GIT_WORK_TREE GIT_INDEX_FILE GIT_PREFIX\n'
                f'     cd "{service}" && git commit -q --allow-empty -m racer\\\n'
                '         && git push -q origin HEAD:refs/heads/master)\n'
                'fi\nexit 0\n')
    assert pw.push("seat work", root=seat) == 0
    assert _master_log(clones) == ["seat work", "racer", "base"]


def test_the_hook_checks_the_destination_and_rechecks_after_every_ref():
    """Behaviour is exercised by Open-BFME-2's test_pre_push_rechecks_the_window_after_every_ref;
    here the same wiring: the pushed URL is asked, and once more after the loop."""
    text = (REPO / ".githooks" / "pre-push").read_text(encoding="utf-8")
    assert 'check --remote "$window_remote"' in text and 'window_remote="${2:-${1:-origin}}"' in text
    tail = text[text.index('done <<< "$refs"'):]
    assert 'if [ "$pushes_master" -eq 1 ]; then' in tail and "window_check" in tail


# ---- port review round 2 (GPT-6.1-Sol, 2026-10-11) ----

class _InterruptOn:
    """stderr that raises KeyboardInterrupt when a line carrying `marker` arrives."""

    def __init__(self, real, marker):
        self.real, self.marker = real, marker

    def write(self, text):
        if self.marker in text:
            raise KeyboardInterrupt
        return self.real.write(text)

    def flush(self):
        self.real.flush()


def test_an_interrupted_push_ends_git_and_its_hook_and_leaves_the_window_to_lapse(clones, monkeypatch, capsys):
    """Rounds 2-3: an interrupted publisher closed its window while git and its
    hook kept running (round 2); and killing local git cannot stop a receive the
    remote already has under way (round 3). The push and its hooks are ended, and
    the window is left to lapse instead of closed."""
    seat = _seeded(clones)
    _hook(seat, 'echo hook-started >&2\nsleep 8\nexit 0\n')
    monkeypatch.setattr(sys, "stderr", _InterruptOn(sys.stderr, "hook-started"))
    with pytest.raises(KeyboardInterrupt):
        pw.push("seat work", root=seat)
    monkeypatch.undo()
    token, info = pw.read(root=seat)
    assert token and pw.live(info)                                    # left open, to lapse within a lease
    assert f"close {info['nonce']} --remote origin" in capsys.readouterr().err
    pw.time.sleep(10)                                                 # the local hook was ended: nothing lands
    assert _master_log(clones) == ["base"]


def test_push_needs_a_configured_remote_not_a_url(clones):
    """Round 2: a URL given directly skipped the destination check (pushInsteadOf
    could send the push elsewhere than the window and the race check read)."""
    seat = _seeded(clones)
    assert pw.push("seat work", remote=str(clones["origin"]), root=seat) == 8
    assert _master_log(clones) == ["base"]


def test_a_remote_whose_path_has_spaces_is_one_destination(clones, tmp_path):
    seat = _seeded(clones)
    spaced = tmp_path / "with space" / "origin.git"
    spaced.parent.mkdir()
    _git(tmp_path, "init", "-q", "--bare", str(spaced))
    _git(seat, "remote", "add", "spaced", str(spaced))
    _git(seat, "push", "-q", "spaced", "HEAD~1:refs/heads/master")
    assert pw.push("seat work", remote="spaced", root=seat) == 0
    assert _git(spaced, "log", "--format=%s", "master").splitlines() == ["seat work", "base"]


def test_unreadable_metadata_never_confirms_a_close(clones, monkeypatch, capsys):
    """Round 2: corrupt metadata read as another owner's window, so a window
    still open was reported closed."""
    seat = clones["seat"]
    nonce = pw.open_window(owner="seat", root=seat)
    corrupt = pw._commit({"owner": "?"}, seat)                         # no nonce, no times
    _git(seat, "push", "-q", "origin", f"+{corrupt}:{pw.REF}")
    monkeypatch.setattr(pw.time, "sleep", lambda seconds: None)
    assert pw._close_confirmed(nonce, "origin", seat, attempts=2) is False
    err = capsys.readouterr().err
    assert f"close {nonce} --remote origin" in err and "close --force --remote origin" in err


def test_a_huge_integer_in_metadata_is_corrupt_not_a_crash(clones, monkeypatch):
    now = pw.time.time()
    assert not pw.valid({"nonce": "d" * 32, "opened": 10 ** 400, "expires": now + 600})
    assert not pw.valid({"nonce": "d" * 32, "opened": now, "expires": 10 ** 400})
    body = {"nonce": "d" * 32, "owner": "big", "opened": 10 ** 400, "expires": 10 ** 400}
    _git(clones["service"], "push", "-q", "origin", f"+{pw._commit(body, clones['service'])}:{pw.REF}")
    assert not pw.check(root=clones["seat"])[0]                        # unknown: blocks, for one lease
    _later(monkeypatch, pw.LEASE_MINUTES + 1)
    assert pw.check(root=clones["seat"])[0]
