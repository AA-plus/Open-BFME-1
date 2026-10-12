.386
.model flat
; MASM dump carrying a measured VC7.1 codegen blocker. The body is the
; vector-insert helper a call from ?insert@Rva00894120Vector@@... at
; 0x00894120 names (address-derived ?helper@Rva00894120Vector@@QAEXPAX00@Z):
; 12 argument bytes on the stack and `ret 0Ch` prove the ABI here; the ILT
; oracle is UNTESTABLE for the name (no ILT slot), so this row keeps the
; placeholder name.
; The reconstructible C++ body (targets/game/reverse/attempts/0x00893f10.cpp)
; compiles to 457 bytes with 20 relocations and shape 1.000; the whole
; residue is one register-allocation tie-break in the recursive tail call.
; Retail reloads the incoming last-argument slot into EDX, materializes the
; insert temp address in ECX, pushes ECX, then pushes EDX
; (mov edx,[esp+30h]; lea ecx,[esp+34h]; push ecx; ... push edx); VC7.1
; emits the mirrored assignment over four non-relocation bytes at +0x197,
; +0x19E, +0x1A2, +0x1AB. Both webs are single-use and ECX/EDX are the last
; two free registers; naming the address temp instead only moves the residue
; to a second mirrored class (+0x197/+0x1A7 exchanging [esp+2Ch]/[esp+30h]).
; 250+ spellings across several sessions (ref/const/volatile/register
; qualifiers; scoped blocks; named address and item locals; definition-order
; swaps; decoy locals; casts; this->; inline cdecl/fastcall recursive
; wrappers; inline size()/begin() accessors that reallocate the body) never
; flip it.
; Evidence: targets/game/reverse/identity_evidence/00893f10-masm-codegen-blocker.md
EXTERN g_Va01056ED0:NEAR
EXTERN ?Rva008926D0CopyItems@@YAPAURva00892640Item@@PAU1@00@Z:NEAR
EXTERN ?Rva012D5298Empty@@3URva00893410Block@@A:BYTE
EXTERN ?bfmeGo1045G@BfmeG1045@@QAEPAV1@PAV1@@Z:NEAR
EXTERN ?Rva00892ED0ReleaseTable@@3PAP6AXPAX@ZA:BYTE
EXTERN ?Rva00892730CopyItems@@YAPAURva00892640Item@@PAU1@00@Z:NEAR
EXTERN __ftol2:NEAR
EXTERN ?resize@Gen_uw_00893e70@@QAEXH@Z:NEAR
_TEXT SEGMENT
; retail VA 0x00C93F10 size 457
public ?Rva00893F10@@YAXXZ
?Rva00893F10@@YAXXZ PROC
    db 06Ah, 0FFh, 068h
    dd g_Va01056ED0
    db 064h, 0A1h, 000h, 000h, 000h, 000h, 050h, 064h, 089h, 025h, 000h, 000h, 000h, 000h, 083h, 0ECh
    db 00Ch, 08Bh, 044h, 024h, 020h, 055h, 08Bh, 028h, 056h, 08Bh, 0F1h, 08Bh, 04Ch, 024h, 024h, 08Bh
    db 009h, 08Bh, 0C5h, 02Bh, 0C1h, 0C1h, 0F8h, 003h, 085h, 0C0h, 089h, 04Ch, 024h, 008h, 00Fh, 084h
    db 07Bh, 001h, 000h, 000h, 08Bh, 016h, 08Bh, 04Eh, 004h, 053h, 08Dh, 01Ch, 002h, 03Bh, 0D9h, 057h
    db 089h, 04Ch, 024h, 014h, 00Fh, 08Dh, 01Ch, 001h, 000h, 000h, 08Bh, 04Eh, 008h, 08Dh, 03Ch, 0D1h
    db 08Bh, 054h, 024h, 034h, 08Bh, 012h, 03Bh, 0D7h, 075h, 073h, 08Bh, 044h, 024h, 010h, 057h, 055h
    db 050h
    call ?Rva008926D0CopyItems@@YAPAURva00892640Item@@PAU1@00@Z
    db 033h, 0FFh, 083h, 0C4h, 00Ch, 066h, 0FFh, 005h
    dd ?Rva012D5298Empty@@3URva00893410Block@@A
    db 0C7h, 044h, 024h, 014h
    dd ?Rva012D5298Empty@@3URva00893410Block@@A
    db 089h, 07Ch, 024h, 018h, 08Bh, 056h, 008h, 08Dh, 04Ch, 024h, 014h, 051h, 08Dh, 00Ch, 0DAh, 089h
    db 07Ch, 024h, 028h
    call ?bfmeGo1045G@BfmeG1045@@QAEPAV1@PAV1@@Z
    db 08Bh, 044h, 024h, 014h, 066h, 0FFh, 008h, 066h, 039h, 038h, 0C7h, 044h, 024h, 024h, 0FFh, 0FFh
    db 0FFh, 0FFh, 00Fh, 085h, 0A5h, 000h, 000h, 000h, 050h, 0A1h
    dd ?Rva00892ED0ReleaseTable@@3PAP6AXPAX@ZA
    db 0FFh, 050h, 004h, 083h, 0C4h, 004h, 05Fh, 089h, 01Eh, 05Bh, 05Eh, 05Dh, 08Bh, 04Ch, 024h, 00Ch
    db 064h, 089h, 00Dh, 000h, 000h, 000h, 000h, 083h, 0C4h, 018h, 0C2h, 00Ch, 000h, 08Bh, 0EAh, 02Bh
    db 0E9h, 0C1h, 0FDh, 003h, 003h, 0E8h, 08Dh, 00Ch, 0E9h, 051h, 057h, 052h
    call ?Rva00892730CopyItems@@YAPAURva00892640Item@@PAU1@00@Z
    db 08Bh, 054h, 024h, 040h, 08Bh, 002h, 08Bh, 04Ch, 024h, 03Ch, 08Bh, 011h, 050h, 08Bh, 044h, 024h
    db 03Ch, 08Bh, 008h, 052h, 051h
    call ?Rva008926D0CopyItems@@YAPAURva00892640Item@@PAU1@00@Z
    db 083h, 0C4h, 018h, 066h, 0FFh, 005h
    dd ?Rva012D5298Empty@@3URva00893410Block@@A
    db 0C7h, 044h, 024h, 014h
    dd ?Rva012D5298Empty@@3URva00893410Block@@A
    db 0C7h, 044h, 024h, 018h, 000h, 000h, 000h, 000h, 08Bh, 046h, 008h, 08Dh, 054h, 024h, 014h, 052h
    db 08Dh, 00Ch, 0D8h, 0C7h, 044h, 024h, 028h, 001h, 000h, 000h, 000h
    call ?bfmeGo1045G@BfmeG1045@@QAEPAV1@PAV1@@Z
    db 08Bh, 044h, 024h, 014h, 066h, 0FFh, 008h, 066h, 083h, 038h, 000h, 0C7h, 044h, 024h, 024h, 0FFh
    db 0FFh, 0FFh, 0FFh, 075h, 00Dh, 08Bh, 00Dh
    dd ?Rva00892ED0ReleaseTable@@3PAP6AXPAX@ZA
    db 050h, 0FFh, 051h, 004h, 083h, 0C4h, 004h, 05Fh, 089h, 01Eh, 05Bh, 05Eh, 05Dh, 08Bh, 04Ch, 024h
    db 00Ch, 064h, 089h, 00Dh, 000h, 000h, 000h, 000h, 083h, 0C4h, 018h, 0C2h, 00Ch, 000h, 0DBh, 044h
    db 024h, 014h, 0DCh, 0C0h
    call __ftol2
    db 03Bh, 0C3h, 07Dh, 002h, 08Bh, 0C3h, 08Bh, 054h, 024h, 034h, 08Bh, 04Eh, 008h, 08Bh, 03Ah, 02Bh
    db 0F9h, 050h, 08Bh, 0CEh, 0C1h, 0FFh, 003h
    call ?resize@Gen_uw_00893e70@@QAEXH@Z
    db 08Bh, 046h, 008h, 08Bh, 054h, 024h, 030h, 08Dh, 004h, 0F8h, 08Dh, 04Ch, 024h, 034h, 051h, 089h
    db 044h, 024h, 038h, 08Bh, 044h, 024h, 030h, 052h, 050h, 08Bh, 0CEh, 0E8h, 04Ch, 0FEh, 0FFh, 0FFh
    db 05Fh, 05Bh, 08Bh, 04Ch, 024h, 014h, 05Eh, 05Dh, 064h, 089h, 00Dh, 000h, 000h, 000h, 000h, 083h
    db 0C4h, 018h, 0C2h, 00Ch, 000h
?Rva00893F10@@YAXXZ ENDP
_TEXT ENDS
END
