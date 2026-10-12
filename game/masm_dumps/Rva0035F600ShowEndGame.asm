.386
.model flat
; ?Rva0035F600@@YAXXZ
; Retail @ 0x0035F600 size 295 (RET 0x10 at +0x124, INT3 padding at +0x127).
;
; Identity is owner-proven but name-unprovable, so the row keeps an
; address-derived name. Owner: VictoryConditions; vtable VA 0x010E8D90 slot 18
; (+0x48) routes through ILT 0x00008B48 to this body; callers are doVictory
; 0x002F1CF4, doDefeat 0x002F1E31, doLocalDefeat 0x002F1F72 and update
; 0x0035FC2B. The decorated name cannot be recovered: the ILT oracle
; CONTRADICTS both the symbols.csv spelling
; (?_bfme_showEndGameScreen@VictoryConditions@@UAEXABVAsciiString@@_N00@Z) and
; the census spelling (?showEndGame@VictoryConditions@@UAEXABVAsciiString@@_N00@Z)
; at slot 0x8B48 (window 6204-6207, p_false 2.61e-4), and the checked-in
; one-pointer unicode_string.h/StringInline.h layout leaves the address name.
;
; MASM dump because the measured C++ bank
; (targets/game/reverse/attempts/0x0035f600.cpp, sha256
; cc1776618e8f8e7867ba8d61fb73d205d6cca915f019ab05470267c2efc6ba1c, score
; 0.9966) compiles to 295/295 bytes with 18 relocations and one non-relocation
; byte at +0x4B, the displacement of the EH saved-ESP store at +0x48:
;   +0048 retail: mov dword ptr [esp+0x14], esp
;   +0048 ours:   mov dword ptr [esp+0x10], esp
; Blocker class eh/native-string-frame-layout: retail's 0xC frame carries
; three separate dwords (fieldName -24, the Unicode fetch result -20, the
; by-value argument pointer -16). The bank reaches retail's frame only by
; padding UnicodeString to 8 bytes, which makes $T558 (8B at -20) overlap the
; argument-pointer slot at -20 - and that padding contradicts the checked-in
; one-pointer StringInline.h layout. Canonical 4-byte layouts shrink the frame
; to 8 and park the hidden return pointer in the dead titleKey argument slot
; (14 stack displacements differ); naming or reference-binding the fetch
; result restores the frame but emits LEA instead of retail's pushed EAX at
; 299 bytes (130-145 diffs). 81+ logged trials across prior sessions
; (named/reference/full-expression result lifetimes; native AsciiString vs the
; bank's label wrapper; widening the fieldName block; volatile pointer
; parameter; EH/ctor variants; direct AsciiString value argument;
; StringInline.h lever) leave the byte, and the /FAsc listings pin the slot
; overlap. The exact bytes therefore stay a machine dump.
;
; Relocations: the REL32 calls resolve through the pinned j_/ctor/releaseBuffer
; names; the DIR32 sites (SEH record g_Va01019AD0, TheGameText, R2Ptr012F19E8,
; the Rva007F01B0 vtable, the APT jewel literals, g_Va010E8E10/20,
; __imp__timeGetTime) are symbolic.
; Evidence: targets/game/reverse/identity_evidence/0035f600-masm-codegen-blocker.md
EXTERN g_Va01019AD0:NEAR
EXTERN g_Va010E8E10:NEAR
EXTERN g_Va010E8E20:NEAR
EXTERN __imp__timeGetTime@0:BYTE
EXTERN ?R2Ptr012F19E8@@3PAVGen000290D2@@A:NEAR
EXTERN ?Rva00367810TheVirtualGate@@3PAVRva00367810VirtualGate@@A:NEAR
EXTERN ?TheGameText@@3PAVBfmeGameText@@A:NEAR
EXTERN ?Rva006A16B0Empty@@3PADA:NEAR
EXTERN ?g_aptPalantirNormalJewel@@3PADA:NEAR
EXTERN ?g_aptPalantirBrightJewel@@3PADA:NEAR
EXTERN ??_7Rva007F01B0@@6B@:NEAR
EXTERN ??0?$StringBase@D@@AAE@PBD@Z:NEAR
EXTERN ??0?$StringBase@D@@AAE@ABV0@@Z:NEAR
EXTERN ?releaseBuffer@?$StringBase@G@@AAEXXZ:NEAR
EXTERN ?releaseBuffer@?$StringBase@D@@AAEXXZ:NEAR
EXTERN ?j_0000bdca@@YAXXZ:NEAR
EXTERN ?j_00015235@@YAXXZ:NEAR
_TEXT SEGMENT
public ?Rva0035F600@@YAXXZ
?Rva0035F600@@YAXXZ PROC
    db 064h, 0A1h, 000h, 000h, 000h, 000h, 06Ah, 0FFh, 068h
    dd g_Va01019AD0
    db 050h, 0A1h
    dd ?R2Ptr012F19E8@@3PAVGen000290D2@@A
    db 064h, 089h, 025h, 000h, 000h, 000h, 000h, 083h, 0ECh, 00Ch, 085h, 0C0h, 056h, 08Bh, 0F1h, 00Fh
    db 084h, 0EDh, 000h, 000h, 000h, 08Ah, 046h, 00Ch, 084h, 0C0h, 00Fh, 085h, 0E2h, 000h, 000h, 000h
    db 068h
    dd g_Va010E8E20
    db 08Dh, 04Ch, 024h, 008h
    call ??0?$StringBase@D@@AAE@PBD@Z
    db 08Bh, 044h, 024h, 020h, 06Ah, 000h, 051h, 089h, 064h, 024h, 014h, 08Bh, 0CCh, 050h, 0C7h, 044h
    db 024h, 024h, 000h, 000h, 000h, 000h
    call ??0?$StringBase@D@@AAE@ABV0@@Z
    db 08Bh, 00Dh
    dd ?TheGameText@@3PAVBfmeGameText@@A
    db 08Bh, 011h, 08Dh, 044h, 024h, 010h, 050h, 0FFh, 052h, 024h, 050h, 08Dh, 04Ch, 024h, 008h, 051h
    db 08Bh, 00Dh
    dd ?R2Ptr012F19E8@@3PAVGen000290D2@@A
    db 0C6h, 044h, 024h, 020h, 001h
    call ?j_0000bdca@@YAXXZ
    db 08Dh, 04Ch, 024h, 008h, 0C6h, 044h, 024h, 018h, 000h
    call ?releaseBuffer@?$StringBase@G@@AAEXXZ
    db 08Dh, 04Ch, 024h, 004h, 0C7h, 044h, 024h, 018h, 0FFh, 0FFh, 0FFh, 0FFh
    call ?releaseBuffer@?$StringBase@D@@AAEXXZ
    db 08Bh, 054h, 024h, 02Ch, 08Bh, 002h, 085h, 0C0h, 074h, 00Ah, 066h, 083h, 078h, 004h, 000h, 08Dh
    db 050h, 008h, 075h, 005h, 0BAh
    dd ??_7Rva007F01B0@@6B@
    db 08Ah, 044h, 024h, 024h, 084h, 0C0h, 0B9h
    dd ?g_aptPalantirNormalJewel@@3PADA
    db 075h, 005h, 0B9h
    dd ?g_aptPalantirBrightJewel@@3PADA
    db 08Bh, 044h, 024h, 028h, 08Bh, 000h, 085h, 0C0h, 074h, 005h, 083h, 0C0h, 008h, 0EBh, 005h, 0B8h
    dd ?Rva006A16B0Empty@@3PADA
    db 06Ah, 000h, 06Ah, 000h, 052h, 050h, 051h, 08Bh, 00Dh
    dd ?R2Ptr012F19E8@@3PAVGen000290D2@@A
    db 06Ah, 003h, 068h
    dd g_Va010E8E10
    db 06Ah, 00Bh
    call ?j_00015235@@YAXXZ
    db 0C6h, 046h, 00Ch, 001h, 0FFh, 015h
    dd __imp__timeGetTime@0
    db 089h, 046h, 010h, 08Bh, 00Dh
    dd ?Rva00367810TheVirtualGate@@3PAVRva00367810VirtualGate@@A
    db 0C6h, 081h, 03Ch, 001h, 000h, 000h, 000h, 08Bh, 04Ch, 024h, 010h, 064h, 089h, 00Dh, 000h, 000h
    db 000h, 000h, 05Eh, 083h, 0C4h, 018h, 0C2h, 010h, 000h
?Rva0035F600@@YAXXZ ENDP
_TEXT ENDS
END
