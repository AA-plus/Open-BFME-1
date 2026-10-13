.386
.model flat
; ?rva006B24D0@MilesAudioManager@@QAEXABVAsciiString@@MH@Z
; Retail @ 0x006B24D0 size 1772
;
; MASM dump carrying a measured VC7.1 codegen blocker. Identity stays
; address-derived: three matched callers (Rva006B4310Owner::update006B4310,
; Rva006B43E0Owner::update006B43E0, Rva006B44A0Owner::clear006B44A0) reach the
; body through ILT 0x00023D21 passing (const AsciiString&, float, int), and
; the EA source file for the owner is MilesAudioManager.cpp, but no pin names
; the member. ABI: __thiscall, `ret 0xC` at +0x6E9; INT3 padding starts at
; +0x6EC, confirming the 1,772-byte extent. The body walks two per-category
; queues and a per-category event vector of refcounted audio handles, queries
; stream volume/pan and re-sets sample volumes; Zero Hour's adjustVolumeOfPlayingAudio
; is the nearest relative but this body takes a category and walks queues.
;
; The reconstructible C++ body (targets/game/reverse/attempts/0x006b24d0.cpp,
; bank score 0.9977) compiles to exactly 1,772 bytes with 50 relocations; its
; whole residue is four non-relocation register bytes at +0x428 +0x42D +0x431
; +0x438: in the stream-pan call setup retail loads the sample handle into EDX
; and materializes the pan temporary address in ECX, while VC7.1 emits the
; mirror (handle EAX, address EDX). Invariant across const/reference handle
; declarations, a second-call local, direct member expressions, the register
; family generator (no applicable source lever), and prior 54-toggle and
; 1,439-pair sweeps (206 verdicts for this RVA). The dump body is
; byte-identical to retail outside its relocation slots.
; Evidence: targets/game/reverse/identity_evidence/006b24d0-masm-codegen-blocker.md

EXTERN ?BfmeBoundaryZero3D@@3MB:BYTE
EXTERN ?BfmeSubdualCapERD@@3MB:BYTE
EXTERN ?Rva006A16B0Empty@@3PADA:BYTE
EXTERN ?j_00001eb5@@YAXXZ:NEAR
EXTERN ?j_000220c5@@YAXXZ:NEAR
EXTERN ?j_0002918b@@YAXXZ:NEAR
EXTERN __imp__AIL_set_3D_sample_volume@8:BYTE
EXTERN __imp__InterlockedDecrement@4:BYTE
EXTERN __imp__InterlockedIncrement@4:BYTE
EXTERN __imp___AIL_set_sample_volume_pan@12:BYTE
EXTERN g_Va01048DB8:NEAR
EXTERN g_Va01359624:BYTE
EXTERN g_Va013596A0:BYTE
EXTERN g_Va013596D4:BYTE
_TEXT SEGMENT
public ?rva006B24D0@MilesAudioManager@@QAEXABVAsciiString@@MH@Z
?rva006B24D0@MilesAudioManager@@QAEXABVAsciiString@@MH@Z PROC
    db 06Ah, 0FFh, 068h
    dd g_Va01048DB8
    db 064h, 0A1h, 000h, 000h, 000h, 000h, 050h, 064h, 089h, 025h, 000h, 000h, 000h, 000h, 083h, 0ECh
    db 034h, 053h, 055h, 056h, 08Bh, 0E9h, 033h, 0DBh, 057h, 089h, 06Ch, 024h, 014h, 089h, 05Ch, 024h
    db 010h, 08Bh, 085h, 0C8h, 009h, 000h, 000h, 08Bh, 038h, 03Bh, 0F8h, 089h, 05Ch, 024h, 04Ch, 00Fh
    db 084h, 012h, 001h, 000h, 000h, 08Dh, 064h, 024h, 000h, 08Dh, 077h, 008h, 08Dh, 044h, 024h, 010h
    db 03Bh, 0C6h, 074h, 030h, 08Bh, 006h, 085h, 0C0h, 074h, 00Ah, 083h, 0C0h, 004h, 050h, 0FFh, 015h
    dd __imp__InterlockedIncrement@4
    db 085h, 0DBh, 074h, 016h, 08Dh, 04Bh, 004h, 051h, 0FFh, 015h
    dd __imp__InterlockedDecrement@4
    db 085h, 0C0h, 07Fh, 008h, 08Bh, 013h, 06Ah, 001h, 08Bh, 0CBh, 0FFh, 012h, 08Bh, 01Eh, 089h, 05Ch
    db 024h, 010h, 085h, 0DBh, 00Fh, 084h, 0BDh, 000h, 000h, 000h, 08Bh, 044h, 024h, 054h, 08Bh, 000h
    db 085h, 0C0h, 074h, 026h, 066h, 083h, 078h, 004h, 000h, 074h, 01Fh, 08Bh, 043h, 014h, 08Bh, 048h
    db 008h, 08Bh, 011h, 0FFh, 052h, 004h, 08Bh, 04Ch, 024h, 054h, 051h, 08Bh, 0C8h
    call ?j_000220c5@@YAXXZ
    db 085h, 0C0h, 00Fh, 085h, 08Dh, 000h, 000h, 000h, 08Bh, 043h, 014h, 08Bh, 050h, 028h, 03Bh, 054h
    db 024h, 05Ch, 00Fh, 085h, 07Dh, 000h, 000h, 000h, 050h, 08Bh, 0CDh
    call ?j_00001eb5@@YAXXZ
    db 08Bh, 043h, 014h, 06Ah, 001h, 050h, 08Bh, 0CDh
    call ?j_0002918b@@YAXXZ
    db 08Bh, 045h, 00Ch, 0DBh, 040h, 03Ch, 0D8h, 07Bh, 028h, 0D8h, 02Dh
    dd ?BfmeSubdualCapERD@@3MB
    db 0D8h, 015h
    dd ?BfmeBoundaryZero3D@@3MB
    db 0DFh, 0E0h, 0F6h, 0C4h, 005h, 07Ah, 00Ah, 0DDh, 0D8h, 0D9h, 005h
    dd ?BfmeBoundaryZero3D@@3MB
    db 0EBh, 015h, 0D8h, 015h
    dd ?BfmeSubdualCapERD@@3MB
    db 0DFh, 0E0h, 0F6h, 0C4h, 041h, 075h, 008h, 0DDh, 0D8h, 0D9h, 005h
    dd ?BfmeSubdualCapERD@@3MB
    db 08Bh, 053h, 008h, 0D8h, 0C9h, 08Dh, 04Ch, 024h, 01Ch, 051h, 06Ah, 000h, 0D9h, 05Ch, 024h, 028h
    db 052h, 0DDh, 0D8h, 0FFh, 015h
    dd g_Va01359624
    db 08Bh, 044h, 024h, 01Ch, 08Bh, 04Ch, 024h, 020h, 08Bh, 053h, 008h, 050h, 051h, 052h, 0FFh, 015h
    dd __imp___AIL_set_sample_volume_pan@12
    db 08Bh, 03Fh, 03Bh, 0BDh, 0C8h, 009h, 000h, 000h, 00Fh, 085h, 0F2h, 0FEh, 0FFh, 0FFh, 08Bh, 085h
    db 0CCh, 009h, 000h, 000h, 08Bh, 038h, 03Bh, 0F8h, 089h, 07Ch, 024h, 018h, 00Fh, 084h, 07Ch, 001h
    db 000h, 000h, 08Dh, 077h, 008h, 08Dh, 044h, 024h, 010h, 03Bh, 0C6h, 074h, 030h, 08Bh, 006h, 085h
    db 0C0h, 074h, 00Ah, 083h, 0C0h, 004h, 050h, 0FFh, 015h
    dd __imp__InterlockedIncrement@4
    db 085h, 0DBh, 074h, 016h, 08Dh, 04Bh, 004h, 051h, 0FFh, 015h
    dd __imp__InterlockedDecrement@4
    db 085h, 0C0h, 07Fh, 008h, 08Bh, 013h, 06Ah, 001h, 08Bh, 0CBh, 0FFh, 012h, 08Bh, 01Eh, 089h, 05Ch
    db 024h, 010h, 085h, 0DBh, 00Fh, 084h, 027h, 001h, 000h, 000h, 08Bh, 044h, 024h, 054h, 08Bh, 000h
    db 085h, 0C0h, 074h, 079h, 066h, 083h, 078h, 004h, 000h, 074h, 072h, 08Bh, 043h, 014h, 08Bh, 048h
    db 008h, 08Bh, 011h, 0FFh, 052h, 004h, 08Bh, 04Ch, 024h, 054h, 08Bh, 009h, 085h, 0C9h, 074h, 006h
    db 00Fh, 0B7h, 069h, 004h, 0EBh, 002h, 033h, 0EDh, 085h, 0C9h, 08Dh, 079h, 008h, 075h, 005h, 0BFh
    dd ?Rva006A16B0Empty@@3PADA
    db 08Bh, 000h, 085h, 0C0h, 074h, 006h, 00Fh, 0B7h, 050h, 004h, 0EBh, 002h, 033h, 0D2h, 085h, 0C0h
    db 08Dh, 070h, 008h, 075h, 005h, 0BEh
    dd ?Rva006A16B0Empty@@3PADA
    db 03Bh, 0D5h, 08Bh, 0CAh, 07Ch, 002h, 08Bh, 0CDh, 033h, 0C0h, 0F3h, 0A6h, 074h, 005h, 01Bh, 0C0h
    db 083h, 0D8h, 0FFh, 085h, 0C0h, 00Fh, 085h, 0B0h, 000h, 000h, 000h, 02Bh, 0D5h, 08Bh, 0C2h, 085h
    db 0C0h, 00Fh, 085h, 0A4h, 000h, 000h, 000h, 08Bh, 07Ch, 024h, 018h, 08Bh, 06Ch, 024h, 014h, 08Bh
    db 04Bh, 014h, 08Bh, 054h, 024h, 05Ch, 039h, 051h, 028h, 00Fh, 085h, 094h, 000h, 000h, 000h, 08Bh
    db 043h, 00Ch, 048h, 074h, 019h, 048h, 00Fh, 085h, 087h, 000h, 000h, 000h, 08Bh, 043h, 008h, 08Bh
    db 095h, 044h, 00Bh, 000h, 000h, 0C1h, 0E0h, 006h, 08Bh, 074h, 010h, 004h, 0EBh, 003h, 08Bh, 073h
    db 008h, 085h, 0F6h, 074h, 06Eh, 051h, 08Bh, 0CDh
    call ?j_00001eb5@@YAXXZ
    db 08Bh, 043h, 014h, 06Ah, 001h, 050h, 08Bh, 0CDh
    call ?j_0002918b@@YAXXZ
    db 08Bh, 045h, 00Ch, 0DBh, 040h, 03Ch, 0D8h, 07Bh, 028h, 0D8h, 02Dh
    dd ?BfmeSubdualCapERD@@3MB
    db 0D8h, 015h
    dd ?BfmeBoundaryZero3D@@3MB
    db 0DFh, 0E0h, 0F6h, 0C4h, 005h, 07Ah, 00Ah, 0DDh, 0D8h, 0D9h, 005h
    dd ?BfmeBoundaryZero3D@@3MB
    db 0EBh, 015h, 0D8h, 015h
    dd ?BfmeSubdualCapERD@@3MB
    db 0DFh, 0E0h, 0F6h, 0C4h, 041h, 075h, 008h, 0DDh, 0D8h, 0D9h, 005h
    dd ?BfmeSubdualCapERD@@3MB
    db 0D8h, 0C9h, 0D9h, 05Ch, 024h, 020h, 08Bh, 04Ch, 024h, 020h, 051h, 0DDh, 0D8h, 056h, 0FFh, 015h
    dd __imp__AIL_set_3D_sample_volume@8
    db 0EBh, 008h, 08Bh, 07Ch, 024h, 018h, 08Bh, 06Ch, 024h, 014h, 08Bh, 03Fh, 03Bh, 0BDh, 0CCh, 009h
    db 000h, 000h, 089h, 07Ch, 024h, 018h, 00Fh, 085h, 084h, 0FEh, 0FFh, 0FFh, 08Bh, 085h, 0D0h, 009h
    db 000h, 000h, 08Bh, 038h, 03Bh, 0F8h, 089h, 07Ch, 024h, 018h, 00Fh, 084h, 07Fh, 001h, 000h, 000h
    db 08Dh, 077h, 008h, 08Dh, 054h, 024h, 010h, 03Bh, 0D6h, 074h, 030h, 08Bh, 006h, 085h, 0C0h, 074h
    db 00Ah, 083h, 0C0h, 004h, 050h, 0FFh, 015h
    dd __imp__InterlockedIncrement@4
    db 085h, 0DBh, 074h, 016h, 08Dh, 043h, 004h, 050h, 0FFh, 015h
    dd __imp__InterlockedDecrement@4
    db 085h, 0C0h, 07Fh, 008h, 08Bh, 013h, 06Ah, 001h, 08Bh, 0CBh, 0FFh, 012h, 08Bh, 01Eh, 089h, 05Ch
    db 024h, 010h, 085h, 0DBh, 00Fh, 084h, 026h, 001h, 000h, 000h, 08Bh, 044h, 024h, 054h, 08Bh, 000h
    db 085h, 0C0h, 074h, 075h, 066h, 083h, 078h, 004h, 000h, 074h, 06Eh, 08Bh, 043h, 014h, 08Bh, 048h
    db 008h, 08Bh, 011h, 0FFh, 052h, 004h, 08Bh, 04Ch, 024h, 054h, 08Bh, 009h, 085h, 0C9h, 074h, 006h
    db 00Fh, 0B7h, 069h, 004h, 0EBh, 002h, 033h, 0EDh, 085h, 0C9h, 08Dh, 079h, 008h, 075h, 005h, 0BFh
    dd ?Rva006A16B0Empty@@3PADA
    db 08Bh, 000h, 085h, 0C0h, 074h, 006h, 00Fh, 0B7h, 050h, 004h, 0EBh, 002h, 033h, 0D2h, 085h, 0C0h
    db 08Dh, 070h, 008h, 075h, 005h, 0BEh
    dd ?Rva006A16B0Empty@@3PADA
    db 03Bh, 0D5h, 08Bh, 0CAh, 07Ch, 002h, 08Bh, 0CDh, 033h, 0C0h, 0F3h, 0A6h, 074h, 005h, 01Bh, 0C0h
    db 083h, 0D8h, 0FFh, 085h, 0C0h, 00Fh, 085h, 0B3h, 000h, 000h, 000h, 02Bh, 0D5h, 08Bh, 0C2h, 085h
    db 0C0h, 00Fh, 085h, 0A7h, 000h, 000h, 000h, 08Bh, 07Ch, 024h, 018h, 08Bh, 043h, 014h, 08Bh, 054h
    db 024h, 05Ch, 039h, 050h, 028h, 00Fh, 085h, 097h, 000h, 000h, 000h, 08Bh, 048h, 008h, 083h, 0B9h
    db 084h, 000h, 000h, 000h, 003h, 00Fh, 084h, 087h, 000h, 000h, 000h, 08Bh, 074h, 024h, 014h, 050h
    db 08Bh, 0CEh
    call ?j_00001eb5@@YAXXZ
    db 08Bh, 043h, 014h, 06Ah, 001h, 050h, 08Bh, 0CEh
    call ?j_0002918b@@YAXXZ
    db 08Bh, 046h, 00Ch, 0DBh, 040h, 03Ch, 0D8h, 07Bh, 028h, 0D8h, 02Dh
    dd ?BfmeSubdualCapERD@@3MB
    db 0D8h, 015h
    dd ?BfmeBoundaryZero3D@@3MB
    db 0DFh, 0E0h, 0F6h, 0C4h, 005h, 07Ah, 00Ah, 0DDh, 0D8h, 0D9h, 005h
    dd ?BfmeBoundaryZero3D@@3MB
    db 0EBh, 015h, 0D8h, 015h
    dd ?BfmeSubdualCapERD@@3MB
    db 0DFh, 0E0h, 0F6h, 0C4h, 041h, 075h, 008h, 0DDh, 0D8h, 0D9h, 005h
    dd ?BfmeSubdualCapERD@@3MB
    db 08Bh, 053h, 008h, 0D8h, 0C9h, 08Dh, 04Ch, 024h, 01Ch, 051h, 06Ah, 000h, 0D9h, 05Ch, 024h, 028h
    db 052h, 0DDh, 0D8h, 0FFh, 015h
    dd g_Va013596D4
    db 08Bh, 044h, 024h, 01Ch, 08Bh, 04Ch, 024h, 020h, 08Bh, 053h, 008h, 050h, 051h, 052h, 0FFh, 015h
    dd g_Va013596A0
    db 0EBh, 004h, 08Bh, 07Ch, 024h, 018h, 08Bh, 044h, 024h, 014h, 08Bh, 03Fh, 03Bh, 0B8h, 0D0h, 009h
    db 000h, 000h, 089h, 07Ch, 024h, 018h, 00Fh, 085h, 081h, 0FEh, 0FFh, 0FFh, 08Bh, 054h, 024h, 05Ch
    db 08Bh, 044h, 024h, 014h, 08Dh, 00Ch, 092h, 0C1h, 0E1h, 004h, 08Dh, 084h, 001h, 0D4h, 009h, 000h
    db 000h, 089h, 044h, 024h, 018h, 0C7h, 044h, 024h, 020h, 002h, 000h, 000h, 000h, 08Bh, 0C8h, 08Bh
    db 031h, 08Bh, 079h, 004h, 089h, 07Ch, 024h, 028h, 08Bh, 079h, 008h, 08Bh, 049h, 00Ch, 089h, 07Ch
    db 024h, 02Ch, 089h, 04Ch, 024h, 030h, 08Dh, 048h, 010h, 08Bh, 0F9h, 08Bh, 00Fh, 03Bh, 0F1h, 08Bh
    db 06Fh, 004h, 089h, 06Ch, 024h, 038h, 08Bh, 06Fh, 008h, 08Bh, 07Fh, 00Ch, 089h, 074h, 024h, 024h
    db 089h, 04Ch, 024h, 034h, 089h, 06Ch, 024h, 03Ch, 089h, 07Ch, 024h, 040h, 00Fh, 084h, 00Dh, 001h
    db 000h, 000h, 08Dh, 054h, 024h, 010h, 03Bh, 0D6h, 074h, 030h, 08Bh, 006h, 085h, 0C0h, 074h, 00Ah
    db 083h, 0C0h, 004h, 050h, 0FFh, 015h
    dd __imp__InterlockedIncrement@4
    db 085h, 0DBh, 074h, 016h, 08Dh, 043h, 004h, 050h, 0FFh, 015h
    dd __imp__InterlockedDecrement@4
    db 085h, 0C0h, 07Fh, 008h, 08Bh, 013h, 06Ah, 001h, 08Bh, 0CBh, 0FFh, 012h, 08Bh, 01Eh, 089h, 05Ch
    db 024h, 010h, 085h, 0DBh, 00Fh, 084h, 08Fh, 000h, 000h, 000h, 08Bh, 07Ch, 024h, 054h, 08Bh, 007h
    db 085h, 0C0h, 074h, 069h, 066h, 083h, 078h, 004h, 000h, 074h, 062h, 08Bh, 043h, 014h, 08Bh, 048h
    db 008h, 08Bh, 001h, 0FFh, 050h, 004h, 08Bh, 00Fh, 085h, 0C9h, 074h, 006h, 00Fh, 0B7h, 069h, 004h
    db 0EBh, 002h, 033h, 0EDh, 085h, 0C9h, 08Dh, 079h, 008h, 075h, 005h, 0BFh
    dd ?Rva006A16B0Empty@@3PADA
    db 08Bh, 000h, 085h, 0C0h, 074h, 006h, 00Fh, 0B7h, 050h, 004h, 0EBh, 002h, 033h, 0D2h, 085h, 0C0h
    db 08Dh, 070h, 008h, 075h, 005h, 0BEh
    dd ?Rva006A16B0Empty@@3PADA
    db 03Bh, 0D5h, 08Bh, 0CAh, 07Ch, 002h, 08Bh, 0CDh, 033h, 0C0h, 0F3h, 0A6h, 074h, 005h, 01Bh, 0C0h
    db 083h, 0D8h, 0FFh, 085h, 0C0h, 075h, 024h, 02Bh, 0D5h, 08Bh, 0C2h, 085h, 0C0h, 075h, 01Ch, 08Bh
    db 074h, 024h, 024h, 08Bh, 043h, 014h, 08Bh, 04Ch, 024h, 05Ch, 039h, 048h, 028h, 075h, 010h, 08Bh
    db 04Ch, 024h, 014h, 050h
    call ?j_00001eb5@@YAXXZ
    db 0EBh, 004h, 08Bh, 074h, 024h, 024h, 08Bh, 044h, 024h, 02Ch, 083h, 0C6h, 004h, 03Bh, 0F0h, 089h
    db 074h, 024h, 024h, 075h, 01Dh, 08Bh, 054h, 024h, 030h, 08Dh, 042h, 004h, 089h, 044h, 024h, 030h
    db 08Bh, 000h, 08Dh, 088h, 080h, 000h, 000h, 000h, 08Bh, 0F0h, 089h, 04Ch, 024h, 02Ch, 089h, 074h
    db 024h, 024h, 03Bh, 074h, 024h, 034h, 00Fh, 085h, 0FBh, 0FEh, 0FFh, 0FFh, 08Bh, 054h, 024h, 05Ch
    db 08Bh, 044h, 024h, 018h, 08Bh, 04Ch, 024h, 020h, 083h, 0C0h, 028h, 049h, 089h, 044h, 024h, 018h
    db 089h, 04Ch, 024h, 020h, 00Fh, 085h, 098h, 0FEh, 0FFh, 0FFh, 08Bh, 044h, 024h, 014h, 08Dh, 014h
    db 052h, 08Bh, 08Ch, 090h, 098h, 000h, 000h, 000h, 08Dh, 004h, 090h, 08Bh, 080h, 094h, 000h, 000h
    db 000h, 03Bh, 0C1h, 089h, 04Ch, 024h, 020h, 089h, 044h, 024h, 05Ch, 00Fh, 084h, 094h, 000h, 000h
    db 000h, 08Bh, 074h, 024h, 054h, 08Bh, 006h, 085h, 0C0h, 074h, 066h, 066h, 083h, 078h, 004h, 000h
    db 074h, 05Fh, 08Bh, 04Ch, 024h, 05Ch, 08Bh, 049h, 008h, 08Bh, 011h, 0FFh, 052h, 004h, 08Bh, 00Eh
    db 085h, 0C9h, 074h, 006h, 00Fh, 0B7h, 069h, 004h, 0EBh, 002h, 033h, 0EDh, 085h, 0C9h, 08Dh, 079h
    db 008h, 075h, 005h, 0BFh
    dd ?Rva006A16B0Empty@@3PADA
    db 08Bh, 000h, 085h, 0C0h, 074h, 006h, 00Fh, 0B7h, 050h, 004h, 0EBh, 002h, 033h, 0D2h, 085h, 0C0h
    db 08Dh, 070h, 008h, 075h, 005h, 0BEh
    dd ?Rva006A16B0Empty@@3PADA
    db 03Bh, 0D5h, 08Bh, 0CAh, 07Ch, 002h, 08Bh, 0CDh, 033h, 0C0h, 0F3h, 0A6h, 074h, 005h, 01Bh, 0C0h
    db 083h, 0D8h, 0FFh, 085h, 0C0h, 075h, 015h, 02Bh, 0D5h, 08Bh, 0C2h, 085h, 0C0h, 075h, 00Dh, 08Bh
    db 043h, 014h, 08Bh, 04Ch, 024h, 014h, 050h
    call ?j_00001eb5@@YAXXZ
    db 08Bh, 044h, 024h, 05Ch, 08Bh, 04Ch, 024h, 020h, 083h, 0C0h, 078h, 03Bh, 0C1h, 089h, 044h, 024h
    db 05Ch, 00Fh, 085h, 06Ch, 0FFh, 0FFh, 0FFh, 085h, 0DBh, 0C7h, 044h, 024h, 04Ch, 0FFh, 0FFh, 0FFh
    db 0FFh, 074h, 016h, 08Dh, 043h, 004h, 050h, 0FFh, 015h
    dd __imp__InterlockedDecrement@4
    db 085h, 0C0h, 07Fh, 008h, 08Bh, 013h, 06Ah, 001h, 08Bh, 0CBh, 0FFh, 012h, 08Bh, 04Ch, 024h, 044h
    db 05Fh, 05Eh, 05Dh, 05Bh, 064h, 089h, 00Dh, 000h, 000h, 000h, 000h, 083h, 0C4h, 040h, 0C2h, 00Ch
    db 000h
?rva006B24D0@MilesAudioManager@@QAEXABVAsciiString@@MH@Z ENDP
_TEXT ENDS
END
