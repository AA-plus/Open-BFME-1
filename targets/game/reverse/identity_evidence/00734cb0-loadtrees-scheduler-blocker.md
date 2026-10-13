# 0x00734CB0 ?loadTreesInVertexAndIndexBuffers@W3DTreeBuffer - x87 scheduler blocker

Identity: landed caller ?drawTrees@W3DTreeBuffer@@ (0x00737B70 site) plus the EA
source name in W3DTreeBuffer.cpp prove this method. Boundary: RET4 at +0xCD2 then
INT3 at +0xCD5; extent 3285B; all 36 retail relocations align.

Bank targets/game/reverse/attempts/0x00734cb0.cpp: 3285/3285B, 36 relocs, 144
non-relocation differing bytes, first at +0x1AE, score 0.9562. Every remaining
difference is an instruction-order permutation with an identical instruction
multiset that converges back to identical bytes:

- +0x1AE..+0x1D7 light loop: product-1 operand order (retail `fld [esp+0x10];
  fmul [ebx-0x10]` vs bank volatile-red `fld [ebx-0x10]; fmul [esp+0x10]`) and
  product-2/3 fld/mov/fmul/store rotations (retail `fld; mov; fmul; store` vs
  bank `mov; fld; store; fmul`).
- +0x4B3 +0x4BF +0x4F3 +0x4FF +0x517 +0x521: x87 `fld st(n)` vs `fld [esp+0x24]`
  swaps inside the inlined 3x4 matrix multiply; each pair converges afterwards.

Measured alternatives: plain non-volatile red fixes +0x1AE but regresses to 151
diffs (first +0x1CE); volatile red into a local copy gives 232; volatile blue 153.
eh_levers (throw() per callee / EHsc / _STLP_NO_EXCEPTIONS / nothrow delete[]) and
shape_family_levers (sib register bool test copy store loop branch constant frame)
produced no byte improvement. No Zero Hour twin contains the BFME-only light
precompute loop. Verdict recorded in re_attempts.log (partial, blocker=
float/x87-scheduling, t=20min, model=gpt-5.2-codex).
