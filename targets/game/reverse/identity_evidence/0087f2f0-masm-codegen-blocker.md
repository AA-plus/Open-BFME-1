# 0x0087F2F0 GeometryInfo intersection predicate (MASM dump)

Retail 0x0087F2F0..0x0087F4CF (480 bytes), carved by the gen-dump bank
`game/gen_asm/d_0087af30.asm` (`FUN_00c7f2f0`). __thiscall const member:
ECX is the GeometryInfo whose shape vector starts at +0x2C and ends at +0x30
(the same two fields the pinned ctors `??0GeometryInfo@@QAE@XZ` 0x001B3C60 and
`??0GeometryInfo@@QAE@ABV0@@Z` 0x000FFD10 use); five four-byte stack arguments
(`const Coord3D&`, float, `const GeometryInfo&`, `const Coord3D&`, float),
`ret 0x14`, result converges in AL on every path. The method name is not
recovered: the ledger pin `?bfmeIntersects@GeometryInfo@@QBE_NABUCoord3D@@MABV1@0M@Z`
is a descriptive spelling (`symbols.csv`, "direct body pin; descriptive
spelling") and is kept as the row name. The body has no ILT thunk (no 5-byte
jmp anywhere in the ILT region targets it, so the hash-window oracle is
untestable for it); its caller is the direct `call` from the Object wrapper at
0x001BE980.

Why a MASM dump: the reconstructible C++ body
(`targets/game/reverse/attempts/0x0087f2f0.cpp`) compiles to exactly 480 bytes
with 12 relocations and shape 0.993, and its whole residue is six
non-relocation bytes at +0x1BD..+0x1C4 (instructions +0x1BD and +0x1C1, 4
bytes each). At the inner-loop-exit merge (the /FAs label `$L511`) the two
allocator reloads of values spilled at entry come out in the opposite order:

    retail  +0x1BD: mov al, byte ptr [esp+0x13]    ; the result bool
    retail  +0x1C1: mov ecx, dword ptr [esp+0x14]  ; the this pointer
    ours    +0x1BD: mov ecx, dword ptr [esp+0x14]
    ours    +0x1C1: mov al, byte ptr [esp+0x13]

Both are register-allocator reloads re-established after the transform/set
calls clobber ECX and AL, feeding the next iteration's guard (AL is tested at
the 0x30 block head) and the loop bound `mov edx,[ecx+0x30]` at +0x1C5. Neither
load reads the other; the order is a scheduler/allocator tie with no
source-visible lever. Measured spellings that leave the six bytes unchanged:
while(true); early-return; guard swaps; volatile; /Oa; /Ow; postfix increment;
wrap-if; bottom checks; moved checks; local orders; set() variants (30+ across
three earlier sessions), plus this session's `const GeometryInfo& self`
re-binding and declaration-order swaps (byte-identical output) and /Ot and
dropped /Ob2 (no change). Spellings that move the residue instead reallocate
the whole body: an explicit end-pointer local (486 bytes, 408 diffs), /G7 (473
bytes, 402 diffs), /Os (415 bytes, 368 diffs), and putting the result guard
before the enabled guard (20 diffs). The six-byte allocation is thus
unreachable from source; per the conversion gate's codegen-blocker lane
(siblings `Rva0048FC90TimedTextForward.asm`, `Rva009C3630SpreadWmt.asm`,
`Rva009C3D50QuantMulWmt.asm`, `Rva009C4450Spread.asm`) the exact bytes are kept
as MASM.

The dump (`game/masm_dumps/Rva0087F2F0GeometryIntersects.asm`) assembles with
ml.exe to 480 bytes whose unmasked bytes are byte-identical to retail; its 12
relocations sit at the same offsets and kinds as the C++ bank's object:
four-byte REL32 calls at +0x52/+0x96 (`?Rva0087E900@@YAXPAURva0087E900Coord@@PBU1@PBURva0087E900Shape@@M@Z`),
+0x119/+0x129 (`?set@BfmeObjF0@@QAEPAV1@PBUBfmePosF0@@PBUBfmeShapeF0@@H@Z`),
+0x151 (`?rva00880C30@@YA_NPAURva00880D10Info@@0@Z`), +0x15E/+0x176
(`?rva00880D10@@YA_NPAURva00880D10Subject@@PAURva00880D10Info@@@Z`), +0x187
(`?bfmeSphereOverlap@@YA_NPBUBfmeCollisionShape@@0@Z`), +0x197/+0x1A3
(`?releaseBuffer@?$StringBase@D@@AAEXXZ`), and DIR32 floats at +0x9D/+0xDD
(`__real@00000000`, the 0.0f at 0x01075350).

Reopen as C++ only with a reconstruction compiled byte-identical, or a
detected caller resolving the ABI and name.
