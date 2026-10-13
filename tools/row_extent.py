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

Mid-body starts are decoded (capstone): a start inside a known body passes only
when it is an instruction boundary of that body, is not a branch target inside
it, and follows padding (int3 or alignment) after an unconditional ret/jmp, or a
run of >=3 int3. A start right after an internal ret is a split, and refused.
A range that runs over another matched row's start is refused too.

Exemptions are verified, never trusted by value, and only waive the
padding-before-start rule for a body the row may legitimately sit in; the
instruction-boundary, branch-target and span checks always apply:

- `parent=<name>` (EH funclets): <name> must be a functions.csv row, and the
  waiver covers only an enclosing body that starts at that row's RVA. Most
  funclets sit in retail's separate funclet region and need no waiver.
- `object-symbol=<compiler label>` waives nothing on its own: a label proves
  only what the object file called the symbol. It counts together with a
  verified parent=, which is already sufficient (2026-10-13: of 27439
  label-only matched rows none needs a waiver).
- `ghidra=Catch@<va>`: <va> must be the row's own VA (RVA + 0x400000).
- catch shape: the row decodes from its start to `mov eax, <VA inside the
  enclosing body>; ret` at its end, with no earlier ret or jmp out of it.
A waived start must still follow a ret or jmp (no fall-through entry).
- `?j_XXXXXXXX` ILT thunks whose hex is the row's RVA, 5 B, opening E9.
A row re-judges whenever its name, extent, status or exemption notes change.
"""
import bisect
import csv
import io
import re

MIN_PAD_RUN = 3
IMAGE_BASE = 0x400000
PARENT = re.compile(r"(?:^|;)\s*parent=([^;]*)")
CATCH_NOTE = re.compile(r"(?:^|;)\s*ghidra=Catch@([0-9A-Fa-f]+)\s*(?:;|$)")
# Same spelling as tools/add_match.py's COMPILER_LABEL (kept import-free: add_match
# pulls in the build stack).
COMPILER_LABEL = re.compile(r"(?:^|;)\s*object-symbol=(?:_?\$[A-Za-z]\w*|__ehhandler\$\S*|"
                            r"__unwindfunclet\$\S*|__catch\$\S*|\?\?__[EF]\S*)\s*(?:;|$)")
ALIGN_NOPS = {"nop", "int3"}


class ImageError(Exception):
    pass


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


def note_exempt(row):
    """Notes that claim an exemption (claims only; check_row verifies them)."""
    notes = row.get("notes") or ""
    return bool(PARENT.search(notes) or COMPILER_LABEL.search(notes)
                or CATCH_NOTE.search(notes))


def waived_starts(row, rows_by_name):
    """Body starts whose padding rule the row's verified notes waive."""
    notes = row.get("notes") or ""
    out = set()
    parent = PARENT.search(notes)
    if parent:
        out.update(p["rva"] for p in rows_by_name.get(parent.group(1).strip(), ())
                   if p["rva"] != row["rva"])
    catch = CATCH_NOTE.search(notes)
    if catch and int(catch.group(1), 16) == row["rva"] + IMAGE_BASE:
        out.add(None)  # any enclosing body: Ghidra merged the catch into it
    return out


def key(row):
    notes = row.get("notes") or ""
    claims = tuple(m.group(0).strip() if m else None for m in (
        PARENT.search(notes), COMPILER_LABEL.search(notes), CATCH_NOTE.search(notes)))
    return (row["name"], row["rva"], row["size"], row.get("status"), claims)


def changed_rows(before, after):
    """Rows of `after` that are new, moved, or changed status/exemption."""
    old = {key(r) for r in before}
    return [r for r in after if key(r) not in old]


def ilt_thunk(row, read):
    return (row["size"] == 5
            and row["name"].lower() == f"?j_{row['rva']:08x}@@yaxxz"
            and read(row["rva"], 1)[:1] == b"\xe9")


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
        self.bodies = {}  # start -> list of (size, label, is_row)
        for start, size in ghidra_sizes.items():
            if size > 0:
                self.bodies.setdefault(start, []).append(
                    (size, f"Ghidra function 0x{start:08X}/{size}", False))
        for r in rows:
            if r.get("status") == "matched" and r["size"] > 0 and not note_exempt(r):
                self.bodies.setdefault(r["rva"], []).append(
                    (r["size"], f"matched row {r['name']} 0x{r['rva']:08X}/{r['size']}", True))
        self.starts = sorted(self.bodies)
        self.row_starts = sorted(a for a, v in self.bodies.items() if any(x[2] for x in v))
        self.longest = max((x[0] for v in self.bodies.values() for x in v), default=0)

    def enclosing(self, rva):
        """(start, size, label) of every known body containing `rva` past its start."""
        low = bisect.bisect_left(self.starts, rva - self.longest)
        high = bisect.bisect_left(self.starts, rva)
        return [(start, size, label) for start in self.starts[low:high]
                for size, label, _ in self.bodies[start] if rva < start + size]

    def starts_in(self, low, high, rows_only=False):
        """Known starts in [low, high)."""
        seq = self.row_starts if rows_only else self.starts
        return seq[bisect.bisect_left(seq, low):bisect.bisect_left(seq, high)]


_DISASM = None


def disasm():
    global _DISASM
    if _DISASM is None:
        import capstone
        _DISASM = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_32)
    return _DISASM


def is_padding(insn):
    if insn.mnemonic in ALIGN_NOPS:
        return True
    # MSVC alignment fillers: lea r,[r+0]; mov edi, edi.
    if insn.mnemonic == "lea":
        m = re.fullmatch(r"(\w+), \[(\w+)\]", insn.op_str)
        return bool(m and m.group(1) == m.group(2))
    return insn.mnemonic == "mov" and insn.op_str in ("edi, edi", "esi, esi")


def boundary_reason(start, size, rva, read, waive_padding=False):
    """Why `rva` is NOT a function start inside body [start, start+size), or None.

    `waive_padding` (a verified funclet or catch) keeps the instruction-boundary
    and branch-target checks and replaces the padding rule with: the previous
    instruction is a ret or jmp."""
    insns = list(disasm().disasm(read(start, size), start))
    addrs = [i.address for i in insns]
    if rva not in addrs:
        return "it is not an instruction boundary of that body"
    for insn in insns:
        if insn.mnemonic.startswith(("j", "loop")):
            try:
                target = int(insn.op_str, 16)
            except ValueError:
                continue
            if target == rva:
                return f"it is a branch target of 0x{insn.address:08X} inside that body"
    index = addrs.index(rva)
    if waive_padding:
        # A funclet or catch is entered by the EH machinery, never by falling
        # through: every real waived row follows a ret or jmp (2026-10-13).
        if index and insns[index - 1].mnemonic in ("ret", "jmp"):
            return None
        return "the code before it falls through into it, so it is no funclet entry"
    pads = 0
    while index - pads - 1 >= 0 and is_padding(insns[index - pads - 1]):
        pads += 1
    int3s = 0
    while index - int3s - 1 >= 0 and insns[index - int3s - 1].mnemonic == "int3":
        int3s += 1
    if int3s >= MIN_PAD_RUN:
        return None
    before = insns[index - pads - 1] if index - pads - 1 >= 0 else None
    if pads and before is not None and before.mnemonic in ("ret", "jmp"):
        return None
    if not pads and before is not None and before.mnemonic in ("ret", "jmp"):
        return "it follows an internal ret/jmp with no padding (a split body)"
    return "the bytes before it are not padding after a ret/jmp"


def catch_shape(row, start, size, read):
    """The row is exactly one MSVC catch funclet: it decodes from its start to
    `mov eax, <VA inside the enclosing body>; ret` at its end, with no earlier
    ret and no jmp out of the row (which would make it span bodies)."""
    rva, length = row["rva"], row["size"]
    insns = list(disasm().disasm(read(rva, length), rva))
    if (len(insns) < 2 or insns[-1].address + insns[-1].size != rva + length
            or insns[-1].mnemonic != "ret" or insns[-1].op_str
            or insns[-2].mnemonic != "mov" or insns[-2].size != 5
            or not insns[-2].op_str.startswith("eax, 0x")):
        return False
    target = int(insns[-2].op_str[5:], 16) - IMAGE_BASE
    if not start <= target < start + size:
        return False
    for insn in insns[:-1]:
        if insn.mnemonic.startswith("ret"):
            return False
        if insn.mnemonic == "jmp":
            try:
                dest = int(insn.op_str, 16)
            except ValueError:
                return False
            if not rva <= dest < rva + length:
                return False
    return True


def check_row(row, extents, read, rows_by_name=None):
    """Refusal text for one new row, or None."""
    if row["size"] <= 0:
        return None
    waived = waived_starts(row, rows_by_name or {})
    rva, size = row["rva"], row["size"]
    where = f"{row['name']} @ 0x{rva:08X}/{size}"
    try:
        if ilt_thunk(row, read):
            return None
        for start, length, label in extents.enclosing(rva):
            waive = (None in waived or start in waived
                     or catch_shape(row, start, length, read))
            why = boundary_reason(start, length, rva, read, waive)
            if why:
                return (f"{where} starts inside {label}: {why}. Re-anchor the row "
                        "at the body's real start (tools/boundary_validator.py) or "
                        "cite boundary evidence.")
        later = extents.starts_in(rva + 1, rva + size, rows_only=True)
        if later:
            return (f"{where} runs over the matched row starting at 0x{later[0]:08X}. "
                    "One row per body.")
        body = read(rva, size)
    except ImageError as error:
        return f"{where}: cannot read the retail image to judge its extent ({error})"
    if len(body) < size:
        return f"{where}: runs past the end of its PE section"
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


def guarded(read):
    """`read` that turns a missing image or unmapped RVA into ImageError."""
    def inner(rva, count):
        try:
            return read(rva, count)
        except (OSError, ValueError) as error:
            raise ImageError(str(error)) from error
    return inner


def check(before_rows, after_rows, ghidra_sizes, read):
    """Refusals for every row `after_rows` adds, moves or re-statuses."""
    new = changed_rows(before_rows, after_rows)
    if not new:
        return []
    extents = Extents(ghidra_sizes, after_rows)
    by_name = {}
    for r in after_rows:
        by_name.setdefault(r["name"], []).append(r)
    read = guarded(read)
    return [msg for msg in (check_row(r, extents, read, by_name) for r in new) if msg]
