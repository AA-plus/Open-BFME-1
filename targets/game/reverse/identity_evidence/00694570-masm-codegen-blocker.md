# 0x00694570 audio-worker run body (MASM dump)

Retail 0x00694570..0x0069459B (315 bytes), carved by the gen-dump bank
`game/gen_asm/d_00693e20.asm` (row `?d_00694570@@YAXXZ,matched,gen-dump;ghidra=FUN_00a94570`).

Identity is address-derived. The only caller is the landed stdcall wrapper at
0x00694700 (`?rva00694700@@YGXPAVRva00694570@@@Z`,
game/GameEngine/Source/Common/Rva00694700Call.cpp) which reaches this body
through ILT slot 0x000279A8 (j-thunk `?j_000279a8@@YAXXZ`, target=FUN_00a94570).
The symbols.csv name at that slot (`?run@Rva00694570@@QAEXXZ`) is the repo's own
placeholder for the thunk, not independently proven, so the ledger row keeps the
address-derived name `?Rva00694570@@YAXXZ` (same convention as
`?Rva0048FC90@@YAXXZ`, `?Rva009C3630@@YAXXZ`). The body extent is 315 bytes to
the RET at +0x13A (SEH-framed worker loop: mutex-timed wait, list walk, work
item dispatch, Sleep(1) retry, deallocate + dtor unwind).

Why a MASM dump: the measured C++ reconstruction banked at
`targets/game/reverse/attempts/0x00694570.cpp` (sha256
2cac8cf5f908b0cdd2e3f15a26f0ba13c306240615ffa369454c04c4d139b95f, score
0.9905) compiles to exactly 315 bytes with 15 relocations and 3 non-relocation
bytes at +0x75/+0x77/+0x7D. Retail's list-empty check loads the sentinel (end)
into ECX and the first node (begin) into EAX:

    +0075  mov ecx,[edi]
    +0077  mov eax,[ecx]
    +0079  cmp eax,ecx
    +007B  je   <next priority>
    +007D  mov esi,[eax+8]

while VC7.1 C++ emits the pair transposed (end->EAX, begin->ECX, cmp ecx,eax)
for every spelling measured. Shapes tried: empty()/front(); !empty();
begin()!=end() and both operand orders; materialised begin/end iterator locals
in both definition orders; continue-negated guards; while+break; do/while;
const list reference; copied m_context/status locals; local-is-begin/end pairs;
`status=` local; selected/handle reorder; the documented rotation toggles
(tools/rotation_sweep.py, 4 sites); upstream dummy-time inserts (fold away, the
phase pointer is immobile); compiler flags /OA /Ow /Op /Os /Ob1 /Ob2 /Oy- /G6
/GX. Plus 10 prior logged experiments. None move the two loads. The allocation
phase is set by code-generation temporaries upstream and no byte-visible site
remains to toggle, so the three bytes are unreachable from VC7.1 C++.

The dump body is byte-identical to retail outside its relocation slots: the
REL32 call sites resolve through the pinned j_/placeholder EXTERN names listed
in the dump, and the DIR32 sites (SEH scope record, IAT imports) are symbolic.

Reopen as C++ only with a reconstruction compiled byte-identical, or a
detected caller resolving the ABI.
