.386
.model flat
; ?Rva00694570@@YAXXZ
; Retail @ 0x00694570 size 315. Address-derived identity: the scaffold row
; ?d_00694570@@YAXXZ held this address; its only caller is the landed
; stdcall wrapper at 0x00694700 (game/GameEngine/Source/Common/Rva00694700Call.cpp)
; which routes through ILT 0x000279A8 (?run@Rva00694570@@QAEXXZ). The body
; extent is 315 bytes to the RET at +0x13A, so the row keeps an
; address-derived name.
;
; MASM dump because the measured C++ bank (targets/game/reverse/attempts/0x00694570.cpp,
; sha256 2cac8cf5f908b0cdd2e3f15a26f0ba13c306240615ffa369454c04c4d139b95f,
; score 0.9905) reaches 315/315 bytes with 15 relocations and only 3
; non-relocation bytes at +0x75/+0x77/+0x7D: the STLport list-empty check
; loads the sentinel (end) into ECX and the first node (begin) into EAX,
;   +0075  mov ecx,[edi]
;   +0077  mov eax,[ecx]
;   +0079  cmp eax,ecx
;   +007B  je  <next priority>
;   +007D  mov esi,[eax+8]
; while VC7.1 C++ emits the pair transposed (end->EAX, begin->ECX,
; cmp ecx,eax) for every spelling tried. This session added ~30 shapes
; (empty()/front(), !empty(), begin()!=end() and both operand orders,
; materialised begin/end iterator locals in both definition orders,
; continue-negated guards, while+break, do-while, const list reference,
; copied m_context/status locals, local-is-begin/end pairs, /OA /Ow /Op
; /Os /Ob1 /Ob2 /Oy- /G6 /GX flag sweep) and the documented rotation
; toggles (tools/rotation_sweep.py: 4 sites; copied m_context/selected
; arguments) plus 10 prior logged experiments: none move the two loads.
; The allocation phase is set by code-generation temporaries upstream and
; no byte-visible site remains to toggle, so the three bytes are
; unreachable from VC7.1 C++.
; Relocations: the REL32 calls resolve through the pinned j_/placeholder
; names below; the DIR32 sites (SEH record, IAT imports) are symbolic.
; Evidence: targets/game/reverse/identity_evidence/00694570-masm-codegen-blocker.md
EXTERN ?_M_deallocate@?$__node_alloc@$00$0A@@_STL@@CAXPAXI@Z:NEAR
EXTERN ?j_00003c56@@YAXXZ:NEAR
EXTERN ?j_0000fdcb@@YAXXZ:NEAR
EXTERN ?j_0001902e@@YAXXZ:NEAR
EXTERN ?j_0002833f@@YAXXZ:NEAR
EXTERN ?j_000298e8@@YAXXZ:NEAR
EXTERN ?j_0004066f@@YAXXZ:NEAR
EXTERN __imp__ReleaseMutex@4:BYTE
EXTERN __imp__Sleep@4:BYTE
EXTERN __imp__WaitForSingleObject@8:BYTE
EXTERN g_Va010472E8:NEAR
_TEXT SEGMENT
public ?Rva00694570@@YAXXZ
?Rva00694570@@YAXXZ PROC
    db 06Ah, 0FFh, 068h
    dd g_Va010472E8
    db 064h, 0A1h, 000h, 000h, 000h, 000h, 050h, 064h, 089h, 025h, 000h, 000h, 000h, 000h, 083h, 0ECh
    db 014h, 057h, 08Bh, 0F9h, 08Ah, 047h, 044h, 084h, 0C0h, 089h, 07Ch, 024h, 004h, 00Fh, 085h, 0FFh
    db 000h, 000h, 000h, 053h, 055h, 056h, 08Dh, 049h, 000h, 08Dh, 04Ch, 024h, 014h, 033h, 0F6h
    call ?j_0002833f@@YAXXZ
    db 089h, 074h, 024h, 02Ch, 032h, 0DBh, 08Bh, 06Fh, 048h, 068h, 0F4h, 001h, 000h, 000h, 055h, 0C6h
    db 044h, 024h, 034h, 001h, 089h, 06Ch, 024h, 024h, 0FFh, 015h
    dd __imp__WaitForSingleObject@8
    db 03Dh, 002h, 001h, 000h, 000h, 00Fh, 084h, 07Dh, 000h, 000h, 000h, 0C6h, 044h, 024h, 020h, 001h
    db 0BBh, 002h, 000h, 000h, 000h, 083h, 0C7h, 01Ch, 085h, 0DBh, 07Ch, 064h, 08Bh, 00Fh, 08Bh, 001h
    db 03Bh, 0C1h, 074h, 054h, 08Bh, 070h, 008h, 08Bh, 046h, 034h, 085h, 0C0h, 075h, 00Ah, 08Bh, 04Ch
    db 024h, 010h, 056h
    call ?j_0001902e@@YAXXZ
    db 056h, 08Dh, 04Ch, 024h, 01Ch
    call ?j_00003c56@@YAXXZ
    db 050h, 08Dh, 04Ch, 024h, 018h, 0C6h, 044h, 024h, 030h, 002h
    call ?j_0004066f@@YAXXZ
    db 08Dh, 04Ch, 024h, 018h, 0C6h, 044h, 024h, 02Ch, 001h
    call ?j_000298e8@@YAXXZ
    db 08Bh, 007h, 08Bh, 000h, 08Bh, 008h, 08Bh, 050h, 004h, 06Ah, 00Ch, 089h, 00Ah, 050h, 089h, 051h
    db 004h
    call ?_M_deallocate@?$__node_alloc@$00$0A@@_STL@@CAXPAXI@Z
    db 083h, 0C4h, 008h, 04Bh, 083h, 0EFh, 004h, 085h, 0F6h, 074h, 098h, 08Ah, 05Ch, 024h, 020h, 08Bh
    db 07Ch, 024h, 010h, 084h, 0DBh, 0C6h, 044h, 024h, 02Ch, 000h, 074h, 00Ch, 055h, 0FFh, 015h
    dd __imp__ReleaseMutex@4
    db 0C6h, 044h, 024h, 020h, 000h, 085h, 0F6h, 074h, 008h, 056h, 08Bh, 0CFh
    call ?j_0000fdcb@@YAXXZ
    db 06Ah, 001h, 0FFh, 015h
    dd __imp__Sleep@4
    db 08Dh, 04Ch, 024h, 014h, 0C7h, 044h, 024h, 02Ch, 0FFh, 0FFh, 0FFh, 0FFh
    call ?j_000298e8@@YAXXZ
    db 08Ah, 047h, 044h, 084h, 0C0h, 00Fh, 084h, 00Ah, 0FFh, 0FFh, 0FFh, 05Eh, 05Dh, 05Bh, 08Bh, 04Ch
    db 024h, 018h, 033h, 0C0h, 05Fh, 064h, 089h, 00Dh, 000h, 000h, 000h, 000h, 083h, 0C4h, 020h, 0C3h
?Rva00694570@@YAXXZ ENDP
_TEXT ENDS
END
