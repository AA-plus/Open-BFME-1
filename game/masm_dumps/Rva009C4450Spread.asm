.386
.model flat
; ?Rva009C4450@@YAXXZ
; Retail @ 0x009C4450 size 1034
;
; MASM dump carrying a proven codegen blocker. Retail saves edx, ecx, ebx on
; entry and restores them in reverse at exit, with no frame; the one relocation
; is the coefficient `lea ecx, [0x01356640]` at +0x20. VC7.1 /O2 emits its own
; `push ebx` ahead of any inline __asm block that uses EBX, so clean C++ and an
; MMX-intrinsic transcription cannot own this prologue: the banked inline-asm
; C++ differs only in the six callee-save bytes, /Od does not help, and the
; intrinsic rewrite measures 1421 bytes with 952 differences. Complete leaf:
; no call or branch in the body, RET at RVA 0x009C4859, then INT3 padding.
; The coefficient operand resolves as the pinned ?Rva009B3A00Table@@3PAGA at
; 0x01356640 (dir32_addresses.csv), the 16-bit codec spread table. Evidence:
; targets/game/reverse/identity_evidence/009c4450-masm-codegen-blocker.md
EXTERN ?Rva009B3A00Table@@3PAGA:BYTE
_TEXT SEGMENT
public ?Rva009C4450@@YAXXZ
?Rva009C4450@@YAXXZ PROC
    db 052h, 051h, 053h, 08Bh, 044h, 024h, 010h, 08Bh, 054h, 024h, 018h, 08Bh, 00Ah, 08Bh, 05Ah, 01Ch
    db 08Bh, 04Ah, 038h, 08Bh, 05Ah, 054h, 08Bh, 04Ah, 070h, 08Bh, 05Ah, 07Ch, 08Bh, 05Ch, 024h, 014h
    db 08Dh, 00Dh
    dd ?Rva009B3A00Table@@3PAGA
    db 00Fh, 06Fh, 000h, 00Fh, 0D5h, 003h, 00Fh, 06Fh, 048h, 010h, 00Fh, 0D5h, 04Bh, 010h, 00Fh, 06Fh
    db 050h, 020h, 00Fh, 0D5h, 053h, 020h, 00Fh, 06Fh, 058h, 030h, 00Fh, 0D5h, 05Bh, 030h, 00Fh, 07Fh
    db 002h, 00Fh, 0EFh, 0EDh, 00Fh, 07Fh, 06Ah, 008h, 00Fh, 07Fh, 04Ah, 010h, 00Fh, 07Fh, 06Ah, 018h
    db 00Fh, 07Fh, 052h, 020h, 00Fh, 07Fh, 06Ah, 028h, 00Fh, 07Fh, 05Ah, 030h, 00Fh, 07Fh, 06Ah, 038h
    db 00Fh, 07Fh, 06Ah, 040h, 00Fh, 07Fh, 06Ah, 048h, 00Fh, 07Fh, 06Ah, 050h, 00Fh, 07Fh, 06Ah, 058h
    db 00Fh, 07Fh, 06Ah, 060h, 00Fh, 07Fh, 06Ah, 068h, 00Fh, 07Fh, 06Ah, 070h, 00Fh, 07Fh, 06Ah, 078h
    db 00Fh, 06Fh, 052h, 030h, 090h, 00Fh, 06Fh, 071h, 030h, 00Fh, 07Fh, 0D4h, 00Fh, 06Fh, 049h, 040h
    db 00Fh, 0E5h, 0E6h, 00Fh, 06Fh, 05Ah, 010h, 00Fh, 0E5h, 0CAh, 00Fh, 06Fh, 041h, 020h, 00Fh, 0FDh
    db 0E2h, 00Fh, 0EFh, 0F6h, 00Fh, 0FDh, 0D1h, 00Fh, 06Fh, 06Ah, 020h, 00Fh, 0E5h, 0C3h, 00Fh, 07Fh
    db 0E9h, 00Fh, 0FDh, 0C3h, 00Fh, 0E5h, 059h, 050h, 00Fh, 0E9h, 0F2h, 00Fh, 0E5h, 069h, 028h, 00Fh
    db 0E9h, 0C4h, 00Fh, 06Fh, 07Ah, 020h, 00Fh, 0EDh, 0E4h, 00Fh, 0FDh, 0FDh, 00Fh, 0EDh, 0E0h, 00Fh
    db 0E5h, 049h, 048h, 00Fh, 0E9h, 0DEh, 00Fh, 07Fh, 062h, 010h, 00Fh, 0EDh, 0F6h, 00Fh, 06Fh, 061h
    db 038h, 00Fh, 0EDh, 0F3h, 00Fh, 07Fh, 0DDh, 00Fh, 0E5h, 0DCh, 00Fh, 07Fh, 072h, 020h, 00Fh, 07Fh
    db 0C2h, 00Fh, 06Fh, 032h, 00Fh, 0E5h, 0C4h, 00Fh, 0FDh, 0EBh, 00Fh, 0FDh, 0D0h, 00Fh, 0E9h, 0E9h
    db 00Fh, 0E5h, 0F4h, 00Fh, 0FDh, 032h, 00Fh, 0EDh, 0C9h, 00Fh, 07Fh, 0F4h, 00Fh, 0EDh, 0CDh, 00Fh
    db 0E9h, 0F2h, 00Fh, 0EDh, 0D2h, 00Fh, 06Fh, 042h, 010h, 00Fh, 0EDh, 0D6h, 00Fh, 0E9h, 0D1h, 090h
    db 00Fh, 06Fh, 05Ah, 020h, 00Fh, 0E9h, 0E7h, 00Fh, 0EDh, 0C9h, 00Fh, 0EDh, 0FFh, 00Fh, 0EDh, 0CAh
    db 00Fh, 0EDh, 0FCh, 00Fh, 0E9h, 0E3h, 00Fh, 0EDh, 0DBh, 00Fh, 0E9h, 0F5h, 00Fh, 0EDh, 0EDh, 00Fh
    db 0EDh, 0DCh, 00Fh, 0EDh, 0EEh, 00Fh, 0E9h, 0F8h, 00Fh, 0EDh, 0C0h, 00Fh, 07Fh, 04Ah, 010h, 00Fh
    db 0EDh, 0C7h, 00Fh, 07Fh, 0E1h, 00Fh, 061h, 0E5h, 00Fh, 07Fh, 002h, 00Fh, 069h, 0CDh, 00Fh, 07Fh
    db 0F0h, 00Fh, 061h, 0F7h, 00Fh, 07Fh, 0E5h, 00Fh, 062h, 0E6h, 00Fh, 06Ah, 0EEh, 00Fh, 07Fh, 0CEh
    db 00Fh, 07Fh, 062h, 008h, 00Fh, 069h, 0C7h, 00Fh, 07Fh, 06Ah, 018h, 00Fh, 06Ah, 0F0h, 00Fh, 06Fh
    db 022h, 00Fh, 062h, 0C8h, 00Fh, 06Fh, 06Ah, 010h, 00Fh, 07Fh, 0E0h, 00Fh, 07Fh, 072h, 038h, 00Fh
    db 061h, 0C5h, 00Fh, 07Fh, 04Ah, 028h, 00Fh, 069h, 0E5h, 00Fh, 07Fh, 0D5h, 00Fh, 061h, 0D3h, 00Fh
    db 07Fh, 0C1h, 00Fh, 062h, 0C2h, 00Fh, 06Ah, 0CAh, 00Fh, 07Fh, 0E2h, 00Fh, 07Fh, 002h, 00Fh, 069h
    db 0EBh, 00Fh, 07Fh, 04Ah, 010h, 00Fh, 06Ah, 0E5h, 00Fh, 062h, 0D5h, 00Fh, 07Fh, 062h, 030h, 00Fh
    db 07Fh, 052h, 020h, 00Fh, 06Fh, 052h, 030h, 090h, 00Fh, 06Fh, 071h, 030h, 00Fh, 07Fh, 0D4h, 00Fh
    db 06Fh, 049h, 040h, 00Fh, 0E5h, 0E6h, 00Fh, 06Fh, 05Ah, 010h, 00Fh, 0E5h, 0CAh, 00Fh, 06Fh, 041h
    db 020h, 00Fh, 0FDh, 0E2h, 00Fh, 0EFh, 0F6h, 00Fh, 0FDh, 0D1h, 00Fh, 06Fh, 06Ah, 020h, 00Fh, 0E5h
    db 0C3h, 00Fh, 07Fh, 0E9h, 00Fh, 0FDh, 0C3h, 00Fh, 0E5h, 059h, 050h, 00Fh, 0E9h, 0F2h, 00Fh, 0E5h
    db 069h, 028h, 00Fh, 0E9h, 0C4h, 00Fh, 06Fh, 07Ah, 020h, 00Fh, 0EDh, 0E4h, 00Fh, 0FDh, 0FDh, 00Fh
    db 0EDh, 0E0h, 00Fh, 0E5h, 049h, 048h, 00Fh, 0E9h, 0DEh, 00Fh, 07Fh, 062h, 010h, 00Fh, 0EDh, 0F6h
    db 00Fh, 06Fh, 061h, 038h, 00Fh, 0EDh, 0F3h, 00Fh, 07Fh, 0DDh, 00Fh, 0E5h, 0DCh, 00Fh, 07Fh, 072h
    db 020h, 00Fh, 07Fh, 0C2h, 00Fh, 06Fh, 032h, 00Fh, 0E5h, 0C4h, 00Fh, 0FDh, 0EBh, 00Fh, 0FDh, 0D0h
    db 00Fh, 0E9h, 0E9h, 00Fh, 0E5h, 0F4h, 00Fh, 0FDh, 032h, 00Fh, 0EDh, 0C9h, 00Fh, 07Fh, 0F4h, 00Fh
    db 0EDh, 0CDh, 00Fh, 0E9h, 0F2h, 00Fh, 0EDh, 0D2h, 00Fh, 06Fh, 042h, 010h, 00Fh, 0EDh, 0D6h, 00Fh
    db 0E9h, 0D1h, 090h, 00Fh, 0EDh, 051h, 058h, 00Fh, 0EDh, 0C9h, 00Fh, 0EDh, 0CAh, 00Fh, 071h, 0E2h
    db 004h, 00Fh, 0E9h, 0E7h, 00Fh, 071h, 0E1h, 004h, 00Fh, 06Fh, 05Ah, 020h, 00Fh, 0EDh, 0FFh, 00Fh
    db 07Fh, 052h, 020h, 00Fh, 0EDh, 0FCh, 00Fh, 07Fh, 04Ah, 010h, 00Fh, 0E9h, 0E3h, 00Fh, 0EDh, 061h
    db 058h, 00Fh, 0EDh, 0DBh, 00Fh, 0EDh, 0DCh, 00Fh, 071h, 0E4h, 004h, 00Fh, 0E9h, 0F5h, 00Fh, 071h
    db 0E3h, 004h, 00Fh, 0EDh, 071h, 058h, 00Fh, 0EDh, 0EDh, 00Fh, 0EDh, 0EEh, 00Fh, 071h, 0E6h, 004h
    db 00Fh, 07Fh, 062h, 040h, 00Fh, 071h, 0E5h, 004h, 00Fh, 07Fh, 05Ah, 030h, 00Fh, 0E9h, 0F8h, 00Fh
    db 0EDh, 079h, 058h, 00Fh, 0EDh, 0C0h, 00Fh, 0EDh, 0C7h, 00Fh, 071h, 0E7h, 004h, 00Fh, 07Fh, 072h
    db 060h, 00Fh, 071h, 0E0h, 004h, 00Fh, 07Fh, 06Ah, 050h, 00Fh, 07Fh, 07Ah, 070h, 00Fh, 07Fh, 002h
    db 00Fh, 06Fh, 052h, 038h, 090h, 00Fh, 06Fh, 071h, 030h, 00Fh, 07Fh, 0D4h, 00Fh, 06Fh, 049h, 040h
    db 00Fh, 0E5h, 0E6h, 00Fh, 06Fh, 05Ah, 018h, 00Fh, 0E5h, 0CAh, 00Fh, 06Fh, 041h, 020h, 00Fh, 0FDh
    db 0E2h, 00Fh, 0EFh, 0F6h, 00Fh, 0FDh, 0D1h, 00Fh, 06Fh, 06Ah, 028h, 00Fh, 0E5h, 0C3h, 00Fh, 07Fh
    db 0E9h, 00Fh, 0FDh, 0C3h, 00Fh, 0E5h, 059h, 050h, 00Fh, 0E9h, 0F2h, 00Fh, 0E5h, 069h, 028h, 00Fh
    db 0E9h, 0C4h, 00Fh, 06Fh, 07Ah, 028h, 00Fh, 0EDh, 0E4h, 00Fh, 0FDh, 0FDh, 00Fh, 0EDh, 0E0h, 00Fh
    db 0E5h, 049h, 048h, 00Fh, 0E9h, 0DEh, 00Fh, 07Fh, 062h, 018h, 00Fh, 0EDh, 0F6h, 00Fh, 06Fh, 061h
    db 038h, 00Fh, 0EDh, 0F3h, 00Fh, 07Fh, 0DDh, 00Fh, 0E5h, 0DCh, 00Fh, 07Fh, 072h, 028h, 00Fh, 07Fh
    db 0C2h, 00Fh, 06Fh, 072h, 008h, 00Fh, 0E5h, 0C4h, 00Fh, 0FDh, 0EBh, 00Fh, 0FDh, 0D0h, 00Fh, 0E9h
    db 0E9h, 00Fh, 0E5h, 0F4h, 00Fh, 0FDh, 072h, 008h, 00Fh, 0EDh, 0C9h, 00Fh, 07Fh, 0F4h, 00Fh, 0EDh
    db 0CDh, 00Fh, 0E9h, 0F2h, 00Fh, 0EDh, 0D2h, 00Fh, 06Fh, 042h, 018h, 00Fh, 0EDh, 0D6h, 00Fh, 0E9h
    db 0D1h, 090h, 00Fh, 0EDh, 051h, 058h, 00Fh, 0EDh, 0C9h, 00Fh, 0EDh, 0CAh, 00Fh, 071h, 0E2h, 004h
    db 00Fh, 0E9h, 0E7h, 00Fh, 071h, 0E1h, 004h, 00Fh, 06Fh, 05Ah, 028h, 00Fh, 0EDh, 0FFh, 00Fh, 07Fh
    db 052h, 028h, 00Fh, 0EDh, 0FCh, 00Fh, 07Fh, 04Ah, 018h, 00Fh, 0E9h, 0E3h, 00Fh, 0EDh, 061h, 058h
    db 00Fh, 0EDh, 0DBh, 00Fh, 0EDh, 0DCh, 00Fh, 071h, 0E4h, 004h, 00Fh, 0E9h, 0F5h, 00Fh, 071h, 0E3h
    db 004h, 00Fh, 0EDh, 071h, 058h, 00Fh, 0EDh, 0EDh, 00Fh, 0EDh, 0EEh, 00Fh, 071h, 0E6h, 004h, 00Fh
    db 07Fh, 062h, 048h, 00Fh, 071h, 0E5h, 004h, 00Fh, 07Fh, 05Ah, 038h, 00Fh, 0E9h, 0F8h, 00Fh, 0EDh
    db 079h, 058h, 00Fh, 0EDh, 0C0h, 00Fh, 0EDh, 0C7h, 00Fh, 071h, 0E7h, 004h, 00Fh, 07Fh, 072h, 068h
    db 00Fh, 071h, 0E0h, 004h, 00Fh, 07Fh, 06Ah, 058h, 00Fh, 07Fh, 07Ah, 078h, 00Fh, 07Fh, 042h, 008h
    db 05Bh, 059h, 05Ah, 0C3h
?Rva009C4450@@YAXXZ ENDP
_TEXT ENDS
END
