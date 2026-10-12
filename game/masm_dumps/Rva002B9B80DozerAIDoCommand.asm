.386
.model flat
; ?aiDoCommand@DozerAIUpdate@@UAEXPBUAICommandParms@@@Z
; Retail @ 0x002B9B80 size 330
;
; MASM dump carrying a measured codegen blocker. Identity is proven, not
; guessed: the incremental-link thunk ?j_0000b6a9@@YAXXZ (RVA 0x0000B6A9, ILT
; slot 8532; its ledger row notes target=0x002B9B80) jumps here, and
; tools/ilt_oracle.py check '?aiDoCommand@DozerAIUpdate@@UAEXPBUAICommandParms@@@Z'
; 0x002B9B80 = CONFIRMED exact (p_false=3.26e-04). Constructor 0x002B8680
; installs vtable 0x010C69B4 whose slot 0 holds that thunk (VA 0x0040B6A9
; at file RVA 0x00CC69B4). The GeneralsMD twin names the method
; (DozerAIUpdate.cpp:2343) with plain inherited aiIdle calls in both arms.
;
; The reconstructible C++ body (targets/game/reverse/attempts/0x002b9b80.cpp)
; compiles to exactly 330 bytes with 7 relocations and shape 1.000 -- every
; instruction matches retail once registers and constants are normalised --
; but one receiver byte refuses every equivalent spelling: retail moves ebx
; (mov ecx, ebx) at +0xF6 before the aiIdle call of the resume-construction
; arm, while VC7.1's allocator moves edi. Every spelling measured (explicit
; and implicit subobject conversion at either or both aiIdle sites, qualified
; AICommandInterface::aiIdle, reference and named-local receivers, reinterpret
; and static casts, (char*)this+0x20, case reorderings, private-layout twin
; classes) leaves exactly one byte wrong: +0xF6, or its mirror +0x12B when the
; conversion sits on the repair arm instead; converting both arms flips the
; whole allocator (40 diffs from +0x1). The body is byte-identical to retail
; outside its relocation slots. Boundary: ret 4 at +0x147, INT3 from +0x14A.
; Evidence: targets/game/reverse/identity_evidence/002b9b80-masm-codegen-blocker.md
EXTERN ?j_0002191d@@YAXXZ:NEAR
EXTERN ?j_00023033@@YAXXZ:NEAR
EXTERN ?j_00024d70@@YAXXZ:NEAR
EXTERN ?j_0003251f@@YAXXZ:NEAR
EXTERN ?j_000409b2@@YAXXZ:NEAR
_TEXT SEGMENT
public ?aiDoCommand@DozerAIUpdate@@UAEXPBUAICommandParms@@@Z
?aiDoCommand@DozerAIUpdate@@UAEXPBUAICommandParms@@@Z PROC
    db 053h, 08Bh, 0D9h, 08Bh, 04Bh, 0E8h, 08Bh, 081h, 018h, 001h, 000h, 000h, 0F6h, 0C4h, 001h, 056h
    db 057h, 074h, 010h, 025h, 0FFh, 0FEh, 0FFh, 0FFh, 089h, 081h, 018h, 001h, 000h, 000h
    call ?j_0002191d@@YAXXZ
    db 08Bh, 074h, 024h, 010h, 08Bh, 043h, 0E0h, 08Dh, 07Bh, 0E0h, 056h, 08Bh, 0CFh, 0FFh, 090h, 010h
    db 002h, 000h, 000h, 084h, 0C0h, 00Fh, 084h, 006h, 001h, 000h, 000h, 08Bh, 0CFh
    call ?j_00023033@@YAXXZ
    db 08Bh, 006h, 083h, 0E8h, 013h, 00Fh, 084h, 0C5h, 000h, 000h, 000h, 048h, 00Fh, 084h, 089h, 000h
    db 000h, 000h, 083h, 0E8h, 020h, 074h, 050h, 08Bh, 046h, 004h, 085h, 0C0h, 075h, 025h, 08Bh, 093h
    db 020h, 003h, 000h, 000h, 08Dh, 0BBh, 020h, 003h, 000h, 000h, 08Bh, 0CFh, 0FFh, 052h, 024h, 083h
    db 0F8h, 0FFh, 074h, 00Fh, 055h, 08Bh, 02Fh, 08Bh, 0CFh, 0FFh, 055h, 024h, 050h, 08Bh, 0CFh, 0FFh
    db 055h, 034h, 05Dh, 056h, 08Bh, 0CBh
    call ?j_000409b2@@YAXXZ
    db 08Bh, 046h, 004h, 085h, 0C0h, 00Fh, 085h, 0A9h, 000h, 000h, 000h, 08Bh, 08Bh, 03Ch, 003h, 000h
    db 000h, 08Bh, 001h, 0FFh, 050h, 018h, 05Fh, 05Eh, 05Bh, 0C2h, 004h, 000h, 08Bh, 04Eh, 014h, 085h
    db 0C9h, 074h, 00Bh, 06Ah, 00Eh
    call ?j_0003251f@@YAXXZ
    db 084h, 0C0h, 075h, 014h, 08Bh, 093h, 020h, 003h, 000h, 000h, 08Dh, 08Bh, 020h, 003h, 000h, 000h
    db 0FFh, 052h, 024h, 083h, 0F8h, 0FFh, 075h, 072h, 056h, 08Bh, 0CBh
    call ?j_000409b2@@YAXXZ
    db 05Fh, 05Eh, 05Bh, 0C2h, 004h, 000h, 08Bh, 083h, 020h, 003h, 000h, 000h, 08Dh, 08Bh, 020h, 003h
    db 000h, 000h, 0FFh, 050h, 024h, 083h, 0F8h, 0FFh, 075h, 009h, 06Ah, 002h, 08Bh, 0CBh
    call ?j_00024d70@@YAXXZ
    db 08Bh, 046h, 004h, 08Bh, 04Eh, 014h, 08Bh, 017h, 050h, 051h, 08Bh, 0CFh, 0FFh, 092h, 0A4h, 000h
    db 000h, 000h, 05Fh, 05Eh, 05Bh, 0C2h, 004h, 000h, 08Bh, 093h, 020h, 003h, 000h, 000h, 08Dh, 08Bh
    db 020h, 003h, 000h, 000h, 0FFh, 052h, 024h, 083h, 0F8h, 0FFh, 075h, 009h, 06Ah, 002h, 08Bh, 0CBh
    call ?j_00024d70@@YAXXZ
    db 08Bh, 04Eh, 004h, 08Bh, 056h, 014h, 08Bh, 007h, 051h, 052h, 08Bh, 0CFh, 0FFh, 090h, 0A0h, 000h
    db 000h, 000h, 05Fh, 05Eh, 05Bh, 0C2h, 004h, 000h
?aiDoCommand@DozerAIUpdate@@UAEXPBUAICommandParms@@@Z ENDP
_TEXT ENDS
END
