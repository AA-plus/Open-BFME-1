.386
.model flat
; ?Rva008C7500@@YAXXZ
; Retail @ 0x008C7500 size 752
;
; MASM dump carrying a measured codegen blocker. Identity is not provable: no
; caller, string, ILT slot or vtable names the body (the re_attempts log's
; AptActionInterpreter placeholder is a hypothesis, not evidence), so the name
; stays address-derived. ABI from decode: SEH frame `push -1; push
; g_Va01059DD0`; the interpreter arrives as the first stack argument
; (m_stackTop at +0, m_stackCapacity at +4, m_stack at +8) and the body pops
; two AptValue pointers. Gate `AptGetSwfVersion() == 7`; undefined-bit counts
; (flag bit 15) feed a switch that stores the fallback DB for one undefined
; operand and a pooled boolean true for two. Under `result == 0` it default
; constructs two 8-byte Apt strings, fills them through the two virtual
; getName calls and inlines the string equality (length word at data+2,
; pointer compare then repe cmpsb). The boolean factory inlines twice: pop the
; free list head (node next at +8), pool push-back, else allocate 0x0C bytes,
; stamp flags 0x40008005 and the two vtables. Tail: pop the two operands off
; the interpreter stack, then release each via its virtual slot 4 when refcount
; bit 30 is set. The reconstructible C++ body
; (targets/game/reverse/attempts/0x008c7500.cpp) compiles to exactly 752 bytes
; with 23 relocations and shape 1.000; its whole residue is eight
; non-relocation bytes at +0x181..+0x19C in the inlined string equality, a
; pure register-rotation in the four loads (retail top-data EAX under-data EDX
; lengths ECX/ESI; bank EDX/ESI ECX/EAX). Waves measured: 32 shape-family
; variants, 30 operator== spellings plus call-site/temp rotation grids (~170
; combos), a 90-flag sweep (best /O2), 26 throw()/EH trials, plus 8 fresh
; spellings today (call-order swap worsens to 12 bytes; pointer/int return
; types, reference parameter, aliases and free operator== all leave the same
; 8 bytes). The dump body is byte-identical to retail outside its 26 reloc
; sites (checked with 5-byte call masks and 4-byte dd masks).
; Evidence: targets/game/reverse/identity_evidence/008c7500-masm-codegen-blocker.md
EXTERN g_Va01059DD0:NEAR
EXTERN ?AptGetSwfVersion@@YAIXZ:NEAR
EXTERN ?Rva008D2A30Head@@3PAURva008D2A30Node@@A:BYTE
EXTERN ?g_bfme1211@@3PAVBfmeG1211@@A:BYTE
EXTERN ?Rva008C5D70Alloc@@3P6APAXI@ZA:BYTE
EXTERN ??_7AptValue@@6B@:BYTE
EXTERN ??_7Rva008995E0Value@@6B@:BYTE
EXTERN ?bfmeTheCBC@@3HA:BYTE
EXTERN ?Rva012D5298Empty@@3URva00893410Block@@A:BYTE
EXTERN ?getName@Rva8CD130Value@@QAEXPAVRva8CD130String@@@Z:NEAR
EXTERN ?Rva00892ED0ReleaseTable@@3PAP6AXPAX@ZA:BYTE
_TEXT SEGMENT
public ?Rva008C7500@@YAXXZ
?Rva008C7500@@YAXXZ PROC
    db 06Ah, 0FFh, 068h
    dd g_Va01059DD0
    db 064h, 0A1h, 000h, 000h, 000h, 000h, 050h, 064h, 089h, 025h, 000h, 000h, 000h, 000h, 083h, 0ECh
    db 00Ch, 053h, 055h, 08Bh, 06Ch, 024h, 024h, 08Bh, 045h, 000h, 08Bh, 04Dh, 008h, 08Bh, 05Ch, 081h
    db 0FCh, 056h, 08Bh, 074h, 081h, 0F8h, 057h, 089h, 074h, 024h, 018h, 0C7h, 044h, 024h, 02Ch, 000h
    db 000h, 000h, 000h
    call ?AptGetSwfVersion@@YAIXZ
    db 083h, 0F8h, 007h, 00Fh, 085h, 0F7h, 000h, 000h, 000h, 08Bh, 043h, 004h, 0C1h, 0E8h, 00Fh, 0F6h
    db 0D0h, 0A8h, 001h, 074h, 008h, 0C7h, 044h, 024h, 02Ch, 001h, 000h, 000h, 000h, 08Bh, 04Eh, 004h
    db 0C1h, 0E9h, 00Fh, 0F6h, 0D1h, 0F6h, 0C1h, 001h, 074h, 004h, 0FFh, 044h, 024h, 02Ch, 08Bh, 044h
    db 024h, 02Ch, 048h, 00Fh, 084h, 0B5h, 000h, 000h, 000h, 048h, 00Fh, 085h, 0C0h, 000h, 000h, 000h
    db 0A1h
    dd ?Rva008D2A30Head@@3PAURva008D2A30Node@@A
    db 085h, 0C0h, 074h, 03Bh, 08Bh, 050h, 008h, 089h, 015h
    dd ?Rva008D2A30Head@@3PAURva008D2A30Node@@A
    db 08Bh, 015h
    dd ?g_bfme1211@@3PAVBfmeG1211@@A
    db 08Bh, 072h, 004h, 03Bh, 032h, 08Dh, 04Ah, 004h, 07Ch, 012h, 081h, 060h, 004h, 0FFh, 0FFh, 0FFh
    db 0BFh, 0C6h, 040h, 008h, 001h, 08Bh, 0F8h, 0E9h, 080h, 000h, 000h, 000h, 08Bh, 052h, 008h, 089h
    db 004h, 0B2h, 0FFh, 001h, 0C6h, 040h, 008h, 001h, 08Bh, 0F8h, 0EBh, 070h, 06Ah, 00Ch, 0FFh, 015h
    dd ?Rva008C5D70Alloc@@3P6APAXI@ZA
    db 083h, 0C4h, 004h, 085h, 0C0h, 074h, 055h, 08Bh, 048h, 004h, 081h, 0E1h, 005h, 080h, 000h, 0F0h
    db 081h, 0C9h, 005h, 080h, 000h, 040h, 0C7h, 000h
    dd ??_7AptValue@@6B@
    db 089h, 048h, 004h, 08Bh, 035h
    dd ?g_bfme1211@@3PAVBfmeG1211@@A
    db 08Bh, 07Eh, 004h, 03Bh, 03Eh, 08Dh, 056h, 004h, 07Ch, 017h, 081h, 0E1h, 0FFh, 0FFh, 0FFh, 0BFh
    db 089h, 048h, 004h, 0C7h, 000h
    dd ??_7Rva008995E0Value@@6B@
    db 0C6h, 040h, 008h, 001h, 08Bh, 0F8h, 0EBh, 022h, 08Bh, 04Eh, 008h, 089h, 004h, 0B9h, 0FFh, 002h
    db 0C7h, 000h
    dd ??_7Rva008995E0Value@@6B@
    db 0C6h, 040h, 008h, 001h, 08Bh, 0F8h, 0EBh, 00Ch, 033h, 0C0h, 08Bh, 0F8h, 0EBh, 006h, 08Bh, 03Dh
    dd ?bfmeTheCBC@@3HA
    db 085h, 0FFh, 00Fh, 085h, 058h, 001h, 000h, 000h, 08Bh, 074h, 024h, 018h, 066h, 0A1h
    dd ?Rva012D5298Empty@@3URva00893410Block@@A
    db 0B9h
    dd ?Rva012D5298Empty@@3URva00893410Block@@A
    db 089h, 04Ch, 024h, 014h, 066h, 040h, 066h, 040h, 0C7h, 044h, 024h, 024h, 000h, 000h, 000h, 000h
    db 089h, 04Ch, 024h, 010h, 066h, 0A3h
    dd ?Rva012D5298Empty@@3URva00893410Block@@A
    db 08Dh, 054h, 024h, 014h, 052h, 08Bh, 0CBh, 0C6h, 044h, 024h, 028h, 001h
    call ?getName@Rva8CD130Value@@QAEXPAVRva8CD130String@@@Z
    db 08Dh, 044h, 024h, 010h, 050h, 08Bh, 0CEh
    call ?getName@Rva8CD130Value@@QAEXPAVRva8CD130String@@@Z
    db 08Bh, 044h, 024h, 014h, 08Bh, 054h, 024h, 010h, 00Fh, 0B7h, 048h, 002h, 00Fh, 0B7h, 072h, 002h
    db 03Bh, 0CEh, 075h, 018h, 03Bh, 0C2h, 074h, 00Ch, 08Dh, 07Ah, 008h, 08Dh, 070h, 008h, 033h, 0D2h
    db 0F3h, 0A6h, 075h, 008h, 0C7h, 044h, 024h, 02Ch, 001h, 000h, 000h, 000h, 08Bh, 054h, 024h, 02Ch
    db 0A1h
    dd ?Rva008D2A30Head@@3PAURva008D2A30Node@@A
    db 085h, 0D2h, 00Fh, 095h, 0C3h, 085h, 0C0h, 074h, 032h, 08Bh, 048h, 008h, 08Bh, 015h
    dd ?g_bfme1211@@3PAVBfmeG1211@@A
    db 089h, 00Dh
    dd ?Rva008D2A30Head@@3PAURva008D2A30Node@@A
    db 08Bh, 072h, 004h, 03Bh, 032h, 08Dh, 04Ah, 004h, 07Ch, 00Ch, 081h, 060h, 004h, 0FFh, 0FFh, 0FFh
    db 0BFh, 088h, 058h, 008h, 0EBh, 06Dh, 08Bh, 052h, 008h, 089h, 004h, 0B2h, 0FFh, 001h, 088h, 058h
    db 008h, 0EBh, 060h, 06Ah, 00Ch, 0FFh, 015h
    dd ?Rva008C5D70Alloc@@3P6APAXI@ZA
    db 083h, 0C4h, 004h, 085h, 0C0h, 074h, 04Fh, 08Bh, 048h, 004h, 081h, 0E1h, 005h, 080h, 000h, 0F0h
    db 081h, 0C9h, 005h, 080h, 000h, 040h, 0C7h, 000h
    dd ??_7AptValue@@6B@
    db 089h, 048h, 004h, 08Bh, 035h
    dd ?g_bfme1211@@3PAVBfmeG1211@@A
    db 08Bh, 07Eh, 004h, 03Bh, 03Eh, 08Dh, 056h, 004h, 07Ch, 014h, 081h, 0E1h, 0FFh, 0FFh, 0FFh, 0BFh
    db 089h, 048h, 004h, 0C7h, 000h
    dd ??_7Rva008995E0Value@@6B@
    db 088h, 058h, 008h, 0EBh, 015h, 08Bh, 04Eh, 008h, 089h, 004h, 0B9h, 0FFh, 002h, 0C7h, 000h
    dd ??_7Rva008995E0Value@@6B@
    db 088h, 058h, 008h, 0EBh, 002h, 033h, 0C0h, 08Bh, 0F8h, 08Bh, 044h, 024h, 010h, 066h, 0FFh, 008h
    db 066h, 083h, 038h, 000h, 0C6h, 044h, 024h, 024h, 000h, 075h, 00Dh, 08Bh, 015h
    dd ?Rva00892ED0ReleaseTable@@3PAP6AXPAX@ZA
    db 050h, 0FFh, 052h, 004h, 083h, 0C4h, 004h, 08Bh, 044h, 024h, 014h, 066h, 0FFh, 008h, 066h, 083h
    db 038h, 000h, 0C7h, 044h, 024h, 024h, 0FFh, 0FFh, 0FFh, 0FFh, 075h, 00Ch, 050h, 0A1h
    dd ?Rva00892ED0ReleaseTable@@3PAP6AXPAX@ZA
    db 0FFh, 050h, 004h, 083h, 0C4h, 004h, 0BEh, 001h, 000h, 000h, 000h, 08Bh, 04Dh, 000h, 08Bh, 055h
    db 008h, 02Bh, 0CEh, 08Bh, 00Ch, 08Ah, 08Bh, 041h, 004h, 0C1h, 0E8h, 01Eh, 0A8h, 001h, 075h, 005h
    db 08Bh, 011h, 0FFh, 052h, 004h, 046h, 083h, 0FEh, 002h, 07Eh, 0E0h, 08Bh, 075h, 000h, 08Bh, 04Dh
    db 008h, 083h, 0C6h, 0FEh, 089h, 075h, 000h, 08Bh, 0C6h, 089h, 03Ch, 081h, 0FFh, 045h, 000h, 08Bh
    db 057h, 004h, 0C1h, 0EAh, 01Eh, 0F6h, 0C2h, 001h, 075h, 006h, 08Bh, 007h, 08Bh, 0CFh, 0FFh, 010h
    db 08Bh, 04Ch, 024h, 01Ch, 05Fh, 05Eh, 05Dh, 05Bh, 064h, 089h, 00Dh, 000h, 000h, 000h, 000h, 083h
    db 0C4h, 018h, 0C3h
?Rva008C7500@@YAXXZ ENDP
_TEXT ENDS
END
