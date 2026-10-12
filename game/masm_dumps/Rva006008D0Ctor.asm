.386
.model flat
; ??0Rva006008D0@@QAE@PAXPAVV3HostRva005E7AD0@@@Z
; Retail @ 0x006008D0 size 178
;
; Re-homed from the retired mis-anchored ParticleSys_generateParticleInfo.asm
; row (0x006008AF/1257, which began +0x1F inside 0x00600890 and spanned four
; bodies; the real ParticleSystem::generateParticleInfo is 0x005D0530). Bytes
; and symbolic relocations are cut from that verified dump at this body's
; ghidra/int3/ret boundary (identity_evidence/006008af-boundary.md).
;
; Base constructor forwarded to by the factory 0x005E7AD0 (ILT 0x00046E48,
; V3NewInlineCtorFactories.cpp pins this name). Blocker: the C++ shape of
; Rva005FFAC0Ctor.cpp compiles byte-exact (178/178) but its vftables are
; recorded only under ??_7Rva005EB1F0@@..., so the class identity disagrees
; with this pinned constructor name; reconciling needs a pin/identity repair.
; Identity not recovered.
;
EXTERN ??_7?$CategoryModuleInfo@$01@FXParticleSystem@@6B@:BYTE
EXTERN ??_7Rva005EA0D0@@6B@:BYTE
EXTERN ??_7Rva005EB1F0@@6B@:BYTE
EXTERN ??_7Rva005EB1F0@@6BV3Slot0N@@@:BYTE
EXTERN ??_7Rva005EB1F0@@6BV3Slot1@@@:BYTE

_TEXT SEGMENT
_TEXT ENDS
_TEXT$d00a008d0 SEGMENT BYTE PUBLIC FLAT 'CODE'
; retail VA 0x00A008D0 size 178
public ??0Rva006008D0@@QAE@PAXPAVV3HostRva005E7AD0@@@Z
??0Rva006008D0@@QAE@PAXPAVV3HostRva005E7AD0@@@Z PROC
    db 08Bh, 0C1h, 08Bh, 04Ch, 024h, 004h, 089h, 048h, 004h, 0C7h, 040h, 008h
    dd ??_7?$CategoryModuleInfo@$01@FXParticleSystem@@6B@
    db 0C7h, 040h, 00Ch
    dd ??_7Rva005EA0D0@@6B@
    db 0C7h, 040h, 040h, 001h, 000h, 000h, 000h, 0B9h, 000h, 000h, 080h, 03Fh, 089h, 048h, 010h, 089h
    db 048h, 014h, 089h, 048h, 018h, 033h, 0C9h, 089h, 048h, 01Ch, 089h, 048h, 020h, 089h, 048h, 024h
    db 089h, 048h, 028h, 089h, 048h, 02Ch, 089h, 048h, 030h, 089h, 048h, 034h, 089h, 048h, 038h, 089h
    db 048h, 03Ch, 08Bh, 04Ch, 024h, 008h, 0C7h, 000h
    dd ??_7Rva005EB1F0@@6BV3Slot0N@@@
    db 0C7h, 040h, 008h
    dd ??_7Rva005EB1F0@@6BV3Slot1@@@
    db 0C7h, 040h, 00Ch
    dd ??_7Rva005EB1F0@@6B@
    db 08Bh, 051h, 00Ch, 089h, 050h, 010h, 08Bh, 051h, 010h, 089h, 050h, 014h, 08Bh, 051h, 014h, 089h
    db 050h, 018h, 08Bh, 051h, 018h, 089h, 050h, 01Ch, 08Bh, 051h, 01Ch, 089h, 050h, 020h, 08Bh, 051h
    db 020h, 089h, 050h, 024h, 08Bh, 051h, 024h, 089h, 050h, 028h, 08Bh, 051h, 028h, 089h, 050h, 02Ch
    db 08Bh, 051h, 02Ch, 089h, 050h, 030h, 08Bh, 051h, 030h, 089h, 050h, 034h, 08Bh, 051h, 034h, 089h
    db 050h, 038h, 08Bh, 051h, 038h, 089h, 050h, 03Ch, 08Bh, 049h, 03Ch, 089h, 048h, 040h, 0C2h, 008h
    db 000h
??0Rva006008D0@@QAE@PAXPAVV3HostRva005E7AD0@@@Z ENDP
_TEXT$d00a008d0 ENDS
_TEXT SEGMENT
_TEXT ENDS
END
