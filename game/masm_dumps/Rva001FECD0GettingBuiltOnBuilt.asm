.386
.model flat
; ?rva001FECD0@GettingBuiltBehavior@@UAEX_N@Z
; Retail @ 0x001FECD0 size 718 (Open-BFME4). Address-derived identity: secondary
; vtable 0x010A45E0 slot +0x14 (ILT 0x000015C8) owns this body at +0x20 of the
; module; it ends with RET 4 at +0x2CB, then INT3 (evidence
; identity_evidence/001fe970-layout-and-abi.md).
; MASM dump because the measured C++ bank (targets/game/reverse/attempts/0x001fecd0.cpp,
; sha256 09729959420f4abe824fe99501fe750911f92b0c696925bc06ead2d3622e581e)
; reaches 718/718 bytes with 28 relocations and 5 non-relocation bytes at
; +0x234/+0x238: retail emits `lea ecx,[esp+0x10]` (receiver of
; Rva00087750Ref::operator=) BEFORE `push eax` (source `*loop`), while VC7.1 emits
; the push first and then `lea ecx,[esp+0x14]`. This session's 8-variant batch
; (receiver pointer/ref locals bound before and inside the guard, source refs
; bound before the guard, __forceinline ref-returning helper, arrow call,
; assignment-as-value guard, bool guard, declaration hoists) plus 16+ logged
; experiments (copy-init, base-cast lhs, scoped calls, loop by reference, yoda
; guard, pointer lhs aliases) never change those five bytes; only spellings that
; shrink to 691-722 bytes break the whole body.
; Evidence: targets/game/reverse/identity_evidence/001fecd0-masm-codegen-blocker.md
EXTERN ?AudioGlobal004092A0@@3PAUAudioView004092A0@@A:BYTE
EXTERN ?TheBuildAssistant@@3PAVBuildAssistant@@A:BYTE
EXTERN ?bfmeApply980B@BfmeUseB980@@QAEPAXHH@Z:NEAR
EXTERN ?g_bfmeScaleBC@@3MA:BYTE
EXTERN ?j_00001f41@@YAXXZ:NEAR
EXTERN ?j_000022bb@@YAXXZ:NEAR
EXTERN ?j_00008dd2@@YAXXZ:NEAR
EXTERN ?j_00008e86@@YAXXZ:NEAR
EXTERN ?j_000157da@@YAXXZ:NEAR
EXTERN ?j_00019a7e@@YAXXZ:NEAR
EXTERN ?j_00020824@@YAXXZ:NEAR
EXTERN ?j_0002191d@@YAXXZ:NEAR
EXTERN ?j_00026f35@@YAXXZ:NEAR
EXTERN ?j_0002c6d8@@YAXXZ:NEAR
EXTERN ?j_0002edc5@@YAXXZ:NEAR
EXTERN ?j_00030887@@YAXXZ:NEAR
EXTERN ?j_00032dee@@YAXXZ:NEAR
EXTERN __imp__InterlockedDecrement@4:BYTE
EXTERN g_Va0100B700:NEAR
_TEXT SEGMENT
public ?rva001FECD0@GettingBuiltBehavior@@UAEX_N@Z
?rva001FECD0@GettingBuiltBehavior@@UAEX_N@Z PROC
    db 064h, 0A1h, 000h, 000h, 000h, 000h, 06Ah, 0FFh, 068h
    dd g_Va0100B700
    db 050h, 064h, 089h, 025h, 000h, 000h, 000h, 000h, 083h, 0ECh, 074h, 055h, 056h, 057h, 08Bh, 0F9h
    db 08Bh, 077h, 0E8h, 08Bh, 0CEh
    call ?j_00020824@@YAXXZ
    db 08Bh, 0E8h, 085h, 0EDh, 00Fh, 084h, 083h, 002h, 000h, 000h, 053h, 08Ah, 09Ch, 024h, 094h, 000h
    db 000h, 000h, 084h, 0DBh, 075h, 010h, 08Bh, 007h, 055h, 08Bh, 0CFh, 0FFh, 050h, 018h, 084h, 0C0h
    db 00Fh, 084h, 066h, 002h, 000h, 000h, 084h, 0DBh, 0C6h, 047h, 012h, 001h, 075h, 008h, 08Dh, 04Fh
    db 0E0h
    call ?j_00008dd2@@YAXXZ
    db 08Bh, 047h, 00Ch, 085h, 0C0h, 075h, 024h, 08Bh, 046h, 004h, 085h, 0C0h, 075h, 004h, 033h, 0C9h
    db 0EBh, 00Eh, 08Bh, 048h, 004h, 085h, 0C9h, 074h, 005h
    call ?j_000022bb@@YAXXZ
    db 08Bh, 0C8h, 06Ah, 0FFh, 055h
    call ?bfmeApply980B@BfmeUseB980@@QAEPAXHH@Z
    db 089h, 047h, 00Ch, 08Ah, 086h, 044h, 003h, 000h, 000h, 024h, 001h, 088h, 047h, 015h, 074h, 04Ch
    db 08Bh, 0CEh
    call ?j_00020824@@YAXXZ
    db 06Ah, 001h, 056h, 08Dh, 088h, 048h, 003h, 000h, 000h
    call ?j_00019a7e@@YAXXZ
    db 08Bh, 04Eh, 044h, 0C6h, 086h, 042h, 003h, 000h, 000h, 000h, 08Bh, 046h, 004h, 085h, 0C0h, 089h
    db 04Ch, 024h, 010h, 074h, 00Ch, 08Bh, 048h, 004h, 085h, 0C9h, 074h, 005h
    call ?j_000022bb@@YAXXZ
    db 08Bh, 054h, 024h, 010h, 055h, 052h, 08Dh, 04Eh, 038h, 051h, 08Bh, 00Dh
    dd ?TheBuildAssistant@@3PAVBuildAssistant@@A
    db 050h
    call ?j_0002edc5@@YAXXZ
    db 08Ah, 047h, 016h, 084h, 0C0h, 074h, 00Ch, 0C7h, 086h, 020h, 002h, 000h, 000h, 000h, 000h, 080h
    db 0BFh, 0EBh, 01Ch, 08Ah, 047h, 015h, 084h, 0C0h, 074h, 00Ah, 0C7h, 086h, 020h, 002h, 000h, 000h
    db 000h, 000h, 000h, 000h, 06Ah, 001h, 06Ah, 002h, 08Bh, 0CEh
    call ?j_00032dee@@YAXXZ
    db 08Ah, 047h, 015h, 084h, 0C0h, 075h, 020h, 08Ah, 047h, 016h, 084h, 0C0h, 075h, 019h, 08Bh, 08Eh
    db 000h, 002h, 000h, 000h, 08Bh, 011h, 0FFh, 052h, 014h, 0D8h, 00Dh
    dd ?g_bfmeScaleBC@@3MA
    db 0D9h, 09Eh, 020h, 002h, 000h, 000h, 0EBh, 00Dh, 06Ah, 000h, 08Bh, 0CEh
    call ?j_00030887@@YAXXZ
    db 0C6h, 047h, 013h, 000h, 08Ah, 047h, 015h, 084h, 0C0h, 075h, 00Eh, 08Ah, 047h, 013h, 084h, 0C0h
    db 075h, 021h, 08Ah, 047h, 016h, 084h, 0C0h, 075h, 01Ah, 08Bh, 086h, 018h, 001h, 000h, 000h, 0A8h
    db 010h, 075h, 010h, 083h, 0C8h, 010h, 08Bh, 0CEh, 089h, 086h, 018h, 001h, 000h, 000h
    call ?j_0002191d@@YAXXZ
    db 0C6h, 047h, 014h, 000h, 0F6h, 086h, 010h, 001h, 000h, 000h, 020h, 074h, 016h, 08Bh, 086h, 010h
    db 001h, 000h, 000h, 083h, 0E0h, 0DFh, 08Bh, 0CEh, 089h, 086h, 010h, 001h, 000h, 000h
    call ?j_0002191d@@YAXXZ
    db 08Bh, 086h, 014h, 001h, 000h, 000h, 0A9h, 000h, 000h, 000h, 020h, 074h, 012h, 025h, 0FFh, 0FFh
    db 0FFh, 0DFh, 08Bh, 0CEh, 089h, 086h, 014h, 001h, 000h, 000h
    call ?j_0002191d@@YAXXZ
    db 08Bh, 086h, 014h, 001h, 000h, 000h, 0A9h, 000h, 000h, 000h, 008h, 074h, 012h, 025h, 0FFh, 0FFh
    db 0FFh, 0F7h, 08Bh, 0CEh, 089h, 086h, 014h, 001h, 000h, 000h
    call ?j_0002191d@@YAXXZ
    db 056h, 08Bh, 0CEh
    call ?j_00001f41@@YAXXZ
    db 08Bh, 047h, 0E8h, 06Ah, 001h, 050h, 08Dh, 04Fh, 0E0h
    call ?j_000157da@@YAXXZ
    db 08Bh, 00Dh
    dd ?AudioGlobal004092A0@@3PAUAudioView004092A0@@A
    db 085h, 0C9h, 08Bh, 06Fh, 0E4h, 00Fh, 084h, 0B8h, 000h, 000h, 000h, 08Bh, 047h, 004h, 083h, 0F8h
    db 005h, 072h, 006h, 08Bh, 011h, 050h, 0FFh, 052h, 04Ch, 033h, 0C9h, 089h, 04Ch, 024h, 010h, 08Ah
    db 047h, 015h, 084h, 0C0h, 089h, 08Ch, 024h, 08Ch, 000h, 000h, 000h, 074h, 005h, 08Dh, 045h, 010h
    db 0EBh, 00Dh, 08Ah, 047h, 013h, 084h, 0C0h, 08Dh, 045h, 008h, 074h, 003h, 08Dh, 045h, 00Ch, 083h
    db 038h, 000h, 074h, 054h, 08Dh, 04Ch, 024h, 010h, 050h
    call ?j_0002c6d8@@YAXXZ
    db 08Bh, 04Ch, 024h, 010h, 085h, 0C9h, 074h, 042h, 08Bh, 076h, 074h, 056h, 08Dh, 044h, 024h, 014h
    db 050h, 08Dh, 04Ch, 024h, 01Ch
    call ?j_00008e86@@YAXXZ
    db 08Bh, 00Dh
    dd ?AudioGlobal004092A0@@3PAUAudioView004092A0@@A
    db 08Bh, 011h, 08Dh, 044h, 024h, 014h, 050h, 0C6h, 084h, 024h, 090h, 000h, 000h, 000h, 001h, 0FFh
    db 052h, 044h, 08Dh, 04Ch, 024h, 014h, 089h, 047h, 004h, 0C6h, 084h, 024h, 08Ch, 000h, 000h, 000h
    db 000h
    call ?j_00026f35@@YAXXZ
    db 08Bh, 04Ch, 024h, 010h, 085h, 0C9h, 0C7h, 084h, 024h, 08Ch, 000h, 000h, 000h, 0FFh, 0FFh, 0FFh
    db 0FFh, 074h, 01Ch, 08Bh, 0F1h, 083h, 0C1h, 004h, 051h, 0FFh, 015h
    dd __imp__InterlockedDecrement@4
    db 085h, 0C0h, 07Fh, 00Ch, 085h, 0F6h, 074h, 008h, 08Bh, 016h, 06Ah, 001h, 08Bh, 0CEh, 0FFh, 012h
    db 05Bh, 08Bh, 08Ch, 024h, 080h, 000h, 000h, 000h, 05Fh, 05Eh, 05Dh, 064h, 089h, 00Dh, 000h, 000h
    db 000h, 000h, 081h, 0C4h, 080h, 000h, 000h, 000h, 0C2h, 004h, 000h
?rva001FECD0@GettingBuiltBehavior@@UAEX_N@Z ENDP
_TEXT ENDS
END
