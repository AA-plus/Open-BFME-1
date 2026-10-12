.386
.model flat
; ?Rva008FEF60Method@@YA_NPAVRenderObjClass@@PAPAVTextureClass@@H@Z
; Retail @ 0x008FEF60 size 244 (VA 0x00CFEF60)
;
; MASM dump carrying a measured VC7.1 codegen blocker: address-derived
; helper that swaps a material texture slot. The reconstructible C++ body
; (targets/game/reverse/attempts/0x008fef60.cpp, TU copy at
; game/Libraries/Source/WWVegas/WW3D2/Rva008FEF60MaterialTextureSwap.cpp)
; compiles to exactly 244 bytes with 11 relocations and shape 1.000; its
; whole residue is ONE non-relocation byte at +0x7A: retail's jne at +0x79
; reaches +0x85 (the handle test, ECX still live from the +0x66 load), the
; C++ build jumps to +0x81 (its reload joins earlier). ~30 measured
; formulations (if/else orders, prefix/postfix decrement, named result, count
; local and reference, explicit destructor body, accessor and early-return
; destructor shapes, five _ReadWriteBarrier/_WriteBarrier placements, /G5
; /G6 /G7 /Ob1 /Os /Ot /Oa /Ow /Og /Oy- /Gs /GF flag sweep) leave that single
; byte unchanged: a block-merge/register-liveness choice, not source-spellable.
; The dump body is byte-identical to retail outside its relocation slots.
; Evidence: targets/game/reverse/identity_evidence/008fef60-masm-codegen-blocker.md
EXTERN g_Va0105AC08:NEAR
EXTERN ?j_000366dd@@YAXXZ:NEAR
EXTERN ?Release_Ref@TextureClass@@QAEXXZ:NEAR
EXTERN ?invoke@Rva0092C3E0@@QAEXXZ:NEAR
EXTERN ?bfmeSetSlot@Bfme5TextureArray@@QAEXHPAPAVTextureClass@@@Z:NEAR
_TEXT SEGMENT
; retail VA 0x00CFEF60 size 244
public ?Rva008FEF60Method@@YA_NPAVRenderObjClass@@PAPAVTextureClass@@H@Z
?Rva008FEF60Method@@YA_NPAVRenderObjClass@@PAPAVTextureClass@@H@Z PROC
    db 06Ah, 0FFh, 068h
    dd g_Va0105AC08
    db 064h, 0A1h, 000h, 000h, 000h, 000h, 050h, 064h, 089h, 025h, 000h, 000h, 000h, 000h, 051h, 055h
    db 08Bh, 06Ch, 024h, 018h, 057h, 08Bh, 0F9h, 085h, 0FFh, 074h, 005h, 083h, 03Bh, 000h, 075h, 013h
    db 05Fh, 032h, 0C0h, 05Dh, 08Bh, 04Ch, 024h, 004h, 064h, 089h, 00Dh, 000h, 000h, 000h, 000h, 083h
    db 0C4h, 010h, 0C3h, 08Bh, 007h, 056h, 08Bh, 0CFh, 0FFh, 090h, 050h, 001h, 000h, 000h, 08Bh, 0F0h
    db 085h, 0F6h, 074h, 04Bh, 039h, 06Eh, 030h, 07Eh, 046h, 08Bh, 017h, 08Bh, 0CFh, 0FFh, 052h, 014h
    db 08Bh, 0F8h, 055h, 08Dh, 044h, 024h, 010h, 050h, 08Bh, 0CEh
    call ?j_000366dd@@YAXXZ
    db 08Bh, 04Ch, 024h, 00Ch, 03Bh, 00Bh, 0C7h, 044h, 024h, 018h, 000h, 000h, 000h, 000h, 075h, 034h
    db 0FFh, 04Eh, 004h, 075h, 00Ah, 08Bh, 016h, 08Bh, 0CEh, 0FFh, 012h, 08Bh, 04Ch, 024h, 00Ch, 085h
    db 0C9h, 0C7h, 044h, 024h, 018h, 0FFh, 0FFh, 0FFh, 0FFh, 074h, 005h
    call ?Release_Ref@TextureClass@@QAEXXZ
    db 05Eh, 05Fh, 032h, 0C0h, 05Dh, 08Bh, 04Ch, 024h, 004h, 064h, 089h, 00Dh, 000h, 000h, 000h, 000h
    db 083h, 0C4h, 010h, 0C3h, 053h, 08Dh, 044h, 024h, 010h, 050h, 08Bh, 0CFh
    call ?invoke@Rva0092C3E0@@QAEXXZ
    db 053h, 055h, 08Bh, 0CEh
    call ?bfmeSetSlot@Bfme5TextureArray@@QAEXHPAPAVTextureClass@@@Z
    db 0FFh, 04Eh, 004h, 075h, 006h, 08Bh, 016h, 08Bh, 0CEh, 0FFh, 012h, 08Bh, 04Ch, 024h, 00Ch, 085h
    db 0C9h, 0C7h, 044h, 024h, 018h, 0FFh, 0FFh, 0FFh, 0FFh, 074h, 005h
    call ?Release_Ref@TextureClass@@QAEXXZ
    db 08Bh, 04Ch, 024h, 010h, 05Eh, 05Fh, 0B0h, 001h, 05Dh, 064h, 089h, 00Dh, 000h, 000h, 000h, 000h
    db 083h, 0C4h, 010h, 0C3h
?Rva008FEF60Method@@YA_NPAVRenderObjClass@@PAPAVTextureClass@@H@Z ENDP
_TEXT ENDS
END
