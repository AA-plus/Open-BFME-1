# 0x00177320 AI state update -- MASM landing with a measured codegen blocker

Target: RVA 0x00177320..0x00177502, 486 bytes, name `?Rva00177320@@YAXXZ`
(address-derived placeholder). No direct caller or string names the body: it is
reached only through the StateMachine virtual update dispatch. The epilogue
joins the base call `?update@AIInternalMoveToState@@UAE?AW4StateReturnType@@XZ`
(ILT 0x000488F6 to retail 0x00172E70), so the family is an
AIInternalMoveToState-derived `State::update` override (Zero Hour's
AIAttackApproachTargetState::updateInternal is the twin), but no specific name
is provable. The gen-thunk pin `?b_00177320@@YAXXZ` (symbols.csv) stays the
entry for the ILT thunk. Source: `game/masm_dumps/Rva00177320AIStateUpdate.asm`,
derived from the gen-dump row `?d_00177320@@YAXXZ` in
`game/gen_asm/d_00177320.asm`.

## Body (first-hand)

- Goal-destroyed early-out notifies the AI (virtual slot +0x204) and clears the
  victim; otherwise clears owner status bit 28. Hidden goal (status94 bit
  0x40000) or stealthed-and-undetected goal fails; a crushable goal with the
  owner predicate 0x001C7530 switches the machine to state 0xE9. A weapon in
  range succeeds unless the AI has field +0x140 and TheAI's pathfinder
  (0x003E5E40) reports false. Without a path, the goal position is cached at
  +0x54 and a 2D distance below TheAI sub-object +0x14 fields +0x90/+0x94
  succeeds. Past the CRC-desync log gate, `computePath` (virtual slot +0x44)
  false fails; otherwise the base update runs and any non-continue result is
  normalised to success.

## Why this lands as a MASM dump (measured)

- The reconstructible C++ body (`targets/game/reverse/attempts/0x00177320.cpp`,
  sha256 edfeaf47182a8bbc70b0783d0776ae717b3df3d840a31cc05037442c9091013f)
  compiles to exactly 486 bytes with 20 relocations and shape 1.000
  (instruction-identical modulo register naming, `tools/probe.py`). Its entire
  residue is three non-relocation bytes at file offsets +0x015A, +0x0179 and
  +0x017F: retail loads the TheAI+0x14 data pointer into ESI
  (`mov esi,dword ptr [edx+0x14]`) and reads both distance thresholds through
  ESI (`fld [esi+0x94]`, `fadd [esi+0x90]`); VC7.1 assigns that pointer EDI in
  this schedule.
- 40+ spellings over three sessions, all measured on the same bytes or worse:
  moving the `TheAISubB *data` declaration after the z store (26 diffs),
  between `set()` and `-=` (494-509 bytes), before the goal copy (lands in
  EBX); explicit-component coordinate arithmetic (26-34 diffs); length-local
  forms (488 bytes); `w_between_xy` (501); `w_between_yz` (494); direct member
  re-reads (26 diffs); repeated `getAI()` (499 bytes/378 diffs); inline
  accessor (492 bytes/114 diffs); reference/const/register/by-value helper,
  constructor-temporary and value-argument-helper spellings; plus the
  shape-family generator. Scratch bodies: `build/t1/*.cpp`.
- Blocker class: register allocation only (callee-saved ESI vs EDI). No C++
  spelling pins a callee-saved register, and every spelling that flips the
  pointer to ESI moves the load in the schedule or breaks the x87 set/-=
  merge, so the residue is unreachable from source.
- The dump body is byte-identical to retail outside its relocation slots;
  `Vc7/bin/ml.exe` assembles the file clean (verified this session) and the
  add_match `./build.sh` gate compares it against retail with all 20
  relocation sites resolved or masked.
