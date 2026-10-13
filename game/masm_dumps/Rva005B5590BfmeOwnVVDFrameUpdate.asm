.386
.model flat
; ?rva005B5590@BfmeOwnVVD@@QAEXXZ
; Retail @ 0x005B5590 size 1791
;
; MASM dump carrying a measured VC7.1 codegen blocker. Identity: the class is
; BfmeOwnVVD (singleton 0x012F4C84, vftable 0x0110DE48, constructor 0x005B5470)
; and the body is the per-frame scroll/camera update called once per client
; frame from the matched ClientUpdate004329D0::update through ILT 0x0000B7A3
; (symbols.csv pin ?rva005B5590@Calls004329D0@@QAEXXZ: thiscall, no stack
; arguments; evidence 004329D0-client-update.md). No pin names the member, so
; the name stays address-derived. The body is Zero Hour's LookAtTranslator
; MSG_FRAME_TICK case (LookAtXlat.cpp) moved into its own member: forced-stop
; test, RMB/key/screen-edge scroll switch, setScrollAmount + scrollBy pair,
; MSG_SET_REPLAY_CAMERA (0x446) ViewLocation message, plus BFME's edge-scroll
; ramp (m_14c, GlobalData +0xB6C/+0xB70), the scroll hook at 0x012F7048,
; anchor resets from scrollBy's edge flags, rotate keys and key-release
; polling. __thiscall, no stack arguments; the body ends `ret` (0xC3).
;
; The reconstructible C++ body (targets/game/reverse/attempts/0x005b5590.cpp,
; bank score 0.9978) compiles to exactly 1,791 bytes with 80 relocations; its
; whole residue is four non-relocation bytes at +0x299 +0x29C: retail loads
; m_anchorX [esi+4] into EDX before m_currentPos.x [esi+0x14] into EAX, while
; VC7.1 emits the reverse order with the identical instruction shape and
; register mapping (pure emission order). Invariant across int-delta locals,
; factor-right spelling, anchor-local-first, both locals, dx-before-gd,
; /Ob1 and /Oi-; y-first (1789B/821 diffs) and the direct-global form
; (1790B/803 diffs) are worse. The ZH twin LookAtXlat.cpp confirms the
; expression shape. The dump body is byte-identical to retail outside its
; relocation slots.
; Evidence: targets/game/reverse/identity_evidence/005b5590-masm-codegen-blocker.md

EXTERN ?Clock00200420@@3PAUFrame00200420@@A:BYTE
EXTERN ?EngineGlobal007629F0@@3PAUEngine007629F0@@A:BYTE
EXTERN ?FadeTacticalView@@3PAVFadeView@@A:BYTE
EXTERN ?GenFallback0012ED5C8@@3PAVGenFallback@@A:BYTE
EXTERN ?Glo012F7048@@3PAVGlo012F7048CampaignGateMode@@A:BYTE
EXTERN ?KeyboardGlobal0040F780@@3PAUKeyboard0040F780@@A:BYTE
EXTERN ?Mouse0040F780@@3PAVMouse@@A:BYTE
EXTERN ?Rva00367810TheVirtualGate@@3PAVRva00367810VirtualGate@@A:BYTE
EXTERN ?TheGameMessageDispatcher@@3PAVGameMessageDispatcher@@A:BYTE
EXTERN ?TheInGameUI@@3PAUInGameUI@@A:BYTE
EXTERN ?g_bfmeScaleBC@@3MA:BYTE
EXTERN ?j_00001370@@YAXXZ:NEAR
EXTERN ?j_00002608@@YAXXZ:NEAR
EXTERN ?j_0000650f@@YAXXZ:NEAR
EXTERN ?j_0001be28@@YAXXZ:NEAR
EXTERN ?j_0002ea41@@YAXXZ:NEAR
EXTERN ?j_00034d15@@YAXXZ:NEAR
EXTERN ?j_00037ad8@@YAXXZ:NEAR
EXTERN ?j_0003fc83@@YAXXZ:NEAR
EXTERN ?j_00040dd1@@YAXXZ:NEAR
EXTERN __imp__timeGetTime@0:BYTE
EXTERN __real@3f490fdb:BYTE
EXTERN __real@4016cbe4:BYTE
EXTERN g_Va012F4C88:BYTE
EXTERN g_Va012F4C89:BYTE
EXTERN g_Va012F4C8A:BYTE
EXTERN g_Va012F4C8B:BYTE
_TEXT SEGMENT
public ?rva005B5590@BfmeOwnVVD@@QAEXXZ
?rva005B5590@BfmeOwnVVD@@QAEXXZ PROC
    db 083h, 0ECh, 030h, 053h, 055h, 056h, 08Bh, 0F1h, 08Ah, 046h, 038h, 084h, 0C0h, 057h, 0C7h, 044h
    db 024h, 018h, 000h, 000h, 000h, 000h, 0C7h, 044h, 024h, 01Ch, 000h, 000h, 000h, 000h, 00Fh, 084h
    db 0C8h, 003h, 000h, 000h, 08Bh, 00Dh
    dd ?TheInGameUI@@3PAUInGameUI@@A
    db 08Bh, 001h, 0FFh, 090h, 0A4h, 000h, 000h, 000h, 084h, 0C0h, 075h, 030h, 08Bh, 04Ch, 024h, 018h
    db 083h, 0ECh, 008h, 08Bh, 0C4h, 089h, 008h, 08Bh, 054h, 024h, 024h, 089h, 050h, 004h, 08Bh, 00Dh
    dd ?TheInGameUI@@3PAUInGameUI@@A
    db 08Bh, 001h, 089h, 064h, 024h, 018h, 0FFh, 090h, 0B0h, 000h, 000h, 000h, 08Bh, 0CEh
    call ?j_00034d15@@YAXXZ
    db 0E9h, 0AAh, 003h, 000h, 000h, 08Ah, 046h, 038h, 084h, 0C0h, 00Fh, 084h, 07Bh, 003h, 000h, 000h
    db 08Bh, 086h, 048h, 001h, 000h, 000h, 048h, 00Fh, 084h, 09Ah, 001h, 000h, 000h, 048h, 00Fh, 084h
    db 0F6h, 000h, 000h, 000h, 048h, 00Fh, 085h, 091h, 002h, 000h, 000h, 0FFh, 015h
    dd __imp__timeGetTime@0
    db 08Bh, 0BEh, 04Ch, 001h, 000h, 000h, 08Bh, 00Dh
    dd ?GenFallback0012ED5C8@@3PAVGenFallback@@A
    db 08Bh, 089h, 070h, 00Bh, 000h, 000h, 02Bh, 0C7h, 03Bh, 0C1h, 07Eh, 00Ah, 0C7h, 044h, 024h, 010h
    db 064h, 000h, 000h, 000h, 0EBh, 00Ah, 06Bh, 0C0h, 064h, 099h, 0F7h, 0F9h, 089h, 044h, 024h, 010h
    db 08Bh, 00Dh
    dd ?Rva00367810TheVirtualGate@@3PAVRva00367810VirtualGate@@A
    db 08Bh, 011h, 0FFh, 052h, 030h, 08Bh, 00Dh
    dd ?Rva00367810TheVirtualGate@@3PAVRva00367810VirtualGate@@A
    db 08Bh, 0F8h, 08Bh, 001h, 0FFh, 050h, 02Ch, 08Bh, 04Eh, 018h, 083h, 0F9h, 003h, 08Bh, 015h
    dd ?GenFallback0012ED5C8@@3PAVGenFallback@@A
    db 07Dh, 01Eh, 0D9h, 082h, 0BCh, 00Bh, 000h, 000h, 0D8h, 08Ah, 06Ch, 00Bh, 000h, 000h, 0D8h, 08Ah
    db 068h, 00Bh, 000h, 000h, 0DAh, 04Ch, 024h, 010h, 0D8h, 06Ch, 024h, 01Ch, 0D9h, 05Ch, 024h, 01Ch
    db 083h, 0C7h, 0FDh, 03Bh, 0CFh, 072h, 01Eh, 0D9h, 082h, 0BCh, 00Bh, 000h, 000h, 0D8h, 08Ah, 06Ch
    db 00Bh, 000h, 000h, 0D8h, 08Ah, 068h, 00Bh, 000h, 000h, 0DAh, 04Ch, 024h, 010h, 0D8h, 044h, 024h
    db 01Ch, 0D9h, 05Ch, 024h, 01Ch, 08Bh, 04Eh, 014h, 083h, 0F9h, 003h, 07Dh, 01Eh, 0D9h, 082h, 0BCh
    db 00Bh, 000h, 000h, 0D8h, 08Ah, 06Ch, 00Bh, 000h, 000h, 0D8h, 08Ah, 064h, 00Bh, 000h, 000h, 0DAh
    db 04Ch, 024h, 010h, 0D8h, 06Ch, 024h, 018h, 0D9h, 05Ch, 024h, 018h, 083h, 0C0h, 0FDh, 03Bh, 0C8h
    db 00Fh, 082h, 0C5h, 001h, 000h, 000h, 0D9h, 082h, 0BCh, 00Bh, 000h, 000h, 0D8h, 08Ah, 06Ch, 00Bh
    db 000h, 000h, 0D8h, 08Ah, 064h, 00Bh, 000h, 000h, 0DAh, 04Ch, 024h, 010h, 0D8h, 044h, 024h, 018h
    db 0D9h, 05Ch, 024h, 018h, 0E9h, 0A2h, 001h, 000h, 000h, 0A0h
    dd g_Va012F4C88
    db 084h, 0C0h, 0A1h
    dd ?GenFallback0012ED5C8@@3PAVGenFallback@@A
    db 074h, 01Ah, 0D9h, 080h, 0BCh, 00Bh, 000h, 000h, 0D8h, 088h, 068h, 00Bh, 000h, 000h, 0D8h, 00Dh
    dd ?g_bfmeScaleBC@@3MA
    db 0D8h, 06Ch, 024h, 01Ch, 0D9h, 05Ch, 024h, 01Ch, 08Ah, 00Dh
    dd g_Va012F4C89
    db 084h, 0C9h, 074h, 01Ah, 0D9h, 080h, 0BCh, 00Bh, 000h, 000h, 0D8h, 088h, 068h, 00Bh, 000h, 000h
    db 0D8h, 00Dh
    dd ?g_bfmeScaleBC@@3MA
    db 0D8h, 044h, 024h, 01Ch, 0D9h, 05Ch, 024h, 01Ch, 08Ah, 00Dh
    dd g_Va012F4C8A
    db 084h, 0C9h, 074h, 01Ah, 0D9h, 080h, 0BCh, 00Bh, 000h, 000h, 0D8h, 088h, 064h, 00Bh, 000h, 000h
    db 0D8h, 00Dh
    dd ?g_bfmeScaleBC@@3MA
    db 0D8h, 06Ch, 024h, 018h, 0D9h, 05Ch, 024h, 018h, 08Ah, 00Dh
    dd g_Va012F4C8B
    db 084h, 0C9h, 00Fh, 084h, 024h, 001h, 000h, 000h, 0D9h, 080h, 0BCh, 00Bh, 000h, 000h, 0D8h, 088h
    db 064h, 00Bh, 000h, 000h, 0D8h, 00Dh
    dd ?g_bfmeScaleBC@@3MA
    db 0D8h, 044h, 024h, 018h, 0D9h, 05Ch, 024h, 018h, 0E9h, 005h, 001h, 000h, 000h, 08Bh, 00Dh
    dd ?Mouse0040F780@@3PAVMouse@@A
    call ?j_0003fc83@@YAXXZ
    db 08Bh, 008h, 08Bh, 040h, 004h, 08Bh, 015h
    dd ?TheInGameUI@@3PAUInGameUI@@A
    db 089h, 04Ch, 024h, 010h, 08Bh, 04Eh, 018h, 08Bh, 0D9h, 02Bh, 0D8h, 08Ah, 082h, 0BDh, 012h, 000h
    db 000h, 084h, 0C0h, 074h, 056h, 08Bh, 00Dh
    dd ?Rva00367810TheVirtualGate@@3PAVRva00367810VirtualGate@@A
    db 08Bh, 001h, 0FFh, 050h, 02Ch, 08Bh, 00Dh
    dd ?Rva00367810TheVirtualGate@@3PAVRva00367810VirtualGate@@A
    db 08Bh, 011h, 08Bh, 0F8h, 0D1h, 0EFh, 0FFh, 052h, 030h, 08Bh, 04Eh, 014h, 08Bh, 056h, 004h, 08Dh
    db 02Ch, 039h, 0D1h, 0E8h, 03Bh, 0EAh, 07Dh, 005h, 089h, 06Eh, 004h, 0EBh, 009h, 02Bh, 0CFh, 03Bh
    db 0CAh, 07Eh, 003h, 089h, 04Eh, 004h, 08Bh, 04Eh, 018h, 08Bh, 056h, 008h, 08Dh, 03Ch, 001h, 03Bh
    db 0FAh, 07Dh, 005h, 089h, 07Eh, 008h, 0EBh, 00Dh, 02Bh, 0D8h, 03Bh, 0DAh, 07Eh, 007h, 08Bh, 0D1h
    db 02Bh, 0D0h, 089h, 056h, 008h, 08Bh, 056h, 004h, 08Bh, 046h, 014h, 08Bh, 03Dh
    dd ?GenFallback0012ED5C8@@3PAVGenFallback@@A
    db 02Bh, 0C2h, 089h, 044h, 024h, 010h, 0DBh, 044h, 024h, 010h, 02Bh, 04Eh, 008h, 0D8h, 08Fh, 064h
    db 00Bh, 000h, 000h, 089h, 04Ch, 024h, 010h, 08Dh, 04Ch, 024h, 010h, 0D9h, 054h, 024h, 018h, 0DBh
    db 044h, 024h, 010h, 0D8h, 08Fh, 068h, 00Bh, 000h, 000h, 0D9h, 054h, 024h, 01Ch, 0D9h, 0C9h, 0D9h
    db 05Ch, 024h, 010h, 0D9h, 05Ch, 024h, 014h
    call ?j_0000650f@@YAXXZ
    db 0D9h, 087h, 0BCh, 00Bh, 000h, 000h, 0D9h, 0C0h, 0D8h, 08Fh, 064h, 00Bh, 000h, 000h, 0D8h, 0C9h
    db 0D8h, 04Ch, 024h, 010h, 0D8h, 044h, 024h, 018h, 0D9h, 05Ch, 024h, 018h, 0DDh, 0D8h, 0D9h, 087h
    db 0BCh, 00Bh, 000h, 000h, 0D9h, 0C0h, 0D8h, 0C9h, 0D8h, 04Ch, 024h, 014h, 0D8h, 08Fh, 068h, 00Bh
    db 000h, 000h, 0D8h, 044h, 024h, 01Ch, 0D9h, 05Ch, 024h, 01Ch, 0DDh, 0D8h, 08Bh, 00Dh
    dd ?Glo012F7048@@3PAVGlo012F7048CampaignGateMode@@A
    db 085h, 0C9h, 074h, 018h, 08Ah, 041h, 008h, 084h, 0C0h, 074h, 011h, 08Bh, 011h, 06Ah, 000h, 08Dh
    db 044h, 024h, 01Ch, 050h, 0FFh, 052h, 014h, 0E9h, 0D1h, 000h, 000h, 000h, 08Bh, 04Ch, 024h, 018h
    db 083h, 0ECh, 008h, 08Bh, 0C4h, 089h, 008h, 08Bh, 054h, 024h, 024h, 089h, 050h, 004h, 08Bh, 00Dh
    dd ?TheInGameUI@@3PAUInGameUI@@A
    db 08Bh, 001h, 089h, 064h, 024h, 018h, 0FFh, 090h, 0B0h, 000h, 000h, 000h, 08Bh, 00Dh
    dd ?FadeTacticalView@@3PAVFadeView@@A
    db 08Bh, 011h, 08Dh, 044h, 024h, 018h, 050h, 0FFh, 052h, 05Ch, 08Bh, 0D8h, 085h, 0DBh, 00Fh, 084h
    db 093h, 000h, 000h, 000h, 083h, 0BEh, 048h, 001h, 000h, 000h, 001h, 00Fh, 085h, 086h, 000h, 000h
    db 000h, 08Bh, 00Dh
    dd ?FadeTacticalView@@3PAVFadeView@@A
    db 08Bh, 011h, 0FFh, 092h, 0FCh, 000h, 000h, 000h, 0D9h, 0E1h, 0D8h, 015h
    dd __real@3f490fdb
    db 032h, 0C9h, 0DFh, 0E0h, 0F6h, 0C4h, 041h, 075h, 011h, 0D8h, 01Dh
    dd __real@4016cbe4
    db 0DFh, 0E0h, 0F6h, 0C4h, 005h, 07Ah, 006h, 0B1h, 001h, 0EBh, 002h, 0DDh, 0D8h, 0F6h, 0C3h, 003h
    db 074h, 012h, 084h, 0C9h, 074h, 008h, 08Bh, 046h, 018h, 089h, 046h, 008h, 0EBh, 006h, 08Bh, 056h
    db 014h, 089h, 056h, 004h, 0F6h, 0C3h, 00Ch, 074h, 038h, 084h, 0C9h, 074h, 008h, 08Bh, 046h, 014h
    db 089h, 046h, 004h, 0EBh, 02Ch, 08Bh, 04Eh, 018h, 089h, 04Eh, 008h, 0EBh, 024h, 08Bh, 054h, 024h
    db 018h, 083h, 0ECh, 008h, 08Bh, 0C4h, 089h, 010h, 08Bh, 04Ch, 024h, 024h, 089h, 048h, 004h, 08Bh
    db 00Dh
    dd ?TheInGameUI@@3PAUInGameUI@@A
    db 08Bh, 011h, 089h, 064h, 024h, 018h, 0FFh, 092h, 0B0h, 000h, 000h, 000h, 0A1h
    dd ?TheInGameUI@@3PAUInGameUI@@A
    db 08Ah, 048h, 00Dh, 084h, 0C9h, 00Fh, 084h, 0A2h, 000h, 000h, 000h, 08Ah, 048h, 00Eh, 084h, 0C9h
    db 00Fh, 084h, 097h, 000h, 000h, 000h, 08Ah, 086h, 054h, 001h, 000h, 000h, 084h, 0C0h, 074h, 029h
    db 08Bh, 00Dh
    dd ?FadeTacticalView@@3PAVFadeView@@A
    db 08Bh, 039h, 0FFh, 097h, 0FCh, 000h, 000h, 000h, 0A1h
    dd ?GenFallback0012ED5C8@@3PAVGenFallback@@A
    db 0D8h, 0A0h, 0C8h, 00Ch, 000h, 000h, 051h, 08Bh, 00Dh
    dd ?FadeTacticalView@@3PAVFadeView@@A
    db 0D9h, 01Ch, 024h, 0FFh, 097h, 0F8h, 000h, 000h, 000h, 08Ah, 086h, 055h, 001h, 000h, 000h, 084h
    db 0C0h, 074h, 02Ah, 08Bh, 00Dh
    dd ?FadeTacticalView@@3PAVFadeView@@A
    db 08Bh, 039h, 0FFh, 097h, 0FCh, 000h, 000h, 000h, 08Bh, 00Dh
    dd ?GenFallback0012ED5C8@@3PAVGenFallback@@A
    db 0D8h, 081h, 0C8h, 00Ch, 000h, 000h, 051h, 08Bh, 00Dh
    dd ?FadeTacticalView@@3PAVFadeView@@A
    db 0D9h, 01Ch, 024h, 0FFh, 097h, 0F8h, 000h, 000h, 000h, 08Ah, 086h, 056h, 001h, 000h, 000h, 084h
    db 0C0h, 074h, 00Eh, 08Bh, 00Dh
    dd ?FadeTacticalView@@3PAVFadeView@@A
    db 08Bh, 011h, 0FFh, 092h, 030h, 001h, 000h, 000h, 08Ah, 086h, 057h, 001h, 000h, 000h, 084h, 0C0h
    db 074h, 00Eh, 08Bh, 00Dh
    dd ?FadeTacticalView@@3PAVFadeView@@A
    db 08Bh, 001h, 0FFh, 090h, 034h, 001h, 000h, 000h, 08Bh, 00Dh
    dd ?GenFallback0012ED5C8@@3PAVGenFallback@@A
    db 08Ah, 081h, 00Ch, 00Ch, 000h, 000h, 084h, 0C0h, 00Fh, 084h, 0FAh, 000h, 000h, 000h, 08Bh, 015h
    dd ?EngineGlobal007629F0@@3PAUEngine007629F0@@A
    db 083h, 07Ah, 030h, 001h, 00Fh, 085h, 0EAh, 000h, 000h, 000h, 08Bh, 00Dh
    dd ?Clock00200420@@3PAUFrame00200420@@A
    call ?j_0001be28@@YAXXZ
    db 084h, 0C0h, 075h, 01Eh, 0A1h
    dd ?Clock00200420@@3PAUFrame00200420@@A
    db 08Bh, 080h, 00Ch, 001h, 000h, 000h, 083h, 0F8h, 002h, 074h, 00Eh, 083h, 0F8h, 001h, 074h, 009h
    db 083h, 0F8h, 005h, 00Fh, 085h, 0BDh, 000h, 000h, 000h, 08Bh, 00Dh
    dd ?FadeTacticalView@@3PAVFadeView@@A
    db 08Dh, 044h, 024h, 020h, 0C6h, 044h, 024h, 020h, 000h, 0C7h, 044h, 024h, 024h, 000h, 000h, 000h
    db 000h, 0C7h, 044h, 024h, 028h, 000h, 000h, 000h, 000h, 0C7h, 044h, 024h, 02Ch, 000h, 000h, 000h
    db 000h, 0C7h, 044h, 024h, 03Ch, 000h, 000h, 000h, 000h, 0C7h, 044h, 024h, 038h, 000h, 000h, 000h
    db 000h, 0C7h, 044h, 024h, 034h, 000h, 000h, 000h, 000h, 0C7h, 044h, 024h, 030h, 000h, 000h, 000h
    db 000h, 08Bh, 011h, 050h, 0FFh, 092h, 06Ch, 001h, 000h, 000h, 08Bh, 00Dh
    dd ?TheGameMessageDispatcher@@3PAVGameMessageDispatcher@@A
    db 08Bh, 011h, 068h, 046h, 004h, 000h, 000h, 0FFh, 052h, 034h, 08Bh, 0F8h, 08Dh, 044h, 024h, 024h
    db 050h, 08Bh, 0CFh
    call ?j_00037ad8@@YAXXZ
    db 08Bh, 04Ch, 024h, 030h, 051h, 08Bh, 0CFh
    call ?j_00002608@@YAXXZ
    db 08Bh, 054h, 024h, 034h, 052h, 08Bh, 0CFh
    call ?j_00002608@@YAXXZ
    db 08Bh, 044h, 024h, 038h, 050h, 08Bh, 0CFh
    call ?j_00002608@@YAXXZ
    db 08Bh, 04Ch, 024h, 03Ch, 051h, 08Bh, 0CFh
    call ?j_00002608@@YAXXZ
    db 08Bh, 015h
    dd ?Mouse0040F780@@3PAVMouse@@A
    db 08Bh, 082h, 0A8h, 04Dh, 000h, 000h, 050h, 08Bh, 0CFh
    call ?j_00001370@@YAXXZ
    db 08Dh, 04Eh, 014h, 051h, 08Bh, 0CFh
    call ?j_0002ea41@@YAXXZ
    db 08Ah, 046h, 038h, 084h, 0C0h, 00Fh, 084h, 098h, 000h, 000h, 000h, 08Bh, 00Dh
    dd ?KeyboardGlobal0040F780@@3PAUKeyboard0040F780@@A
    db 068h, 0C8h, 000h, 000h, 000h
    call ?j_00040dd1@@YAXXZ
    db 084h, 0C0h, 075h, 005h, 0A2h
    dd g_Va012F4C88
    db 08Bh, 00Dh
    dd ?KeyboardGlobal0040F780@@3PAUKeyboard0040F780@@A
    db 068h, 0D0h, 000h, 000h, 000h
    call ?j_00040dd1@@YAXXZ
    db 084h, 0C0h, 075h, 005h, 0A2h
    dd g_Va012F4C89
    db 08Bh, 00Dh
    dd ?KeyboardGlobal0040F780@@3PAUKeyboard0040F780@@A
    db 068h, 0CBh, 000h, 000h, 000h
    call ?j_00040dd1@@YAXXZ
    db 084h, 0C0h, 075h, 005h, 0A2h
    dd g_Va012F4C8A
    db 08Bh, 00Dh
    dd ?KeyboardGlobal0040F780@@3PAUKeyboard0040F780@@A
    db 068h, 0CDh, 000h, 000h, 000h
    call ?j_00040dd1@@YAXXZ
    db 084h, 0C0h, 075h, 005h, 0A2h
    dd g_Va012F4C8B
    db 0A0h
    dd g_Va012F4C88
    db 084h, 0C0h, 075h, 02Bh, 0A0h
    dd g_Va012F4C89
    db 084h, 0C0h, 075h, 022h, 0A0h
    dd g_Va012F4C8A
    db 084h, 0C0h, 075h, 019h, 0A0h
    dd g_Va012F4C8B
    db 084h, 0C0h, 075h, 010h, 083h, 0BEh, 048h, 001h, 000h, 000h, 002h, 075h, 007h, 08Bh, 0CEh
    call ?j_00034d15@@YAXXZ
    db 08Ah, 086h, 054h, 001h, 000h, 000h, 084h, 0C0h, 074h, 017h, 08Bh, 00Dh
    dd ?KeyboardGlobal0040F780@@3PAUKeyboard0040F780@@A
    db 06Ah, 04Bh
    call ?j_00040dd1@@YAXXZ
    db 084h, 0C0h, 075h, 006h, 088h, 086h, 054h, 001h, 000h, 000h, 08Ah, 086h, 055h, 001h, 000h, 000h
    db 084h, 0C0h, 074h, 017h, 08Bh, 00Dh
    dd ?KeyboardGlobal0040F780@@3PAUKeyboard0040F780@@A
    db 06Ah, 04Dh
    call ?j_00040dd1@@YAXXZ
    db 084h, 0C0h, 075h, 006h, 088h, 086h, 055h, 001h, 000h, 000h, 08Ah, 086h, 056h, 001h, 000h, 000h
    db 084h, 0C0h, 074h, 017h, 08Bh, 00Dh
    dd ?KeyboardGlobal0040F780@@3PAUKeyboard0040F780@@A
    db 06Ah, 048h
    call ?j_00040dd1@@YAXXZ
    db 084h, 0C0h, 075h, 006h, 088h, 086h, 056h, 001h, 000h, 000h, 08Ah, 086h, 057h, 001h, 000h, 000h
    db 084h, 0C0h, 074h, 017h, 08Bh, 00Dh
    dd ?KeyboardGlobal0040F780@@3PAUKeyboard0040F780@@A
    db 06Ah, 050h
    call ?j_00040dd1@@YAXXZ
    db 084h, 0C0h, 075h, 006h, 088h, 086h, 057h, 001h, 000h, 000h, 05Fh, 05Eh, 05Dh, 05Bh, 083h, 0C4h
    db 030h, 0C3h
?rva005B5590@BfmeOwnVVD@@QAEXXZ ENDP
_TEXT ENDS
END
