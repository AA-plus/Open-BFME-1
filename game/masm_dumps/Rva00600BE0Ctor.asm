.386
.model flat
; ??0T1Base_00600BE0@@QAE@PAX0@Z
; Retail @ 0x00600BE0 size 440
;
; Re-homed from the retired mis-anchored ParticleSys_generateParticleInfo.asm
; row (0x006008AF/1257, which began +0x1F inside 0x00600890 and spanned four
; bodies; the real ParticleSystem::generateParticleInfo is 0x005D0530). Bytes
; and symbolic relocations are cut from that verified dump at this body's
; ghidra/int3/ret boundary (identity_evidence/006008af-boundary.md).
;
; Base constructor forwarded to by 0x005E78A0 (ILT 0x0000FB50,
; T1BaseForwardingCtors.cpp pins this name). EH frame, one unwind state.
; C++ not attempted in this re-home. Identity not recovered.
;
EXTERN ??_7?$CategoryModuleInfo@$01@FXParticleSystem@@6B@:BYTE
EXTERN ??_7DefaultModule2Base@@6BBfmeHolderCU@@@:BYTE
EXTERN ??_7DefaultModule2Base@@6BDefaultModule2CategorySlice@FXParticleSystem@@@:BYTE
EXTERN ??_7DefaultModule2Base@@6BDefaultModule2SecondarySlice@FXParticleSystem@@@:BYTE
EXTERN ??_7DefaultModule2SecondarySlice@FXParticleSystem@@6B@:BYTE
EXTERN ??_7Rva005ECFA0@@6B@:BYTE
EXTERN ??_7Rva005ECFA0@@6BV3Slot0@@@:BYTE
EXTERN ??_7Rva005ECFA0@@6BV3Slot1@@@:BYTE
EXTERN ??_7Rva005ECFA0@@6BV3Slot2@@@:BYTE
EXTERN ?j_000033eb@@YAXXZ:NEAR
EXTERN ?j_0002a9f5@@YAXXZ:NEAR
EXTERN g_Va0103CD68:NEAR

_TEXT SEGMENT
_TEXT ENDS
_TEXT$d00a00be0 SEGMENT BYTE PUBLIC FLAT 'CODE'
; retail VA 0x00A00BE0 size 440
public ??0T1Base_00600BE0@@QAE@PAX0@Z
??0T1Base_00600BE0@@QAE@PAX0@Z PROC
    db 06Ah, 0FFh, 068h
    dd g_Va0103CD68
    db 064h, 0A1h, 000h, 000h, 000h, 000h, 050h, 064h, 089h, 025h, 000h, 000h, 000h, 000h, 051h, 08Bh
    db 044h, 024h, 014h, 053h, 056h, 057h, 08Bh, 07Ch, 024h, 024h, 057h, 08Bh, 0F1h, 050h, 089h, 074h
    db 024h, 014h
    call ?j_0002a9f5@@YAXXZ
    db 0C7h, 046h, 014h
    dd ??_7DefaultModule2SecondarySlice@FXParticleSystem@@6B@
    db 0C7h, 046h, 018h
    dd ??_7?$CategoryModuleInfo@$01@FXParticleSystem@@6B@
    db 0C7h, 006h
    dd ??_7DefaultModule2Base@@6BBfmeHolderCU@@@
    db 0C7h, 046h, 014h
    dd ??_7DefaultModule2Base@@6BDefaultModule2SecondarySlice@FXParticleSystem@@@
    db 0C7h, 046h, 018h
    dd ??_7DefaultModule2Base@@6BDefaultModule2CategorySlice@FXParticleSystem@@@
    db 08Dh, 05Eh, 01Ch, 08Bh, 0CBh, 0C7h, 044h, 024h, 018h, 000h, 000h, 000h, 000h
    call ?j_000033eb@@YAXXZ
    db 0C7h, 006h
    dd ??_7Rva005ECFA0@@6BV3Slot0@@@
    db 0C7h, 046h, 014h
    dd ??_7Rva005ECFA0@@6BV3Slot1@@@
    db 0C7h, 046h, 018h
    dd ??_7Rva005ECFA0@@6BV3Slot2@@@
    db 0C7h, 003h
    dd ??_7Rva005ECFA0@@6B@
    db 08Dh, 04Fh, 00Ch, 08Bh, 001h, 08Dh, 056h, 020h, 089h, 002h, 08Bh, 041h, 004h, 089h, 042h, 004h
    db 08Bh, 049h, 008h, 089h, 04Ah, 008h, 08Dh, 057h, 018h, 08Bh, 00Ah, 08Dh, 046h, 02Ch, 089h, 008h
    db 08Bh, 04Ah, 004h, 089h, 048h, 004h, 08Bh, 052h, 008h, 089h, 050h, 008h, 08Dh, 047h, 024h, 08Bh
    db 010h, 08Dh, 04Eh, 038h, 089h, 011h, 08Bh, 050h, 004h, 089h, 051h, 004h, 08Bh, 040h, 008h, 089h
    db 041h, 008h, 08Dh, 04Fh, 030h, 08Bh, 001h, 08Dh, 056h, 044h, 089h, 002h, 08Bh, 041h, 004h, 089h
    db 042h, 004h, 08Bh, 049h, 008h, 089h, 04Ah, 008h, 08Dh, 057h, 03Ch, 08Bh, 00Ah, 08Dh, 046h, 050h
    db 089h, 008h, 08Bh, 04Ah, 004h, 089h, 048h, 004h, 08Bh, 052h, 008h, 089h, 050h, 008h, 08Dh, 047h
    db 048h, 08Bh, 010h, 08Dh, 04Eh, 05Ch, 089h, 011h, 08Bh, 050h, 004h, 089h, 051h, 004h, 08Bh, 040h
    db 008h, 089h, 041h, 008h, 08Dh, 04Fh, 054h, 08Bh, 001h, 08Dh, 056h, 068h, 089h, 002h, 08Bh, 041h
    db 004h, 089h, 042h, 004h, 08Bh, 049h, 008h, 089h, 04Ah, 008h, 08Dh, 057h, 060h, 08Bh, 00Ah, 08Dh
    db 046h, 074h, 089h, 008h, 08Bh, 04Ah, 004h, 089h, 048h, 004h, 08Bh, 052h, 008h, 089h, 050h, 008h
    db 08Dh, 047h, 06Ch, 08Bh, 010h, 08Dh, 08Eh, 080h, 000h, 000h, 000h, 089h, 011h, 08Bh, 050h, 004h
    db 089h, 051h, 004h, 08Bh, 040h, 008h, 089h, 041h, 008h, 08Dh, 04Fh, 078h, 08Bh, 001h, 08Dh, 096h
    db 08Ch, 000h, 000h, 000h, 089h, 002h, 08Bh, 041h, 004h, 089h, 042h, 004h, 08Bh, 049h, 008h, 089h
    db 04Ah, 008h, 08Dh, 097h, 084h, 000h, 000h, 000h, 08Bh, 00Ah, 08Dh, 086h, 098h, 000h, 000h, 000h
    db 089h, 008h, 08Bh, 04Ah, 004h, 089h, 048h, 004h, 08Bh, 052h, 008h, 089h, 050h, 008h, 08Dh, 087h
    db 090h, 000h, 000h, 000h, 08Bh, 010h, 08Dh, 08Eh, 0A4h, 000h, 000h, 000h, 089h, 011h, 08Bh, 050h
    db 004h, 089h, 051h, 004h, 08Bh, 040h, 008h, 089h, 041h, 008h, 08Bh, 08Fh, 09Ch, 000h, 000h, 000h
    db 089h, 08Eh, 0B0h, 000h, 000h, 000h, 08Bh, 04Ch, 024h, 010h, 05Fh, 08Bh, 0C6h, 05Eh, 05Bh, 064h
    db 089h, 00Dh, 000h, 000h, 000h, 000h, 083h, 0C4h, 010h, 0C2h, 008h, 000h
??0T1Base_00600BE0@@QAE@PAX0@Z ENDP
_TEXT$d00a00be0 ENDS
_TEXT SEGMENT
_TEXT ENDS
END
