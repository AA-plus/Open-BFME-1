"""The ledger merge driver registered as git's `union` (tools/merge_rows.py)."""
import subprocess
import sys
from pathlib import Path

import pytest

TOOLS = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(TOOLS))

import merge_rows as M  # noqa: E402

H = b"name,target_rva\n"


def sides(tmp_path, base, ours, theirs):
    paths = [tmp_path / n for n in ("base", "ours", "theirs")]
    for path, data in zip(paths, (base, ours, theirs)):
        path.write_bytes(data)
    return [str(p) for p in paths]


def plain_union(tmp_path, *three):
    base, ours, theirs = sides(tmp_path, *three)
    return subprocess.run(["git", "merge-file", "-p", "--union", ours, base, theirs],
                          check=True, capture_output=True).stdout


def driver(tmp_path, *three):
    base, ours, theirs = sides(tmp_path, *three)
    assert M.main([base, ours, theirs, "functions.csv"]) == 0
    return Path(ours).read_bytes()


def test_a_row_upstream_retracted_stays_gone_beside_your_edit(tmp_path):
    three = (H + b"R,1\nS,2\n", H + b"S,2\n", H + b"R,1\nS,3\n")
    assert plain_union(tmp_path, *three) == H + b"S,2\nR,1\nS,3\n"
    assert driver(tmp_path, *three) == H + b"S,3\n"


def test_neighbouring_edits_keep_only_the_new_rows(tmp_path):
    three = (H + b"X,1\nY,2\n", H + b"X,9\nY,2\n", H + b"X,1\nY,8\n")
    assert plain_union(tmp_path, *three) == H + b"X,9\nY,2\nX,1\nY,8\n"
    assert driver(tmp_path, *three) == H + b"X,9\nY,8\n"


def test_a_row_both_sides_added_is_kept_once(tmp_path):
    three = (H, H + b"N,5\nP,6\n", H + b"Q,7\nN,5\n")
    assert plain_union(tmp_path, *three) == H + b"N,5\nP,6\nQ,7\nN,5\n"
    assert driver(tmp_path, *three) == H + b"N,5\nP,6\nQ,7\n"


def test_a_row_both_sides_edited_keeps_both_versions_for_check_csv(tmp_path):
    three = (H + b"S,2\n", H + b"S,3\n", H + b"S,4\n")
    assert driver(tmp_path, *three) == plain_union(tmp_path, *three) == H + b"S,3\nS,4\n"


def test_terminators_survive_and_an_lf_copy_is_not_a_second_row(tmp_path):
    c = b"name,target_rva\r\n"
    three = (c + b"A,1\r\r\nB,2\r\n",
             c + b"A,1\r\r\nB,2\r\nC,3\r\n",
             c + b"A,1\r\r\nB,2\nD,4\n")
    assert plain_union(tmp_path, *three) == c + b"A,1\r\r\nB,2\r\nC,3\r\nB,2\nD,4\n"
    assert driver(tmp_path, *three) == c + b"A,1\r\r\nB,2\r\nC,3\r\nD,4\n"


def test_a_failed_union_leaves_a_conflict(tmp_path):
    base, ours, theirs = sides(tmp_path, H, H, H)
    Path(base).unlink()
    assert M.main([base, ours, theirs, "functions.csv"]) == 1


def test_a_rebase_uses_the_driver_registered_as_union(tmp_path):
    def git(*args):
        return subprocess.run(["git", *args], cwd=tmp_path, check=True, capture_output=True, text=True)
    git("init", "-q", "-b", "master")
    git("config", "user.email", "t@example.com")
    git("config", "user.name", "t")
    git("config", "merge.union.driver", f'"{sys.executable}" "{TOOLS / "merge_rows.py"}" %O %A %B %P')
    (tmp_path / ".gitattributes").write_text("functions.csv merge=union\n")
    ledger = tmp_path / "functions.csv"
    ledger.write_bytes(H + b"R,1\nS,2\n")
    git("add", ".")
    git("commit", "-qm", "base")
    git("checkout", "-qb", "mine")
    ledger.write_bytes(H + b"R,1\nS,3\n")
    git("commit", "-qam", "edit S")
    git("checkout", "-q", "master")
    ledger.write_bytes(H + b"S,2\n")
    git("commit", "-qam", "retract R")
    git("checkout", "-q", "mine")
    rebase = git("rebase", "master")
    assert ledger.read_bytes() == H + b"S,3\n"
    assert "dropped 2 line(s)" in rebase.stderr


# ---- rows the base holds more than once -------------------------------------
# Each side's change to a row's count is an addition or a removal. Two additions
# overlap, two removals overlap (the larger applies once), and an addition
# beside a removal both apply. The driver first summed two removals, so two
# sides that each cleaned up the same duplicate deleted the row they both kept.
# It only removes lines, so where git's own merge leaves fewer copies of a row
# than both sides hold, it stops instead of writing.

def count(data, key=b"R,1"):
    return [M.row(line) for line in M.lines(data)].count(key)


def model(o, a, b):
    """The same rule, written from the changes instead of the cases."""
    return o + max(a - o, b - o, 0) - max(o - a, o - b, 0)


def test_both_sides_removing_the_same_duplicate_keep_the_copy_they_both_kept(tmp_path):
    three = (H + b"R,1\nR,1\nS,2\n", H + b"R,1\nS,2\nA,3\n", H + b"R,1\nS,2\nB,4\n")
    assert plain_union(tmp_path, *three) == H + b"R,1\nS,2\nA,3\nB,4\n"
    assert driver(tmp_path, *three) == H + b"R,1\nS,2\nA,3\nB,4\n"


def test_a_duplicate_both_sides_removed_survives_beside_an_edit(tmp_path):
    three = (H + b"R,1\nR,1\nS,2\n", H + b"R,1\nS,2\nM,3\n", H + b"R,1\nS,3\n")
    assert plain_union(tmp_path, *three) == H + b"R,1\nS,2\nM,3\nS,3\n"
    assert driver(tmp_path, *three) == H + b"R,1\nM,3\nS,3\n"


@pytest.mark.parametrize("o,a,b,want", [
    (2, 1, 1, 1),   # both removed one of two
    (3, 2, 1, 1),   # unequal removals: the larger one, once
    (3, 1, 2, 1),
    (3, 2, 2, 2),
    (4, 2, 3, 2),
    (2, 1, 0, 0),   # one side removed a duplicate, the other retracted the row
    (2, 0, 1, 0),
    (2, 0, 0, 0),   # both retracted it
    (1, 0, 0, 0),
    (2, 0, 2, 0),   # one side retracted it, the other left it alone
    (2, 1, 2, 1),   # one side removed a duplicate, the other left it alone
    (2, 2, 1, 1),
    (1, 2, 2, 2),   # both added the same copy
    (0, 2, 1, 2),
    (1, 0, 2, 1),   # one retracted the row, the other added a copy
    (2, 1, 3, 2),
])
def test_how_many_copies_of_a_repeated_row_survive(tmp_path, o, a, b, want):
    assert model(o, a, b) == want
    three = tuple(H + b"R,1\n" * n + b"S,2\n" + tail for n, tail in ((o, b""), (a, b"A,3\n"), (b, b"B,4\n")))
    merged = driver(tmp_path, *three)
    assert count(merged) == want
    assert merged.replace(b"R,1\n", b"") == H + b"S,2\nA,3\nB,4\n"


def test_removals_of_different_copies_stop_instead_of_deleting_the_row(tmp_path):
    """Far enough apart, git merges both removals cleanly and no copy is left to keep."""
    middle = b"X,7\nY,8\nZ,9\n"
    three = (H + b"R,1\n" + middle + b"R,1\n", H + middle + b"R,1\n", H + b"R,1\n" + middle)
    assert plain_union(tmp_path, *three) == H + middle
    base, ours, theirs = sides(tmp_path, *three)
    assert M.main([base, ours, theirs, "functions.csv"]) == 1
    assert Path(ours).read_bytes() == three[1]


def test_the_stop_names_the_row(tmp_path, capsys):
    middle = b"X,7\nY,8\nZ,9\n"
    base, ours, theirs = sides(tmp_path, H + b"R,1\n" + middle + b"R,1\n", H + middle + b"R,1\n",
                               H + b"R,1\n" + middle)
    assert M.main([base, ours, theirs, "functions.csv"]) == 1
    err = capsys.readouterr().err
    assert "functions.csv" in err and "R,1" in err and "conflict" in err


def history(tmp_path, base, ours, theirs):
    """master holds `ours`, `side` holds `theirs`, both grown from `base`, this driver registered."""
    def git(*args, check=True):
        return subprocess.run(["git", *args], cwd=tmp_path, check=check, capture_output=True, text=True)
    git("init", "-q", "-b", "master")
    git("config", "user.email", "t@example.com")
    git("config", "user.name", "t")
    git("config", "core.autocrlf", "false")
    git("config", "merge.union.driver", f'"{sys.executable}" "{TOOLS / "merge_rows.py"}" %O %A %B %P')
    (tmp_path / ".gitattributes").write_text("functions.csv merge=union\n")
    ledger = tmp_path / "functions.csv"
    ledger.write_bytes(base)
    git("add", ".")
    git("commit", "-qm", "base")
    git("checkout", "-qb", "side")
    ledger.write_bytes(theirs)
    git("commit", "-qam", "theirs")
    git("checkout", "-q", "master")
    ledger.write_bytes(ours)
    git("commit", "-qam", "ours")
    return git, ledger


@pytest.mark.parametrize("how", ["merge", "rebase"])
def test_a_real_merge_and_rebase_keep_the_copy_both_branches_kept(tmp_path, how):
    git, ledger = history(tmp_path, H + b"R,1\nR,1\nS,2\n", H + b"R,1\nS,2\nA,3\n", H + b"R,1\nS,2\nB,4\n")
    if how == "merge":
        done = git("merge", "-q", "--no-edit", "side", check=False)
    else:
        git("checkout", "-q", "side")
        done = git("rebase", "master", check=False)
    assert done.returncode == 0, done.stdout + done.stderr
    assert ledger.read_bytes() == H + b"R,1\nS,2\nA,3\nB,4\n"


def test_a_real_merge_of_different_copies_removed_stops_on_a_conflict(tmp_path):
    middle = b"X,7\nY,8\nZ,9\n"
    ours = H + middle + b"R,1\n"
    git, ledger = history(tmp_path, H + b"R,1\n" + middle + b"R,1\n", ours, H + b"R,1\n" + middle)
    done = git("merge", "-q", "--no-edit", "side", check=False)
    assert done.returncode != 0 and "merge_rows: functions.csv" in done.stderr, done.stdout + done.stderr
    assert ledger.read_bytes() == ours
    assert git("status", "--porcelain").stdout.startswith("UU functions.csv")


def test_random_ledgers_follow_the_rule_and_never_lose_a_row_both_sides_kept(tmp_path):
    """Seeded: few distinct rows, so repeats, moves, shared additions and shared removals are common."""
    import collections
    import random
    rng = random.Random(20261011)
    alphabet = [b"%c,%d" % (65 + i, i) for i in range(7)]

    def ledger(source=None):
        if source is None:
            rows = [rng.choice(alphabet) for _ in range(rng.randrange(0, 9))]
        else:
            rows = [r for r in source if rng.random() > 0.25]
            for _ in range(rng.randrange(0, 3)):
                rows.insert(rng.randrange(0, len(rows) + 1), rng.choice(alphabet))
        return rows

    def data(rows):
        return H + b"".join(r + b"\n" for r in rows)

    stopped = 0
    for trial in range(300):
        base = ledger()
        if trial % 3 == 0:
            base = list(dict.fromkeys(base))          # a clean ledger: every row once
        ours, theirs = ledger(base), ledger(base)
        three = (data(base), data(ours), data(theirs))
        union = plain_union(tmp_path, *three)
        merged, dropped, short = M.merge(union, *three)
        o, a, b, u = (collections.Counter(map(M.row, M.lines(d))) for d in (*three, union))
        want = {key: model(o[key], a[key], b[key]) for key in u | a | b}
        assert sorted(short) == sorted(key for key in a if u[key] < min(a[key], b[key])), (three, short)
        if short:
            stopped += 1
            assert all(o[key] > 1 for key in short), (three, short)        # never from a clean base
            continue
        got = collections.Counter(map(M.row, M.lines(merged)))
        assert got == +collections.Counter({key: min(u[key], n) for key, n in want.items()}), (three, merged)
        assert all(got[key] >= min(a[key], b[key]) for key in a), (three, merged)   # what both hold stays
        rest = iter(M.lines(union))
        assert all(line in rest for line in M.lines(merged)), (three, merged)   # union's order
        assert dropped == len(M.lines(union)) - len(M.lines(merged))
    assert stopped < 100, stopped
