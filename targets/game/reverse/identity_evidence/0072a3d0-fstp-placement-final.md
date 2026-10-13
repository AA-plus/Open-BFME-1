# d_0072A3D0 final residue: four x87 `fstp` placements (bank, score 0.9628)

RVA `0x0072A3D0`, ledger 2850 bytes, body `?rva0072A3D0@Rva0072A3D0Owner@@QAEXPAGPAMHHHH0AAH@Z`
(ret 0x20 at +0xB1F; extent and ABI in `0072a3d0-geometry-records.md`). The bank in
`targets/game/reverse/attempts/0x0072a3d0.cpp` reproduces 2847/2850 bytes, 70 relocations,
100 non-relocation diffs, first at +0x354, normalized shape 0.995.

## Exact diagnosis

A byte-aligned capstone diff of the whole body shows both streams are the same 831
instructions except the final height store (`fstp`) of each of the four `if (records)` fan
sites, plus relocation-masked constant loads. Same absolute slot in every window (esp after
the frame `sub esp,0x90` plus the four callee-save pushes is E0; all four stores land at
E0+0x74 / E0+0x50 etc. in BOTH streams):

| window | ours pos / disp | retail pos / disp | encoding |
|---|---|---|---|
| 1 | +0x354 `[esp+0x90]` (after 3 pushes) | +0x369 `[esp+0xa4]` (after 8 pushes + `mov ecx,esi`) | both disp32 |
| 2 | +0x64D `[esp+0x60]` | +0x662 `[esp+0x74]` | both disp8 |
| 3 | +0x8D0 `[esp+0x84]` | +0x8E5 `[esp+0x98]` | both disp32 |
| 4 | +0xB02 `[esp+0x6c]` | +0xB09 `[esp+0x80]` | ours disp8 (4B) vs retail disp32 (7B) |

The 3-byte size shortfall (2847 vs 2850) is exactly window 4's disp8/disp32 encoding growth;
no code is missing. Ours flushes the x87 value the moment the `fild`/`fmul` chain ends (the
store sits after the first three argument-pointer pushes); retail keeps ST0 live across the
eight pushes and flushes at the call boundary. The interleaved `lea`/`push` argument setup and
the inlined `fild`/`fmul` are at identical offsets in both streams, so this is an x87
spill/scheduler tie-break, not an expression-shape difference.

## New hypotheses this run (all neutral: 2847/2850, 100 diffs, first +0x354)

1. `b1_brace_all` - each fan triangle (p0 through the helper call) wrapped in its own `{ }`.
2. `b2_brace_p2` - `{ Vector3 p2; ...; helper->rva00729F60(..., &p2); }` scope per site.
3. `h1_emit_helper` - inline `TriangleFanEmit(helper, records, ..., p2, z)` that stores
   `p2->Z = z;` itself and then calls `rva00729F60`, with the z expression evaluated as the
   helper's last argument (the "callee stores the final component" spelling).
4. `h2_zref` - store through a `float &zref = p2.Z;` alias.

Also `shape_family_levers.py --families store,frame` generated 14 choices: 12 adjacent X/Y
store swaps (all would break the byte-identical prefix before +0x354, since ours already
matches retail there) and 2 frame-array variants for the advanceLeft/advanceRight helper
ints. No generated choice touches the x87 flush position.

## Standing conclusion

Combined with `0072a3d0-pending-fp-flush.md` (comma fusion of the assignment into the
`records` arg and into the `&p2` arg, volatile, last-argument placement) and
`0072a3d0-store-scheduling-retry.md` (declaration order, local counts, scalars, pointer
copies, per-triangle spellings), every source-sequencing spelling of the final store
reproduces the early flush. Blocker `float/x87-final-height-store-scheduling`; the pick is
compiler-internal at this compiler revision. Bank stands at 0.9628.

Reopen only with a mechanism that changes the scheduler/inlining context itself (not the
store's source position or the vector-building shape).
