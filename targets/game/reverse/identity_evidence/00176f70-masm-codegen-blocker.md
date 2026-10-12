# 0x00176F70 AIAttackMeleeApproachState::onEnter (MASM dump)

Retail 0x00176F70..0x0017838B (747 bytes), carved from the gen slab
`game/gen_asm/d_0016f340.asm` (ghidra FUN_00576f70). Identity is proven, not
address-derived: the retail vtable at VA 0x0109A6C0 routes slot +0x10 through
ILT 0x00011667 to 0x00176F70, slot 0 reaches the matched
AIAttackMeleeApproachState deleting destructor, and the matched
AttackMeleeStateMachine constructor installs that vtable
(`identity_evidence/00176f70.md`). `python3 tools/ilt_oracle.py check
'?onEnter@AIAttackMeleeApproachState@@UAE?AW4StateReturnType@@XZ' 0x11667`
prints CONFIRMED exact (p_false=7.83e-04).

Why a MASM dump: the measured C++ reconstruction
(`targets/game/reverse/attempts/0x00176f70.cpp`, sha256
101a75475f896b8f5c407858d21dee5fd77de1f2e0ca234abee5f71624a1a609) compiles to
747/747 bytes with 32 aligned relocations and shape 1.000, leaving exactly 3
non-relocation bytes from one renamed live range:

- +0x1E6 retail `mov esi,[ecx+0x14]` (8B 71 14) vs bank `mov edi,[ecx+0x14]`
  (8B 79 14);
- +0x205 retail `fld dword ptr [esi+0x94]` vs bank `fld dword ptr [edi+0x94]`;
- +0x20B retail `fadd dword ptr [esi+0x90]` vs bank `fadd dword ptr [edi+0x90]`.

Every later reference to that value stays renamed with it, so the residue is a
single allocator choice for one long live range, not a shape difference. 18
logged experiments (re_attempts.log) over local definition order, parameter
copies to locals before the guard, loop counter/CSE order and call spellings
never move a byte; the class is characterised in
`targets/game/reverse/analysis/register_mirror_experiments.md` as fixed by the
whole function's liveness, which the source cannot reach. VC7.1 offers no
spelling that selects the other register, so per the conversion gate's
codegen-blocker lane the exact bytes are kept as MASM: ml.exe assembles the 747
concrete bytes plus the carved symbolic slots and `tools/probe.py` reports
EXACT (modulo relocation slots).

Reopen as C++ only with a reconstruction compiled byte-identical, or a
detected caller resolving the ABI.
