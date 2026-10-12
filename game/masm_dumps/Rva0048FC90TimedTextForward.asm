.386
.model flat
; ?Rva0048FC90@@YAXXZ
; Retail @ 0x0048FC90 size 898
;
; MASM dump carrying a measured codegen blocker. Identity is not provable: the
; only caller is the tail-forwarder at 0x0043BC10 (`mov ecx,[ecx+0x81C];
; jmp ILT 0x000198B2`), the ILT oracle CONTRADICTS the bank's address-derived
; class name, and no string names the body. ABI from decode: __thiscall
; member (ECX is the timed-text object whose clear 0x0048FA30 is virtual
; +0x10), two stack arguments (const UnicodeString& text, int seconds),
; `ret 8`, SEH frame `push -1; push g_Va010271B0`. It clears the object,
; copies the text, stamps frame/second deadlines, runs the whitespace state
; machine into the flush helpers 0x0048F8C0/0x0048FAC0, then places each line:
; x advances 1.5 font heights from 100 and elements get running offsets from
; 0x14, and the 0x0048E730 walk stacks lines from +0x18 in steps of 30.
; The reconstructible C++ body (targets/game/reverse/attempts/0x0048fc90.cpp)
; compiles to exactly 898 bytes with 33 relocations and shape 1.000; its whole
; residue is one register swap in the placement loop: retail keeps the running
; offset in EDX and the element cursor in ECX, VC7.1 always picks ECX/EDX the
; other way. Eight non-relocation bytes at +0x2CE +0x2D3 +0x2D7 +0x2D9 +0x2DC
; +0x2DF +0x2E2 survive every spelling: for_each, a named functor, an
; E790-style two-argument functor helper, member/ctor-order swaps, while and
; do/while rewrites, unsigned offsets and explicit begin/end locals (30+
; variants measured on 2026-10-12); plain loops reallocate the whole body
; (181 diffs). The dump body is byte-identical to retail outside its
; relocation slots.
; Evidence: targets/game/reverse/identity_evidence/0048fc90-masm-codegen-blocker.md

EXTERN g_Va010271B0:NEAR
EXTERN ??0?$StringBase@G@@AAE@ABV0@@Z:NEAR
EXTERN ?releaseBuffer@?$StringBase@G@@AAEXXZ:NEAR
EXTERN ?Rva00367810TheVirtualGate@@3PAVRva00367810VirtualGate@@A:BYTE
EXTERN __real@4f800000:BYTE
EXTERN g_Va010F9AA8:BYTE
EXTERN __ftol2:NEAR
EXTERN ?ClientAt012F1464@@3PAVClient0009A580@@A:BYTE
EXTERN ?Rva0048EC80TheManager@@3PAVRva0048EC80Manager@@A:BYTE
EXTERN __imp__iswspace:BYTE
EXTERN ?j_0001ad25@@YAXXZ:NEAR
EXTERN ?j_0000badc@@YAXXZ:NEAR
EXTERN ?concat@?$StringBase@G@@QAEXPBGH@Z:NEAR
EXTERN ?g_0109B46C@@3MB:BYTE
EXTERN ?j_0001d30e@@YAXXZ:NEAR
EXTERN ??3@YAXPAX@Z:NEAR
EXTERN ?_M_deallocate@?$__node_alloc@$00$0A@@_STL@@CAXPAXI@Z:NEAR
_TEXT SEGMENT
public ?Rva0048FC90@@YAXXZ
?Rva0048FC90@@YAXXZ PROC
    db 06Ah, 0FFh, 068h
    dd g_Va010271B0
    db 064h, 0A1h, 000h, 000h, 000h, 000h, 050h, 064h, 089h, 025h, 000h, 000h, 000h, 000h, 083h, 0ECh
    db 03Ch, 053h, 057h, 08Bh, 0F9h, 08Bh, 007h, 0FFh, 050h, 010h, 08Bh, 04Ch, 024h, 054h, 051h, 08Dh
    db 04Ch, 024h, 00Ch
    call ??0?$StringBase@G@@AAE@ABV0@@Z
    db 08Bh, 04Fh, 008h, 08Bh, 011h, 033h, 0DBh, 089h, 05Ch, 024h, 04Ch, 0FFh, 052h, 004h, 08Bh, 044h
    db 024h, 008h, 03Bh, 0C3h, 074h, 00Ch, 00Fh, 0B7h, 040h, 004h, 03Bh, 0C3h, 089h, 044h, 024h, 018h
    db 075h, 024h, 08Dh, 04Ch, 024h, 008h, 0C7h, 044h, 024h, 04Ch, 0FFh, 0FFh, 0FFh, 0FFh
    call ?releaseBuffer@?$StringBase@G@@AAEXXZ
    db 05Fh, 05Bh, 08Bh, 04Ch, 024h, 03Ch, 064h, 089h, 00Dh, 000h, 000h, 000h, 000h, 083h, 0C4h, 048h
    db 0C2h, 008h, 000h, 08Bh, 00Dh
    dd ?Rva00367810TheVirtualGate@@3PAVRva00367810VirtualGate@@A
    db 08Bh, 001h, 056h, 0FFh, 050h, 02Ch, 0D1h, 0E8h, 085h, 0C0h, 089h, 044h, 024h, 058h, 0DBh, 044h
    db 024h, 058h, 07Dh, 006h, 0D8h, 005h
    dd __real@4f800000
    db 08Bh, 00Dh
    dd ?Rva00367810TheVirtualGate@@3PAVRva00367810VirtualGate@@A
    db 0D9h, 05Ch, 024h, 058h, 08Bh, 011h, 0FFh, 052h, 02Ch, 085h, 0C0h, 089h, 044h, 024h, 020h, 0DBh
    db 044h, 024h, 020h, 07Dh, 006h, 0D8h, 005h
    dd __real@4f800000
    db 0D8h, 00Dh
    dd g_Va010F9AA8
    call __ftol2
    db 08Bh, 00Dh
    dd ?ClientAt012F1464@@3PAVClient0009A580@@A
    db 08Bh, 0F0h, 08Bh, 001h, 0FFh, 050h, 068h, 08Bh, 04Ch, 024h, 05Ch, 03Bh, 0CBh, 089h, 047h, 018h
    db 074h, 00Dh, 06Bh, 0C9h, 01Eh, 003h, 0C1h, 089h, 047h, 01Ch, 083h, 0C0h, 0E2h, 0EBh, 008h, 005h
    db 0C2h, 001h, 000h, 000h, 089h, 05Fh, 01Ch, 089h, 047h, 020h, 08Bh, 047h, 008h, 0C7h, 040h, 018h
    db 000h, 000h, 000h, 0FFh, 08Bh, 00Dh
    dd ?Rva0048EC80TheManager@@3PAVRva0048EC80Manager@@A
    db 08Bh, 011h, 055h, 0FFh, 052h, 024h, 08Bh, 0E8h, 03Bh, 0EBh, 089h, 06Ch, 024h, 024h, 00Fh, 084h
    db 047h, 002h, 000h, 000h, 08Bh, 047h, 008h, 08Bh, 040h, 004h, 08Bh, 055h, 000h, 050h, 08Bh, 0CDh
    db 0FFh, 052h, 018h, 089h, 05Ch, 024h, 028h, 089h, 05Ch, 024h, 02Ch, 089h, 05Ch, 024h, 030h, 0D9h
    db 044h, 024h, 05Ch, 089h, 074h, 024h, 034h
    call __ftol2
    db 089h, 044h, 024h, 038h, 08Dh, 044h, 024h, 028h, 089h, 044h, 024h, 03Ch, 089h, 06Ch, 024h, 040h
    db 089h, 05Ch, 024h, 044h, 089h, 05Ch, 024h, 048h, 033h, 0EDh, 089h, 05Ch, 024h, 060h, 08Bh, 044h
    db 024h, 010h, 03Bh, 0C3h, 0C6h, 044h, 024h, 054h, 003h, 089h, 05Ch, 024h, 018h, 0C6h, 044h, 024h
    db 05Ch, 001h, 074h, 006h, 066h, 08Bh, 070h, 008h, 0EBh, 002h, 033h, 0F6h, 0C7h, 044h, 024h, 014h
    db 008h, 000h, 000h, 000h, 08Ah, 044h, 024h, 05Ch, 084h, 0C0h, 056h, 074h, 032h, 0FFh, 015h
    dd __imp__iswspace
    db 083h, 0C4h, 004h, 085h, 0C0h, 075h, 006h, 088h, 044h, 024h, 05Ch, 0EBh, 0E4h, 066h, 083h, 0FEh
    db 020h, 075h, 003h, 045h, 0EBh, 05Bh, 066h, 083h, 0FEh, 00Ah, 075h, 055h, 08Dh, 04Ch, 024h, 034h
    db 051h, 08Bh, 0CFh
    call ?j_0001ad25@@YAXXZ
    db 033h, 0EDh, 0EBh, 045h, 0FFh, 015h
    dd __imp__iswspace
    db 083h, 0C4h, 004h, 085h, 0C0h, 074h, 024h, 08Dh, 054h, 024h, 060h, 052h, 055h, 08Dh, 044h, 024h
    db 03Ch, 050h, 08Bh, 0CFh
    call ?j_0000badc@@YAXXZ
    db 08Dh, 04Ch, 024h, 060h, 033h, 0EDh
    call ?releaseBuffer@?$StringBase@G@@AAEXXZ
    db 0C6h, 044h, 024h, 05Ch, 001h, 0EBh, 094h, 06Ah, 001h, 08Dh, 04Ch, 024h, 020h, 051h, 08Dh, 04Ch
    db 024h, 068h, 089h, 074h, 024h, 024h
    call ?concat@?$StringBase@G@@QAEXPBGH@Z
    db 08Bh, 044h, 024h, 018h, 08Bh, 054h, 024h, 014h, 08Bh, 04Ch, 024h, 020h, 040h, 083h, 0C2h, 002h
    db 03Bh, 0C1h, 089h, 044h, 024h, 018h, 089h, 054h, 024h, 014h, 07Dh, 018h, 08Bh, 044h, 024h, 010h
    db 03Bh, 0C3h, 074h, 009h, 066h, 08Bh, 034h, 002h, 0E9h, 053h, 0FFh, 0FFh, 0FFh, 033h, 0F6h, 0E9h
    db 04Ch, 0FFh, 0FFh, 0FFh, 08Ah, 044h, 024h, 05Ch, 084h, 0C0h, 075h, 012h, 08Dh, 044h, 024h, 060h
    db 050h, 055h, 08Dh, 04Ch, 024h, 03Ch, 051h, 08Bh, 0CFh
    call ?j_0000badc@@YAXXZ
    db 08Dh, 054h, 024h, 034h, 052h, 08Bh, 0CFh
    call ?j_0001ad25@@YAXXZ
    db 08Dh, 04Ch, 024h, 060h, 0C6h, 044h, 024h, 054h, 002h
    call ?releaseBuffer@?$StringBase@G@@AAEXXZ
    db 08Dh, 04Ch, 024h, 044h, 0C6h, 044h, 024h, 054h, 001h
    call ?releaseBuffer@?$StringBase@G@@AAEXXZ
    db 08Bh, 047h, 008h, 08Bh, 040h, 004h, 08Bh, 048h, 010h, 08Bh, 077h, 00Ch, 03Bh, 077h, 010h, 08Bh
    db 057h, 018h, 089h, 04Ch, 024h, 020h, 0C7h, 044h, 024h, 05Ch, 064h, 000h, 000h, 000h, 089h, 054h
    db 024h, 060h, 074h, 07Ch, 0DBh, 044h, 024h, 020h, 0D8h, 00Dh
    dd ?g_0109B46C@@3MB
    db 0D9h, 05Ch, 024h, 020h, 08Dh, 0A4h, 024h, 000h, 000h, 000h, 000h, 0DBh, 044h, 024h, 05Ch, 08Bh
    db 05Ch, 024h, 05Ch, 0D8h, 044h, 024h, 020h
    call __ftol2
    db 089h, 044h, 024h, 05Ch, 08Bh, 006h, 08Bh, 068h, 004h, 08Bh, 000h, 03Bh, 0C5h, 0BAh, 014h, 000h
    db 000h, 000h, 08Bh, 0C8h, 074h, 012h, 08Bh, 001h, 089h, 050h, 010h, 003h, 050h, 00Ch, 083h, 0C1h
    db 004h, 03Bh, 0CDh, 089h, 058h, 014h, 075h, 0EEh, 08Bh, 006h, 08Bh, 048h, 004h, 08Bh, 05Ch, 024h
    db 060h, 08Bh, 000h, 053h, 051h, 050h, 08Dh, 044h, 024h, 06Ch, 050h
    call ?j_0001d30e@@YAXXZ
    db 08Bh, 047h, 010h, 083h, 0C3h, 01Eh, 083h, 0C6h, 004h, 083h, 0C4h, 010h, 03Bh, 0F0h, 089h, 05Ch
    db 024h, 060h, 075h, 09Bh, 033h, 0DBh, 08Bh, 00Dh
    dd ?Rva0048EC80TheManager@@3PAVRva0048EC80Manager@@A
    db 08Bh, 044h, 024h, 024h, 08Bh, 011h, 050h, 0FFh, 052h, 028h, 08Bh, 04Ch, 024h, 028h, 03Bh, 0CBh
    db 0C6h, 044h, 024h, 054h, 000h, 074h, 028h, 08Bh, 044h, 024h, 030h, 02Bh, 0C1h, 0C1h, 0F8h, 002h
    db 0C1h, 0E0h, 002h, 03Dh, 080h, 000h, 000h, 000h, 076h, 00Bh, 051h
    call ??3@YAXPAX@Z
    db 083h, 0C4h, 004h, 0EBh, 00Ah, 050h, 051h
    call ?_M_deallocate@?$__node_alloc@$00$0A@@_STL@@CAXPAXI@Z
    db 083h, 0C4h, 008h, 08Dh, 04Ch, 024h, 010h, 0C7h, 044h, 024h, 054h, 0FFh, 0FFh, 0FFh, 0FFh
    call ?releaseBuffer@?$StringBase@G@@AAEXXZ
    db 08Bh, 04Ch, 024h, 04Ch, 05Dh, 05Eh, 05Fh, 05Bh, 064h, 089h, 00Dh, 000h, 000h, 000h, 000h, 083h
    db 0C4h, 048h, 0C2h, 008h, 000h
?Rva0048FC90@@YAXXZ ENDP
_TEXT ENDS
END
