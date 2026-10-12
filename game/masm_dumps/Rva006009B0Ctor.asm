.386
.model flat
; ??0BaseY005E7940@@QAE@PAVOwnerY005E7940@@@Z
; Retail @ 0x006009B0 size 440
;
; Re-homed from the retired mis-anchored ParticleSys_generateParticleInfo.asm
; row (0x006008AF/1257, which began +0x1F inside 0x00600890 and spanned four
; bodies; the real ParticleSystem::generateParticleInfo is 0x005D0530). Bytes
; and symbolic relocations are cut from that verified dump at this body's
; ghidra/int3/ret boundary (identity_evidence/006008af-boundary.md).
;
; Base constructor of the 102-byte adjusted-owner new family 0x005E7940
; (ILT 0x00049184, Q4NewInlineCtorAdjusted.cpp pins this name). EH frame,
; three unwind states. C++ not attempted in this re-home. Identity not
; recovered.
;
EXTERN ??_7?$CategoryModuleInfo@$01@FXParticleSystem@@6B@:BYTE
EXTERN ??_7Rva005E7A30@@6BPolymorphicVptrBase01073744@@@:BYTE
EXTERN ??_7Rva005E7A30@@6BPolymorphicVptrBase0110F9E8@@@:BYTE
EXTERN ??_7Rva005EA080@@6BT4P0_Rva005E9AE0@@@:BYTE
EXTERN ??_7Rva005EA0D0@@6B@:BYTE
EXTERN ?j_00001b18@@YAXXZ:NEAR
EXTERN ?j_0000d7b5@@YAXXZ:NEAR
EXTERN ?j_00013994@@YAXXZ:NEAR
EXTERN ?j_000438f6@@YAXXZ:NEAR
EXTERN g_Va0103CD4B:NEAR

_TEXT SEGMENT
_TEXT ENDS
_TEXT$d00a009b0 SEGMENT BYTE PUBLIC FLAT 'CODE'
; retail VA 0x00A009B0 size 440
public ??0BaseY005E7940@@QAE@PAVOwnerY005E7940@@@Z
??0BaseY005E7940@@QAE@PAVOwnerY005E7940@@@Z PROC
    db 06Ah, 0FFh, 068h
    dd g_Va0103CD4B
    db 064h, 0A1h, 000h, 000h, 000h, 000h, 050h, 064h, 089h, 025h, 000h, 000h, 000h, 000h, 083h, 0ECh
    db 010h, 053h, 056h, 08Bh, 0F1h, 057h, 089h, 074h, 024h, 00Ch, 0C7h, 046h, 004h
    dd ??_7?$CategoryModuleInfo@$01@FXParticleSystem@@6B@
    db 033h, 0DBh, 0B8h, 000h, 000h, 080h, 03Fh, 089h, 05Ch, 024h, 024h, 0C7h, 046h, 008h
    dd ??_7Rva005EA0D0@@6B@
    db 089h, 046h, 00Ch, 089h, 046h, 010h, 089h, 046h, 014h, 089h, 05Eh, 018h, 089h, 05Eh, 01Ch, 089h
    db 05Eh, 020h, 089h, 05Eh, 024h, 089h, 05Eh, 028h, 089h, 05Eh, 02Ch, 089h, 05Eh, 030h, 089h, 05Eh
    db 034h, 089h, 05Eh, 038h, 0C7h, 046h, 03Ch, 001h, 000h, 000h, 000h, 08Bh, 07Ch, 024h, 02Ch, 08Dh
    db 044h, 024h, 010h, 050h, 08Bh, 0CFh, 0C7h, 006h
    dd ??_7Rva005EA080@@6BT4P0_Rva005E9AE0@@@
    db 0C7h, 046h, 004h
    dd ??_7Rva005E7A30@@6BPolymorphicVptrBase0110F9E8@@@
    db 0C7h, 046h, 008h
    dd ??_7Rva005E7A30@@6BPolymorphicVptrBase01073744@@@
    call ?j_000438f6@@YAXXZ
    db 08Dh, 04Fh, 020h, 0C6h, 044h, 024h, 024h, 002h
    call ?j_0000d7b5@@YAXXZ
    db 0D9h, 05Eh, 00Ch, 08Bh, 044h, 024h, 010h, 03Bh, 0C3h, 075h, 005h
    call ?j_00001b18@@YAXXZ
    db 08Bh, 088h, 088h, 001h, 000h, 000h, 089h, 04Ch, 024h, 02Ch, 08Dh, 04Fh, 02Ch
    call ?j_0000d7b5@@YAXXZ
    db 0D8h, 04Ch, 024h, 02Ch, 08Dh, 04Fh, 038h, 0D9h, 05Eh, 010h
    call ?j_0000d7b5@@YAXXZ
    db 08Dh, 04Fh, 044h, 0D9h, 05Eh, 014h
    call ?j_0000d7b5@@YAXXZ
    db 0D9h, 05Eh, 018h, 08Dh, 04Fh, 050h
    call ?j_0000d7b5@@YAXXZ
    db 0D9h, 05Eh, 01Ch, 08Dh, 04Fh, 05Ch
    call ?j_0000d7b5@@YAXXZ
    db 0D9h, 05Eh, 020h, 08Dh, 04Fh, 068h
    call ?j_0000d7b5@@YAXXZ
    db 0D9h, 05Eh, 024h, 08Dh, 04Fh, 074h
    call ?j_0000d7b5@@YAXXZ
    db 0D9h, 05Eh, 028h, 08Dh, 08Fh, 080h, 000h, 000h, 000h
    call ?j_0000d7b5@@YAXXZ
    db 0D9h, 05Eh, 02Ch, 08Bh, 04Ch, 024h, 010h, 03Bh, 0CBh, 075h, 00Bh
    call ?j_00001b18@@YAXXZ
    db 08Bh, 04Ch, 024h, 010h, 0EBh, 002h, 08Bh, 0C1h, 03Bh, 0CBh, 0D9h, 080h, 084h, 001h, 000h, 000h
    db 0D8h, 046h, 00Ch, 0D9h, 05Eh, 00Ch, 075h, 00Bh
    call ?j_00001b18@@YAXXZ
    db 08Bh, 04Ch, 024h, 010h, 0EBh, 002h, 08Bh, 0C1h, 03Bh, 0CBh, 0D9h, 080h, 084h, 001h, 000h, 000h
    db 0D8h, 046h, 010h, 0D9h, 05Eh, 010h, 075h, 007h
    call ?j_00001b18@@YAXXZ
    db 0EBh, 002h, 08Bh, 0C1h, 0D9h, 080h, 084h, 001h, 000h, 000h, 08Dh, 08Fh, 08Ch, 000h, 000h, 000h
    db 0D8h, 046h, 014h, 0D9h, 05Eh, 014h
    call ?j_0000d7b5@@YAXXZ
    db 08Dh, 08Fh, 098h, 000h, 000h, 000h, 0D9h, 05Eh, 030h
    call ?j_0000d7b5@@YAXXZ
    db 0D9h, 05Eh, 034h, 08Dh, 08Fh, 0A4h, 000h, 000h, 000h
    call ?j_0000d7b5@@YAXXZ
    db 0D9h, 05Eh, 038h, 08Bh, 097h, 0B0h, 000h, 000h, 000h, 08Dh, 04Ch, 024h, 010h, 089h, 056h, 03Ch
    call ?j_00013994@@YAXXZ
    db 08Bh, 04Ch, 024h, 01Ch, 05Fh, 08Bh, 0C6h, 05Eh, 05Bh, 064h, 089h, 00Dh, 000h, 000h, 000h, 000h
    db 083h, 0C4h, 01Ch, 0C2h, 004h, 000h
??0BaseY005E7940@@QAE@PAVOwnerY005E7940@@@Z ENDP
_TEXT$d00a009b0 ENDS
_TEXT SEGMENT
_TEXT ENDS
END
