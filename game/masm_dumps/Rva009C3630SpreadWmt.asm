.386
.model flat
; Codec spread-table MMX sibling of Rva009C3D50 and Rva009C4450 in the same
; d_009a7b00 slab. The retail entry saves edx/ecx/ebx -- two slots later code
; never reads -- while VC7.1 owns the EBX save; the measured C++
; reconstruction (targets/game/reverse/attempts/0x009c3630.cpp) lands 6
; non-reloc bytes away at that prologue, so the body is unreachable from
; VC7.1 C++ and stays a MASM dump like its siblings. The single relocation
; is symbolic below (spread table ?Rva009B3A00Table@@3PAGA, VA 0x01356640,
; recorded in targets/game/reverse/dir32_addresses.csv).
; Evidence: targets/game/reverse/identity_evidence/009c3630-masm-codegen-blocker.md
; ?Rva009C3630@@YAXXZ
; Retail @ 0x009C3630 size 1724
EXTERN ?Rva009B3A00Table@@3PAGA:BYTE
_TEXT SEGMENT
public ?Rva009C3630@@YAXXZ
?Rva009C3630@@YAXXZ PROC
    db 052h, 051h, 053h, 08Bh, 044h, 024h, 010h, 08Bh, 054h, 024h, 018h, 08Bh, 00Ah, 08Bh, 05Ah, 01Ch
    db 08Bh, 04Ah, 038h, 08Bh, 05Ah, 054h, 08Bh, 04Ah, 070h, 08Bh, 05Ah, 07Ch, 08Bh, 05Ch, 024h, 014h
    db 08Dh, 00Dh
    dd ?Rva009B3A00Table@@3PAGA
    db 00Fh, 06Fh, 000h, 00Fh, 0D5h, 003h, 00Fh, 06Fh, 048h, 010h, 00Fh, 0D5h, 04Bh, 010h, 00Fh, 06Fh
    db 011h, 00Fh, 07Fh, 0C3h, 00Fh, 06Fh, 060h, 008h, 00Fh, 073h, 0D0h, 010h, 00Fh, 0D5h, 063h, 008h
    db 00Fh, 0DBh, 0DAh, 00Fh, 07Fh, 0C5h, 00Fh, 07Fh, 0CEh, 00Fh, 0DBh, 0EAh, 00Fh, 073h, 0F6h, 020h
    db 00Fh, 06Fh, 079h, 018h, 00Fh, 0EFh, 0C5h, 00Fh, 0DBh, 0FEh, 00Fh, 0EBh, 0C3h, 00Fh, 0EFh, 0F7h
    db 00Fh, 0EBh, 0C7h, 00Fh, 06Fh, 079h, 018h, 00Fh, 07Fh, 0E3h, 00Fh, 07Fh, 002h, 00Fh, 0DBh, 0DAh
    db 00Fh, 06Fh, 040h, 020h, 00Fh, 073h, 0F3h, 010h, 00Fh, 0D5h, 043h, 020h, 00Fh, 0DBh, 0F9h, 00Fh
    db 0EBh, 0EBh, 00Fh, 0EBh, 0FEh, 00Fh, 06Fh, 058h, 018h, 00Fh, 0EBh, 0FDh, 00Fh, 0D5h, 05Bh, 018h
    db 00Fh, 073h, 0D4h, 010h, 00Fh, 07Fh, 07Ah, 010h, 00Fh, 07Fh, 0E5h, 00Fh, 07Fh, 0C7h, 00Fh, 073h
    db 0D4h, 010h, 00Fh, 073h, 0D7h, 030h, 00Fh, 07Fh, 0D6h, 00Fh, 0DBh, 0EAh, 00Fh, 0DBh, 0F4h, 00Fh
    db 07Fh, 07Ah, 050h, 00Fh, 0EFh, 0E6h, 00Fh, 073h, 0D1h, 020h, 00Fh, 0EBh, 0E5h, 00Fh, 06Fh, 079h
    db 018h, 00Fh, 0DBh, 0CAh, 00Fh, 06Fh, 068h, 030h, 00Fh, 073h, 0F0h, 010h, 00Fh, 0D5h, 06Bh, 030h
    db 00Fh, 0DBh, 0F8h, 00Fh, 07Fh, 04Ah, 040h, 00Fh, 0EBh, 0FCh, 00Fh, 07Fh, 0DCh, 00Fh, 0DBh, 0DAh
    db 00Fh, 06Fh, 049h, 010h, 00Fh, 073h, 0F3h, 020h, 00Fh, 0EBh, 0FBh, 00Fh, 07Fh, 0EBh, 00Fh, 073h
    db 0F3h, 030h, 00Fh, 0DBh, 0C8h, 00Fh, 07Fh, 07Ah, 020h, 00Fh, 0EBh, 0F3h, 00Fh, 06Fh, 079h, 008h
    db 00Fh, 0EBh, 0F1h, 00Fh, 06Fh, 048h, 038h, 00Fh, 0DBh, 0FCh, 00Fh, 0D5h, 04Bh, 038h, 00Fh, 0EBh
    db 0FEh, 00Fh, 0DBh, 041h, 008h, 00Fh, 073h, 0D4h, 020h, 00Fh, 07Fh, 07Ah, 030h, 00Fh, 07Fh, 0E6h
    db 00Fh, 06Fh, 079h, 018h, 00Fh, 0DBh, 0E2h, 00Fh, 06Fh, 059h, 008h, 00Fh, 0DBh, 0F9h, 00Fh, 0DBh
    db 0DDh, 00Fh, 0EBh, 0C4h, 00Fh, 073h, 0F3h, 010h, 00Fh, 0EBh, 0F8h, 00Fh, 06Fh, 061h, 010h, 00Fh
    db 0EBh, 0FBh, 00Fh, 06Fh, 040h, 050h, 00Fh, 07Fh, 0E3h, 00Fh, 0D5h, 043h, 050h, 00Fh, 0DBh, 0E5h
    db 00Fh, 07Fh, 07Ah, 008h, 00Fh, 0EBh, 0F4h, 00Fh, 07Fh, 0DCh, 00Fh, 073h, 0D6h, 010h, 00Fh, 07Fh
    db 0C7h, 00Fh, 0DBh, 0E1h, 00Fh, 073h, 0F7h, 030h, 00Fh, 0EBh, 0F4h, 00Fh, 06Fh, 060h, 058h, 00Fh
    db 0EBh, 0FEh, 00Fh, 0D5h, 063h, 058h, 00Fh, 073h, 0D3h, 010h, 00Fh, 07Fh, 07Ah, 018h, 00Fh, 0DBh
    db 0D9h, 00Fh, 073h, 0D5h, 030h, 00Fh, 0DBh, 0CAh, 00Fh, 06Fh, 070h, 068h, 00Fh, 0EBh, 0EBh, 00Fh
    db 0D5h, 073h, 068h, 00Fh, 073h, 0D0h, 010h, 00Fh, 07Fh, 0E7h, 00Fh, 07Fh, 0D3h, 00Fh, 073h, 0F7h
    db 030h, 00Fh, 0DBh, 0D8h, 00Fh, 0EFh, 0C3h, 00Fh, 073h, 0F3h, 020h, 00Fh, 0EBh, 0FDh, 00Fh, 07Fh
    db 0F5h, 00Fh, 0DBh, 071h, 008h, 00Fh, 0EBh, 0FBh, 00Fh, 073h, 0F6h, 020h, 00Fh, 0EBh, 0C1h, 00Fh
    db 07Fh, 07Ah, 028h, 00Fh, 0EBh, 0C6h, 00Fh, 06Fh, 078h, 078h, 00Fh, 07Fh, 0EEh, 00Fh, 0D5h, 07Bh
    db 078h, 00Fh, 073h, 0D5h, 020h, 00Fh, 0DBh, 0F2h, 00Fh, 07Fh, 0E9h, 00Fh, 07Fh, 042h, 038h, 00Fh
    db 0DBh, 0CAh, 00Fh, 06Fh, 040h, 070h, 00Fh, 07Fh, 0FBh, 00Fh, 0D5h, 043h, 070h, 00Fh, 073h, 0F3h
    db 010h, 00Fh, 0DBh, 079h, 018h, 00Fh, 0EFh, 0E9h, 00Fh, 0EBh, 0F5h, 00Fh, 07Fh, 0DDh, 00Fh, 0DBh
    db 069h, 018h, 00Fh, 0EBh, 0F9h, 00Fh, 06Fh, 048h, 060h, 00Fh, 0EFh, 0DDh, 00Fh, 0D5h, 04Bh, 060h
    db 00Fh, 0EBh, 0FBh, 00Fh, 0EBh, 0F5h, 00Fh, 07Fh, 0C5h, 00Fh, 07Fh, 07Ah, 078h, 00Fh, 073h, 0D5h
    db 010h, 00Fh, 0DBh, 069h, 010h, 00Fh, 07Fh, 0C7h, 00Fh, 0EBh, 0F5h, 00Fh, 0DBh, 0C2h, 00Fh, 0EFh
    db 0F8h, 00Fh, 073h, 0F0h, 020h, 00Fh, 07Fh, 072h, 068h, 00Fh, 073h, 0D4h, 010h, 00Fh, 06Fh, 068h
    db 048h, 00Fh, 073h, 0F7h, 010h, 00Fh, 0D5h, 06Bh, 048h, 00Fh, 07Fh, 0FEh, 00Fh, 06Fh, 059h, 010h
    db 00Fh, 073h, 0F6h, 010h, 00Fh, 0DBh, 079h, 018h, 00Fh, 0DBh, 0D9h, 00Fh, 0EBh, 0F8h, 00Fh, 07Fh
    db 0C8h, 00Fh, 0DBh, 049h, 018h, 00Fh, 0EBh, 0F3h, 00Fh, 07Fh, 0E3h, 00Fh, 073h, 0D1h, 020h, 00Fh
    db 0DBh, 0DAh, 00Fh, 0EBh, 0F9h, 00Fh, 0EBh, 0FBh, 00Fh, 07Fh, 0E3h, 00Fh, 0DBh, 059h, 008h, 00Fh
    db 07Fh, 0E9h, 00Fh, 07Fh, 07Ah, 058h, 00Fh, 073h, 0D5h, 030h, 00Fh, 06Fh, 078h, 040h, 00Fh, 0EBh
    db 0F3h, 00Fh, 0D5h, 07Bh, 040h, 00Fh, 0EBh, 0F5h, 00Fh, 0DBh, 061h, 010h, 00Fh, 073h, 0F0h, 020h
    db 00Fh, 07Fh, 072h, 048h, 00Fh, 07Fh, 0C6h, 00Fh, 0DBh, 041h, 018h, 00Fh, 073h, 0F6h, 010h, 00Fh
    db 06Fh, 068h, 028h, 00Fh, 07Fh, 0CBh, 00Fh, 0D5h, 06Bh, 028h, 00Fh, 073h, 0D1h, 010h, 00Fh, 0DBh
    db 049h, 008h, 00Fh, 0EBh, 0C4h, 00Fh, 0DBh, 0D7h, 00Fh, 0EBh, 0C1h, 00Fh, 0EBh, 0C2h, 00Fh, 073h
    db 0F3h, 010h, 00Fh, 07Fh, 0DCh, 00Fh, 07Fh, 0EAh, 00Fh, 07Fh, 042h, 070h, 00Fh, 073h, 0D2h, 030h
    db 00Fh, 0DBh, 061h, 010h, 00Fh, 0EBh, 0F2h, 00Fh, 06Fh, 051h, 008h, 00Fh, 0EBh, 0F4h, 00Fh, 0DBh
    db 0D7h, 00Fh, 073h, 0F3h, 020h, 00Fh, 0EBh, 05Ah, 050h, 00Fh, 0EBh, 0F2h, 00Fh, 06Fh, 051h, 018h
    db 00Fh, 073h, 0F5h, 010h, 00Fh, 07Fh, 072h, 060h, 00Fh, 0DBh, 0D5h, 00Fh, 06Fh, 071h, 010h, 00Fh
    db 0EFh, 0EAh, 00Fh, 0DBh, 0F7h, 00Fh, 073h, 0D2h, 020h, 00Fh, 0DBh, 079h, 018h, 00Fh, 0EBh, 0DAh
    db 00Fh, 0EBh, 07Ah, 040h, 00Fh, 0EBh, 0F3h, 00Fh, 0EBh, 0FDh, 00Fh, 07Fh, 072h, 050h, 00Fh, 07Fh
    db 07Ah, 040h, 00Fh, 06Fh, 052h, 030h, 090h, 00Fh, 06Fh, 071h, 030h, 00Fh, 07Fh, 0D4h, 00Fh, 06Fh
    db 049h, 040h, 00Fh, 0E5h, 0E6h, 00Fh, 06Fh, 05Ah, 010h, 00Fh, 0E5h, 0CAh, 00Fh, 06Fh, 041h, 020h
    db 00Fh, 0FDh, 0E2h, 00Fh, 0EFh, 0F6h, 00Fh, 0FDh, 0D1h, 00Fh, 06Fh, 06Ah, 020h, 00Fh, 0E5h, 0C3h
    db 00Fh, 07Fh, 0E9h, 00Fh, 0FDh, 0C3h, 00Fh, 0E5h, 059h, 050h, 00Fh, 0E9h, 0F2h, 00Fh, 0E5h, 069h
    db 028h, 00Fh, 0E9h, 0C4h, 00Fh, 06Fh, 07Ah, 020h, 00Fh, 0EDh, 0E4h, 00Fh, 0FDh, 0FDh, 00Fh, 0EDh
    db 0E0h, 00Fh, 0E5h, 049h, 048h, 00Fh, 0E9h, 0DEh, 00Fh, 07Fh, 062h, 010h, 00Fh, 0EDh, 0F6h, 00Fh
    db 06Fh, 061h, 038h, 00Fh, 0EDh, 0F3h, 00Fh, 07Fh, 0DDh, 00Fh, 0E5h, 0DCh, 00Fh, 07Fh, 072h, 020h
    db 00Fh, 07Fh, 0C2h, 00Fh, 06Fh, 032h, 00Fh, 0E5h, 0C4h, 00Fh, 0FDh, 0EBh, 00Fh, 0FDh, 0D0h, 00Fh
    db 0E9h, 0E9h, 00Fh, 0E5h, 0F4h, 00Fh, 0FDh, 032h, 00Fh, 0EDh, 0C9h, 00Fh, 07Fh, 0F4h, 00Fh, 0EDh
    db 0CDh, 00Fh, 0E9h, 0F2h, 00Fh, 0EDh, 0D2h, 00Fh, 06Fh, 042h, 010h, 00Fh, 0EDh, 0D6h, 00Fh, 0E9h
    db 0D1h, 090h, 00Fh, 06Fh, 05Ah, 020h, 00Fh, 0E9h, 0E7h, 00Fh, 0EDh, 0C9h, 00Fh, 0EDh, 0FFh, 00Fh
    db 0EDh, 0CAh, 00Fh, 0EDh, 0FCh, 00Fh, 0E9h, 0E3h, 00Fh, 0EDh, 0DBh, 00Fh, 0E9h, 0F5h, 00Fh, 0EDh
    db 0EDh, 00Fh, 0EDh, 0DCh, 00Fh, 0EDh, 0EEh, 00Fh, 0E9h, 0F8h, 00Fh, 0EDh, 0C0h, 00Fh, 07Fh, 04Ah
    db 010h, 00Fh, 0EDh, 0C7h, 00Fh, 07Fh, 0E1h, 00Fh, 061h, 0E5h, 00Fh, 07Fh, 002h, 00Fh, 069h, 0CDh
    db 00Fh, 07Fh, 0F0h, 00Fh, 061h, 0F7h, 00Fh, 07Fh, 0E5h, 00Fh, 062h, 0E6h, 00Fh, 06Ah, 0EEh, 00Fh
    db 07Fh, 0CEh, 00Fh, 07Fh, 062h, 008h, 00Fh, 069h, 0C7h, 00Fh, 07Fh, 06Ah, 018h, 00Fh, 06Ah, 0F0h
    db 00Fh, 06Fh, 022h, 00Fh, 062h, 0C8h, 00Fh, 06Fh, 06Ah, 010h, 00Fh, 07Fh, 0E0h, 00Fh, 07Fh, 072h
    db 038h, 00Fh, 061h, 0C5h, 00Fh, 07Fh, 04Ah, 028h, 00Fh, 069h, 0E5h, 00Fh, 07Fh, 0D5h, 00Fh, 061h
    db 0D3h, 00Fh, 07Fh, 0C1h, 00Fh, 062h, 0C2h, 00Fh, 06Ah, 0CAh, 00Fh, 07Fh, 0E2h, 00Fh, 07Fh, 002h
    db 00Fh, 069h, 0EBh, 00Fh, 07Fh, 04Ah, 010h, 00Fh, 06Ah, 0E5h, 00Fh, 062h, 0D5h, 00Fh, 07Fh, 062h
    db 030h, 00Fh, 07Fh, 052h, 020h, 00Fh, 06Fh, 052h, 030h, 090h, 00Fh, 06Fh, 071h, 030h, 00Fh, 07Fh
    db 0D4h, 00Fh, 06Fh, 049h, 040h, 00Fh, 0E5h, 0E6h, 00Fh, 06Fh, 05Ah, 010h, 00Fh, 0E5h, 0CAh, 00Fh
    db 06Fh, 041h, 020h, 00Fh, 0FDh, 0E2h, 00Fh, 0EFh, 0F6h, 00Fh, 0FDh, 0D1h, 00Fh, 06Fh, 06Ah, 020h
    db 00Fh, 0E5h, 0C3h, 00Fh, 07Fh, 0E9h, 00Fh, 0FDh, 0C3h, 00Fh, 0E5h, 059h, 050h, 00Fh, 0E9h, 0F2h
    db 00Fh, 0E5h, 069h, 028h, 00Fh, 0E9h, 0C4h, 00Fh, 06Fh, 07Ah, 020h, 00Fh, 0EDh, 0E4h, 00Fh, 0FDh
    db 0FDh, 00Fh, 0EDh, 0E0h, 00Fh, 0E5h, 049h, 048h, 00Fh, 0E9h, 0DEh, 00Fh, 07Fh, 062h, 010h, 00Fh
    db 0EDh, 0F6h, 00Fh, 06Fh, 061h, 038h, 00Fh, 0EDh, 0F3h, 00Fh, 07Fh, 0DDh, 00Fh, 0E5h, 0DCh, 00Fh
    db 07Fh, 072h, 020h, 00Fh, 07Fh, 0C2h, 00Fh, 06Fh, 032h, 00Fh, 0E5h, 0C4h, 00Fh, 0FDh, 0EBh, 00Fh
    db 0FDh, 0D0h, 00Fh, 0E9h, 0E9h, 00Fh, 0E5h, 0F4h, 00Fh, 0FDh, 032h, 00Fh, 0EDh, 0C9h, 00Fh, 07Fh
    db 0F4h, 00Fh, 0EDh, 0CDh, 00Fh, 0E9h, 0F2h, 00Fh, 0EDh, 0D2h, 00Fh, 06Fh, 042h, 010h, 00Fh, 0EDh
    db 0D6h, 00Fh, 0E9h, 0D1h, 090h, 00Fh, 0EDh, 051h, 058h, 00Fh, 0EDh, 0C9h, 00Fh, 0EDh, 0CAh, 00Fh
    db 071h, 0E2h, 004h, 00Fh, 0E9h, 0E7h, 00Fh, 071h, 0E1h, 004h, 00Fh, 06Fh, 05Ah, 020h, 00Fh, 0EDh
    db 0FFh, 00Fh, 07Fh, 052h, 020h, 00Fh, 0EDh, 0FCh, 00Fh, 07Fh, 04Ah, 010h, 00Fh, 0E9h, 0E3h, 00Fh
    db 0EDh, 061h, 058h, 00Fh, 0EDh, 0DBh, 00Fh, 0EDh, 0DCh, 00Fh, 071h, 0E4h, 004h, 00Fh, 0E9h, 0F5h
    db 00Fh, 071h, 0E3h, 004h, 00Fh, 0EDh, 071h, 058h, 00Fh, 0EDh, 0EDh, 00Fh, 0EDh, 0EEh, 00Fh, 071h
    db 0E6h, 004h, 00Fh, 07Fh, 062h, 040h, 00Fh, 071h, 0E5h, 004h, 00Fh, 07Fh, 05Ah, 030h, 00Fh, 0E9h
    db 0F8h, 00Fh, 0EDh, 079h, 058h, 00Fh, 0EDh, 0C0h, 00Fh, 0EDh, 0C7h, 00Fh, 071h, 0E7h, 004h, 00Fh
    db 07Fh, 072h, 060h, 00Fh, 071h, 0E0h, 004h, 00Fh, 07Fh, 06Ah, 050h, 00Fh, 07Fh, 07Ah, 070h, 00Fh
    db 07Fh, 002h, 00Fh, 06Fh, 052h, 038h, 090h, 00Fh, 06Fh, 071h, 030h, 00Fh, 07Fh, 0D4h, 00Fh, 06Fh
    db 049h, 040h, 00Fh, 0E5h, 0E6h, 00Fh, 06Fh, 05Ah, 018h, 00Fh, 0E5h, 0CAh, 00Fh, 06Fh, 041h, 020h
    db 00Fh, 0FDh, 0E2h, 00Fh, 0EFh, 0F6h, 00Fh, 0FDh, 0D1h, 00Fh, 06Fh, 06Ah, 028h, 00Fh, 0E5h, 0C3h
    db 00Fh, 07Fh, 0E9h, 00Fh, 0FDh, 0C3h, 00Fh, 0E5h, 059h, 050h, 00Fh, 0E9h, 0F2h, 00Fh, 0E5h, 069h
    db 028h, 00Fh, 0E9h, 0C4h, 00Fh, 06Fh, 07Ah, 028h, 00Fh, 0EDh, 0E4h, 00Fh, 0FDh, 0FDh, 00Fh, 0EDh
    db 0E0h, 00Fh, 0E5h, 049h, 048h, 00Fh, 0E9h, 0DEh, 00Fh, 07Fh, 062h, 018h, 00Fh, 0EDh, 0F6h, 00Fh
    db 06Fh, 061h, 038h, 00Fh, 0EDh, 0F3h, 00Fh, 07Fh, 0DDh, 00Fh, 0E5h, 0DCh, 00Fh, 07Fh, 072h, 028h
    db 00Fh, 07Fh, 0C2h, 00Fh, 06Fh, 072h, 008h, 00Fh, 0E5h, 0C4h, 00Fh, 0FDh, 0EBh, 00Fh, 0FDh, 0D0h
    db 00Fh, 0E9h, 0E9h, 00Fh, 0E5h, 0F4h, 00Fh, 0FDh, 072h, 008h, 00Fh, 0EDh, 0C9h, 00Fh, 07Fh, 0F4h
    db 00Fh, 0EDh, 0CDh, 00Fh, 0E9h, 0F2h, 00Fh, 0EDh, 0D2h, 00Fh, 06Fh, 042h, 018h, 00Fh, 0EDh, 0D6h
    db 00Fh, 0E9h, 0D1h, 090h, 00Fh, 0EDh, 051h, 058h, 00Fh, 0EDh, 0C9h, 00Fh, 0EDh, 0CAh, 00Fh, 071h
    db 0E2h, 004h, 00Fh, 0E9h, 0E7h, 00Fh, 071h, 0E1h, 004h, 00Fh, 06Fh, 05Ah, 028h, 00Fh, 0EDh, 0FFh
    db 00Fh, 07Fh, 052h, 028h, 00Fh, 0EDh, 0FCh, 00Fh, 07Fh, 04Ah, 018h, 00Fh, 0E9h, 0E3h, 00Fh, 0EDh
    db 061h, 058h, 00Fh, 0EDh, 0DBh, 00Fh, 0EDh, 0DCh, 00Fh, 071h, 0E4h, 004h, 00Fh, 0E9h, 0F5h, 00Fh
    db 071h, 0E3h, 004h, 00Fh, 0EDh, 071h, 058h, 00Fh, 0EDh, 0EDh, 00Fh, 0EDh, 0EEh, 00Fh, 071h, 0E6h
    db 004h, 00Fh, 07Fh, 062h, 048h, 00Fh, 071h, 0E5h, 004h, 00Fh, 07Fh, 05Ah, 038h, 00Fh, 0E9h, 0F8h
    db 00Fh, 0EDh, 079h, 058h, 00Fh, 0EDh, 0C0h, 00Fh, 0EDh, 0C7h, 00Fh, 071h, 0E7h, 004h, 00Fh, 07Fh
    db 072h, 068h, 00Fh, 071h, 0E0h, 004h, 00Fh, 07Fh, 06Ah, 058h, 00Fh, 07Fh, 07Ah, 078h, 00Fh, 07Fh
    db 042h, 008h, 05Bh, 059h, 05Ah, 0C3h
?Rva009C3630@@YAXXZ ENDP
_TEXT ENDS
END
