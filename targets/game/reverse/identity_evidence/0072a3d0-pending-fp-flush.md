# 0072A3D0 final-Z store flush: comma-fusion refutation

## Result

Bank unchanged: targets/game/reverse/attempts/0x0072a3d0.cpp emits 2847 bytes against the
complete 2850-byte retail extent [0x0072A3D0, 0x0072AEF2), 70 relocations, 100 non-relocation
byte differences, first difference +0x354, normalized shape 0.995, measured quality 0.9628
(blocker=float/x87-final-height-store-scheduling). No production source or ledger identity
change in this run.

## Root cause, refined

Both instruction streams are identical instruction-for-instruction except the final Z store
of each of the four `if (records)` fan sites. Ours emits `fstp` after the first three argument
pushes (the three `lea`/`push` pairs for &p2, &p1, &p0, which are interleaved with the inlined
`fild`/`fmul` height scaling in both variants); retail defers the same `fstp` until after all
eight argument pushes and after `mov ecx,esi` at +0x367, immediately before `call 0x00453F99`.
Retail store pairs: +0x369 [esp+0xa4], +0x662 [esp+0x74], +0x8E5 [esp+0x98], +0xB09 [esp+0x80];
ours: +0x354 [esp+0x90], +0x64D [esp+0x60], +0x8D0 [esp+0x84], +0xB02 [esp+0x6c]. The three-byte
size shortfall equals the fstp displacement encoding growth (disp8 4 bytes vs disp32 7 bytes),
not missing code; retail's `ret 0x20` at +0xB1F is present in the emission after relocation
drift is accounted for.

The interleaving of the argument-pointer `lea`/`push` pairs with the inlined height arithmetic
is identical in both streams, and the inlined `fild`/`fmul` sequence is at the same offsets.
Only the store placement differs, i.e. this is an x87-spill/scheduler tie-break, not an
expression-shape difference in the arithmetic.

## New experiments this run (slim repro build/var/repro0.cpp, byte-identical reproduction)

1. (b) Fuse the final assignment into the &p2 argument via a comma expression
   (`(p2.Z = (float)m_map->getHeight(...) * 0.0390625f, &p2)`): `fstp [esp+0x2c]` still emitted
   after exactly the first three pushes, before the five scalar pushes. Neutral.
2. (a) Fuse the same assignment into the first (last-evaluated) `records` argument via a comma
   expression: identical instruction stream, `fstp` position unchanged. Neutral.

Combined with the prior run's trial02 (last-argument assignment) and trial04 (volatile final
store), every source-sequencing spelling of the final store reproduces the early flush. The
scheduler's choice to flush the x87 value as soon as it is computed (ours) versus at the call
boundary after all pushes (retail) is not reachable through assignment placement, temporaries,
or access qualification at this compiler revision.

## Reopen condition

A new hypothesis must explain the x87 spill-at-call decision itself (compiler context or
inlining/scheduling state), not the store's source position. Absent that, the preferred bank
stands at 0.9628.
