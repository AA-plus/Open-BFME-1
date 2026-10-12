# 0x009C4450 codec spread-table filler -- MASM landing with a measured codegen blocker

Target: RVA 0x009C4450..0x009C4859, 1034 bytes, name `?Rva009C4450@@YAXXZ`
(address-derived placeholder pinned in symbols.csv; no Ghidra boundary or caller
names it, so the name stays address-derived).

## Body and boundary (first-hand)

- Complete leaf: 314 decoded instructions, no call, no branch of any kind
  (`tools/dis_retail.py 9C4450`). Final bytes are `pop ebx; pop ecx; pop edx; ret`
  at +0x406..+0x409; RET is the last byte at 0x009C4859, six INT3 bytes follow
  (0x009C485A..0x009C485F), and the next body starts at 0x009C4860 with the same
  `push edx/ecx/ebx` prologue (sibling filler of the same family).
- Entry does `push edx; push ecx; push ebx` with no frame; at +0x20 it is
  `lea ecx, [0x01356640]`.

## Relocations (first-hand)

- The unpacked baseline's own .reloc table (`python3 tools/retail_relocs.py --csv`)
  lists exactly one HIGHLOW site inside the range: site VA 0x00DC4472
  (= RVA 0x009C4472, body +0x22) -> 0x01356640.
- 0x01356640 is recorded in dir32_addresses.csv as `?Rva009B3A00Table@@3PAGA`.
  That table is the 16-bit codec spread table initialized by the landed
  0x009B3A00 initializer (game/GameEngine/Source/Common/S3GuardedDelegates3.cpp,
  functions.csv row 32832, `Rva009B3A00Table[48]`); this body reads it at
  [ecx+0x20]..[ecx+0x58] after zero-filling an 8x8 word block and a raw pmullw
  pass, so the operand resolves to the pinned name rather than an unrecorded
  address. The earlier `0x01356640 has no pin` note in re_attempts.log (line 57270)
  is now stale: the pin exists (dir32_addresses.csv line 6581).

## Why this is a MASM dump and not C++ (measured, not asserted)

- The closest clean source (banked: targets/game/reverse/attempts/0x009c4450.cpp)
  re-measured with `tools/probe.py` compiles to exactly 1034 bytes with exactly one
  relocation and exactly six non-relocation byte differences, at +0, +1, +2 and
  +0x406, +0x407, +0x408. Retail saves edx, ecx, ebx in that order; VC7.1 /O2 owns
  its own `push ebx` ahead of any inline __asm block that clobbers EBX, so the
  emitted order is ebx, edx, ecx and the epilogue mirrors it. probe's shape check
  normalises registers and constants and reports 1.000 -- the whole residue is
  callee-save allocation, with every instruction otherwise identical.
- There is no C++ source lever for ABI save ordering. Measured rejections recorded
  in targets/game/reverse/re_attempts.log: explicit EBX push/pop inside the source
  grows the body to 1036 bytes because the compiler still emits its own save
  (line 37462); /Od still emits the fixed save/frame, 1038 bytes with 834 diffs
  (line 37462); a clean MMX-intrinsic transcription compiles to 1421 bytes with
  952 differences (lines 37138, 37642, 57270).
- Only the assembler can own this prologue/epilogue. The body therefore lands as a
  MASM dump in game/masm_dumps/Rva009C4450Spread.asm carrying the exact retail byte
  stream and the one symbolic operand; `tools/probe.py` on that file reports
  EXACT (modulo relocation slots), relocs=1, size 1034/1034.

## Identity status

- Address-derived placeholder: symbols.csv pin `?Rva009C4450@@YAXXZ` at 0x009C4450
  ("codec spread-table loop mid-range filler (MMX tier, array1); no ghidra boundary
  or identity yet"). No ILT-oracle real-name claim is made; no name is promoted.
- Artifacts: banked C++ at targets/game/reverse/attempts/0x009c4450.cpp; attempt
  history in targets/game/reverse/re_attempts.log lines 30606, 37138, 37462, 37642,
  38135, 52267, 57270; probe caches under build/.
