.386
.model flat
; Codec spread-table MMX block transform. Retail saves edx/ecx/ebx and returns
; with no compiler frame (push edx/ecx/ebx .. pop ebx/ecx/edx, ret at
; 0x009C4440 + INT3), so the whole body is hand-scheduled MMX: a pmullw
; coefficient/quantizer pass over the 8x8 block, two pmulhw + paddsw/psubsw
; butterfly rounds seeded from the spread table ?Rva009B3A00Table@@3PAGA
; (VA 0x01356640, recorded in targets/game/reverse/dir32_addresses.csv), and
; eight psraw-scaled movq stores back over the quant block. The landing
; source was an entire-body naked __asm lift, which tools/conversion_gate.py
; refuses under game/ (a lift is not a conversion), and no C++ or intrinsic
; reconstruction has been measured to reproduce this schedule; this codec
; family keeps such bodies as MASM dumps with their blocker, the same lane as
; its sibling Rva009C80C0Idct1Wmt.asm (108-vs-98 rejection of its intrinsic
; form). The single relocation is symbolic below.
; Evidence: targets/game/reverse/identity_evidence/009c3d50-wmt-mmx-schedule.md
; ?Rva009C3D50@@YAXPBF0PAF@Z
; Retail @ 0x009C3D50 size 1777
EXTERN ?Rva009B3A00Table@@3PAGA:BYTE
_TEXT SEGMENT
public ?Rva009C3D50@@YAXPBF0PAF@Z
?Rva009C3D50@@YAXPBF0PAF@Z PROC
    db 052h, 051h, 053h, 08Bh, 044h, 024h, 010h, 08Bh, 054h, 024h, 018h, 08Bh, 00Ah, 08Bh, 05Ah, 01Ch
    db 08Bh, 04Ah, 038h, 08Bh, 05Ah, 054h, 08Bh, 04Ah, 070h, 08Bh, 05Ah, 07Ch, 08Bh, 05Ch, 024h, 014h
    db 08Dh, 00Dh
    dd ?Rva009B3A00Table@@3PAGA
    db 00Fh, 06Fh, 000h, 00Fh, 0D5h, 003h, 00Fh, 06Fh, 048h, 008h, 00Fh, 0D5h, 04Bh, 008h, 00Fh, 06Fh
    db 050h, 010h, 00Fh, 0D5h, 053h, 010h, 00Fh, 06Fh, 058h, 018h, 00Fh, 0D5h, 05Bh, 018h, 00Fh, 06Fh
    db 060h, 020h, 00Fh, 0D5h, 063h, 020h, 00Fh, 06Fh, 068h, 028h, 00Fh, 0D5h, 06Bh, 028h, 00Fh, 06Fh
    db 070h, 030h, 00Fh, 0D5h, 073h, 030h, 00Fh, 06Fh, 078h, 038h, 00Fh, 0D5h, 07Bh, 038h, 00Fh, 07Fh
    db 002h, 00Fh, 07Fh, 04Ah, 008h, 00Fh, 07Fh, 052h, 010h, 00Fh, 07Fh, 05Ah, 018h, 00Fh, 07Fh, 062h
    db 020h, 00Fh, 07Fh, 06Ah, 028h, 00Fh, 07Fh, 072h, 030h, 00Fh, 07Fh, 07Ah, 038h, 00Fh, 06Fh, 040h
    db 040h, 00Fh, 0D5h, 043h, 040h, 00Fh, 06Fh, 048h, 048h, 00Fh, 0D5h, 04Bh, 048h, 00Fh, 06Fh, 050h
    db 050h, 00Fh, 0D5h, 053h, 050h, 00Fh, 06Fh, 058h, 058h, 00Fh, 0D5h, 05Bh, 058h, 00Fh, 06Fh, 060h
    db 060h, 00Fh, 0D5h, 063h, 060h, 00Fh, 06Fh, 068h, 068h, 00Fh, 0D5h, 06Bh, 068h, 00Fh, 06Fh, 070h
    db 070h, 00Fh, 0D5h, 073h, 070h, 00Fh, 06Fh, 078h, 078h, 00Fh, 0D5h, 07Bh, 078h, 00Fh, 07Fh, 042h
    db 040h, 00Fh, 07Fh, 04Ah, 048h, 00Fh, 07Fh, 052h, 050h, 00Fh, 07Fh, 05Ah, 058h, 00Fh, 07Fh, 062h
    db 060h, 00Fh, 07Fh, 06Ah, 068h, 00Fh, 07Fh, 072h, 070h, 00Fh, 07Fh, 07Ah, 078h, 00Fh, 06Fh, 052h
    db 030h, 00Fh, 06Fh, 071h, 030h, 00Fh, 07Fh, 0D4h, 00Fh, 06Fh, 07Ah, 018h, 00Fh, 0E5h, 0E6h, 00Fh
    db 06Fh, 049h, 040h, 00Fh, 0E5h, 0F7h, 00Fh, 07Fh, 0CDh, 00Fh, 0E5h, 0CAh, 00Fh, 06Fh, 05Ah, 010h
    db 00Fh, 0E5h, 0EFh, 00Fh, 06Fh, 041h, 020h, 00Fh, 0FDh, 0E2h, 00Fh, 0FDh, 0F7h, 00Fh, 0FDh, 0D1h
    db 00Fh, 06Fh, 04Ah, 038h, 00Fh, 0FDh, 0FDh, 00Fh, 07Fh, 0C5h, 00Fh, 0E5h, 0C3h, 00Fh, 0EDh, 0E7h
    db 00Fh, 0E5h, 0E9h, 00Fh, 06Fh, 079h, 050h, 00Fh, 0E9h, 0F2h, 00Fh, 0FDh, 0C3h, 00Fh, 0E5h, 0DFh
    db 00Fh, 06Fh, 052h, 020h, 00Fh, 0E5h, 0F9h, 00Fh, 0FDh, 0E9h, 00Fh, 07Fh, 0D1h, 00Fh, 0E5h, 051h
    db 028h, 00Fh, 0E9h, 0DDh, 00Fh, 06Fh, 06Ah, 028h, 00Fh, 0EDh, 0C7h, 00Fh, 07Fh, 0EFh, 00Fh, 0E9h
    db 0C4h, 00Fh, 0E5h, 069h, 028h, 00Fh, 0FDh, 0D1h, 00Fh, 0E5h, 049h, 048h, 00Fh, 0EDh, 0E4h, 00Fh
    db 0EDh, 0E0h, 00Fh, 0E9h, 0DEh, 00Fh, 0FDh, 0EFh, 00Fh, 0EDh, 0F6h, 00Fh, 0E5h, 079h, 048h, 00Fh
    db 0EDh, 0F3h, 00Fh, 07Fh, 062h, 010h, 00Fh, 0E9h, 0CDh, 00Fh, 06Fh, 061h, 038h, 00Fh, 07Fh, 0DDh
    db 00Fh, 0E5h, 0DCh, 00Fh, 0EDh, 0FAh, 00Fh, 07Fh, 072h, 020h, 00Fh, 07Fh, 0C2h, 00Fh, 06Fh, 032h
    db 00Fh, 0E5h, 0C4h, 00Fh, 0FDh, 0EBh, 00Fh, 06Fh, 05Ah, 008h, 00Fh, 0E9h, 0E9h, 00Fh, 0FDh, 0D0h
    db 00Fh, 0E9h, 0F3h, 00Fh, 07Fh, 0F0h, 00Fh, 0E5h, 0F4h, 00Fh, 0EDh, 0DBh, 00Fh, 0EDh, 0C9h, 00Fh
    db 0EDh, 0D8h, 00Fh, 0EDh, 0CDh, 00Fh, 0E5h, 0E3h, 00Fh, 0EDh, 0F0h, 00Fh, 0E9h, 0F2h, 00Fh, 0EDh
    db 0D2h, 00Fh, 06Fh, 042h, 010h, 00Fh, 0EDh, 0D6h, 00Fh, 0FDh, 0E3h, 00Fh, 0E9h, 0D1h, 00Fh, 06Fh
    db 05Ah, 020h, 00Fh, 0E9h, 0E7h, 00Fh, 0EDh, 0C9h, 00Fh, 0EDh, 0FFh, 00Fh, 0EDh, 0CAh, 00Fh, 0EDh
    db 0FCh, 00Fh, 0E9h, 0E3h, 00Fh, 0EDh, 0DBh, 00Fh, 0E9h, 0F5h, 00Fh, 0EDh, 0EDh, 00Fh, 0EDh, 0DCh
    db 00Fh, 0EDh, 0EEh, 00Fh, 0E9h, 0F8h, 00Fh, 0EDh, 0C0h, 00Fh, 07Fh, 04Ah, 010h, 00Fh, 0EDh, 0C7h
    db 00Fh, 07Fh, 0E1h, 00Fh, 061h, 0E5h, 00Fh, 07Fh, 002h, 00Fh, 069h, 0CDh, 00Fh, 07Fh, 0F0h, 00Fh
    db 061h, 0F7h, 00Fh, 07Fh, 0E5h, 00Fh, 062h, 0E6h, 00Fh, 06Ah, 0EEh, 00Fh, 07Fh, 0CEh, 00Fh, 07Fh
    db 062h, 008h, 00Fh, 069h, 0C7h, 00Fh, 07Fh, 06Ah, 018h, 00Fh, 06Ah, 0F0h, 00Fh, 06Fh, 022h, 00Fh
    db 062h, 0C8h, 00Fh, 06Fh, 06Ah, 010h, 00Fh, 07Fh, 0E0h, 00Fh, 07Fh, 072h, 038h, 00Fh, 061h, 0C5h
    db 00Fh, 07Fh, 04Ah, 028h, 00Fh, 069h, 0E5h, 00Fh, 07Fh, 0D5h, 00Fh, 061h, 0D3h, 00Fh, 07Fh, 0C1h
    db 00Fh, 062h, 0C2h, 00Fh, 06Ah, 0CAh, 00Fh, 07Fh, 0E2h, 00Fh, 07Fh, 002h, 00Fh, 069h, 0EBh, 00Fh
    db 07Fh, 04Ah, 010h, 00Fh, 06Ah, 0E5h, 00Fh, 062h, 0D5h, 00Fh, 07Fh, 062h, 030h, 00Fh, 07Fh, 052h
    db 020h, 00Fh, 06Fh, 052h, 070h, 00Fh, 06Fh, 071h, 030h, 00Fh, 07Fh, 0D4h, 00Fh, 06Fh, 07Ah, 058h
    db 00Fh, 0E5h, 0E6h, 00Fh, 06Fh, 049h, 040h, 00Fh, 0E5h, 0F7h, 00Fh, 07Fh, 0CDh, 00Fh, 0E5h, 0CAh
    db 00Fh, 06Fh, 05Ah, 050h, 00Fh, 0E5h, 0EFh, 00Fh, 06Fh, 041h, 020h, 00Fh, 0FDh, 0E2h, 00Fh, 0FDh
    db 0F7h, 00Fh, 0FDh, 0D1h, 00Fh, 06Fh, 04Ah, 078h, 00Fh, 0FDh, 0FDh, 00Fh, 07Fh, 0C5h, 00Fh, 0E5h
    db 0C3h, 00Fh, 0EDh, 0E7h, 00Fh, 0E5h, 0E9h, 00Fh, 06Fh, 079h, 050h, 00Fh, 0E9h, 0F2h, 00Fh, 0FDh
    db 0C3h, 00Fh, 0E5h, 0DFh, 00Fh, 06Fh, 052h, 060h, 00Fh, 0E5h, 0F9h, 00Fh, 0FDh, 0E9h, 00Fh, 07Fh
    db 0D1h, 00Fh, 0E5h, 051h, 028h, 00Fh, 0E9h, 0DDh, 00Fh, 06Fh, 06Ah, 068h, 00Fh, 0EDh, 0C7h, 00Fh
    db 07Fh, 0EFh, 00Fh, 0E9h, 0C4h, 00Fh, 0E5h, 069h, 028h, 00Fh, 0FDh, 0D1h, 00Fh, 0E5h, 049h, 048h
    db 00Fh, 0EDh, 0E4h, 00Fh, 0EDh, 0E0h, 00Fh, 0E9h, 0DEh, 00Fh, 0FDh, 0EFh, 00Fh, 0EDh, 0F6h, 00Fh
    db 0E5h, 079h, 048h, 00Fh, 0EDh, 0F3h, 00Fh, 07Fh, 062h, 050h, 00Fh, 0E9h, 0CDh, 00Fh, 06Fh, 061h
    db 038h, 00Fh, 07Fh, 0DDh, 00Fh, 0E5h, 0DCh, 00Fh, 0EDh, 0FAh, 00Fh, 07Fh, 072h, 060h, 00Fh, 07Fh
    db 0C2h, 00Fh, 06Fh, 072h, 040h, 00Fh, 0E5h, 0C4h, 00Fh, 0FDh, 0EBh, 00Fh, 06Fh, 05Ah, 048h, 00Fh
    db 0E9h, 0E9h, 00Fh, 0FDh, 0D0h, 00Fh, 0E9h, 0F3h, 00Fh, 07Fh, 0F0h, 00Fh, 0E5h, 0F4h, 00Fh, 0EDh
    db 0DBh, 00Fh, 0EDh, 0C9h, 00Fh, 0EDh, 0D8h, 00Fh, 0EDh, 0CDh, 00Fh, 0E5h, 0E3h, 00Fh, 0EDh, 0F0h
    db 00Fh, 0E9h, 0F2h, 00Fh, 0EDh, 0D2h, 00Fh, 06Fh, 042h, 050h, 00Fh, 0EDh, 0D6h, 00Fh, 0FDh, 0E3h
    db 00Fh, 0E9h, 0D1h, 00Fh, 06Fh, 05Ah, 060h, 00Fh, 0E9h, 0E7h, 00Fh, 0EDh, 0C9h, 00Fh, 0EDh, 0FFh
    db 00Fh, 0EDh, 0CAh, 00Fh, 0EDh, 0FCh, 00Fh, 0E9h, 0E3h, 00Fh, 0EDh, 0DBh, 00Fh, 0E9h, 0F5h, 00Fh
    db 0EDh, 0EDh, 00Fh, 0EDh, 0DCh, 00Fh, 0EDh, 0EEh, 00Fh, 0E9h, 0F8h, 00Fh, 0EDh, 0C0h, 00Fh, 07Fh
    db 04Ah, 050h, 00Fh, 0EDh, 0C7h, 00Fh, 07Fh, 0E1h, 00Fh, 061h, 0E5h, 00Fh, 07Fh, 042h, 040h, 00Fh
    db 069h, 0CDh, 00Fh, 07Fh, 0F0h, 00Fh, 061h, 0F7h, 00Fh, 07Fh, 0E5h, 00Fh, 062h, 0E6h, 00Fh, 06Ah
    db 0EEh, 00Fh, 07Fh, 0CEh, 00Fh, 07Fh, 062h, 048h, 00Fh, 069h, 0C7h, 00Fh, 07Fh, 06Ah, 058h, 00Fh
    db 06Ah, 0F0h, 00Fh, 06Fh, 062h, 040h, 00Fh, 062h, 0C8h, 00Fh, 06Fh, 06Ah, 050h, 00Fh, 07Fh, 0E0h
    db 00Fh, 07Fh, 072h, 078h, 00Fh, 061h, 0C5h, 00Fh, 07Fh, 04Ah, 068h, 00Fh, 069h, 0E5h, 00Fh, 07Fh
    db 0D5h, 00Fh, 061h, 0D3h, 00Fh, 07Fh, 0C1h, 00Fh, 062h, 0C2h, 00Fh, 06Ah, 0CAh, 00Fh, 07Fh, 0E2h
    db 00Fh, 07Fh, 042h, 040h, 00Fh, 069h, 0EBh, 00Fh, 07Fh, 04Ah, 050h, 00Fh, 06Ah, 0E5h, 00Fh, 062h
    db 0D5h, 00Fh, 07Fh, 062h, 070h, 00Fh, 07Fh, 052h, 060h, 00Fh, 06Fh, 052h, 030h, 00Fh, 06Fh, 071h
    db 030h, 00Fh, 07Fh, 0D4h, 00Fh, 06Fh, 07Ah, 050h, 00Fh, 0E5h, 0E6h, 00Fh, 06Fh, 049h, 040h, 00Fh
    db 0E5h, 0F7h, 00Fh, 07Fh, 0CDh, 00Fh, 0E5h, 0CAh, 00Fh, 06Fh, 05Ah, 010h, 00Fh, 0E5h, 0EFh, 00Fh
    db 06Fh, 041h, 020h, 00Fh, 0FDh, 0E2h, 00Fh, 0FDh, 0F7h, 00Fh, 0FDh, 0D1h, 00Fh, 06Fh, 04Ah, 070h
    db 00Fh, 0FDh, 0FDh, 00Fh, 07Fh, 0C5h, 00Fh, 0E5h, 0C3h, 00Fh, 0EDh, 0E7h, 00Fh, 0E5h, 0E9h, 00Fh
    db 06Fh, 079h, 050h, 00Fh, 0E9h, 0F2h, 00Fh, 0FDh, 0C3h, 00Fh, 0E5h, 0DFh, 00Fh, 06Fh, 052h, 020h
    db 00Fh, 0E5h, 0F9h, 00Fh, 0FDh, 0E9h, 00Fh, 07Fh, 0D1h, 00Fh, 0E5h, 051h, 028h, 00Fh, 0E9h, 0DDh
    db 00Fh, 06Fh, 06Ah, 060h, 00Fh, 0EDh, 0C7h, 00Fh, 07Fh, 0EFh, 00Fh, 0E9h, 0C4h, 00Fh, 0E5h, 069h
    db 028h, 00Fh, 0FDh, 0D1h, 00Fh, 0E5h, 049h, 048h, 00Fh, 0EDh, 0E4h, 00Fh, 0EDh, 0E0h, 00Fh, 0E9h
    db 0DEh, 00Fh, 0FDh, 0EFh, 00Fh, 0EDh, 0F6h, 00Fh, 0E5h, 079h, 048h, 00Fh, 0EDh, 0F3h, 00Fh, 07Fh
    db 062h, 010h, 00Fh, 0E9h, 0CDh, 00Fh, 06Fh, 061h, 038h, 00Fh, 07Fh, 0DDh, 00Fh, 0E5h, 0DCh, 00Fh
    db 0EDh, 0FAh, 00Fh, 07Fh, 072h, 020h, 00Fh, 07Fh, 0C2h, 00Fh, 06Fh, 032h, 00Fh, 0E5h, 0C4h, 00Fh
    db 0FDh, 0EBh, 00Fh, 06Fh, 05Ah, 040h, 00Fh, 0E9h, 0E9h, 00Fh, 0FDh, 0D0h, 00Fh, 0E9h, 0F3h, 00Fh
    db 07Fh, 0F0h, 00Fh, 0E5h, 0F4h, 00Fh, 0EDh, 0DBh, 00Fh, 0EDh, 0C9h, 00Fh, 0EDh, 0D8h, 00Fh, 0EDh
    db 0CDh, 00Fh, 0E5h, 0E3h, 00Fh, 0EDh, 0F0h, 00Fh, 0E9h, 0F2h, 00Fh, 0EDh, 0D2h, 00Fh, 06Fh, 042h
    db 010h, 00Fh, 0EDh, 0D6h, 00Fh, 0FDh, 0E3h, 00Fh, 0E9h, 0D1h, 00Fh, 0EDh, 051h, 058h, 00Fh, 0EDh
    db 0C9h, 00Fh, 0EDh, 0CAh, 00Fh, 071h, 0E2h, 004h, 00Fh, 0E9h, 0E7h, 00Fh, 071h, 0E1h, 004h, 00Fh
    db 06Fh, 05Ah, 020h, 00Fh, 0EDh, 0FFh, 00Fh, 07Fh, 052h, 020h, 00Fh, 0EDh, 0FCh, 00Fh, 07Fh, 04Ah
    db 010h, 00Fh, 0E9h, 0E3h, 00Fh, 0EDh, 061h, 058h, 00Fh, 0EDh, 0DBh, 00Fh, 0EDh, 0DCh, 00Fh, 071h
    db 0E4h, 004h, 00Fh, 0E9h, 0F5h, 00Fh, 071h, 0E3h, 004h, 00Fh, 0EDh, 071h, 058h, 00Fh, 0EDh, 0EDh
    db 00Fh, 0EDh, 0EEh, 00Fh, 071h, 0E6h, 004h, 00Fh, 07Fh, 062h, 040h, 00Fh, 071h, 0E5h, 004h, 00Fh
    db 07Fh, 05Ah, 030h, 00Fh, 0E9h, 0F8h, 00Fh, 0EDh, 079h, 058h, 00Fh, 0EDh, 0C0h, 00Fh, 0EDh, 0C7h
    db 00Fh, 071h, 0E7h, 004h, 00Fh, 07Fh, 072h, 060h, 00Fh, 071h, 0E0h, 004h, 00Fh, 07Fh, 06Ah, 050h
    db 00Fh, 07Fh, 07Ah, 070h, 00Fh, 07Fh, 002h, 00Fh, 06Fh, 052h, 038h, 00Fh, 06Fh, 071h, 030h, 00Fh
    db 07Fh, 0D4h, 00Fh, 06Fh, 07Ah, 058h, 00Fh, 0E5h, 0E6h, 00Fh, 06Fh, 049h, 040h, 00Fh, 0E5h, 0F7h
    db 00Fh, 07Fh, 0CDh, 00Fh, 0E5h, 0CAh, 00Fh, 06Fh, 05Ah, 018h, 00Fh, 0E5h, 0EFh, 00Fh, 06Fh, 041h
    db 020h, 00Fh, 0FDh, 0E2h, 00Fh, 0FDh, 0F7h, 00Fh, 0FDh, 0D1h, 00Fh, 06Fh, 04Ah, 078h, 00Fh, 0FDh
    db 0FDh, 00Fh, 07Fh, 0C5h, 00Fh, 0E5h, 0C3h, 00Fh, 0EDh, 0E7h, 00Fh, 0E5h, 0E9h, 00Fh, 06Fh, 079h
    db 050h, 00Fh, 0E9h, 0F2h, 00Fh, 0FDh, 0C3h, 00Fh, 0E5h, 0DFh, 00Fh, 06Fh, 052h, 028h, 00Fh, 0E5h
    db 0F9h, 00Fh, 0FDh, 0E9h, 00Fh, 07Fh, 0D1h, 00Fh, 0E5h, 051h, 028h, 00Fh, 0E9h, 0DDh, 00Fh, 06Fh
    db 06Ah, 068h, 00Fh, 0EDh, 0C7h, 00Fh, 07Fh, 0EFh, 00Fh, 0E9h, 0C4h, 00Fh, 0E5h, 069h, 028h, 00Fh
    db 0FDh, 0D1h, 00Fh, 0E5h, 049h, 048h, 00Fh, 0EDh, 0E4h, 00Fh, 0EDh, 0E0h, 00Fh, 0E9h, 0DEh, 00Fh
    db 0FDh, 0EFh, 00Fh, 0EDh, 0F6h, 00Fh, 0E5h, 079h, 048h, 00Fh, 0EDh, 0F3h, 00Fh, 07Fh, 062h, 018h
    db 00Fh, 0E9h, 0CDh, 00Fh, 06Fh, 061h, 038h, 00Fh, 07Fh, 0DDh, 00Fh, 0E5h, 0DCh, 00Fh, 0EDh, 0FAh
    db 00Fh, 07Fh, 072h, 028h, 00Fh, 07Fh, 0C2h, 00Fh, 06Fh, 072h, 008h, 00Fh, 0E5h, 0C4h, 00Fh, 0FDh
    db 0EBh, 00Fh, 06Fh, 05Ah, 048h, 00Fh, 0E9h, 0E9h, 00Fh, 0FDh, 0D0h, 00Fh, 0E9h, 0F3h, 00Fh, 07Fh
    db 0F0h, 00Fh, 0E5h, 0F4h, 00Fh, 0EDh, 0DBh, 00Fh, 0EDh, 0C9h, 00Fh, 0EDh, 0D8h, 00Fh, 0EDh, 0CDh
    db 00Fh, 0E5h, 0E3h, 00Fh, 0EDh, 0F0h, 00Fh, 0E9h, 0F2h, 00Fh, 0EDh, 0D2h, 00Fh, 06Fh, 042h, 018h
    db 00Fh, 0EDh, 0D6h, 00Fh, 0FDh, 0E3h, 00Fh, 0E9h, 0D1h, 00Fh, 0EDh, 051h, 058h, 00Fh, 0EDh, 0C9h
    db 00Fh, 0EDh, 0CAh, 00Fh, 071h, 0E2h, 004h, 00Fh, 0E9h, 0E7h, 00Fh, 071h, 0E1h, 004h, 00Fh, 06Fh
    db 05Ah, 028h, 00Fh, 0EDh, 0FFh, 00Fh, 07Fh, 052h, 028h, 00Fh, 0EDh, 0FCh, 00Fh, 07Fh, 04Ah, 018h
    db 00Fh, 0E9h, 0E3h, 00Fh, 0EDh, 061h, 058h, 00Fh, 0EDh, 0DBh, 00Fh, 0EDh, 0DCh, 00Fh, 071h, 0E4h
    db 004h, 00Fh, 0E9h, 0F5h, 00Fh, 071h, 0E3h, 004h, 00Fh, 0EDh, 071h, 058h, 00Fh, 0EDh, 0EDh, 00Fh
    db 0EDh, 0EEh, 00Fh, 071h, 0E6h, 004h, 00Fh, 07Fh, 062h, 048h, 00Fh, 071h, 0E5h, 004h, 00Fh, 07Fh
    db 05Ah, 038h, 00Fh, 0E9h, 0F8h, 00Fh, 0EDh, 079h, 058h, 00Fh, 0EDh, 0C0h, 00Fh, 0EDh, 0C7h, 00Fh
    db 071h, 0E7h, 004h, 00Fh, 07Fh, 072h, 068h, 00Fh, 071h, 0E0h, 004h, 00Fh, 07Fh, 06Ah, 058h, 00Fh
    db 07Fh, 07Ah, 078h, 00Fh, 07Fh, 042h, 008h, 05Bh, 059h, 05Ah, 0C3h
?Rva009C3D50@@YAXPBF0PAF@Z ENDP
_TEXT ENDS
END
