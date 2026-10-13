# 0x00574500 ?_bfme_checkMsg@BfmeAptScreenScoreScreen@@QAEHHPAX0@Z - callee-saved rotation

Session 2026-10-13 (gpt-5.2-codex). Re-verified the banked draft: ours=1158 retail=1152,
56 relocs, 36 non-reloc diffs, first at +0x18, shape 0.994, 3 structural diffs (first +0x3c0).
Score 0.9583. The stash targets/game/reverse/attempts/0x00574500.cpp is the best artifact.

## Root cause of the 36 bytes

One callee-saved rotation, exactly consistent with
targets/game/reverse/analysis/register_mirror_experiments.md ("priority by live range across
calls; no reachable source lever for the five stuck callee-saved swaps"):

- retail: x -> EBX, y -> EDI (reloaded at +0x404), by-value temp pointers reuse EDI,
  EBP unused. Ours: x -> EDI, y -> EBP, temp pointers reuse EBP, EBX never referenced
  (14 ebx sites in retail, 0 in ours).
- Every mismatched byte is a spill of that one choice: prologue push ebx/ebp (+0x18),
  or/pop/cmp/push moves (0x13b/0x144/0x168/0x181/0x184/0x197/0x23a/0x23f/0x247/0x24d/0x24f/
  0x255/0x279/0x27a/0x2b7/0x2dc/0x377/0x383/0x389) plus the shared-tail store order
  (+0x408 m_x then m_y vs ours m_y then m_x).
- The 6 extra bytes: ours stores m_y from EBP at +0x47e before jmp; retail jmps to the
  shared m_x/m_y tail (+0x408) because EDI still holds y there.

Live ranges are identical between retail and ours (x: 0x23a-0x40e across many calls;
y: 0x23f-0x24f then reload at +0x404). No source-level length/count difference exists to tip
the allocation; the allocator simply chose a different register set.

## Mechanical levers exhausted this session

- eh_levers.py: 6 groups / 128 combinations (throw() on the four callees and slot9,
  /EHsc-, _STLP_NO_EXCEPTIONS, nothrow delete[]) -> shape_search 17 trials, no improving
  output (plateau).
- shape_family_levers.py (register,store,copy,frame,bool,test): "no applicable source-level
  family lever".
- Hand variants, all byte-identical to the 16-/36-diff baseline or worse: direct cast call,
  braces around the new/store, local manager, assignment value feeds the call (previous
  session); this session: shared __forceinline findTemplate accessor (both arms) -> 1140B /
  804 diffs (worse); shared __forceinline tooltip accessor -> does not compile against the
  current UnicodeString model.
- The 0x0024E990 landed-exception pattern (factor duplicated calls through one accessor)
  measurably makes this body worse.

## What changed before retrying a banked attempt

Nothing landed. Before another seat retries: the callee-saved set choice is upstream of every
diff; do not respell the mismatched instructions. The only untried direction recorded here is
a TU where owned/visible callees change the allocator's caller-side register needs
(tools/callee_visibility.py REPRODUCED this class of effect); every callee in the current
brief's inventory is an external thunk.
