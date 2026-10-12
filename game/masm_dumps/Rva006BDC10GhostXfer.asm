.386
.model flat
; MASM dump carrying a measured VC7.1 codegen blocker. Identity is NOT
; provable: tools/ilt_oracle.py CONTRADICTS ?xfer@W3DGhostObjectManager@@...
; at this address (p_false 1.96e-04, outside its ILT slot window), so the row
; keeps the placeholder name and asserts nothing about that name.
; The reconstructible C++ body (targets/game/reverse/attempts/0x006bdc10.cpp)
; compiles to 395 bytes with 7 relocations and shape 1.000; the residue is a
; stack-slot placement for the version local: retail stores the two bool
; bytes into the frame at +0x0C/+0x0D and passes &version at +0x10
; (mov [esp+0Ch],al; mov [esp+0Dh],al; lea eax,[esp+10h]), while VC7.1
; places the same local 8 bytes higher, in the already-dead incoming-argument
; slot (three non-relocation bytes at +0x26, +0x2A, +0x2F). Pointer locals,
; union wraps, declaration-order swaps and a top-of-function declaration
; (20 diffs) were measured on 2026-10-12, on top of prior BFME2-donor and
; corrected-callee-contract retries; the escape-analysis reading of the
; frame is refuted. The body ends with the complete backward JMP at +0x189
; and the carve closes at +0x18B.
; Evidence: targets/game/reverse/identity_evidence/006bdc10-masm-codegen-blocker.md
EXTERN ?j_00024230@@YAXXZ:NEAR
EXTERN ?j_0000c9b4@@YAXXZ:NEAR
EXTERN ?TheGhostObjectManager@@3PAVGhostObjectManager@@A:BYTE
EXTERN ?TheBfmeGameLogic@@3PAVGameLogic@@A:BYTE
EXTERN ?TheShroudManager@@3PAVPartitionManager@@A:BYTE
EXTERN ?m@Gen_008f73b0@@QAEXXZ:NEAR
_TEXT SEGMENT
; retail VA 0x00ABDC10 size 395
public ?Rva006BDC10@@YAXXZ
?Rva006BDC10@@YAXXZ PROC
    db 083h, 0ECh, 008h, 053h, 055h, 08Bh, 06Ch, 024h, 014h, 055h, 08Bh, 0D9h
    call ?j_00024230@@YAXXZ
    db 08Bh, 045h, 000h, 08Bh, 0CDh, 0FFh, 050h, 010h, 084h, 0C0h, 00Fh, 085h, 030h, 001h, 000h, 000h
    db 08Bh, 055h, 000h, 0B0h, 001h, 088h, 044h, 024h, 00Ch, 088h, 044h, 024h, 00Dh, 057h, 08Dh, 044h
    db 024h, 010h, 050h, 08Bh, 0CDh, 0FFh, 052h, 028h, 08Bh, 043h, 010h, 033h, 0FFh, 03Bh, 0C7h, 089h
    db 07Ch, 024h, 018h, 074h, 018h, 0EBh, 008h, 08Dh, 0A4h, 024h, 000h, 000h, 000h, 000h, 090h, 0FFh
    db 044h, 024h, 018h, 08Bh, 080h, 010h, 001h, 000h, 000h, 03Bh, 0C7h, 075h, 0F2h, 08Bh, 055h, 000h
    db 056h, 08Dh, 044h, 024h, 01Ch, 050h, 08Bh, 0CDh, 0FFh, 052h, 07Ch, 08Bh, 055h, 000h, 08Bh, 0CDh
    db 0FFh, 052h, 008h, 084h, 0C0h, 074h, 04Ah, 08Bh, 073h, 010h, 03Bh, 0F7h, 00Fh, 084h, 0CCh, 000h
    db 000h, 000h, 08Bh, 046h, 00Ch, 03Bh, 0C7h, 074h, 009h, 08Bh, 040h, 074h, 089h, 044h, 024h, 010h
    db 0EBh, 004h, 089h, 07Ch, 024h, 010h, 08Dh, 04Ch, 024h, 010h, 051h, 055h
    call ?j_0000c9b4@@YAXXZ
    db 08Bh, 055h, 000h, 083h, 0C4h, 008h, 056h, 08Bh, 0CDh, 0FFh, 052h, 030h, 08Bh, 0B6h, 010h, 001h
    db 000h, 000h, 03Bh, 0F7h, 075h, 0CBh, 05Eh, 05Fh, 05Dh, 05Bh, 083h, 0C4h, 008h, 0C2h, 004h, 000h
    db 0A1h
    dd ?TheGhostObjectManager@@3PAVGhostObjectManager@@A
    db 0C6h, 040h, 009h, 000h, 066h, 039h, 07Ch, 024h, 01Ch, 089h, 07Ch, 024h, 014h, 076h, 079h, 0EBh
    db 008h, 033h, 0FFh, 08Dh, 09Bh, 000h, 000h, 000h, 000h, 08Dh, 04Ch, 024h, 010h, 051h, 055h
    call ?j_0000c9b4@@YAXXZ
    db 08Bh, 074h, 024h, 018h, 083h, 0C4h, 008h, 03Bh, 0F7h, 074h, 035h, 08Bh, 00Dh
    dd ?TheBfmeGameLogic@@3PAVGameLogic@@A
    db 08Bh, 081h, 0B4h, 000h, 000h, 000h, 08Bh, 0B9h, 0B8h, 000h, 000h, 000h, 02Bh, 0F8h, 033h, 0D2h
    db 0C1h, 0FFh, 002h, 08Bh, 0C6h, 0F7h, 0F7h, 08Bh, 081h, 0B4h, 000h, 000h, 000h, 08Bh, 014h, 090h
    db 085h, 0D2h, 074h, 00Bh, 039h, 072h, 004h, 074h, 034h, 08Bh, 012h, 085h, 0D2h, 075h, 0F5h, 08Bh
    db 003h, 06Ah, 000h, 08Bh, 0CBh, 0FFh, 050h, 01Ch, 08Bh, 0F0h, 08Bh, 055h, 000h, 056h, 08Bh, 0CDh
    db 0FFh, 052h, 030h, 08Bh, 044h, 024h, 014h, 040h, 066h, 03Bh, 044h, 024h, 01Ch, 089h, 044h, 024h
    db 014h, 072h, 089h, 05Eh, 05Fh, 05Dh, 05Bh, 083h, 0C4h, 008h, 0C2h, 004h, 000h, 085h, 0D2h, 074h
    db 0CEh, 08Bh, 07Ah, 008h, 085h, 0FFh, 074h, 0C7h, 08Bh, 013h, 057h, 08Bh, 0CBh, 0FFh, 052h, 01Ch
    db 08Bh, 0F0h, 085h, 0F6h, 074h, 005h, 08Dh, 046h, 004h, 0EBh, 002h, 033h, 0C0h, 08Bh, 00Dh
    dd ?TheShroudManager@@3PAVPartitionManager@@A
    db 050h, 083h, 0C7h, 064h, 057h
    call ?m@Gen_008f73b0@@QAEXXZ
    db 0EBh, 0ABh
?Rva006BDC10@@YAXXZ ENDP
_TEXT ENDS
END
