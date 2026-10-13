#!/usr/bin/env python3
"""Refuse a NEW functions.csv row that starts mid-function or swallows padding.

Two retired MASM rows show the failure: ?handleRequestJoin@LANAPI at
0x005A565D/1119 started 0xD inside the 118 B body at 0x005A5650 and ran over
three more bodies; ?generateParticleInfo@ParticleSystem at 0x006008AF/1257
started 0x1F inside 0x00600890 and ran over three more plus 184 B of int3
padding. A MASM dump reproduces whatever bytes it is pointed at, so the build
was green for both.

Only rows a commit adds or moves (a (name, rva, size) key absent before) are
checked, so the existing ledger needs no baseline. Refusals rest on positive
evidence only:

- start: the row starts strictly inside another known body (a Ghidra function
  or another matched row's extent) and the byte before it is not int3 or a
  ret/ret N tail. Byte-exact C++ where Ghidra mis-split a body starts after
  padding, so it passes.
- span: the range contains a run of >=3 int3 followed, still inside the range,
  by another known function start. A real body never carries inter-function
  padding in its middle.

Exempt: EH funclets and object-only rows (`parent=`/`object-symbol=` notes),
whose extents are proven by unwind maps, and `?j_` ILT thunks (5 B, by
address).
"""
import bisect
import csv
import io

MIN_PAD_RUN = 3
EXEMPT_NOTES = ("parent=", "object-symbol=")


def parse_rows(raw):
    """functions.csv bytes -> list of row dicts with int rva/size."""
    out = []
    reader = csv.DictReader(io.StringIO(raw.decode("utf-8", errors="replace")))
    for row in reader:
        try:
            rva = int(row["target_rva"], 16)
            size = int(row["target_size"])
        except (KeyError, TypeError, ValueError):
            continue
        out.append({**row, "rva": rva, "size": size})
    return out


def changed_rows(before, after):
    """Rows of `after` whose (name, rva, size) is new: added or moved."""
    old = {(r["name"], r["rva"], r["size"]) for r in before}
    return [r for r in after if (r["name"], r["rva"], r["size"]) not in old]


def exempt(row):
    notes = row.get("notes") or ""
    return (row["name"].startswith("?j_") or row["size"] <= 0
            or any(key in notes for key in EXEMPT_NOTES))


def load_ghidra(path):
    sizes = {}
    with open(path, newline="") as handle:
        for row in csv.DictReader(handle):
            try:
                sizes[int(row["rva"], 16)] = int(row["size"])
            except (KeyError, ValueError):
                continue
    return sizes


class Extents:
    """Known bodies: Ghidra functions plus matched ledger rows."""

    def __init__(self, ghidra_sizes, rows):
        self.bodies = {}  # start -> list of (size, label)
        for start, size in ghidra_sizes.items():
            if size > 0:
                self.bodies.setdefault(start, []).append(
                    (size, f"Ghidra function 0x{start:08X}/{size}"))
        for r in rows:
            if r.get("status") == "matched" and r["size"] > 0 and not exempt(r):
                self.bodies.setdefault(r["rva"], []).append(
                    (r["size"], f"matched row {r['name']} 0x{r['rva']:08X}/{r['size']}"))
        self.starts = sorted(self.bodies)
        self.longest = max((s for v in self.bodies.values() for s, _ in v), default=0)

    def enclosing(self, rva):
        """Label of a known body that contains `rva` strictly after its start."""
        low = bisect.bisect_left(self.starts, rva - self.longest)
        high = bisect.bisect_left(self.starts, rva)
        for start in self.starts[low:high]:
            for size, label in self.bodies[start]:
                if rva < start + size:
                    return label
        return None

    def starts_in(self, low, high):
        """Known starts in [low, high)."""
        return self.starts[bisect.bisect_left(self.starts, low):
                           bisect.bisect_left(self.starts, high)]


def after_padding(read, rva):
    """True if the bytes before `rva` end in int3 or a ret / ret N."""
    before = read(rva - 3, 3)
    if len(before) < 3:
        return False
    return before[2] in (0xCC, 0xC3) or before[0] == 0xC2


def check_row(row, extents, read):
    """Refusal text for one new row, or None."""
    if exempt(row):
        return None
    rva, size = row["rva"], row["size"]
    where = f"{row['name']} @ 0x{rva:08X}/{size}"
    inside = extents.enclosing(rva)
    if inside and not after_padding(read, rva):
        return (f"{where} starts inside {inside}, and the bytes before it are "
                "not int3/ret padding. Re-anchor the row at the body's real "
                "start (tools/boundary_validator.py) or cite boundary evidence.")
    body = read(rva, size)
    index = 0
    while index < len(body):
        if body[index] != 0xCC:
            index += 1
            continue
        end = index
        while end < len(body) and body[end] == 0xCC:
            end += 1
        if end - index >= MIN_PAD_RUN:
            later = extents.starts_in(rva + end, rva + size)
            if later:
                return (f"{where} spans {end - index} B of int3 padding at "
                        f"0x{rva + index:08X} and the function start at "
                        f"0x{later[0]:08X} ({len(later)} start(s) inside). "
                        "Split it into one row per body.")
        index = end
    return None


def check(before_rows, after_rows, ghidra_sizes, read):
    """Refusals for every row `after_rows` adds or moves."""
    new = changed_rows(before_rows, after_rows)
    if not new:
        return []
    extents = Extents(ghidra_sizes, after_rows)
    return [msg for msg in (check_row(r, extents, read) for r in new) if msg]
