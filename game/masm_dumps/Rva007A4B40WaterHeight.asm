.386
.model flat
; WaterRenderObjClass::getWaterHeight at 0x007A4B40, 384 bytes.
; Identity: proven.  Retail ILT 0x0002D4D4 (row ?j_0002d4d4@@YAXXZ at
; 0x0002D4D4 target=FUN_00ba4b40) resolves here; symbols.csv pins
; ?getWaterHeight@WaterRenderObjClass@@QAEMMM@Z to 0x007A4B40; BFME's
; W3DWater.cpp carries the same signature (present-unmatched) and the matched
; callers 0x006C76B0/0x006C7CF0 pass two Reals.  Boundary: ret 8 at +0x17D
; then INT3 padding to 0x007A4CC0; Ghidra FUN_00ba4b40 agrees on 384 bytes.
;
; WHY MASM.  The reconstructible C++ bank (targets/game/reverse/attempts/0x007a4b40.cpp)
; measures 384 bytes / 9 relocations / instruction shape 1.000 and leaves only
; four register-allocation bytes: +0x137 lea ecx,[esp+24]; push ecx versus our
; lea edx/push edx for the containsPoint GridPoint2 pointer, and +0x15A
; mov edx,[ebx+54] versus our mov eax,[ebx+54] (then fld [edx+8]/[eax+8]) for
; the water polygon points.  The bank reaches even that shape only through
; volatile argument reads that the anti-lift rules bar; the clean body keeps
; MSVC's own store schedule and differs in 10+ non-reloc bytes at
; +0x10C..+0x114 because retail interleaves pos.y/pos.x/pos.z around the
; list-head load and cmp (+0x116 store, +0x11A load, +0x11C cmp, +0x11E
; store).  64 shape_search variants plus dozens of spellings (local order,
; split declarations, barriers, hoisted and loop-local pointers, found-flag
; returns, reversed compares, inline begin/end at 406 bytes, array accessors)
; never move those bytes: a proven VC7.1 register-schedule blocker.
;
; Body is the verbatim symbolic lift of the gen-dump bytes in
; game/gen_asm/d_0079d530.asm: db literals with every reference site
; symbolic (g_bfmeADL, g_bfmeAFAE, ?g_01076C24, the three ILT thunks and
; __imp__floor); byte-identical to retail outside the relocation slots.
; Evidence: targets/game/reverse/identity_evidence/007a4b40-masm-regalloc-blocker.md

EXTERN ?g_bfmeADL@@3MA:BYTE
EXTERN __imp__floor:BYTE
EXTERN ?g_bfmeAFAE@@3PAUBfmeHoldFAE@@A:BYTE
EXTERN ?j_0004ab6f@@YAXXZ:NEAR
EXTERN ?j_0000b0c8@@YAXXZ:NEAR
EXTERN ?j_00028fd3@@YAXXZ:NEAR
EXTERN ?g_01076C24@@3MA:BYTE
_TEXT SEGMENT
public ?getWaterHeight@WaterRenderObjClass@@QAEMMM@Z
?getWaterHeight@WaterRenderObjClass@@QAEMMM@Z PROC
    db 083h, 0ECh, 024h, 0D9h, 044h, 024h, 028h, 053h, 0D8h, 005h
    dd ?g_bfmeADL@@3MA
    db 056h, 057h, 083h, 0ECh, 008h, 033h, 0FFh, 0DDh, 01Ch, 024h, 08Bh, 0D9h, 089h, 07Ch, 024h, 014h
    db 0FFh, 015h
    dd __imp__floor
    db 0D9h, 05Ch, 024h, 018h, 083h, 0C4h, 008h, 0D9h, 044h, 024h, 010h, 0DBh, 05Ch, 024h, 014h, 0D9h
    db 044h, 024h, 038h, 0D8h, 005h
    dd ?g_bfmeADL@@3MA
    db 08Bh, 044h, 024h, 014h, 083h, 0ECh, 008h, 089h, 044h, 024h, 020h, 0DDh, 01Ch, 024h, 0FFh, 015h
    dd __imp__floor
    db 0D9h, 05Ch, 024h, 01Ch, 083h, 0C4h, 008h, 0D9h, 044h, 024h, 014h, 0DBh, 05Ch, 024h, 010h, 08Bh
    db 04Ch, 024h, 010h, 08Bh, 015h
    dd ?g_bfmeAFAE@@3PAUBfmeHoldFAE@@A
    db 089h, 04Ch, 024h, 01Ch, 089h, 07Ch, 024h, 020h, 08Bh, 032h, 085h, 0F6h, 074h, 07Eh, 08Ah, 046h
    db 032h, 084h, 0C0h, 074h, 04Eh, 08Dh, 044h, 024h, 018h, 050h, 08Bh, 0CEh
    call ?j_0004ab6f@@YAXXZ
    db 084h, 0C0h, 074h, 03Eh, 08Bh, 04Eh, 014h, 033h, 0C0h, 085h, 0C9h, 07Fh, 003h, 08Dh, 041h, 0FFh
    db 08Bh, 056h, 010h, 08Dh, 004h, 040h, 0DBh, 044h, 082h, 008h, 0D8h, 05Ch, 024h, 00Ch, 0DFh, 0E0h
    db 0F6h, 0C4h, 001h, 075h, 01Dh, 033h, 0C0h, 085h, 0C9h, 07Fh, 003h, 08Dh, 041h, 0FFh, 08Dh, 00Ch
    db 040h, 0DBh, 044h, 08Ah, 008h, 08Bh, 0CEh, 0D9h, 05Ch, 024h, 00Ch
    call ?j_0000b0c8@@YAXXZ
    db 08Bh, 0F8h, 08Bh, 076h, 004h, 085h, 0F6h, 075h, 0A4h, 085h, 0FFh, 074h, 01Eh, 08Bh, 017h, 08Bh
    db 042h, 014h, 033h, 0C9h, 085h, 0C0h, 07Fh, 003h, 08Dh, 048h, 0FFh, 08Dh, 004h, 049h, 08Bh, 04Ah
    db 010h, 0DBh, 044h, 081h, 008h, 0D9h, 05Ch, 024h, 00Ch, 0EBh, 008h, 0C7h, 044h, 024h, 00Ch, 000h
    db 000h, 000h, 000h, 08Bh, 044h, 024h, 038h, 08Bh, 08Bh, 0ACh, 002h, 000h, 000h, 08Bh, 054h, 024h
    db 034h, 089h, 044h, 024h, 028h, 08Bh, 001h, 03Bh, 0C1h, 089h, 054h, 024h, 024h, 0C7h, 044h, 024h
    db 02Ch, 000h, 000h, 000h, 000h, 074h, 006h, 08Bh, 000h, 03Bh, 0C1h, 075h, 0FAh, 08Bh, 0BBh, 0ACh
    db 002h, 000h, 000h, 08Bh, 037h, 03Bh, 0F7h, 074h, 019h, 08Bh, 05Eh, 008h, 08Dh, 04Ch, 024h, 024h
    db 051h, 08Bh, 0CBh
    call ?j_00028fd3@@YAXXZ
    db 084h, 0C0h, 075h, 013h, 08Bh, 036h, 03Bh, 0F7h, 075h, 0E7h, 0D9h, 044h, 024h, 00Ch, 05Fh, 05Eh
    db 05Bh, 083h, 0C4h, 024h, 0C2h, 008h, 000h, 08Bh, 053h, 054h, 0D9h, 042h, 008h, 0D9h, 044h, 024h
    db 00Ch, 0DAh, 0E9h, 0DFh, 0E0h, 0F6h, 0C4h, 044h, 07Ah, 0E0h, 0D9h, 044h, 024h, 00Ch, 05Fh, 0D8h
    db 025h
    dd ?g_01076C24@@3MA
    db 05Eh, 05Bh, 083h, 0C4h, 024h, 0C2h, 008h, 000h
?getWaterHeight@WaterRenderObjClass@@QAEMMM@Z ENDP
_TEXT ENDS
END
