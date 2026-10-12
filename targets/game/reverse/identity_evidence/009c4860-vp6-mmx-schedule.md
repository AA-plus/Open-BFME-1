# 0x009C4860 VP6 codec MMX block transform (MASM dump)

Target: RVA 0x009C4860..0x009C4B68; 777 bytes; name
`?Rva009C4860@@YAXPBFPAF@Z` (address-derived; no pin or caller names it).
Retail dissassembly: `python3 tools/dis_retail.py 9C4860` (237 instructions).

## Boundary and shape (first-hand)

- Complete leaf body: prologue `push edx; push ecx; push ebx` with no frame; the
  single return is `pop ebx; pop ecx; pop edx; ret` with the last byte at
  +0x308 (0x009C4B68); INT3 padding follows up to the carved body at
  0x009C4B70 (`?Rva009C4B70CpuFeatureProbe@@YAHXZ`). No call and no branch.
- Hand-scheduled MMX throughout (0F 6F/7F movq, 0F EF pxor, 0F DB pand,
  0F EB por, 0F E5 pmulhw, 0F 71/72 shifts, 0F 61/62/69/6A punpck chains,
  0F FD/F9 add/sub): qword gathers masked by the spread table, two pmulhw
  factor rounds against table words at +0x20..+0x58, punpck widening with
  psllw/psrlw-by-4 scaling, and the first-pass results are stored as eight
  qword pairs over the 128-byte in/out block at [edx+0..0x7F].
- ABI from decode: two stack arguments at [esp+0x10] (read, input) and
  [esp+0x14] (read and written, 128-byte in/out block) with a plain `ret`
  (cdecl); no receiver and no stack cleanup, so two pointer formals and a
  `@@YAX...@Z` spelling are witnessed by the body.

## Relocation (first-hand)

- `tools/retail_relocs.py` HIGHLOW sites inside [0x009C4860, 0x009C4B69):
  exactly one, site RVA 0x009C487E (body +0x1E) -> 0x01356640. That is the
  spread table read by the `lea ecx, [0x01356640]` at +0x1C, pinned in
  symbols.csv as `?Rva009B3A00Table@@3PAGA` and recorded in
  dir32_addresses.csv; the landed initializer is Rva009B3A00Table[48] in
  game/GameEngine/Source/Common/S3GuardedDelegates3.cpp. The dump carries the
  symbolic `dd ?Rva009B3A00Table@@3PAGA` at that slot.

## Why a MASM dump and not C++ (measured)

- The codec family keeps these bodies as MASM dumps with their measured
  blocker beside Rva009C3D50QuantMulWmt.asm and Rva009C80C0Idct1Wmt.asm. The
  prior bank for this exact address was a full inline `__asm` lift
  (targets/game/reverse/attempts/0x009c4860.cpp) because a clean transcription
  cannot be expressed in C++: the body is a hand-scheduled MMX kernel with a
  non-standard load/store interleave and no compiler frame, and the
  conversion gate (tools/conversion_gate.py) refuses whole-body asm lifts.
- Measured rejections of the C++/intrinsic lane in this family: the sibling
  0x009C4450 intrinsic transcription compiled to 1421 bytes with 952
  differences (re_attempts.log lines 37138, 37642); the 0x009C80C0 intrinsic
  form measured 108 bytes against retail's 98 with an aligned frame; a direct
  `__m64` transcription of this body compiled to 905 bytes with 625 differing
  bytes and 16 unmatched relocation sites (re_attempts.log line 37139).
- `tools/probe.py game/masm_dumps/Rva009C4860MmxTransform.asm
  '?Rva009C4860@@YAXPBFPAF@Z' 0x9C4860 --size 777` reports EXACT (modulo
  relocation slots), size 777/777, relocs=1.

## Identity status

- Address-derived placeholder. No ghidra boundary or caller names the body
  (`tools/callers_of.py` finds no named caller). No semantic identity claim;
  the native return contract (void) and pointer payload types are not proven,
  only the two-argument cdecl shape. The withdrawn gen_asm name
  `?d_009c4860@@YAXXZ` keeps an address-only compatibility pin.
- Artifacts: dump at game/masm_dumps/Rva009C4860MmxTransform.asm; prior bank
  at targets/game/reverse/attempts/0x009c4860.cpp; attempt history in
  targets/game/reverse/re_attempts.log lines 36876, 37139, 37389, 37520.
