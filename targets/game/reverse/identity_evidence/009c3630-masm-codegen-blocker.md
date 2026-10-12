# 0x009C3630 MMX codec body (MASM dump)

Retail 0x009C3630..0x009C3CEC (1724 bytes), carved by the gen-dump bank
`game/gen_asm/d_009a7b00.asm` (notes: int3-carved, start=int3-aligned,
end=ret+int3, refs=0). Same codec spread-table family as `?Rva009C3D50` and
`?Rva009C4450`; exactly one relocation, the spread-table reference
`?Rva009B3A00Table@@3PAGA` (VA 0x01356640, `dir32_addresses.csv`).

Why a MASM dump: the retail prologue saves edx/ecx/ebx (two slots never read
again) while VC7.1 owns the EBX save for any C++ function. The measured C++
reconstruction banked at `targets/game/reverse/attempts/0x009c3630.cpp`
scores 0.9965 with exactly 6 non-reloc bytes at the entry (blocker
`toolchain/mmx-ebx-prologue-order`, logged in `re_attempts.log`), i.e. the
shape is unreachable from source. Per the conversion gate's codegen-blocker
lane (siblings `Rva009C3D50QuantMulWmt.asm`, `Rva009C4450Spread.asm`,
`Rva009C80C0Idct1Wmt.asm`) the exact bytes are kept as MASM: ml.exe assembles
1720 concrete bytes plus the one symbolic `dd`, and byte comparison masks
exactly that relocation slot.

Reopen as C++ only with a reconstruction compiled byte-identical, or a
detected caller resolving the ABI.
