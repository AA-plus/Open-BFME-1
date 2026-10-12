.386
.model flat
; ??0Rva00597FC0Client@@QAE@XZ
; Retail @ 0x00597FC0 size 1953 (VA 0x00997FC0)
;
; MASM dump carrying a measured VC7.1 codegen blocker: the
; Rva00597FC0Client constructor (vtables 0x0110C2D8 / 0x0110C2C4; reached
; from the AptPalantir constructor 0x0079D9F0 through ILT 0x0000DA58).
; The reconstructible C++ bank
; (targets/game/reverse/attempts/0x00597fc0.cpp sha256
; 26758446578b7bac0479a8b2a381f3a130dd15113de514324de36e6b7b505803; best
; measured TU copy sha256
; 3a8a9c95f48e1f5712427adcf0add886d7958d60da4ba5cb46d5acfe9b3fb7b9,
; preserved at build/scratch/0x00597fc0.bank.cpp) compiles to exactly 1953
; bytes with 108 relocations and shape 1.000 -- every instruction matches
; retail once registers and constants are normalised -- but its whole
; residue is 14 non-relocation register-allocation bytes: +0x190 +0x192
; +0x195 (retail zeroes the +0x18/+0x1C state pair through ECX, the bank
; through EAX) and the ECX/EDX swap of the first functor-wrapper placement
; copy at +0x1CE +0x1D2 +0x1D5 +0x1D7 +0x1DA +0x1DE +0x1EA plus +0x1F3
; +0x1F7 +0x205 +0x209. Twenty measured formulations this session (the
; 0.996-shape bank at 24 bytes; explicit temporaries; const and direct
; member zeroing; named bindings; callback placement; _ReadWriteBarrier at
; five placements, which alone lifts shape to 1.000 but never below 14
; bytes) leave those 14 bytes unchanged: a register-allocation choice, not
; source-spellable. The dump body is byte-identical to retail outside its
; relocation slots.
; Evidence: targets/game/reverse/identity_evidence/00597fc0-masm-codegen-blocker.md
_TEXT SEGMENT
public ??0Rva00597FC0Client@@QAE@XZ
??0Rva00597FC0Client@@QAE@XZ PROC
    db 6Ah, 0FFh, 68h, 79h, 7Fh, 03h, 01h, 64h, 0A1h, 00h, 00h, 00h, 00h, 50h, 64h, 89h
    db 25h, 00h, 00h, 00h, 00h, 83h, 0ECh, 20h, 53h, 55h, 56h, 8Bh, 0F1h, 57h, 89h, 74h
    db 24h, 18h, 0E8h, 49h, 9Ah, 40h, 00h, 33h, 0DBh, 89h, 5Ch, 24h, 38h, 0C7h, 46h, 08h
    db 44h, 37h, 07h, 01h, 8Dh, 4Eh, 20h, 0C7h, 06h, 0D8h, 0C2h, 10h, 01h, 0C7h, 46h, 08h
    db 0C4h, 0C2h, 10h, 01h, 89h, 5Eh, 0Ch, 89h, 5Eh, 10h, 89h, 5Eh, 14h, 89h, 19h, 89h
    db 59h, 04h, 89h, 59h, 08h, 89h, 59h, 0Ch, 89h, 59h, 10h, 89h, 59h, 14h, 89h, 59h
    db 18h, 89h, 59h, 1Ch, 89h, 59h, 20h, 53h, 0C6h, 44h, 24h, 3Ch, 01h, 89h, 59h, 24h
    db 0E8h, 0E6h, 00h, 0A7h, 0FFh, 8Ah, 56h, 58h, 80h, 0E2h, 04h, 83h, 0CFh, 0FFh, 8Dh, 4Eh
    db 68h, 0C6h, 44h, 24h, 38h, 02h, 88h, 5Eh, 48h, 88h, 5Eh, 49h, 0C6h, 46h, 4Bh, 01h
    db 0C6h, 46h, 4Ch, 01h, 89h, 5Eh, 50h, 89h, 5Eh, 54h, 88h, 56h, 58h, 89h, 7Eh, 5Ch
    db 89h, 5Eh, 60h, 0C7h, 46h, 64h, 01h, 00h, 00h, 00h, 0E8h, 04h, 84h, 0A8h, 0FFh, 8Dh
    db 8Eh, 54h, 01h, 00h, 00h, 0C6h, 44h, 24h, 38h, 03h, 0E8h, 04h, 82h, 0A9h, 0FFh, 8Dh
    db 8Eh, 7Ch, 01h, 00h, 00h, 0C6h, 44h, 24h, 38h, 04h, 0E8h, 0A4h, 1Ch, 0AAh, 0FFh, 8Dh
    db 8Eh, 0B8h, 02h, 00h, 00h, 0C6h, 44h, 24h, 38h, 05h, 0E8h, 0Bh, 11h, 0A8h, 0FFh, 8Dh
    db 8Eh, 60h, 04h, 00h, 00h, 0C6h, 44h, 24h, 38h, 06h, 0E8h, 0E7h, 0Dh, 0ABh, 0FFh, 8Dh
    db 8Eh, 88h, 04h, 00h, 00h, 0C6h, 44h, 24h, 38h, 07h, 0E8h, 0E8h, 0F5h, 0A7h, 0FFh, 88h
    db 9Eh, 0C4h, 04h, 00h, 00h, 88h, 9Eh, 0C5h, 04h, 00h, 00h, 89h, 9Eh, 0C8h, 04h, 00h
    db 00h, 89h, 9Eh, 0CCh, 04h, 00h, 00h, 89h, 0BEh, 0D0h, 04h, 00h, 00h, 88h, 9Eh, 0D4h
    db 04h, 00h, 00h, 89h, 9Eh, 0D8h, 04h, 00h, 00h, 0C6h, 44h, 24h, 38h, 0Ah, 8Dh, 86h
    db 0DCh, 04h, 00h, 00h, 68h, 0B8h, 0EAh, 43h, 00h, 68h, 10h, 17h, 42h, 00h, 6Ah, 04h
    db 6Ah, 08h, 50h, 0E8h, 0DCh, 0EDh, 45h, 00h, 8Dh, 0AEh, 0FCh, 04h, 00h, 00h, 6Ah, 18h
    db 0C6h, 44h, 24h, 3Ch, 0Bh, 89h, 5Dh, 00h, 0E8h, 23h, 64h, 29h, 00h, 89h, 45h, 00h
    db 89h, 5Dh, 04h, 88h, 18h, 8Bh, 45h, 00h, 89h, 58h, 04h, 8Bh, 45h, 00h, 89h, 40h
    db 08h, 8Bh, 45h, 00h, 83h, 0C4h, 04h, 89h, 40h, 0Ch, 0C6h, 44h, 24h, 38h, 0Ch, 89h
    db 9Eh, 08h, 05h, 00h, 00h, 88h, 9Eh, 0Ch, 05h, 00h, 00h, 0E8h, 55h, 41h, 0A9h, 0FFh
    db 33h, 0C9h, 89h, 4Eh, 18h, 66h, 89h, 4Eh, 1Ch, 68h, 0B8h, 0C0h, 10h, 01h, 8Dh, 4Ch
    db 24h, 14h, 0BFh, 0E1h, 3Bh, 42h, 00h, 0E8h, 54h, 0Ah, 2Fh, 00h, 51h, 89h, 64h, 24h
    db 18h, 33h, 0C0h, 89h, 64h, 24h, 18h, 6Ah, 18h, 0C6h, 44h, 24h, 40h, 0Dh, 89h, 44h
    db 24h, 34h, 0E8h, 0A9h, 9Dh, 2Eh, 00h, 83h, 0C4h, 04h, 3Bh, 0C3h, 74h, 21h, 8Bh, 4Ch
    db 24h, 28h, 8Dh, 50h, 08h, 89h, 32h, 89h, 4Ah, 04h, 8Bh, 4Ch, 24h, 30h, 89h, 7Ah
    db 08h, 89h, 58h, 04h, 0C7h, 00h, 0Ch, 0BDh, 10h, 01h, 89h, 4Ah, 0Ch, 0EBh, 02h, 33h
    db 0C0h, 3Bh, 0C3h, 8Bh, 54h, 24h, 18h, 89h, 02h, 74h, 03h, 0FFh, 40h, 04h, 8Bh, 0Dh
    db 0E8h, 19h, 2Fh, 01h, 53h, 8Dh, 44h, 24h, 18h, 50h, 0E8h, 0EDh, 1Eh, 0AAh, 0FFh, 8Dh
    db 4Ch, 24h, 10h, 0C6h, 44h, 24h, 38h, 0Ch, 0E8h, 63h, 0F7h, 2Eh, 00h, 68h, 4Ch, 0C1h
    db 10h, 01h, 8Dh, 4Ch, 24h, 14h, 0BFh, 48h, 2Bh, 41h, 00h, 0E8h, 0D0h, 09h, 2Fh, 00h
    db 51h, 89h, 64h, 24h, 18h, 33h, 0C0h, 89h, 64h, 24h, 18h, 6Ah, 18h, 0C6h, 44h, 24h
    db 40h, 0Eh, 89h, 44h, 24h, 34h, 0E8h, 25h, 9Dh, 2Eh, 00h, 83h, 0C4h, 04h, 3Bh, 0C3h
    db 74h, 21h, 8Bh, 54h, 24h, 28h, 8Dh, 48h, 08h, 89h, 31h, 89h, 51h, 04h, 8Bh, 54h
    db 24h, 30h, 89h, 79h, 08h, 89h, 58h, 04h, 0C7h, 00h, 18h, 0BDh, 10h, 01h, 89h, 51h
    db 0Ch, 0EBh, 02h, 33h, 0C0h, 3Bh, 0C3h, 8Bh, 4Ch, 24h, 18h, 89h, 01h, 74h, 03h, 0FFh
    db 40h, 04h, 8Bh, 0Dh, 0E8h, 19h, 2Fh, 01h, 8Dh, 54h, 24h, 14h, 52h, 0E8h, 0CAh, 70h
    db 0A7h, 0FFh, 8Dh, 4Ch, 24h, 10h, 0C6h, 44h, 24h, 38h, 0Ch, 0E8h, 0E0h, 0F6h, 2Eh, 00h
    db 68h, 90h, 0C1h, 10h, 01h, 8Dh, 4Ch, 24h, 14h, 0BFh, 0B5h, 0DCh, 40h, 00h, 0E8h, 4Dh
    db 09h, 2Fh, 00h, 51h, 89h, 64h, 24h, 18h, 33h, 0C0h, 89h, 64h, 24h, 18h, 6Ah, 18h
    db 0C6h, 44h, 24h, 40h, 0Fh, 89h, 44h, 24h, 34h, 0E8h, 0A2h, 9Ch, 2Eh, 00h, 83h, 0C4h
    db 04h, 3Bh, 0C3h, 74h, 21h, 8Bh, 54h, 24h, 28h, 8Dh, 48h, 08h, 89h, 31h, 89h, 51h
    db 04h, 8Bh, 54h, 24h, 30h, 89h, 79h, 08h, 89h, 58h, 04h, 0C7h, 00h, 18h, 0BDh, 10h
    db 01h, 89h, 51h, 0Ch, 0EBh, 02h, 33h, 0C0h, 3Bh, 0C3h, 8Bh, 4Ch, 24h, 18h, 89h, 01h
    db 74h, 03h, 0FFh, 40h, 04h, 8Bh, 0Dh, 0E8h, 19h, 2Fh, 01h, 8Dh, 54h, 24h, 14h, 52h
    db 0E8h, 47h, 70h, 0A7h, 0FFh, 8Dh, 4Ch, 24h, 10h, 0C6h, 44h, 24h, 38h, 0Ch, 0E8h, 5Dh
    db 0F6h, 2Eh, 00h, 68h, 08h, 0C1h, 10h, 01h, 8Dh, 4Ch, 24h, 14h, 0BFh, 3Ah, 2Ah, 41h
    db 00h, 0E8h, 0CAh, 08h, 2Fh, 00h, 51h, 89h, 64h, 24h, 18h, 33h, 0C0h, 89h, 64h, 24h
    db 18h, 6Ah, 18h, 0C6h, 44h, 24h, 40h, 10h, 89h, 44h, 24h, 34h, 0E8h, 1Fh, 9Ch, 2Eh
    db 00h, 83h, 0C4h, 04h, 3Bh, 0C3h, 74h, 21h, 8Bh, 54h, 24h, 28h, 8Dh, 48h, 08h, 89h
    db 31h, 89h, 51h, 04h, 8Bh, 54h, 24h, 30h, 89h, 79h, 08h, 89h, 58h, 04h, 0C7h, 00h
    db 18h, 0BDh, 10h, 01h, 89h, 51h, 0Ch, 0EBh, 02h, 33h, 0C0h, 3Bh, 0C3h, 8Bh, 4Ch, 24h
    db 18h, 89h, 01h, 74h, 03h, 0FFh, 40h, 04h, 8Bh, 0Dh, 0E8h, 19h, 2Fh, 01h, 8Dh, 54h
    db 24h, 14h, 52h, 0E8h, 0C4h, 6Fh, 0A7h, 0FFh, 8Dh, 4Ch, 24h, 10h, 0C6h, 44h, 24h, 38h
    db 0Ch, 0E8h, 0DAh, 0F5h, 2Eh, 00h, 68h, 0CCh, 0C0h, 10h, 01h, 8Dh, 4Ch, 24h, 14h, 0BFh
    db 39h, 67h, 41h, 00h, 0E8h, 47h, 08h, 2Fh, 00h, 51h, 89h, 64h, 24h, 18h, 33h, 0C0h
    db 89h, 64h, 24h, 18h, 6Ah, 18h, 0C6h, 44h, 24h, 40h, 11h, 89h, 44h, 24h, 34h, 0E8h
    db 9Ch, 9Bh, 2Eh, 00h, 83h, 0C4h, 04h, 3Bh, 0C3h, 74h, 21h, 8Bh, 54h, 24h, 28h, 8Dh
    db 48h, 08h, 89h, 31h, 89h, 51h, 04h, 8Bh, 54h, 24h, 30h, 89h, 79h, 08h, 89h, 58h
    db 04h, 0C7h, 00h, 18h, 0BDh, 10h, 01h, 89h, 51h, 0Ch, 0EBh, 02h, 33h, 0C0h, 3Bh, 0C3h
    db 8Bh, 4Ch, 24h, 18h, 89h, 01h, 74h, 03h, 0FFh, 40h, 04h, 8Bh, 0Dh, 0E8h, 19h, 2Fh
    db 01h, 8Dh, 54h, 24h, 14h, 52h, 0E8h, 41h, 6Fh, 0A7h, 0FFh, 8Dh, 4Ch, 24h, 10h, 0C6h
    db 44h, 24h, 38h, 0Ch, 0E8h, 57h, 0F5h, 2Eh, 00h, 68h, 0F4h, 0C1h, 10h, 01h, 8Dh, 4Ch
    db 24h, 14h, 0BFh, 79h, 48h, 43h, 00h, 0E8h, 0C4h, 07h, 2Fh, 00h, 51h, 89h, 64h, 24h
    db 18h, 33h, 0C0h, 89h, 64h, 24h, 18h, 6Ah, 18h, 0C6h, 44h, 24h, 40h, 12h, 89h, 44h
    db 24h, 34h, 0E8h, 19h, 9Bh, 2Eh, 00h, 83h, 0C4h, 04h, 3Bh, 0C3h, 74h, 21h, 8Bh, 54h
    db 24h, 28h, 8Dh, 48h, 08h, 89h, 31h, 89h, 51h, 04h, 8Bh, 54h, 24h, 30h, 89h, 79h
    db 08h, 89h, 58h, 04h, 0C7h, 00h, 18h, 0BDh, 10h, 01h, 89h, 51h, 0Ch, 0EBh, 02h, 33h
    db 0C0h, 3Bh, 0C3h, 8Bh, 4Ch, 24h, 18h, 89h, 01h, 74h, 03h, 0FFh, 40h, 04h, 8Bh, 0Dh
    db 0E8h, 19h, 2Fh, 01h, 8Dh, 54h, 24h, 14h, 52h, 0E8h, 0BEh, 6Eh, 0A7h, 0FFh, 8Dh, 4Ch
    db 24h, 10h, 0C6h, 44h, 24h, 38h, 0Ch, 0E8h, 0D4h, 0F4h, 2Eh, 00h, 68h, 0C4h, 0C1h, 10h
    db 01h, 8Dh, 4Ch, 24h, 14h, 0BFh, 52h, 0C4h, 43h, 00h, 0E8h, 41h, 07h, 2Fh, 00h, 51h
    db 89h, 64h, 24h, 18h, 33h, 0C0h, 89h, 64h, 24h, 18h, 6Ah, 18h, 0C6h, 44h, 24h, 40h
    db 13h, 89h, 44h, 24h, 34h, 0E8h, 96h, 9Ah, 2Eh, 00h, 83h, 0C4h, 04h, 3Bh, 0C3h, 74h
    db 21h, 8Bh, 54h, 24h, 28h, 8Dh, 48h, 08h, 89h, 31h, 89h, 51h, 04h, 8Bh, 54h, 24h
    db 30h, 89h, 79h, 08h, 89h, 58h, 04h, 0C7h, 00h, 18h, 0BDh, 10h, 01h, 89h, 51h, 0Ch
    db 0EBh, 02h, 33h, 0C0h, 3Bh, 0C3h, 8Bh, 4Ch, 24h, 18h, 89h, 01h, 74h, 03h, 0FFh, 40h
    db 04h, 8Bh, 0Dh, 0E8h, 19h, 2Fh, 01h, 8Dh, 54h, 24h, 14h, 52h, 0E8h, 3Bh, 6Eh, 0A7h
    db 0FFh, 8Dh, 4Ch, 24h, 10h, 0C6h, 44h, 24h, 38h, 0Ch, 0E8h, 51h, 0F4h, 2Eh, 00h, 68h
    db 24h, 0C2h, 10h, 01h, 8Dh, 4Ch, 24h, 14h, 0BFh, 98h, 23h, 44h, 00h, 0E8h, 0BEh, 06h
    db 2Fh, 00h, 51h, 89h, 64h, 24h, 18h, 33h, 0C0h, 89h, 64h, 24h, 18h, 6Ah, 18h, 0C6h
    db 44h, 24h, 40h, 14h, 89h, 44h, 24h, 34h, 0E8h, 13h, 9Ah, 2Eh, 00h, 83h, 0C4h, 04h
    db 3Bh, 0C3h, 74h, 21h, 8Bh, 54h, 24h, 28h, 8Dh, 48h, 08h, 89h, 31h, 89h, 51h, 04h
    db 8Bh, 54h, 24h, 30h, 89h, 79h, 08h, 89h, 58h, 04h, 0C7h, 00h, 18h, 0BDh, 10h, 01h
    db 89h, 51h, 0Ch, 0EBh, 02h, 33h, 0C0h, 3Bh, 0C3h, 8Bh, 4Ch, 24h, 18h, 89h, 01h, 74h
    db 03h, 0FFh, 40h, 04h, 8Bh, 0Dh, 0E8h, 19h, 2Fh, 01h, 8Dh, 54h, 24h, 14h, 52h, 0E8h
    db 1Fh, 0ABh, 0A8h, 0FFh, 8Dh, 4Ch, 24h, 10h, 0C6h, 44h, 24h, 38h, 0Ch, 0E8h, 0CEh, 0F3h
    db 2Eh, 00h, 68h, 48h, 0C2h, 10h, 01h, 8Dh, 4Ch, 24h, 14h, 0BFh, 0ACh, 0FEh, 40h, 00h
    db 0E8h, 3Bh, 06h, 2Fh, 00h, 51h, 89h, 64h, 24h, 18h, 33h, 0C0h, 89h, 64h, 24h, 18h
    db 6Ah, 18h, 0C6h, 44h, 24h, 40h, 15h, 89h, 44h, 24h, 34h, 0E8h, 90h, 99h, 2Eh, 00h
    db 83h, 0C4h, 04h, 3Bh, 0C3h, 74h, 21h, 8Bh, 54h, 24h, 28h, 8Dh, 48h, 08h, 89h, 31h
    db 89h, 51h, 04h, 8Bh, 54h, 24h, 30h, 89h, 79h, 08h, 89h, 58h, 04h, 0C7h, 00h, 18h
    db 0BDh, 10h, 01h, 89h, 51h, 0Ch, 0EBh, 02h, 33h, 0C0h, 3Bh, 0C3h, 8Bh, 4Ch, 24h, 18h
    db 89h, 01h, 74h, 03h, 0FFh, 40h, 04h, 8Bh, 0Dh, 0E8h, 19h, 2Fh, 01h, 8Dh, 54h, 24h
    db 14h, 52h, 0E8h, 9Ch, 0AAh, 0A8h, 0FFh, 8Dh, 4Ch, 24h, 10h, 0C6h, 44h, 24h, 38h, 0Ch
    db 0E8h, 4Bh, 0F3h, 2Eh, 00h, 68h, 68h, 0C2h, 10h, 01h, 8Dh, 4Ch, 24h, 14h, 0BFh, 3Fh
    db 0F3h, 40h, 00h, 0E8h, 0B8h, 05h, 2Fh, 00h, 51h, 89h, 64h, 24h, 18h, 33h, 0C0h, 89h
    db 64h, 24h, 18h, 6Ah, 18h, 0C6h, 44h, 24h, 40h, 16h, 89h, 44h, 24h, 34h, 0E8h, 0Dh
    db 99h, 2Eh, 00h, 83h, 0C4h, 04h, 3Bh, 0C3h, 74h, 21h, 8Bh, 54h, 24h, 28h, 8Dh, 48h
    db 08h, 89h, 31h, 89h, 51h, 04h, 8Bh, 54h, 24h, 30h, 89h, 79h, 08h, 89h, 58h, 04h
    db 0C7h, 00h, 18h, 0BDh, 10h, 01h, 89h, 51h, 0Ch, 0EBh, 02h, 33h, 0C0h, 3Bh, 0C3h, 8Bh
    db 4Ch, 24h, 18h, 89h, 01h, 74h, 03h, 0FFh, 40h, 04h, 8Bh, 0Dh, 0E8h, 19h, 2Fh, 01h
    db 8Dh, 54h, 24h, 14h, 52h, 0E8h, 19h, 0AAh, 0A8h, 0FFh, 8Dh, 4Ch, 24h, 10h, 0C6h, 44h
    db 24h, 38h, 0Ch, 0E8h, 0C8h, 0F2h, 2Eh, 00h, 68h, 94h, 0C2h, 10h, 01h, 8Dh, 4Ch, 24h
    db 14h, 0BFh, 0D2h, 0Ch, 44h, 00h, 0E8h, 35h, 05h, 2Fh, 00h, 51h, 89h, 64h, 24h, 18h
    db 33h, 0C0h, 89h, 64h, 24h, 18h, 6Ah, 18h, 0C6h, 44h, 24h, 40h, 17h, 89h, 44h, 24h
    db 34h, 0E8h, 8Ah, 98h, 2Eh, 00h, 83h, 0C4h, 04h, 3Bh, 0C3h, 74h, 21h, 8Bh, 54h, 24h
    db 28h, 8Dh, 48h, 08h, 89h, 31h, 89h, 51h, 04h, 8Bh, 54h, 24h, 30h, 89h, 79h, 08h
    db 89h, 58h, 04h, 0C7h, 00h, 18h, 0BDh, 10h, 01h, 89h, 51h, 0Ch, 0EBh, 02h, 33h, 0C0h
    db 3Bh, 0C3h, 8Bh, 4Ch, 24h, 18h, 89h, 01h, 74h, 03h, 0FFh, 40h, 04h, 8Bh, 0Dh, 0E8h
    db 19h, 2Fh, 01h, 8Dh, 54h, 24h, 14h, 52h, 0E8h, 96h, 0A9h, 0A8h, 0FFh, 8Dh, 4Ch, 24h
    db 10h, 0C6h, 44h, 24h, 38h, 0Ch, 0E8h, 45h, 0F2h, 2Eh, 00h, 8Dh, 0BEh, 0B8h, 04h, 00h
    db 00h, 8Dh, 8Eh, 0C4h, 04h, 00h, 00h, 3Bh, 0F9h, 74h, 12h, 2Bh, 0CFh, 8Bh, 0D1h, 0C1h
    db 0E9h, 02h, 33h, 0C0h, 0F3h, 0ABh, 8Bh, 0CAh, 83h, 0E1h, 03h, 0F3h, 0AAh, 8Dh, 86h, 0DCh
    db 04h, 00h, 00h, 3Bh, 0C5h, 0C7h, 44h, 24h, 18h, 00h, 00h, 00h, 00h, 0C7h, 44h, 24h
    db 1Ch, 00h, 00h, 00h, 00h, 74h, 15h, 8Bh, 4Ch, 24h, 18h, 8Bh, 54h, 24h, 1Ch, 90h
    db 89h, 08h, 89h, 50h, 04h, 83h, 0C0h, 08h, 3Bh, 0C5h, 75h, 0F4h, 8Bh, 4Ch, 24h, 30h
    db 5Fh, 8Bh, 0C6h, 5Eh, 5Dh, 64h, 89h, 0Dh, 00h, 00h, 00h, 00h, 5Bh, 83h, 0C4h, 2Ch
    db 0C3h
??0Rva00597FC0Client@@QAE@XZ ENDP
_TEXT ENDS
END
