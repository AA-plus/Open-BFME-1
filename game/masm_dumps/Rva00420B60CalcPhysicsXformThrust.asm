.386
.model flat
; ?Rva00420B60@@YAXXZ
; Retail @ 0x00420B60 size 1743
;
; MASM dump carrying a measured codegen blocker. Identity is proven: the
; matched calcPhysicsXform dispatcher at 0x004213F0 sends appearance 4
; (LOCO_THRUST) through ILT 0x00027651 to this body, and symbols.csv pins
; ?calcPhysicsXformThrust@Drawable@@IAEXPBVLocomotor@@AAUPhysicsXformInfo@1@@Z
; to that ILT slot; because the name already lives at its thunk address this
; row keeps the address-derived placeholder (same pattern as Rva007171F0).
; Body: `push -1`; FS cookie; `sub esp,0x4C`; the `ret 8` at +0x6CC and INT3
; padding after confirm the 1743-byte extent. The reconstructible C++ body
; (targets/game/reverse/attempts/0x00420b60.cpp) compiles to exactly 1743
; bytes with 36 relocations and shape 0.996; its whole residue is 21
; non-relocation bytes in two x87 scheduler spots, +0x25E and +0x2A8, where
; the C++ body loads the corner-vector begin pointer (`mov ecx/edx,[esp+0x40]`)
; one slot BEFORE the preceding `fmul st(1)` while retail interleaves the
; load after it; instruction mix, registers and frame are otherwise identical
; across all 1743 bytes. Waves measured: ZH-shaped inline
; Overridable::getFinalOverride, front/rear midpoints as Coord2D locals,
; geometry reference into a local before get2DBounds, heights summed low
; index first, operand-order respellings, scalar RHS locals (1743B/21),
; grouping a corner behind a reference (1731B/1010), /Oa (1611B/1367),
; volatile operator[] (1793B/1458), inline corner-store proxy, splitting both
; products into named Real intermediates (1747B/985), plus nine bounded
; shape-search trials (indexed access, begin(), references, scalar
; temporaries, barriers, volatile, helpers). The dump body is byte-identical
; to retail in all 1743 bytes (it carries no relocation slots; the gen-dump
; slab encoded every reference literally and .asm files are outside the
; link-debt scanner, matching the Rva009C3630SpreadWmt precedent).
; Evidence: targets/game/reverse/identity_evidence/00420b60-masm-codegen-blocker.md
_TEXT SEGMENT
public ?Rva00420B60@@YAXXZ
?Rva00420B60@@YAXXZ PROC
    db 6Ah, 0FFh, 64h, 0A1h, 00h, 00h, 00h, 00h, 68h, 38h, 0Dh, 02h, 01h, 50h, 64h, 89h
    db 25h, 00h, 00h, 00h, 00h, 83h, 0ECh, 4Ch, 53h, 55h, 56h, 8Bh, 0E9h, 8Bh, 85h, 38h
    db 01h, 00h, 00h, 33h, 0F6h, 3Bh, 0C6h, 57h, 75h, 1Fh, 6Ah, 58h, 0E8h, 9Fh, 13h, 46h
    db 00h, 83h, 0C4h, 04h, 3Bh, 0C6h, 74h, 09h, 8Bh, 0C8h, 0E8h, 38h, 0D0h, 0C0h, 0FFh, 0EBh
    db 02h, 33h, 0C0h, 89h, 85h, 38h, 01h, 00h, 00h, 8Bh, 7Ch, 24h, 6Ch, 8Bh, 47h, 04h
    db 3Bh, 0C6h, 75h, 04h, 33h, 0C0h, 0EBh, 0Ch, 8Bh, 48h, 04h, 3Bh, 0CEh, 74h, 05h, 0E8h
    db 0F7h, 16h, 0BEh, 0FFh, 8Bh, 80h, 84h, 00h, 00h, 00h, 89h, 44h, 24h, 10h, 8Bh, 47h
    db 04h, 3Bh, 0C6h, 75h, 04h, 33h, 0C0h, 0EBh, 0Ch, 8Bh, 48h, 04h, 3Bh, 0CEh, 74h, 05h
    db 0E8h, 0D6h, 16h, 0BEh, 0FFh, 8Bh, 88h, 8Ch, 00h, 00h, 00h, 8Bh, 47h, 04h, 3Bh, 0C6h
    db 89h, 4Ch, 24h, 1Ch, 75h, 04h, 33h, 0C0h, 0EBh, 0Ch, 8Bh, 48h, 04h, 3Bh, 0CEh, 74h
    db 05h, 0E8h, 0B5h, 16h, 0BEh, 0FFh, 8Bh, 90h, 90h, 00h, 00h, 00h, 8Bh, 47h, 04h, 3Bh
    db 0C6h, 89h, 54h, 24h, 2Ch, 75h, 04h, 33h, 0C0h, 0EBh, 0Ch, 8Bh, 48h, 04h, 3Bh, 0CEh
    db 74h, 05h, 0E8h, 94h, 16h, 0BEh, 0FFh, 8Bh, 80h, 94h, 00h, 00h, 00h, 89h, 44h, 24h
    db 20h, 8Bh, 47h, 04h, 3Bh, 0C6h, 75h, 04h, 33h, 0C0h, 0EBh, 0Ch, 8Bh, 48h, 04h, 3Bh
    db 0CEh, 74h, 05h, 0E8h, 73h, 16h, 0BEh, 0FFh, 8Bh, 88h, 98h, 00h, 00h, 00h, 8Bh, 47h
    db 04h, 3Bh, 0C6h, 89h, 4Ch, 24h, 30h, 75h, 04h, 33h, 0C0h, 0EBh, 0Ch, 8Bh, 48h, 04h
    db 3Bh, 0CEh, 74h, 05h, 0E8h, 52h, 16h, 0BEh, 0FFh, 8Bh, 90h, 0B4h, 00h, 00h, 00h, 8Bh
    db 85h, 0FCh, 00h, 00h, 00h, 3Bh, 0C6h, 89h, 54h, 24h, 18h, 89h, 44h, 24h, 14h, 0Fh
    db 84h, 95h, 05h, 00h, 00h, 39h, 0B0h, 08h, 02h, 00h, 00h, 0Fh, 84h, 89h, 05h, 00h
    db 00h, 8Bh, 0CDh, 0E8h, 95h, 0A4h, 0C2h, 0FFh, 89h, 44h, 24h, 28h, 8Bh, 45h, 44h, 89h
    db 44h, 24h, 6Ch, 89h, 74h, 24h, 40h, 89h, 74h, 24h, 44h, 89h, 74h, 24h, 48h, 8Bh
    db 0BDh, 50h, 01h, 00h, 00h, 89h, 74h, 24h, 64h, 32h, 0DBh, 0EBh, 03h, 8Dh, 49h, 00h
    db 8Bh, 0Fh, 85h, 0C9h, 74h, 54h, 8Bh, 11h, 0FFh, 92h, 9Ch, 00h, 00h, 00h, 85h, 0C0h
    db 74h, 38h, 8Bh, 10h, 6Ah, 00h, 8Dh, 4Ch, 24h, 44h, 51h, 8Bh, 0C8h, 0FFh, 92h, 0A4h
    db 00h, 00h, 00h, 84h, 0C0h, 74h, 23h, 8Bh, 4Ch, 24h, 44h, 8Bh, 74h, 24h, 40h, 2Bh
    db 0CEh, 0B8h, 0ABh, 0AAh, 0AAh, 2Ah, 0F7h, 0E9h, 0D1h, 0FAh, 8Bh, 0C2h, 0C1h, 0E8h, 1Fh, 03h
    db 0C2h, 83h, 0F8h, 04h, 72h, 08h, 0B3h, 01h, 0EBh, 04h, 8Bh, 74h, 24h, 40h, 83h, 0C7h
    db 04h, 84h, 0DBh, 74h, 0ABh, 0E9h, 4Dh, 01h, 00h, 00h, 84h, 0DBh, 0Fh, 85h, 45h, 01h
    db 00h, 00h, 8Bh, 4Ch, 24h, 14h, 8Dh, 54h, 24h, 4Ch, 52h, 6Ah, 00h, 8Dh, 44h, 24h
    db 3Ch, 81h, 0C1h, 0ACh, 00h, 00h, 00h, 50h, 0C7h, 44h, 24h, 40h, 00h, 00h, 00h, 00h
    db 0C7h, 44h, 24h, 44h, 00h, 00h, 00h, 00h, 0C7h, 44h, 24h, 48h, 00h, 00h, 00h, 00h
    db 0E8h, 1Bh, 0D6h, 45h, 00h, 83h, 0ECh, 0Ch, 89h, 64h, 24h, 30h, 6Ah, 04h, 8Dh, 4Ch
    db 24h, 50h, 0E8h, 0BDh, 0E7h, 0BEh, 0FFh, 8Bh, 74h, 24h, 6Ch, 56h, 0E8h, 9Fh, 2Bh, 45h
    db 00h, 0D9h, 5Ch, 24h, 70h, 56h, 0E8h, 0A5h, 2Bh, 45h, 00h, 0D9h, 44h, 24h, 5Ch, 0D8h
    db 0C9h, 8Bh, 4Ch, 24h, 48h, 0D9h, 44h, 24h, 60h, 8Bh, 44h, 24h, 30h, 0D8h, 4Ch, 24h
    db 74h, 83h, 0C4h, 08h, 0DEh, 0E9h, 0D9h, 59h, 0Ch, 8Bh, 54h, 24h, 40h, 0D9h, 44h, 24h
    db 58h, 0D8h, 0C9h, 0D9h, 44h, 24h, 54h, 0D8h, 4Ch, 24h, 6Ch, 0DEh, 0C1h, 0D9h, 5Ah, 10h
    db 8Bh, 48h, 08h, 8Bh, 54h, 24h, 40h, 89h, 4Ah, 14h, 0D9h, 44h, 24h, 4Ch, 0D8h, 0C9h
    db 8Bh, 4Ch, 24h, 40h, 0D9h, 44h, 24h, 58h, 0D8h, 4Ch, 24h, 6Ch, 0DEh, 0E9h, 0D9h, 19h
    db 8Bh, 54h, 24h, 40h, 0D9h, 44h, 24h, 58h, 0D8h, 0C9h, 0D9h, 44h, 24h, 4Ch, 0D8h, 4Ch
    db 24h, 6Ch, 0DEh, 0C1h, 0D9h, 5Ah, 04h, 8Bh, 48h, 08h, 8Bh, 54h, 24h, 40h, 89h, 4Ah
    db 08h, 0D9h, 44h, 24h, 54h, 8Bh, 4Ch, 24h, 40h, 0D8h, 0C9h, 0D9h, 44h, 24h, 50h, 0D8h
    db 4Ch, 24h, 6Ch, 0DEh, 0E9h, 0D9h, 59h, 24h, 0D9h, 44h, 24h, 50h, 0D8h, 0C9h, 0D9h, 44h
    db 24h, 54h, 0D8h, 4Ch, 24h, 6Ch, 8Bh, 54h, 24h, 40h, 0DEh, 0C1h, 0D9h, 5Ah, 28h, 8Bh
    db 48h, 08h, 8Bh, 54h, 24h, 40h, 89h, 4Ah, 2Ch, 0D9h, 44h, 24h, 4Ch, 8Bh, 4Ch, 24h
    db 40h, 0D8h, 0C9h, 0D9h, 44h, 24h, 50h, 0D8h, 4Ch, 24h, 6Ch, 0DEh, 0E9h, 0D9h, 59h, 18h
    db 8Bh, 54h, 24h, 40h, 0D9h, 44h, 24h, 50h, 0D8h, 0C9h, 0D9h, 44h, 24h, 4Ch, 0D8h, 4Ch
    db 24h, 6Ch, 0DEh, 0C1h, 0D9h, 5Ah, 1Ch, 8Bh, 40h, 08h, 8Bh, 4Ch, 24h, 40h, 89h, 41h
    db 20h, 0DDh, 0D8h, 8Bh, 74h, 24h, 40h, 8Dh, 4Ch, 24h, 4Ch, 33h, 0FFh, 89h, 4Ch, 24h
    db 6Ch, 85h, 0FFh, 74h, 28h, 0D9h, 44h, 37h, 0F4h, 0D9h, 04h, 37h, 0DAh, 0E9h, 0DFh, 0E0h
    db 0F6h, 0C4h, 44h, 7Ah, 18h, 0D9h, 44h, 37h, 0F8h, 0D9h, 44h, 37h, 04h, 0DAh, 0E9h, 0DFh
    db 0E0h, 0F6h, 0C4h, 44h, 7Ah, 07h, 8Bh, 51h, 0FCh, 89h, 11h, 0EBh, 31h, 0A1h, 0CCh, 0F4h
    db 2Eh, 01h, 8Bh, 4Ch, 24h, 14h, 8Bh, 18h, 6Ah, 01h, 6Ah, 00h, 03h, 0F7h, 0E8h, 0DEh
    db 94h, 0C1h, 0FFh, 8Bh, 4Eh, 04h, 8Bh, 16h, 50h, 51h, 8Bh, 0Dh, 0CCh, 0F4h, 2Eh, 01h
    db 52h, 0FFh, 53h, 1Ch, 8Bh, 4Ch, 24h, 6Ch, 8Bh, 74h, 24h, 40h, 0D9h, 19h, 83h, 0C7h
    db 0Ch, 83h, 0C1h, 04h, 83h, 0FFh, 30h, 89h, 4Ch, 24h, 6Ch, 7Ch, 94h, 0D9h, 44h, 24h
    db 50h, 8Bh, 85h, 38h, 01h, 00h, 00h, 0D8h, 44h, 24h, 4Ch, 0D8h, 0Dh, 3Ch, 53h, 07h
    db 01h, 0D9h, 5Ch, 24h, 24h, 0D9h, 44h, 24h, 58h, 0D8h, 44h, 24h, 54h, 0D8h, 0Dh, 3Ch
    db 53h, 07h, 01h, 0D9h, 5Ch, 24h, 14h, 0D9h, 46h, 0Ch, 0D8h, 06h, 0D8h, 0Dh, 3Ch, 53h
    db 07h, 01h, 0D9h, 46h, 10h, 0D8h, 46h, 04h, 0D8h, 0Dh, 3Ch, 53h, 07h, 01h, 0D9h, 46h
    db 24h, 0D8h, 46h, 18h, 0D8h, 0Dh, 3Ch, 53h, 07h, 01h, 0D9h, 46h, 28h, 0D8h, 46h, 1Ch
    db 0D8h, 0Dh, 3Ch, 53h, 07h, 01h, 0D9h, 5Ch, 24h, 38h, 0D9h, 0CAh, 0D8h, 0E2h, 0D9h, 5Ch
    db 24h, 6Ch, 0DDh, 0D9h, 0D8h, 64h, 24h, 38h, 0D9h, 0C0h, 0DEh, 0C9h, 0D9h, 44h, 24h, 6Ch
    db 0D8h, 4Ch, 24h, 6Ch, 0DEh, 0C1h, 0D9h, 0FAh, 0D9h, 44h, 24h, 14h, 0D8h, 64h, 24h, 24h
    db 0D9h, 0C9h, 0D9h, 0F3h, 0D9h, 40h, 04h, 0D8h, 0E1h, 0D8h, 4Ch, 24h, 1Ch, 0D9h, 0E0h, 0D9h
    db 44h, 24h, 20h, 0D8h, 48h, 08h, 0D9h, 0E0h, 0DEh, 0C1h, 0D8h, 40h, 08h, 0D9h, 58h, 08h
    db 8Bh, 8Dh, 38h, 01h, 00h, 00h, 0DDh, 0D8h, 0D9h, 41h, 08h, 0D8h, 1Dh, 50h, 53h, 07h
    db 01h, 0DFh, 0E0h, 0F6h, 0C4h, 41h, 75h, 0Ch, 0D9h, 41h, 08h, 0D8h, 0Dh, 3Ch, 53h, 07h
    db 01h, 0D9h, 59h, 08h, 8Bh, 85h, 38h, 01h, 00h, 00h, 0D9h, 44h, 24h, 18h, 0D8h, 48h
    db 08h, 8Bh, 54h, 24h, 70h, 0D8h, 40h, 04h, 0D9h, 58h, 04h, 8Bh, 85h, 38h, 01h, 00h
    db 00h, 0D9h, 44h, 24h, 18h, 0D8h, 48h, 10h, 0D8h, 40h, 0Ch, 0D9h, 58h, 0Ch, 8Bh, 85h
    db 38h, 01h, 00h, 00h, 0D9h, 44h, 24h, 1Ch, 0D8h, 48h, 18h, 0D9h, 0E0h, 0D9h, 44h, 24h
    db 20h, 0D8h, 48h, 1Ch, 0D9h, 0E0h, 0DEh, 0C1h, 0D8h, 40h, 1Ch, 0D9h, 58h, 1Ch, 8Bh, 85h
    db 38h, 01h, 00h, 00h, 0D9h, 40h, 1Ch, 0D8h, 40h, 18h, 0D9h, 58h, 18h, 8Bh, 85h, 38h
    db 01h, 00h, 00h, 0D9h, 44h, 24h, 2Ch, 0D8h, 48h, 20h, 0D9h, 0E0h, 0D9h, 44h, 24h, 30h
    db 0D8h, 48h, 24h, 0D9h, 0E0h, 0DEh, 0C1h, 0D8h, 40h, 24h, 0D9h, 58h, 24h, 8Bh, 85h, 38h
    db 01h, 00h, 00h, 0D9h, 40h, 24h, 0D8h, 40h, 20h, 0D9h, 58h, 20h, 8Bh, 85h, 38h, 01h
    db 00h, 00h, 0D9h, 40h, 18h, 0D8h, 40h, 04h, 0D9h, 1Ah, 8Bh, 85h, 38h, 01h, 00h, 00h
    db 0D9h, 40h, 20h, 0D8h, 40h, 0Ch, 0D9h, 5Ah, 04h, 8Bh, 8Dh, 38h, 01h, 00h, 00h, 0D9h
    db 41h, 18h, 0D8h, 5Ch, 24h, 10h, 0DFh, 0E0h, 0F6h, 0C4h, 41h, 75h, 09h, 8Bh, 44h, 24h
    db 10h, 89h, 41h, 18h, 0EBh, 17h, 0D9h, 44h, 24h, 10h, 0D9h, 0E0h, 0D8h, 51h, 18h, 0DFh
    db 0E0h, 0F6h, 0C4h, 41h, 75h, 05h, 0D9h, 59h, 18h, 0EBh, 02h, 0DDh, 0D8h, 8Bh, 8Dh, 38h
    db 01h, 00h, 00h, 0D9h, 41h, 20h, 0D8h, 5Ch, 24h, 10h, 0DFh, 0E0h, 0F6h, 0C4h, 41h, 75h
    db 09h, 8Bh, 44h, 24h, 10h, 89h, 41h, 20h, 0EBh, 17h, 0D9h, 44h, 24h, 10h, 0D9h, 0E0h
    db 0D8h, 51h, 20h, 0DFh, 0E0h, 0F6h, 0C4h, 41h, 75h, 05h, 0D9h, 59h, 20h, 0EBh, 02h, 0DDh
    db 0D8h, 8Bh, 85h, 38h, 01h, 00h, 00h, 0D9h, 40h, 2Ch, 8Bh, 4Ch, 24h, 28h, 0D9h, 44h
    db 24h, 14h, 0D8h, 44h, 24h, 24h, 0D8h, 0Dh, 3Ch, 53h, 07h, 01h, 0D8h, 61h, 08h, 0D9h
    db 5Ch, 24h, 6Ch, 0D9h, 40h, 28h, 0D8h, 40h, 2Ch, 0D9h, 58h, 2Ch, 0D8h, 54h, 24h, 6Ch
    db 0DFh, 0E0h, 0F6h, 0C4h, 41h, 7Ah, 17h, 8Bh, 85h, 38h, 01h, 00h, 00h, 0D9h, 44h, 24h
    db 6Ch, 0D8h, 58h, 2Ch, 8Dh, 48h, 2Ch, 0DFh, 0E0h, 0F6h, 0C4h, 41h, 7Bh, 7Ch, 0D8h, 5Ch
    db 24h, 6Ch, 0DFh, 0E0h, 0F6h, 0C4h, 01h, 75h, 17h, 8Bh, 85h, 38h, 01h, 00h, 00h, 0D9h
    db 44h, 24h, 6Ch, 0D8h, 58h, 2Ch, 8Dh, 48h, 2Ch, 0DFh, 0E0h, 0F6h, 0C4h, 01h, 74h, 5Ch
    db 8Bh, 8Dh, 38h, 01h, 00h, 00h, 0D9h, 41h, 2Ch, 0D8h, 5Ch, 24h, 6Ch, 0DFh, 0E0h, 0F6h
    db 0C4h, 05h, 7Ah, 10h, 0D9h, 41h, 28h, 0D8h, 1Dh, 50h, 53h, 07h, 01h, 0DFh, 0E0h, 0F6h
    db 0C4h, 05h, 7Bh, 1Eh, 0D9h, 41h, 2Ch, 0D8h, 5Ch, 24h, 6Ch, 0DFh, 0E0h, 0F6h, 0C4h, 41h
    db 75h, 3Fh, 0D9h, 41h, 28h, 0D8h, 1Dh, 50h, 53h, 07h, 01h, 0DFh, 0E0h, 0F6h, 0C4h, 41h
    db 75h, 2Fh, 0D9h, 41h, 2Ch, 0D8h, 61h, 28h, 0D9h, 59h, 2Ch, 8Bh, 85h, 38h, 01h, 00h
    db 00h, 0C7h, 40h, 28h, 00h, 00h, 00h, 00h, 0EBh, 39h, 0DDh, 0D8h, 8Bh, 44h, 24h, 6Ch
    db 89h, 01h, 8Bh, 8Dh, 38h, 01h, 00h, 00h, 0C7h, 41h, 28h, 00h, 00h, 00h, 00h, 0EBh
    db 22h, 0D9h, 41h, 2Ch, 0D8h, 5Ch, 24h, 6Ch, 0D9h, 41h, 28h, 0DFh, 0E0h, 0F6h, 0C4h, 05h
    db 7Ah, 08h, 0D8h, 05h, 6Ch, 0B4h, 09h, 01h, 0EBh, 06h, 0D8h, 25h, 3Ch, 53h, 07h, 01h
    db 0D9h, 59h, 28h, 8Bh, 8Dh, 38h, 01h, 00h, 00h, 8Bh, 74h, 24h, 40h, 85h, 0F6h, 8Bh
    db 41h, 2Ch, 89h, 42h, 0Ch, 0C7h, 44h, 24h, 64h, 0FFh, 0FFh, 0FFh, 0FFh, 74h, 4Bh, 8Bh
    db 4Ch, 24h, 48h, 2Bh, 0CEh, 0B8h, 0ABh, 0AAh, 0AAh, 2Ah, 0F7h, 0E9h, 0D1h, 0FAh, 8Bh, 0C2h
    db 0C1h, 0E8h, 1Fh, 03h, 0C2h, 8Dh, 04h, 40h, 0C1h, 0E0h, 02h, 3Dh, 80h, 00h, 00h, 00h
    db 76h, 1Eh, 56h, 0E8h, 0B8h, 0Ch, 46h, 00h, 83h, 0C4h, 04h, 8Bh, 4Ch, 24h, 5Ch, 64h
    db 89h, 0Dh, 00h, 00h, 00h, 00h, 5Fh, 5Eh, 5Dh, 5Bh, 83h, 0C4h, 58h, 0C2h, 08h, 00h
    db 50h, 56h, 0E8h, 0D9h, 0D3h, 40h, 00h, 83h, 0C4h, 08h, 8Bh, 4Ch, 24h, 5Ch, 5Fh, 5Eh
    db 5Dh, 64h, 89h, 0Dh, 00h, 00h, 00h, 00h, 5Bh, 83h, 0C4h, 58h, 0C2h, 08h, 00h
?Rva00420B60@@YAXXZ ENDP
_TEXT ENDS
END
