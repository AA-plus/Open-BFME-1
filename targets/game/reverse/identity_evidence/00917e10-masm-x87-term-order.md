# 0x00917E10 MASM dump evidence — x87 term-order blocker

Row: `?Rva00917E10@@YAXXZ`, 0x00917E10, 952 bytes, source
`game/masm_dumps/Rva00917E10PointGroupVolume.asm`, converted from the
`?d_00917e10@@YAXXZ` gen-dump row (game/gen_asm/d_0090e910.asm).

## Boundary and identity

- 952-byte extent: final `ret 12` at +0x3B5, then eight `INT3` bytes up to the
  next body at 0x009181D0. Ghidra FUN_00d17e10 and the carved boundary agree.
- The receiver (ECX -> ESI) is passed as `this` to the matched members
  `?prepare_shader@PointGroupClass@@QAEXXZ`,
  `?Render@PointGroupClass@@QAEXAAVRenderInfoClass@@H@Z`,
  `?rva00917920@PointGroupClass@@...`, `?rva00912880@PointGroupClass@@...`,
  `?rva00916CD0@PointGroupClass@@...` and `?rva00913AF0@PointGroupClass@@...`,
  and `[esi+0x30]` is tested as the PointGroup flags word, so the class is
  PointGroupClass. No source names the member, so the row keeps an
  address-derived name.
- A 0x005F31A0-side caller TU (bank, one SIB byte from landing) declares the
  same address as `?method@Rva00917E10@@QAEXAAVRenderInfoClass@@IH@Z` with
  ret 12; the signature is consistent with retail: arg1 (RenderInfoClass&) is
  forwarded to the matched PointGroupClass::Render, arg2 is a count clamped
  to 0x10, and three dwords are popped.

## Why MASM: the measured wall

The recoverable C++ bank `targets/game/reverse/attempts/0x00917e10.cpp`
compiles to exactly 952 bytes with 31 relocations and instruction shape 1.000
(registers/constants normalised). Twelve x87 operand bytes remain, all in the
transformed Y and Z dot products; the same three-term sum is evaluated with a
different term order (retail's schedule vs VC7.1's schedule of the same scalar
expression):

    offset  retail  ours   retail instruction      ours instruction
    +0x2D6  48      4C     fld [esp+48]            fld [esp+4c]
    +0x2D8  CA      C9     fmul st(2)              fmul st(1)
    +0x2DC  4C      44     fld [esp+4c]            fld [esp+44]
    +0x2DE  CA      CC     fmul st(2)              fmul st(4)
    +0x2E4  44      48     fld [esp+44]            fld [esp+48]
    +0x2E6  CC      CB     fmul st(4)              fmul st(3)
    +0x2F7  58      5C     fld [esp+58]            fld [esp+5c]
    +0x2F9  CA      C9     fmul st(2)              fmul st(1)
    +0x2FD  5C      54     fld [esp+5c]            fld [esp+54]
    +0x2FF  CA      CC     fmul st(2)              fmul st(4)
    +0x305  54      58     fld [esp+54]            fld [esp+58]
    +0x307  CC      CB     fmul st(4)              fmul st(3)

The X row (+0x2B2..+0x2ED) is byte-identical; only the Y/Z rows choose the
4c/44/48 and 5c/54/58 load order. The `faddp st(1)`/`fadd [esp+50]` tail and
the `fstp [esp+90]` store match either way, so no dataflow change can move
these bytes without also changing the association VC7.1 picks.

Measured formulations that all leave the same twelve bytes (score
0.9873949579831933 = (952-12)/952):

- all 36 combinations of the component scale order and store order;
- 8 multiplication-operand commutations;
- 7 result-lifetime / unused-W variants (separate locals, reused temp,
  homogeneous Vector4 local with W=1);
- explicit Y-Z-X matrix expression (951 bytes, 279 non-reloc diffs);
- canonical `Matrix4::Transform_Vector` overloads (948-951 bytes);
- strict-float inline helper and narrow-volatile matrix load;
- Vector3::Set form (967 bytes, frame 0x98, 459 non-reloc diffs).

51 trials are recorded in the experiment store and in re_attempts.log verdicts
for this RVA under blocker `float/x87-term-order`. No C++ spelling of the same
scalar sum reaches VC7.1's x87 stack schedule; the body is therefore banked as
a MASM dump per AGENTS.md's codegen-blocker lane.

## Byte identity

The dump body is the verbatim symbolic lift of the gen-dump bytes
(`db` literals, every reference site symbolic: calls to the matched callees
and `dd` for the recorded globals/`dir32_addresses.csv` names). It is
byte-identical to retail outside its relocation slots; the landing
verification (`./build.sh game/masm_dumps/Rva00917E10PointGroupVolume.asm`)
reports Functions: OK. No literal image address is authored in the source.

Probe log: `build/probe00917e10.txt` (12 non-reloc diffs, first at +0x2D6,
shape 1.000).
