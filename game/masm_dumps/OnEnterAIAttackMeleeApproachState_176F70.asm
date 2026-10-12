.386
.model flat
; ?onEnter@AIAttackMeleeApproachState@@UAE?AW4StateReturnType@@XZ
; Retail @ 0x00176F70 size 747 (Open-BFME4). Identity proven by ILT 0x00011667
; (vtable 0x0109A6C0 slot 4; tools/ilt_oracle.py check CONFIRMED exact) plus the
; matched AIInternalMoveToState base override in the same slot; evidence
; targets/game/reverse/identity_evidence/00176f70.md.
; MASM dump because the measured C++ bank (targets/game/reverse/attempts/0x00176f70.cpp,
; sha256 101a75475f896b8f5c407858d21dee5fd77de1f2e0ca234abee5f71624a1a609)
; reaches 747/747 bytes with 32 aligned relocations and 3 non-relocation bytes
; left over from register selection: +0x1E6 retail `mov esi,[ecx+0x14]` vs bank
; `mov edi,[ecx+0x14]` (8Bh 71h/79h), +0x205 `fld dword ptr [esi+0x94]` vs
; `fld dword ptr [edi+0x94]`, +0x20B `fadd dword ptr [esi+0x90]` vs
; `fadd dword ptr [edi+0x90]`. Shape is 1.000: the instruction stream is
; identical once registers are normalised; one long live range is renamed.
; 18 logged experiments (re_attempts.log) over local definition order, parameter
; copies, guard placement, loop counters and call spellings flip no byte; the
; class is documented in targets/game/reverse/analysis/register_mirror_experiments.md.
; The allocator's pick is fixed by the whole function's liveness, which the source
; cannot reach, so the exact bytes stay a machine dump.
; Evidence: targets/game/reverse/identity_evidence/00176f70-masm-codegen-blocker.md
EXTERN ?Glo012F0239@@3_NA:BYTE
EXTERN ?Rva012ef214@@3PAVRva0041D290Manager@@A:BYTE
EXTERN ?TheCRCParameterCheck@@3PAVCRCParameterCheck@@A:BYTE
EXTERN ?j_000016a4@@YAXXZ:NEAR
EXTERN ?j_00003b1b@@YAXXZ:NEAR
EXTERN ?j_0000432c@@YAXXZ:NEAR
EXTERN ?j_00004c37@@YAXXZ:NEAR
EXTERN ?j_000065e1@@YAXXZ:NEAR
EXTERN ?j_00006eec@@YAXXZ:NEAR
EXTERN ?j_0000e570@@YAXXZ:NEAR
EXTERN ?j_00016199@@YAXXZ:NEAR
EXTERN ?j_00020824@@YAXXZ:NEAR
EXTERN ?j_0002e85c@@YAXXZ:NEAR
EXTERN ?j_0002fe0f@@YAXXZ:NEAR
EXTERN ?j_00031a7f@@YAXXZ:NEAR
EXTERN ?j_0003a17a@@YAXXZ:NEAR
EXTERN ?j_000420aa@@YAXXZ:NEAR
EXTERN ?onEnter@AIInternalMoveToState@@UAE?AW4StateReturnType@@XZ:NEAR
EXTERN g_Va01099570:BYTE
EXTERN g_Va010995A8:BYTE
EXTERN g_Va010995CC:BYTE
_TEXT SEGMENT
public ?onEnter@AIAttackMeleeApproachState@@UAE?AW4StateReturnType@@XZ
?onEnter@AIAttackMeleeApproachState@@UAE?AW4StateReturnType@@XZ PROC
    db 083h, 0ECh, 010h, 055h, 08Bh, 0E9h, 08Bh, 04Dh, 01Ch, 056h, 08Bh, 071h, 010h, 089h, 06Ch, 024h
    db 008h
    call ?j_0000432c@@YAXXZ
    db 084h, 0C0h, 074h, 00Bh, 05Eh, 0B8h, 0FEh, 0FFh, 0FFh, 0FFh, 05Dh, 083h, 0C4h, 010h, 0C3h, 08Bh
    db 04Dh, 01Ch, 057h
    call ?j_0000e570@@YAXXZ
    db 08Bh, 0F8h, 085h, 0FFh, 074h, 029h, 08Bh, 0CEh
    call ?j_00020824@@YAXXZ
    db 050h, 08Bh, 0CFh
    call ?j_00003b1b@@YAXXZ
    db 084h, 0C0h, 074h, 016h, 08Bh, 04Dh, 01Ch, 08Bh, 001h, 06Ah, 000h, 0FFh, 050h, 038h, 05Fh, 05Eh
    db 0B8h, 0FEh, 0FFh, 0FFh, 0FFh, 05Dh, 083h, 0C4h, 010h, 0C3h, 0F6h, 086h, 098h, 000h, 000h, 000h
    db 008h, 00Fh, 085h, 025h, 002h, 000h, 000h, 08Bh, 08Eh, 004h, 002h, 000h, 000h, 08Ah, 081h, 03Ah
    db 003h, 000h, 000h, 084h, 0C0h, 00Fh, 085h, 011h, 002h, 000h, 000h, 0A0h
    dd ?Glo012F0239@@3_NA
    db 084h, 0C0h, 074h, 017h, 0A1h
    dd ?TheCRCParameterCheck@@3PAVCRCParameterCheck@@A
    db 085h, 0C0h, 074h, 00Eh, 068h
    dd g_Va010995CC
    db 050h
    call ?j_0003a17a@@YAXXZ
    db 083h, 0C4h, 008h, 085h, 0FFh, 0C6h, 045h, 04Ch, 000h, 0C7h, 045h, 050h, 000h, 000h, 000h, 000h
    db 074h, 0A4h, 06Ah, 002h, 057h, 08Bh, 0CEh
    call ?j_000420aa@@YAXXZ
    db 084h, 0C0h, 074h, 021h, 08Bh, 0CEh
    call ?j_00016199@@YAXXZ
    db 084h, 0C0h, 074h, 016h, 08Bh, 04Dh, 01Ch, 08Bh, 011h, 068h, 0E9h, 000h, 000h, 000h, 0FFh, 052h
    db 020h, 05Fh, 05Eh, 033h, 0C0h, 05Dh, 083h, 0C4h, 010h, 0C3h, 08Bh, 08Fh, 008h, 002h, 000h, 000h
    db 085h, 0C9h, 074h, 00Dh
    call ?j_00006eec@@YAXXZ
    db 084h, 0C0h, 00Fh, 085h, 05Eh, 0FFh, 0FFh, 0FFh, 06Ah, 000h, 08Bh, 0CEh
    call ?j_00031a7f@@YAXXZ
    db 085h, 0C0h, 00Fh, 084h, 04Dh, 0FFh, 0FFh, 0FFh, 06Ah, 000h, 057h, 056h, 08Bh, 0C8h
    call ?j_0002e85c@@YAXXZ
    db 084h, 0C0h, 074h, 00Ah, 05Fh, 05Eh, 083h, 0C8h, 0FFh, 05Dh, 083h, 0C4h, 010h, 0C3h, 053h, 08Dh
    db 05Fh, 038h, 083h, 0C5h, 054h, 08Bh, 0C3h, 08Bh, 010h, 08Bh, 0CDh, 089h, 011h, 08Bh, 050h, 004h
    db 089h, 051h, 004h, 08Bh, 040h, 008h, 06Ah, 002h, 089h, 041h, 008h, 057h, 08Bh, 0CEh
    call ?j_000420aa@@YAXXZ
    db 084h, 0C0h, 075h, 050h, 0D9h, 046h, 03Ch, 08Bh, 00Dh
    dd ?Rva012ef214@@3PAVRva0041D290Manager@@A
    db 0D9h, 046h, 038h, 08Bh, 079h, 014h, 0D8h, 065h, 000h, 08Dh, 04Ch, 024h, 014h, 0C7h, 044h, 024h
    db 01Ch, 000h, 000h, 000h, 000h, 0D9h, 05Ch, 024h, 014h, 0D8h, 065h, 004h, 0D9h, 05Ch, 024h, 018h
    call ?j_0002fe0f@@YAXXZ
    db 0D9h, 087h, 094h, 000h, 000h, 000h, 0D8h, 087h, 090h, 000h, 000h, 000h, 0DEh, 0D9h, 0DFh, 0E0h
    db 0F6h, 0C4h, 041h, 075h, 00Dh, 05Bh, 05Fh, 05Eh, 0B8h, 0FFh, 0FFh, 0FFh, 0FFh, 05Dh, 083h, 0C4h
    db 010h, 0C3h, 06Ah, 025h, 08Bh, 0CEh
    call ?j_000016a4@@YAXXZ
    db 084h, 0C0h, 074h, 017h, 08Bh, 086h, 014h, 002h, 000h, 000h, 085h, 0C0h, 074h, 00Dh, 05Bh, 05Fh
    db 05Eh, 0B8h, 0FEh, 0FFh, 0FFh, 0FFh, 05Dh, 083h, 0C4h, 010h, 0C3h, 08Bh, 08Eh, 004h, 002h, 000h
    db 000h
    call ?j_000065e1@@YAXXZ
    db 08Bh, 003h, 08Bh, 0D5h, 089h, 002h, 08Bh, 04Bh, 004h, 089h, 04Ah, 004h, 08Bh, 043h, 008h, 089h
    db 042h, 008h, 0D9h, 046h, 03Ch, 0D9h, 046h, 038h, 08Bh, 00Dh
    dd ?Rva012ef214@@3PAVRva0041D290Manager@@A
    db 0D8h, 065h, 000h, 08Bh, 071h, 014h, 08Dh, 04Ch, 024h, 014h, 0C7h, 044h, 024h, 01Ch, 000h, 000h
    db 000h, 000h, 0D9h, 05Ch, 024h, 014h, 0D8h, 065h, 004h, 0D9h, 05Ch, 024h, 018h
    call ?j_0002fe0f@@YAXXZ
    db 0D9h, 086h, 094h, 000h, 000h, 000h, 0D8h, 086h, 090h, 000h, 000h, 000h, 0DEh, 0D9h, 0DFh, 0E0h
    db 0F6h, 0C4h, 041h, 00Fh, 084h, 06Bh, 0FFh, 0FFh, 0FFh, 0A0h
    dd ?Glo012F0239@@3_NA
    db 084h, 0C0h, 074h, 017h, 0A1h
    dd ?TheCRCParameterCheck@@3PAVCRCParameterCheck@@A
    db 085h, 0C0h, 074h, 00Eh, 068h
    dd g_Va010995A8
    db 050h
    call ?j_0003a17a@@YAXXZ
    db 083h, 0C4h, 008h, 08Bh, 074h, 024h, 010h, 08Bh, 016h, 08Bh, 0CEh, 0FFh, 052h, 044h, 084h, 0C0h
    db 075h, 00Bh, 05Bh, 05Fh, 05Eh, 083h, 0C8h, 0FFh, 05Dh, 083h, 0C4h, 010h, 0C3h, 08Bh, 0CEh
    call ?onEnter@AIInternalMoveToState@@UAE?AW4StateReturnType@@XZ
    db 08Bh, 0F8h, 0A0h
    dd ?Glo012F0239@@3_NA
    db 084h, 0C0h, 074h, 017h, 0A1h
    dd ?TheCRCParameterCheck@@3PAVCRCParameterCheck@@A
    db 085h, 0C0h, 074h, 00Eh, 068h
    dd g_Va01099570
    db 050h
    call ?j_0003a17a@@YAXXZ
    db 083h, 0C4h, 008h, 05Bh, 08Bh, 0C7h, 05Fh, 0C6h, 046h, 04Ch, 001h, 05Eh, 05Dh, 083h, 0C4h, 010h
    db 0C3h, 057h, 056h
    call ?j_00004c37@@YAXXZ
    db 083h, 0C4h, 008h, 084h, 0C0h, 00Fh, 084h, 0A6h, 0FDh, 0FFh, 0FFh, 08Bh, 086h, 004h, 002h, 000h
    db 000h, 08Ah, 088h, 03Ah, 003h, 000h, 000h, 084h, 0C9h, 00Fh, 084h, 05Eh, 0FEh, 0FFh, 0FFh, 06Ah
    db 000h, 08Bh, 0CEh
    call ?j_00031a7f@@YAXXZ
    db 085h, 0C0h, 074h, 013h, 06Ah, 000h, 057h, 056h, 08Bh, 0C8h
    call ?j_0002e85c@@YAXXZ
    db 084h, 0C0h, 00Fh, 085h, 03Eh, 0FEh, 0FFh, 0FFh, 08Bh, 04Dh, 01Ch, 08Bh, 011h, 06Ah, 000h, 0FFh
    db 052h, 038h, 05Fh, 05Eh, 0B8h, 0FEh, 0FFh, 0FFh, 0FFh, 05Dh, 083h, 0C4h, 010h, 0C3h
?onEnter@AIAttackMeleeApproachState@@UAE?AW4StateReturnType@@XZ ENDP
_TEXT ENDS
END
