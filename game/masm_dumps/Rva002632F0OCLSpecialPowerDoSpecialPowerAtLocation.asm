.386
.model flat
; ?Rva002632F0@@YAXXZ
; Retail @ 0x002632F0 size 988 (VA 0x006632F0)
;
; MASM dump carrying a measured VC7.1 codegen blocker: the OCLSpecialPower
; doSpecialPowerAtLocation override (secondary vtable 0x010B6010 slot 13,
; ILT 0x0002780E). The reconstructible C++ bank
; (targets/game/reverse/attempts/0x002632f0.cpp sha256
; 5ba73c266fef5be4f72226a24fb7dc0f81e16ad4dacda8754f4117d9679a9ba6; newest
; TU copy sha256 67c452ed0e91ab86baa8ff6288250c26ad8625d358947c073d5e3c010207031b
; preserved at build/scratch/0x002632f0.bank.cpp) compiles to exactly 988
; bytes with 47 relocations and shape 0.943; its whole residue is 12
; non-relocation displacement bytes: retail keeps the AsciiString vector
; at [esp+0x20] and the waypoint delta at [esp+0x2C] while the C++ build
; swaps them (+0x27B +0x287 +0x28D +0x294 +0x298 +0x29F +0x321 +0x32A
; +0x32E +0x37E +0x382 +0x390). About thirty measured formulations across
; three sessions (declaration order, scopes, const, copy-init, explicit
; temporaries, accessor shapes, local names, compiler flags) leave those
; bytes unchanged and the exception-cleanup frame follows the same swap:
; a frame-slot allocation-order choice, not source-spellable. The dump
; body is byte-identical to retail outside its relocation slots.
; Evidence: targets/game/reverse/identity_evidence/002632f0-masm-codegen-blocker.md
EXTERN ??0?$StringBase@D@@AAE@PBD@Z:NEAR
EXTERN ?Rva012ef214@@3PAVRva0041D290Manager@@A:BYTE
EXTERN ?Rva012ef4cc@@3PAVRva0041D290Client@@A:BYTE
EXTERN ?TheUpgradeCenter@@3PAVBfmeThingND@@A:BYTE
EXTERN ?bfmeAdd1095@BfmeR1095@@QAEXPAUBfmeZ1095B@@H@Z:NEAR
EXTERN ?j_0000e4e4@@YAXXZ:NEAR
EXTERN ?j_00015474@@YAXXZ:NEAR
EXTERN ?j_000170da@@YAXXZ:NEAR
EXTERN ?j_00020824@@YAXXZ:NEAR
EXTERN ?j_00026ab2@@YAXXZ:NEAR
EXTERN ?j_0002F95A@@YAXXZ:NEAR
EXTERN ?j_00037376@@YAXXZ:NEAR
EXTERN ?j_0003af7b@@YAXXZ:NEAR
EXTERN ?j_00043464@@YAXXZ:NEAR
EXTERN ?j_000443e1@@YAXXZ:NEAR
EXTERN __real@43960000:BYTE
EXTERN g_Va0100F838:NEAR
EXTERN g_Va010B61D4:BYTE
EXTERN g_Va010B61EC:BYTE
EXTERN g_Va010B6204:BYTE
EXTERN g_Va010B6220:BYTE
_TEXT SEGMENT

; retail @ 0x002632F0 size 988
_TEXT ENDS
_TEXT$d006632f0 SEGMENT BYTE PUBLIC FLAT 'CODE'
; retail VA 0x006632F0 size 988
public ?Rva002632F0@@YAXXZ
?Rva002632F0@@YAXXZ PROC
    db 06Ah, 0FFh, 064h, 0A1h, 000h, 000h, 000h, 000h, 068h
    dd g_Va0100F838
    db 050h, 064h, 089h, 025h, 000h, 000h, 000h, 000h, 083h, 0ECh, 068h, 053h, 055h, 056h, 057h, 08Bh
    db 0F9h, 08Bh, 047h, 0F8h, 08Bh, 088h, 0A4h, 001h, 000h, 000h, 085h, 0C9h, 00Fh, 085h, 075h, 003h
    db 000h, 000h, 08Bh, 0B4h, 024h, 088h, 000h, 000h, 000h, 085h, 0F6h, 00Fh, 084h, 066h, 003h, 000h
    db 000h, 08Bh, 084h, 024h, 08Ch, 000h, 000h, 000h, 050h, 056h, 08Bh, 0CFh
    call ?j_000170da@@YAXXZ
    db 08Dh, 04Fh, 0F0h
    call ?j_0003af7b@@YAXXZ
    db 08Bh, 0D8h, 08Bh, 047h, 0F4h, 089h, 044h, 024h, 010h, 08Bh, 080h, 020h, 002h, 000h, 000h, 083h
    db 0F8h, 007h, 00Fh, 087h, 0A9h, 002h, 000h, 000h, 0FFh, 024h, 085h
    dd ?Rva002632F0@@YAXXZ + 03BCh
    db 08Bh, 047h, 0F8h, 083h, 0C0h, 038h, 050h, 08Dh, 044h, 024h, 03Ch, 0EBh, 04Bh, 08Bh, 00Dh
    dd ?Rva012ef4cc@@3PAVRva0041D290Client@@A
    db 08Bh, 011h, 056h, 08Dh, 044h, 024h, 048h, 050h, 0FFh, 052h, 034h, 08Bh, 008h, 089h, 04Ch, 024h
    db 014h, 08Bh, 050h, 004h, 08Bh, 00Dh
    dd ?Rva012ef214@@3PAVRva0041D290Manager@@A
    db 089h, 054h, 024h, 018h, 08Bh, 040h, 008h, 08Dh, 054h, 024h, 014h, 089h, 044h, 024h, 01Ch, 08Bh
    db 049h, 00Ch, 052h
    call ?j_0000e4e4@@YAXXZ
    db 06Ah, 000h, 06Ah, 000h, 08Dh, 04Ch, 024h, 01Ch, 051h, 0E9h, 042h, 002h, 000h, 000h, 056h, 08Dh
    db 044h, 024h, 054h, 08Bh, 00Dh
    dd ?Rva012ef4cc@@3PAVRva0041D290Client@@A
    db 08Bh, 011h, 050h, 0FFh, 052h, 034h, 08Bh, 008h, 089h, 04Ch, 024h, 014h, 08Bh, 050h, 004h, 08Bh
    db 00Dh
    dd ?Rva012ef214@@3PAVRva0041D290Manager@@A
    db 089h, 054h, 024h, 018h, 08Bh, 040h, 008h, 08Dh, 054h, 024h, 014h, 089h, 044h, 024h, 01Ch, 08Bh
    db 049h, 00Ch, 052h
    call ?j_0000e4e4@@YAXXZ
    db 06Ah, 000h, 056h, 08Dh, 04Ch, 024h, 01Ch, 051h, 0E9h, 0FDh, 001h, 000h, 000h, 08Bh, 00Dh
    dd ?Rva012ef4cc@@3PAVRva0041D290Client@@A
    db 08Bh, 011h, 056h, 08Dh, 044h, 024h, 060h, 050h, 0FFh, 052h, 038h, 08Bh, 008h, 089h, 04Ch, 024h
    db 014h, 08Bh, 050h, 004h, 08Bh, 00Dh
    dd ?Rva012ef214@@3PAVRva0041D290Manager@@A
    db 089h, 054h, 024h, 018h, 08Bh, 040h, 008h, 089h, 044h, 024h, 01Ch, 0D9h, 044h, 024h, 01Ch, 0D8h
    db 005h
    dd __real@43960000
    db 08Dh, 054h, 024h, 014h, 052h, 0D9h, 05Ch, 024h, 020h, 08Bh, 049h, 00Ch
    call ?j_0000e4e4@@YAXXZ
    db 06Ah, 000h, 056h, 08Dh, 04Ch, 024h, 01Ch, 051h, 0E9h, 0AAh, 001h, 000h, 000h, 08Bh, 016h, 08Bh
    db 046h, 004h, 08Bh, 04Eh, 008h, 06Ah, 000h, 089h, 054h, 024h, 018h, 089h, 044h, 024h, 01Ch, 089h
    db 04Ch, 024h, 020h, 06Ah, 000h, 0E9h, 088h, 001h, 000h, 000h, 08Bh, 04Eh, 004h, 08Bh, 006h, 08Bh
    db 056h, 008h, 06Ah, 000h, 06Ah, 000h, 089h, 04Ch, 024h, 020h, 056h, 08Dh, 04Ch, 024h, 020h, 089h
    db 044h, 024h, 020h, 08Bh, 047h, 0F8h, 051h, 050h, 053h, 089h, 054h, 024h, 034h
    call ?j_000443e1@@YAXXZ
    db 083h, 0C4h, 018h, 0E9h, 06Ah, 001h, 000h, 000h, 08Bh, 016h, 08Bh, 046h, 004h, 08Bh, 04Eh, 008h
    db 06Ah, 000h, 089h, 054h, 024h, 018h, 089h, 044h, 024h, 01Ch, 06Ah, 000h, 0E9h, 02Dh, 001h, 000h
    db 000h, 051h, 089h, 0A4h, 024h, 08Ch, 000h, 000h, 000h, 08Bh, 0CCh, 068h
    dd g_Va010B6220
    call ??0?$StringBase@D@@AAE@PBD@Z
    db 08Bh, 00Dh
    dd ?Rva012ef4cc@@3PAVRva0041D290Client@@A
    db 08Bh, 001h, 0FFh, 050h, 07Ch, 051h, 089h, 0A4h, 024h, 08Ch, 000h, 000h, 000h, 08Bh, 0CCh, 068h
    dd g_Va010B6204
    db 089h, 044h, 024h, 070h
    call ??0?$StringBase@D@@AAE@PBD@Z
    db 08Bh, 00Dh
    dd ?Rva012ef4cc@@3PAVRva0041D290Client@@A
    db 08Bh, 011h, 0FFh, 052h, 07Ch, 051h, 089h, 0A4h, 024h, 08Ch, 000h, 000h, 000h, 08Bh, 0CCh, 068h
    dd g_Va010B61EC
    db 089h, 044h, 024h, 074h
    call ??0?$StringBase@D@@AAE@PBD@Z
    db 08Bh, 00Dh
    dd ?Rva012ef4cc@@3PAVRva0041D290Client@@A
    db 08Bh, 001h, 0FFh, 050h, 07Ch, 051h, 089h, 0A4h, 024h, 08Ch, 000h, 000h, 000h, 08Bh, 0CCh, 068h
    dd g_Va010B61D4
    db 089h, 044h, 024h, 078h
    call ??0?$StringBase@D@@AAE@PBD@Z
    db 08Bh, 00Dh
    dd ?Rva012ef4cc@@3PAVRva0041D290Client@@A
    db 08Bh, 011h, 0FFh, 052h, 07Ch, 089h, 044h, 024h, 074h, 0C7h, 084h, 024h, 08Ch, 000h, 000h, 000h
    db 0FFh, 0FFh, 0FFh, 0FFh, 0C7h, 084h, 024h, 088h, 000h, 000h, 000h, 080h, 04Fh, 0C3h, 047h, 033h
    db 0EDh, 08Dh, 09Bh, 000h, 000h, 000h, 000h, 08Bh, 044h, 0ACh, 068h, 085h, 0C0h, 074h, 050h, 0D9h
    db 040h, 00Ch, 08Dh, 04Ch, 024h, 02Ch, 0D9h, 040h, 010h, 08Bh, 040h, 014h, 0D9h, 0C9h, 089h, 044h
    db 024h, 034h, 0D8h, 026h, 0D9h, 05Ch, 024h, 02Ch, 0D8h, 066h, 004h, 0D9h, 05Ch, 024h, 030h, 0D9h
    db 044h, 024h, 034h, 0D8h, 066h, 008h, 0D9h, 05Ch, 024h, 034h
    call ?j_00043464@@YAXXZ
    db 0D8h, 094h, 024h, 088h, 000h, 000h, 000h, 0DFh, 0E0h, 0F6h, 0C4h, 005h, 07Ah, 010h, 0D9h, 09Ch
    db 024h, 088h, 000h, 000h, 000h, 089h, 0ACh, 024h, 08Ch, 000h, 000h, 000h, 0EBh, 002h, 0DDh, 0D8h
    db 045h, 083h, 0FDh, 004h, 07Ch, 0A2h, 08Bh, 084h, 024h, 08Ch, 000h, 000h, 000h, 085h, 0C0h, 07Ch
    db 03Eh, 08Bh, 04Ch, 084h, 068h, 083h, 0C1h, 00Ch, 08Bh, 011h, 089h, 054h, 024h, 014h, 08Bh, 041h
    db 004h, 06Ah, 000h, 089h, 044h, 024h, 01Ch, 08Bh, 049h, 008h, 056h, 089h, 04Ch, 024h, 024h, 0D9h
    db 044h, 024h, 024h, 0D8h, 005h
    dd __real@43960000
    db 0D9h, 05Ch, 024h, 024h, 08Dh, 054h, 024h, 01Ch, 052h, 08Bh, 047h, 0F8h, 050h, 053h
    call ?j_00037376@@YAXXZ
    db 083h, 0C4h, 014h, 08Bh, 044h, 024h, 010h, 005h, 024h, 002h, 000h, 000h, 050h, 08Dh, 04Ch, 024h
    db 024h
    call ?j_00015474@@YAXXZ
    db 08Bh, 04Ch, 024h, 024h, 08Bh, 044h, 024h, 020h, 02Bh, 0C8h, 0C1h, 0F9h, 002h, 033h, 0DBh, 085h
    db 0C9h, 0C7h, 084h, 024h, 080h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 076h, 048h, 0EBh, 006h
    db 08Dh, 09Bh, 000h, 000h, 000h, 000h, 08Bh, 00Dh
    dd ?TheUpgradeCenter@@3PAVBfmeThingND@@A
    db 08Dh, 014h, 098h, 052h
    call ?j_0002F95A@@YAXXZ
    db 08Bh, 0F0h, 085h, 0F6h, 074h, 02Bh, 08Bh, 046h, 004h, 085h, 0C0h, 075h, 012h, 08Bh, 04Fh, 0F8h
    call ?j_00020824@@YAXXZ
    db 06Ah, 002h, 056h, 08Bh, 0C8h
    call ?bfmeAdd1095@BfmeR1095@@QAEXPAUBfmeZ1095B@@H@Z
    db 08Bh, 04Ch, 024h, 024h, 08Bh, 044h, 024h, 020h, 02Bh, 0C8h, 043h, 0C1h, 0F9h, 002h, 03Bh, 0D9h
    db 072h, 0C0h, 08Dh, 04Ch, 024h, 020h, 0C7h, 084h, 024h, 080h, 000h, 000h, 000h, 0FFh, 0FFh, 0FFh
    db 0FFh
    call ?j_00026ab2@@YAXXZ
    db 08Bh, 04Ch, 024h, 078h, 05Fh, 05Eh, 05Dh, 064h, 089h, 00Dh, 000h, 000h, 000h, 000h, 05Bh, 083h
    db 0C4h, 074h, 0C2h, 008h, 000h, 08Dh, 049h, 000h
    dd ?Rva002632F0@@YAXXZ + 075h
    dd ?Rva002632F0@@YAXXZ + 082h
    dd ?Rva002632F0@@YAXXZ + 0C8h
    dd ?Rva002632F0@@YAXXZ + 0160h
    dd ?Rva002632F0@@YAXXZ + 017Dh
    dd ?Rva002632F0@@YAXXZ + 01ADh
    dd ?Rva002632F0@@YAXXZ + 010Dh
    dd ?Rva002632F0@@YAXXZ + 01C6h
?Rva002632F0@@YAXXZ ENDP
_TEXT$d006632f0 ENDS
END
