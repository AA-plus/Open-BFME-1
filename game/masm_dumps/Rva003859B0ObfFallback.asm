.386
.model flat
; SecuROM-protection fallback callee of the 100-byte obfuscated hook wrappers
; (BigObfHookWrappers.cpp: BFME_OBF_WRAPPER( Rva003897C0, g_Slot012BC84C,
; Obf003881E0, Gen003859B0 )).  The pin ?Gen003859B0@@YAHHH@Z at 0x003859B0 in
; symbols.csv fixes the two-int cdecl shape for that caller; a 5-byte ILT at
; 0x0004904E (row ?j_0004904e@@YAXXZ target=FUN_007859b0) also enters here.
; Boundary: plain RET C3 at +0xD7 then INT3 to the next row 0x00385AE0.
;
; WHY MASM.  Retail's 216 bytes are post-link protected code: GCC-style frame
; encodings 55 89 E5 at +0x1 and 89 EC at +0xD4 (VC7.1 emits 8B EC/8B E5),
; 31 C0 zeroing at +0x4E +0x7D +0x8E +0x99 (VC7.1 emits 33 C0), always-taken
; `xor eax,eax; je` opaque predicates at +0x7D/+0x8E/+0x99, and two dead
; marker streams whose `mov eax,007859BDh` operand (+0x0E and +0xBC) is the
; body's own VA + 0xD -- a value no decorated symbol can express and no C++
; statement can emit (14 prior verdicts in re_attempts.log, 2026-09-13..: the
; best bank reproduces all 216 bytes only through an inline-asm transcription,
; which the anti-lift rule refuses as a conversion).  The PE confirms the
; rewrite: IMAGE_FILE_RELOCS_STRIPPED, an empty basereloc directory, and the
; protector's nameless 7th section at RVA 0x00F62000.
;
; Byte-identical to retail outside the six REL32 slots below (six calls, five
; distinct thunk symbols); every other byte is literal.
; Evidence: targets/game/reverse/identity_evidence/003859b0-obf-masm-dump.md
EXTERN ?j_00008d69@@YAXXZ:NEAR
EXTERN ?j_00010ca3@@YAXXZ:NEAR
EXTERN ?j_00025716@@YAXXZ:NEAR
EXTERN ?j_0002c7fa@@YAXXZ:NEAR
EXTERN ?j_00049224@@YAXXZ:NEAR
_TEXT SEGMENT
public ?Gen003859B0@@YAHHH@Z
?Gen003859B0@@YAHHH@Z PROC
    db 055h, 089h, 0E5h, 083h, 0ECh, 020h, 057h, 050h, 0B8h, 0CCh, 0CDh, 0CEh, 0CFh, 0B8h, 0BDh, 059h
    db 078h, 000h, 0B8h, 001h, 000h, 000h, 000h, 0B8h, 000h, 000h, 000h, 000h, 0B8h, 0CCh, 0CDh, 0CEh
    db 0CFh, 058h, 083h, 065h, 0F4h, 000h
    call ?j_00010ca3@@YAXXZ
    db 089h, 045h, 0FCh, 0FFh, 075h, 008h, 0FFh, 075h, 0FCh
    call ?j_0002c7fa@@YAXXZ
    db 059h, 059h, 089h, 045h, 0F8h, 0FFh, 075h, 00Ch, 0FFh, 075h, 0FCh
    call ?j_0002c7fa@@YAXXZ
    db 059h, 059h, 089h, 045h, 0ECh, 031h, 0C0h, 08Dh, 07Dh, 0EBh, 0AAh, 0FFh, 075h, 0ECh, 0FFh, 075h
    db 0F8h, 08Dh, 04Dh, 0EBh
    call ?j_00008d69@@YAXXZ
    db 089h, 045h, 0F0h, 0FFh, 075h, 0F0h, 0FFh, 075h, 0ECh, 0FFh, 075h, 0F8h, 06Ah, 001h, 06Ah, 005h
    call ?j_00049224@@YAXXZ
    db 083h, 0C4h, 014h, 089h, 045h, 0F0h, 031h, 0C0h, 074h, 00Dh, 083h, 07Dh, 0F8h, 001h, 075h, 007h
    db 08Bh, 045h, 0FCh, 083h, 060h, 018h, 000h, 031h, 0C0h, 040h, 074h, 006h, 08Bh, 045h, 00Ch, 089h
    db 045h, 0F0h, 031h, 0C0h, 074h, 008h, 08Bh, 045h, 0F8h, 089h, 045h, 0F4h, 0EBh, 010h, 0FFh, 075h
    db 0F0h, 0FFh, 075h, 0FCh
    call ?j_00025716@@YAXXZ
    db 059h, 059h, 089h, 045h, 0F4h, 050h, 0B8h, 0CCh, 0CDh, 0CEh, 0CFh, 0B8h, 0BDh, 059h, 078h, 000h
    db 0B8h, 000h, 000h, 000h, 000h, 0B8h, 000h, 000h, 000h, 000h, 0B8h, 0CBh, 0CCh, 0CDh, 0CEh, 058h
    db 08Bh, 045h, 0F4h, 05Fh, 089h, 0ECh, 05Dh, 0C3h
?Gen003859B0@@YAHHH@Z ENDP
_TEXT ENDS
END
