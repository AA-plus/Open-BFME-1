.386
.model flat
; ?onEnter@GiantBirdGuardOuterState@@UAE?AW4StateReturnType@@XZ
; Retail @ 0x002BD310 size 525
;
; MASM dump carrying a measured codegen blocker. Identity is CONFIRMED, not
; address-derived: the GiantBirdGuardOuterState vtable 0x010C7C28 is installed
; at 0x002C04D0, its slot 4 ILT 0x00040142 reaches this body, and
; `tools/ilt_oracle.py check ?onEnter@GiantBirdGuardOuterState@@UAE?AW4StateReturnType@@XZ
; 0x00040142` returns CONFIRMED p_false=2.61e-04 (exact).
; The reconstructible C++ body (targets/game/reverse/attempts/0x002bd310.cpp)
; compiles to exactly 525 bytes with 25 relocations and shape 1.000; its whole
; residue is one register tie-break in the AIAttackState ctor argument
; materialization: retail keeps the machine pointer in ECX and the
; conditionsToConsider address in EDX (8b 4e 1c / 8d 56 24 / 52 / 51), while
; VC7.1 always picks them the other way (8b 56 1c / 8d 4e 24 / 51 / 52).
; Four non-relocation bytes at +0x1C1 +0x1C4 +0x1C6 +0x1CD survive 80+ measured
; spellings (2026-09-24..2026-10-13): direct member, this->, state->, same- and
; base-class getMachine() accessors, a free inline helper, ternaries,
; reinterpret/static casts, int and (Bool) literals, placement new, one-line and
; two-line forms, hoisted locals, plus flag sweeps (/Oa /Ow /Ob0 /Ob2 /Os /Ot)
; and upstream reorderings. A tail-only bisect flips machine to ECX with
; getMachine(), but any embedding containing the guardMode prologue pins
; EDX/ECX: this is an allocator tie-break, not source-spellable. The byte-exact
; sibling GiantBirdGuardAttackAggressorState (0x002BD6F0) reaches retail's
; ECX/EDX through the same `new AIAttackState(getMachine()), ...)` shape while
; the direct-member rewrite reproduces exactly these four bytes, and flipping
; it to the direct member reproduces the same four-byte residue.
; The dump body is byte-identical to retail outside its relocation slots.
; Evidence: targets/game/reverse/identity_evidence/002bd310-masm-codegen-blocker.md
EXTERN g_Va0101377B:NEAR
EXTERN ?TheBfmeGameLogic@@3PAVGameLogic@@A:BYTE
EXTERN ?findObjectByID@GameLogic@@QAEPAVObject@@H@Z:NEAR
EXTERN ?TheTeamFactory@@3PAVTeamFactory@@A:BYTE
EXTERN ?findTeamByID@TeamFactory@@QAEPAVTeam@@I@Z:NEAR
EXTERN ?getPosition@Team@@QAEXPAUCoord3D@@@Z:NEAR
EXTERN ?getAdjustedVisionRangeForObject@AI@@SAMPBVObject@@H@Z:NEAR
EXTERN ?bfmeGet1263@BfmeA1263@@QAEXPAUBfmeVec1263@@@Z:NEAR
EXTERN ?TheAI@@3PAVAI@@A:BYTE
EXTERN __real@4f800000:BYTE
EXTERN __real@41000000:BYTE
EXTERN __ftol2:NEAR
EXTERN ??2@YAPAXI@Z:NEAR
EXTERN ??0AIAttackState@@QAE@PAVStateMachine@@_N11PAVAttackExitConditionsInterface@@@Z:NEAR
_TEXT SEGMENT
public ?onEnter@GiantBirdGuardOuterState@@UAE?AW4StateReturnType@@XZ
?onEnter@GiantBirdGuardOuterState@@UAE?AW4StateReturnType@@XZ PROC
    db 064h, 0A1h, 000h, 000h, 000h, 000h, 06Ah, 0FFh, 068h
    dd g_Va0101377B
    db 050h, 064h, 089h, 025h, 000h, 000h, 000h, 000h, 083h, 0ECh, 010h, 056h, 08Bh, 0F1h, 057h, 08Bh
    db 07Eh, 01Ch, 08Bh, 047h, 070h, 083h, 0F8h, 001h, 075h, 014h, 05Fh, 083h, 0C8h, 0FFh, 05Eh, 08Bh
    db 04Ch, 024h, 010h, 064h, 089h, 00Dh, 000h, 000h, 000h, 000h, 083h, 0C4h, 01Ch, 0C3h, 08Bh, 047h
    db 044h, 08Bh, 00Dh
    dd ?TheBfmeGameLogic@@3PAVGameLogic@@A
    db 053h, 050h
    call ?findObjectByID@GameLogic@@QAEPAVObject@@H@Z
    db 08Bh, 04Fh, 048h, 051h, 08Bh, 00Dh
    dd ?TheTeamFactory@@3PAVTeamFactory@@A
    db 08Bh, 0D8h
    call ?findTeamByID@TeamFactory@@QAEPAVTeam@@I@Z
    db 085h, 0DBh, 074h, 019h, 083h, 0C3h, 038h, 08Bh, 013h, 089h, 054h, 024h, 010h, 08Bh, 043h, 004h
    db 089h, 044h, 024h, 014h, 08Bh, 04Bh, 008h, 089h, 04Ch, 024h, 018h, 0EBh, 02Ch, 085h, 0C0h, 074h
    db 00Eh, 08Dh, 054h, 024h, 010h, 052h, 08Bh, 0C8h
    call ?getPosition@Team@@QAEXPAUCoord3D@@@Z
    db 0EBh, 01Ah, 08Bh, 046h, 01Ch, 083h, 0C0h, 050h, 08Bh, 008h, 089h, 04Ch, 024h, 010h, 08Bh, 050h
    db 004h, 089h, 054h, 024h, 014h, 08Bh, 040h, 008h, 089h, 044h, 024h, 018h, 08Bh, 07Eh, 01Ch, 08Bh
    db 047h, 06Ch, 08Bh, 00Dh
    dd ?TheBfmeGameLogic@@3PAVGameLogic@@A
    db 050h
    call ?findObjectByID@GameLogic@@QAEPAVObject@@H@Z
    db 08Bh, 0D8h, 085h, 0DBh, 075h, 015h, 05Bh, 05Fh, 083h, 0C8h, 0FFh, 05Eh, 08Bh, 04Ch, 024h, 010h
    db 064h, 089h, 00Dh, 000h, 000h, 000h, 000h, 083h, 0C4h, 01Ch, 0C3h, 08Bh, 07Fh, 010h, 06Ah, 003h
    db 057h
    call ?getAdjustedVisionRangeForObject@AI@@SAMPBVObject@@H@Z
    db 0D9h, 05Ch, 024h, 014h, 08Bh, 046h, 01Ch, 08Bh, 048h, 04Ch, 083h, 0C4h, 008h, 085h, 0C9h, 074h
    db 02Ah, 08Ah, 050h, 068h, 084h, 0D2h, 074h, 019h, 083h, 0C0h, 05Ch, 08Bh, 008h, 089h, 04Ch, 024h
    db 010h, 08Bh, 050h, 004h, 089h, 054h, 024h, 014h, 08Bh, 040h, 008h, 089h, 044h, 024h, 018h, 0EBh
    db 00Ah, 08Dh, 054h, 024h, 010h, 052h
    call ?bfmeGet1263@BfmeA1263@@QAEXPAUBfmeVec1263@@@Z
    db 08Bh, 04Ch, 024h, 010h, 0D9h, 044h, 024h, 00Ch, 08Bh, 054h, 024h, 014h, 0D8h, 04Ch, 024h, 00Ch
    db 08Dh, 046h, 02Ch, 089h, 008h, 08Bh, 04Ch, 024h, 018h, 0D9h, 05Eh, 038h, 089h, 050h, 004h, 089h
    db 048h, 008h, 08Bh, 015h
    dd ?TheAI@@3PAVAI@@A
    db 08Bh, 04Ah, 014h, 08Bh, 041h, 03Ch, 0DBh, 041h, 03Ch, 085h, 0C0h, 07Dh, 006h, 0D8h, 005h
    dd __real@4f800000
    db 0D8h, 01Dh
    dd __real@41000000
    db 0DFh, 0E0h, 0F6h, 0C4h, 005h, 07Ah, 008h, 0D9h, 005h
    dd __real@41000000
    db 0EBh, 015h, 08Bh, 049h, 03Ch, 085h, 0C9h, 089h, 04Ch, 024h, 00Ch, 0DBh, 044h, 024h, 00Ch, 07Dh
    db 006h, 0D8h, 005h
    dd __real@4f800000
    db 08Bh, 015h
    dd ?TheBfmeGameLogic@@3PAVGameLogic@@A
    db 08Bh, 042h, 03Ch, 0DBh, 042h, 03Ch, 085h, 0C0h, 07Dh, 006h, 0D8h, 005h
    dd __real@4f800000
    db 0D8h, 0C1h
    call __ftol2
    db 0DDh, 0D8h, 06Ah, 054h, 089h, 046h, 03Ch, 0C7h, 046h, 028h, 007h, 000h, 000h, 000h
    call ??2@YAPAXI@Z
    db 083h, 0C4h, 004h, 089h, 044h, 024h, 00Ch, 085h, 0C0h, 0C7h, 044h, 024h, 024h, 000h, 000h, 000h
    db 000h, 074h, 017h, 08Bh, 04Eh, 01Ch, 08Dh, 056h, 024h, 052h, 06Ah, 000h, 06Ah, 001h, 06Ah, 000h
    db 051h, 08Bh, 0C8h
    call ??0AIAttackState@@QAE@PAVStateMachine@@_N11PAVAttackExitConditionsInterface@@@Z
    db 0EBh, 002h, 033h, 0C0h, 089h, 046h, 040h, 08Bh, 040h, 01Ch, 08Bh, 010h, 053h, 08Bh, 0C8h, 0C7h
    db 044h, 024h, 028h, 0FFh, 0FFh, 0FFh, 0FFh, 0FFh, 052h, 038h, 08Bh, 04Eh, 040h, 08Bh, 001h, 0FFh
    db 050h, 010h, 08Bh, 04Ch, 024h, 01Ch, 05Bh, 0F7h, 0D8h, 05Fh, 01Bh, 0C0h, 05Eh, 064h, 089h, 00Dh
    db 000h, 000h, 000h, 000h, 083h, 0C4h, 01Ch, 0C3h
?onEnter@GiantBirdGuardOuterState@@UAE?AW4StateReturnType@@XZ ENDP
_TEXT ENDS
END
