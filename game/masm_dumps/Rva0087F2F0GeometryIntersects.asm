.386
.model flat
; ?bfmeIntersects@GeometryInfo@@QBE_NABUCoord3D@@MABV1@0M@Z
; Retail @ 0x0087F2F0 size 480
;
; MASM dump carrying a measured codegen blocker. The reconstructible C++ body
; (targets/game/reverse/attempts/0x0087f2f0.cpp) compiles to exactly 480 bytes
; with 12 relocations and shape 0.993; its whole residue is six
; non-relocation bytes at +0x1BD..+0x1C4: the two allocator reloads at the
; inner-loop-exit merge ($L511) come out in the opposite order. Retail reloads
; the spilled result byte first and the spilled this pointer second
;   +0x1BD  mov al, byte ptr [esp+0x13]   ; result
;   +0x1C1  mov ecx, dword ptr [esp+0x14] ; this
; while VC7.1 always emits the pointer load first, in every spelling measured:
; 30+ variants across three earlier sessions (while(true); early-return; guard
; swaps; volatile; /Oa; /Ow; postfix increment; wrap-if; bottom checks; moved
; checks; local orders; set() variants) plus this session's ref-copy and
; declaration-order swaps, an explicit end-pointer local (reallocates the whole
; body, 408 diffs), /Ot and dropped /Ob2 (no change) and /G7 and /Os (402/368
; diffs). Both loads are allocator-inserted reloads of values spilled at entry;
; no source construct orders them. The dump body is byte-identical to retail
; outside its relocation slots.
; Evidence: targets/game/reverse/identity_evidence/0087f2f0-masm-codegen-blocker.md

EXTERN ?Rva0087E900@@YAXPAURva0087E900Coord@@PBU1@PBURva0087E900Shape@@M@Z:NEAR
EXTERN ?set@BfmeObjF0@@QAEPAV1@PBUBfmePosF0@@PBUBfmeShapeF0@@H@Z:NEAR
EXTERN ?rva00880C30@@YA_NPAURva00880D10Info@@0@Z:NEAR
EXTERN ?rva00880D10@@YA_NPAURva00880D10Subject@@PAURva00880D10Info@@@Z:NEAR
EXTERN ?bfmeSphereOverlap@@YA_NPBUBfmeCollisionShape@@0@Z:NEAR
EXTERN ?releaseBuffer@?$StringBase@D@@AAEXXZ:NEAR
EXTERN __real@00000000:BYTE
_TEXT SEGMENT
public ?bfmeIntersects@GeometryInfo@@QBE_NABUCoord3D@@MABV1@0M@Z
?bfmeIntersects@GeometryInfo@@QBE_NABUCoord3D@@MABV1@0M@Z PROC
    db 81h, 0ECh, 88h, 00h, 00h, 00h, 8Bh, 51h, 30h, 57h, 8Bh, 79h, 2Ch, 32h, 0C0h, 3Bh
    db 0FAh, 89h, 4Ch, 24h, 08h, 88h, 44h, 24h, 07h, 0Fh, 84h, 0B7h, 01h, 00h, 00h, 53h
    db 8Bh, 9Ch, 24h, 98h, 00h, 00h, 00h, 55h, 8Bh, 0ACh, 24h, 0A8h, 00h, 00h, 00h, 56h
    db 8Ah, 57h, 20h, 84h, 0D2h, 0Fh, 84h, 8Ah, 01h, 00h, 00h, 84h, 0C0h, 0Fh, 85h, 90h
    db 01h, 00h, 00h, 8Bh, 84h, 24h, 9Ch, 00h, 00h, 00h, 53h, 57h, 50h, 8Dh, 4Ch, 24h
    db 24h, 51h
    call ?Rva0087E900@@YAXPAURva0087E900Coord@@PBU1@PBURva0087E900Shape@@M@Z
    db 8Bh, 84h, 24h, 0B4h, 00h, 00h, 00h, 8Bh, 70h, 2Ch, 8Bh, 48h, 30h, 83h, 0C4h, 10h
    db 3Bh, 0F1h, 0Fh, 84h, 4Eh, 01h, 00h, 00h, 90h, 8Ah, 46h, 20h, 84h, 0C0h, 0Fh, 84h
    db 2Dh, 01h, 00h, 00h, 8Ah, 44h, 24h, 13h, 84h, 0C0h, 0Fh, 85h, 36h, 01h, 00h, 00h
    db 8Bh, 94h, 24h, 0A8h, 00h, 00h, 00h, 55h, 56h, 52h, 8Dh, 44h, 24h, 30h, 50h
    call ?Rva0087E900@@YAXPAURva0087E900Coord@@PBU1@PBURva0087E900Shape@@M@Z
    db 0D9h, 05h
    dd __real@00000000
    db 8Bh, 07h, 83h, 0C4h, 10h, 85h, 0C0h, 74h, 0Eh, 7Eh, 11h, 83h, 0F8h, 02h, 7Fh, 0Ch
    db 0DDh, 0D8h, 0D9h, 47h, 04h, 0EBh, 05h, 0DDh, 0D8h, 0D9h, 47h, 08h, 0D8h, 47h, 18h, 8Bh
    db 8Ch, 24h, 0A8h, 00h, 00h, 00h, 0D8h, 44h, 24h, 20h, 0D8h, 59h, 08h, 0DFh, 0E0h, 0F6h
    db 0C4h, 05h, 0Fh, 8Bh, 0CFh, 00h, 00h, 00h, 8Bh, 06h, 0D9h, 05h
    dd __real@00000000
    db 85h, 0C0h, 74h, 0Eh, 7Eh, 11h, 83h, 0F8h, 02h, 7Fh, 0Ch, 0DDh, 0D8h, 0D9h, 46h, 04h
    db 0EBh, 05h, 0DDh, 0D8h, 0D9h, 46h, 08h, 0D8h, 46h, 18h, 0D8h, 44h, 24h, 2Ch, 0D8h, 5Ch
    db 24h, 20h, 0DFh, 0E0h, 0F6h, 0C4h, 05h, 0Fh, 8Bh, 9Ah, 00h, 00h, 00h, 53h, 57h, 8Dh
    db 54h, 24h, 20h, 52h, 8Dh, 4Ch, 24h, 70h
    call ?set@BfmeObjF0@@QAEPAV1@PBUBfmePosF0@@PBUBfmeShapeF0@@H@Z
    db 55h, 56h, 8Dh, 44h, 24h, 2Ch, 50h, 8Dh, 4Ch, 24h, 3Ch
    call ?set@BfmeObjF0@@QAEPAV1@PBUBfmePosF0@@PBUBfmeShapeF0@@H@Z
    db 8Bh, 44h, 24h, 64h, 85h, 0C0h, 7Ch, 5Dh, 83h, 0F8h, 01h, 7Eh, 2Ah, 83h, 0F8h, 02h
    db 75h, 53h, 83h, 7Ch, 24h, 30h, 02h, 8Dh, 4Ch, 24h, 30h, 75h, 0Dh, 51h, 8Dh, 54h
    db 24h, 68h, 52h
    call ?rva00880C30@@YA_NPAURva00880D10Info@@0@Z
    db 0EBh, 34h, 8Dh, 44h, 24h, 64h, 50h, 51h
    call ?rva00880D10@@YA_NPAURva00880D10Subject@@PAURva00880D10Info@@@Z
    db 0EBh, 27h, 83h, 7Ch, 24h, 30h, 02h, 75h, 11h, 8Dh, 54h, 24h, 30h, 52h, 8Dh, 44h
    db 24h, 68h, 50h
    call ?rva00880D10@@YA_NPAURva00880D10Subject@@PAURva00880D10Info@@@Z
    db 0EBh, 0Fh, 8Dh, 4Ch, 24h, 30h, 51h, 8Dh, 54h, 24h, 68h, 52h
    call ?bfmeSphereOverlap@@YA_NPBUBfmeCollisionShape@@0@Z
    db 83h, 0C4h, 08h, 88h, 44h, 24h, 13h, 8Dh, 4Ch, 24h, 4Ch
    call ?releaseBuffer@?$StringBase@D@@AAEXXZ
    db 8Dh, 8Ch, 24h, 80h, 00h, 00h, 00h
    call ?releaseBuffer@?$StringBase@D@@AAEXXZ
    db 8Bh, 84h, 24h, 0A4h, 00h, 00h, 00h, 8Bh, 48h, 30h, 83h, 0C6h, 24h, 3Bh, 0F1h, 0Fh
    db 85h, 0B3h, 0FEh, 0FFh, 0FFh, 8Ah, 44h, 24h, 13h, 8Bh, 4Ch, 24h, 14h, 8Bh, 51h, 30h
    db 83h, 0C7h, 24h, 3Bh, 0FAh, 0Fh, 85h, 5Dh, 0FEh, 0FFh, 0FFh, 5Eh, 5Dh, 5Bh, 5Fh, 81h
    db 0C4h, 88h, 00h, 00h, 00h, 0C2h, 14h, 00h
?bfmeIntersects@GeometryInfo@@QBE_NABUCoord3D@@MABV1@0M@Z ENDP
_TEXT ENDS
END
