# 0x0075CC80 render-kind update -- MASM landing with a measured codegen blocker

Target: RVA 0x0075CC80..0x0075CDD4, 340 bytes, name `?Rva0075CC80@@YAXXZ`
(address-derived placeholder). No caller or string names the body: it is a
`__thiscall` update that keeps a render object at this+0x34 and reaches the
FadeView vtable slots +0x118 (kind vector) and +0x138 (kind set), so the name
stays address-derived. Source:
`game/masm_dumps/Rva0075CC80RenderKindUpdate.asm`, derived from the gen-dump
row `?d_0075cc80@@YAXXZ` in `game/gen_asm/d_00753460.asm`.

## Body (first-hand)

- Early-out on this+0xDC and this+0xF8; requires the drawable (this+0x08) and
  the render object (this+0x34). Reads the render kind via slot +0x140, and
  splits on data+0x109 (pending) -- that arm re-evaluates 0x0075B4A0 and
  applies a pending drawable update. The main arm (kind==3 or data+0x108)
  copies the tactical view's camera vector (slot +0x118), subtracts the rope
  drawable's position (0x0004B12D), classifies the distance against
  data+0x100/+0x104 into 0/1/2, and for kind==3 calls slot +0x138 with the
  kind and writes this+0xA0/+0xA4.

## Why this lands as a MASM dump (measured)

- The reconstructible C++ body (`targets/game/reverse/attempts/0x0075cc80.cpp`,
  sha256 061c35a46a6a2adc308188fe9b0672501f5dd3e3b7690aa81150e2bbba07a908)
  compiles to exactly 340 bytes with 6 relocations and shape 1.000. Its entire
  residue is two bytes at +0x0118 and +0x011B: for the late virtual call
  (ECX = m_034) retail emits `mov edx,[ecx]; call [edx+0x138]`; VC7.1 always
  emits the vtable temporary in EAX here.
- Measured spellings (10 recorded experiments plus this session): slot-0x138
  return type int/float/bool/__int64/const void*/(void) cast (identical two
  diffs; float also breaks the shape to 342 bytes/51 diffs); member-function
  pointer; cached m_034; canonical header; dead-scope lever; kind
  initialisation and render-local orders; stores-before-call; reference and
  parenthesised receivers. This session added the documented 0x0023A380
  typed-vtable family (shape_levers.md): a `__thiscall` function-pointer slot
  is rejected by VC7.1 (C4234) and a two-argument `__fastcall` pointer moves
  the pushed stack argument into EDX (52 diffs, 341 bytes), so the family
  cannot preserve this slot's stack argument. Scratch bodies:
  `build/t3/*.cpp`.
- Blocker class: scratch-register selection (EAX vs EDX) for a single-use
  vtable temporary; both registers are dead at the site and the choice is a
  register-allocator tie-break that no source spelling perturbed without
  changing instruction bytes.
- The dump body is byte-identical to retail outside its relocation slots;
  `Vc7/bin/ml.exe` assembles the file clean (verified this session) and the
  add_match `./build.sh` gate compares it against retail with all 6 relocation
  sites resolved or masked.
