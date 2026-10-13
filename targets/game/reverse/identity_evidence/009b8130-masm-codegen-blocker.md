# 0x009B8130 — VP6 wide-filter MMX reconstruct — MASM dump (codegen wall)

Landed: `game/masm_dumps/Rva009B8130Vp6WideAccum.asm` (5572 B, byte-verified by
`tools/add_match.py --replace-rva 0x009B8130`; row `?Rva009B8130@@YAXXZ`).
Replaces the generated scaffold row `?d_009b8130@@YAXXZ` (dump `game/gen_asm/d_00968910.asm`).

## Identity
- No symbol pin is proven: `tools/callees.py` resolves 0 direct call targets for the body and
  `symbols.csv` has no entry for this RVA (earlier `?Rva009B8130Vp6Reconstruct@@...` claims were
  blocked for exactly that reason). Address-derived decorated name retained per naming rules.
- Complete body: RET at `+0x15C3`, INT3 padding after; 5572 bytes.
- ABI established by the complete `009AEEE0` caller and `009B0D60` installer: seven-argument
  `__cdecl` aligned-frame body (`ebx` = frame base; context `[ebx+8]`, plane at `ctx+0xc`,
  sourceOffset/destinationOffset/sourceStride/firstBlock/blockCount/destinationStride at
  `+0xc/+0x10/+0x14/+0x18/+0x1c/+0x20`), dispatch slot `01356E94`.
- Only relocations in the body: `g_Va012D86C0` x1, `g_Va012D86D0` x8, `g_Va012D86E0` x4,
  `?g_rva01356A9C@@3PAHA` x1 (= 14, matching the probe).

## Why not C++ (codegen wall)
The bank `targets/game/reverse/attempts/0x009b8130.cpp` (score 0.9941, cleared by landing)
emits exactly 5572 B, 14 relocations, normalized shape 0.999 with 33 non-relocation bytes
confined to the head `+0x1F..+0x4A` (edge broadcast + bounds guard):

retail: `mov edx,[eax+0xc]` (plane) / `mov eax,[0x01356A9C]` (EAX-moffs base) /
`mov eax,[eax+edx*4]` / `mov ecx,[ebx+0x1c]` (blockCount) / `mov edx,[ebx+0x18]`
(firstBlock) / 4x `mov word [ebp-0x80..],ax` / `lea eax,[edx+ecx]` / `cmp ecx,eax`.
ours:  `mov ecx,[eax+0xc]` / `mov edx,[disp32]` / `mov eax,[edx+ecx*4]` /
`mov ecx,[ebx+0x18]` ... stores ... `mov eax,[ebx+0x1c]` / `add ecx,eax` / `cmp eax,ecx`.

Everything after `+0x47` through RET is proven byte-exact (independent data binding, verdict #6).

## Lever exhaustion
- 7 recorded verdicts (4 partial, 3 blocked): donor `Rva001CA000Vp6WideAccum.cpp` (BFME 2)
  remains a structural near twin; the C++-head conversion (verdict #7) fixed the ESI/EDI
  saves at `+0x45/+0x46` but left the 33-byte head residue; 14 head spellings failed before.
- This session (identical residue for all): block swap (bounds block before broadcast),
  hoisted loads, `count`-first declaration order, `stopBlock = count + startBlock` operand
  swap, and `count`-variable elimination. The scheduling and register rotation are canonical
  in VC7.1; docs/shape_levers.md: "The two-register lea operand order is not a spelling".
