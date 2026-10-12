.386
.model flat
; BfmeSlotDispatcher1281::bfmeResolve1281 (address-derived resolver pin already in
; symbols.csv at 0x008BC3E0). Caller witness: game/Libraries/Source/Apt/AptInput.cpp
; declares the member at line 495 and calls it from bfmeRouteEncoded1281 at line 553;
; sibling members bfmeDispatchSlots1281 (0x008BC360) and bfmeRouteEncoded1281
; (0x008BCCC0) are matched rows from the same file. Decode: thiscall receiver in ECX
; RET 0x10 at +0x2FC (767-byte extent) an SEH frame with handler 0x01059278 two jump
; tables at 0x00CBC6E0 and 0x00CBC6F4 and twenty HIGHLOW sites (strings and globals).
; Codegen blocker: VC7.1 /O2 C++ reaches 803 bytes with the receiver scheduled
; through a pushed temporary (scheduling diffs at +0x1EC and +0x1F1 while retail
; loads the global receiver into ECX directly) after about forty spellings; no C++
; form reproduces the 767-byte schedule. Body is the verbatim gen-dump lift; its
; HIGHLOW sites are literal retail bytes exactly as the gen_asm scaffold carries them.
; Evidence: targets/game/reverse/identity_evidence/008bc3e0-slot-resolver.md
_TEXT SEGMENT
public ?bfmeResolve1281@BfmeSlotDispatcher1281@@QAEXHHPAPAXPA_N@Z
?bfmeResolve1281@BfmeSlotDispatcher1281@@QAEXHHPAPAXPA_N@Z PROC
    db 6Ah, 0FFh, 68h, 78h, 92h, 05h, 01h, 64h, 0A1h, 00h, 00h, 00h, 00h, 50h, 64h, 89h
    db 25h, 00h, 00h, 00h, 00h, 51h, 8Bh, 44h, 24h, 1Ch, 8Bh, 54h, 24h, 20h, 0C7h, 00h
    db 00h, 00h, 00h, 00h, 0C6h, 02h, 00h, 8Bh, 81h, 6Ch, 12h, 00h, 00h, 85h, 0C0h, 0Fh
    db 84h, 0B9h, 02h, 00h, 00h, 8Bh, 4Ch, 24h, 18h, 85h, 0C9h, 0Fh, 85h, 0ADh, 02h, 00h
    db 00h, 8Bh, 4Ch, 24h, 14h, 49h, 83h, 0F9h, 0Eh, 0Fh, 87h, 9Fh, 02h, 00h, 00h, 0Fh
    db 0B6h, 89h, 0F4h, 0C6h, 0CBh, 00h, 0FFh, 24h, 8Dh, 0E0h, 0C6h, 0CBh, 00h, 0B9h, 0CCh, 84h
    db 33h, 01h, 0EBh, 13h, 0B9h, 8Ch, 84h, 33h, 01h, 0EBh, 0Ch, 0B9h, 0A8h, 84h, 33h, 01h
    db 0EBh, 05h, 0B9h, 0B4h, 84h, 33h, 01h, 56h, 57h, 8Bh, 78h, 4Ch, 8Bh, 47h, 50h, 8Bh
    db 40h, 10h, 51h, 8Bh, 0C8h, 89h, 7Ch, 24h, 20h, 0E8h, 82h, 0Ah, 0FEh, 0FFh, 8Bh, 0F0h
    db 85h, 0F6h, 0Fh, 84h, 54h, 02h, 00h, 00h, 8Bh, 4Eh, 04h, 8Bh, 0C1h, 83h, 0E0h, 3Fh
    db 83h, 0F8h, 01h, 74h, 09h, 83h, 0F8h, 2Ah, 0Fh, 85h, 16h, 01h, 00h, 00h, 0C1h, 0E9h
    db 0Fh, 0F6h, 0D1h, 0F6h, 0C1h, 01h, 0Fh, 85h, 08h, 01h, 00h, 00h, 66h, 0FFh, 05h, 98h
    db 52h, 2Dh, 01h, 0C7h, 44h, 24h, 20h, 98h, 52h, 2Dh, 01h, 8Bh, 46h, 04h, 83h, 0E0h
    db 3Fh, 83h, 0F8h, 01h, 0C7h, 44h, 24h, 14h, 00h, 00h, 00h, 00h, 8Bh, 0C6h, 74h, 03h
    db 8Bh, 46h, 20h, 53h, 55h, 8Dh, 54h, 24h, 28h, 52h, 8Dh, 4Ch, 24h, 14h, 51h, 83h
    db 0C0h, 08h, 50h, 6Ah, 00h, 57h, 0E8h, 45h, 9Eh, 00h, 00h, 8Bh, 7Ch, 24h, 24h, 83h
    db 0C4h, 14h, 85h, 0FFh, 0Fh, 84h, 91h, 00h, 00h, 00h, 8Bh, 54h, 24h, 28h, 66h, 8Bh
    db 6Ah, 02h, 66h, 85h, 0EDh, 75h, 44h, 8Bh, 4Fh, 04h, 8Bh, 0C1h, 83h, 0E0h, 3Fh, 83h
    db 0F8h, 0Eh, 75h, 0Ch, 8Bh, 0D9h, 0C1h, 0EBh, 0Fh, 0F6h, 0D3h, 0F6h, 0C3h, 01h, 74h, 20h
    db 83h, 0F8h, 0Dh, 75h, 0Ch, 8Bh, 0D9h, 0C1h, 0EBh, 0Fh, 0F6h, 0D3h, 0F6h, 0C3h, 01h, 74h
    db 0Fh, 83h, 0F8h, 12h, 75h, 12h, 0C1h, 0E9h, 0Fh, 0F6h, 0D1h, 0F6h, 0C1h, 01h, 75h, 08h
    db 8Bh, 44h, 24h, 2Ch, 89h, 38h, 0EBh, 47h, 66h, 85h, 0EDh, 76h, 42h, 8Bh, 4Fh, 04h
    db 8Bh, 0C1h, 83h, 0E0h, 3Fh, 83h, 0F8h, 0Dh, 75h, 0Ch, 8Bh, 0D9h, 0C1h, 0EBh, 0Fh, 0F6h
    db 0D3h, 0F6h, 0C3h, 01h, 74h, 0Fh, 83h, 0F8h, 12h, 75h, 24h, 0C1h, 0E9h, 0Fh, 0F6h, 0D1h
    db 0F6h, 0C1h, 01h, 75h, 1Ah, 8Bh, 4Fh, 50h, 8Bh, 49h, 10h, 8Dh, 54h, 24h, 28h, 52h
    db 0E8h, 7Bh, 09h, 0FEh, 0FFh, 85h, 0C0h, 74h, 02h, 8Bh, 0F0h, 8Bh, 54h, 24h, 28h, 66h
    db 0FFh, 0Ah, 8Bh, 0C2h, 66h, 83h, 38h, 00h, 5Dh, 0C7h, 44h, 24h, 18h, 0FFh, 0FFh, 0FFh
    db 0FFh, 5Bh, 75h, 0Ch, 50h, 0A1h, 30h, 7Ah, 33h, 01h, 0FFh, 50h, 04h, 83h, 0C4h, 04h
    db 8Bh, 7Ch, 24h, 1Ch, 8Bh, 46h, 04h, 8Bh, 0C8h, 83h, 0E1h, 3Fh, 80h, 0F9h, 0Ah, 0Fh
    db 85h, 0BBh, 00h, 00h, 00h, 0C1h, 0E8h, 0Fh, 0F6h, 0D0h, 0A8h, 01h, 0Fh, 85h, 0AEh, 00h
    db 00h, 00h, 8Bh, 16h, 8Bh, 0CEh, 0FFh, 52h, 4Ch, 6Ah, 00h, 56h, 0B9h, 48h, 87h, 33h
    db 01h, 57h, 0E8h, 69h, 31h, 01h, 00h, 68h, 0BCh, 6Dh, 13h, 01h, 0B9h, 48h, 87h, 33h
    db 01h, 0E8h, 5Ah, 49h, 0FEh, 0FFh, 0A1h, 50h, 87h, 33h, 01h, 8Bh, 0Dh, 48h, 87h, 33h
    db 01h, 8Bh, 74h, 88h, 0FCh, 8Bh, 4Eh, 04h, 8Bh, 0C1h, 83h, 0E0h, 3Fh, 83h, 0F8h, 0Ch
    db 7Ch, 3Ch, 83h, 0F8h, 13h, 7Fh, 37h, 0C1h, 0E9h, 0Fh, 0F6h, 0D1h, 0F6h, 0C1h, 01h, 75h
    db 2Dh, 8Bh, 16h, 8Bh, 0CEh, 0FFh, 12h, 0A1h, 50h, 87h, 33h, 01h, 8Bh, 0Dh, 48h, 87h
    db 33h, 01h, 8Bh, 4Ch, 88h, 0FCh, 8Bh, 51h, 04h, 0C1h, 0EAh, 1Eh, 0F6h, 0C2h, 01h, 75h
    db 05h, 8Bh, 01h, 0FFh, 50h, 04h, 0FFh, 0Dh, 48h, 87h, 33h, 01h, 0EBh, 38h, 8Bh, 4Eh
    db 04h, 0C1h, 0E9h, 1Eh, 0F6h, 0C1h, 01h, 75h, 07h, 8Bh, 16h, 8Bh, 0CEh, 0FFh, 52h, 04h
    db 0FFh, 0Dh, 48h, 87h, 33h, 01h, 8Bh, 44h, 24h, 28h, 5Fh, 0C6h, 00h, 01h, 5Eh, 8Bh
    db 4Ch, 24h, 04h, 64h, 89h, 0Dh, 00h, 00h, 00h, 00h, 83h, 0C4h, 10h, 0C2h, 10h, 00h
    db 8Bh, 16h, 8Bh, 0CEh, 0FFh, 12h, 8Bh, 4Eh, 04h, 8Bh, 0C1h, 83h, 0E0h, 3Fh, 83h, 0F8h
    db 0Eh, 75h, 0Ch, 8Bh, 0D1h, 0C1h, 0EAh, 0Fh, 0F6h, 0D2h, 0F6h, 0C2h, 01h, 74h, 20h, 83h
    db 0F8h, 0Dh, 75h, 0Ch, 8Bh, 0D1h, 0C1h, 0EAh, 0Fh, 0F6h, 0D2h, 0F6h, 0C2h, 01h, 74h, 0Fh
    db 83h, 0F8h, 12h, 75h, 20h, 0C1h, 0E9h, 0Fh, 0F6h, 0D1h, 0F6h, 0C1h, 01h, 75h, 16h, 8Bh
    db 0Dh, 0D8h, 77h, 33h, 01h, 56h, 0E8h, 75h, 45h, 0FEh, 0FFh, 84h, 0C0h, 75h, 06h, 8Bh
    db 44h, 24h, 24h, 89h, 30h, 8Bh, 16h, 8Bh, 0CEh, 0FFh, 52h, 04h, 5Fh, 5Eh, 8Bh, 4Ch
    db 24h, 04h, 64h, 89h, 0Dh, 00h, 00h, 00h, 00h, 83h, 0C4h, 10h, 0C2h, 10h, 00h
?bfmeResolve1281@BfmeSlotDispatcher1281@@QAEXHHPAPAXPA_N@Z ENDP
_TEXT ENDS
END
