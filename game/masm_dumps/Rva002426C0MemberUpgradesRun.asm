.386
.model flat
; ?Rva002426C0@@YAXXZ
; Retail @ 0x002426C0 size 610
;
; MASM dump carrying a measured codegen blocker. Identity is not provable:
; tools/callers_of.py reports no named caller reaching the body directly; the
; reachable routes are unnamed (the matched gen thunk ?j_00043bd5@@YAXXZ at
; RVA 0x00043BD5 with target=0x002426C0, and the ILT window slot 54672 ->
; 0x002426C0), and no string names it; the name stays address-derived.
; ABI from decode: __thiscall
; member (ECX is the owning upgrades object whose member list lives at
; this-0xAC), two stack arguments (const 192-bit bitset reference at
; [esp+0x38] and const AsciiString *name at [esp+0x3C]), `ret 8`, SEH frame
; `push -1; push g_Va0100DE28`. The body scans the 192-bit mask, resolves
; each set bit through the TheUpgradeCenter object via ILT 0x00027174 into a
; stack vector (growth through ILT 0x00004F8E), walks the member list at
; this-0xAC calling the sibling predicate at 0x00242630 through ILT
; 0x00019579, applies the affected/give pair through ILT 0x000077B6 /
; 0x0001A97E, repeats the walk for the set<unsigned> at this+0x30 resolving
; ids through the singleton at 0x012F0898's inlined hash_map find, and
; destroys the vector through ??3 / _M_deallocate.
; The reconstructible C++ body (targets/game/reverse/attempts/0x002426c0.cpp,
; earlier bank score 0.9950819672131147) compiles to exactly 610 bytes with
; 18 relocations and shape 1.000; its whole residue is three non-relocation
; bytes at +0x121 +0x125 +0x129: the loop back-edge reloads `this` into EAX
; and the list iterator into ECX in retail, while VC7.1 emits the mirror
; (this->ECX, iterator->EAX) with the cmp operands following. The same
; expression compiles to retail's pairing in the loop-entry check at +0xB1
; of the same function, so the difference is allocator state, not spelling:
; ~45 source variants measured on 2026-10-12 all land on the identical three
; bytes -- while/for(;;)/for(cond)/do-while topologies, direct member
; spelling, _M_node compares, base-class casts, pointer/arrow accessor
; forms, inlined helper evaluation-order swaps, by-value and by-reference
; helpers, comma and parenthesized forms, iterator operator++/operator!=
; calls, const accessor views, a dummy-prefixed TU context, and /Ob1 and
; allocator flag sweeps (40 experiments in the reuse cache).
; The dump body is byte-identical to retail outside its relocation slots.
; Evidence: targets/game/reverse/identity_evidence/002426c0-masm-codegen-blocker.md

EXTERN g_Va0100DE28:BYTE
EXTERN ?j_00027174@@YAXXZ:NEAR
EXTERN ?TheUpgradeCenter@@3PAVBfmeThingND@@A:BYTE
EXTERN ?j_00004f8e@@YAXXZ:NEAR
EXTERN ?j_00019579@@YAXXZ:NEAR
EXTERN ?j_000077b6@@YAXXZ:NEAR
EXTERN ?j_0001a97e@@YAXXZ:NEAR
EXTERN ?Clock00200420@@3PAUFrame00200420@@A:BYTE
EXTERN ?_M_increment@?$_Rb_global@_N@_STL@@SAPAU_Rb_tree_node_base@2@PAU32@@Z:NEAR
EXTERN ??3@YAXPAX@Z:NEAR
EXTERN ?_M_deallocate@?$__node_alloc@$00$0A@@_STL@@CAXPAXI@Z:NEAR
_TEXT SEGMENT
public ?Rva002426C0@@YAXXZ
?Rva002426C0@@YAXXZ PROC
    db 06Ah, 0FFh, 068h
    dd g_Va0100DE28
    db 064h, 0A1h, 000h, 000h, 000h, 000h, 050h, 064h, 089h, 025h, 000h, 000h, 000h, 000h, 083h, 0ECh
    db 018h, 08Bh, 081h, 054h, 0FFh, 0FFh, 0FFh, 053h, 08Bh, 018h, 055h, 056h, 057h, 033h, 0F6h, 033h
    db 0FFh, 033h, 0EDh, 089h, 04Ch, 024h, 010h, 089h, 05Ch, 024h, 014h, 089h, 07Ch, 024h, 01Ch, 089h
    db 06Ch, 024h, 020h, 089h, 074h, 024h, 024h, 089h, 074h, 024h, 030h, 08Bh, 054h, 024h, 038h, 08Bh
    db 0CEh, 0C1h, 0E9h, 005h, 08Bh, 004h, 08Ah, 08Bh, 0CEh, 083h, 0E1h, 01Fh, 0BAh, 001h, 000h, 000h
    db 000h, 0D3h, 0E2h, 085h, 0D0h, 074h, 046h, 08Bh, 00Dh
    dd ?TheUpgradeCenter@@3PAVBfmeThingND@@A
    db 056h
    call ?j_00027174@@YAXXZ
    db 03Bh, 06Ch, 024h, 024h, 089h, 044h, 024h, 018h, 074h, 010h, 085h, 0EDh, 074h, 003h, 089h, 045h
    db 000h, 083h, 0C5h, 004h, 089h, 06Ch, 024h, 020h, 0EBh, 020h, 06Ah, 001h, 06Ah, 001h, 08Dh, 044h
    db 024h, 044h, 050h, 08Dh, 04Ch, 024h, 024h, 051h, 055h, 08Dh, 04Ch, 024h, 030h
    call ?j_00004f8e@@YAXXZ
    db 08Bh, 06Ch, 024h, 020h, 08Bh, 07Ch, 024h, 01Ch, 046h, 081h, 0FEh, 0C0h, 000h, 000h, 000h, 07Ch
    db 095h, 08Bh, 054h, 024h, 010h, 03Bh, 09Ah, 054h, 0FFh, 0FFh, 0FFh, 074h, 078h, 0EBh, 005h, 08Bh
    db 05Ch, 024h, 014h, 090h, 08Bh, 044h, 024h, 03Ch, 085h, 0C0h, 08Bh, 06Bh, 008h, 074h, 01Dh, 08Bh
    db 04Ch, 024h, 010h, 050h, 055h, 081h, 0C1h, 01Ch, 0FFh, 0FFh, 0FFh
    call ?j_00019579@@YAXXZ
    db 084h, 0C0h, 075h, 008h, 08Bh, 003h, 089h, 044h, 024h, 014h, 0EBh, 039h, 08Bh, 074h, 024h, 020h
    db 02Bh, 0F7h, 0C1h, 0FEh, 002h, 033h, 0DBh, 085h, 0F6h, 076h, 020h, 08Bh, 03Ch, 09Fh, 057h, 08Bh
    db 0CDh
    call ?j_000077b6@@YAXXZ
    db 084h, 0C0h, 074h, 008h, 057h, 08Bh, 0CDh
    call ?j_0001a97e@@YAXXZ
    db 08Bh, 07Ch, 024h, 01Ch, 043h, 03Bh, 0DEh, 072h, 0E0h, 08Bh, 04Ch, 024h, 014h, 08Bh, 011h, 089h
    db 054h, 024h, 014h, 08Bh, 044h, 024h, 010h, 08Bh, 04Ch, 024h, 014h, 03Bh, 088h, 054h, 0FFh, 0FFh
    db 0FFh, 075h, 08Ah, 08Bh, 054h, 024h, 010h, 08Bh, 042h, 030h, 08Bh, 048h, 008h, 03Bh, 0C8h, 089h
    db 04Ch, 024h, 038h, 00Fh, 084h, 0BFh, 000h, 000h, 000h, 08Bh, 044h, 024h, 038h, 08Bh, 070h, 010h
    db 085h, 0F6h, 075h, 004h, 033h, 0EDh, 0EBh, 044h, 08Bh, 00Dh
    dd ?Clock00200420@@3PAUFrame00200420@@A
    db 08Bh, 099h, 0B8h, 000h, 000h, 000h, 08Bh, 0A9h, 0B4h, 000h, 000h, 000h, 02Bh, 0DDh, 0C1h, 0FBh
    db 002h, 033h, 0D2h, 08Bh, 0C6h, 0F7h, 0F3h, 08Bh, 0CDh, 08Bh, 004h, 091h, 085h, 0C0h, 074h, 017h
    db 08Dh, 064h, 024h, 000h, 039h, 070h, 004h, 074h, 00Ah, 08Bh, 000h, 085h, 0C0h, 075h, 0F5h, 033h
    db 0EDh, 0EBh, 00Bh, 085h, 0C0h, 075h, 004h, 033h, 0EDh, 0EBh, 003h, 08Bh, 068h, 008h, 08Bh, 044h
    db 024h, 03Ch, 085h, 0C0h, 074h, 015h, 08Bh, 04Ch, 024h, 010h, 050h, 055h, 081h, 0C1h, 01Ch, 0FFh
    db 0FFh, 0FFh
    call ?j_00019579@@YAXXZ
    db 084h, 0C0h, 074h, 02Fh, 08Bh, 074h, 024h, 020h, 02Bh, 0F7h, 0C1h, 0FEh, 002h, 033h, 0DBh, 085h
    db 0F6h, 076h, 020h, 08Bh, 03Ch, 09Fh, 057h, 08Bh, 0CDh
    call ?j_000077b6@@YAXXZ
    db 084h, 0C0h, 074h, 008h, 057h, 08Bh, 0CDh
    call ?j_0001a97e@@YAXXZ
    db 08Bh, 07Ch, 024h, 01Ch, 043h, 03Bh, 0DEh, 072h, 0E0h, 08Bh, 04Ch, 024h, 038h, 051h
    call ?_M_increment@?$_Rb_global@_N@_STL@@SAPAU_Rb_tree_node_base@2@PAU32@@Z
    db 08Bh, 054h, 024h, 014h, 08Bh, 04Ah, 030h, 083h, 0C4h, 004h, 03Bh, 0C1h, 089h, 044h, 024h, 038h
    db 00Fh, 085h, 041h, 0FFh, 0FFh, 0FFh, 085h, 0FFh, 0C7h, 044h, 024h, 030h, 0FFh, 0FFh, 0FFh, 0FFh
    db 074h, 03Bh, 08Bh, 044h, 024h, 024h, 02Bh, 0C7h, 0C1h, 0F8h, 002h, 0C1h, 0E0h, 002h, 03Dh, 080h
    db 000h, 000h, 000h, 076h, 01Eh, 057h
    call ??3@YAXPAX@Z
    db 083h, 0C4h, 004h, 05Fh, 05Eh, 05Dh, 05Bh, 08Bh, 04Ch, 024h, 018h, 064h, 089h, 00Dh, 000h, 000h
    db 000h, 000h, 083h, 0C4h, 024h, 0C2h, 008h, 000h, 050h, 057h
    call ?_M_deallocate@?$__node_alloc@$00$0A@@_STL@@CAXPAXI@Z
    db 083h, 0C4h, 008h, 08Bh, 04Ch, 024h, 028h, 05Fh, 05Eh, 05Dh, 05Bh, 064h, 089h, 00Dh, 000h, 000h
    db 000h, 000h, 083h, 0C4h, 024h, 0C2h, 008h, 000h
?Rva002426C0@@YAXXZ ENDP
_TEXT ENDS
END
