# RVA 0x006ECD30: W3DDisplay slot 54

## Boundary and call contract

The retail body at RVA 0x006ECD30 ends with RET 0x18 at +0x17D,
ending at 0x006ECEB0 (384 bytes). The generated dump records this same
Ghidra function boundary. W3DDisplay vtable VA 0x0111EDD0 slot 54 (+0xD8)
and the matched W3DDisplayDrawImage.cpp caller establish the W3DDisplay
receiver and six stack arguments: Image pointer, four coordinates and color.
The source preserves the bank's witnessed +0x164 renderer pointer, Image
virtual calls at +0x18 and +0x24, and Image scalar offsets +0x0C..+0x20.

## Name correction

The earlier draft called slot 54 drawImageCore. That is a reconstruction label:
the matched wrapper calls it indirectly by slot, so its source spelling is
not a retail symbol-name witness. The published Zero Hour W3DDisplay.h only
has drawImage with different coordinate types and does not identify this
BFME-only extra slot as drawImageCore. The prior 0x006ECD30 attempt explicitly
flags the suffix as invented (re_attempts.log: gpt-6-astra texture-pointer-mask-store).
The only production ledger identity is the opaque d_006ecd30 scaffold.
Retain the evidenced W3DDisplay owner and use rva006ECD30 for its unrecovered
method identity. The exact-snapshot correction only removes this unsupported
draft label; it does not rename the existing matched wrapper or any header.

## Texture handle and direct callees

Retail loads a borrowed one-pointer handle returned by Image vtable+0x24.
It compares the pointee to renderer+0x4C, increments the new texture's low
16-bit count at +4, calls Release_Ref for the old texture, and reloads the
borrowed pointer after release. The final stores are pointer/EAX to +0x4C
then null-mask/ECX to +0x50. The native TextureBaseClass header defines this
reference contract. Independently recovered setter Rva006EB000 uses exactly
the same handle assignment and stores; see 006eb000-owning-texture-assignment.md.
The unknown handle type is address-qualified and its member has ordinary
ownership assignment, with no scheduling intrinsics or assembly.

callees.py finds Release_Ref at 0x009EB7A0, Add_Quad through ILT 0x0004183A
to 0x006E7210, and __ftol2 at 0x009F6E38. The complete 36-byte release
implementation in TextureBaseReleaseRefThunk.cpp confirms the low-word
reference count and ownership-flag/vtable+0x20 cleanup. Render2DClassAddQuad.cpp
confirms the two RectClass references and four unsigned-long colors. No pin
was added. RectClass has no native header definition in this tree (WWMath/rect.h
is TRect); its four floats retain the established Add_Quad declaration.

## Measurement

The preferred bank emits 384 bytes with 11 relocations and seven nonrelocation
differences in the texture stores. Applying the proven owning-handle assignment
closes all seven. Adopting texture.h and replacing the old numeric-address
half-scale load with 0.5f preserves all 384 bytes modulo 12 relocation operands.
Retail VA 0x0107533C is already recorded as four-byte 0.5f data. An extern-const
spelling emitted an extra x87 load; the normal literal preserves retail FMUL.
Final acceptance requires the strict scoped build, including relocation targets.
