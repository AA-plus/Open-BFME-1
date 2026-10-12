# 0x00893F10 vector-insert helper (MASM dump)

Retail 0x00893F10..0x008940C9 (457 bytes), carved by the gen-dump bank
`game/gen_asm/d_0088a430.asm` (notes: gen-dump, ghidra=FUN_00c93f10; the body
decodes as a complete 12-byte-argument `__thiscall` with `ret 0Ch` at +0x1C6).
The caller `?insert@Rva00894120Vector@@...` at 0x00894120 names this body
through a relocation, so the address-derived class name is
`?helper@Rva00894120Vector@@QAEXPAX00@Z`; the ILT oracle has no slot for it
(UNTESTABLE), so the pinned row keeps the placeholder name
`?Rva00893F10@@YAXXZ` (game/masm_dumps/Rva00893F10VectorHelper.asm).

Why a MASM dump: the measured C++ reconstruction banked at
`targets/game/reverse/attempts/0x00893f10.cpp` (sha256
bd716f0c98a568e30ac793597c4fff6540e6fae8c32418dde0333d50c4d3e7b8) compiles
457 bytes with 20 relocations and shape 1.000, and its whole residue is one
register-allocation tie-break in the recursive tail call:

  +0x197 retail `mov edx,[esp+30h]`  VC7.1 `mov ecx,[esp+30h]`
  +0x19E retail `lea ecx,[esp+34h]`  VC7.1 `lea edx,[esp+34h]`
  +0x1A2 retail `push ecx`           VC7.1 `push edx`
  +0x1AB retail `push edx`           VC7.1 `push ecx`

Both webs are single-use (the volatile reload of the incoming last-argument
slot, and the address of the insert temp handed to the recursive call) and
ECX/EDX are the last two free registers after the resize call; 250+ spellings
across several sessions (ref/const/volatile/register qualifiers, scoped
blocks, named address and item locals, definition-order swaps, decoy locals,
casts, this->, inline cdecl/fastcall recursive wrappers, inline size()/begin()
accessors that reallocate the body) never flip it, and naming the temp only
moves the residue to a second mirrored class (+0x197/+0x1A7 exchanging
[esp+2Ch]/[esp+30h]). This is the conversion gate's codegen-blocker lane,
siblings `Rva009C3630SpreadWmt.asm`, `Rva009C3D50QuantMulWmt.asm`,
`Rva0048FC90TimedTextForward.asm`.

The dump body is byte-identical to retail outside its 14 relocation slots
(probe EXACT; ml.exe assembles it and `./build.sh` verifies the row live).

Reopen as C++ only with a reconstruction compiled byte-identical, or with new
identity evidence fixing the class context that schedules the two webs.
