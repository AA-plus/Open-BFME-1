.386
.model flat
; ?Rva009B8130@@YAXXZ
; Retail @ 0x009B8130 size 5572.
;
; VP6 wide-filter MMX reconstruct body (complete, RET at +0x15C3, INT3 padding
; after). Seven-argument __cdecl aligned-frame body: ebx = aligned frame base,
; context at [ebx+8] with the fragment Q-index and accumulator arrays, plane
; index at ctx+0xc, sourceOffset/destinationOffset/sourceStride/firstBlock/
; blockCount/destinationStride at +0xc/+0x10/+0x14/+0x18/+0x1c/+0x20. The
; 009AEEE0 caller and 009B0D60 installer establish the cdecl seven-argument
; ABI and dispatch slot 01356E94. No named pin is proven for this RVA (no
; matched symbol in symbols.csv), so the address-derived decorated spelling is
; retained per docs/naming_evidence.md.
;
; MASM dump carrying a measured VC7.1 codegen wall: the reconstructible bank
; targets/game/reverse/attempts/0x009b8130.cpp (score 0.9941) emits exactly
; 5572 bytes with 14 relocations and 33 non-relocation bytes confined to the
; +0x1F..+0x4A head (edge broadcast + bounds guard): retail assigns plane->edx
; with the global array base loaded by the EAX moffs form and blockCount->ecx /
; firstBlock->edx (stopBlock via lea eax,[edx+ecx]), while VC7.1 emits
; plane->ecx / base->edx / firstBlock->ecx and blockCount->eax (stopBlock via
; add ecx,eax), scheduling the blockCount load after the broadcast stores.
; Seven recorded verdicts plus this session's block-swap, hoisted-load,
; count-first, stopBlock-operand-swap and count-elimination spellings all
; compile to the identical residue (the two-register register rotation sits in
; the compiler's allocator, see "The two-register lea operand order is not a
; spelling" in docs/shape_levers.md). Bytes +0x47..+0x15C3 are proven exact by
; the independent data binding of verdict #6.
; The dump body is byte-identical to retail outside its relocation slots.
; Evidence: targets/game/reverse/identity_evidence/009b8130-masm-codegen-blocker.md
EXTERN ?g_rva01356A9C@@3PAHA:BYTE
EXTERN g_Va012D86C0:BYTE
EXTERN g_Va012D86D0:BYTE
EXTERN g_Va012D86E0:BYTE
_TEXT SEGMENT
public ?Rva009B8130@@YAXXZ
?Rva009B8130@@YAXXZ PROC
    db 053h, 08Bh, 0DCh, 083h, 0ECh, 008h, 083h, 0E4h, 0F0h, 083h, 0C4h, 004h, 055h, 08Bh, 06Bh, 004h
    db 089h, 06Ch, 024h, 004h, 08Bh, 0ECh, 081h, 0ECh, 0F8h, 001h, 000h, 000h, 08Bh, 043h, 008h, 08Bh
    db 050h, 00Ch, 0A1h
    dd ?g_rva01356A9C@@3PAHA
    db 08Bh, 004h, 090h, 08Bh, 04Bh, 01Ch, 08Bh, 053h, 018h, 066h, 089h, 045h, 080h, 066h, 089h, 045h
    db 082h, 066h, 089h, 045h, 084h, 066h, 089h, 045h, 086h, 08Dh, 004h, 00Ah, 03Bh, 0C8h, 056h, 057h
    db 089h, 04Dh, 0ECh, 089h, 085h, 06Ch, 0FFh, 0FFh, 0FFh, 00Fh, 083h, 065h, 015h, 000h, 000h, 08Bh
    db 04Bh, 00Ch, 08Bh, 053h, 014h, 0C1h, 0E0h, 002h, 089h, 045h, 0FCh, 08Bh, 043h, 010h, 089h, 04Dh
    db 0F0h, 08Dh, 00Ch, 0D5h, 000h, 000h, 000h, 000h, 089h, 045h, 0F8h, 02Bh, 0C1h, 089h, 045h, 0F4h
    db 08Bh, 055h, 0F0h, 08Bh, 045h, 0F8h, 08Bh, 04Bh, 008h, 089h, 055h, 094h, 08Bh, 051h, 024h, 089h
    db 045h, 098h, 08Bh, 045h, 0FCh, 08Bh, 00Ch, 010h, 08Bh, 053h, 020h, 08Bh, 004h, 08Ah, 089h, 045h
    db 09Ch, 050h, 055h, 051h, 052h, 056h, 057h, 08Bh, 045h, 09Ch, 033h, 0D2h, 08Bh, 04Bh, 014h, 00Fh
    db 075h, 0F6h, 00Fh, 06Eh, 0E8h, 08Bh, 045h, 094h, 00Fh, 071h, 0D6h, 00Eh, 00Fh, 061h, 0EDh, 08Dh
    db 0B5h, 010h, 0FEh, 0FFh, 0FFh, 00Fh, 062h, 0EDh, 02Bh, 0D1h, 00Fh, 0D5h, 0F5h, 00Fh, 07Fh, 0ADh
    db 050h, 0FFh, 0FFh, 0FFh, 08Dh, 0BDh, 090h, 0FEh, 0FFh, 0FFh, 00Fh, 0EFh, 0FFh, 00Fh, 0D5h, 0F5h
    db 08Dh, 004h, 090h, 00Fh, 06Fh, 004h, 010h, 00Fh, 07Fh, 0C1h, 00Fh, 060h, 0C7h, 00Fh, 071h, 0D6h
    db 005h, 00Fh, 07Fh, 0B5h, 070h, 0FFh, 0FFh, 0FFh, 00Fh, 06Fh, 010h, 00Fh, 068h, 0CFh, 00Fh, 07Fh
    db 0D3h, 00Fh, 060h, 0D7h, 00Fh, 07Fh, 007h, 00Fh, 068h, 0DFh, 00Fh, 07Fh, 04Fh, 008h, 00Fh, 06Fh
    db 024h, 008h, 00Fh, 07Fh, 057h, 010h, 00Fh, 07Fh, 05Fh, 018h, 00Fh, 07Fh, 0E5h, 00Fh, 060h, 0E7h
    db 00Fh, 06Fh, 004h, 048h, 00Fh, 068h, 0EFh, 00Fh, 07Fh, 0C1h, 00Fh, 07Fh, 067h, 020h, 00Fh, 060h
    db 0C7h, 08Dh, 004h, 088h, 00Fh, 07Fh, 06Fh, 028h, 00Fh, 068h, 0CFh, 00Fh, 06Fh, 014h, 010h, 00Fh
    db 07Fh, 047h, 030h, 00Fh, 07Fh, 0D3h, 00Fh, 060h, 0D7h, 00Fh, 07Fh, 04Fh, 038h, 00Fh, 068h, 0DFh
    db 00Fh, 06Fh, 020h, 00Fh, 07Fh, 057h, 040h, 00Fh, 07Fh, 0E5h, 00Fh, 07Fh, 05Fh, 048h, 00Fh, 060h
    db 0E7h, 00Fh, 068h, 0EFh, 00Fh, 06Fh, 004h, 008h, 00Fh, 07Fh, 067h, 050h, 00Fh, 07Fh, 0C1h, 00Fh
    db 07Fh, 06Fh, 058h, 00Fh, 060h, 0C7h, 00Fh, 068h, 0CFh, 00Fh, 06Fh, 014h, 048h, 08Dh, 004h, 088h
    db 00Fh, 07Fh, 0D3h, 00Fh, 07Fh, 047h, 060h, 00Fh, 060h, 0D7h, 00Fh, 068h, 0DFh, 00Fh, 06Fh, 024h
    db 010h, 00Fh, 07Fh, 04Fh, 068h, 00Fh, 07Fh, 0E5h, 00Fh, 060h, 0E7h, 00Fh, 07Fh, 057h, 070h, 00Fh
    db 07Fh, 05Fh, 078h, 00Fh, 06Fh, 000h, 00Fh, 068h, 0EFh, 00Fh, 07Fh, 0C1h, 00Fh, 07Fh, 0A7h, 080h
    db 000h, 000h, 000h, 00Fh, 060h, 0C7h, 00Fh, 068h, 0CFh, 00Fh, 07Fh, 0AFh, 088h, 000h, 000h, 000h
    db 00Fh, 07Fh, 087h, 090h, 000h, 000h, 000h, 00Fh, 07Fh, 08Fh, 098h, 000h, 000h, 000h, 00Fh, 075h
    db 0DBh, 00Fh, 071h, 0F3h, 00Fh, 00Fh, 071h, 0D3h, 008h, 00Fh, 06Fh, 057h, 010h, 00Fh, 06Fh, 077h
    db 050h, 00Fh, 0F9h, 0D3h, 00Fh, 0F9h, 0F3h, 00Fh, 07Fh, 0D0h, 00Fh, 07Fh, 0F4h, 00Fh, 0D5h, 0D2h
    db 00Fh, 0D5h, 0F6h, 00Fh, 07Fh, 0D1h, 00Fh, 07Fh, 0F5h, 00Fh, 06Fh, 057h, 020h, 00Fh, 06Fh, 077h
    db 060h, 00Fh, 0F9h, 0D3h, 00Fh, 0F9h, 0F3h, 00Fh, 0FDh, 0C2h, 00Fh, 0FDh, 0E6h, 00Fh, 0D5h, 0D2h
    db 00Fh, 0D5h, 0F6h, 00Fh, 0FDh, 0CAh, 00Fh, 0FDh, 0EEh, 00Fh, 06Fh, 057h, 030h, 00Fh, 06Fh, 077h
    db 070h, 00Fh, 0F9h, 0D3h, 00Fh, 0F9h, 0F3h, 00Fh, 0FDh, 0C2h, 00Fh, 0FDh, 0E6h, 00Fh, 0D5h, 0D2h
    db 00Fh, 0D5h, 0F6h, 00Fh, 0FDh, 0CAh, 00Fh, 0FDh, 0EEh, 00Fh, 06Fh, 057h, 040h, 00Fh, 06Fh, 0B7h
    db 080h, 000h, 000h, 000h, 00Fh, 0F9h, 0D3h, 00Fh, 0F9h, 0F3h, 00Fh, 0FDh, 0C2h, 00Fh, 0FDh, 0E6h
    db 00Fh, 0D5h, 0D2h, 00Fh, 0D5h, 0F6h, 00Fh, 0FDh, 0CAh, 00Fh, 0FDh, 0EEh, 00Fh, 07Fh, 0DFh, 00Fh
    db 071h, 0D7h, 007h, 00Fh, 07Fh, 0C2h, 00Fh, 07Fh, 0E6h, 00Fh, 0FDh, 0C7h, 00Fh, 0FDh, 0E7h, 00Fh
    db 071h, 0E2h, 001h, 00Fh, 071h, 0E6h, 001h, 00Fh, 071h, 0E0h, 001h, 00Fh, 071h, 0E4h, 001h, 00Fh
    db 0D5h, 0D0h, 00Fh, 0D5h, 0F4h, 00Fh, 0F9h, 0CAh, 00Fh, 0F9h, 0EEh, 00Fh, 06Fh, 0BDh, 070h, 0FFh
    db 0FFh, 0FFh, 00Fh, 07Fh, 0CAh, 00Fh, 07Fh, 0EEh, 00Fh, 07Fh, 04Dh, 0B0h, 00Fh, 07Fh, 06Dh, 0C0h
    db 00Fh, 0F9h, 0CFh, 00Fh, 0F9h, 0EFh, 00Fh, 071h, 0E2h, 00Fh, 00Fh, 071h, 0E6h, 00Fh, 00Fh, 071h
    db 0E1h, 00Fh, 00Fh, 071h, 0E5h, 00Fh, 00Fh, 06Fh, 07Fh, 040h, 00Fh, 0DFh, 0D1h, 00Fh, 0DFh, 0F5h
    db 00Fh, 06Fh, 067h, 050h, 00Fh, 0DBh, 0F2h, 00Fh, 07Fh, 0FAh, 00Fh, 0D9h, 0FCh, 00Fh, 0D9h, 0E2h
    db 00Fh, 0EBh, 0FCh, 00Fh, 0F9h, 0BDh, 050h, 0FFh, 0FFh, 0FFh, 00Fh, 071h, 0E7h, 00Fh, 00Fh, 0DBh
    db 0FEh, 083h, 0C7h, 008h, 00Fh, 06Fh, 057h, 010h, 00Fh, 06Fh, 077h, 050h, 00Fh, 0F9h, 0D3h, 00Fh
    db 0F9h, 0F3h, 00Fh, 07Fh, 0D0h, 00Fh, 07Fh, 0F4h, 00Fh, 0D5h, 0D2h, 00Fh, 0D5h, 0F6h, 00Fh, 07Fh
    db 0D1h, 00Fh, 07Fh, 0F5h, 00Fh, 06Fh, 057h, 020h, 00Fh, 06Fh, 077h, 060h, 00Fh, 0F9h, 0D3h, 00Fh
    db 0F9h, 0F3h, 00Fh, 0FDh, 0C2h, 00Fh, 0FDh, 0E6h, 00Fh, 0D5h, 0D2h, 00Fh, 0D5h, 0F6h, 00Fh, 0FDh
    db 0CAh, 00Fh, 0FDh, 0EEh, 00Fh, 06Fh, 057h, 030h, 00Fh, 06Fh, 077h, 070h, 00Fh, 0F9h, 0D3h, 00Fh
    db 0F9h, 0F3h, 00Fh, 0FDh, 0C2h, 00Fh, 0FDh, 0E6h, 00Fh, 0D5h, 0D2h, 00Fh, 0D5h, 0F6h, 00Fh, 0FDh
    db 0CAh, 00Fh, 0FDh, 0EEh, 00Fh, 06Fh, 057h, 040h, 00Fh, 06Fh, 0B7h, 080h, 000h, 000h, 000h, 00Fh
    db 0F9h, 0D3h, 00Fh, 0F9h, 0F3h, 00Fh, 0FDh, 0C2h, 00Fh, 0FDh, 0E6h, 00Fh, 0D5h, 0D2h, 00Fh, 0D5h
    db 0F6h, 00Fh, 0FDh, 0CAh, 00Fh, 0FDh, 0EEh, 00Fh, 071h, 0D3h, 007h, 00Fh, 07Fh, 0C2h, 00Fh, 07Fh
    db 0E6h, 00Fh, 0FDh, 0C3h, 00Fh, 0FDh, 0E3h, 00Fh, 071h, 0E2h, 001h, 00Fh, 071h, 0E6h, 001h, 00Fh
    db 071h, 0E0h, 001h, 00Fh, 071h, 0E4h, 001h, 00Fh, 0D5h, 0D0h, 00Fh, 0D5h, 0F4h, 00Fh, 0F9h, 0CAh
    db 00Fh, 0F9h, 0EEh, 00Fh, 07Fh, 04Dh, 0D0h, 00Fh, 07Fh, 06Dh, 0A0h, 00Fh, 06Fh, 09Dh, 070h, 0FFh
    db 0FFh, 0FFh, 00Fh, 07Fh, 0CAh, 00Fh, 07Fh, 0EEh, 00Fh, 0F9h, 0CBh, 00Fh, 0F9h, 0EBh, 00Fh, 071h
    db 0E2h, 00Fh, 00Fh, 071h, 0E6h, 00Fh, 00Fh, 071h, 0E1h, 00Fh, 00Fh, 071h, 0E5h, 00Fh, 00Fh, 06Fh
    db 047h, 040h, 00Fh, 0DFh, 0D1h, 00Fh, 0DFh, 0F5h, 00Fh, 06Fh, 067h, 050h, 00Fh, 0DBh, 0F2h, 00Fh
    db 07Fh, 0C2h, 00Fh, 0D9h, 0C4h, 00Fh, 0D9h, 0E2h, 00Fh, 0EBh, 0C4h, 00Fh, 0F9h, 085h, 050h, 0FFh
    db 0FFh, 0FFh, 00Fh, 071h, 0E0h, 00Fh, 00Fh, 0DBh, 0C6h, 083h, 0EFh, 008h, 00Fh, 06Fh, 04Dh, 080h
    db 00Fh, 06Fh, 05Fh, 030h, 00Fh, 06Fh, 067h, 040h, 00Fh, 06Fh, 06Fh, 050h, 00Fh, 06Fh, 077h, 060h
    db 00Fh, 0F9h, 0ECh, 00Fh, 0F9h, 0DEh, 00Fh, 07Fh, 0ECh, 00Fh, 0FDh, 0E5h, 00Fh, 0FDh, 01Dh
    dd g_Va012D86D0
    db 00Fh, 0FDh, 0ECh, 00Fh, 0FDh, 0DDh, 00Fh, 071h, 0E3h, 003h, 00Fh, 07Fh, 0DAh, 00Fh, 071h, 0E3h
    db 00Fh, 00Fh, 0EFh, 0D3h, 00Fh, 0E9h, 0D3h, 00Fh, 0EBh, 01Dh
    dd g_Va012D86E0
    db 00Fh, 07Fh, 0CCh, 00Fh, 0F9h, 0CAh, 00Fh, 07Fh, 0CDh, 00Fh, 071h, 0E1h, 00Fh, 00Fh, 0EFh, 0E9h
    db 00Fh, 0E9h, 0E9h, 00Fh, 0D9h, 0E5h, 00Fh, 0D5h, 0E3h, 00Fh, 06Fh, 04Fh, 040h, 00Fh, 06Fh, 057h
    db 050h, 00Fh, 0FDh, 0CCh, 00Fh, 0F9h, 0D4h, 00Fh, 0EFh, 0F6h, 00Fh, 067h, 0C9h, 00Fh, 067h, 0D2h
    db 00Fh, 060h, 0CEh, 00Fh, 07Fh, 08Dh, 040h, 0FFh, 0FFh, 0FFh, 00Fh, 060h, 0D6h, 00Fh, 07Fh, 095h
    db 030h, 0FFh, 0FFh, 0FFh, 00Fh, 06Fh, 02Fh, 00Fh, 06Fh, 067h, 010h, 00Fh, 07Fh, 0E3h, 00Fh, 07Fh
    db 0EEh, 00Fh, 0D9h, 0E6h, 00Fh, 0D9h, 0EBh, 00Fh, 0EBh, 0E5h, 00Fh, 0F9h, 0A5h, 050h, 0FFh, 0FFh
    db 0FFh, 00Fh, 071h, 0E4h, 00Fh, 00Fh, 07Fh, 0E1h, 00Fh, 0DBh, 0E6h, 00Fh, 0DFh, 0CBh, 00Fh, 0EBh
    db 0CCh, 00Fh, 06Fh, 0A7h, 080h, 000h, 000h, 000h, 00Fh, 06Fh, 0AFh, 090h, 000h, 000h, 000h, 00Fh
    db 07Fh, 0E3h, 00Fh, 07Fh, 0EEh, 00Fh, 0D9h, 0E6h, 00Fh, 0D9h, 0EBh, 00Fh, 0EBh, 0E5h, 00Fh, 0F9h
    db 0A5h, 050h, 0FFh, 0FFh, 0FFh, 00Fh, 071h, 0E4h, 00Fh, 00Fh, 07Fh, 0E2h, 00Fh, 0DBh, 0E6h, 00Fh
    db 0DFh, 0D3h, 00Fh, 0EBh, 0D4h, 00Fh, 07Fh, 0CBh, 00Fh, 0FDh, 0DBh, 00Fh, 0FDh, 0D9h, 00Fh, 06Fh
    db 067h, 010h, 00Fh, 0FDh, 05Fh, 020h, 00Fh, 0FDh, 067h, 030h, 00Fh, 0FDh, 05Fh, 040h, 00Fh, 0FDh
    db 025h
    dd g_Va012D86D0
    db 00Fh, 0FDh, 0DCh, 00Fh, 07Fh, 0DCh, 00Fh, 06Fh, 06Fh, 010h, 00Fh, 0FDh, 0E5h, 00Fh, 071h, 0F4h
    db 001h, 00Fh, 0F9h, 067h, 040h, 00Fh, 0FDh, 067h, 050h, 00Fh, 071h, 0E4h, 004h, 00Fh, 0F9h, 0E5h
    db 00Fh, 0DBh, 0E7h, 00Fh, 0FDh, 0E5h, 00Fh, 07Fh, 026h, 00Fh, 06Fh, 06Fh, 020h, 00Fh, 0F9h, 0D9h
    db 00Fh, 0FDh, 05Fh, 050h, 00Fh, 07Fh, 0ECh, 00Fh, 0FDh, 0E3h, 00Fh, 0FDh, 0E4h, 00Fh, 0F9h, 067h
    db 050h, 00Fh, 0FDh, 067h, 060h, 00Fh, 071h, 0E4h, 004h, 00Fh, 0F9h, 0E5h, 00Fh, 0DBh, 0E7h, 00Fh
    db 0FDh, 0E5h, 00Fh, 07Fh, 066h, 010h, 00Fh, 06Fh, 06Fh, 030h, 00Fh, 0F9h, 0D9h, 00Fh, 0FDh, 05Fh
    db 060h, 00Fh, 07Fh, 0ECh, 00Fh, 0FDh, 0E3h, 00Fh, 0FDh, 0E4h, 00Fh, 0F9h, 067h, 060h, 00Fh, 0FDh
    db 067h, 070h, 00Fh, 071h, 0E4h, 004h, 00Fh, 0F9h, 0E5h, 00Fh, 0DBh, 0E7h, 00Fh, 0FDh, 0E5h, 00Fh
    db 07Fh, 066h, 020h, 00Fh, 06Fh, 06Fh, 040h, 00Fh, 0F9h, 0D9h, 00Fh, 0FDh, 05Fh, 070h, 00Fh, 07Fh
    db 0ECh, 00Fh, 0FDh, 0E3h, 00Fh, 0FDh, 0E4h, 00Fh, 0FDh, 0E1h, 00Fh, 0F9h, 067h, 010h, 00Fh, 0F9h
    db 067h, 070h, 00Fh, 0FDh, 0A7h, 080h, 000h, 000h, 000h, 00Fh, 06Fh, 0ADh, 040h, 0FFh, 0FFh, 0FFh
    db 00Fh, 071h, 0E4h, 004h, 00Fh, 0F9h, 0E5h, 00Fh, 0DBh, 0E7h, 00Fh, 0FDh, 0E5h, 00Fh, 07Fh, 066h
    db 030h, 00Fh, 06Fh, 06Fh, 050h, 00Fh, 0F9h, 05Fh, 010h, 00Fh, 0FDh, 09Fh, 080h, 000h, 000h, 000h
    db 00Fh, 07Fh, 0ECh, 00Fh, 0FDh, 0E3h, 00Fh, 0FDh, 0E4h, 00Fh, 0FDh, 067h, 010h, 00Fh, 0F9h, 067h
    db 020h, 00Fh, 0F9h, 0A7h, 080h, 000h, 000h, 000h, 00Fh, 0FDh, 0E2h, 00Fh, 06Fh, 0ADh, 030h, 0FFh
    db 0FFh, 0FFh, 00Fh, 071h, 0E4h, 004h, 00Fh, 0F9h, 0E5h, 00Fh, 0DBh, 0E7h, 00Fh, 0FDh, 0E5h, 00Fh
    db 07Fh, 066h, 040h, 00Fh, 06Fh, 06Fh, 060h, 00Fh, 0F9h, 05Fh, 020h, 00Fh, 0FDh, 0DAh, 00Fh, 07Fh
    db 0ECh, 00Fh, 0FDh, 0E3h, 00Fh, 0FDh, 0E4h, 00Fh, 0FDh, 067h, 020h, 00Fh, 0F9h, 067h, 030h, 00Fh
    db 071h, 0E4h, 004h, 00Fh, 0F9h, 0E5h, 00Fh, 0DBh, 0E7h, 00Fh, 0FDh, 0E5h, 00Fh, 07Fh, 066h, 050h
    db 00Fh, 06Fh, 06Fh, 070h, 00Fh, 0F9h, 05Fh, 030h, 00Fh, 0FDh, 0DAh, 00Fh, 07Fh, 0ECh, 00Fh, 0FDh
    db 0E3h, 00Fh, 0FDh, 0E4h, 00Fh, 0FDh, 067h, 030h, 00Fh, 0F9h, 067h, 040h, 00Fh, 071h, 0E4h, 004h
    db 00Fh, 0F9h, 0E5h, 00Fh, 0DBh, 0E7h, 00Fh, 0FDh, 0E5h, 00Fh, 07Fh, 066h, 060h, 00Fh, 06Fh, 0AFh
    db 080h, 000h, 000h, 000h, 00Fh, 0F9h, 05Fh, 040h, 00Fh, 0FDh, 0DAh, 00Fh, 07Fh, 0ECh, 00Fh, 0FDh
    db 0E3h, 00Fh, 0FDh, 0E4h, 00Fh, 0FDh, 067h, 040h, 00Fh, 0F9h, 067h, 050h, 00Fh, 071h, 0E4h, 004h
    db 00Fh, 0F9h, 0E5h, 00Fh, 0DBh, 0E7h, 00Fh, 0FDh, 0E5h, 00Fh, 07Fh, 066h, 070h, 083h, 0C7h, 008h
    db 083h, 0C6h, 008h, 00Fh, 06Fh, 04Dh, 080h, 00Fh, 06Fh, 05Fh, 030h, 00Fh, 06Fh, 067h, 040h, 00Fh
    db 06Fh, 06Fh, 050h, 00Fh, 06Fh, 077h, 060h, 00Fh, 0F9h, 0ECh, 00Fh, 0F9h, 0DEh, 00Fh, 07Fh, 0ECh
    db 00Fh, 0FDh, 01Dh
    dd g_Va012D86D0
    db 00Fh, 0FDh, 0E4h, 00Fh, 0FDh, 0DCh, 00Fh, 0FDh, 0DDh, 00Fh, 071h, 0E3h, 003h, 00Fh, 07Fh, 0DAh
    db 00Fh, 071h, 0E3h, 00Fh, 00Fh, 0EFh, 0D3h, 00Fh, 0E9h, 0D3h, 00Fh, 0EBh, 01Dh
    dd g_Va012D86E0
    db 00Fh, 07Fh, 0CCh, 00Fh, 0F9h, 0CAh, 00Fh, 07Fh, 0CDh, 00Fh, 071h, 0E1h, 00Fh, 00Fh, 0EFh, 0E9h
    db 00Fh, 0E9h, 0E9h, 00Fh, 0D9h, 0E5h, 00Fh, 0D5h, 0E3h, 00Fh, 06Fh, 04Fh, 040h, 00Fh, 06Fh, 057h
    db 050h, 00Fh, 0FDh, 0CCh, 00Fh, 0F9h, 0D4h, 00Fh, 0EFh, 0F6h, 00Fh, 067h, 0C9h, 00Fh, 067h, 0D2h
    db 00Fh, 060h, 0CEh, 00Fh, 07Fh, 08Dh, 040h, 0FFh, 0FFh, 0FFh, 00Fh, 060h, 0D6h, 00Fh, 07Fh, 095h
    db 030h, 0FFh, 0FFh, 0FFh, 00Fh, 06Fh, 02Fh, 00Fh, 06Fh, 067h, 010h, 00Fh, 07Fh, 0E3h, 00Fh, 07Fh
    db 0EEh, 00Fh, 0D9h, 0E6h, 00Fh, 0D9h, 0EBh, 00Fh, 0EBh, 0E5h, 00Fh, 0F9h, 0A5h, 050h, 0FFh, 0FFh
    db 0FFh, 00Fh, 071h, 0E4h, 00Fh, 00Fh, 07Fh, 0E1h, 00Fh, 0DBh, 0E6h, 00Fh, 0DFh, 0CBh, 00Fh, 0EBh
    db 0CCh, 00Fh, 06Fh, 0A7h, 080h, 000h, 000h, 000h, 00Fh, 06Fh, 0AFh, 090h, 000h, 000h, 000h, 00Fh
    db 07Fh, 0E3h, 00Fh, 07Fh, 0EEh, 00Fh, 0D9h, 0E6h, 00Fh, 0D9h, 0EBh, 00Fh, 0EBh, 0E5h, 00Fh, 0F9h
    db 0A5h, 050h, 0FFh, 0FFh, 0FFh, 00Fh, 071h, 0E4h, 00Fh, 00Fh, 07Fh, 0E2h, 00Fh, 0DBh, 0E6h, 00Fh
    db 0DFh, 0D3h, 00Fh, 0EBh, 0D4h, 00Fh, 07Fh, 0CBh, 00Fh, 0FDh, 0DBh, 00Fh, 0FDh, 0D9h, 00Fh, 06Fh
    db 067h, 010h, 00Fh, 0FDh, 05Fh, 020h, 00Fh, 0FDh, 067h, 030h, 00Fh, 0FDh, 05Fh, 040h, 00Fh, 0FDh
    db 025h
    dd g_Va012D86D0
    db 00Fh, 0FDh, 0DCh, 00Fh, 07Fh, 0DCh, 00Fh, 06Fh, 06Fh, 010h, 00Fh, 0FDh, 0E5h, 00Fh, 071h, 0F4h
    db 001h, 00Fh, 0F9h, 067h, 040h, 00Fh, 0FDh, 067h, 050h, 00Fh, 071h, 0E4h, 004h, 00Fh, 0F9h, 0E5h
    db 00Fh, 0DBh, 0E0h, 00Fh, 0FDh, 0E5h, 00Fh, 07Fh, 026h, 00Fh, 06Fh, 06Fh, 020h, 00Fh, 0F9h, 0D9h
    db 00Fh, 0FDh, 05Fh, 050h, 00Fh, 07Fh, 0ECh, 00Fh, 0FDh, 0E3h, 00Fh, 0FDh, 0E4h, 00Fh, 0F9h, 067h
    db 050h, 00Fh, 0FDh, 067h, 060h, 00Fh, 071h, 0E4h, 004h, 00Fh, 0F9h, 0E5h, 00Fh, 0DBh, 0E0h, 00Fh
    db 0FDh, 0E5h, 00Fh, 07Fh, 066h, 010h, 00Fh, 06Fh, 06Fh, 030h, 00Fh, 0F9h, 0D9h, 00Fh, 0FDh, 05Fh
    db 060h, 00Fh, 07Fh, 0ECh, 00Fh, 0FDh, 0E3h, 00Fh, 0FDh, 0E4h, 00Fh, 0F9h, 067h, 060h, 00Fh, 0FDh
    db 067h, 070h, 00Fh, 071h, 0E4h, 004h, 00Fh, 0F9h, 0E5h, 00Fh, 0DBh, 0E0h, 00Fh, 0FDh, 0E5h, 00Fh
    db 07Fh, 066h, 020h, 00Fh, 06Fh, 06Fh, 040h, 00Fh, 0F9h, 0D9h, 00Fh, 0FDh, 05Fh, 070h, 00Fh, 07Fh
    db 0ECh, 00Fh, 0FDh, 0E3h, 00Fh, 0FDh, 0E4h, 00Fh, 0FDh, 0E1h, 00Fh, 0F9h, 067h, 010h, 00Fh, 0F9h
    db 067h, 070h, 00Fh, 0FDh, 0A7h, 080h, 000h, 000h, 000h, 00Fh, 06Fh, 0ADh, 040h, 0FFh, 0FFh, 0FFh
    db 00Fh, 071h, 0E4h, 004h, 00Fh, 0F9h, 0E5h, 00Fh, 0DBh, 0E0h, 00Fh, 0FDh, 0E5h, 00Fh, 07Fh, 066h
    db 030h, 00Fh, 06Fh, 06Fh, 050h, 00Fh, 0F9h, 05Fh, 010h, 00Fh, 0FDh, 09Fh, 080h, 000h, 000h, 000h
    db 00Fh, 07Fh, 0ECh, 00Fh, 0FDh, 0E3h, 00Fh, 0FDh, 0E4h, 00Fh, 0FDh, 067h, 010h, 00Fh, 0F9h, 067h
    db 020h, 00Fh, 0F9h, 0A7h, 080h, 000h, 000h, 000h, 00Fh, 0FDh, 0E2h, 00Fh, 06Fh, 0ADh, 030h, 0FFh
    db 0FFh, 0FFh, 00Fh, 071h, 0E4h, 004h, 00Fh, 0F9h, 0E5h, 00Fh, 0DBh, 0E0h, 00Fh, 0FDh, 0E5h, 00Fh
    db 07Fh, 066h, 040h, 00Fh, 06Fh, 06Fh, 060h, 00Fh, 0F9h, 05Fh, 020h, 00Fh, 0FDh, 0DAh, 00Fh, 07Fh
    db 0ECh, 00Fh, 0FDh, 0E3h, 00Fh, 0FDh, 0E4h, 00Fh, 0FDh, 067h, 020h, 00Fh, 0F9h, 067h, 030h, 00Fh
    db 071h, 0E4h, 004h, 00Fh, 0F9h, 0E5h, 00Fh, 0DBh, 0E0h, 00Fh, 0FDh, 0E5h, 00Fh, 07Fh, 066h, 050h
    db 00Fh, 06Fh, 06Fh, 070h, 00Fh, 0F9h, 05Fh, 030h, 00Fh, 0FDh, 0DAh, 00Fh, 07Fh, 0ECh, 00Fh, 0FDh
    db 0E3h, 00Fh, 0FDh, 0E4h, 00Fh, 0FDh, 067h, 030h, 00Fh, 0F9h, 067h, 040h, 00Fh, 071h, 0E4h, 004h
    db 00Fh, 0F9h, 0E5h, 00Fh, 0DBh, 0E0h, 00Fh, 0FDh, 0E5h, 00Fh, 07Fh, 066h, 060h, 00Fh, 06Fh, 0AFh
    db 080h, 000h, 000h, 000h, 00Fh, 0F9h, 05Fh, 040h, 00Fh, 0FDh, 0DAh, 00Fh, 07Fh, 0ECh, 00Fh, 0FDh
    db 0E3h, 00Fh, 0FDh, 0E4h, 00Fh, 0FDh, 067h, 040h, 00Fh, 0F9h, 067h, 050h, 00Fh, 071h, 0E4h, 004h
    db 00Fh, 0F9h, 0E5h, 00Fh, 0DBh, 0E0h, 00Fh, 0FDh, 0E5h, 00Fh, 07Fh, 066h, 070h, 083h, 0C7h, 008h
    db 083h, 0EEh, 008h, 08Bh, 06Dh, 098h, 08Dh, 06Ch, 095h, 000h, 00Fh, 06Fh, 006h, 00Fh, 067h, 046h
    db 008h, 00Fh, 07Fh, 045h, 000h, 00Fh, 06Fh, 04Eh, 010h, 00Fh, 067h, 04Eh, 018h, 00Fh, 07Fh, 04Ch
    db 00Dh, 000h, 00Fh, 06Fh, 056h, 020h, 00Fh, 067h, 056h, 028h, 00Fh, 07Fh, 054h, 04Dh, 000h, 00Fh
    db 06Fh, 05Eh, 030h, 00Fh, 067h, 05Eh, 038h, 08Dh, 06Ch, 08Dh, 000h, 00Fh, 07Fh, 05Ch, 015h, 000h
    db 00Fh, 06Fh, 046h, 040h, 00Fh, 067h, 046h, 048h, 00Fh, 07Fh, 045h, 000h, 00Fh, 06Fh, 04Eh, 050h
    db 00Fh, 067h, 04Eh, 058h, 00Fh, 07Fh, 04Ch, 00Dh, 000h, 00Fh, 06Fh, 056h, 060h, 00Fh, 067h, 056h
    db 068h, 00Fh, 07Fh, 054h, 04Dh, 000h, 00Fh, 06Fh, 05Eh, 070h, 00Fh, 067h, 05Eh, 078h, 08Dh, 06Ch
    db 04Dh, 000h, 00Fh, 07Fh, 05Ch, 00Dh, 000h, 05Fh, 05Eh, 05Ah, 059h, 05Dh, 058h, 00Fh, 0B7h, 07Dh
    db 0D4h, 00Fh, 0B7h, 075h, 0D6h, 003h, 0F7h, 00Fh, 0B7h, 07Dh, 0D2h, 003h, 0F7h, 00Fh, 0B7h, 07Dh
    db 0D0h, 003h, 0F7h, 00Fh, 0B7h, 07Dh, 0B6h, 003h, 0F7h, 00Fh, 0B7h, 07Dh, 0B4h, 08Bh, 053h, 008h
    db 08Bh, 042h, 028h, 08Bh, 04Dh, 0ECh, 003h, 0F7h, 00Fh, 0B7h, 07Dh, 0B2h, 003h, 0F7h, 00Fh, 0B7h
    db 07Dh, 0B0h, 003h, 0F7h, 08Bh, 03Ch, 088h, 003h, 0FEh, 08Bh, 075h, 0FCh, 089h, 03Ch, 088h, 00Fh
    db 0B7h, 07Dh, 0A4h, 08Dh, 004h, 088h, 08Bh, 042h, 028h, 003h, 0C6h, 00Fh, 0B7h, 075h, 0A6h, 003h
    db 0F7h, 00Fh, 0B7h, 07Dh, 0A2h, 003h, 0F7h, 00Fh, 0B7h, 07Dh, 0A0h, 003h, 0F7h, 00Fh, 0B7h, 07Dh
    db 0C6h, 003h, 0F7h, 00Fh, 0B7h, 07Dh, 0C4h, 003h, 0F7h, 00Fh, 0B7h, 07Dh, 0C2h, 003h, 0F7h, 00Fh
    db 0B7h, 07Dh, 0C0h, 003h, 0F7h, 001h, 030h, 03Bh, 04Bh, 01Ch, 075h, 026h, 08Bh, 07Dh, 0F0h, 08Bh
    db 075h, 0F8h, 08Bh, 055h, 0F4h, 0B8h, 008h, 000h, 000h, 000h, 041h, 003h, 0F8h, 003h, 0F0h, 003h
    db 0D0h, 089h, 04Dh, 0ECh, 089h, 07Dh, 0F0h, 089h, 075h, 0F8h, 089h, 055h, 0F4h, 0E9h, 06Fh, 00Bh
    db 000h, 000h, 08Bh, 052h, 024h, 08Bh, 00Ch, 08Ah, 08Bh, 045h, 0F4h, 08Bh, 053h, 020h, 08Bh, 00Ch
    db 08Ah, 066h, 00Fh, 0B6h, 050h, 0FBh, 066h, 089h, 095h, 090h, 0FEh, 0FFh, 0FFh, 089h, 04Dh, 09Ch
    db 066h, 00Fh, 0B6h, 048h, 004h, 066h, 089h, 08Dh, 020h, 0FFh, 0FFh, 0FFh, 08Bh, 04Bh, 014h, 066h
    db 00Fh, 0B6h, 054h, 008h, 0FBh, 066h, 089h, 095h, 092h, 0FEh, 0FFh, 0FFh, 066h, 00Fh, 0B6h, 054h
    db 008h, 004h, 066h, 089h, 095h, 022h, 0FFh, 0FFh, 0FFh, 066h, 00Fh, 0B6h, 054h, 048h, 0FBh, 066h
    db 089h, 095h, 094h, 0FEh, 0FFh, 0FFh, 066h, 00Fh, 0B6h, 054h, 048h, 004h, 066h, 089h, 095h, 024h
    db 0FFh, 0FFh, 0FFh, 08Dh, 014h, 049h, 066h, 00Fh, 0B6h, 074h, 010h, 0FBh, 066h, 00Fh, 0B6h, 054h
    db 010h, 004h, 066h, 089h, 095h, 026h, 0FFh, 0FFh, 0FFh, 066h, 00Fh, 0B6h, 054h, 088h, 0FBh, 066h
    db 089h, 095h, 098h, 0FEh, 0FFh, 0FFh, 066h, 00Fh, 0B6h, 054h, 088h, 004h, 066h, 089h, 095h, 028h
    db 0FFh, 0FFh, 0FFh, 08Dh, 014h, 089h, 066h, 089h, 0B5h, 096h, 0FEh, 0FFh, 0FFh, 066h, 00Fh, 0B6h
    db 074h, 010h, 0FBh, 066h, 00Fh, 0B6h, 054h, 010h, 004h, 066h, 089h, 095h, 02Ah, 0FFh, 0FFh, 0FFh
    db 08Dh, 014h, 049h, 06Bh, 0C9h, 007h, 0D1h, 0E2h, 066h, 089h, 0B5h, 09Ah, 0FEh, 0FFh, 0FFh, 066h
    db 00Fh, 0B6h, 074h, 010h, 0FBh, 066h, 00Fh, 0B6h, 054h, 010h, 004h, 066h, 089h, 095h, 02Ch, 0FFh
    db 0FFh, 0FFh, 066h, 00Fh, 0B6h, 054h, 008h, 0FBh, 089h, 045h, 098h, 089h, 045h, 094h, 066h, 00Fh
    db 0B6h, 044h, 008h, 004h, 066h, 089h, 0B5h, 09Ch, 0FEh, 0FFh, 0FFh, 066h, 089h, 095h, 09Eh, 0FEh
    db 0FFh, 0FFh, 066h, 089h, 085h, 02Eh, 0FFh, 0FFh, 0FFh, 050h, 055h, 08Bh, 045h, 09Ch, 00Fh, 06Eh
    db 0C0h, 051h, 00Fh, 061h, 0C0h, 00Fh, 06Fh, 00Dh
    dd g_Va012D86C0
    db 052h, 00Fh, 062h, 0C0h, 00Fh, 07Fh, 085h, 050h, 0FFh, 0FFh, 0FFh, 056h, 00Fh, 0D5h, 0C8h, 00Fh
    db 0D5h, 0C8h, 057h, 00Fh, 071h, 0D1h, 005h, 00Fh, 07Fh, 08Dh, 070h, 0FFh, 0FFh, 0FFh, 08Bh, 045h
    db 094h, 033h, 0D2h, 083h, 0E8h, 004h, 08Dh, 0B5h, 010h, 0FEh, 0FFh, 0FFh, 08Dh, 0BDh, 090h, 0FEh
    db 0FFh, 0FFh, 08Bh, 04Bh, 014h, 02Bh, 0D1h, 00Fh, 06Fh, 000h, 00Fh, 06Fh, 00Ch, 008h, 00Fh, 06Fh
    db 014h, 048h, 08Dh, 004h, 088h, 00Fh, 06Fh, 01Ch, 010h, 00Fh, 07Fh, 0C4h, 00Fh, 060h, 0C1h, 00Fh
    db 068h, 0E1h, 00Fh, 07Fh, 0D5h, 00Fh, 060h, 0D3h, 00Fh, 068h, 0EBh, 00Fh, 07Fh, 0C1h, 00Fh, 061h
    db 0C2h, 00Fh, 069h, 0CAh, 00Fh, 07Fh, 0E2h, 00Fh, 069h, 0E5h, 00Fh, 061h, 0D5h, 00Fh, 0EFh, 0FFh
    db 00Fh, 07Fh, 0C5h, 00Fh, 060h, 0C7h, 00Fh, 07Fh, 047h, 010h, 00Fh, 068h, 0EFh, 00Fh, 07Fh, 0C8h
    db 00Fh, 07Fh, 06Fh, 020h, 00Fh, 060h, 0CFh, 00Fh, 068h, 0C7h, 00Fh, 07Fh, 04Fh, 030h, 00Fh, 07Fh
    db 0D3h, 00Fh, 07Fh, 0E5h, 00Fh, 07Fh, 047h, 040h, 00Fh, 060h, 0D7h, 00Fh, 068h, 0DFh, 00Fh, 07Fh
    db 057h, 050h, 00Fh, 060h, 0E7h, 00Fh, 068h, 0EFh, 00Fh, 07Fh, 05Fh, 060h, 00Fh, 06Fh, 000h, 00Fh
    db 06Fh, 00Ch, 008h, 00Fh, 07Fh, 067h, 070h, 00Fh, 06Fh, 014h, 048h, 08Dh, 004h, 088h, 00Fh, 07Fh
    db 0AFh, 080h, 000h, 000h, 000h, 00Fh, 07Fh, 0C4h, 00Fh, 06Fh, 01Ch, 010h, 00Fh, 060h, 0C1h, 00Fh
    db 068h, 0E1h, 00Fh, 07Fh, 0D5h, 00Fh, 060h, 0D3h, 00Fh, 068h, 0EBh, 00Fh, 07Fh, 0C1h, 00Fh, 061h
    db 0C2h, 00Fh, 069h, 0CAh, 00Fh, 07Fh, 0E2h, 00Fh, 069h, 0E5h, 00Fh, 061h, 0D5h, 00Fh, 07Fh, 0C5h
    db 00Fh, 060h, 0C7h, 00Fh, 07Fh, 047h, 018h, 00Fh, 068h, 0EFh, 00Fh, 07Fh, 0C8h, 00Fh, 07Fh, 06Fh
    db 028h, 00Fh, 060h, 0CFh, 00Fh, 068h, 0C7h, 00Fh, 07Fh, 04Fh, 038h, 00Fh, 07Fh, 0D3h, 00Fh, 07Fh
    db 0E5h, 00Fh, 07Fh, 047h, 048h, 00Fh, 060h, 0D7h, 00Fh, 068h, 0DFh, 00Fh, 07Fh, 057h, 058h, 00Fh
    db 060h, 0E7h, 00Fh, 068h, 0EFh, 00Fh, 07Fh, 05Fh, 068h, 00Fh, 07Fh, 067h, 078h, 00Fh, 07Fh, 0AFh
    db 088h, 000h, 000h, 000h, 00Fh, 075h, 0DBh, 00Fh, 071h, 0F3h, 00Fh, 00Fh, 071h, 0D3h, 008h, 00Fh
    db 06Fh, 057h, 010h, 00Fh, 06Fh, 077h, 050h, 00Fh, 0F9h, 0D3h, 00Fh, 0F9h, 0F3h, 00Fh, 07Fh, 0D0h
    db 00Fh, 07Fh, 0F4h, 00Fh, 0D5h, 0D2h, 00Fh, 0D5h, 0F6h, 00Fh, 07Fh, 0D1h, 00Fh, 07Fh, 0F5h, 00Fh
    db 06Fh, 057h, 020h, 00Fh, 06Fh, 077h, 060h, 00Fh, 0F9h, 0D3h, 00Fh, 0F9h, 0F3h, 00Fh, 0FDh, 0C2h
    db 00Fh, 0FDh, 0E6h, 00Fh, 0D5h, 0D2h, 00Fh, 0D5h, 0F6h, 00Fh, 0FDh, 0CAh, 00Fh, 0FDh, 0EEh, 00Fh
    db 06Fh, 057h, 030h, 00Fh, 06Fh, 077h, 070h, 00Fh, 0F9h, 0D3h, 00Fh, 0F9h, 0F3h, 00Fh, 0FDh, 0C2h
    db 00Fh, 0FDh, 0E6h, 00Fh, 0D5h, 0D2h, 00Fh, 0D5h, 0F6h, 00Fh, 0FDh, 0CAh, 00Fh, 0FDh, 0EEh, 00Fh
    db 06Fh, 057h, 040h, 00Fh, 06Fh, 0B7h, 080h, 000h, 000h, 000h, 00Fh, 0F9h, 0D3h, 00Fh, 0F9h, 0F3h
    db 00Fh, 0FDh, 0C2h, 00Fh, 0FDh, 0E6h, 00Fh, 0D5h, 0D2h, 00Fh, 0D5h, 0F6h, 00Fh, 0FDh, 0CAh, 00Fh
    db 0FDh, 0EEh, 00Fh, 07Fh, 0DFh, 00Fh, 071h, 0D7h, 007h, 00Fh, 07Fh, 0C2h, 00Fh, 07Fh, 0E6h, 00Fh
    db 0FDh, 0C7h, 00Fh, 0FDh, 0E7h, 00Fh, 071h, 0E2h, 001h, 00Fh, 071h, 0E6h, 001h, 00Fh, 071h, 0E0h
    db 001h, 00Fh, 071h, 0E4h, 001h, 00Fh, 0D5h, 0D0h, 00Fh, 0D5h, 0F4h, 00Fh, 0F9h, 0CAh, 00Fh, 0F9h
    db 0EEh, 00Fh, 07Fh, 04Dh, 0B0h, 00Fh, 07Fh, 06Dh, 0C0h, 00Fh, 06Fh, 0BDh, 070h, 0FFh, 0FFh, 0FFh
    db 00Fh, 07Fh, 0CAh, 00Fh, 07Fh, 0EEh, 00Fh, 0F9h, 0CFh, 00Fh, 0F9h, 0EFh, 00Fh, 071h, 0E1h, 00Fh
    db 00Fh, 071h, 0E5h, 00Fh, 00Fh, 071h, 0E2h, 00Fh, 00Fh, 071h, 0E6h, 00Fh, 00Fh, 06Fh, 07Fh, 040h
    db 00Fh, 0DFh, 0D1h, 00Fh, 0DFh, 0F5h, 00Fh, 06Fh, 067h, 050h, 00Fh, 0DBh, 0F2h, 00Fh, 07Fh, 0FAh
    db 00Fh, 0D9h, 0FCh, 00Fh, 0D9h, 0E2h, 00Fh, 0EBh, 0FCh, 00Fh, 0F9h, 0BDh, 050h, 0FFh, 0FFh, 0FFh
    db 00Fh, 071h, 0E7h, 00Fh, 00Fh, 0DBh, 0FEh, 083h, 0C7h, 008h, 00Fh, 06Fh, 057h, 010h, 00Fh, 06Fh
    db 077h, 050h, 00Fh, 0F9h, 0D3h, 00Fh, 0F9h, 0F3h, 00Fh, 07Fh, 0D0h, 00Fh, 07Fh, 0F4h, 00Fh, 0D5h
    db 0D2h, 00Fh, 0D5h, 0F6h, 00Fh, 07Fh, 0D1h, 00Fh, 07Fh, 0F5h, 00Fh, 06Fh, 057h, 020h, 00Fh, 06Fh
    db 077h, 060h, 00Fh, 0F9h, 0D3h, 00Fh, 0F9h, 0F3h, 00Fh, 0FDh, 0C2h, 00Fh, 0FDh, 0E6h, 00Fh, 0D5h
    db 0D2h, 00Fh, 0D5h, 0F6h, 00Fh, 0FDh, 0CAh, 00Fh, 0FDh, 0EEh, 00Fh, 06Fh, 057h, 030h, 00Fh, 06Fh
    db 077h, 070h, 00Fh, 0F9h, 0D3h, 00Fh, 0F9h, 0F3h, 00Fh, 0FDh, 0C2h, 00Fh, 0FDh, 0E6h, 00Fh, 0D5h
    db 0D2h, 00Fh, 0D5h, 0F6h, 00Fh, 0FDh, 0CAh, 00Fh, 0FDh, 0EEh, 00Fh, 06Fh, 057h, 040h, 00Fh, 06Fh
    db 0B7h, 080h, 000h, 000h, 000h, 00Fh, 0F9h, 0D3h, 00Fh, 0F9h, 0F3h, 00Fh, 0FDh, 0C2h, 00Fh, 0FDh
    db 0E6h, 00Fh, 0D5h, 0D2h, 00Fh, 0D5h, 0F6h, 00Fh, 0FDh, 0CAh, 00Fh, 0FDh, 0EEh, 00Fh, 071h, 0D3h
    db 007h, 00Fh, 07Fh, 0C2h, 00Fh, 07Fh, 0E6h, 00Fh, 0FDh, 0C3h, 00Fh, 0FDh, 0E3h, 00Fh, 071h, 0E2h
    db 001h, 00Fh, 071h, 0E6h, 001h, 00Fh, 071h, 0E0h, 001h, 00Fh, 071h, 0E4h, 001h, 00Fh, 0D5h, 0D0h
    db 00Fh, 0D5h, 0F4h, 00Fh, 0F9h, 0CAh, 00Fh, 0F9h, 0EEh, 00Fh, 07Fh, 04Dh, 0D0h, 00Fh, 07Fh, 06Dh
    db 0A0h, 00Fh, 06Fh, 09Dh, 070h, 0FFh, 0FFh, 0FFh, 00Fh, 07Fh, 0CAh, 00Fh, 07Fh, 0EEh, 00Fh, 0F9h
    db 0CBh, 00Fh, 0F9h, 0EBh, 00Fh, 071h, 0E6h, 00Fh, 00Fh, 071h, 0E2h, 00Fh, 00Fh, 071h, 0E1h, 00Fh
    db 00Fh, 071h, 0E5h, 00Fh, 00Fh, 06Fh, 047h, 040h, 00Fh, 0DFh, 0D1h, 00Fh, 0DFh, 0F5h, 00Fh, 06Fh
    db 067h, 050h, 00Fh, 0DBh, 0F2h, 00Fh, 07Fh, 0C2h, 00Fh, 0D9h, 0C4h, 00Fh, 0D9h, 0E2h, 00Fh, 0EBh
    db 0C4h, 00Fh, 0F9h, 085h, 050h, 0FFh, 0FFh, 0FFh, 00Fh, 071h, 0E0h, 00Fh, 00Fh, 0DBh, 0C6h, 083h
    db 0EFh, 008h, 00Fh, 06Fh, 04Dh, 080h, 00Fh, 06Fh, 05Fh, 030h, 00Fh, 06Fh, 067h, 040h, 00Fh, 06Fh
    db 06Fh, 050h, 00Fh, 06Fh, 077h, 060h, 00Fh, 0F9h, 0ECh, 00Fh, 0F9h, 0DEh, 00Fh, 07Fh, 0ECh, 00Fh
    db 0FDh, 0E5h, 00Fh, 0FDh, 01Dh
    dd g_Va012D86D0
    db 00Fh, 0FDh, 0ECh, 00Fh, 0FDh, 0DDh, 00Fh, 071h, 0E3h, 003h, 00Fh, 07Fh, 0DAh, 00Fh, 071h, 0E3h
    db 00Fh, 00Fh, 0EFh, 0D3h, 00Fh, 0E9h, 0D3h, 00Fh, 0EBh, 01Dh
    dd g_Va012D86E0
    db 00Fh, 07Fh, 0CCh, 00Fh, 0F9h, 0CAh, 00Fh, 07Fh, 0CDh, 00Fh, 071h, 0E1h, 00Fh, 00Fh, 0EFh, 0E9h
    db 00Fh, 0E9h, 0E9h, 00Fh, 0D9h, 0E5h, 00Fh, 0D5h, 0E3h, 00Fh, 06Fh, 04Fh, 040h, 00Fh, 06Fh, 057h
    db 050h, 00Fh, 0FDh, 0CCh, 00Fh, 0F9h, 0D4h, 00Fh, 0EFh, 0F6h, 00Fh, 067h, 0C9h, 00Fh, 067h, 0D2h
    db 00Fh, 060h, 0CEh, 00Fh, 07Fh, 08Dh, 040h, 0FFh, 0FFh, 0FFh, 00Fh, 060h, 0D6h, 00Fh, 07Fh, 095h
    db 030h, 0FFh, 0FFh, 0FFh, 00Fh, 06Fh, 02Fh, 00Fh, 06Fh, 067h, 010h, 00Fh, 07Fh, 0E3h, 00Fh, 07Fh
    db 0EEh, 00Fh, 0D9h, 0E6h, 00Fh, 0D9h, 0EBh, 00Fh, 0EBh, 0E5h, 00Fh, 0F9h, 0A5h, 050h, 0FFh, 0FFh
    db 0FFh, 00Fh, 071h, 0E4h, 00Fh, 00Fh, 07Fh, 0E1h, 00Fh, 0DBh, 0E6h, 00Fh, 0DFh, 0CBh, 00Fh, 0EBh
    db 0CCh, 00Fh, 06Fh, 0A7h, 080h, 000h, 000h, 000h, 00Fh, 06Fh, 0AFh, 090h, 000h, 000h, 000h, 00Fh
    db 07Fh, 0E3h, 00Fh, 07Fh, 0EEh, 00Fh, 0D9h, 0E6h, 00Fh, 0D9h, 0EBh, 00Fh, 0EBh, 0E5h, 00Fh, 0F9h
    db 0A5h, 050h, 0FFh, 0FFh, 0FFh, 00Fh, 071h, 0E4h, 00Fh, 00Fh, 07Fh, 0E2h, 00Fh, 0DBh, 0E6h, 00Fh
    db 0DFh, 0D3h, 00Fh, 0EBh, 0D4h, 00Fh, 07Fh, 0CBh, 00Fh, 0FDh, 0DBh, 00Fh, 0FDh, 0D9h, 00Fh, 06Fh
    db 067h, 010h, 00Fh, 0FDh, 05Fh, 020h, 00Fh, 0FDh, 067h, 030h, 00Fh, 0FDh, 05Fh, 040h, 00Fh, 0FDh
    db 025h
    dd g_Va012D86D0
    db 00Fh, 0FDh, 0DCh, 00Fh, 07Fh, 0DCh, 00Fh, 06Fh, 06Fh, 010h, 00Fh, 0FDh, 0E5h, 00Fh, 071h, 0F4h
    db 001h, 00Fh, 0F9h, 067h, 040h, 00Fh, 0FDh, 067h, 050h, 00Fh, 071h, 0E4h, 004h, 00Fh, 0F9h, 0E5h
    db 00Fh, 0DBh, 0E7h, 00Fh, 0FDh, 0E5h, 00Fh, 07Fh, 026h, 00Fh, 06Fh, 06Fh, 020h, 00Fh, 0F9h, 0D9h
    db 00Fh, 0FDh, 05Fh, 050h, 00Fh, 07Fh, 0ECh, 00Fh, 0FDh, 0E3h, 00Fh, 0FDh, 0E4h, 00Fh, 0F9h, 067h
    db 050h, 00Fh, 0FDh, 067h, 060h, 00Fh, 071h, 0E4h, 004h, 00Fh, 0F9h, 0E5h, 00Fh, 0DBh, 0E7h, 00Fh
    db 0FDh, 0E5h, 00Fh, 07Fh, 066h, 010h, 00Fh, 06Fh, 06Fh, 030h, 00Fh, 0F9h, 0D9h, 00Fh, 0FDh, 05Fh
    db 060h, 00Fh, 07Fh, 0ECh, 00Fh, 0FDh, 0E3h, 00Fh, 0FDh, 0E4h, 00Fh, 0F9h, 067h, 060h, 00Fh, 0FDh
    db 067h, 070h, 00Fh, 071h, 0E4h, 004h, 00Fh, 0F9h, 0E5h, 00Fh, 0DBh, 0E7h, 00Fh, 0FDh, 0E5h, 00Fh
    db 07Fh, 066h, 020h, 00Fh, 06Fh, 06Fh, 040h, 00Fh, 0F9h, 0D9h, 00Fh, 0FDh, 05Fh, 070h, 00Fh, 07Fh
    db 0ECh, 00Fh, 0FDh, 0E3h, 00Fh, 0FDh, 0E4h, 00Fh, 0FDh, 0E1h, 00Fh, 0F9h, 067h, 010h, 00Fh, 0F9h
    db 067h, 070h, 00Fh, 0FDh, 0A7h, 080h, 000h, 000h, 000h, 00Fh, 06Fh, 0ADh, 040h, 0FFh, 0FFh, 0FFh
    db 00Fh, 071h, 0E4h, 004h, 00Fh, 0F9h, 0E5h, 00Fh, 0DBh, 0E7h, 00Fh, 0FDh, 0E5h, 00Fh, 07Fh, 066h
    db 030h, 00Fh, 06Fh, 06Fh, 050h, 00Fh, 0F9h, 05Fh, 010h, 00Fh, 0FDh, 09Fh, 080h, 000h, 000h, 000h
    db 00Fh, 07Fh, 0ECh, 00Fh, 0FDh, 0E3h, 00Fh, 0FDh, 0E4h, 00Fh, 0FDh, 067h, 010h, 00Fh, 0F9h, 067h
    db 020h, 00Fh, 0F9h, 0A7h, 080h, 000h, 000h, 000h, 00Fh, 0FDh, 0E2h, 00Fh, 06Fh, 0ADh, 030h, 0FFh
    db 0FFh, 0FFh, 00Fh, 071h, 0E4h, 004h, 00Fh, 0F9h, 0E5h, 00Fh, 0DBh, 0E7h, 00Fh, 0FDh, 0E5h, 00Fh
    db 07Fh, 066h, 040h, 00Fh, 06Fh, 06Fh, 060h, 00Fh, 0F9h, 05Fh, 020h, 00Fh, 0FDh, 0DAh, 00Fh, 07Fh
    db 0ECh, 00Fh, 0FDh, 0E3h, 00Fh, 0FDh, 0E4h, 00Fh, 0FDh, 067h, 020h, 00Fh, 0F9h, 067h, 030h, 00Fh
    db 071h, 0E4h, 004h, 00Fh, 0F9h, 0E5h, 00Fh, 0DBh, 0E7h, 00Fh, 0FDh, 0E5h, 00Fh, 07Fh, 066h, 050h
    db 00Fh, 06Fh, 06Fh, 070h, 00Fh, 0F9h, 05Fh, 030h, 00Fh, 0FDh, 0DAh, 00Fh, 07Fh, 0ECh, 00Fh, 0FDh
    db 0E3h, 00Fh, 0FDh, 0E4h, 00Fh, 0FDh, 067h, 030h, 00Fh, 0F9h, 067h, 040h, 00Fh, 071h, 0E4h, 004h
    db 00Fh, 0F9h, 0E5h, 00Fh, 0DBh, 0E7h, 00Fh, 0FDh, 0E5h, 00Fh, 07Fh, 066h, 060h, 00Fh, 06Fh, 0AFh
    db 080h, 000h, 000h, 000h, 00Fh, 0F9h, 05Fh, 040h, 00Fh, 0FDh, 0DAh, 00Fh, 07Fh, 0ECh, 00Fh, 0FDh
    db 0E3h, 00Fh, 0FDh, 0E4h, 00Fh, 0FDh, 067h, 040h, 00Fh, 0F9h, 067h, 050h, 00Fh, 071h, 0E4h, 004h
    db 00Fh, 0F9h, 0E5h, 00Fh, 0DBh, 0E7h, 00Fh, 0FDh, 0E5h, 00Fh, 07Fh, 066h, 070h, 083h, 0C7h, 008h
    db 083h, 0C6h, 008h, 00Fh, 06Fh, 04Dh, 080h, 00Fh, 06Fh, 05Fh, 030h, 00Fh, 06Fh, 067h, 040h, 00Fh
    db 06Fh, 06Fh, 050h, 00Fh, 06Fh, 077h, 060h, 00Fh, 0F9h, 0ECh, 00Fh, 0F9h, 0DEh, 00Fh, 07Fh, 0ECh
    db 00Fh, 0FDh, 0E5h, 00Fh, 0FDh, 01Dh
    dd g_Va012D86D0
    db 00Fh, 0FDh, 0ECh, 00Fh, 0FDh, 0DDh, 00Fh, 071h, 0E3h, 003h, 00Fh, 07Fh, 0DAh, 00Fh, 071h, 0E3h
    db 00Fh, 00Fh, 0EFh, 0D3h, 00Fh, 0E9h, 0D3h, 00Fh, 0EBh, 01Dh
    dd g_Va012D86E0
    db 00Fh, 07Fh, 0CCh, 00Fh, 0F9h, 0CAh, 00Fh, 07Fh, 0CDh, 00Fh, 071h, 0E1h, 00Fh, 00Fh, 0EFh, 0E9h
    db 00Fh, 0E9h, 0E9h, 00Fh, 0D9h, 0E5h, 00Fh, 0D5h, 0E3h, 00Fh, 06Fh, 04Fh, 040h, 00Fh, 06Fh, 057h
    db 050h, 00Fh, 0FDh, 0CCh, 00Fh, 0F9h, 0D4h, 00Fh, 0EFh, 0F6h, 00Fh, 067h, 0C9h, 00Fh, 067h, 0D2h
    db 00Fh, 060h, 0CEh, 00Fh, 07Fh, 08Dh, 040h, 0FFh, 0FFh, 0FFh, 00Fh, 060h, 0D6h, 00Fh, 07Fh, 095h
    db 030h, 0FFh, 0FFh, 0FFh, 00Fh, 06Fh, 02Fh, 00Fh, 06Fh, 067h, 010h, 00Fh, 07Fh, 0E3h, 00Fh, 07Fh
    db 0EEh, 00Fh, 0D9h, 0E6h, 00Fh, 0D9h, 0EBh, 00Fh, 0EBh, 0E5h, 00Fh, 0F9h, 0A5h, 050h, 0FFh, 0FFh
    db 0FFh, 00Fh, 071h, 0E4h, 00Fh, 00Fh, 07Fh, 0E1h, 00Fh, 0DBh, 0E6h, 00Fh, 0DFh, 0CBh, 00Fh, 0EBh
    db 0CCh, 00Fh, 06Fh, 0A7h, 080h, 000h, 000h, 000h, 00Fh, 06Fh, 0AFh, 090h, 000h, 000h, 000h, 00Fh
    db 07Fh, 0E3h, 00Fh, 07Fh, 0EEh, 00Fh, 0D9h, 0E6h, 00Fh, 0D9h, 0EBh, 00Fh, 0EBh, 0E5h, 00Fh, 0F9h
    db 0A5h, 050h, 0FFh, 0FFh, 0FFh, 00Fh, 071h, 0E4h, 00Fh, 00Fh, 07Fh, 0E2h, 00Fh, 0DBh, 0E6h, 00Fh
    db 0DFh, 0D3h, 00Fh, 0EBh, 0D4h, 00Fh, 07Fh, 0CBh, 00Fh, 0FDh, 0DBh, 00Fh, 0FDh, 0D9h, 00Fh, 06Fh
    db 067h, 010h, 00Fh, 0FDh, 05Fh, 020h, 00Fh, 0FDh, 067h, 030h, 00Fh, 0FDh, 05Fh, 040h, 00Fh, 0FDh
    db 025h
    dd g_Va012D86D0
    db 00Fh, 0FDh, 0DCh, 00Fh, 07Fh, 0DCh, 00Fh, 06Fh, 06Fh, 010h, 00Fh, 0FDh, 0E5h, 00Fh, 071h, 0F4h
    db 001h, 00Fh, 0F9h, 067h, 040h, 00Fh, 0FDh, 067h, 050h, 00Fh, 071h, 0E4h, 004h, 00Fh, 0F9h, 0E5h
    db 00Fh, 0DBh, 0E0h, 00Fh, 0FDh, 0E5h, 00Fh, 07Fh, 026h, 00Fh, 06Fh, 06Fh, 020h, 00Fh, 0F9h, 0D9h
    db 00Fh, 0FDh, 05Fh, 050h, 00Fh, 07Fh, 0ECh, 00Fh, 0FDh, 0E3h, 00Fh, 0FDh, 0E4h, 00Fh, 0F9h, 067h
    db 050h, 00Fh, 0FDh, 067h, 060h, 00Fh, 071h, 0E4h, 004h, 00Fh, 0F9h, 0E5h, 00Fh, 0DBh, 0E0h, 00Fh
    db 0FDh, 0E5h, 00Fh, 07Fh, 066h, 010h, 00Fh, 06Fh, 06Fh, 030h, 00Fh, 0F9h, 0D9h, 00Fh, 0FDh, 05Fh
    db 060h, 00Fh, 07Fh, 0ECh, 00Fh, 0FDh, 0E3h, 00Fh, 0FDh, 0E4h, 00Fh, 0F9h, 067h, 060h, 00Fh, 0FDh
    db 067h, 070h, 00Fh, 071h, 0E4h, 004h, 00Fh, 0F9h, 0E5h, 00Fh, 0DBh, 0E0h, 00Fh, 0FDh, 0E5h, 00Fh
    db 07Fh, 066h, 020h, 00Fh, 06Fh, 06Fh, 040h, 00Fh, 0F9h, 0D9h, 00Fh, 0FDh, 05Fh, 070h, 00Fh, 07Fh
    db 0ECh, 00Fh, 0FDh, 0E3h, 00Fh, 0FDh, 0E4h, 00Fh, 0FDh, 0E1h, 00Fh, 0F9h, 067h, 010h, 00Fh, 0F9h
    db 067h, 070h, 00Fh, 0FDh, 0A7h, 080h, 000h, 000h, 000h, 00Fh, 06Fh, 0ADh, 040h, 0FFh, 0FFh, 0FFh
    db 00Fh, 071h, 0E4h, 004h, 00Fh, 0F9h, 0E5h, 00Fh, 0DBh, 0E0h, 00Fh, 0FDh, 0E5h, 00Fh, 07Fh, 066h
    db 030h, 00Fh, 06Fh, 06Fh, 050h, 00Fh, 0F9h, 05Fh, 010h, 00Fh, 0FDh, 09Fh, 080h, 000h, 000h, 000h
    db 00Fh, 07Fh, 0ECh, 00Fh, 0FDh, 0E3h, 00Fh, 0FDh, 0E4h, 00Fh, 0FDh, 067h, 010h, 00Fh, 0F9h, 067h
    db 020h, 00Fh, 0F9h, 0A7h, 080h, 000h, 000h, 000h, 00Fh, 0FDh, 0E2h, 00Fh, 06Fh, 0ADh, 030h, 0FFh
    db 0FFh, 0FFh, 00Fh, 071h, 0E4h, 004h, 00Fh, 0F9h, 0E5h, 00Fh, 0DBh, 0E0h, 00Fh, 0FDh, 0E5h, 00Fh
    db 07Fh, 066h, 040h, 00Fh, 06Fh, 06Fh, 060h, 00Fh, 0F9h, 05Fh, 020h, 00Fh, 0FDh, 0DAh, 00Fh, 07Fh
    db 0ECh, 00Fh, 0FDh, 0E3h, 00Fh, 0FDh, 0E4h, 00Fh, 0FDh, 067h, 020h, 00Fh, 0F9h, 067h, 030h, 00Fh
    db 071h, 0E4h, 004h, 00Fh, 0F9h, 0E5h, 00Fh, 0DBh, 0E0h, 00Fh, 0FDh, 0E5h, 00Fh, 07Fh, 066h, 050h
    db 00Fh, 06Fh, 06Fh, 070h, 00Fh, 0F9h, 05Fh, 030h, 00Fh, 0FDh, 0DAh, 00Fh, 07Fh, 0ECh, 00Fh, 0FDh
    db 0E3h, 00Fh, 0FDh, 0E4h, 00Fh, 0FDh, 067h, 030h, 00Fh, 0F9h, 067h, 040h, 00Fh, 071h, 0E4h, 004h
    db 00Fh, 0F9h, 0E5h, 00Fh, 0DBh, 0E0h, 00Fh, 0FDh, 0E5h, 00Fh, 07Fh, 066h, 060h, 00Fh, 06Fh, 0AFh
    db 080h, 000h, 000h, 000h, 00Fh, 0F9h, 05Fh, 040h, 00Fh, 0FDh, 0DAh, 00Fh, 07Fh, 0ECh, 00Fh, 0FDh
    db 0E3h, 00Fh, 0FDh, 0E4h, 00Fh, 0FDh, 067h, 040h, 00Fh, 0F9h, 067h, 050h, 00Fh, 071h, 0E4h, 004h
    db 00Fh, 0F9h, 0E5h, 00Fh, 0DBh, 0E0h, 00Fh, 0FDh, 0E5h, 00Fh, 07Fh, 066h, 070h, 08Bh, 045h, 098h
    db 083h, 0C7h, 008h, 083h, 0EEh, 008h, 083h, 0E8h, 004h, 00Fh, 06Fh, 006h, 00Fh, 06Fh, 04Eh, 010h
    db 00Fh, 07Fh, 0C4h, 00Fh, 061h, 0C1h, 00Fh, 069h, 0E1h, 00Fh, 06Fh, 056h, 020h, 00Fh, 06Fh, 05Eh
    db 030h, 00Fh, 07Fh, 0D5h, 00Fh, 061h, 0D3h, 00Fh, 069h, 0EBh, 00Fh, 07Fh, 0C1h, 00Fh, 062h, 0C2h
    db 00Fh, 07Fh, 007h, 00Fh, 06Ah, 0CAh, 00Fh, 07Fh, 0E0h, 00Fh, 07Fh, 04Fh, 010h, 00Fh, 062h, 0C5h
    db 00Fh, 06Ah, 0E5h, 00Fh, 06Fh, 04Eh, 040h, 00Fh, 06Fh, 056h, 050h, 00Fh, 06Fh, 06Eh, 060h, 00Fh
    db 06Fh, 076h, 070h, 00Fh, 07Fh, 0CBh, 00Fh, 07Fh, 0EFh, 00Fh, 061h, 0CAh, 00Fh, 069h, 0DAh, 00Fh
    db 061h, 0EEh, 00Fh, 069h, 0FEh, 00Fh, 07Fh, 0CAh, 00Fh, 07Fh, 0DEh, 00Fh, 062h, 0CDh, 00Fh, 06Ah
    db 0D5h, 00Fh, 062h, 0DFh, 00Fh, 06Ah, 0F7h, 00Fh, 06Fh, 02Fh, 00Fh, 067h, 0E9h, 00Fh, 07Fh, 028h
    db 00Fh, 06Fh, 07Fh, 010h, 00Fh, 067h, 0FAh, 00Fh, 07Fh, 03Ch, 008h, 00Fh, 067h, 0C3h, 00Fh, 067h
    db 0E6h, 00Fh, 07Fh, 004h, 048h, 08Dh, 004h, 088h, 00Fh, 07Fh, 024h, 010h, 083h, 0C7h, 008h, 083h
    db 0C6h, 008h, 00Fh, 06Fh, 006h, 00Fh, 06Fh, 04Eh, 010h, 00Fh, 07Fh, 0C4h, 00Fh, 061h, 0C1h, 00Fh
    db 069h, 0E1h, 00Fh, 06Fh, 056h, 020h, 00Fh, 06Fh, 05Eh, 030h, 00Fh, 07Fh, 0D5h, 00Fh, 061h, 0D3h
    db 00Fh, 069h, 0EBh, 00Fh, 07Fh, 0C1h, 00Fh, 062h, 0C2h, 00Fh, 07Fh, 007h, 00Fh, 06Ah, 0CAh, 00Fh
    db 07Fh, 0E0h, 00Fh, 07Fh, 04Fh, 010h, 00Fh, 062h, 0C5h, 00Fh, 06Ah, 0E5h, 00Fh, 06Fh, 04Eh, 040h
    db 00Fh, 06Fh, 056h, 050h, 00Fh, 06Fh, 06Eh, 060h, 00Fh, 06Fh, 076h, 070h, 00Fh, 07Fh, 0CBh, 00Fh
    db 07Fh, 0EFh, 00Fh, 061h, 0CAh, 00Fh, 069h, 0DAh, 00Fh, 061h, 0EEh, 00Fh, 069h, 0FEh, 00Fh, 07Fh
    db 0CAh, 00Fh, 07Fh, 0DEh, 00Fh, 062h, 0CDh, 00Fh, 06Ah, 0D5h, 00Fh, 062h, 0DFh, 00Fh, 06Ah, 0F7h
    db 00Fh, 06Fh, 02Fh, 00Fh, 067h, 0E9h, 00Fh, 07Fh, 028h, 00Fh, 06Fh, 07Fh, 010h, 00Fh, 067h, 0FAh
    db 00Fh, 07Fh, 03Ch, 008h, 00Fh, 067h, 0C3h, 00Fh, 067h, 0E6h, 00Fh, 07Fh, 004h, 048h, 08Dh, 004h
    db 088h, 00Fh, 07Fh, 024h, 010h, 05Fh, 05Eh, 05Ah, 059h, 05Dh, 058h, 00Fh, 0B7h, 07Dh, 0D4h, 00Fh
    db 0B7h, 075h, 0D6h, 003h, 0F7h, 00Fh, 0B7h, 07Dh, 0D2h, 003h, 0F7h, 00Fh, 0B7h, 07Dh, 0D0h, 08Bh
    db 053h, 008h, 08Bh, 04Ah, 028h, 08Bh, 045h, 0ECh, 003h, 0F7h, 00Fh, 0B7h, 07Dh, 0B6h, 003h, 0F7h
    db 00Fh, 0B7h, 07Dh, 0B4h, 003h, 0F7h, 00Fh, 0B7h, 07Dh, 0B2h, 003h, 0F7h, 00Fh, 0B7h, 07Dh, 0B0h
    db 003h, 0F7h, 08Bh, 07Ch, 081h, 0FCh, 08Dh, 04Ch, 081h, 0FCh, 003h, 0FEh, 00Fh, 0B7h, 075h, 0A4h
    db 089h, 039h, 08Bh, 052h, 028h, 08Dh, 00Ch, 082h, 00Fh, 0B7h, 055h, 0A6h, 003h, 0D6h, 00Fh, 0B7h
    db 075h, 0A2h, 003h, 0D6h, 00Fh, 0B7h, 075h, 0A0h, 003h, 0D6h, 00Fh, 0B7h, 075h, 0C6h, 003h, 0D6h
    db 00Fh, 0B7h, 075h, 0C4h, 003h, 0D6h, 00Fh, 0B7h, 075h, 0C2h, 003h, 0D6h, 00Fh, 0B7h, 075h, 0C0h
    db 003h, 0D6h, 08Bh, 031h, 003h, 0F2h, 08Bh, 055h, 0F8h, 089h, 031h, 08Bh, 075h, 0F0h, 08Bh, 04Dh
    db 0F4h, 040h, 089h, 045h, 0ECh, 0B8h, 008h, 000h, 000h, 000h, 003h, 0F0h, 003h, 0D0h, 003h, 0C8h
    db 089h, 04Dh, 0F4h, 08Bh, 04Dh, 0ECh, 089h, 075h, 0F0h, 089h, 055h, 0F8h, 083h, 045h, 0FCh, 004h
    db 03Bh, 08Dh, 06Ch, 0FFh, 0FFh, 0FFh, 00Fh, 082h, 0BCh, 0EAh, 0FFh, 0FFh, 05Fh, 05Eh, 08Bh, 0E5h
    db 05Dh, 08Bh, 0E3h, 05Bh, 0C3h
?Rva009B8130@@YAXXZ ENDP
_TEXT ENDS
END
