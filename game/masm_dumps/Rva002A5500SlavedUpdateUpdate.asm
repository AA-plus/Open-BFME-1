.386
.model flat
; ?update@SlavedUpdate@@UAE?AW4UpdateSleepTime@@XZ
; Retail @ 0x002A5500 size 858
;
; MASM dump carrying a measured codegen blocker. Identity is proven (vtable
; 0x010C2BD4 slot 0 installed by the SlavedUpdate ctor 0x002A4260; ILT slot
; 0x0002374F thunks here; tools/ilt_oracle.py check '?update@SlavedUpdate@@UAE?AW4UpdateSleepTime@@XZ'
; 0x0002374F = CONFIRMED exact). The reconstructible C++ body
; (targets/game/reverse/attempts/0x002a5500.cpp) compiles to exactly 858 bytes
; with 31 relocations and shape 1.000 -- every instruction matches retail once
; registers and constants are normalised -- but 4 register-selection bytes
; refuse every equivalent spelling: retail loads the guard-object position
; fields x/z/y into edx/ecx/eax while VC7.1's allocator picks eax/ecx/ebp even
; though ebp (the source pointer) is dead after the third load. 25 additional
; spellings measured today (direct assignments, references, memcpy chains,
; Real/int temporaries, barrier placements, declaration orders) all land on the
; same 4 bytes at +0x280 +0x286 +0x289 +0x298; earlier waves exhausted 36 more.
; The body is byte-identical to retail outside its relocation slots.
; Evidence: targets/game/reverse/identity_evidence/002a5500-masm-codegen-blocker.md
EXTERN ?BfmeBoundaryZero3D@@3MB:BYTE
EXTERN ?Clock00200420@@3PAUFrame00200420@@A:BYTE
EXTERN ?Rva012ef4cc@@3PAVRva0041D290Client@@A:BYTE
EXTERN ?g_bfmeADL@@3MA:BYTE
EXTERN ?g_bfmeScaleBC@@3MA:BYTE
EXTERN ?j_00002680@@YAXXZ:NEAR
EXTERN ?j_00002d06@@YAXXZ:NEAR
EXTERN ?j_000053c6@@YAXXZ:NEAR
EXTERN ?j_00007761@@YAXXZ:NEAR
EXTERN ?j_00008a26@@YAXXZ:NEAR
EXTERN ?j_0000cc2a@@YAXXZ:NEAR
EXTERN ?j_0000eaed@@YAXXZ:NEAR
EXTERN ?j_000158b1@@YAXXZ:NEAR
EXTERN ?j_00017b2f@@YAXXZ:NEAR
EXTERN ?j_0001f253@@YAXXZ:NEAR
EXTERN ?j_000261a2@@YAXXZ:NEAR
EXTERN ?j_0002e7fd@@YAXXZ:NEAR
EXTERN ?j_00035e0e@@YAXXZ:NEAR
EXTERN ?j_0003a391@@YAXXZ:NEAR
EXTERN ?j_0003ff6c@@YAXXZ:NEAR
EXTERN ?j_000432b1@@YAXXZ:NEAR
EXTERN __ftol2:NEAR
EXTERN g_Va012B20E0:BYTE
_TEXT SEGMENT
public ?update@SlavedUpdate@@UAE?AW4UpdateSleepTime@@XZ
?update@SlavedUpdate@@UAE?AW4UpdateSleepTime@@XZ PROC
    db 083h, 0ECh, 020h, 056h, 08Bh, 0F1h, 08Bh, 046h, 024h, 085h, 0C0h, 07Eh, 004h, 048h, 089h, 046h
    db 024h, 08Bh, 046h, 028h, 085h, 0C0h, 075h, 012h, 08Bh, 046h, 024h, 085h, 0C0h, 00Fh, 08Fh, 05Dh
    db 001h, 000h, 000h, 0C7h, 046h, 024h, 001h, 000h, 000h, 000h, 057h, 08Bh, 07Eh, 014h, 085h, 0FFh
    db 00Fh, 084h, 049h, 001h, 000h, 000h, 08Bh, 046h, 0F4h, 053h, 08Bh, 05Eh, 0F8h, 085h, 0DBh, 089h
    db 044h, 024h, 00Ch, 089h, 05Ch, 024h, 018h, 00Fh, 084h, 031h, 001h, 000h, 000h, 08Bh, 083h, 004h
    db 002h, 000h, 000h, 085h, 0C0h, 089h, 044h, 024h, 01Ch, 00Fh, 084h, 01Fh, 001h, 000h, 000h, 08Bh
    db 088h, 0CCh, 001h, 000h, 000h, 085h, 0C9h, 00Fh, 084h, 011h, 001h, 000h, 000h, 08Bh, 046h, 030h
    db 085h, 0C0h, 074h, 020h, 08Bh, 00Dh
    dd ?Clock00200420@@3PAUFrame00200420@@A
    db 050h
    call ?j_0001f253@@YAXXZ
    db 085h, 0C0h, 074h, 009h, 0F6h, 080h, 044h, 003h, 000h, 000h, 001h, 074h, 007h, 0C7h, 046h, 030h
    db 000h, 000h, 000h, 000h, 08Bh, 00Dh
    dd ?Clock00200420@@3PAUFrame00200420@@A
    db 057h
    call ?j_0001f253@@YAXXZ
    db 08Bh, 0F8h, 085h, 0FFh, 00Fh, 084h, 09Ch, 002h, 000h, 000h, 0F6h, 087h, 044h, 003h, 000h, 000h
    db 001h, 00Fh, 085h, 08Fh, 002h, 000h, 000h, 08Bh, 083h, 03Ch, 002h, 000h, 000h, 055h, 08Bh, 0AFh
    db 03Ch, 002h, 000h, 000h, 050h, 08Bh, 0CDh
    call ?j_0000cc2a@@YAXXZ
    db 083h, 0F8h, 002h, 074h, 00Ah, 06Ah, 000h, 055h, 08Bh, 0CBh
    call ?j_00002d06@@YAXXZ
    db 08Bh, 04Ch, 024h, 010h, 08Ah, 041h, 050h, 084h, 0C0h, 074h, 00Fh, 08Bh, 0CFh
    call ?j_0003a391@@YAXXZ
    db 050h, 08Bh, 0CBh
    call ?j_00035e0e@@YAXXZ
    db 06Ah, 006h, 08Bh, 0CFh
    call ?j_0000eaed@@YAXXZ
    db 08Bh, 0AFh, 004h, 002h, 000h, 000h, 033h, 0DBh, 085h, 0EDh, 089h, 06Ch, 024h, 018h, 074h, 009h
    db 08Bh, 0CDh
    call ?j_000261a2@@YAXXZ
    db 08Bh, 0D8h, 08Bh, 04Ch, 024h, 010h, 0D9h, 041h, 030h, 0C7h, 044h, 024h, 014h, 064h, 000h, 000h
    db 000h, 0D8h, 01Dh
    dd ?BfmeBoundaryZero3D@@3MB
    db 0DFh, 0E0h, 0F6h, 0C4h, 041h, 075h, 039h, 08Bh, 0AFh, 000h, 002h, 000h, 000h, 085h, 0EDh, 074h
    db 02Bh, 08Bh, 055h, 000h, 08Bh, 0CDh, 0FFh, 052h, 010h, 0D9h, 05Ch, 024h, 014h, 08Bh, 045h, 000h
    db 08Bh, 0CDh, 0FFh, 050h, 018h, 0D8h, 07Ch, 024h, 014h, 0D8h, 00Dh
    dd ?g_bfmeScaleBC@@3MA
    call __ftol2
    db 08Bh, 04Ch, 024h, 010h, 089h, 044h, 024h, 014h, 08Bh, 06Ch, 024h, 018h, 08Bh, 054h, 024h, 014h
    db 03Bh, 051h, 034h, 07Fh, 015h, 08Dh, 04Eh, 0F0h
    call ?j_0003ff6c@@YAXXZ
    db 05Dh, 05Bh, 05Fh, 0B8h, 001h, 000h, 000h, 000h, 05Eh, 083h, 0C4h, 020h, 0C3h, 08Bh, 041h, 010h
    db 085h, 0C0h, 074h, 023h, 085h, 0DBh, 074h, 01Fh, 083h, 0C6h, 0F0h, 08Bh, 0CEh
    call ?j_000053c6@@YAXXZ
    db 053h, 08Bh, 0CEh
    call ?j_00017b2f@@YAXXZ
    db 05Dh, 05Bh, 05Fh, 0B8h, 001h, 000h, 000h, 000h, 05Eh, 083h, 0C4h, 020h, 0C3h, 08Bh, 041h, 018h
    db 085h, 0C0h, 074h, 055h, 08Bh, 085h, 040h, 001h, 000h, 000h, 085h, 0C0h, 074h, 04Bh, 0DBh, 041h
    db 008h, 08Bh, 068h, 008h, 083h, 0C5h, 00Ch, 055h, 0D8h, 00Dh
    dd ?g_bfmeADL@@3MA
    db 08Bh, 0CFh, 0D9h, 05Ch, 024h, 01Ch
    call ?j_000158b1@@YAXXZ
    db 0D9h, 044h, 024h, 018h, 0D8h, 04Ch, 024h, 018h, 0DEh, 0D9h, 0DFh, 0E0h, 0F6h, 0C4h, 005h, 07Ah
    db 01Fh, 083h, 0C6h, 0F0h, 08Bh, 0CEh
    call ?j_000053c6@@YAXXZ
    db 055h, 08Bh, 0CEh
    call ?j_00002680@@YAXXZ
    db 05Dh, 05Bh, 05Fh, 0B8h, 001h, 000h, 000h, 000h, 05Eh, 083h, 0C4h, 020h, 0C3h, 083h, 07Ch, 024h
    db 014h, 064h, 00Fh, 08Ch, 05Ah, 0FFh, 0FFh, 0FFh, 0D9h, 047h, 038h, 08Bh, 047h, 040h, 0D9h, 047h
    db 03Ch, 08Bh, 00Dh
    dd ?Rva012ef4cc@@3PAVRva0041D290Client@@A
    db 08Bh, 011h, 0D9h, 0C9h, 0D8h, 046h, 018h, 089h, 044h, 024h, 02Ch, 06Ah, 000h, 0D9h, 05Ch, 024h
    db 028h, 0D8h, 046h, 01Ch, 0D9h, 05Ch, 024h, 02Ch, 08Bh, 044h, 024h, 02Ch, 050h, 08Bh, 044h, 024h
    db 02Ch, 050h, 0FFh, 052h, 018h, 0D9h, 05Eh, 020h, 08Bh, 05Ch, 024h, 010h, 08Bh, 043h, 008h, 085h
    db 0C0h, 00Fh, 084h, 01Ch, 0FFh, 0FFh, 0FFh, 08Bh, 04Eh, 030h, 051h, 08Bh, 00Dh
    dd ?Clock00200420@@3PAUFrame00200420@@A
    call ?j_0001f253@@YAXXZ
    db 08Bh, 0E8h, 085h, 0EDh, 074h, 038h, 083h, 0C6h, 0F0h, 08Bh, 0CEh
    call ?j_000053c6@@YAXXZ
    db 08Bh, 055h, 038h, 08Bh, 04Dh, 040h, 08Bh, 045h, 03Ch, 089h, 054h, 024h, 024h, 08Dh, 054h, 024h
    db 024h, 089h, 04Ch, 024h, 02Ch, 052h, 08Bh, 0CEh, 089h, 044h, 024h, 02Ch
    call ?j_00007761@@YAXXZ
    db 05Dh, 05Bh, 05Fh, 0B8h, 001h, 000h, 000h, 000h, 05Eh, 083h, 0C4h, 020h, 0C3h, 08Bh, 04Ch, 024h
    db 020h, 08Bh, 001h, 0FFh, 090h, 080h, 001h, 000h, 000h, 084h, 0C0h, 074h, 03Eh, 08Dh, 04Ch, 024h
    db 024h, 051h, 08Bh, 04Ch, 024h, 020h
    call ?j_00008a26@@YAXXZ
    db 0D8h, 01Dh
    dd g_Va012B20E0
    db 0DFh, 0E0h, 0F6h, 0C4h, 041h, 075h, 023h, 083h, 0C6h, 0F0h, 08Bh, 0CEh
    call ?j_000053c6@@YAXXZ
    db 08Dh, 054h, 024h, 024h, 052h, 08Bh, 0CEh
    call ?j_00007761@@YAXXZ
    db 05Dh, 05Bh, 05Fh, 0B8h, 001h, 000h, 000h, 000h, 05Eh, 083h, 0C4h, 020h, 0C3h, 08Bh, 04Ch, 024h
    db 01Ch, 08Bh, 06Bh, 008h, 057h
    call ?j_0002e7fd@@YAXXZ
    db 08Bh, 0C5h, 00Fh, 0AFh, 0C5h, 089h, 044h, 024h, 020h, 0DBh, 044h, 024h, 020h, 0DEh, 0D9h, 0DFh
    db 0E0h, 0F6h, 0C4h, 005h, 00Fh, 08Ah, 05Ah, 0FEh, 0FFh, 0FFh, 083h, 0C6h, 0F0h, 08Bh, 0CEh
    call ?j_000053c6@@YAXXZ
    db 08Dh, 04Ch, 024h, 024h, 051h, 08Bh, 0CEh
    call ?j_00007761@@YAXXZ
    db 05Dh, 05Bh, 05Fh, 0B8h, 001h, 000h, 000h, 000h, 05Eh, 083h, 0C4h, 020h, 0C3h, 08Dh, 04Eh, 0F0h
    call ?j_000432b1@@YAXXZ
    db 05Bh, 05Fh, 0B8h, 001h, 000h, 000h, 000h, 05Eh, 083h, 0C4h, 020h, 0C3h
?update@SlavedUpdate@@UAE?AW4UpdateSleepTime@@XZ ENDP
_TEXT ENDS
END
