.386
.model flat
; ?forward00769C30@Rva00766AA0Owner@@QAE_NPAURva00766AA0Buffer@@VAsciiString@@PAPAX2@Z
; Retail @ 0x00766AA0 size 3386.
;
; Address-derived identity: the scaffold row ?d_00766aa0@@YAXXZ held this
; address; the two landed callers (0x00769B60 and 0x00769C30 forwarders via
; ILT 0x00012C92) call this same four-argument __thiscall receiver, which is
; why symbols.csv pins this spelling. ABI: ECX receiver, nullable output
; record at arg1, by-value AsciiString arg2 (cleaned by the two
; ?releaseBuffer@?$StringBase@D@@AAEXXZ sites), two pointer outputs arg3/arg4,
; bool in AL, `ret 0x10`. The body selects a named RenderObj sub-object,
; requires RenderObjClass::CLASSID_MESH, reads the mesh vertex array
; (ShareBuffer at +0x30, counts at +0x24/+0x28), finds the Z-extrema with the
; two-percent end bands from the globals below, averages the two extremity
; widths and writes the four transformed rounded corners plus the two centre
; points and the width into the output record, with the two-polygon
; perpendicular fallback.
;
; MASM dump carrying a measured VC7.1 codegen wall: the reconstructible C++
; bank (targets/game/reverse/attempts/0x00766aa0.cpp) compiles to exactly 3386
; bytes with 36 relocations (144 bytes) and normalized shape 1.000; its whole
; residue is 82 non-relocation bytes in two compiler-internal classes:
;   * 28 bytes at +0x15C..+0x1F8, the matrix-copy scratch-register rotation:
;     retail `mov ecx,[eax+0xc]` / alternating EDX/ECX, VC7.1 starts one round
;     robin step earlier with EAX then ECX/EDX;
;   * 54 x87 bytes from +0x828 to +0xC09 in the four corner dot products and
;     the fallback band sums: identical products on identical stack slots in a
;     different x87 evaluation order (at +0x8DA retail sums the z, y, x terms
;     ((z*m2 + y*m1) + x*m0) + w, VC7.1 emits x*m0, z*m2, y*m1).
; Eight recorded verdicts plus this session's probe/rotation_sweep (38 toggles
; over call arguments, receivers, initialisers and single-use locals), the
; 128-combination EH lever sweep, accessor/alias/matrix-copy/x87 re-spellings
; and the /Ob1 /Oi /G7 /Op flag checks never moved a byte.
; The dump body is byte-identical to retail outside its relocation slots.
; Evidence: targets/game/reverse/identity_evidence/00766aa0-geometry-recovery.md
; and targets/game/reverse/identity_evidence/00766aa0-masm-codegen-blocker.md
EXTERN g_Va0104EFC8:NEAR
EXTERN ?Rva006A16B0Empty@@3PADA:BYTE
EXTERN ?j_00017512@@YAXXZ:NEAR
EXTERN ?j_00026350@@YAXXZ:NEAR
EXTERN ?j_0002e7b7@@YAXXZ:NEAR
EXTERN __real@3ca3d70a:BYTE
EXTERN ?g_bfmeADL@@3MA:BYTE
EXTERN __ftol2:NEAR
EXTERN ?releaseBuffer@?$StringBase@D@@AAEXXZ:NEAR
EXTERN ?BfmeBoundaryZero3D@@3MB:BYTE
EXTERN ?j_00027a43@@YAXXZ:NEAR
_TEXT SEGMENT
public ?forward00769C30@Rva00766AA0Owner@@QAE_NPAURva00766AA0Buffer@@VAsciiString@@PAPAX2@Z
?forward00769C30@Rva00766AA0Owner@@QAE_NPAURva00766AA0Buffer@@VAsciiString@@PAPAX2@Z PROC
    db 06Ah, 0FFh, 068h
    dd g_Va0104EFC8
    db 064h, 0A1h, 000h, 000h, 000h, 000h, 050h, 064h, 089h, 025h, 000h, 000h, 000h, 000h, 081h, 0ECh
    db 0BCh, 000h, 000h, 000h, 053h, 055h, 056h, 057h, 08Bh, 0D9h, 08Bh, 003h, 033h, 0F6h, 089h, 0B4h
    db 024h, 0D4h, 000h, 000h, 000h, 0FFh, 090h, 0B8h, 000h, 000h, 000h, 08Bh, 0E8h, 08Bh, 084h, 024h
    db 0E4h, 000h, 000h, 000h, 03Bh, 0C6h, 074h, 002h, 089h, 030h, 08Bh, 0BCh, 024h, 0E8h, 000h, 000h
    db 000h, 085h, 0FFh, 074h, 006h, 0C7h, 007h, 000h, 000h, 000h, 000h, 085h, 0EDh, 074h, 045h, 08Bh
    db 084h, 024h, 0E0h, 000h, 000h, 000h, 085h, 0C0h, 074h, 005h, 083h, 0C0h, 008h, 0EBh, 005h, 0B8h
    dd ?Rva006A16B0Empty@@3PADA
    db 08Bh, 055h, 000h, 06Ah, 000h, 050h, 08Bh, 0CDh, 0FFh, 052h, 07Ch, 08Bh, 0F8h, 085h, 0FFh, 074h
    db 018h, 08Bh, 007h, 08Bh, 0CFh, 0FFh, 050h, 014h, 08Bh, 0F0h, 085h, 0F6h, 075h, 00Bh, 0FFh, 04Fh
    db 004h, 075h, 006h, 08Bh, 017h, 08Bh, 0CFh, 0FFh, 012h, 08Bh, 0BCh, 024h, 0E8h, 000h, 000h, 000h
    db 08Bh, 04Bh, 008h, 08Bh, 081h, 0FCh, 000h, 000h, 000h, 085h, 0C0h, 075h, 01Ch, 085h, 0F6h, 00Fh
    db 084h, 056h, 00Ch, 000h, 000h, 0FFh, 04Eh, 004h, 00Fh, 085h, 04Dh, 00Ch, 000h, 000h, 08Bh, 006h
    db 08Bh, 0CEh, 0FFh, 010h, 0E9h, 042h, 00Ch, 000h, 000h, 08Bh, 053h, 004h, 0C7h, 084h, 024h, 09Ch
    db 000h, 000h, 000h, 000h, 000h, 080h, 03Fh, 0C7h, 084h, 024h, 0A0h, 000h, 000h, 000h, 000h, 000h
    db 000h, 000h, 0C7h, 084h, 024h, 0A4h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0C7h, 084h, 024h
    db 0A8h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0C7h, 084h, 024h, 0ACh, 000h, 000h, 000h, 000h
    db 000h, 000h, 000h, 0C7h, 084h, 024h, 0B0h, 000h, 000h, 000h, 000h, 000h, 080h, 03Fh, 0C7h, 084h
    db 024h, 0B4h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0C7h, 084h, 024h, 0B8h, 000h, 000h, 000h
    db 000h, 000h, 000h, 000h, 0C7h, 084h, 024h, 0BCh, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0C7h
    db 084h, 024h, 0C0h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 0C7h, 084h, 024h, 0C4h, 000h, 000h
    db 000h, 000h, 000h, 080h, 03Fh, 0C7h, 084h, 024h, 0C8h, 000h, 000h, 000h, 000h, 000h, 000h, 000h
    db 080h, 07Ah, 069h, 000h, 074h, 025h
    call ?j_00017512@@YAXXZ
    db 0D9h, 040h, 02Ch, 0D9h, 040h, 01Ch, 08Bh, 048h, 00Ch, 0D9h, 09Ch, 024h, 0B8h, 000h, 000h, 000h
    db 089h, 08Ch, 024h, 0A8h, 000h, 000h, 000h, 0D9h, 09Ch, 024h, 0C8h, 000h, 000h, 000h, 0EBh, 078h
    db 08Bh, 050h, 008h, 089h, 094h, 024h, 09Ch, 000h, 000h, 000h, 08Bh, 048h, 00Ch, 089h, 08Ch, 024h
    db 0A0h, 000h, 000h, 000h, 08Bh, 050h, 010h, 089h, 094h, 024h, 0A4h, 000h, 000h, 000h, 08Bh, 048h
    db 014h, 089h, 08Ch, 024h, 0A8h, 000h, 000h, 000h, 08Bh, 050h, 018h, 089h, 094h, 024h, 0ACh, 000h
    db 000h, 000h, 08Bh, 048h, 01Ch, 089h, 08Ch, 024h, 0B0h, 000h, 000h, 000h, 08Bh, 050h, 020h, 089h
    db 094h, 024h, 0B4h, 000h, 000h, 000h, 08Bh, 048h, 024h, 089h, 08Ch, 024h, 0B8h, 000h, 000h, 000h
    db 08Bh, 050h, 028h, 089h, 094h, 024h, 0BCh, 000h, 000h, 000h, 08Bh, 048h, 02Ch, 089h, 08Ch, 024h
    db 0C0h, 000h, 000h, 000h, 08Bh, 050h, 030h, 089h, 094h, 024h, 0C4h, 000h, 000h, 000h, 08Bh, 040h
    db 034h, 089h, 084h, 024h, 0C8h, 000h, 000h, 000h, 08Dh, 08Ch, 024h, 09Ch, 000h, 000h, 000h, 051h
    db 08Bh, 0CBh
    call ?j_00026350@@YAXXZ
    db 085h, 0EDh, 074h, 010h, 08Bh, 055h, 000h, 08Dh, 084h, 024h, 09Ch, 000h, 000h, 000h, 050h, 08Bh
    db 0CDh, 0FFh, 052h, 054h, 085h, 0F6h, 00Fh, 084h, 0EDh, 00Ah, 000h, 000h, 08Bh, 016h, 08Bh, 0CEh
    db 0FFh, 052h, 00Ch, 085h, 0C0h, 00Fh, 085h, 0D3h, 00Ah, 000h, 000h, 085h, 0FFh, 074h, 005h, 0FFh
    db 046h, 004h, 089h, 037h, 08Bh, 0BCh, 024h, 0E4h, 000h, 000h, 000h, 085h, 0FFh, 074h, 022h, 08Bh
    db 086h, 0C8h, 000h, 000h, 000h, 083h, 078h, 024h, 002h, 07Eh, 016h, 08Bh, 056h, 004h, 08Dh, 044h
    db 024h, 010h, 050h, 042h, 056h, 08Bh, 0CBh, 089h, 056h, 004h
    call ?j_0002e7b7@@YAXXZ
    db 089h, 007h, 08Bh, 0BCh, 024h, 0DCh, 000h, 000h, 000h, 085h, 0FFh, 00Fh, 084h, 041h, 009h, 000h
    db 000h, 08Bh, 016h, 08Bh, 0CEh, 0FFh, 052h, 050h, 08Bh, 046h, 018h, 08Bh, 04Eh, 01Ch, 08Bh, 056h
    db 020h, 089h, 044h, 024h, 06Ch, 08Bh, 046h, 024h, 089h, 044h, 024h, 078h, 08Bh, 046h, 030h, 089h
    db 084h, 024h, 084h, 000h, 000h, 000h, 08Bh, 046h, 03Ch, 089h, 04Ch, 024h, 070h, 08Bh, 04Eh, 028h
    db 089h, 084h, 024h, 090h, 000h, 000h, 000h, 08Bh, 086h, 0C8h, 000h, 000h, 000h, 08Bh, 058h, 028h
    db 083h, 0FBh, 001h, 08Bh, 040h, 030h, 08Bh, 040h, 00Ch, 089h, 04Ch, 024h, 07Ch, 08Bh, 04Eh, 034h
    db 089h, 054h, 024h, 074h, 08Bh, 056h, 02Ch, 089h, 08Ch, 024h, 088h, 000h, 000h, 000h, 08Bh, 04Eh
    db 040h, 089h, 094h, 024h, 080h, 000h, 000h, 000h, 08Bh, 056h, 038h, 08Dh, 068h, 008h, 089h, 08Ch
    db 024h, 094h, 000h, 000h, 000h, 08Bh, 04Dh, 000h, 089h, 094h, 024h, 08Ch, 000h, 000h, 000h, 08Bh
    db 056h, 044h, 089h, 04Ch, 024h, 04Ch, 0D9h, 044h, 024h, 04Ch, 089h, 094h, 024h, 098h, 000h, 000h
    db 000h, 089h, 06Ch, 024h, 010h, 07Eh, 033h, 08Dh, 048h, 014h, 08Dh, 053h, 0FFh, 08Dh, 0A4h, 024h
    db 000h, 000h, 000h, 000h, 0D8h, 011h, 0DFh, 0E0h, 0F6h, 0C4h, 041h, 075h, 004h, 0DDh, 0D8h, 0D9h
    db 001h, 0D9h, 044h, 024h, 04Ch, 0D8h, 019h, 0DFh, 0E0h, 0F6h, 0C4h, 005h, 07Ah, 006h, 08Bh, 001h
    db 089h, 044h, 024h, 04Ch, 083h, 0C1h, 00Ch, 04Ah, 075h, 0DAh, 0D9h, 044h, 024h, 04Ch, 032h, 0D2h
    db 085h, 0DBh, 0D8h, 0E1h, 0C7h, 044h, 024h, 028h, 000h, 000h, 000h, 000h, 0C7h, 044h, 024h, 02Ch
    db 000h, 000h, 000h, 000h, 0D8h, 00Dh
    dd __real@3ca3d70a
    db 0C7h, 044h, 024h, 030h, 000h, 000h, 000h, 000h, 0C7h, 044h, 024h, 050h, 000h, 000h, 000h, 000h
    db 0D9h, 05Ch, 024h, 014h, 0C7h, 044h, 024h, 054h, 000h, 000h, 000h, 000h, 0C7h, 044h, 024h, 058h
    db 000h, 000h, 000h, 000h, 0C7h, 044h, 024h, 01Ch, 000h, 000h, 000h, 000h, 0C7h, 044h, 024h, 020h
    db 000h, 000h, 000h, 000h, 0C7h, 044h, 024h, 024h, 000h, 000h, 000h, 000h, 0C7h, 044h, 024h, 034h
    db 000h, 000h, 000h, 000h, 0C7h, 044h, 024h, 038h, 000h, 000h, 000h, 000h, 0C7h, 044h, 024h, 03Ch
    db 000h, 000h, 000h, 000h, 088h, 054h, 024h, 01Bh, 00Fh, 08Eh, 043h, 009h, 000h, 000h, 0D9h, 044h
    db 024h, 014h, 08Bh, 0CDh, 0D8h, 0C1h, 08Bh, 0EBh, 0D9h, 05Ch, 024h, 05Ch, 0DDh, 0D8h, 0D9h, 001h
    db 0D8h, 05Ch, 024h, 05Ch, 0DFh, 0E0h, 0F6h, 0C4h, 005h, 00Fh, 08Ah, 0BFh, 000h, 000h, 000h, 084h
    db 0D2h, 00Fh, 084h, 084h, 000h, 000h, 000h, 0D9h, 044h, 024h, 030h, 0D8h, 064h, 024h, 058h, 0D9h
    db 044h, 024h, 02Ch, 0D8h, 064h, 024h, 054h, 0D9h, 044h, 024h, 028h, 0D8h, 064h, 024h, 050h, 0D9h
    db 044h, 024h, 030h, 0D8h, 021h, 0D9h, 044h, 024h, 02Ch, 0D8h, 061h, 0FCh, 0D9h, 044h, 024h, 028h
    db 0D8h, 061h, 0F8h, 0D9h, 05Ch, 024h, 060h, 0D9h, 0C2h, 0D8h, 0CBh, 0D9h, 0C4h, 0D8h, 0CDh, 0DEh
    db 0C1h, 0D9h, 0C5h, 0D8h, 0CEh, 0DEh, 0C1h, 0D9h, 044h, 024h, 060h, 0D8h, 04Ch, 024h, 060h, 0D9h
    db 0C2h, 0D8h, 0CBh, 0DEh, 0C1h, 0D9h, 0C3h, 0D8h, 0CCh, 0DEh, 0C1h, 0DEh, 0D9h, 0DDh, 0D8h, 0DDh
    db 0D8h, 0DDh, 0D8h, 0DFh, 0E0h, 0DDh, 0D8h, 0F6h, 0C4h, 041h, 0DDh, 0D8h, 00Fh, 085h, 017h, 001h
    db 000h, 000h, 08Bh, 041h, 0F8h, 089h, 044h, 024h, 050h, 08Bh, 041h, 0FCh, 089h, 044h, 024h, 054h
    db 08Bh, 001h, 089h, 044h, 024h, 058h, 0E9h, 0FEh, 000h, 000h, 000h, 08Bh, 051h, 0F8h, 08Bh, 041h
    db 0FCh, 089h, 054h, 024h, 050h, 08Bh, 011h, 089h, 044h, 024h, 054h, 08Bh, 044h, 024h, 050h, 089h
    db 054h, 024h, 058h, 08Bh, 054h, 024h, 054h, 089h, 044h, 024h, 028h, 08Bh, 044h, 024h, 058h, 089h
    db 054h, 024h, 02Ch, 089h, 044h, 024h, 030h, 0B2h, 001h, 0E9h, 0CBh, 000h, 000h, 000h, 0D9h, 044h
    db 024h, 04Ch, 0D8h, 064h, 024h, 014h, 0D8h, 019h, 0DFh, 0E0h, 0F6h, 0C4h, 005h, 00Fh, 08Ah, 0B6h
    db 000h, 000h, 000h, 08Ah, 044h, 024h, 01Bh, 084h, 0C0h, 074h, 07Dh, 0D9h, 044h, 024h, 024h, 0D8h
    db 064h, 024h, 03Ch, 0D9h, 044h, 024h, 020h, 0D8h, 064h, 024h, 038h, 0D9h, 044h, 024h, 01Ch, 0D8h
    db 064h, 024h, 034h, 0D9h, 044h, 024h, 024h, 0D8h, 021h, 0D9h, 044h, 024h, 020h, 0D8h, 061h, 0FCh
    db 0D9h, 044h, 024h, 01Ch, 0D8h, 061h, 0F8h, 0D9h, 05Ch, 024h, 040h, 0D9h, 0C2h, 0D8h, 0CBh, 0D9h
    db 0C4h, 0D8h, 0CDh, 0DEh, 0C1h, 0D9h, 0C5h, 0D8h, 0CEh, 0DEh, 0C1h, 0D9h, 044h, 024h, 040h, 0D8h
    db 04Ch, 024h, 040h, 0D9h, 0C2h, 0D8h, 0CBh, 0DEh, 0C1h, 0D9h, 0C3h, 0D8h, 0CCh, 0DEh, 0C1h, 0DEh
    db 0D9h, 0DDh, 0D8h, 0DDh, 0D8h, 0DDh, 0D8h, 0DFh, 0E0h, 0DDh, 0D8h, 0F6h, 0C4h, 041h, 0DDh, 0D8h
    db 075h, 047h, 08Bh, 041h, 0F8h, 089h, 044h, 024h, 034h, 08Bh, 041h, 0FCh, 089h, 044h, 024h, 038h
    db 08Bh, 001h, 089h, 044h, 024h, 03Ch, 0EBh, 031h, 08Bh, 041h, 0F8h, 089h, 044h, 024h, 034h, 08Bh
    db 041h, 0FCh, 089h, 044h, 024h, 038h, 08Bh, 001h, 089h, 044h, 024h, 03Ch, 08Bh, 044h, 024h, 034h
    db 089h, 044h, 024h, 01Ch, 08Bh, 044h, 024h, 038h, 089h, 044h, 024h, 020h, 08Bh, 044h, 024h, 03Ch
    db 089h, 044h, 024h, 024h, 0C6h, 044h, 024h, 01Bh, 001h, 083h, 0C1h, 00Ch, 04Dh, 00Fh, 085h, 05Bh
    db 0FEh, 0FFh, 0FFh, 084h, 0D2h, 00Fh, 084h, 095h, 007h, 000h, 000h, 08Ah, 044h, 024h, 01Bh, 084h
    db 0C0h, 00Fh, 084h, 089h, 007h, 000h, 000h, 08Bh, 04Ch, 024h, 010h, 08Bh, 0D3h, 0D9h, 001h, 0D8h
    db 05Ch, 024h, 05Ch, 0DFh, 0E0h, 0F6h, 0C4h, 005h, 00Fh, 08Ah, 084h, 000h, 000h, 000h, 0D9h, 044h
    db 024h, 030h, 0D8h, 064h, 024h, 058h, 0D9h, 044h, 024h, 02Ch, 0D8h, 064h, 024h, 054h, 0D9h, 044h
    db 024h, 028h, 0D8h, 064h, 024h, 050h, 0D9h, 044h, 024h, 058h, 0D8h, 021h, 0D9h, 044h, 024h, 054h
    db 0D8h, 061h, 0FCh, 0D9h, 044h, 024h, 050h, 0D8h, 061h, 0F8h, 0D9h, 05Ch, 024h, 060h, 0D9h, 0C2h
    db 0D8h, 0CBh, 0D9h, 0C4h, 0D8h, 0CDh, 0DEh, 0C1h, 0D9h, 0C5h, 0D8h, 0CEh, 0DEh, 0C1h, 0D9h, 044h
    db 024h, 060h, 0D8h, 04Ch, 024h, 060h, 0D9h, 0C2h, 0D8h, 0CBh, 0DEh, 0C1h, 0D9h, 0C3h, 0D8h, 0CCh
    db 0DEh, 0C1h, 0DEh, 0D9h, 0DDh, 0D8h, 0DDh, 0D8h, 0DDh, 0D8h, 0DFh, 0E0h, 0DDh, 0D8h, 0F6h, 0C4h
    db 041h, 0DDh, 0D8h, 00Fh, 085h, 0A5h, 000h, 000h, 000h, 08Bh, 041h, 0F8h, 089h, 044h, 024h, 028h
    db 08Bh, 041h, 0FCh, 089h, 044h, 024h, 02Ch, 08Bh, 001h, 089h, 044h, 024h, 030h, 0E9h, 08Ch, 000h
    db 000h, 000h, 0D9h, 044h, 024h, 04Ch, 0D8h, 064h, 024h, 014h, 0D8h, 019h, 0DFh, 0E0h, 0F6h, 0C4h
    db 005h, 07Ah, 07Bh, 0D9h, 044h, 024h, 024h, 0D8h, 064h, 024h, 03Ch, 0D9h, 044h, 024h, 020h, 0D8h
    db 064h, 024h, 038h, 0D9h, 044h, 024h, 01Ch, 0D8h, 064h, 024h, 034h, 0D9h, 044h, 024h, 024h, 0D8h
    db 021h, 0D9h, 044h, 024h, 020h, 0D8h, 061h, 0FCh, 0D9h, 044h, 024h, 01Ch, 0D8h, 061h, 0F8h, 0D9h
    db 05Ch, 024h, 040h, 0D9h, 0C2h, 0D8h, 0CBh, 0D9h, 0C4h, 0D8h, 0CDh, 0DEh, 0C1h, 0D9h, 0C5h, 0D8h
    db 0CEh, 0DEh, 0C1h, 0D9h, 044h, 024h, 040h, 0D8h, 04Ch, 024h, 040h, 0D9h, 0C2h, 0D8h, 0CBh, 0DEh
    db 0C1h, 0D9h, 0C3h, 0D8h, 0CCh, 0DEh, 0C1h, 0DEh, 0D9h, 0DDh, 0D8h, 0DDh, 0D8h, 0DDh, 0D8h, 0DFh
    db 0E0h, 0DDh, 0D8h, 0F6h, 0C4h, 041h, 0DDh, 0D8h, 075h, 014h, 08Bh, 041h, 0F8h, 089h, 044h, 024h
    db 034h, 08Bh, 041h, 0FCh, 089h, 044h, 024h, 038h, 08Bh, 001h, 089h, 044h, 024h, 03Ch, 083h, 0C1h
    db 00Ch, 04Ah, 00Fh, 085h, 0D5h, 0FEh, 0FFh, 0FFh, 0D9h, 044h, 024h, 058h, 0D8h, 044h, 024h, 030h
    db 0D9h, 044h, 024h, 054h, 0D8h, 044h, 024h, 02Ch, 0D9h, 044h, 024h, 050h, 0D8h, 044h, 024h, 028h
    db 0D9h, 05Ch, 024h, 060h, 0D9h, 0C9h, 0D8h, 00Dh
    dd ?g_bfmeADL@@3MA
    db 0D9h, 05Ch, 024h, 014h, 0D8h, 00Dh
    dd ?g_bfmeADL@@3MA
    db 0D9h, 044h, 024h, 060h, 0D8h, 00Dh
    dd ?g_bfmeADL@@3MA
    db 0D9h, 044h, 024h, 074h, 0D8h, 04Ch, 024h, 014h, 0D9h, 044h, 024h, 070h, 0D8h, 0CBh, 0DEh, 0C1h
    db 0D9h, 0C1h, 0D8h, 04Ch, 024h, 06Ch, 0DEh, 0C1h, 0D8h, 044h, 024h, 078h, 0D9h, 05Ch, 024h, 040h
    db 0D9h, 044h, 024h, 07Ch, 0D8h, 0C9h, 0D9h, 084h, 024h, 080h, 000h, 000h, 000h, 0D8h, 0CBh, 0DEh
    db 0C1h, 0D9h, 084h, 024h, 084h, 000h, 000h, 000h, 0D8h, 04Ch, 024h, 014h, 0DEh, 0C1h, 0D8h, 084h
    db 024h, 088h, 000h, 000h, 000h, 0D9h, 05Ch, 024h, 044h, 0D9h, 084h, 024h, 08Ch, 000h, 000h, 000h
    db 0D8h, 0C9h, 0D9h, 084h, 024h, 090h, 000h, 000h, 000h, 0D8h, 0CBh, 0DEh, 0C1h, 0D9h, 084h, 024h
    db 094h, 000h, 000h, 000h, 0D8h, 04Ch, 024h, 014h, 0DEh, 0C1h, 0D8h, 084h, 024h, 098h, 000h, 000h
    db 000h, 0D9h, 05Ch, 024h, 048h, 0DDh, 0D8h, 0DDh, 0D8h, 0D9h, 044h, 024h, 03Ch, 0D8h, 044h, 024h
    db 024h, 0D9h, 044h, 024h, 038h, 0D8h, 044h, 024h, 020h, 0D9h, 044h, 024h, 034h, 0D8h, 044h, 024h
    db 01Ch, 0D9h, 05Ch, 024h, 060h, 0D9h, 0C9h, 0D8h, 00Dh
    dd ?g_bfmeADL@@3MA
    db 0D9h, 05Ch, 024h, 014h, 0D8h, 00Dh
    dd ?g_bfmeADL@@3MA
    db 0D9h, 044h, 024h, 060h, 0D8h, 00Dh
    dd ?g_bfmeADL@@3MA
    db 0D9h, 044h, 024h, 074h, 0D8h, 04Ch, 024h, 014h, 0D9h, 044h, 024h, 070h, 0D8h, 0CBh, 0DEh, 0C1h
    db 0D9h, 0C1h, 0D8h, 04Ch, 024h, 06Ch, 0DEh, 0C1h, 0D8h, 044h, 024h, 078h, 0D9h, 05Ch, 024h, 060h
    db 0D9h, 044h, 024h, 07Ch, 0D8h, 0C9h, 0D9h, 084h, 024h, 080h, 000h, 000h, 000h, 0D8h, 0CBh, 0DEh
    db 0C1h, 0D9h, 084h, 024h, 084h, 000h, 000h, 000h, 0D8h, 04Ch, 024h, 014h, 0DEh, 0C1h, 0D8h, 084h
    db 024h, 088h, 000h, 000h, 000h, 0D9h, 05Ch, 024h, 064h, 0D9h, 084h, 024h, 08Ch, 000h, 000h, 000h
    db 0D8h, 0C9h, 0D9h, 084h, 024h, 090h, 000h, 000h, 000h, 0D8h, 0CBh, 0DEh, 0C1h, 0D9h, 084h, 024h
    db 094h, 000h, 000h, 000h, 0D8h, 04Ch, 024h, 014h, 0DEh, 0C1h, 0D8h, 084h, 024h, 098h, 000h, 000h
    db 000h, 0D9h, 05Ch, 024h, 068h, 0DDh, 0D8h, 0DDh, 0D8h, 0D9h, 044h, 024h, 024h, 0D8h, 064h, 024h
    db 03Ch, 0D9h, 044h, 024h, 020h, 0D8h, 064h, 024h, 038h, 0D9h, 044h, 024h, 01Ch, 0D8h, 064h, 024h
    db 034h, 0D9h, 0C0h, 0D8h, 0C9h, 0D9h, 0C2h, 0D8h, 0CBh, 0DEh, 0C1h, 0D9h, 0C3h, 0D8h, 0CCh, 0DEh
    db 0C1h, 0D9h, 05Ch, 024h, 010h, 0DDh, 0D8h, 0DDh, 0D8h, 0DDh, 0D8h, 0D9h, 044h, 024h, 010h, 0D9h
    db 0FAh, 0D9h, 05Ch, 024h, 014h, 0D9h, 044h, 024h, 030h, 0D8h, 064h, 024h, 058h, 0D9h, 044h, 024h
    db 02Ch, 0D8h, 064h, 024h, 054h, 0D9h, 044h, 024h, 028h, 0D8h, 064h, 024h, 050h, 0D9h, 0C0h, 0D8h
    db 0C9h, 0D9h, 0C2h, 0D8h, 0CBh, 0DEh, 0C1h, 0D9h, 0C3h, 0D8h, 0CCh, 0DEh, 0C1h, 0D9h, 05Ch, 024h
    db 010h, 0DDh, 0D8h, 0DDh, 0D8h, 0DDh, 0D8h, 0D9h, 044h, 024h, 010h, 0D9h, 0FAh, 0D9h, 05Ch, 024h
    db 05Ch, 0D9h, 044h, 024h, 05Ch, 08Bh, 04Ch, 024h, 060h, 0D8h, 044h, 024h, 014h, 08Bh, 054h, 024h
    db 064h, 08Bh, 044h, 024h, 068h, 089h, 00Fh, 08Bh, 04Ch, 024h, 040h, 0D8h, 00Dh
    dd ?g_bfmeADL@@3MA
    db 089h, 057h, 004h, 08Bh, 054h, 024h, 044h, 089h, 047h, 008h, 0D9h, 05Ch, 024h, 04Ch, 08Bh, 044h
    db 024h, 048h, 089h, 04Fh, 00Ch, 08Bh, 04Ch, 024h, 04Ch, 089h, 057h, 010h, 089h, 047h, 014h, 089h
    db 04Fh, 018h, 08Bh, 086h, 0C8h, 000h, 000h, 000h, 083h, 078h, 024h, 002h, 00Fh, 08Eh, 0FDh, 002h
    db 000h, 000h, 0D9h, 044h, 024h, 030h, 0D8h, 04Ch, 024h, 074h, 0D9h, 044h, 024h, 02Ch, 0D8h, 04Ch
    db 024h, 070h, 0DEh, 0C1h, 0D9h, 044h, 024h, 028h, 0D8h, 04Ch, 024h, 06Ch, 0DEh, 0C1h, 0D8h, 044h
    db 024h, 078h, 0D9h, 05Ch, 024h, 040h, 0D9h, 084h, 024h, 084h, 000h, 000h, 000h, 0D8h, 04Ch, 024h
    db 030h, 0D9h, 044h, 024h, 07Ch, 0D8h, 04Ch, 024h, 028h, 0DEh, 0C1h, 0D9h, 084h, 024h, 080h, 000h
    db 000h, 000h, 0D8h, 04Ch, 024h, 02Ch, 0DEh, 0C1h, 0D8h, 084h, 024h, 088h, 000h, 000h, 000h, 0D9h
    db 05Ch, 024h, 044h, 0D9h, 084h, 024h, 094h, 000h, 000h, 000h, 0D8h, 04Ch, 024h, 030h, 0D9h, 084h
    db 024h, 08Ch, 000h, 000h, 000h, 0D8h, 04Ch, 024h, 028h, 0DEh, 0C1h, 0D9h, 084h, 024h, 090h, 000h
    db 000h, 000h, 0D8h, 04Ch, 024h, 02Ch, 0DEh, 0C1h, 0D8h, 084h, 024h, 098h, 000h, 000h, 000h
    call __ftol2
    db 089h, 044h, 024h, 010h, 0DBh, 044h, 024h, 010h, 0D9h, 044h, 024h, 044h
    call __ftol2
    db 089h, 044h, 024h, 010h, 0DBh, 044h, 024h, 010h, 0D9h, 044h, 024h, 040h
    call __ftol2
    db 089h, 044h, 024h, 010h, 0DBh, 044h, 024h, 010h, 0D9h, 05Fh, 034h, 0D9h, 05Fh, 038h, 0D9h, 05Fh
    db 03Ch, 0D9h, 044h, 024h, 058h, 0D8h, 04Ch, 024h, 074h, 0D9h, 044h, 024h, 054h, 0D8h, 04Ch, 024h
    db 070h, 0DEh, 0C1h, 0D9h, 044h, 024h, 050h, 0D8h, 04Ch, 024h, 06Ch, 0DEh, 0C1h, 0D8h, 044h, 024h
    db 078h, 0D9h, 05Ch, 024h, 040h, 0D9h, 084h, 024h, 084h, 000h, 000h, 000h, 0D8h, 04Ch, 024h, 058h
    db 0D9h, 084h, 024h, 080h, 000h, 000h, 000h, 0D8h, 04Ch, 024h, 054h, 0DEh, 0C1h, 0D9h, 044h, 024h
    db 07Ch, 0D8h, 04Ch, 024h, 050h, 0DEh, 0C1h, 0D8h, 084h, 024h, 088h, 000h, 000h, 000h, 0D9h, 05Ch
    db 024h, 044h, 0D9h, 084h, 024h, 094h, 000h, 000h, 000h, 0D8h, 04Ch, 024h, 058h, 0D9h, 084h, 024h
    db 090h, 000h, 000h, 000h, 0D8h, 04Ch, 024h, 054h, 0DEh, 0C1h, 0D9h, 084h, 024h, 08Ch, 000h, 000h
    db 000h, 0D8h, 04Ch, 024h, 050h, 0DEh, 0C1h, 0D8h, 084h, 024h, 098h, 000h, 000h, 000h
    call __ftol2
    db 089h, 044h, 024h, 010h, 0DBh, 044h, 024h, 010h, 0D9h, 044h, 024h, 044h
    call __ftol2
    db 089h, 044h, 024h, 010h, 0DBh, 044h, 024h, 010h, 0D9h, 044h, 024h, 040h
    call __ftol2
    db 089h, 044h, 024h, 010h, 0DBh, 044h, 024h, 010h, 0D9h, 05Fh, 040h, 0D9h, 05Fh, 044h, 0D9h, 05Fh
    db 048h, 0D9h, 044h, 024h, 024h, 0D8h, 04Ch, 024h, 074h, 0D9h, 044h, 024h, 020h, 0D8h, 04Ch, 024h
    db 070h, 0DEh, 0C1h, 0D9h, 044h, 024h, 01Ch, 0D8h, 04Ch, 024h, 06Ch, 0DEh, 0C1h, 0D8h, 044h, 024h
    db 078h, 0D9h, 05Ch, 024h, 040h, 0D9h, 084h, 024h, 084h, 000h, 000h, 000h, 0D8h, 04Ch, 024h, 024h
    db 0D9h, 084h, 024h, 080h, 000h, 000h, 000h, 0D8h, 04Ch, 024h, 020h, 0DEh, 0C1h, 0D9h, 044h, 024h
    db 07Ch, 0D8h, 04Ch, 024h, 01Ch, 0DEh, 0C1h, 0D8h, 084h, 024h, 088h, 000h, 000h, 000h, 0D9h, 05Ch
    db 024h, 044h, 0D9h, 084h, 024h, 094h, 000h, 000h, 000h, 0D8h, 04Ch, 024h, 024h, 0D9h, 084h, 024h
    db 090h, 000h, 000h, 000h, 0D8h, 04Ch, 024h, 020h, 0DEh, 0C1h, 0D9h, 084h, 024h, 08Ch, 000h, 000h
    db 000h, 0D8h, 04Ch, 024h, 01Ch, 0DEh, 0C1h, 0D8h, 084h, 024h, 098h, 000h, 000h, 000h
    call __ftol2
    db 089h, 044h, 024h, 010h, 0DBh, 044h, 024h, 010h, 0D9h, 044h, 024h, 044h
    call __ftol2
    db 089h, 044h, 024h, 010h, 0DBh, 044h, 024h, 010h, 0D9h, 044h, 024h, 040h
    call __ftol2
    db 089h, 044h, 024h, 010h, 0DBh, 044h, 024h, 010h, 0D9h, 05Fh, 01Ch, 0D9h, 05Fh, 020h, 0D9h, 05Fh
    db 024h, 0D9h, 044h, 024h, 03Ch, 0D8h, 04Ch, 024h, 074h, 0D9h, 044h, 024h, 038h, 0D8h, 04Ch, 024h
    db 070h, 0DEh, 0C1h, 0D9h, 044h, 024h, 034h, 0D8h, 04Ch, 024h, 06Ch, 0DEh, 0C1h, 0D8h, 044h, 024h
    db 078h, 0D9h, 05Ch, 024h, 040h, 0D9h, 084h, 024h, 084h, 000h, 000h, 000h, 0D8h, 04Ch, 024h, 03Ch
    db 0D9h, 084h, 024h, 080h, 000h, 000h, 000h, 0D8h, 04Ch, 024h, 038h, 0DEh, 0C1h, 0D9h, 044h, 024h
    db 07Ch, 0D8h, 04Ch, 024h, 034h, 0DEh, 0C1h, 0D8h, 084h, 024h, 088h, 000h, 000h, 000h, 0D9h, 05Ch
    db 024h, 044h, 0D9h, 084h, 024h, 094h, 000h, 000h, 000h, 0D8h, 04Ch, 024h, 03Ch, 0D9h, 084h, 024h
    db 090h, 000h, 000h, 000h, 0D8h, 04Ch, 024h, 038h, 0DEh, 0C1h, 0D9h, 084h, 024h, 08Ch, 000h, 000h
    db 000h, 0D8h, 04Ch, 024h, 034h, 0DEh, 0C1h, 0D8h, 084h, 024h, 098h, 000h, 000h, 000h
    call __ftol2
    db 089h, 044h, 024h, 010h, 0DBh, 044h, 024h, 010h, 0D9h, 044h, 024h, 044h
    call __ftol2
    db 089h, 044h, 024h, 010h, 0DBh, 044h, 024h, 010h, 0D9h, 044h, 024h, 040h
    call __ftol2
    db 089h, 044h, 024h, 010h, 0DBh, 044h, 024h, 010h, 0D9h, 05Fh, 028h, 0D9h, 05Fh, 02Ch, 0D9h, 05Fh
    db 030h, 0FFh, 04Eh, 004h, 075h, 006h, 08Bh, 006h, 08Bh, 0CEh, 0FFh, 010h, 08Dh, 08Ch, 024h, 0E0h
    db 000h, 000h, 000h, 0C7h, 084h, 024h, 0D4h, 000h, 000h, 000h, 0FFh, 0FFh, 0FFh, 0FFh
    call ?releaseBuffer@?$StringBase@D@@AAEXXZ
    db 0B0h, 001h, 0E9h, 048h, 001h, 000h, 000h, 0D9h, 044h, 024h, 044h, 0C7h, 044h, 024h, 024h, 000h
    db 000h, 000h, 000h, 0D8h, 064h, 024h, 064h, 0D9h, 044h, 024h, 040h, 0D8h, 064h, 024h, 060h, 0D9h
    db 05Ch, 024h, 028h, 0D9h, 0E0h, 0D9h, 05Ch, 024h, 01Ch, 0D9h, 044h, 024h, 028h, 0D9h, 044h, 024h
    db 01Ch, 0D8h, 04Ch, 024h, 01Ch, 0D9h, 044h, 024h, 028h, 0D8h, 04Ch, 024h, 028h, 0DEh, 0C1h, 0D9h
    db 05Ch, 024h, 05Ch, 0D9h, 005h
    dd ?BfmeBoundaryZero3D@@3MB
    db 0D9h, 044h, 024h, 05Ch, 0DAh, 0E9h, 0DFh, 0E0h, 0F6h, 0C4h, 044h, 07Bh, 02Eh, 08Bh, 054h, 024h
    db 05Ch, 0DDh, 0D8h, 052h
    call ?j_00027a43@@YAXXZ
    db 0D9h, 054h, 024h, 014h, 0D8h, 04Ch, 024h, 01Ch, 0D9h, 05Ch, 024h, 01Ch, 0D9h, 044h, 024h, 014h
    db 0D8h, 04Ch, 024h, 028h, 0D9h, 044h, 024h, 014h, 0D8h, 00Dh
    dd ?BfmeBoundaryZero3D@@3MB
    db 0D9h, 05Ch, 024h, 024h, 0D9h, 044h, 024h, 01Ch, 0D8h, 04Ch, 024h, 04Ch, 0D8h, 00Dh
    dd ?g_bfmeADL@@3MA
    db 0D9h, 054h, 024h, 014h, 0D8h, 044h, 024h, 060h, 0D9h, 05Fh, 01Ch, 0D8h, 04Ch, 024h, 04Ch, 0D8h
    db 00Dh
    dd ?g_bfmeADL@@3MA
    db 0D9h, 044h, 024h, 064h, 0D8h, 0C1h, 0D9h, 05Fh, 020h, 0D9h, 044h, 024h, 024h, 0D8h, 04Ch, 024h
    db 04Ch, 0D8h, 00Dh
    dd ?g_bfmeADL@@3MA
    db 0D9h, 044h, 024h, 068h, 0D8h, 0C1h, 0D9h, 05Fh, 024h, 0D9h, 044h, 024h, 060h, 0D8h, 064h, 024h
    db 014h, 0D9h, 05Fh, 028h, 0D9h, 044h, 024h, 064h, 0D8h, 0E2h, 0D9h, 05Fh, 02Ch, 0D9h, 044h, 024h
    db 068h, 0D8h, 0E1h, 0D9h, 05Fh, 030h, 0D9h, 044h, 024h, 014h, 0D8h, 044h, 024h, 040h, 0D9h, 05Fh
    db 034h, 0D9h, 0C1h, 0D8h, 044h, 024h, 044h, 0D9h, 05Fh, 038h, 0D9h, 044h, 024h, 048h, 0D8h, 0C1h
    db 0D9h, 05Fh, 03Ch, 0D9h, 044h, 024h, 040h, 0D8h, 064h, 024h, 014h, 0D9h, 05Fh, 040h, 0D9h, 044h
    db 024h, 044h, 0D8h, 0E2h, 0D9h, 05Fh, 044h, 0D9h, 044h, 024h, 048h, 0D8h, 0E1h, 0D9h, 05Fh, 048h
    db 0DDh, 0D8h, 0DDh, 0D8h, 0E9h, 0B7h, 0FEh, 0FFh, 0FFh, 0DDh, 0D8h, 0EBh, 00Bh, 0FFh, 04Eh, 004h
    db 075h, 006h, 08Bh, 016h, 08Bh, 0CEh, 0FFh, 012h, 08Dh, 08Ch, 024h, 0E0h, 000h, 000h, 000h, 0C7h
    db 084h, 024h, 0D4h, 000h, 000h, 000h, 0FFh, 0FFh, 0FFh, 0FFh
    call ?releaseBuffer@?$StringBase@D@@AAEXXZ
    db 032h, 0C0h, 08Bh, 08Ch, 024h, 0CCh, 000h, 000h, 000h, 05Fh, 05Eh, 05Dh, 05Bh, 064h, 089h, 00Dh
    db 000h, 000h, 000h, 000h, 081h, 0C4h, 0C8h, 000h, 000h, 000h, 0C2h, 010h, 000h
?forward00769C30@Rva00766AA0Owner@@QAE_NPAURva00766AA0Buffer@@VAsciiString@@PAPAX2@Z ENDP
_TEXT ENDS
END
