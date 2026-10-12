.386
.model flat
; ?rva002A1F80@RespawnUpdate@@QAEXPAVObject@@@Z
; Retail @ 0x002A1F80 size 489
;
; MASM dump carrying a measured codegen blocker. The name is address-derived on
; purpose: EA's WorldBuilder map (targets/game/reverse/ea_evidence.csv) names
; RespawnUpdate::triggerRevival here (wb2, direct, aligned) and the file
; attribution is GameEngine/Source/GameLogic/Object/Update/RespawnUpdate.cpp,
; but tools/ilt_oracle.py check '?triggerRevival@RespawnUpdate@@QAEXPAVObject@@@Z'
; 0x002A1F80 = CONTRADICTED (slot 59785, window 37006-37013) and every natural
; signature variant measured (UAE/SAX/QBE, extra or different parameters)
; also contradicts, so tools/ilt_guard.py would refuse the real name and
; docs/naming_evidence.md keeps an address token instead (same style as the
; landed ?rva002A21F0@RespawnUpdate@@QAEXXZ in the same file).
;
; The reconstructible C++ body (targets/game/reverse/attempts/0x002a1f80.cpp)
; compiles to exactly 489 bytes with 13 relocations and shape 0.994 -- every
; instruction matches retail once registers and constants are normalised --
; but three receiver/argument bytes at +0xED refuse every equivalent spelling:
; retail emits mov ecx, ebx (mov ecx, ebx) and then push edi, while VC7.1's
; allocator pushes edi first and loads ecx after (57h, 8Bh, 0CBh). 26 spellings
; were measured before this dump (re_attempts.log lines 45363, 45376, 46002,
; 46350, 46364, 46377, 47881, 48626, 49501, 50328, 52268, 57836: guard shapes,
; local-alias and receiver-copy orders, named arguments, 18 single and 168
; paired source toggles, member wrappers, member-pointer and fastcall
; experiments) and 13 more on 2026-10-13 (nested guard, bool local, switch,
; braced bodies, null and object casts, const local, member wrapper form,
; non-const callee), all landing on the identical three bytes. docs/
; shape_levers.md records the same adjacent mov ecx / push order wall at
; 0x0024ECA0 ("Both local-alias orders and the fastcall table trial failed").
; The body is byte-identical to retail outside its relocation slots.
; Boundary: ret 4 at +0x1E6, INT3 from +0x1E9.
; Evidence: targets/game/reverse/identity_evidence/002a1f80-masm-codegen-blocker.md
EXTERN ?PlayerList005999B0@@3PAUPlayers005999B0@@A:BYTE
EXTERN ?TheControlBar@@3PAURva002AD380ControlBar@@A:BYTE
EXTERN ?g_bfmeScaleBC@@3MA:BYTE
EXTERN ?j_000095ed@@YAXXZ:NEAR
EXTERN ?j_00011f77@@YAXXZ:NEAR
EXTERN ?j_000157da@@YAXXZ:NEAR
EXTERN ?j_00020824@@YAXXZ:NEAR
EXTERN ?j_00022bba@@YAXXZ:NEAR
EXTERN ?j_00023d4e@@YAXXZ:NEAR
EXTERN ?j_0003994b@@YAXXZ:NEAR
_TEXT SEGMENT
public ?rva002A1F80@RespawnUpdate@@QAEXPAVObject@@@Z
?rva002A1F80@RespawnUpdate@@QAEXPAVObject@@@Z PROC
    db 083h, 0ECh, 038h, 053h, 055h, 056h, 08Bh, 0F1h, 08Bh, 04Ch, 024h, 048h, 08Bh, 041h, 038h, 08Bh
    db 051h, 03Ch, 08Bh, 06Eh, 004h, 089h, 044h, 024h, 010h, 08Bh, 041h, 040h, 057h, 08Bh, 07Eh, 008h
    db 089h, 054h, 024h, 018h, 089h, 044h, 024h, 01Ch
    call ?j_00023d4e@@YAXXZ
    db 085h, 0C0h, 074h, 00Eh, 08Bh, 010h, 06Ah, 001h, 08Dh, 04Ch, 024h, 018h, 051h, 08Bh, 0C8h, 0FFh
    db 052h, 024h, 08Ah, 046h, 041h, 084h, 0C0h, 074h, 04Ch, 033h, 0D2h, 089h, 054h, 024h, 020h, 089h
    db 054h, 024h, 024h, 089h, 054h, 024h, 028h, 089h, 054h, 024h, 02Ch, 089h, 054h, 024h, 030h, 089h
    db 054h, 024h, 034h, 089h, 054h, 024h, 038h, 08Dh, 045h, 05Ch, 089h, 054h, 024h, 03Ch, 050h, 08Dh
    db 04Ch, 024h, 024h, 089h, 054h, 024h, 044h, 051h, 08Bh, 0CFh, 089h, 054h, 024h, 04Ch
    call ?j_000095ed@@YAXXZ
    db 08Bh, 095h, 098h, 000h, 000h, 000h, 08Bh, 09Dh, 08Ch, 000h, 000h, 000h, 089h, 054h, 024h, 04Ch
    db 0EBh, 04Ah, 033h, 0C0h, 089h, 044h, 024h, 020h, 089h, 044h, 024h, 024h, 089h, 044h, 024h, 028h
    db 089h, 044h, 024h, 02Ch, 089h, 044h, 024h, 030h, 089h, 044h, 024h, 034h, 089h, 044h, 024h, 038h
    db 08Dh, 04Dh, 034h, 089h, 044h, 024h, 03Ch, 051h, 08Dh, 054h, 024h, 024h, 089h, 044h, 024h, 044h
    db 052h, 08Bh, 0CFh, 089h, 044h, 024h, 04Ch
    call ?j_000095ed@@YAXXZ
    db 08Bh, 085h, 094h, 000h, 000h, 000h, 08Bh, 09Dh, 088h, 000h, 000h, 000h, 089h, 044h, 024h, 04Ch
    db 085h, 0DBh, 074h, 015h, 08Bh, 0CBh
    call ?j_00011f77@@YAXXZ
    db 084h, 0C0h, 075h, 00Ah, 06Ah, 000h, 08Bh, 0CBh, 057h
    call ?j_00022bba@@YAXXZ
    db 033h, 0C0h, 0C7h, 046h, 02Ch, 004h, 000h, 000h, 000h, 08Bh, 08Fh, 010h, 002h, 000h, 000h, 08Bh
    db 051h, 028h, 089h, 044h, 024h, 024h, 089h, 044h, 024h, 028h, 088h, 044h, 024h, 030h, 08Dh, 044h
    db 024h, 020h, 050h, 08Dh, 04Ch, 024h, 014h, 081h, 0C5h, 0A0h, 000h, 000h, 000h, 051h, 08Bh, 0CDh
    db 089h, 054h, 024h, 028h, 0C7h, 044h, 024h, 034h, 000h, 000h, 080h, 03Fh
    call ?j_0003994b@@YAXXZ
    db 08Bh, 05Dh, 000h, 08Bh, 044h, 024h, 010h, 03Bh, 0C3h, 075h, 04Eh, 033h, 0C0h, 08Dh, 054h, 024h
    db 020h, 089h, 044h, 024h, 024h, 089h, 044h, 024h, 028h, 088h, 044h, 024h, 030h, 052h, 08Dh, 044h
    db 024h, 014h, 050h, 08Bh, 0CDh, 0C7h, 044h, 024h, 028h, 001h, 000h, 000h, 000h, 0C7h, 044h, 024h
    db 034h, 000h, 000h, 080h, 03Fh
    call ?j_0003994b@@YAXXZ
    db 08Bh, 044h, 024h, 010h, 03Bh, 0C3h, 075h, 017h, 068h, 0FFh, 0FFh, 0FFh, 03Fh, 08Bh, 0CEh, 057h
    call ?j_000157da@@YAXXZ
    db 05Fh, 05Eh, 05Dh, 05Bh, 083h, 0C4h, 038h, 0C2h, 004h, 000h, 0D9h, 040h, 01Ch, 06Ah, 000h, 0D9h
    db 056h, 020h, 08Bh, 08Fh, 000h, 002h, 000h, 000h, 0D8h, 00Dh
    dd ?g_bfmeScaleBC@@3MA
    db 08Bh, 011h, 051h, 0D9h, 01Ch, 024h, 0FFh, 052h, 054h, 083h, 0C8h, 0FFh, 089h, 046h, 034h, 089h
    db 046h, 038h, 0A1h
    dd ?PlayerList005999B0@@3PAUPlayers005999B0@@A
    db 08Bh, 058h, 00Ch, 08Bh, 0CFh
    call ?j_00020824@@YAXXZ
    db 03Bh, 0D8h, 075h, 00Ah, 08Bh, 00Dh
    dd ?TheControlBar@@3PAURva002AD380ControlBar@@A
    db 0C6h, 041h, 024h, 001h, 08Bh, 054h, 024h, 04Ch, 052h, 08Bh, 0CEh, 057h
    call ?j_000157da@@YAXXZ
    db 05Fh, 05Eh, 05Dh, 05Bh, 083h, 0C4h, 038h, 0C2h, 004h, 000h
?rva002A1F80@RespawnUpdate@@QAEXPAVObject@@@Z ENDP
_TEXT ENDS
END
