# 0x005625C0 AptOptions::InitGadgets -- two coupled stack-slot swaps

Identity is already proven: the Options constructor at 0x00563370 registers the
selector "AptOptions::InitGadgets" (literal 0x005636AF) with ILT thunk
0x0002B33C, and retail returns at +0xAEA with INT3 at +0xAED (2797 bytes).
The bank `targets/game/reverse/attempts/0x005625c0.cpp` reproduces the extent
exactly: 2797 bytes, 158 relocations, 12 non-relocation byte differences, first
at +0x35, instruction shape 1.000 (register/stack-slot allocation only).

## The 12 bytes are two object moves, 12 sites

Probe evidence (retail displacement / ours, per site):

- group A, `UnicodeString text` (4 sites): +0x35 0x5C/0x10, +0x3D2 0x68/0x1C,
  +0x3E2 0x64/0x18, +0xACF 0x5C/0x10 -- all four are `&text` sites (the /FAsc
  listing labels every one `_text$`, the apparent offset changes are the pushes
  in flight, not different slots).
- group B, `int storedHeight` (4 sites): +0x307 0x10/0x5C, +0x322 0x10/0x5C,
  +0x34F 0x10/0x5C, +0x41D 0x10/0x5C.
- group C, `OptionPreferences *prefs` vs the getIPstring sret temp `$T1033`
  (4 sites): +0x862 0x2C/0x28, +0x8A3 0x28/0x2C, +0x8BE 0x28/0x2C,
  +0x930 0x2C/0x28.

## /FAsc frame table (this build) and what retail wants

`/FAsc` table of the bank: `_text$ = -64`; `_storedHeight$ = 16` (the same
offset number as `_window$ = 16`, i.e. the dead incoming window slot);
`_prefs$872 = -40` (shared with `_selected$778 = -40`); `$T1033 = -36` (shared
with `_stored$770 = -36`).

Retail is the exact reverse on both pairs: text lives in the dead window
argument slot (its ctor store land +0x35 and dtor land +0xACF move there) and
storedHeight takes the -64 frame slot; `prefs` reuses the slot freed by the
Resolution AsciiString and `$T1033` reuses the slot freed by the Resolution
selected index.

## This session's new measurements (all worse or inert)

- `tools/eh_levers.py` -> 5 groups / 32 combinations; `shape_search.py`
  (21 trials, plateau 20): no improving output, best unchanged 0.99571. The
  EH flag surface cannot reach a stack-displacement residue.
- v1 (move `int storedHeight;` into the Resolution block, block-scoped):
  2797 bytes but 16 diffs. Group A/B unchanged -- storedHeight keeps offset 16
  even block-scoped -- and the move knocks `address`/`$T1034`/`$T` off retail
  (+0x8B0 0x1C->0x60, +0x8CF 0x20->0x64, +0x981 0x18->0x5C).
- v2 (wrap text + storedHeight declarations and the whole if/else chain in one
  outer block): identical 12, byte for byte.
- v3 (named `AsciiString ipText = ip->getIPstring();` before
  `address.translate( ipText )`): 2795 bytes, 524 diffs, shape 0.991 -- worse;
  v4 (v1+v3): same 524.
- `register int storedHeight` and `long storedHeight`: inert (12).

Conclusion: both swaps are allocator-internal and cannot be steered from
source. They are invariant under declaration order (verdict #47), scope nesting
(v1/v2 above), type/register spelling, and the EH-flag lever surface. The
frontier is a paired slot-allocation order, not a code shape.
blocker=stack-slot/local-slot-assignment.
