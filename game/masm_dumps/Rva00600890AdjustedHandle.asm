.386
.model flat
; ?handle@Rva005E7BF0@@UAEXXZ
; Retail @ 0x00600890 size 46
;
; Re-homed from the retired mis-anchored ParticleSys_generateParticleInfo.asm
; row (0x006008AF/1257, which began +0x1F inside 0x00600890 and spanned four
; bodies; the real ParticleSystem::generateParticleInfo is 0x005D0530). Bytes
; and symbolic relocations are cut from that verified dump at this body's
; ghidra/int3/ret boundary (identity_evidence/006008af-boundary.md).
;
; Reached through ILT 0x00044D37 and the adjustor thunk 0x005E7BF0
; (AdjustorThunks.cpp), whose address-derived pin names it. Codegen blocker:
; the body takes one stack argument (ret 4) while the thunk family declares
; handle() with none, so no C++ spelling under the pinned name can match.
; Identity not recovered.
;
EXTERN ?j_0000ba19@@YAXXZ:NEAR

_TEXT SEGMENT
_TEXT ENDS
_TEXT$d00a00890 SEGMENT BYTE PUBLIC FLAT 'CODE'
; retail VA 0x00A00890 size 46
public ?handle@Rva005E7BF0@@UAEXXZ
?handle@Rva005E7BF0@@UAEXXZ PROC
    db 051h, 056h, 08Bh, 074h, 024h, 00Ch, 057h, 08Bh, 0F9h, 0B0h, 001h, 08Dh, 04Ch, 024h, 008h, 088h
    db 044h, 024h, 008h, 088h, 044h, 024h, 009h, 08Bh, 006h, 051h, 08Bh, 0CEh, 0FFh, 050h, 028h, 056h
    db 08Dh, 04Fh, 00Ch
    call ?j_0000ba19@@YAXXZ
    db 05Fh, 05Eh, 059h, 0C2h, 004h, 000h
?handle@Rva005E7BF0@@UAEXXZ ENDP
_TEXT$d00a00890 ENDS
_TEXT SEGMENT
_TEXT ENDS
END
