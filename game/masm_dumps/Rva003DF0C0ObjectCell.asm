.386
.model flat
; MASM dump carrying a measured VC7.1 codegen blocker. The body is the second
; Pathfinder::bfmeObjectCell overload (its sibling at 0x003DEFB0 is landed as
; ?bfmeObjectCell@Pathfinder@@QAEPAVPathfindCell@@PAVObject@@@Z): same query
; thunk ?j_000461ff@@YAXXZ, same floor import, same three-argument cell call
; ?j_00042249@@YAXXZ with the layer fetched through ?j_0003a391@@YAXXZ.
; Identity is NOT provable: tools/ilt_oracle.py CONTRADICTS both
; ?bfmeObjectCell@Pathfinder@@QAEPAVPathfindCell@@PAVObject@@PAUICoord2D@@@Z
; and the void variant at this address (p_false 8.48e-04, outside slot
; 59613's window 36831-36843), so the row keeps the placeholder name.
; The reconstructible C++ body (targets/game/reverse/attempts/0x003df0c0.cpp,
; score 0.99) matches the 221-byte extent and all 11 relocations but holds ten
; non-relocation bytes: retail loads the first cell coordinate into EAX
; (+0069 mov eax,[esp+10h] / +0071 mov [edi],eax) where VC7.1 picks EDX, and
; retail sinks the cell.y store behind both argument pushes and the layer
; receiver load (+00BF mov edx,[edi] / +00C1 push eax / +00C2 push edx /
; +00C3 mov ecx,esi / +00C5 mov [edi+4],eax) where VC7.1 stores it right
; after the cell.y push. The fld/fistp floor step needs an inline-asm macro,
; which the harness's shape search rejects; direct assignment, explicit
; cellX, volatile/reference/helper spellings, parameter aliases, split
; declarations, separate-store and comma forms (two more measured
; 2026-10-13) all leave the same ten bytes, as did ~ten prior sessions.
; Evidence: targets/game/reverse/identity_evidence/003df0c0-masm-codegen-blocker.md

EXTERN ?j_000461ff@@YAXXZ:NEAR
EXTERN ?g_bfmeScaleBK@@3MA:BYTE
EXTERN __imp__floor:BYTE
EXTERN ?g_bfmeADL@@3MA:BYTE
EXTERN ?j_0003a391@@YAXXZ:NEAR
EXTERN ?j_00042249@@YAXXZ:NEAR
_TEXT SEGMENT
; retail VA 0x007DF0C0 size 221
public ?Rva003DF0C0@@YAXXZ
?Rva003DF0C0@@YAXXZ PROC
    db 051h, 053h, 055h, 056h, 08Bh, 074h, 024h, 014h, 057h, 08Bh, 0E9h, 08Dh, 044h, 024h, 018h, 050h
    db 08Dh, 04Ch, 024h, 014h, 051h, 056h, 08Bh, 0CDh
    call ?j_000461ff@@YAXXZ
    db 0D9h, 046h, 038h, 08Ah, 05Ch, 024h, 018h, 0D8h, 00Dh
    dd ?g_bfmeScaleBK@@3MA
    db 083h, 0ECh, 008h, 084h, 0DBh, 074h, 01Ah, 0DDh, 01Ch, 024h, 0FFh, 015h
    dd __imp__floor
    db 0D9h, 05Ch, 024h, 020h, 083h, 0C4h, 008h, 0D9h, 044h, 024h, 018h, 0DBh, 05Ch, 024h, 010h, 0EBh
    db 01Eh, 0D8h, 005h
    dd ?g_bfmeADL@@3MA
    db 0DDh, 01Ch, 024h, 0FFh, 015h
    dd __imp__floor
    db 0D9h, 05Ch, 024h, 020h, 083h, 0C4h, 008h, 0D9h, 044h, 024h, 018h, 0DBh, 05Ch, 024h, 010h, 08Bh
    db 044h, 024h, 010h, 08Bh, 07Ch, 024h, 01Ch, 089h, 007h, 0D9h, 046h, 03Ch, 0D8h, 00Dh
    dd ?g_bfmeScaleBK@@3MA
    db 083h, 0ECh, 008h, 084h, 0DBh, 074h, 01Ah, 0DDh, 01Ch, 024h, 0FFh, 015h
    dd __imp__floor
    db 0D9h, 05Ch, 024h, 020h, 083h, 0C4h, 008h, 0D9h, 044h, 024h, 018h, 0DBh, 05Ch, 024h, 01Ch, 0EBh
    db 01Eh, 0D8h, 005h
    dd ?g_bfmeADL@@3MA
    db 0DDh, 01Ch, 024h, 0FFh, 015h
    dd __imp__floor
    db 0D9h, 05Ch, 024h, 020h, 083h, 0C4h, 008h, 0D9h, 044h, 024h, 018h, 0DBh, 05Ch, 024h, 01Ch, 08Bh
    db 044h, 024h, 01Ch, 08Bh, 017h, 050h, 052h, 08Bh, 0CEh, 089h, 047h, 004h
    call ?j_0003a391@@YAXXZ
    db 050h, 08Bh, 0CDh
    call ?j_00042249@@YAXXZ
    db 05Fh, 05Eh, 05Dh, 05Bh, 059h, 0C2h, 008h, 000h
?Rva003DF0C0@@YAXXZ ENDP
_TEXT ENDS
END
