.386
.model flat
; ?Rva0075CC80@@YAXXZ
; Retail @ 0x0075CC80 size 340
;
; MASM dump carrying a measured codegen blocker. Identity is not provable: no
; caller or string names the body; the owner keeps a render object at +0x34
; and reaches the FadeView vtable slots +0x118 (kind vector) and +0x138 (kind
; set), so the name stays address-derived.
;
; The reconstructible C++ body (targets/game/reverse/attempts/0x0075cc80.cpp,
; sha256 061c35a46a6a2adc308188fe9b0672501f5dd3e3b7690aa81150e2bbba07a908)
; compiles to exactly 340 bytes with 6 relocations and shape 1.000. Its
; entire residue is two register bytes at +0x0118 +0x011B: for the late
; virtual call (ECX = m_034) retail emits mov edx,[ecx]; call [edx+0x138]
; while VC7.1 emits EAX as the vtable scratch. The earlier slot +0x118 call,
; whose result is used, already matches with EDX in the same TU. Measured
; spellings -- render local (plain/early/reference/paren), member-pointer
; call, int kind initializer, stores-before-call, cached m_034, canonical
; header variant, one dead-scope lever, and slot 0x138 return types
; void/int/bool/float/__int64/const void* with and without a (void) cast --
; all leave the identical two bytes or change the body (324-345 bytes). The
; allocator tie is not reachable from C++ (blocker=regalloc/late-vtable-
; scratch); the dump body is byte-identical to retail outside its relocation
; slots.
; Evidence: targets/game/reverse/identity_evidence/0075cc80-masm-codegen-blocker.md
EXTERN ?getPosition@BFMERopeDrawable@@QBEPBUCoord3D@@XZ:NEAR
EXTERN ?j_00004f4d@@YAXXZ:NEAR
EXTERN ?j_00015c5d@@YAXXZ:NEAR
EXTERN ?j_0002d439@@YAXXZ:NEAR
EXTERN ?FadeTacticalView@@3PAVFadeView@@A:BYTE
_TEXT SEGMENT
public ?Rva0075CC80@@YAXXZ
?Rva0075CC80@@YAXXZ PROC
    db 083h, 0ECh, 00Ch, 056h, 08Bh, 0F1h, 08Bh, 086h, 0DCh, 000h, 000h, 000h, 085h, 0C0h, 074h, 00Eh
    db 08Bh, 086h, 0F8h, 000h, 000h, 000h, 085h, 0C0h, 00Fh, 085h, 031h, 001h, 000h, 000h, 053h, 08Bh
    db 05Eh, 008h, 085h, 0DBh, 00Fh, 084h, 024h, 001h, 000h, 000h, 08Bh, 04Eh, 034h, 085h, 0C9h, 00Fh
    db 084h, 019h, 001h, 000h, 000h, 08Bh, 001h, 055h, 057h, 08Bh, 07Eh, 004h, 0FFh, 090h, 040h, 001h
    db 000h, 000h, 08Bh, 0E8h, 08Ah, 087h, 009h, 001h, 000h, 000h, 084h, 0C0h, 074h, 033h, 08Bh, 046h
    db 008h, 06Ah, 000h, 050h
    call ?j_00004f4d@@YAXXZ
    db 08Bh, 08Eh, 0A4h, 000h, 000h, 000h, 083h, 0C4h, 008h, 03Bh, 0C1h, 00Fh, 084h, 0E2h, 000h, 000h
    db 000h, 06Ah, 001h, 08Bh, 0CBh, 089h, 086h, 0A4h, 000h, 000h, 000h
    call ?j_0002d439@@YAXXZ
    db 05Fh, 05Dh, 05Bh, 05Eh, 083h, 0C4h, 00Ch, 0C3h, 083h, 0FDh, 003h, 074h, 00Eh, 08Ah, 087h, 008h
    db 001h, 000h, 000h, 084h, 0C0h, 00Fh, 084h, 0B8h, 000h, 000h, 000h, 08Bh, 00Dh
    dd ?FadeTacticalView@@3PAVFadeView@@A
    db 08Bh, 011h, 0FFh, 092h, 018h, 001h, 000h, 000h, 08Bh, 008h, 08Bh, 050h, 004h, 08Bh, 040h, 008h
    db 089h, 04Ch, 024h, 010h, 08Bh, 0CBh, 089h, 054h, 024h, 014h, 089h, 044h, 024h, 018h
    call ?getPosition@BFMERopeDrawable@@QBEPBUCoord3D@@XZ
    db 0D9h, 044h, 024h, 010h, 0D8h, 020h, 08Dh, 04Ch, 024h, 010h, 0D9h, 05Ch, 024h, 010h, 0D9h, 044h
    db 024h, 014h, 0D8h, 060h, 004h, 0D9h, 05Ch, 024h, 014h, 0D9h, 044h, 024h, 018h, 0D8h, 060h, 008h
    db 0D9h, 05Ch, 024h, 018h
    call ?j_00015c5d@@YAXXZ
    db 0D8h, 097h, 000h, 001h, 000h, 000h, 0DFh, 0E0h, 0F6h, 0C4h, 005h, 07Ah, 006h, 0DDh, 0D8h, 033h
    db 0FFh, 0EBh, 017h, 0D8h, 09Fh, 004h, 001h, 000h, 000h, 0BFh, 002h, 000h, 000h, 000h, 0DFh, 0E0h
    db 0F6h, 0C4h, 041h, 074h, 005h, 0BFh, 001h, 000h, 000h, 000h, 083h, 0FDh, 003h, 075h, 020h, 08Bh
    db 04Eh, 034h, 08Bh, 011h, 057h, 0FFh, 092h, 038h, 001h, 000h, 000h, 089h, 0BEh, 0A0h, 000h, 000h
    db 000h, 089h, 0BEh, 0A4h, 000h, 000h, 000h, 05Fh, 05Dh, 05Bh, 05Eh, 083h, 0C4h, 00Ch, 0C3h, 03Bh
    db 0BEh, 0A0h, 000h, 000h, 000h, 074h, 00Fh, 06Ah, 000h, 08Bh, 0CBh, 089h, 0BEh, 0A4h, 000h, 000h
    db 000h
    call ?j_0002d439@@YAXXZ
    db 05Fh, 05Dh, 05Bh, 05Eh, 083h, 0C4h, 00Ch, 0C3h
?Rva0075CC80@@YAXXZ ENDP
_TEXT ENDS
END
