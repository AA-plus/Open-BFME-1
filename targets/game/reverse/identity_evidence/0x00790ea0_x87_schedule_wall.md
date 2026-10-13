# 0x00790EA0 ?W3DGadgetHorizontalSliderImageDraw — x87 scheduler tie (banked partial 699B, score 0.9828)

Target: `?W3DGadgetHorizontalSliderImageDraw@@YAXPAVGameWindow@@PAVWinInstanceData@@@Z`
RVA 0x00790EA0, size 699. Row: gen-dump (functions.csv). Extent: RET at +0x2BA, helpers/caller
(0x00791710 ?bfmeSubmit) confirm the carved boundary. Donor: Open BFME 2
`Code/GameEngineDevice/Source/W3DDevice/GameClient/GUI/Gadget/W3DHorizontalSlider.cpp`
(game.dat 0x000A1747, 603-byte changed body).

## Fresh reproduction (2026-10-13, this session)

`python3 tools/probe.py targets/game/reverse/attempts/0x00790ea0.cpp "<mangled>" 0x00790EA0`

- size ours=699 retail=699; relocs=20; 12 non-reloc differing bytes, first at +0x100.
- shape 0.991 of instructions match after register/constant normalisation; 4 structural differences.

Residue is two swapped-adjacent pairs, both pure list-scheduler fill slots:

| site | retail | ours |
|---|---|---|
| +0x100..+0x106 | `mov ecx,[edi+4]` then `fild [esp+0x18]` | `fild [esp+0x18]` then `mov ecx,[edi+4]` |
| +0x119..+0x11D | `lea ebp,[ebx+esi]` then `fdivp st(1)` | `fdivp st(1)` then `lea ebp,[ebx+esi]` |

Both halves of each pair are independent, scheduler-ready ops. Retail interleaves the integer
load of SliderData::maxVal (+4) and the hoisted loop-bound `origin.x + size.x` ahead of the x87
instructions; ours runs the x87 chain back-to-back. No instruction/value/target differs — only
slot placement.

## Variants tried (all hold the same 12 bytes)

This session (scratch under build/w6c/): int numerator/denominator delta locals; interleaved
declarations; maxVal local; reordered start/end stores; donor single-expression division
(V7_00790ea0.cpp -> 152 diffs, much worse); position/minVal/maxVal locals; split declarations.

Earlier sessions (re_attempts.log rows 58687, 58847, 61058): empty ICoord2D constructors improved
the bank 22 -> 12 diffs; six move-store orders; denominator-first; minVal local; int range/offs
forms; shape_family_levers 9 choices through shape_search -> 12 or 18..406 worse.

## Verdict

blocker=regalloc/x87-scheduling. The residue is a scheduler tie-break in MSVC 7.1, not reachable
from statement spelling, type spelling or store order. Bank preserved:
`targets/game/reverse/attempts/0x00790ea0.cpp` (699B, 0.9828). Reopen only with a new
allocator/scheduler model that explains both slot swaps together.
