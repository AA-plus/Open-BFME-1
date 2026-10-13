# 0x0057A470 — BfmeAptScreenSkirmish::_bfme_updateProfileDisplay — MASM dump (codegen wall)

Landed: `game/masm_dumps/Rva0057A470UpdateProfileDisplay.asm` (5296 B, byte-verified by
`tools/add_match.py --replace-rva 0x0057A470`; row `?_bfme_updateProfileDisplay@BfmeAptScreenSkirmish@@QAEXXZ`).
Replaces the generated scaffold row `?d_0057a470@@YAXXZ` (dump `game/gen_asm/d_00576c20.asm`).

## Identity (proven)
- Three matched `BfmeAptScreenSkirmish` call sites: `0x0057BE50` (`?rva0057BE50@...UAE_NXZ`),
  `applySlotPlayerTemplate`, `initGadgets`; plus the ILT pin at `0x00030643` (four sites, four via ILT thunk).
- Retail body: `ret` at `+0x14AF`, INT3 padding at `+0x14B0` → 5296 bytes.
- ABI: `__thiscall` (ECX receiver), SEH/EH registration frame, two by-value UnicodeString
  temporaries with `mov [esp+N],esp` save slots, `ret`.

## Why not C++ (codegen wall)
The reconstructible bank `targets/game/reverse/attempts/0x0057a470.cpp` (author score 0.9581,
now cleared by landing) emits exactly 5296 B with 372 relocations and normalized shape 1.000:
the whole residue is 222 non-relocation bytes of pure stack-slot ALLOCATION, first at `+0x2E`.

Head evidence (esp = X after the prologue pushes, Eb = function-entry esp = X + 0x158):
- retail: `text` = Eb-0x140, `dash` = Eb-0x134 (`mov [esp+0x24],ebp`), fetch-temporary
  saved-esp = Eb-0x13C (`mov [esp+0x20],esp` at `+0x3D`), temp at `+0x53` `lea eax,[esp+0x28]`.
- ours:   `text` = Eb-0x140, `dash` = Eb-0x130 (`mov [esp+0x28],ebp`), saved-esp = Eb-0x134,
  temp `lea eax,[esp+0x2c]`.
So retail keeps `dash` one 4-byte slot higher while the compiler-generated saved-esp slot sits
one slot lower; the rest of the body inherits per-region deltas (+16/-4/+4/+8), i.e. several
locals misplaced by one slot each, not a single shift.

## Lever exhaustion
- 25 recorded verdicts (10 partial, 15 blocked): EH FRAME (33-trial `eh_levers`/`shape_search`
  sweep on the pinned view), member-call/callee variants for `0x009C4B0` (`ret 8` hidden-return
  `bfmeTimePlayedAM`), movie-buffer fusion `char movieBufs[2][16]` (226→222, kept).
- This session: `shape_family_levers.py` (sib,register,bool,test,copy,store,loop,branch,
  constant,frame) offered one frame choice; both shape_search trials scored 0.9581 (no change).
- Split nested fetch (`UnicodeString fetched = TheGameText->fetch(...); dash.format(fetched);`)
  exploded to 5335 B / 3519 diffs (frame 0x140); declaration-order movers (`int faction;` to top,
  `movieBufs`/`progress` to top) and text/dash swap were codegen-neutral (222→222/224).
- Conclusion: VC7.1 assigns the fetch-temporary save slot and the neighbouring locals to
  compiler-internal slots that no spellable C++ form selects. Body fully understood; dump banked.
