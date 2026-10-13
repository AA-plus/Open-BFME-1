.386
.model flat
; ?_bfme_updateProfileDisplay@BfmeAptScreenSkirmish@@QAEXXZ
; Retail @ 0x0057A470 size 5296.
;
; Identity: three matched BfmeAptScreenSkirmish callers (0x0057BE50, the
; applySlotPlayerTemplate and initGadgets methods) and the ILT pin at
; 0x00030643 prove this receiver spelling; retail returns at +0x14AF with
; INT3 padding at +0x14B0, confirming the 5296-byte extent. ABI: ECX
; receiver, __thiscall, SEH/EH registration frame, two by-value UnicodeString
; temporaries with mov [esp+N],esp save slots, `ret`.
;
; MASM dump carrying a measured VC7.1 codegen wall: the reconstructible C++
; bank (targets/game/reverse/attempts/0x0057a470.cpp) emits exactly 5296 bytes
; with 372 relocations, normalized instruction shape 1.000, and 222
; non-relocation bytes that are purely stack-slot ALLOCATION. The head region
; is one 4-byte slot tight in retail: retail keeps text at -0x140 and dash at
; Eb-0x134 with the fetch-temporary saved-esp at Eb-0x13C, while VC7.1 emits
; dash at Eb-0x130 and the saved-esp at Eb-0x134, shifting the residue across
; the whole body (deltas +16/+8/+4/-4 by region). Twenty-five recorded
; verdicts, the 33-trial EH lever search, the shape_family_levers battery
; (sib/register/bool/test/copy/store/loop/branch/constant/frame) and this
; session's split-fetch, named-temporary, faction/movieBufs/progress
; declaration-order and text/dash-order re-spellings never moved a byte.
; The dump body is byte-identical to retail outside its relocation slots.
; Evidence: targets/game/reverse/identity_evidence/0057a470-masm-codegen-blocker.md
EXTERN ??0?$StringBase@D@@AAE@ABV0@@Z:NEAR
EXTERN ??0?$StringBase@D@@AAE@PBD@Z:NEAR
EXTERN ??0?$StringBase@G@@AAE@ABV0@@Z:NEAR
EXTERN ??0?$StringBase@G@@AAE@PBG@Z:NEAR
EXTERN ?BFMEEmptyUnicodeString@@3GB:BYTE
EXTERN ?R2Ptr012F19E8@@3PAVGen000290D2@@A:BYTE
EXTERN ?Rva00579160TheCurrent@@3PAURva00579160Current@@A:BYTE
EXTERN ?Rva012B8054Image@@3PBDB:BYTE
EXTERN ?TheGameText@@3PAVBfmeGameText@@A:BYTE
EXTERN ?ThePlayerTemplateStore@@3PAVPlayerTemplateStore@@A:BYTE
EXTERN ?format@UnicodeString@@QAAXV1@ZZ:NEAR
EXTERN ?g_aptPalantirNormalJewel@@3PADA:BYTE
EXTERN ?g_bfmeScaleBC@@3MA:BYTE
EXTERN ?j_0000bdca@@YAXXZ:NEAR
EXTERN ?j_00010898@@YAXXZ:NEAR
EXTERN ?j_00015235@@YAXXZ:NEAR
EXTERN ?j_00017af8@@YAXXZ:NEAR
EXTERN ?j_0001ce18@@YAXXZ:NEAR
EXTERN ?j_0001d345@@YAXXZ:NEAR
EXTERN ?j_0001ec18@@YAXXZ:NEAR
EXTERN ?j_00022273@@YAXXZ:NEAR
EXTERN ?j_00022c23@@YAXXZ:NEAR
EXTERN ?j_000232c2@@YAXXZ:NEAR
EXTERN ?j_00023d53@@YAXXZ:NEAR
EXTERN ?j_0002639b@@YAXXZ:NEAR
EXTERN ?j_00027093@@YAXXZ:NEAR
EXTERN ?j_00028c2c@@YAXXZ:NEAR
EXTERN ?j_00037bd2@@YAXXZ:NEAR
EXTERN ?j_0003f472@@YAXXZ:NEAR
EXTERN ?j_00040192@@YAXXZ:NEAR
EXTERN ?j_00040651@@YAXXZ:NEAR
EXTERN ?releaseBuffer@?$StringBase@D@@AAEXXZ:NEAR
EXTERN ?releaseBuffer@?$StringBase@G@@AAEXXZ:NEAR
EXTERN ?translate@UnicodeString@@QAEXABVAsciiString@@@Z:NEAR
EXTERN __ftol2:NEAR
EXTERN __imp___itoa:BYTE
EXTERN g_Va01036275:NEAR
EXTERN g_Va010F9F60:BYTE
EXTERN g_Va011060D8:BYTE
EXTERN g_Va01107E28:BYTE
EXTERN g_Va01108AC4:BYTE
EXTERN g_Va0110B0C8:BYTE
EXTERN g_Va0110B0DC:BYTE
EXTERN g_Va0110B0F4:BYTE
EXTERN g_Va0110B118:BYTE
EXTERN g_Va0110B130:BYTE
EXTERN g_Va0110B144:BYTE
EXTERN g_Va0110B158:BYTE
EXTERN g_Va0110B168:BYTE
EXTERN g_Va0110B17C:BYTE
EXTERN g_Va0110B198:BYTE
EXTERN g_Va0110B1B0:BYTE
EXTERN g_Va0110B1CC:BYTE
EXTERN g_Va0110B1E8:BYTE
EXTERN g_Va0110B204:BYTE
EXTERN g_Va0110B224:BYTE
EXTERN g_Va0110B240:BYTE
EXTERN g_Va0110B260:BYTE
EXTERN g_Va0110B27C:BYTE
EXTERN g_Va0110B2A0:BYTE
_TEXT SEGMENT
public ?_bfme_updateProfileDisplay@BfmeAptScreenSkirmish@@QAEXXZ
?_bfme_updateProfileDisplay@BfmeAptScreenSkirmish@@QAEXXZ PROC
    db 06Ah, 0FFh, 068h
    dd g_Va01036275
    db 064h, 0A1h, 000h, 000h, 000h, 000h, 050h, 064h, 089h, 025h, 000h, 000h, 000h, 000h, 081h, 0ECh
    db 03Ch, 001h, 000h, 000h, 053h, 055h, 056h, 033h, 0EDh, 057h, 08Bh, 0F9h, 089h, 06Ch, 024h, 018h
    db 089h, 0ACh, 024h, 054h, 001h, 000h, 000h, 089h, 06Ch, 024h, 024h, 08Bh, 00Dh
    dd ?TheGameText@@3PAVBfmeGameText@@A
    db 08Bh, 001h, 051h, 08Bh, 0D4h, 089h, 064h, 024h, 020h, 055h, 068h
    dd g_Va0110B2A0
    db 052h, 0C6h, 084h, 024h, 064h, 001h, 000h, 000h, 001h, 0FFh, 050h, 028h, 08Dh, 044h, 024h, 028h
    db 050h
    call ?format@UnicodeString@@QAAXV1@ZZ
    db 08Dh, 0B7h, 0ACh, 003h, 000h, 000h, 083h, 0C4h, 008h, 08Bh, 0CEh
    call ?j_00017af8@@YAXXZ
    db 084h, 0C0h, 00Fh, 085h, 090h, 004h, 000h, 000h, 051h, 08Dh, 054h, 024h, 028h, 089h, 064h, 024h
    db 020h, 08Bh, 0CCh, 052h
    call ??0?$StringBase@G@@AAE@ABV0@@Z
    db 08Dh, 044h, 024h, 01Ch, 050h
    call ?format@UnicodeString@@QAAXV1@ZZ
    db 083h, 0C4h, 008h, 068h
    dd g_Va0110B27C
    db 08Dh, 04Ch, 024h, 014h
    call ??0?$StringBase@D@@AAE@PBD@Z
    db 08Dh, 04Ch, 024h, 018h, 051h, 0B3h, 002h, 08Dh, 04Ch, 024h, 018h, 088h, 09Ch, 024h, 058h, 001h
    db 000h, 000h
    call ??0?$StringBase@G@@AAE@ABV0@@Z
    db 08Bh, 00Dh
    dd ?R2Ptr012F19E8@@3PAVGen000290D2@@A
    db 08Dh, 054h, 024h, 014h, 052h, 08Dh, 044h, 024h, 014h, 050h, 0C6h, 084h, 024h, 05Ch, 001h, 000h
    db 000h, 003h
    call ?j_0000bdca@@YAXXZ
    db 08Dh, 04Ch, 024h, 014h, 088h, 09Ch, 024h, 054h, 001h, 000h, 000h
    call ?releaseBuffer@?$StringBase@G@@AAEXXZ
    db 08Dh, 04Ch, 024h, 010h, 0C6h, 084h, 024h, 054h, 001h, 000h, 000h, 001h
    call ?releaseBuffer@?$StringBase@D@@AAEXXZ
    db 068h
    dd g_Va01108AC4
    db 08Dh, 04Ch, 024h, 018h
    call ??0?$StringBase@D@@AAE@PBD@Z
    db 08Dh, 04Ch, 024h, 018h, 051h, 0B3h, 004h, 08Dh, 04Ch, 024h, 014h, 088h, 09Ch, 024h, 058h, 001h
    db 000h, 000h
    call ??0?$StringBase@G@@AAE@ABV0@@Z
    db 08Bh, 00Dh
    dd ?R2Ptr012F19E8@@3PAVGen000290D2@@A
    db 08Dh, 054h, 024h, 010h, 052h, 08Dh, 044h, 024h, 018h, 050h, 0C6h, 084h, 024h, 05Ch, 001h, 000h
    db 000h, 005h
    call ?j_0000bdca@@YAXXZ
    db 08Dh, 04Ch, 024h, 010h, 088h, 09Ch, 024h, 054h, 001h, 000h, 000h
    call ?releaseBuffer@?$StringBase@G@@AAEXXZ
    db 08Dh, 04Ch, 024h, 014h, 0C6h, 084h, 024h, 054h, 001h, 000h, 000h, 001h
    call ?releaseBuffer@?$StringBase@D@@AAEXXZ
    db 068h
    dd g_Va0110B260
    db 08Dh, 04Ch, 024h, 018h
    call ??0?$StringBase@D@@AAE@PBD@Z
    db 08Dh, 04Ch, 024h, 018h, 051h, 0B3h, 006h, 08Dh, 04Ch, 024h, 014h, 088h, 09Ch, 024h, 058h, 001h
    db 000h, 000h
    call ??0?$StringBase@G@@AAE@ABV0@@Z
    db 08Bh, 00Dh
    dd ?R2Ptr012F19E8@@3PAVGen000290D2@@A
    db 08Dh, 054h, 024h, 010h, 052h, 08Dh, 044h, 024h, 018h, 050h, 0C6h, 084h, 024h, 05Ch, 001h, 000h
    db 000h, 007h
    call ?j_0000bdca@@YAXXZ
    db 08Dh, 04Ch, 024h, 010h, 088h, 09Ch, 024h, 054h, 001h, 000h, 000h
    call ?releaseBuffer@?$StringBase@G@@AAEXXZ
    db 0C6h, 084h, 024h, 054h, 001h, 000h, 000h, 001h, 08Dh, 04Ch, 024h, 014h
    call ?releaseBuffer@?$StringBase@D@@AAEXXZ
    db 068h
    dd g_Va0110B240
    db 08Dh, 04Ch, 024h, 018h
    call ??0?$StringBase@D@@AAE@PBD@Z
    db 08Dh, 04Ch, 024h, 018h, 051h, 0B3h, 008h, 08Dh, 04Ch, 024h, 014h, 088h, 09Ch, 024h, 058h, 001h
    db 000h, 000h
    call ??0?$StringBase@G@@AAE@ABV0@@Z
    db 08Bh, 00Dh
    dd ?R2Ptr012F19E8@@3PAVGen000290D2@@A
    db 08Dh, 054h, 024h, 010h, 052h, 08Dh, 044h, 024h, 018h, 050h, 0C6h, 084h, 024h, 05Ch, 001h, 000h
    db 000h, 009h
    call ?j_0000bdca@@YAXXZ
    db 08Dh, 04Ch, 024h, 010h, 088h, 09Ch, 024h, 054h, 001h, 000h, 000h
    call ?releaseBuffer@?$StringBase@G@@AAEXXZ
    db 08Dh, 04Ch, 024h, 014h, 0C6h, 084h, 024h, 054h, 001h, 000h, 000h, 001h
    call ?releaseBuffer@?$StringBase@D@@AAEXXZ
    db 068h
    dd g_Va0110B224
    db 08Dh, 04Ch, 024h, 018h
    call ??0?$StringBase@D@@AAE@PBD@Z
    db 08Dh, 04Ch, 024h, 018h, 051h, 08Dh, 04Ch, 024h, 014h, 0C6h, 084h, 024h, 058h, 001h, 000h, 000h
    db 00Ah
    call ??0?$StringBase@G@@AAE@ABV0@@Z
    db 08Bh, 00Dh
    dd ?R2Ptr012F19E8@@3PAVGen000290D2@@A
    db 08Dh, 054h, 024h, 010h, 052h, 08Dh, 044h, 024h, 018h, 050h, 0C6h, 084h, 024h, 05Ch, 001h, 000h
    db 000h, 00Bh
    call ?j_0000bdca@@YAXXZ
    db 08Dh, 04Ch, 024h, 010h, 0C6h, 084h, 024h, 054h, 001h, 000h, 000h, 00Ah
    call ?releaseBuffer@?$StringBase@G@@AAEXXZ
    db 08Dh, 04Ch, 024h, 014h, 0C6h, 084h, 024h, 054h, 001h, 000h, 000h, 001h
    call ?releaseBuffer@?$StringBase@D@@AAEXXZ
    db 068h
    dd g_Va0110B204
    db 08Dh, 04Ch, 024h, 018h
    call ??0?$StringBase@D@@AAE@PBD@Z
    db 08Dh, 04Ch, 024h, 018h, 051h, 0B3h, 00Ch, 08Dh, 04Ch, 024h, 014h, 088h, 09Ch, 024h, 058h, 001h
    db 000h, 000h
    call ??0?$StringBase@G@@AAE@ABV0@@Z
    db 08Bh, 00Dh
    dd ?R2Ptr012F19E8@@3PAVGen000290D2@@A
    db 08Dh, 054h, 024h, 010h, 052h, 08Dh, 044h, 024h, 018h, 050h, 0C6h, 084h, 024h, 05Ch, 001h, 000h
    db 000h, 00Dh
    call ?j_0000bdca@@YAXXZ
    db 08Dh, 04Ch, 024h, 010h, 088h, 09Ch, 024h, 054h, 001h, 000h, 000h
    call ?releaseBuffer@?$StringBase@G@@AAEXXZ
    db 08Dh, 04Ch, 024h, 014h, 0C6h, 084h, 024h, 054h, 001h, 000h, 000h, 001h
    call ?releaseBuffer@?$StringBase@D@@AAEXXZ
    db 068h
    dd g_Va0110B1E8
    db 08Dh, 04Ch, 024h, 018h
    call ??0?$StringBase@D@@AAE@PBD@Z
    db 08Dh, 04Ch, 024h, 018h, 0B3h, 00Eh, 051h, 088h, 09Ch, 024h, 058h, 001h, 000h, 000h, 08Dh, 04Ch
    db 024h, 014h
    call ??0?$StringBase@G@@AAE@ABV0@@Z
    db 08Bh, 00Dh
    dd ?R2Ptr012F19E8@@3PAVGen000290D2@@A
    db 08Dh, 054h, 024h, 010h, 052h, 08Dh, 044h, 024h, 018h, 050h, 0C6h, 084h, 024h, 05Ch, 001h, 000h
    db 000h, 00Fh
    call ?j_0000bdca@@YAXXZ
    db 08Dh, 04Ch, 024h, 010h, 088h, 09Ch, 024h, 054h, 001h, 000h, 000h
    call ?releaseBuffer@?$StringBase@G@@AAEXXZ
    db 08Dh, 04Ch, 024h, 014h, 0C6h, 084h, 024h, 054h, 001h, 000h, 000h, 001h
    call ?releaseBuffer@?$StringBase@D@@AAEXXZ
    db 068h
    dd g_Va0110B1CC
    db 08Dh, 04Ch, 024h, 018h
    call ??0?$StringBase@D@@AAE@PBD@Z
    db 08Dh, 04Ch, 024h, 018h, 051h, 0B3h, 010h, 08Dh, 04Ch, 024h, 014h, 088h, 09Ch, 024h, 058h, 001h
    db 000h, 000h
    call ??0?$StringBase@G@@AAE@ABV0@@Z
    db 08Bh, 00Dh
    dd ?R2Ptr012F19E8@@3PAVGen000290D2@@A
    db 08Dh, 054h, 024h, 010h, 052h, 08Dh, 044h, 024h, 018h, 050h, 0C6h, 084h, 024h, 05Ch, 001h, 000h
    db 000h, 011h
    call ?j_0000bdca@@YAXXZ
    db 08Dh, 04Ch, 024h, 010h, 088h, 09Ch, 024h, 054h, 001h, 000h, 000h
    call ?releaseBuffer@?$StringBase@G@@AAEXXZ
    db 08Dh, 04Ch, 024h, 014h, 0C6h, 084h, 024h, 054h, 001h, 000h, 000h, 001h
    call ?releaseBuffer@?$StringBase@D@@AAEXXZ
    db 068h
    dd g_Va0110B1B0
    db 08Dh, 04Ch, 024h, 018h
    call ??0?$StringBase@D@@AAE@PBD@Z
    db 08Dh, 04Ch, 024h, 018h, 051h, 0B3h, 012h, 08Dh, 04Ch, 024h, 014h, 088h, 09Ch, 024h, 058h, 001h
    db 000h, 000h
    call ??0?$StringBase@G@@AAE@ABV0@@Z
    db 08Bh, 00Dh
    dd ?R2Ptr012F19E8@@3PAVGen000290D2@@A
    db 08Dh, 054h, 024h, 010h, 052h, 08Dh, 044h, 024h, 018h, 050h, 0C6h, 084h, 024h, 05Ch, 001h, 000h
    db 000h, 013h
    call ?j_0000bdca@@YAXXZ
    db 08Dh, 04Ch, 024h, 010h, 088h, 09Ch, 024h, 054h, 001h, 000h, 000h
    call ?releaseBuffer@?$StringBase@G@@AAEXXZ
    db 08Dh, 04Ch, 024h, 014h, 0C6h, 084h, 024h, 054h, 001h, 000h, 000h, 001h
    call ?releaseBuffer@?$StringBase@D@@AAEXXZ
    db 068h
    dd g_Va0110B198
    db 08Dh, 04Ch, 024h, 018h
    call ??0?$StringBase@D@@AAE@PBD@Z
    db 08Dh, 04Ch, 024h, 018h, 051h, 0B3h, 014h, 08Dh, 04Ch, 024h, 014h, 088h, 09Ch, 024h, 058h, 001h
    db 000h, 000h
    call ??0?$StringBase@G@@AAE@ABV0@@Z
    db 08Bh, 00Dh
    dd ?R2Ptr012F19E8@@3PAVGen000290D2@@A
    db 08Dh, 054h, 024h, 010h, 052h, 08Dh, 044h, 024h, 018h, 050h, 0C6h, 084h, 024h, 05Ch, 001h, 000h
    db 000h, 015h
    call ?j_0000bdca@@YAXXZ
    db 08Dh, 04Ch, 024h, 010h, 088h, 09Ch, 024h, 054h, 001h, 000h, 000h
    call ?releaseBuffer@?$StringBase@G@@AAEXXZ
    db 08Dh, 04Ch, 024h, 014h, 0C6h, 084h, 024h, 054h, 001h, 000h, 000h, 001h
    call ?releaseBuffer@?$StringBase@D@@AAEXXZ
    db 08Bh, 044h, 024h, 024h, 03Bh, 0C5h, 074h, 005h, 083h, 0C0h, 008h, 0EBh, 005h, 0B8h
    dd ?BFMEEmptyUnicodeString@@3GB
    db 08Bh, 00Dh
    dd ?TheGameText@@3PAVBfmeGameText@@A
    db 08Bh, 011h, 050h, 051h, 08Bh, 0C4h, 089h, 064h, 024h, 024h, 055h, 068h
    dd g_Va0110B17C
    db 050h, 0FFh, 052h, 028h, 08Dh, 04Ch, 024h, 020h, 051h
    call ?format@UnicodeString@@QAAXV1@ZZ
    db 083h, 0C4h, 00Ch, 068h
    dd g_Va0110B17C
    db 08Dh, 04Ch, 024h, 018h
    call ??0?$StringBase@D@@AAE@PBD@Z
    db 08Dh, 054h, 024h, 018h, 0B3h, 016h, 052h, 08Dh, 04Ch, 024h, 014h, 088h, 09Ch, 024h, 058h, 001h
    db 000h, 000h
    call ??0?$StringBase@G@@AAE@ABV0@@Z
    db 08Dh, 044h, 024h, 010h, 050h, 08Dh, 04Ch, 024h, 018h, 051h, 08Bh, 00Dh
    dd ?R2Ptr012F19E8@@3PAVGen000290D2@@A
    db 0C6h, 084h, 024h, 05Ch, 001h, 000h, 000h, 017h
    call ?j_0000bdca@@YAXXZ
    db 08Dh, 04Ch, 024h, 010h, 088h, 09Ch, 024h, 054h, 001h, 000h, 000h
    call ?releaseBuffer@?$StringBase@G@@AAEXXZ
    db 08Dh, 04Ch, 024h, 014h, 0E9h, 060h, 00Fh, 000h, 000h, 08Bh, 00Dh
    dd ?Rva00579160TheCurrent@@3PAURva00579160Current@@A
    db 03Bh, 0CDh, 00Fh, 084h, 0C5h, 009h, 000h, 000h, 055h
    call ?j_0001ec18@@YAXXZ
    db 08Bh, 068h, 014h, 083h, 0FDh, 0FFh, 00Fh, 084h, 0B1h, 009h, 000h, 000h, 083h, 0FDh, 0FEh, 00Fh
    db 084h, 0A8h, 009h, 000h, 000h, 08Bh, 00Dh
    dd ?ThePlayerTemplateStore@@3PAVPlayerTemplateStore@@A
    db 055h
    call ?j_00037bd2@@YAXXZ
    db 083h, 0C0h, 008h, 050h, 08Dh, 04Ch, 024h, 024h
    call ??0?$StringBase@D@@AAE@ABV0@@Z
    db 08Dh, 054h, 024h, 028h, 08Dh, 0B7h, 0C4h, 003h, 000h, 000h, 052h, 08Bh, 0CEh, 0C6h, 084h, 024h
    db 058h, 001h, 000h, 000h, 031h
    call ?j_000232c2@@YAXXZ
    db 08Dh, 044h, 024h, 028h, 0B3h, 032h, 050h, 08Dh, 04Ch, 024h, 01Ch, 088h, 09Ch, 024h, 058h, 001h
    db 000h, 000h
    call ?translate@UnicodeString@@QAEXABVAsciiString@@@Z
    db 068h
    dd g_Va0110B27C
    db 08Dh, 04Ch, 024h, 018h
    call ??0?$StringBase@D@@AAE@PBD@Z
    db 08Dh, 04Ch, 024h, 018h, 051h, 08Dh, 04Ch, 024h, 014h, 0C6h, 084h, 024h, 058h, 001h, 000h, 000h
    db 033h
    call ??0?$StringBase@G@@AAE@ABV0@@Z
    db 08Bh, 00Dh
    dd ?R2Ptr012F19E8@@3PAVGen000290D2@@A
    db 08Dh, 054h, 024h, 010h, 052h, 08Dh, 044h, 024h, 018h, 050h, 0C6h, 084h, 024h, 05Ch, 001h, 000h
    db 000h, 034h
    call ?j_0000bdca@@YAXXZ
    db 08Dh, 04Ch, 024h, 010h, 0C6h, 084h, 024h, 054h, 001h, 000h, 000h, 033h
    call ?releaseBuffer@?$StringBase@G@@AAEXXZ
    db 08Dh, 04Ch, 024h, 014h, 088h, 09Ch, 024h, 054h, 001h, 000h, 000h
    call ?releaseBuffer@?$StringBase@D@@AAEXXZ
    db 051h, 08Bh, 0CCh, 089h, 064h, 024h, 020h, 051h, 08Dh, 08Fh, 0ACh, 003h, 000h, 000h
    call ?j_00010898@@YAXXZ
    db 08Dh, 054h, 024h, 01Ch, 052h
    call ?format@UnicodeString@@QAAXV1@ZZ
    db 083h, 0C4h, 008h, 068h
    dd g_Va01108AC4
    db 08Dh, 04Ch, 024h, 018h
    call ??0?$StringBase@D@@AAE@PBD@Z
    db 08Dh, 044h, 024h, 018h, 050h, 08Dh, 04Ch, 024h, 014h, 0C6h, 084h, 024h, 058h, 001h, 000h, 000h
    db 035h
    call ??0?$StringBase@G@@AAE@ABV0@@Z
    db 08Dh, 04Ch, 024h, 010h, 051h, 08Bh, 00Dh
    dd ?R2Ptr012F19E8@@3PAVGen000290D2@@A
    db 08Dh, 054h, 024h, 018h, 052h, 0C6h, 084h, 024h, 05Ch, 001h, 000h, 000h, 036h
    call ?j_0000bdca@@YAXXZ
    db 08Dh, 04Ch, 024h, 010h, 0C6h, 084h, 024h, 054h, 001h, 000h, 000h, 035h
    call ?releaseBuffer@?$StringBase@G@@AAEXXZ
    db 08Dh, 04Ch, 024h, 014h, 088h, 09Ch, 024h, 054h, 001h, 000h, 000h
    call ?releaseBuffer@?$StringBase@D@@AAEXXZ
    db 051h, 089h, 064h, 024h, 020h, 08Bh, 0CCh, 08Dh, 044h, 024h, 024h, 050h
    call ??0?$StringBase@D@@AAE@ABV0@@Z
    db 08Bh, 0CEh
    call ?j_00040192@@YAXXZ
    db 050h, 051h, 089h, 064h, 024h, 024h, 08Bh, 0CCh, 068h
    dd g_Va010F9F60
    call ??0?$StringBase@G@@AAE@PBG@Z
    db 08Dh, 04Ch, 024h, 020h, 051h
    call ?format@UnicodeString@@QAAXV1@ZZ
    db 083h, 0C4h, 00Ch, 068h
    dd g_Va0110B260
    db 08Dh, 04Ch, 024h, 018h
    call ??0?$StringBase@D@@AAE@PBD@Z
    db 08Dh, 054h, 024h, 018h, 052h, 08Dh, 04Ch, 024h, 014h, 0C6h, 084h, 024h, 058h, 001h, 000h, 000h
    db 037h
    call ??0?$StringBase@G@@AAE@ABV0@@Z
    db 08Dh, 044h, 024h, 010h, 050h, 08Dh, 04Ch, 024h, 018h, 051h, 08Bh, 00Dh
    dd ?R2Ptr012F19E8@@3PAVGen000290D2@@A
    db 0C6h, 084h, 024h, 05Ch, 001h, 000h, 000h, 038h
    call ?j_0000bdca@@YAXXZ
    db 08Dh, 04Ch, 024h, 010h, 0C6h, 084h, 024h, 054h, 001h, 000h, 000h, 037h
    call ?releaseBuffer@?$StringBase@G@@AAEXXZ
    db 08Dh, 04Ch, 024h, 014h, 088h, 09Ch, 024h, 054h, 001h, 000h, 000h
    call ?releaseBuffer@?$StringBase@D@@AAEXXZ
    db 051h, 08Dh, 054h, 024h, 024h, 089h, 064h, 024h, 020h, 08Bh, 0CCh, 052h
    call ??0?$StringBase@D@@AAE@ABV0@@Z
    db 08Bh, 0CEh
    call ?j_0001ce18@@YAXXZ
    db 050h, 051h, 089h, 064h, 024h, 024h, 08Bh, 0CCh, 068h
    dd g_Va010F9F60
    call ??0?$StringBase@G@@AAE@PBG@Z
    db 08Dh, 044h, 024h, 020h, 050h
    call ?format@UnicodeString@@QAAXV1@ZZ
    db 083h, 0C4h, 00Ch, 068h
    dd g_Va0110B240
    db 08Dh, 04Ch, 024h, 018h
    call ??0?$StringBase@D@@AAE@PBD@Z
    db 08Dh, 04Ch, 024h, 018h, 051h, 08Dh, 04Ch, 024h, 014h, 0C6h, 084h, 024h, 058h, 001h, 000h, 000h
    db 039h
    call ??0?$StringBase@G@@AAE@ABV0@@Z
    db 08Bh, 00Dh
    dd ?R2Ptr012F19E8@@3PAVGen000290D2@@A
    db 08Dh, 054h, 024h, 010h, 052h, 08Dh, 044h, 024h, 018h, 050h, 0C6h, 084h, 024h, 05Ch, 001h, 000h
    db 000h, 03Ah
    call ?j_0000bdca@@YAXXZ
    db 08Dh, 04Ch, 024h, 010h, 0C6h, 084h, 024h, 054h, 001h, 000h, 000h, 039h
    call ?releaseBuffer@?$StringBase@G@@AAEXXZ
    db 08Dh, 04Ch, 024h, 014h, 088h, 09Ch, 024h, 054h, 001h, 000h, 000h
    call ?releaseBuffer@?$StringBase@D@@AAEXXZ
    db 051h, 089h, 064h, 024h, 020h, 08Bh, 0CCh, 08Dh, 054h, 024h, 024h, 052h
    call ??0?$StringBase@D@@AAE@ABV0@@Z
    db 08Bh, 0CEh
    call ?j_00040192@@YAXXZ
    db 051h, 089h, 044h, 024h, 020h, 08Dh, 044h, 024h, 024h, 089h, 064h, 024h, 014h, 08Bh, 0CCh, 050h
    call ??0?$StringBase@D@@AAE@ABV0@@Z
    db 08Bh, 0CEh
    call ?j_0001ce18@@YAXXZ
    db 08Bh, 04Ch, 024h, 01Ch, 003h, 0C1h, 050h, 051h, 089h, 064h, 024h, 024h, 08Bh, 0CCh, 068h
    dd g_Va010F9F60
    call ??0?$StringBase@G@@AAE@PBG@Z
    db 08Dh, 054h, 024h, 020h, 052h
    call ?format@UnicodeString@@QAAXV1@ZZ
    db 083h, 0C4h, 00Ch, 068h
    dd g_Va0110B224
    db 08Dh, 04Ch, 024h, 018h
    call ??0?$StringBase@D@@AAE@PBD@Z
    db 08Dh, 044h, 024h, 018h, 050h, 08Dh, 04Ch, 024h, 014h, 0C6h, 084h, 024h, 058h, 001h, 000h, 000h
    db 03Bh
    call ??0?$StringBase@G@@AAE@ABV0@@Z
    db 08Dh, 04Ch, 024h, 010h, 051h, 08Bh, 00Dh
    dd ?R2Ptr012F19E8@@3PAVGen000290D2@@A
    db 08Dh, 054h, 024h, 018h, 052h, 0C6h, 084h, 024h, 05Ch, 001h, 000h, 000h, 03Ch
    call ?j_0000bdca@@YAXXZ
    db 08Dh, 04Ch, 024h, 010h, 0C6h, 084h, 024h, 054h, 001h, 000h, 000h, 03Bh
    call ?releaseBuffer@?$StringBase@G@@AAEXXZ
    db 08Dh, 04Ch, 024h, 014h, 088h, 09Ch, 024h, 054h, 001h, 000h, 000h
    call ?releaseBuffer@?$StringBase@D@@AAEXXZ
    db 051h, 08Dh, 044h, 024h, 024h, 089h, 064h, 024h, 020h, 08Bh, 0CCh, 050h
    call ??0?$StringBase@D@@AAE@ABV0@@Z
    db 08Bh, 0CEh
    call ?j_00022273@@YAXXZ
    db 050h, 051h, 089h, 064h, 024h, 024h, 08Bh, 0CCh, 068h
    dd g_Va010F9F60
    call ??0?$StringBase@G@@AAE@PBG@Z
    db 08Dh, 04Ch, 024h, 020h, 051h
    call ?format@UnicodeString@@QAAXV1@ZZ
    db 083h, 0C4h, 00Ch, 068h
    dd g_Va0110B204
    db 08Dh, 04Ch, 024h, 018h
    call ??0?$StringBase@D@@AAE@PBD@Z
    db 08Dh, 054h, 024h, 018h, 052h, 08Dh, 04Ch, 024h, 014h, 0C6h, 084h, 024h, 058h, 001h, 000h, 000h
    db 03Dh
    call ??0?$StringBase@G@@AAE@ABV0@@Z
    db 08Dh, 044h, 024h, 010h, 0C6h, 084h, 024h, 054h, 001h, 000h, 000h, 03Eh, 050h, 08Dh, 04Ch, 024h
    db 018h, 051h, 08Bh, 00Dh
    dd ?R2Ptr012F19E8@@3PAVGen000290D2@@A
    call ?j_0000bdca@@YAXXZ
    db 08Dh, 04Ch, 024h, 010h, 0C6h, 084h, 024h, 054h, 001h, 000h, 000h, 03Dh
    call ?releaseBuffer@?$StringBase@G@@AAEXXZ
    db 08Dh, 04Ch, 024h, 014h, 088h, 09Ch, 024h, 054h, 001h, 000h, 000h
    call ?releaseBuffer@?$StringBase@D@@AAEXXZ
    db 051h, 08Dh, 054h, 024h, 024h, 089h, 064h, 024h, 020h, 08Bh, 0CCh, 052h
    call ??0?$StringBase@D@@AAE@ABV0@@Z
    db 08Bh, 0CEh
    call ?j_0003f472@@YAXXZ
    db 050h, 051h, 089h, 064h, 024h, 024h, 08Bh, 0CCh, 068h
    dd g_Va010F9F60
    call ??0?$StringBase@G@@AAE@PBG@Z
    db 08Dh, 044h, 024h, 020h, 050h
    call ?format@UnicodeString@@QAAXV1@ZZ
    db 083h, 0C4h, 00Ch, 068h
    dd g_Va0110B1E8
    db 08Dh, 04Ch, 024h, 018h
    call ??0?$StringBase@D@@AAE@PBD@Z
    db 08Dh, 04Ch, 024h, 018h, 051h, 08Dh, 04Ch, 024h, 014h, 0C6h, 084h, 024h, 058h, 001h, 000h, 000h
    db 03Fh
    call ??0?$StringBase@G@@AAE@ABV0@@Z
    db 08Bh, 00Dh
    dd ?R2Ptr012F19E8@@3PAVGen000290D2@@A
    db 08Dh, 054h, 024h, 010h, 052h, 08Dh, 044h, 024h, 018h, 050h, 0C6h, 084h, 024h, 05Ch, 001h, 000h
    db 000h, 040h
    call ?j_0000bdca@@YAXXZ
    db 08Dh, 04Ch, 024h, 010h, 0C6h, 084h, 024h, 054h, 001h, 000h, 000h, 03Fh
    call ?releaseBuffer@?$StringBase@G@@AAEXXZ
    db 08Dh, 04Ch, 024h, 014h, 088h, 09Ch, 024h, 054h, 001h, 000h, 000h
    call ?releaseBuffer@?$StringBase@D@@AAEXXZ
    db 051h, 08Dh, 054h, 024h, 024h, 089h, 064h, 024h, 020h, 08Bh, 0CCh, 052h
    call ??0?$StringBase@D@@AAE@ABV0@@Z
    db 08Bh, 0CEh
    call ?j_00023d53@@YAXXZ
    db 0D9h, 05Ch, 024h, 01Ch, 051h, 08Bh, 04Ch, 024h, 020h, 08Bh, 0C4h, 089h, 064h, 024h, 014h, 051h
    db 050h, 08Bh, 0CEh
    call ?j_00022c23@@YAXXZ
    db 08Dh, 054h, 024h, 01Ch, 052h
    call ?format@UnicodeString@@QAAXV1@ZZ
    db 083h, 0C4h, 008h, 068h
    dd g_Va0110B1CC
    db 08Dh, 04Ch, 024h, 018h
    call ??0?$StringBase@D@@AAE@PBD@Z
    db 08Dh, 044h, 024h, 018h, 050h, 08Dh, 04Ch, 024h, 014h, 0C6h, 084h, 024h, 058h, 001h, 000h, 000h
    db 041h
    call ??0?$StringBase@G@@AAE@ABV0@@Z
    db 08Dh, 04Ch, 024h, 010h, 051h, 08Bh, 00Dh
    dd ?R2Ptr012F19E8@@3PAVGen000290D2@@A
    db 08Dh, 054h, 024h, 018h, 052h, 0C6h, 084h, 024h, 05Ch, 001h, 000h, 000h, 042h
    call ?j_0000bdca@@YAXXZ
    db 08Dh, 04Ch, 024h, 010h, 0C6h, 084h, 024h, 054h, 001h, 000h, 000h, 041h
    call ?releaseBuffer@?$StringBase@G@@AAEXXZ
    db 08Dh, 04Ch, 024h, 014h, 088h, 09Ch, 024h, 054h, 001h, 000h, 000h
    call ?releaseBuffer@?$StringBase@D@@AAEXXZ
    db 08Dh, 044h, 024h, 020h, 050h, 08Dh, 04Ch, 024h, 01Ch
    call ?translate@UnicodeString@@QAEXABVAsciiString@@@Z
    db 083h, 0FDh, 004h, 075h, 075h, 08Bh, 00Dh
    dd ?TheGameText@@3PAVBfmeGameText@@A
    db 08Bh, 011h, 051h, 08Bh, 0C4h, 089h, 064h, 024h, 020h, 06Ah, 000h, 068h
    dd g_Va0110B168
    db 050h, 0FFh, 052h, 028h, 08Dh, 04Ch, 024h, 01Ch, 051h
    call ?format@UnicodeString@@QAAXV1@ZZ
    db 083h, 0C4h, 008h, 068h
    dd g_Va0110B1B0
    db 08Dh, 04Ch, 024h, 018h
    call ??0?$StringBase@D@@AAE@PBD@Z
    db 08Dh, 054h, 024h, 018h, 052h, 08Dh, 04Ch, 024h, 014h, 0C6h, 084h, 024h, 058h, 001h, 000h, 000h
    db 043h
    call ??0?$StringBase@G@@AAE@ABV0@@Z
    db 08Dh, 044h, 024h, 010h, 050h, 08Dh, 04Ch, 024h, 018h, 051h, 08Bh, 00Dh
    dd ?R2Ptr012F19E8@@3PAVGen000290D2@@A
    db 0C6h, 084h, 024h, 05Ch, 001h, 000h, 000h, 044h
    call ?j_0000bdca@@YAXXZ
    db 0C6h, 084h, 024h, 054h, 001h, 000h, 000h, 043h, 0E9h, 06Ah, 001h, 000h, 000h, 083h, 0FDh, 003h
    db 075h, 075h, 08Bh, 00Dh
    dd ?TheGameText@@3PAVBfmeGameText@@A
    db 08Bh, 011h, 051h, 08Bh, 0C4h, 089h, 064h, 024h, 020h, 06Ah, 000h, 068h
    dd g_Va0110B158
    db 050h, 0FFh, 052h, 028h, 08Dh, 04Ch, 024h, 01Ch, 051h
    call ?format@UnicodeString@@QAAXV1@ZZ
    db 083h, 0C4h, 008h, 068h
    dd g_Va0110B1B0
    db 08Dh, 04Ch, 024h, 018h
    call ??0?$StringBase@D@@AAE@PBD@Z
    db 08Dh, 054h, 024h, 018h, 052h, 08Dh, 04Ch, 024h, 014h, 0C6h, 084h, 024h, 058h, 001h, 000h, 000h
    db 045h
    call ??0?$StringBase@G@@AAE@ABV0@@Z
    db 08Dh, 044h, 024h, 010h, 050h, 08Dh, 04Ch, 024h, 018h, 051h, 08Bh, 00Dh
    dd ?R2Ptr012F19E8@@3PAVGen000290D2@@A
    db 0C6h, 084h, 024h, 05Ch, 001h, 000h, 000h, 046h
    call ?j_0000bdca@@YAXXZ
    db 0C6h, 084h, 024h, 054h, 001h, 000h, 000h, 045h, 0E9h, 0F0h, 000h, 000h, 000h, 083h, 0FDh, 005h
    db 075h, 072h, 08Bh, 00Dh
    dd ?TheGameText@@3PAVBfmeGameText@@A
    db 08Bh, 011h, 051h, 08Bh, 0C4h, 089h, 064h, 024h, 020h, 06Ah, 000h, 068h
    dd g_Va0110B144
    db 050h, 0FFh, 052h, 028h, 08Dh, 04Ch, 024h, 01Ch, 051h
    call ?format@UnicodeString@@QAAXV1@ZZ
    db 083h, 0C4h, 008h, 068h
    dd g_Va0110B1B0
    db 08Dh, 04Ch, 024h, 018h
    call ??0?$StringBase@D@@AAE@PBD@Z
    db 08Dh, 054h, 024h, 018h, 052h, 08Dh, 04Ch, 024h, 014h, 0C6h, 084h, 024h, 058h, 001h, 000h, 000h
    db 047h
    call ??0?$StringBase@G@@AAE@ABV0@@Z
    db 08Dh, 044h, 024h, 010h, 050h, 08Dh, 04Ch, 024h, 018h, 051h, 08Bh, 00Dh
    dd ?R2Ptr012F19E8@@3PAVGen000290D2@@A
    db 0C6h, 084h, 024h, 05Ch, 001h, 000h, 000h, 048h
    call ?j_0000bdca@@YAXXZ
    db 0C6h, 084h, 024h, 054h, 001h, 000h, 000h, 047h, 0EBh, 079h, 083h, 0FDh, 006h, 00Fh, 085h, 089h
    db 000h, 000h, 000h, 08Bh, 00Dh
    dd ?TheGameText@@3PAVBfmeGameText@@A
    db 08Bh, 011h, 051h, 08Bh, 0C4h, 089h, 064h, 024h, 020h, 06Ah, 000h, 068h
    dd g_Va0110B130
    db 050h, 0FFh, 052h, 028h, 08Dh, 04Ch, 024h, 01Ch, 051h
    call ?format@UnicodeString@@QAAXV1@ZZ
    db 083h, 0C4h, 008h, 068h
    dd g_Va0110B1B0
    db 08Dh, 04Ch, 024h, 018h
    call ??0?$StringBase@D@@AAE@PBD@Z
    db 08Dh, 054h, 024h, 018h, 052h, 08Dh, 04Ch, 024h, 014h, 0C6h, 084h, 024h, 058h, 001h, 000h, 000h
    db 049h
    call ??0?$StringBase@G@@AAE@ABV0@@Z
    db 08Dh, 044h, 024h, 010h, 050h, 08Dh, 04Ch, 024h, 018h, 051h, 08Bh, 00Dh
    dd ?R2Ptr012F19E8@@3PAVGen000290D2@@A
    db 0C6h, 084h, 024h, 05Ch, 001h, 000h, 000h, 04Ah
    call ?j_0000bdca@@YAXXZ
    db 0C6h, 084h, 024h, 054h, 001h, 000h, 000h, 049h, 08Dh, 04Ch, 024h, 010h
    call ?releaseBuffer@?$StringBase@G@@AAEXXZ
    db 08Dh, 04Ch, 024h, 014h, 088h, 09Ch, 024h, 054h, 001h, 000h, 000h
    call ?releaseBuffer@?$StringBase@D@@AAEXXZ
    db 06Ah, 00Ah, 08Dh, 054h, 024h, 040h, 052h, 055h, 0FFh, 015h
    dd __imp___itoa
    db 08Bh, 087h, 050h, 002h, 000h, 000h, 083h, 0C4h, 00Ch, 06Ah, 000h, 06Ah, 000h, 06Ah, 000h, 06Ah
    db 000h, 08Dh, 04Ch, 024h, 04Ch, 051h, 08Bh, 00Dh
    dd ?R2Ptr012F19E8@@3PAVGen000290D2@@A
    db 06Ah, 001h, 068h
    dd g_Va0110B118
    db 050h
    call ?j_00015235@@YAXXZ
    db 051h, 08Dh, 054h, 024h, 024h, 089h, 064h, 024h, 020h, 08Bh, 0CCh, 052h
    call ??0?$StringBase@D@@AAE@ABV0@@Z
    db 08Bh, 0CEh
    call ?j_00027093@@YAXXZ
    db 08Bh, 00Dh
    dd ?TheGameText@@3PAVBfmeGameText@@A
    db 08Bh, 0E8h, 08Bh, 001h, 055h, 051h, 08Bh, 0D4h, 089h, 064h, 024h, 024h, 06Ah, 000h, 068h
    dd g_Va01107E28
    db 052h, 0FFh, 050h, 028h, 08Dh, 044h, 024h, 020h, 050h
    call ?format@UnicodeString@@QAAXV1@ZZ
    db 083h, 0C4h, 00Ch, 068h
    dd g_Va0110B17C
    db 08Dh, 04Ch, 024h, 018h
    call ??0?$StringBase@D@@AAE@PBD@Z
    db 08Dh, 04Ch, 024h, 018h, 051h, 08Dh, 04Ch, 024h, 014h, 0C6h, 084h, 024h, 058h, 001h, 000h, 000h
    db 04Bh
    call ??0?$StringBase@G@@AAE@ABV0@@Z
    db 08Bh, 00Dh
    dd ?R2Ptr012F19E8@@3PAVGen000290D2@@A
    db 08Dh, 054h, 024h, 010h, 052h, 08Dh, 044h, 024h, 018h, 050h, 0C6h, 084h, 024h, 05Ch, 001h, 000h
    db 000h, 04Ch
    call ?j_0000bdca@@YAXXZ
    db 08Dh, 04Ch, 024h, 010h, 0C6h, 084h, 024h, 054h, 001h, 000h, 000h, 04Bh
    call ?releaseBuffer@?$StringBase@G@@AAEXXZ
    db 08Dh, 04Ch, 024h, 014h, 088h, 09Ch, 024h, 054h, 001h, 000h, 000h
    call ?releaseBuffer@?$StringBase@D@@AAEXXZ
    db 055h, 051h, 08Dh, 054h, 024h, 028h, 089h, 064h, 024h, 024h, 08Bh, 0CCh, 052h
    call ??0?$StringBase@D@@AAE@ABV0@@Z
    db 08Bh, 0CEh
    call ?j_0002639b@@YAXXZ
    db 083h, 0F8h, 001h, 08Bh, 00Dh
    dd ?TheGameText@@3PAVBfmeGameText@@A
    db 075h, 01Ch, 050h, 08Bh, 001h, 051h, 08Bh, 0D4h, 089h, 064h, 024h, 024h, 06Ah, 000h, 068h
    dd g_Va0110B0F4
    db 052h, 0FFh, 050h, 028h, 08Dh, 044h, 024h, 020h, 050h, 0EBh, 01Ah, 08Bh, 011h, 050h, 051h, 08Bh
    db 0C4h, 089h, 064h, 024h, 024h, 06Ah, 000h, 068h
    dd g_Va0110B0DC
    db 050h, 0FFh, 052h, 028h, 08Dh, 04Ch, 024h, 020h, 051h
    call ?format@UnicodeString@@QAAXV1@ZZ
    db 083h, 0C4h, 00Ch, 068h
    dd g_Va0110B198
    db 08Dh, 04Ch, 024h, 018h
    call ??0?$StringBase@D@@AAE@PBD@Z
    db 08Dh, 054h, 024h, 018h, 052h, 08Dh, 04Ch, 024h, 014h, 0C6h, 084h, 024h, 058h, 001h, 000h, 000h
    db 04Dh
    call ??0?$StringBase@G@@AAE@ABV0@@Z
    db 08Dh, 044h, 024h, 010h, 050h, 08Dh, 04Ch, 024h, 018h, 051h, 08Bh, 00Dh
    dd ?R2Ptr012F19E8@@3PAVGen000290D2@@A
    db 0C6h, 084h, 024h, 05Ch, 001h, 000h, 000h, 04Eh
    call ?j_0000bdca@@YAXXZ
    db 08Dh, 04Ch, 024h, 010h, 0C6h, 084h, 024h, 054h, 001h, 000h, 000h, 04Dh
    call ?releaseBuffer@?$StringBase@G@@AAEXXZ
    db 08Dh, 04Ch, 024h, 014h, 088h, 09Ch, 024h, 054h, 001h, 000h, 000h
    call ?releaseBuffer@?$StringBase@D@@AAEXXZ
    db 055h, 051h, 08Dh, 054h, 024h, 028h, 089h, 064h, 024h, 024h, 08Bh, 0CCh, 052h
    call ??0?$StringBase@D@@AAE@ABV0@@Z
    db 08Bh, 0CEh
    call ?j_0001d345@@YAXXZ
    db 055h, 051h, 08Bh, 0D8h, 08Dh, 044h, 024h, 028h, 089h, 064h, 024h, 024h, 08Bh, 0CCh, 050h
    call ??0?$StringBase@D@@AAE@ABV0@@Z
    db 08Bh, 0CEh
    call ?j_0002639b@@YAXXZ
    db 055h, 051h, 08Dh, 054h, 024h, 028h, 089h, 064h, 024h, 018h, 08Bh, 0CCh, 052h, 089h, 044h, 024h
    db 028h
    call ??0?$StringBase@D@@AAE@ABV0@@Z
    db 08Bh, 0CEh
    call ?j_0001d345@@YAXXZ
    db 02Bh, 05Ch, 024h, 01Ch, 089h, 05Ch, 024h, 01Ch, 0DBh, 044h, 024h, 01Ch, 089h, 044h, 024h, 010h
    db 0DAh, 074h, 024h, 010h, 0D8h, 00Dh
    dd ?g_bfmeScaleBC@@3MA
    call __ftol2
    db 085h, 0C0h, 089h, 044h, 024h, 010h, 0C7h, 044h, 024h, 014h, 064h, 000h, 000h, 000h, 0C7h, 044h
    db 024h, 01Ch, 000h, 000h, 000h, 000h, 07Dh, 008h, 08Dh, 04Ch, 024h, 01Ch, 08Bh, 0C1h, 0EBh, 011h
    db 083h, 0F8h, 064h, 08Dh, 04Ch, 024h, 010h, 07Dh, 004h, 08Bh, 0C1h, 0EBh, 004h, 08Dh, 044h, 024h
    db 014h, 08Bh, 000h, 06Ah, 00Ah, 08Dh, 04Ch, 024h, 050h, 051h, 050h, 0FFh, 015h
    dd __imp___itoa
    db 08Bh, 087h, 050h, 002h, 000h, 000h, 08Bh, 00Dh
    dd ?R2Ptr012F19E8@@3PAVGen000290D2@@A
    db 083h, 0C4h, 00Ch, 06Ah, 000h, 06Ah, 000h, 06Ah, 000h, 06Ah, 000h, 08Dh, 054h, 024h, 05Ch, 052h
    db 06Ah, 001h, 068h
    dd g_Va0110B0C8
    db 050h
    call ?j_00015235@@YAXXZ
    db 0A1h
    dd ?Rva012B8054Image@@3PBDB
    db 050h, 051h, 08Dh, 054h, 024h, 028h, 089h, 064h, 024h, 024h, 08Bh, 0CCh, 052h
    call ??0?$StringBase@D@@AAE@ABV0@@Z
    db 08Bh, 0CFh
    call ?j_00028c2c@@YAXXZ
    db 08Dh, 04Ch, 024h, 028h, 0C6h, 084h, 024h, 054h, 001h, 000h, 000h, 031h
    call ?releaseBuffer@?$StringBase@D@@AAEXXZ
    db 08Dh, 04Ch, 024h, 020h, 0E9h, 08Fh, 005h, 000h, 000h, 033h, 0EDh, 08Dh, 044h, 024h, 01Ch, 050h
    db 08Dh, 08Fh, 0C4h, 003h, 000h, 000h
    call ?j_000232c2@@YAXXZ
    db 08Dh, 04Ch, 024h, 01Ch, 051h, 0B3h, 018h, 08Dh, 04Ch, 024h, 01Ch, 088h, 09Ch, 024h, 058h, 001h
    db 000h, 000h
    call ?translate@UnicodeString@@QAEXABVAsciiString@@@Z
    db 068h
    dd g_Va0110B27C
    db 08Dh, 04Ch, 024h, 018h
    call ??0?$StringBase@D@@AAE@PBD@Z
    db 08Dh, 054h, 024h, 018h, 052h, 08Dh, 04Ch, 024h, 014h, 0C6h, 084h, 024h, 058h, 001h, 000h, 000h
    db 019h
    call ??0?$StringBase@G@@AAE@ABV0@@Z
    db 08Dh, 044h, 024h, 010h, 050h, 08Dh, 04Ch, 024h, 018h, 051h, 08Bh, 00Dh
    dd ?R2Ptr012F19E8@@3PAVGen000290D2@@A
    db 0C6h, 084h, 024h, 05Ch, 001h, 000h, 000h, 01Ah
    call ?j_0000bdca@@YAXXZ
    db 08Dh, 04Ch, 024h, 010h, 0C6h, 084h, 024h, 054h, 001h, 000h, 000h, 019h
    call ?releaseBuffer@?$StringBase@G@@AAEXXZ
    db 08Dh, 04Ch, 024h, 014h, 088h, 09Ch, 024h, 054h, 001h, 000h, 000h
    call ?releaseBuffer@?$StringBase@D@@AAEXXZ
    db 051h, 08Bh, 0D4h, 089h, 064h, 024h, 014h, 052h, 08Bh, 0CEh
    call ?j_00010898@@YAXXZ
    db 08Dh, 044h, 024h, 01Ch, 050h
    call ?format@UnicodeString@@QAAXV1@ZZ
    db 083h, 0C4h, 008h, 068h
    dd g_Va01108AC4
    db 08Dh, 04Ch, 024h, 018h
    call ??0?$StringBase@D@@AAE@PBD@Z
    db 08Dh, 04Ch, 024h, 018h, 051h, 08Dh, 04Ch, 024h, 014h, 0C6h, 084h, 024h, 058h, 001h, 000h, 000h
    db 01Bh
    call ??0?$StringBase@G@@AAE@ABV0@@Z
    db 08Bh, 00Dh
    dd ?R2Ptr012F19E8@@3PAVGen000290D2@@A
    db 08Dh, 054h, 024h, 010h, 052h, 08Dh, 044h, 024h, 018h, 050h, 0C6h, 084h, 024h, 05Ch, 001h, 000h
    db 000h, 01Ch
    call ?j_0000bdca@@YAXXZ
    db 08Dh, 04Ch, 024h, 010h, 0C6h, 084h, 024h, 054h, 001h, 000h, 000h, 01Bh
    call ?releaseBuffer@?$StringBase@G@@AAEXXZ
    db 08Dh, 04Ch, 024h, 014h, 088h, 09Ch, 024h, 054h, 001h, 000h, 000h
    call ?releaseBuffer@?$StringBase@D@@AAEXXZ
    db 051h, 08Dh, 054h, 024h, 028h, 089h, 064h, 024h, 014h, 08Bh, 0CCh, 052h
    call ??0?$StringBase@G@@AAE@ABV0@@Z
    db 08Dh, 044h, 024h, 01Ch, 050h
    call ?format@UnicodeString@@QAAXV1@ZZ
    db 083h, 0C4h, 008h, 068h
    dd g_Va0110B260
    db 08Dh, 04Ch, 024h, 018h
    call ??0?$StringBase@D@@AAE@PBD@Z
    db 08Dh, 04Ch, 024h, 018h, 051h, 08Dh, 04Ch, 024h, 014h, 0C6h, 084h, 024h, 058h, 001h, 000h, 000h
    db 01Dh
    call ??0?$StringBase@G@@AAE@ABV0@@Z
    db 08Bh, 00Dh
    dd ?R2Ptr012F19E8@@3PAVGen000290D2@@A
    db 08Dh, 054h, 024h, 010h, 052h, 08Dh, 044h, 024h, 018h, 050h, 0C6h, 084h, 024h, 05Ch, 001h, 000h
    db 000h, 01Eh
    call ?j_0000bdca@@YAXXZ
    db 08Dh, 04Ch, 024h, 010h, 0C6h, 084h, 024h, 054h, 001h, 000h, 000h, 01Dh
    call ?releaseBuffer@?$StringBase@G@@AAEXXZ
    db 08Dh, 04Ch, 024h, 014h, 088h, 09Ch, 024h, 054h, 001h, 000h, 000h
    call ?releaseBuffer@?$StringBase@D@@AAEXXZ
    db 068h
    dd g_Va0110B240
    db 08Dh, 04Ch, 024h, 018h
    call ??0?$StringBase@D@@AAE@PBD@Z
    db 08Dh, 04Ch, 024h, 018h, 051h, 08Dh, 04Ch, 024h, 014h, 0C6h, 084h, 024h, 058h, 001h, 000h, 000h
    db 01Fh
    call ??0?$StringBase@G@@AAE@ABV0@@Z
    db 08Bh, 00Dh
    dd ?R2Ptr012F19E8@@3PAVGen000290D2@@A
    db 08Dh, 054h, 024h, 010h, 052h, 08Dh, 044h, 024h, 018h, 050h, 0C6h, 084h, 024h, 05Ch, 001h, 000h
    db 000h, 020h
    call ?j_0000bdca@@YAXXZ
    db 08Dh, 04Ch, 024h, 010h, 0C6h, 084h, 024h, 054h, 001h, 000h, 000h, 01Fh
    call ?releaseBuffer@?$StringBase@G@@AAEXXZ
    db 08Dh, 04Ch, 024h, 014h, 088h, 09Ch, 024h, 054h, 001h, 000h, 000h
    call ?releaseBuffer@?$StringBase@D@@AAEXXZ
    db 068h
    dd g_Va0110B224
    db 08Dh, 04Ch, 024h, 018h
    call ??0?$StringBase@D@@AAE@PBD@Z
    db 08Dh, 04Ch, 024h, 018h, 051h, 08Dh, 04Ch, 024h, 014h, 0C6h, 084h, 024h, 058h, 001h, 000h, 000h
    db 021h
    call ??0?$StringBase@G@@AAE@ABV0@@Z
    db 08Bh, 00Dh
    dd ?R2Ptr012F19E8@@3PAVGen000290D2@@A
    db 08Dh, 054h, 024h, 010h, 052h, 08Dh, 044h, 024h, 018h, 050h, 0C6h, 084h, 024h, 05Ch, 001h, 000h
    db 000h, 022h
    call ?j_0000bdca@@YAXXZ
    db 08Dh, 04Ch, 024h, 010h, 0C6h, 084h, 024h, 054h, 001h, 000h, 000h, 021h
    call ?releaseBuffer@?$StringBase@G@@AAEXXZ
    db 08Dh, 04Ch, 024h, 014h, 088h, 09Ch, 024h, 054h, 001h, 000h, 000h
    call ?releaseBuffer@?$StringBase@D@@AAEXXZ
    db 068h
    dd g_Va0110B204
    db 08Dh, 04Ch, 024h, 018h
    call ??0?$StringBase@D@@AAE@PBD@Z
    db 08Dh, 04Ch, 024h, 018h, 051h, 08Dh, 04Ch, 024h, 014h, 0C6h, 084h, 024h, 058h, 001h, 000h, 000h
    db 023h
    call ??0?$StringBase@G@@AAE@ABV0@@Z
    db 08Bh, 00Dh
    dd ?R2Ptr012F19E8@@3PAVGen000290D2@@A
    db 08Dh, 054h, 024h, 010h, 052h, 08Dh, 044h, 024h, 018h, 0C6h, 084h, 024h, 058h, 001h, 000h, 000h
    db 024h, 050h
    call ?j_0000bdca@@YAXXZ
    db 08Dh, 04Ch, 024h, 010h, 0C6h, 084h, 024h, 054h, 001h, 000h, 000h, 023h
    call ?releaseBuffer@?$StringBase@G@@AAEXXZ
    db 08Dh, 04Ch, 024h, 014h, 088h, 09Ch, 024h, 054h, 001h, 000h, 000h
    call ?releaseBuffer@?$StringBase@D@@AAEXXZ
    db 068h
    dd g_Va0110B1E8
    db 08Dh, 04Ch, 024h, 018h
    call ??0?$StringBase@D@@AAE@PBD@Z
    db 08Dh, 04Ch, 024h, 018h, 051h, 08Dh, 04Ch, 024h, 014h, 0C6h, 084h, 024h, 058h, 001h, 000h, 000h
    db 025h
    call ??0?$StringBase@G@@AAE@ABV0@@Z
    db 08Bh, 00Dh
    dd ?R2Ptr012F19E8@@3PAVGen000290D2@@A
    db 08Dh, 054h, 024h, 010h, 052h, 08Dh, 044h, 024h, 018h, 050h, 0C6h, 084h, 024h, 05Ch, 001h, 000h
    db 000h, 026h
    call ?j_0000bdca@@YAXXZ
    db 08Dh, 04Ch, 024h, 010h, 0C6h, 084h, 024h, 054h, 001h, 000h, 000h, 025h
    call ?releaseBuffer@?$StringBase@G@@AAEXXZ
    db 08Dh, 04Ch, 024h, 014h, 088h, 09Ch, 024h, 054h, 001h, 000h, 000h
    call ?releaseBuffer@?$StringBase@D@@AAEXXZ
    db 068h
    dd g_Va0110B1CC
    db 08Dh, 04Ch, 024h, 018h
    call ??0?$StringBase@D@@AAE@PBD@Z
    db 08Dh, 04Ch, 024h, 018h, 051h, 08Dh, 04Ch, 024h, 014h, 0C6h, 084h, 024h, 058h, 001h, 000h, 000h
    db 027h
    call ??0?$StringBase@G@@AAE@ABV0@@Z
    db 08Bh, 00Dh
    dd ?R2Ptr012F19E8@@3PAVGen000290D2@@A
    db 08Dh, 054h, 024h, 010h, 052h, 08Dh, 044h, 024h, 018h, 050h, 0C6h, 084h, 024h, 05Ch, 001h, 000h
    db 000h, 028h
    call ?j_0000bdca@@YAXXZ
    db 08Dh, 04Ch, 024h, 010h, 0C6h, 084h, 024h, 054h, 001h, 000h, 000h, 027h
    call ?releaseBuffer@?$StringBase@G@@AAEXXZ
    db 08Dh, 04Ch, 024h, 014h, 088h, 09Ch, 024h, 054h, 001h, 000h, 000h
    call ?releaseBuffer@?$StringBase@D@@AAEXXZ
    db 068h
    dd g_Va0110B1B0
    db 08Dh, 04Ch, 024h, 018h
    call ??0?$StringBase@D@@AAE@PBD@Z
    db 08Dh, 04Ch, 024h, 018h, 051h, 08Dh, 04Ch, 024h, 014h, 0C6h, 084h, 024h, 058h, 001h, 000h, 000h
    db 029h
    call ??0?$StringBase@G@@AAE@ABV0@@Z
    db 08Bh, 00Dh
    dd ?R2Ptr012F19E8@@3PAVGen000290D2@@A
    db 08Dh, 054h, 024h, 010h, 052h, 08Dh, 044h, 024h, 018h, 050h, 0C6h, 084h, 024h, 05Ch, 001h, 000h
    db 000h, 02Ah
    call ?j_0000bdca@@YAXXZ
    db 08Dh, 04Ch, 024h, 010h, 0C6h, 084h, 024h, 054h, 001h, 000h, 000h, 029h
    call ?releaseBuffer@?$StringBase@G@@AAEXXZ
    db 08Dh, 04Ch, 024h, 014h, 088h, 09Ch, 024h, 054h, 001h, 000h, 000h
    call ?releaseBuffer@?$StringBase@D@@AAEXXZ
    db 068h
    dd g_Va0110B198
    db 08Dh, 04Ch, 024h, 018h
    call ??0?$StringBase@D@@AAE@PBD@Z
    db 0C6h, 084h, 024h, 054h, 001h, 000h, 000h, 02Bh, 08Dh, 04Ch, 024h, 018h, 051h, 08Dh, 04Ch, 024h
    db 014h
    call ??0?$StringBase@G@@AAE@ABV0@@Z
    db 08Bh, 00Dh
    dd ?R2Ptr012F19E8@@3PAVGen000290D2@@A
    db 08Dh, 054h, 024h, 010h, 052h, 08Dh, 044h, 024h, 018h, 050h, 0C6h, 084h, 024h, 05Ch, 001h, 000h
    db 000h, 02Ch
    call ?j_0000bdca@@YAXXZ
    db 08Dh, 04Ch, 024h, 010h, 0C6h, 084h, 024h, 054h, 001h, 000h, 000h, 02Bh
    call ?releaseBuffer@?$StringBase@G@@AAEXXZ
    db 08Dh, 04Ch, 024h, 014h, 088h, 09Ch, 024h, 054h, 001h, 000h, 000h
    call ?releaseBuffer@?$StringBase@D@@AAEXXZ
    db 08Bh, 044h, 024h, 024h, 03Bh, 0C5h, 074h, 005h, 083h, 0C0h, 008h, 0EBh, 005h, 0B8h
    dd ?BFMEEmptyUnicodeString@@3GB
    db 08Bh, 00Dh
    dd ?TheGameText@@3PAVBfmeGameText@@A
    db 08Bh, 011h, 050h, 051h, 08Bh, 0C4h, 089h, 064h, 024h, 018h, 055h, 068h
    dd g_Va0110B17C
    db 050h, 0FFh, 052h, 028h, 08Dh, 04Ch, 024h, 020h, 051h
    call ?format@UnicodeString@@QAAXV1@ZZ
    db 083h, 0C4h, 00Ch, 068h
    dd g_Va0110B17C
    db 08Dh, 04Ch, 024h, 018h
    call ??0?$StringBase@D@@AAE@PBD@Z
    db 08Dh, 054h, 024h, 018h, 052h, 08Dh, 04Ch, 024h, 014h, 0C6h, 084h, 024h, 058h, 001h, 000h, 000h
    db 02Dh
    call ??0?$StringBase@G@@AAE@ABV0@@Z
    db 08Dh, 044h, 024h, 010h, 050h, 08Dh, 04Ch, 024h, 018h, 051h, 08Bh, 00Dh
    dd ?R2Ptr012F19E8@@3PAVGen000290D2@@A
    db 0C6h, 084h, 024h, 05Ch, 001h, 000h, 000h, 02Eh
    call ?j_0000bdca@@YAXXZ
    db 08Dh, 04Ch, 024h, 010h, 0C6h, 084h, 024h, 054h, 001h, 000h, 000h, 02Dh
    call ?releaseBuffer@?$StringBase@G@@AAEXXZ
    db 08Dh, 04Ch, 024h, 014h, 088h, 09Ch, 024h, 054h, 001h, 000h, 000h
    call ?releaseBuffer@?$StringBase@D@@AAEXXZ
    db 06Ah, 00Ah, 08Dh, 054h, 024h, 030h, 052h, 055h, 0FFh, 015h
    dd __imp___itoa
    db 08Bh, 087h, 050h, 002h, 000h, 000h, 083h, 0C4h, 00Ch, 055h, 055h, 055h, 055h, 08Dh, 04Ch, 024h
    db 03Ch, 051h, 08Bh, 00Dh
    dd ?R2Ptr012F19E8@@3PAVGen000290D2@@A
    db 06Ah, 001h, 068h
    dd g_Va0110B118
    db 050h
    call ?j_00015235@@YAXXZ
    db 068h
    dd g_Va011060D8
    db 08Dh, 04Ch, 024h, 018h
    call ??0?$StringBase@D@@AAE@PBD@Z
    db 08Bh, 015h
    dd ?Rva012B8054Image@@3PBDB
    db 052h, 08Dh, 04Ch, 024h, 014h, 0C6h, 084h, 024h, 058h, 001h, 000h, 000h, 02Fh
    call ??0?$StringBase@D@@AAE@PBD@Z
    db 08Dh, 044h, 024h, 014h, 050h, 08Dh, 04Ch, 024h, 014h, 051h, 08Bh, 00Dh
    dd ?R2Ptr012F19E8@@3PAVGen000290D2@@A
    db 0C6h, 084h, 024h, 05Ch, 001h, 000h, 000h, 030h
    call ?j_00040651@@YAXXZ
    db 08Dh, 04Ch, 024h, 010h, 0C6h, 084h, 024h, 054h, 001h, 000h, 000h, 02Fh
    call ?releaseBuffer@?$StringBase@D@@AAEXXZ
    db 08Dh, 04Ch, 024h, 014h, 088h, 09Ch, 024h, 054h, 001h, 000h, 000h
    call ?releaseBuffer@?$StringBase@D@@AAEXXZ
    db 08Bh, 0BFh, 050h, 002h, 000h, 000h, 055h, 055h, 08Bh, 00Dh
    dd ?R2Ptr012F19E8@@3PAVGen000290D2@@A
    db 055h, 055h, 068h
    dd ?g_aptPalantirNormalJewel@@3PADA
    db 06Ah, 001h, 068h
    dd g_Va0110B0C8
    db 057h
    call ?j_00015235@@YAXXZ
    db 08Dh, 04Ch, 024h, 01Ch, 0C6h, 084h, 024h, 054h, 001h, 000h, 000h, 001h
    call ?releaseBuffer@?$StringBase@D@@AAEXXZ
    db 08Dh, 04Ch, 024h, 024h, 0C6h, 084h, 024h, 054h, 001h, 000h, 000h, 000h
    call ?releaseBuffer@?$StringBase@G@@AAEXXZ
    db 08Dh, 04Ch, 024h, 018h, 0C7h, 084h, 024h, 054h, 001h, 000h, 000h, 0FFh, 0FFh, 0FFh, 0FFh
    call ?releaseBuffer@?$StringBase@G@@AAEXXZ
    db 08Bh, 08Ch, 024h, 04Ch, 001h, 000h, 000h, 05Fh, 05Eh, 05Dh, 064h, 089h, 00Dh, 000h, 000h, 000h
    db 000h, 05Bh, 081h, 0C4h, 048h, 001h, 000h, 000h, 0C3h
?_bfme_updateProfileDisplay@BfmeAptScreenSkirmish@@QAEXXZ ENDP
_TEXT ENDS
END
