# 0x009EFF50 Q1Receiver0134FAAC::refresh - re-verification bank 2026-10-13

Boundary: retail RET at +0xC71 with INT3 at +0xC72 confirms the 3186-byte
extent. Identity: the address pin `?refresh@Q1Receiver0134FAAC@@QAEXXZ` plus the
five matched callers (`m009F0BD0`/`m009F0CC0`/`m009F19E0`/`handle@Gen009F1510`
in their landed TUs) prove the member; the body repaints the receiver queues.

Re-verified this session with `tools/probe.py`: the banked body at
`targets/game/reverse/attempts/0x009eff50.cpp` compiles to exactly 3186 bytes
against retail 3186, with 39 non-relocation differing bytes, first at +0xB4C,
and normalized instruction shape 1.000 (identical instruction stream; only
[ebp+disp] field operands differ).

Residue: the six pointer-difference terms of the
`m_deques78[0..2].size()` sum inside the `pass == 0` / `pass != 0` arms that
write `m_field1e0` / `m_field1e4`. Both arms contain the same six (ptr-ptr)
terms; ours schedules them in a different order than retail in each arm
(pass 0: retail emits P4,P5,P6 where ours emits P6,P5,P4; pass 1: retail
P2,P3,P1,P6,P5,P4 where ours P3,P1,P2,P4,P5,P6). The pre-branch node-term
sums and the `lea eax,[eax+edx-3]; shl eax,5` constant fold match exactly.

Why this is not a source-order lever: retail's OWN two arms schedule the same
six terms in different orders (P1..P6 in the pass==0 arm, P2,P3,P1,P6,P5,P4 in
the pass!=0 arm), so the sequence is an artifact of the scheduler/allocator
context per branch, not of the C++ operand order. The 40 prior verdicts
(#1-#40) already exhausted operand orders, alternate groupings, named locals,
direct iterator expansion, unsigned casts and the sibling-style per-branch
forms; every non-plain form changed the 3186-byte shape, and the plain if/else
keeps this exact 39-byte residue.

Blocker: `blocker=stack-slot/codegen-order/deque-size-term-schedule` - the
commutative deque size() addends are CSE'd and re-scheduled per branch; no
C++ spelling tried to date moves the residue without breaking the 3186-byte
layout.
