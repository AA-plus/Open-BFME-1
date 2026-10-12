# 0x009C3D50 MMX block transform (MASM dump)

Retail 0x009C3D50..0x009C4441 (1777 bytes), carved by the gen-dump bank
`game/gen_asm/d_009a7b00.asm` (notes: int3-carved, start=int3-aligned,
end=ret+int3, refs=0). Leaf: push edx/ecx/ebx, pop ebx/ecx/edx, ret at
0x009C4440, then INT3 up to the next carved body at 0x009C4450. No caller or
string names the body, so the symbol stays address-derived:
`?Rva009C3D50@@YAXPBF0PAF@Z`.

Shape: 8x8 coefficient/quantizer multiply pass (pmullw over 128 words), two
pmulhw + paddsw/psubsw butterfly rounds seeded from the spread table
`?Rva009B3A00Table@@3PAGA` at VA 0x01356640 (recorded with that pair in
`targets/game/reverse/dir32_addresses.csv`; the same table is read by
`S3GuardedDelegates3.cpp`), eight psraw-4 scaling stages, then movq stores
back over the quant block. Exactly one relocation: the lea at +0x2C.

Why a MASM dump: the verified landing source was an entire-body naked `__asm`
lift, which `tools/conversion_gate.py` refuses under `game/` (a lift is not a
conversion). No C++ or intrinsic reconstruction has been measured to
reproduce this exact schedule; the codec family keeps such bodies in
`game/masm_dumps/` beside their blocker, matching the sibling
`Rva009C80C0Idct1Wmt.asm` whose header records the measured 108-vs-98
rejection of its intrinsic form. The dump assembles with ml.exe to 1773
concrete bytes plus one symbolic `dd` to the table; byte comparison against
retail masks exactly that relocation slot.

Reopen as C++ only with an intrinsic reconstruction compiled byte-identical,
or with a detected caller resolving the ABI (native return / formal count).
