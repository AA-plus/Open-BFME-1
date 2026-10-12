.386
.model flat
; W3DTankDraw::doDrawModule. Identity proven: ctor 0x0077F050 installs vtable
; VA 0x01125AB0 whose slot 9 is ILT 0x00010A9B; the ILT jump reaches this body;
; ilt_oracle check CONFIRMED p_false=5.22e-04; thiscall receiver in ECX and a
; single ret 4 at +0x311 close the 788-byte extent.
; Codegen blocker: VC7.1 /O2 C++ tops out at 782/788. The two particle-handle
; copies keep X/Z in EBX/EBP opposite to the source form. Six differing bytes
; at +0x14E +0x153 +0x165 +0x16A +0x19E +0x1A3 survive 40+ spellings: the
; BFME2 donor port (771B) the donor flags /O1 /G7 the intrinsic form and every
; register-lifetime variant. Body is the symbolic lift of the gen dump with
; its twelve HIGHLOW sites (calls through ?j_ ILT thunks).
; Evidence: targets/game/reverse/identity_evidence/0077e690-masm-landing.md
EXTERN ?BfmeSubdualCapERD@@3MB:BYTE
EXTERN ?FadeTacticalView@@3PAVFadeView@@A:BYTE
EXTERN ?TheBfmeGlobal_012f076c@@3PAVBfmeGlobal_012f076c@@A:BYTE
EXTERN ?g_bfmeADL@@3MA:BYTE
EXTERN ?g_bfmeScaleBK@@3MA:BYTE
EXTERN ?j_00001b18@@YAXXZ:NEAR
EXTERN ?j_00003783@@YAXXZ:NEAR
EXTERN ?j_000047c8@@YAXXZ:NEAR
EXTERN ?j_00005ee3@@YAXXZ:NEAR
EXTERN ?j_00012e3b@@YAXXZ:NEAR
EXTERN ?j_000187f5@@YAXXZ:NEAR
EXTERN ?j_00027318@@YAXXZ:NEAR
EXTERN ?j_00032d35@@YAXXZ:NEAR
EXTERN ?j_00036840@@YAXXZ:NEAR
EXTERN ?j_00038e15@@YAXXZ:NEAR
EXTERN ?j_0003c0d8@@YAXXZ:NEAR
EXTERN ?j_0003daa5@@YAXXZ:NEAR
EXTERN ?j_0003f23d@@YAXXZ:NEAR
EXTERN ?j_00042d52@@YAXXZ:NEAR
EXTERN __real@3727c5ac:BYTE
_TEXT SEGMENT
public ?doDrawModule@W3DTankDraw@@UAEXPBVMatrix3D@@@Z
?doDrawModule@W3DTankDraw@@UAEXPBVMatrix3D@@@Z PROC
    db 083h, 0ECh, 014h, 056h, 08Bh, 0F1h, 08Bh, 00Dh
    dd ?FadeTacticalView@@3PAVFadeView@@A
    db 08Bh, 001h, 0FFh, 090h, 0D4h, 000h, 000h, 000h, 084h, 0C0h, 074h, 013h, 08Bh, 00Dh
    dd ?FadeTacticalView@@3PAVFadeView@@A
    db 08Bh, 011h, 0FFh, 052h, 074h, 084h, 0C0h, 00Fh, 084h, 0E2h, 002h, 000h, 000h, 08Bh, 00Dh
    dd ?TheBfmeGlobal_012f076c@@3PAVBfmeGlobal_012f076c@@A
    db 057h, 08Bh, 0F9h
    call ?j_0003f23d@@YAXXZ
    db 084h, 0C0h, 00Fh, 085h, 0CBh, 002h, 000h, 000h, 08Bh, 0CFh
    call ?j_00003783@@YAXXZ
    db 084h, 0C0h, 00Fh, 085h, 0BCh, 002h, 000h, 000h, 08Bh, 00Dh
    dd ?TheBfmeGlobal_012f076c@@3PAVBfmeGlobal_012f076c@@A
    call ?j_00027318@@YAXXZ
    db 084h, 0C0h, 00Fh, 085h, 0A9h, 002h, 000h, 000h, 08Bh, 006h, 08Bh, 0CEh, 0FFh, 090h, 0B8h, 000h
    db 000h, 000h, 085h, 0C0h, 00Fh, 084h, 097h, 002h, 000h, 000h, 08Bh, 016h, 08Bh, 0CEh, 0FFh, 092h
    db 0B8h, 000h, 000h, 000h, 03Bh, 086h, 094h, 002h, 000h, 000h, 074h, 007h, 08Bh, 0CEh
    call ?j_00036840@@YAXXZ
    db 08Bh, 046h, 008h, 08Bh, 088h, 0FCh, 000h, 000h, 000h, 085h, 0C9h, 089h, 04Ch, 024h, 008h, 00Fh
    db 084h, 069h, 002h, 000h, 000h, 08Bh, 081h, 008h, 002h, 000h, 000h, 085h, 0C0h, 00Fh, 084h, 05Bh
    db 002h, 000h, 000h
    call ?j_000047c8@@YAXXZ
    db 0D9h, 054h, 024h, 00Ch, 0D8h, 01Dh
    dd __real@3727c5ac
    db 0DFh, 0E0h, 0F6h, 0C4h, 041h, 075h, 01Ch, 08Bh, 04Eh, 008h
    call ?j_00012e3b@@YAXXZ
    db 084h, 0C0h, 075h, 010h, 08Ah, 046h, 02Dh, 084h, 0C0h, 075h, 009h, 08Bh, 0CEh
    call ?j_00032d35@@YAXXZ
    db 0EBh, 007h, 08Bh, 0CEh
    call ?j_00042d52@@YAXXZ
    db 0D9h, 044h, 024h, 00Ch, 0D9h, 0FAh, 0D9h, 005h
    dd ?g_bfmeADL@@3MA
    db 0D8h, 0C9h, 0D8h, 005h
    dd ?g_bfmeScaleBK@@3MA
    db 0D9h, 054h, 024h, 010h, 0D8h, 01Dh
    dd ?BfmeSubdualCapERD@@3MB
    db 0DFh, 0E0h, 0F6h, 0C4h, 041h, 075h, 008h, 0C7h, 044h, 024h, 010h, 000h, 000h, 080h, 03Fh, 0D8h
    db 005h
    dd ?g_bfmeScaleBK@@3MA
    db 08Bh, 04Ch, 024h, 010h, 089h, 04Ch, 024h, 014h, 0D9h, 054h, 024h, 018h, 0D8h, 01Dh
    dd ?BfmeSubdualCapERD@@3MB
    db 0DFh, 0E0h, 0F6h, 0C4h, 041h, 075h, 008h, 0C7h, 044h, 024h, 018h, 000h, 000h, 080h, 03Fh, 08Bh
    db 086h, 07Ch, 002h, 000h, 000h, 085h, 0C0h, 08Bh, 07Ch, 024h, 014h, 053h, 08Bh, 05Ch, 024h, 014h
    db 055h, 08Bh, 06Ch, 024h, 020h, 074h, 02Fh, 085h, 0C0h, 075h, 005h
    call ?j_00001b18@@YAXXZ
    db 005h, 034h, 001h, 000h, 000h, 089h, 018h, 089h, 078h, 004h, 089h, 068h, 008h, 08Bh, 086h, 07Ch
    db 002h, 000h, 000h, 085h, 0C0h, 075h, 005h
    call ?j_00001b18@@YAXXZ
    db 08Bh, 054h, 024h, 020h, 089h, 090h, 040h, 001h, 000h, 000h, 08Bh, 086h, 088h, 002h, 000h, 000h
    db 085h, 0C0h, 074h, 02Fh, 085h, 0C0h, 075h, 005h
    call ?j_00001b18@@YAXXZ
    db 005h, 034h, 001h, 000h, 000h, 089h, 018h, 089h, 078h, 004h, 089h, 068h, 008h, 08Bh, 086h, 088h
    db 002h, 000h, 000h, 085h, 0C0h, 075h, 005h
    call ?j_00001b18@@YAXXZ
    db 08Bh, 04Ch, 024h, 020h, 089h, 088h, 040h, 001h, 000h, 000h, 08Bh, 086h, 0E8h, 002h, 000h, 000h
    db 085h, 0C0h, 00Fh, 084h, 032h, 001h, 000h, 000h, 08Bh, 05Ch, 024h, 010h, 08Bh, 08Bh, 004h, 002h
    db 000h, 000h, 085h, 0C9h, 074h, 008h, 08Bh, 081h, 0CCh, 001h, 000h, 000h, 0EBh, 002h, 033h, 0C0h
    db 085h, 0C0h, 00Fh, 084h, 01Eh, 001h, 000h, 000h, 08Bh, 056h, 004h, 08Bh, 0B8h, 0A4h, 000h, 000h
    db 000h, 08Bh, 082h, 064h, 001h, 000h, 000h, 089h, 044h, 024h, 010h
    call ?j_0003daa5@@YAXXZ
    db 0D9h, 05Ch, 024h, 014h, 085h, 0FFh, 00Fh, 084h, 08Fh, 000h, 000h, 000h, 08Bh, 06Eh, 004h, 08Bh
    db 0CBh
    call ?j_000047c8@@YAXXZ
    db 0D8h, 074h, 024h, 014h, 0D8h, 09Dh, 068h, 001h, 000h, 000h, 0DFh, 0E0h, 0F6h, 0C4h, 005h, 07Ah
    db 074h, 08Dh, 04Ch, 024h, 018h, 051h, 08Bh, 0CBh
    call ?j_00005ee3@@YAXXZ
    db 0D9h, 044h, 024h, 01Ch, 0D8h, 08Eh, 0F0h, 002h, 000h, 000h, 0D9h, 044h, 024h, 018h, 0D8h, 08Eh
    db 0ECh, 002h, 000h, 000h, 0DEh, 0C1h, 0D8h, 02Dh
    dd ?BfmeSubdualCapERD@@3MB
    db 0D9h, 0E1h, 0D8h, 01Dh
    dd __real@3727c5ac
    db 0DFh, 0E0h, 0F6h, 0C4h, 041h, 075h, 01Dh, 083h, 0FFh, 0FFh, 075h, 00Ch, 0D9h, 044h, 024h, 010h
    db 051h, 0D9h, 0E0h, 0D9h, 01Ch, 024h, 0EBh, 005h, 08Bh, 054h, 024h, 010h, 052h, 08Bh, 0CEh
    call ?j_0003c0d8@@YAXXZ
    db 08Bh, 044h, 024h, 018h, 08Bh, 04Ch, 024h, 01Ch, 08Bh, 054h, 024h, 020h, 089h, 086h, 0ECh, 002h
    db 000h, 000h, 089h, 08Eh, 0F0h, 002h, 000h, 000h, 089h, 096h, 0F4h, 002h, 000h, 000h, 0EBh, 05Fh
    db 08Bh, 07Eh, 004h, 08Bh, 0CBh
    call ?j_000047c8@@YAXXZ
    db 0D8h, 074h, 024h, 014h, 0D8h, 09Fh, 06Ch, 001h, 000h, 000h, 0DFh, 0E0h, 0F6h, 0C4h, 001h, 075h
    db 044h, 08Bh, 086h, 0E8h, 002h, 000h, 000h, 033h, 0DBh, 033h, 0EDh, 03Bh, 0C3h, 07Eh, 036h, 08Dh
    db 0BEh, 0A4h, 002h, 000h, 000h, 08Bh, 0FFh, 0D9h, 007h, 0D8h, 064h, 024h, 010h, 0D9h, 05Ch, 024h
    db 014h, 08Bh, 044h, 024h, 014h, 050h
    call ?j_000187f5@@YAXXZ
    db 0D8h, 06Ch, 024h, 018h, 089h, 05Fh, 004h, 083h, 0C4h, 004h, 0D9h, 01Fh, 08Bh, 086h, 0E8h, 002h
    db 000h, 000h, 083h, 0C7h, 014h, 045h, 03Bh, 0E8h, 07Ch, 0D2h, 08Bh, 04Ch, 024h, 028h, 051h, 08Bh
    db 0CEh
    call ?j_00038e15@@YAXXZ
    db 05Dh, 05Bh, 05Fh, 05Eh, 083h, 0C4h, 014h, 0C2h, 004h, 000h
?doDrawModule@W3DTankDraw@@UAEXPBVMatrix3D@@@Z ENDP
_TEXT ENDS
END
