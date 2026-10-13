# Session evidence 2026-10-13 (agentloop3 seat)

Fresh reprobe of the preferred bank `?rva00375650@CastleBehavior@@QAEXPAVObject@@@Z`
(0x00375650, 747 bytes): ours 747 / retail 747, 25 relocation slots,
108 non-relocation differing bytes, first at +0xF6. Shape 0.980; five
structural differences, first retail +0x1CB.

## Dominant residue: them/ai ESI/EDI mirror

Retail holds the walked `Object *them` in EDI and the fetched
`AIUpdateInterface *ai` in ESI; the bank holds them in ESI / EDI. The whole
loop between +0xF6 and +0x1AF is a pure register-name mirror (u-loop),
consistent with `analysis/allocation_residue.md`'s callee-saved class.

New experiments this session (all retained sources under build/w3d375/):

- `e1_ai_decl_early.cpp` (declare `ai` before the loop): 108 diffs, no move.
- `e3_all_early.cpp` (also declare `result` before the loop): 108 diffs.
- `e2_for_loop.cpp` (conditional -> for form): 788 bytes, worse.
- `x1_final_override_visible.cpp` (visible `Overridable::getFinalOverride`
  body, the 00372E40 visibility lever): body inlined, 794 bytes, rejected.
- `x2_template_noninline.cpp` (non-inline `Thing::getTemplate`): 108 diffs.
- `v8/v3` style dispatch locals/refs on the other target's lever set: no move.

## x87 head: retail hoists the y load above the x computation

Retail +0x1BD..+0x1D5: `fld [edi+0x3c]` (them.y), store dir.z=0,
`fld [edi+0x38]` (them.x), `fsub [ebp+0x38]`, `fstp [esp+0xc]`,
`fsub [ebp+0x3c]`, `fst [esp+0x10]` -- x is computed first, and the y
load is hoisted above it so no FXCH is needed.

Bank: `fld [esi+0x38]`, store dir.z=0, `fld [esi+3c]`, `fxch st(1)`,
`fsub [ebp+38]`, `fstp [esp+0xc]`, ... -- an extra FXCH (2 bytes recovered
later in the tail).

`y1_swap_sub.cpp` (swap the two `dir.x -=`/`dir.y -=` statements, copy form):
745 bytes, 189 diffs -- the source order then drives the subtract order
(fsub y first), so the retail source is x-first; the missing piece is only
the y-load hoist. `s2/s3/s4` (separate component assignments, no Coord3D
copy): 745-749 bytes, 189-243 diffs; s3 removes the FXCH and matches the
subtract order but still loads x before y and shifts the frame tail.

No spelling found that reproduces the hoisted y load from an x-first
source; this is the same emitter-order class as the 0x00215E50 residue.
No production source, pin or ledger row changed for this body.
