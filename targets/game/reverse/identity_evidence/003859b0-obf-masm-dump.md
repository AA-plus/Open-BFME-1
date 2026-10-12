# 0x003859B0 SecuROM hook-fallback -- MASM landing with a proven post-link wall

Target: RVA 0x003859B0..0x00385A87, 216 bytes, name `?Gen003859B0@@YAHHH@Z`
(two-int __cdecl fallback of the obfuscated hook-wrapper family; the name is
address-derived and already the symbols.csv callee pin).

## Identity (first-hand)

- Caller: `BFME_OBF_WRAPPER( Rva003897C0, g_Slot012BC84C, Obf003881E0,
  Gen003859B0 )` in game/GameEngine/Source/Common/BigObfHookWrappers.cpp; the
  matched wrapper row `?Rva003897C0@@YAHHH@Z` (100 B) calls this body when the
  hook slot is empty. The symbols.csv pin `?Gen003859B0@@YAHHH@Z,0x003859B0`
  fixes the ABI: six calls, cdecl, `int (int,int)`.
- Second entry: the 5-byte ILT `?j_0004904e@@YAXXZ` at 0x0004904E
  (functions.csv note `gen-thunk;target=FUN_007859b0`) jumps here.
- Sibling 0x00385AE0 (`?d_00385ae0`, still a gen-dump row) is the same 216-byte
  shape; the only structural difference is the `push 5` at +0x71 becoming
  `push 0Dh`, plus its own marker operand 0x00785AED.

## Body and boundary (first-hand)

- Retail bytes read with tools/build.py `read_target_bytes(0x3859B0, 216)`:
  plain `C3` at +0xD7, then INT3 fill up to the next ledger row at 0x00385AE0.
- Instruction shape: prologue `55 89 E5 / 83 EC 20 / 57` (GCC-style frame), six
  calls through ILT thunks, three opaque predicates, and two dead marker
  streams; the final return value is [ebp-0Ch].

## Relocations (first-hand)

- `tools/retail_relocs.py --csv` lists ZERO HIGHLOW sites in the range: every
  marker operand is a plain literal dword in the image, not a base relocation.
- The only relocated bytes are the six REL32 call sites at +0x26, +0x34, +0x44,
  +0x5D, +0x72, +0xAB targeting ILT thunks 0x00010CA3, 0x0002C7FA (x2),
  0x00008D69, 0x00049224, 0x00025716 -- all existing matched rows. The dump
  emits them symbolically (`call ?j_...`) and every other byte literally.

## Why this is a MASM dump and not C++ (measured, not asserted)

- Post-link protector rewriting is provable from the image: COFF
  characteristics 0x010F (IMAGE_FILE_RELOCS_STRIPPED), an empty base-relocation
  data directory, and the protector's nameless 7th section at RVA 0x00F62000
  (size 0xB38A3, flags 0x42000040) re-read on 2026-10-13.
- The bytes themselves: `55 89 E5` frame at +0x1 and `89 EC` teardown at +0xD4
  (VC7.1 emits `8B EC`/`8B E5`), `31 C0` zeroing at +0x4E/+0x7D/+0x8E/+0x99
  (VC7.1 emits `33 C0`), always-taken `xor eax,eax; je` opaque predicates at
  +0x7D/+0x8E/+0x99, `push eax` bracketed by five dead `mov eax,imm32` stores at
  +0x06..+0x21 and +0xB5..+0xCF, and the operand 007859BDh at +0x0E and +0xBC =
  the body's own VA 0x007859B0 + 0xD -- a value no decorated symbol can express
  (build.py resolves every DIR32 by symbol string) and no C++ statement emits.
- Measured history (targets/game/reverse/re_attempts.log, 14 verdicts
  2026-09-13..2026-09-27, models luna-7 and claude-opus-5): the best bank
  (attempts/0x003859b0.cpp, author score 0.99) matches all 216 bytes and the
  full control flow only by transcribing the body as inline `__asm`, which is an
  anti-lift violation and cannot be carried into game/; verdict "REFUTED as
  reachable by any legal TU -- the remnant is a post-link instruction stream,
  not a codegen shape". No clean spelling changes `31 C0`/`89 E5`/`89 EC`
  selection.
- Only the assembler can carry these encodings, so the body lands as
  game/masm_dumps/Rva003859B0ObfFallback.asm: 186 literal db bytes plus six
  symbolic calls, byte-identical to retail outside the six REL32 slots
  (verified by `./build.sh game/masm_dumps/Rva003859B0ObfFallback.asm`).

## Identity status

- Address-derived name kept: the wrapper comment in BigObfHookWrappers.cpp
  states identity is not recovered; no ILT-oracle name is claimed or promoted.
