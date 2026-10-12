.386
.model flat
; ?Rva00177320@@YAXXZ
; Retail @ 0x00177320 size 486
;
; MASM dump carrying a measured codegen blocker. Identity is not provable:
; no direct caller or string names the body (reached only through the
; StateMachine virtual update dispatch), but the epilogue joins the base
; call ?update@AIInternalMoveToState@@UAE?AW4StateReturnType@@XZ, so the
; family is an AIInternalMoveToState-derived State::update override (Zero
; Hour's AIAttackApproachTargetState::updateInternal is the twin). The name
; stays address-derived.
;
; The reconstructible C++ body (targets/game/reverse/attempts/0x00177320.cpp,
; sha256 edfeaf47182a8bbc70b0783d0776ae717b3df3d840a31cc05037442c9091013f)
; compiles to exactly 486 bytes with 20 relocations and shape 1.000
; (instruction-identical modulo register naming) with an entire residue of
; three register bytes at +0x015A +0x0179 +0x017F: retail loads the TheAI+0x14
; data pointer into ESI and reads both distance thresholds through ESI;
; VC7.1 assigns that pointer EDI in this schedule. Every spelling that flips
; the pointer to ESI moves the load in the schedule (declaration after the z
; store: 26 diffs; between set() and -=: 494-509 bytes; before the goal copy:
; EBX; explicit-component coordinates: 26-34 diffs; length-local forms: 488
; bytes; w_between_xy: 501; w_between_yz: 494) or breaks the x87 set/-= merge.
; Direct member re-reads (26 diffs), repeated getAI (499 bytes/378 diffs),
; inline accessor (492 bytes/114 diffs), reference/const/register/by-value
; helper/constructor-temporary/value-argument-helper spellings and the
; shape-family generator all measured equal or worse; 40+ spellings over
; three sessions (blocker=regalloc/callee-saved). No C++ spelling pins a
; callee-saved register, and the dump body is byte-identical to retail
; outside its relocation slots.
; Evidence: targets/game/reverse/identity_evidence/00177320-masm-codegen-blocker.md
EXTERN ?j_00003b1b@@YAXXZ:NEAR
EXTERN ?j_0000432c@@YAXXZ:NEAR
EXTERN ?j_0000e570@@YAXXZ:NEAR
EXTERN ?j_00016199@@YAXXZ:NEAR
EXTERN ?j_00020824@@YAXXZ:NEAR
EXTERN ?j_0002e85c@@YAXXZ:NEAR
EXTERN ?j_0002fe0f@@YAXXZ:NEAR
EXTERN ?j_000307e7@@YAXXZ:NEAR
EXTERN ?j_00031a7f@@YAXXZ:NEAR
EXTERN ?j_00036089@@YAXXZ:NEAR
EXTERN ?j_0003a17a@@YAXXZ:NEAR
EXTERN ?j_000420aa@@YAXXZ:NEAR
EXTERN ?j_0004ab4c@@YAXXZ:NEAR
EXTERN ?update@AIInternalMoveToState@@UAE?AW4StateReturnType@@XZ:NEAR
EXTERN ?Glo012F0239@@3_NA:BYTE
EXTERN ?Rva012ef214@@3PAVRva0041D290Manager@@A:BYTE
EXTERN ?TheCRCParameterCheck@@3PAVCRCParameterCheck@@A:BYTE
EXTERN g_Va01099604:BYTE
_TEXT SEGMENT
public ?Rva00177320@@YAXXZ
?Rva00177320@@YAXXZ PROC
    db 083h, 0ECh, 010h, 055h, 08Bh, 0E9h, 08Bh, 04Dh, 01Ch, 056h, 08Bh, 071h, 010h, 057h, 08Bh, 0BEh
    db 004h, 002h, 000h, 000h, 089h, 07Ch, 024h, 00Ch
    call ?j_0000432c@@YAXXZ
    db 084h, 0C0h, 074h, 01Fh, 08Bh, 007h, 08Bh, 0CFh, 0FFh, 090h, 004h, 002h, 000h, 000h, 06Ah, 000h
    db 08Bh, 0CFh
    call ?j_0004ab4c@@YAXXZ
    db 05Fh, 05Eh, 0B8h, 0FEh, 0FFh, 0FFh, 0FFh, 05Dh, 083h, 0C4h, 010h, 0C3h, 033h, 0C9h, 08Bh, 0C1h
    db 089h, 04Ch, 024h, 014h, 053h, 051h, 08Dh, 054h, 024h, 018h, 089h, 04Ch, 024h, 020h, 00Dh, 000h
    db 000h, 000h, 010h, 052h, 08Bh, 0CEh, 089h, 044h, 024h, 01Ch
    call ?j_000307e7@@YAXXZ
    db 08Bh, 04Dh, 01Ch, 0BBh, 0FEh, 0FFh, 0FFh, 0FFh
    call ?j_0000e570@@YAXXZ
    db 08Bh, 0F8h, 085h, 0FFh, 00Fh, 084h, 062h, 001h, 000h, 000h, 0F7h, 087h, 094h, 000h, 000h, 000h
    db 000h, 000h, 004h, 000h, 074h, 00Dh, 05Bh, 05Fh, 05Eh, 0B8h, 0FEh, 0FFh, 0FFh, 0FFh, 05Dh, 083h
    db 0C4h, 010h, 0C3h, 08Bh, 0CEh
    call ?j_00020824@@YAXXZ
    db 050h, 08Bh, 0CFh
    call ?j_00003b1b@@YAXXZ
    db 084h, 0C0h, 075h, 0E0h, 06Ah, 002h, 057h, 08Bh, 0CEh
    call ?j_000420aa@@YAXXZ
    db 084h, 0C0h, 074h, 022h, 08Bh, 0CEh
    call ?j_00016199@@YAXXZ
    db 084h, 0C0h, 074h, 017h, 08Bh, 04Dh, 01Ch, 08Bh, 001h, 068h, 0E9h, 000h, 000h, 000h, 0FFh, 050h
    db 020h, 05Bh, 05Fh, 05Eh, 033h, 0C0h, 05Dh, 083h, 0C4h, 010h, 0C3h, 06Ah, 000h, 08Bh, 0CEh
    call ?j_00031a7f@@YAXXZ
    db 085h, 0C0h, 074h, 03Bh, 06Ah, 000h, 057h, 056h, 08Bh, 0C8h
    call ?j_0002e85c@@YAXXZ
    db 084h, 0C0h, 074h, 02Ch, 08Bh, 00Dh
    dd ?Rva012ef214@@3PAVRva0041D290Manager@@A
    db 08Bh, 049h, 00Ch, 056h
    call ?j_00036089@@YAXXZ
    db 08Bh, 05Ch, 024h, 010h, 08Bh, 08Bh, 040h, 001h, 000h, 000h, 085h, 0C9h, 074h, 004h, 084h, 0C0h
    db 074h, 00Fh, 05Bh, 05Fh, 05Eh, 083h, 0C8h, 0FFh, 05Dh, 083h, 0C4h, 010h, 0C3h, 08Bh, 05Ch, 024h
    db 010h, 057h, 08Bh, 0CBh
    call ?j_0004ab4c@@YAXXZ
    db 08Bh, 083h, 040h, 001h, 000h, 000h, 085h, 0C0h, 075h, 067h, 08Dh, 045h, 054h, 083h, 0C7h, 038h
    db 08Bh, 00Fh, 08Bh, 0D0h, 089h, 00Ah, 08Bh, 04Fh, 004h, 089h, 04Ah, 004h, 08Bh, 04Fh, 008h, 089h
    db 04Ah, 008h, 0D9h, 046h, 03Ch, 0D9h, 046h, 038h, 08Bh, 015h
    dd ?Rva012ef214@@3PAVRva0041D290Manager@@A
    db 0D8h, 020h, 08Bh, 072h, 014h, 08Dh, 04Ch, 024h, 014h, 0C7h, 044h, 024h, 01Ch, 000h, 000h, 000h
    db 000h, 0D9h, 05Ch, 024h, 014h, 0D8h, 060h, 004h, 0D9h, 05Ch, 024h, 018h
    call ?j_0002fe0f@@YAXXZ
    db 0D9h, 086h, 094h, 000h, 000h, 000h, 0D8h, 086h, 090h, 000h, 000h, 000h, 0DEh, 0D9h, 0DFh, 0E0h
    db 0F6h, 0C4h, 041h, 075h, 00Dh, 05Bh, 05Fh, 05Eh, 0B8h, 0FFh, 0FFh, 0FFh, 0FFh, 05Dh, 083h, 0C4h
    db 010h, 0C3h, 0A0h
    dd ?Glo012F0239@@3_NA
    db 084h, 0C0h, 074h, 017h, 0A1h
    dd ?TheCRCParameterCheck@@3PAVCRCParameterCheck@@A
    db 085h, 0C0h, 074h, 00Eh, 068h
    dd g_Va01099604
    db 050h
    call ?j_0003a17a@@YAXXZ
    db 083h, 0C4h, 008h, 08Bh, 045h, 000h, 08Bh, 0CDh, 0FFh, 050h, 044h, 084h, 0C0h, 00Fh, 084h, 0BBh
    db 0FEh, 0FFh, 0FFh, 08Bh, 0CDh
    call ?update@AIInternalMoveToState@@UAE?AW4StateReturnType@@XZ
    db 08Bh, 0D8h, 085h, 0DBh, 00Fh, 085h, 037h, 0FFh, 0FFh, 0FFh, 08Bh, 0C3h, 05Bh, 05Fh, 05Eh, 05Dh
    db 083h, 0C4h, 010h, 0C3h
?Rva00177320@@YAXXZ ENDP
_TEXT ENDS
END
