# 0x001FECD0 GettingBuiltBehavior build-loop start (MASM dump)

Retail 0x001FECD0..0x001FEF9D (718 bytes), carved from the gen slab
`game/gen_asm/d_001fecd0.asm`. Identity is address-derived and consistent: the
secondary vtable 0x010A45E0 is installed at owner+0x20, its slot +0x14 routes
through ILT 0x000015C8 to this body, and the body reads only the argument's low
byte and ends with RET 4 (718B) then INT3
(`identity_evidence/001fe970-layout-and-abi.md`).

Why a MASM dump: the measured C++ bank
(`targets/game/reverse/attempts/0x001fecd0.cpp`, sha256
09729959420f4abe824fe99501fe750911f92b0c696925bc06ead2d3622e581e) compiles to
718/718 bytes with 28 relocations and shape 0.995, leaving 5 non-relocation
bytes at +0x234/+0x238 for the `sound = *loop;` assignment
(Rva00087750Ref::operator=, relocation at +0x23A):

- +0x234 retail `lea ecx,[esp+0x10]` (receiver) BEFORE `push eax` (source);
- +0x238 retail `push eax`, while VC7.1 emits `push eax` first and then
  `lea ecx,[esp+0x14]`.

Every natural spelling emits the source push before the receiver lea. This
session's eight-variant batch (receiver pointer local and receiver reference
local bound before and inside the guard, source reference bound before the
guard, ref-returning __forceinline helper, `(&sound)->operator=`, assignment-
as-value guard, bool-valued inner guard, declaration hoists) held the same five
bytes, as did 16+ earlier logged experiments (copy-init, explicit and scoped
base calls, base-cast lhs, loop by reference or const, yoda guard, pointer-lhs
aliases, decl-then-assign, type-view casts). Only spellings that restructure
the body break everything (copy-init 721B/196 diffs; named-locals inline asm
forces an EBP frame, 691B/561 diffs), so no source reaches this scheduling
choice. The exact bytes stay a machine dump: the carved dump assembles to 718
bytes and `tools/probe.py` reports EXACT (modulo relocation slots).

Reopen as C++ only with a reconstruction compiled byte-identical, or a
detected caller resolving the ABI.
