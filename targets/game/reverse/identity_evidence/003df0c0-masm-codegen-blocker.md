# 0x003DF0C0 second Pathfinder::bfmeObjectCell overload (MASM dump)

Retail 0x003DF0C0..0x003DF19D (221 bytes), carried by the gen-dump bank
`game/gen_asm/d_003dd7a0.asm` (notes: ghidra=FUN_007df0c0). The body ends with
`ret 8` at +0xDA. The dump body is byte-identical to retail outside its 11
relocation slots (`tools/probe.py` on
`game/masm_dumps/Rva003DF0C0ObjectCell.asm`: EXACT modulo relocation slots,
221/221, 11 relocs).

## Identity

Contextual identity is strong but not provable, so the ledger row keeps the
placeholder name `?Rva003DF0C0@@YAXXZ`:

* its sibling at 0x003DEFB0 is landed as
  `?bfmeObjectCell@Pathfinder@@QAEPAVPathfindCell@@PAVObject@@@Z` (210 bytes,
  `PathfinderObjectCell.cpp`), and the caller at 0x003E5037 tests eax, so the
  221-byte body returns `PathfindCell *`;
* it shares every callee with the sibling: query thunk 0x000461FF
  (`Pathfinder::getRadiusAndCenter`, 0x003DEE30), floor import
  `__imp__floor`, layer fetch thunk 0x0003A391 (0x001BEC20) and cell call
  thunk 0x00042249 (`?getCell@Pathfinder@@QAEPAVPathfindCell@@W4PathfindLayerEnum@@HH@Z`
  alias, 0x003D4F00), reusing the two pushed cell arguments across the layer
  call;
* `tools/ilt_oracle.py check` CONTRADICTS both
  `?bfmeObjectCell@Pathfinder@@QAEPAVPathfindCell@@PAVObject@@PAUICoord2D@@@Z`
  and the void variant at this address (p_false 8.48e-04, outside slot
  59613's window 36831-36843).

## Why a MASM dump

The clean C++ reconstruction banked at
`targets/game/reverse/attempts/0x003df0c0.cpp` (sha256
c50752afb729897e237aa33ade8ee3863d52e07900f1ab5db66a5114e34387f5, score
0.99) matches the 221-byte extent, the control flow and all 11 relocations,
but holds ten non-relocation bytes:

  +0x69  retail `mov eax,[esp+10h]`   VC7.1 `mov edx,[esp+10h]`
  +0x71  retail `mov [edi],eax`       VC7.1 `mov [edi],edx`
  +0xBF  retail `mov edx,[edi]`       VC7.1 `push eax`
  +0xC0  retail `push eax`            VC7.1 `mov [edi+4],eax`
  +0xC1  retail `push edx`            VC7.1 `mov eax,[edi]`
  +0xC2  retail `mov ecx,esi`         VC7.1 `push eax`
  +0xC3  retail `mov [edi+4],eax`     VC7.1 `mov ecx,esi`

(byte offsets +0x6A +0x72 +0xBF +0xC0 +0xC1 +0xC2 +0xC4 +0xC5 +0xC6 +0xC7).
Retail sinks the cell.y store behind both argument pushes and the layer
receiver load; VC7.1 stores it right after the cell.y push, and the first
cell write uses eax instead of edx. The x87 floor step is the only remaining
difference beyond those ten bytes.

The single byte-exact C++ form needs the ZH `fast_float2long_round`
inline-asm macro for the `fld/fistp` step; the harness's shape search rejects
the bank for exactly that required inline `__asm`, and no asm-free
formulation compiles to the x87 pair. Measured formulations (this dump's
predecessors in re_attempts.log plus two more on 2026-10-13): local
definition order, post-query parameter aliases, volatile/reference/helper
spellings, direct radius assignment, explicit `cellX`, separate `cell->y`
statement, plain-call expression, layer local hoisted before the store,
split radius declaration and comma forms. The layer-local variant regresses
to 23 diffs with a different frame; every other form leaves the same ten
bytes. The 1-arg sibling reached its match precisely because it reuses one
scratch for both axes, which is the same allocator pressure that the ten
bytes expose here over ~10 prior sessions.

Reopen as C++ only with a reconstruction compiled byte-identical without
inline asm, or with independent identity evidence (a real ILT slot, string
or caller naming) that resolves the overload name.
