.386
.model flat
; VP6 codec MMX block transform (spread-table tier). Retail saves edx/ecx/ebx
; and returns with no compiler frame (push edx/ecx/ebx .. pop ebx/ecx/edx,
; plain ret at 0x009C4B68, INT3 padding after), so the whole body is
; hand-scheduled MMX: qword gathers masked by the spread table, two pmulhw
; factor rounds against table words at +0x20..+0x58, punpcklwd/hwd widening
; chains with psllw/psrlw-by-4 scaling, and sixteen movq stores over the
; 128-byte in/out block. VC7.1 /O2 cannot reproduce this schedule from C++ or
; intrinsics: the sibling 0x009C4450 intrinsic transcription measured 1421
; bytes with 952 differences and the 0x009C80C0 intrinsic form measured 108
; bytes against retail's 98. The codec family keeps such bodies as MASM dumps
; with their measured blocker, beside Rva009C3D50QuantMulWmt.asm and
; Rva009C80C0Idct1Wmt.asm. Exactly one HIGHLOW site lies inside the body
; (RVA 0x009C487E -> 0x01356640), symbolic below.
; Evidence: targets/game/reverse/identity_evidence/009c4860-vp6-mmx-schedule.md
; ?Rva009C4860@@YAXPBFPAF@Z
; Retail @ 0x009C4860 size 777
EXTERN ?Rva009B3A00Table@@3PAGA:BYTE
_TEXT SEGMENT
public ?Rva009C4860@@YAXPBFPAF@Z
?Rva009C4860@@YAXPBFPAF@Z PROC
    db 052h, 051h, 053h, 08Bh, 044h, 024h, 010h, 08Bh, 054h, 024h, 014h, 08Bh, 00Ah, 08Bh, 05Ah, 01Ch
    db 08Bh, 04Ah, 038h, 08Bh, 05Ah, 054h, 08Bh, 04Ah, 070h, 08Bh, 05Ah, 07Ch, 08Dh, 00Dh
    dd ?Rva009B3A00Table@@3PAGA
    db 00Fh, 06Fh, 000h, 00Fh, 0EFh, 0C9h, 00Fh, 06Fh, 011h, 00Fh, 07Fh, 0C3h, 00Fh, 0EFh, 0E4h, 00Fh
    db 073h, 0D0h, 010h, 00Fh, 0DBh, 0DAh, 00Fh, 07Fh, 0C5h, 00Fh, 07Fh, 0CEh, 00Fh, 0DBh, 0EAh, 00Fh
    db 06Fh, 079h, 018h, 00Fh, 0EFh, 0C5h, 00Fh, 0DBh, 0FEh, 00Fh, 0EBh, 0C3h, 00Fh, 0EFh, 0F7h, 00Fh
    db 0EBh, 0C7h, 00Fh, 06Fh, 079h, 018h, 00Fh, 07Fh, 0E3h, 00Fh, 07Fh, 002h, 00Fh, 0DBh, 0DAh, 00Fh
    db 073h, 0F3h, 010h, 00Fh, 0DBh, 0F9h, 00Fh, 0EBh, 0EBh, 00Fh, 0EBh, 0FEh, 00Fh, 0EBh, 0FDh, 00Fh
    db 073h, 0D4h, 010h, 00Fh, 07Fh, 07Ah, 010h, 00Fh, 07Fh, 062h, 020h, 00Fh, 07Fh, 062h, 030h, 00Fh
    db 07Fh, 062h, 008h, 00Fh, 07Fh, 062h, 018h, 00Fh, 07Fh, 062h, 028h, 00Fh, 07Fh, 062h, 038h, 00Fh
    db 07Fh, 062h, 078h, 00Fh, 07Fh, 062h, 068h, 00Fh, 07Fh, 062h, 058h, 00Fh, 07Fh, 062h, 048h, 00Fh
    db 07Fh, 062h, 070h, 00Fh, 07Fh, 062h, 060h, 00Fh, 07Fh, 062h, 050h, 00Fh, 07Fh, 062h, 040h, 00Fh
    db 06Fh, 07Ah, 010h, 00Fh, 06Fh, 041h, 020h, 00Fh, 06Fh, 059h, 050h, 00Fh, 0E5h, 0C7h, 00Fh, 0E5h
    db 0DFh, 00Fh, 06Fh, 032h, 00Fh, 06Fh, 061h, 038h, 00Fh, 0FDh, 0C7h, 00Fh, 07Fh, 0F1h, 00Fh, 0E5h
    db 0F4h, 00Fh, 07Fh, 0C2h, 00Fh, 07Fh, 0DDh, 00Fh, 0E5h, 0D4h, 00Fh, 0E5h, 0ECh, 00Fh, 0FDh, 0F1h
    db 00Fh, 07Fh, 0F4h, 00Fh, 0FDh, 0D0h, 00Fh, 0FDh, 0EBh, 00Fh, 07Fh, 0F7h, 00Fh, 07Fh, 0E9h, 00Fh
    db 0F9h, 0F2h, 00Fh, 0F9h, 0E3h, 00Fh, 0F9h, 0F8h, 00Fh, 0FDh, 0D2h, 00Fh, 0FDh, 0DBh, 00Fh, 0FDh
    db 0C0h, 00Fh, 0FDh, 0D6h, 00Fh, 0FDh, 0DCh, 00Fh, 0F9h, 0D1h, 00Fh, 0F9h, 0F5h, 00Fh, 0FDh, 0C9h
    db 00Fh, 0FDh, 0EDh, 00Fh, 0FDh, 0C7h, 00Fh, 0FDh, 0CAh, 00Fh, 07Fh, 04Ah, 010h, 00Fh, 0FDh, 0EEh
    db 00Fh, 07Fh, 0E1h, 00Fh, 061h, 0E5h, 00Fh, 07Fh, 002h, 00Fh, 069h, 0CDh, 00Fh, 07Fh, 0F0h, 00Fh
    db 061h, 0F7h, 00Fh, 07Fh, 0E5h, 00Fh, 062h, 0E6h, 00Fh, 06Ah, 0EEh, 00Fh, 07Fh, 0CEh, 00Fh, 07Fh
    db 062h, 008h, 00Fh, 069h, 0C7h, 00Fh, 07Fh, 06Ah, 018h, 00Fh, 06Ah, 0F0h, 00Fh, 06Fh, 022h, 00Fh
    db 062h, 0C8h, 00Fh, 06Fh, 06Ah, 010h, 00Fh, 07Fh, 0E0h, 00Fh, 07Fh, 072h, 038h, 00Fh, 061h, 0C5h
    db 00Fh, 07Fh, 04Ah, 028h, 00Fh, 069h, 0E5h, 00Fh, 07Fh, 0D5h, 00Fh, 061h, 0D3h, 00Fh, 07Fh, 0C1h
    db 00Fh, 062h, 0C2h, 00Fh, 06Ah, 0CAh, 00Fh, 07Fh, 0E2h, 00Fh, 07Fh, 002h, 00Fh, 069h, 0EBh, 00Fh
    db 07Fh, 04Ah, 010h, 00Fh, 06Ah, 0E5h, 00Fh, 062h, 0D5h, 00Fh, 07Fh, 062h, 030h, 00Fh, 07Fh, 052h
    db 020h, 00Fh, 06Fh, 07Ah, 010h, 00Fh, 06Fh, 041h, 020h, 00Fh, 06Fh, 059h, 050h, 00Fh, 0E5h, 0C7h
    db 00Fh, 0E5h, 0DFh, 00Fh, 06Fh, 032h, 00Fh, 06Fh, 061h, 038h, 00Fh, 0FDh, 0C7h, 00Fh, 07Fh, 0F1h
    db 00Fh, 0E5h, 0F4h, 00Fh, 07Fh, 0C2h, 00Fh, 07Fh, 0DDh, 00Fh, 0E5h, 0D4h, 00Fh, 0E5h, 0ECh, 00Fh
    db 0FDh, 0F1h, 00Fh, 07Fh, 0F4h, 00Fh, 0FDh, 071h, 058h, 00Fh, 0FDh, 061h, 058h, 00Fh, 0FDh, 0D0h
    db 00Fh, 0FDh, 0EBh, 00Fh, 07Fh, 0F7h, 00Fh, 07Fh, 0E9h, 00Fh, 0F9h, 0F2h, 00Fh, 0F9h, 0E3h, 00Fh
    db 0F9h, 0F8h, 00Fh, 0FDh, 0D2h, 00Fh, 0FDh, 0DBh, 00Fh, 0FDh, 0C0h, 00Fh, 0FDh, 0D6h, 00Fh, 0FDh
    db 0DCh, 00Fh, 071h, 0E4h, 004h, 00Fh, 07Fh, 062h, 040h, 00Fh, 071h, 0E3h, 004h, 00Fh, 07Fh, 05Ah
    db 030h, 00Fh, 0F9h, 0D1h, 00Fh, 0F9h, 0F5h, 00Fh, 0FDh, 0C9h, 00Fh, 0FDh, 0EDh, 00Fh, 0FDh, 0C7h
    db 00Fh, 0FDh, 0CAh, 00Fh, 071h, 0E7h, 004h, 00Fh, 071h, 0E2h, 004h, 00Fh, 071h, 0E0h, 004h, 00Fh
    db 071h, 0E1h, 004h, 00Fh, 07Fh, 07Ah, 070h, 00Fh, 07Fh, 002h, 00Fh, 07Fh, 04Ah, 010h, 00Fh, 07Fh
    db 052h, 020h, 00Fh, 07Fh, 04Ah, 010h, 00Fh, 0FDh, 0EEh, 00Fh, 071h, 0E5h, 004h, 00Fh, 07Fh, 06Ah
    db 050h, 00Fh, 071h, 0E6h, 004h, 00Fh, 07Fh, 072h, 060h, 00Fh, 06Fh, 07Ah, 018h, 00Fh, 06Fh, 041h
    db 020h, 00Fh, 06Fh, 059h, 050h, 00Fh, 0E5h, 0C7h, 00Fh, 0E5h, 0DFh, 00Fh, 06Fh, 072h, 008h, 00Fh
    db 06Fh, 061h, 038h, 00Fh, 0FDh, 0C7h, 00Fh, 07Fh, 0F1h, 00Fh, 0E5h, 0F4h, 00Fh, 07Fh, 0C2h, 00Fh
    db 07Fh, 0DDh, 00Fh, 0E5h, 0D4h, 00Fh, 0E5h, 0ECh, 00Fh, 0FDh, 0F1h, 00Fh, 07Fh, 0F4h, 00Fh, 0FDh
    db 071h, 058h, 00Fh, 0FDh, 061h, 058h, 00Fh, 0FDh, 0D0h, 00Fh, 0FDh, 0EBh, 00Fh, 07Fh, 0F7h, 00Fh
    db 07Fh, 0E9h, 00Fh, 0F9h, 0F2h, 00Fh, 0F9h, 0E3h, 00Fh, 0F9h, 0F8h, 00Fh, 0FDh, 0D2h, 00Fh, 0FDh
    db 0DBh, 00Fh, 0FDh, 0C0h, 00Fh, 0FDh, 0D6h, 00Fh, 0FDh, 0DCh, 00Fh, 071h, 0E4h, 004h, 00Fh, 07Fh
    db 062h, 048h, 00Fh, 071h, 0E3h, 004h, 00Fh, 07Fh, 05Ah, 038h, 00Fh, 0F9h, 0D1h, 00Fh, 0F9h, 0F5h
    db 00Fh, 0FDh, 0C9h, 00Fh, 0FDh, 0EDh, 00Fh, 0FDh, 0C7h, 00Fh, 0FDh, 0CAh, 00Fh, 071h, 0E7h, 004h
    db 00Fh, 071h, 0E2h, 004h, 00Fh, 071h, 0E0h, 004h, 00Fh, 071h, 0E1h, 004h, 00Fh, 07Fh, 07Ah, 078h
    db 00Fh, 07Fh, 042h, 008h, 00Fh, 07Fh, 04Ah, 018h, 00Fh, 07Fh, 052h, 028h, 00Fh, 07Fh, 04Ah, 018h
    db 00Fh, 0FDh, 0EEh, 00Fh, 071h, 0E5h, 004h, 00Fh, 07Fh, 06Ah, 058h, 00Fh, 071h, 0E6h, 004h, 00Fh
    db 07Fh, 072h, 068h, 05Bh, 059h, 05Ah, 0C3h
?Rva009C4860@@YAXPBFPAF@Z ENDP
_TEXT ENDS
END
