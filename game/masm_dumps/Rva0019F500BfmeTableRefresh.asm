.386
.model flat
; ?rva0019F500@BfmeTableERJ@@QAEXXZ
; Retail @ 0x0019F500 size 725 (carved from the gen slab game/gen_asm/d_00198280.asm).
; Address-derived identity: GameLogic init calls ILT 0x000456BA with
; ecx=g_bfmeTableERJ and no arguments; the body ends plain RET at +0x2BD then a
; live _CxxThrowException tail through +0x2D4 followed by CC (symbols.csv 87851).
; MASM dump because the measured C++ bank (targets/game/reverse/attempts/0x0019f500.cpp)
; reaches 726 bytes with 41 relocations and the retail ThrowInfo fixed to
; __TI1?AW4ErrorCode@@ at +0x2BF, but retains 2 non-relocation bytes at
; +0xDC/+0xE0: retail materialises `lea eax,[esp+0x10]` then `push eax` for the
; AsciiString copy-argument of `AsciiString filename(path);` while VC7.1 reuses
; ecx (`lea ecx,[esp+0x10]`, `push ecx`) because esp+0x10 was the receiver of the
; immediately preceding concat call. Dropping that concat moves the reuse to the
; prior concat; 25+ logged experiments (EH rotation toggles, WWLib ascii_string.h
; base-class model, sibling-TU include set, shape search, ref/source aliases, base
; casts, by-value and ref-returning __forceinline helpers, arithmetic and
; assignment-as-value spellings) never move those two bytes.
; Evidence: targets/game/reverse/identity_evidence/0019f500-masm-codegen-blocker.md
EXTERN ??0?$StringBase@D@@AAE@ABV0@@Z:NEAR
EXTERN ??0?$StringBase@D@@AAE@PBD@Z:NEAR
EXTERN ??_7BfmeParserBindingBaseVE@@6B@:BYTE
EXTERN ??_7BfmeParserBindingVE@@6B@:BYTE
EXTERN ?BfmeDefeatScreenTable@@3PAEA:BYTE
EXTERN ?Rva006A16B0Empty@@3PADA:BYTE
EXTERN ?bfmeChunkParserVE@@YAXXZ:NEAR
EXTERN ?concat@?$StringBase@D@@QAEXPBDH@Z:NEAR
EXTERN ?g_bfmeDescABB@@3QAXA:BYTE
EXTERN ?j_0000512d@@YAXXZ:NEAR
EXTERN ?j_0000871a@@YAXXZ:NEAR
EXTERN ?j_00010861@@YAXXZ:NEAR
EXTERN ?j_00015bd1@@YAXXZ:NEAR
EXTERN ?j_0001f384@@YAXXZ:NEAR
EXTERN ?j_00023010@@YAXXZ:NEAR
EXTERN ?j_00025eb9@@YAXXZ:NEAR
EXTERN ?j_00028bfa@@YAXXZ:NEAR
EXTERN ?j_00049300@@YAXXZ:NEAR
EXTERN ?j_0004aab1@@YAXXZ:NEAR
EXTERN ?j_0004b344@@YAXXZ:NEAR
EXTERN ?ji_009f6d00@@YAXXZ:NEAR
EXTERN ?releaseBuffer@?$StringBase@D@@AAEXXZ:NEAR
EXTERN g_Va01007D28:NEAR
EXTERN g_Va01075318:BYTE
EXTERN g_Va0109C160:BYTE
EXTERN g_Va0109C230:BYTE
EXTERN g_Va0109C238:BYTE
_TEXT SEGMENT
public ?rva0019F500@BfmeTableERJ@@QAEXXZ
?rva0019F500@BfmeTableERJ@@QAEXXZ PROC
    db 06Ah, 0FFh, 068h
    dd g_Va01007D28
    db 064h, 0A1h, 000h, 000h, 000h, 000h, 050h, 064h, 089h, 025h, 000h, 000h, 000h, 000h, 083h, 0ECh
    db 068h, 053h, 055h, 056h, 057h, 08Bh, 0E9h
    call ?j_00023010@@YAXXZ
    db 08Bh, 045h, 00Ch, 08Bh, 030h, 03Bh, 0F0h, 089h, 074h, 024h, 01Ch, 00Fh, 084h, 077h, 002h, 000h
    db 000h, 033h, 0DBh, 08Dh, 046h, 008h, 050h, 08Dh, 04Ch, 024h, 018h
    call ??0?$StringBase@D@@AAE@ABV0@@Z
    db 08Bh, 044h, 024h, 014h, 03Bh, 0C3h, 089h, 09Ch, 024h, 080h, 000h, 000h, 000h, 00Fh, 084h, 041h
    db 002h, 000h, 000h, 066h, 039h, 058h, 004h, 00Fh, 084h, 037h, 002h, 000h, 000h, 068h
    dd g_Va0109C238
    db 08Dh, 04Ch, 024h, 014h
    call ??0?$StringBase@D@@AAE@PBD@Z
    db 08Bh, 044h, 024h, 014h, 03Bh, 0C3h, 0C6h, 084h, 024h, 080h, 000h, 000h, 000h, 001h, 074h, 009h
    db 00Fh, 0B7h, 048h, 004h, 083h, 0C0h, 008h, 0EBh, 007h, 033h, 0C9h, 0B8h
    dd ?Rva006A16B0Empty@@3PADA
    db 051h, 050h, 08Dh, 04Ch, 024h, 018h
    call ?concat@?$StringBase@D@@QAEXPBDH@Z
    db 06Ah, 001h, 068h
    dd g_Va01075318
    db 08Dh, 04Ch, 024h, 018h
    call ?concat@?$StringBase@D@@QAEXPBDH@Z
    db 08Bh, 044h, 024h, 014h, 03Bh, 0C3h, 074h, 009h, 00Fh, 0B7h, 048h, 004h, 083h, 0C0h, 008h, 0EBh
    db 007h, 033h, 0C9h, 0B8h
    dd ?Rva006A16B0Empty@@3PADA
    db 051h, 050h, 08Dh, 04Ch, 024h, 018h
    call ?concat@?$StringBase@D@@QAEXPBDH@Z
    db 06Ah, 004h, 068h
    dd g_Va0109C230
    db 08Dh, 04Ch, 024h, 018h
    call ?concat@?$StringBase@D@@QAEXPBDH@Z
    db 08Dh, 044h, 024h, 010h, 050h, 08Dh, 04Ch, 024h, 01Ch
    call ??0?$StringBase@D@@AAE@ABV0@@Z
    db 08Dh, 04Ch, 024h, 028h, 0C6h, 084h, 024h, 080h, 000h, 000h, 000h, 002h
    call ?j_0004b344@@YAXXZ
    db 051h, 08Dh, 054h, 024h, 01Ch, 089h, 064h, 024h, 028h, 08Bh, 0CCh, 052h, 0C6h, 084h, 024h, 088h
    db 000h, 000h, 000h, 003h
    call ??0?$StringBase@D@@AAE@ABV0@@Z
    db 08Dh, 04Ch, 024h, 02Ch
    call ?j_0004aab1@@YAXXZ
    db 03Ah, 0C3h, 075h, 04Bh, 08Dh, 04Ch, 024h, 028h, 0C6h, 084h, 024h, 080h, 000h, 000h, 000h, 002h
    call ?j_0000512d@@YAXXZ
    db 08Dh, 04Ch, 024h, 018h, 0C6h, 084h, 024h, 080h, 000h, 000h, 000h, 001h
    call ?releaseBuffer@?$StringBase@D@@AAEXXZ
    db 08Dh, 04Ch, 024h, 010h, 088h, 09Ch, 024h, 080h, 000h, 000h, 000h
    call ?releaseBuffer@?$StringBase@D@@AAEXXZ
    db 08Dh, 04Ch, 024h, 014h, 0C7h, 084h, 024h, 080h, 000h, 000h, 000h, 0FFh, 0FFh, 0FFh, 0FFh
    call ?releaseBuffer@?$StringBase@D@@AAEXXZ
    db 0E9h, 019h, 001h, 000h, 000h, 08Dh, 044h, 024h, 028h, 050h, 08Dh, 04Ch, 024h, 054h
    call ?j_00010861@@YAXXZ
    db 068h
    dd g_Va0109C160
    db 08Dh, 04Ch, 024h, 024h, 0C6h, 084h, 024h, 084h, 000h, 000h, 000h, 004h
    call ??0?$StringBase@D@@AAE@PBD@Z
    db 08Dh, 054h, 024h, 038h, 052h, 068h
    dd ?bfmeChunkParserVE@@YAXXZ
    db 068h
    dd ?BfmeDefeatScreenTable@@3PAEA
    db 08Dh, 044h, 024h, 02Ch, 08Dh, 04Ch, 024h, 05Ch, 050h, 0C6h, 084h, 024h, 090h, 000h, 000h, 000h
    db 005h, 0BEh
    dd ?j_0001f384@@YAXXZ
    db 033h, 0FFh, 0C7h, 044h, 024h, 048h
    dd ??_7BfmeParserBindingBaseVE@@6B@
    db 089h, 04Ch, 024h, 04Ch
    call ?j_00015bd1@@YAXXZ
    db 089h, 044h, 024h, 040h, 0C7h, 044h, 024h, 038h
    dd ??_7BfmeParserBindingVE@@6B@
    db 089h, 06Ch, 024h, 044h, 089h, 074h, 024h, 048h, 089h, 07Ch, 024h, 04Ch, 08Dh, 04Ch, 024h, 020h
    db 0C6h, 084h, 024h, 080h, 000h, 000h, 000h, 007h
    call ?releaseBuffer@?$StringBase@D@@AAEXXZ
    db 053h, 08Dh, 04Ch, 024h, 054h
    call ?j_00028bfa@@YAXXZ
    db 084h, 0C0h, 00Fh, 084h, 0BBh, 000h, 000h, 000h, 08Dh, 04Ch, 024h, 028h
    call ?j_00049300@@YAXXZ
    db 08Bh, 04Ch, 024h, 040h, 051h, 08Bh, 04Ch, 024h, 040h, 0C6h, 084h, 024h, 084h, 000h, 000h, 000h
    db 004h, 0C7h, 044h, 024h, 03Ch
    dd ??_7BfmeParserBindingBaseVE@@6B@
    call ?j_0000871a@@YAXXZ
    db 08Dh, 04Ch, 024h, 050h, 0C6h, 084h, 024h, 080h, 000h, 000h, 000h, 003h
    call ?j_00025eb9@@YAXXZ
    db 08Dh, 04Ch, 024h, 028h, 0C6h, 084h, 024h, 080h, 000h, 000h, 000h, 002h
    call ?j_0000512d@@YAXXZ
    db 08Dh, 04Ch, 024h, 018h, 0C6h, 084h, 024h, 080h, 000h, 000h, 000h, 001h
    call ?releaseBuffer@?$StringBase@D@@AAEXXZ
    db 08Dh, 04Ch, 024h, 010h, 088h, 09Ch, 024h, 080h, 000h, 000h, 000h
    call ?releaseBuffer@?$StringBase@D@@AAEXXZ
    db 08Dh, 04Ch, 024h, 014h, 0C7h, 084h, 024h, 080h, 000h, 000h, 000h, 0FFh, 0FFh, 0FFh, 0FFh
    call ?releaseBuffer@?$StringBase@D@@AAEXXZ
    db 08Bh, 074h, 024h, 01Ch, 08Bh, 006h, 03Bh, 045h, 00Ch, 089h, 044h, 024h, 01Ch, 074h, 01Bh, 08Bh
    db 0F0h, 0E9h, 09Fh, 0FDh, 0FFh, 0FFh, 08Dh, 04Ch, 024h, 014h, 0C7h, 084h, 024h, 080h, 000h, 000h
    db 000h, 0FFh, 0FFh, 0FFh, 0FFh
    call ?releaseBuffer@?$StringBase@D@@AAEXXZ
    db 08Bh, 04Ch, 024h, 078h, 05Fh, 05Eh, 05Dh, 064h, 089h, 00Dh, 000h, 000h, 000h, 000h, 05Bh, 083h
    db 0C4h, 074h, 0C3h, 068h
    dd ?g_bfmeDescABB@@3QAXA
    db 08Dh, 054h, 024h, 020h, 052h, 0C7h, 044h, 024h, 024h, 005h, 000h, 0ADh, 0DEh
    call ?ji_009f6d00@@YAXXZ
?rva0019F500@BfmeTableERJ@@QAEXXZ ENDP
_TEXT ENDS
END
