.386
.model flat
; ?Rva006A6080@@YAXXZ
; Retail @ 0x006A6080 size 865
;
; MASM dump carrying a measured codegen blocker. Identity is not provable: no
; caller or string names the body. It is an __thiscall member of the manager
; whose mutex lives at +0x95C (ReleaseMutex/WaitForSingleObject imports, the
; scoped-mutex prologue, the +0x9D0 stream list). Its recovered C++ shape is a
; stream-budget predicate: iterate the manager's playing-stream list then the
; indexed deque cell (stride 0x28, layer + 2*index), guard an intrusive
; reference, compare the event name with AsciiString::compare and compare
; rva006990E0(event) - AIL_stream_loop_count(handle) against the threshold.
; The reconstructible C++ body (targets/game/reverse/attempts/0x006a6080.cpp)
; compiles to exactly 865 bytes with 24 relocations and shape 0.996 -- one
; structural difference -- with exactly 5 non-relocation bytes at +0x25B
; (handle argument register edx vs eax) and +0x293..+0x297 (deque node
; increment mov+add vs mov+lea). Nine fresh loop-2 spellings measured on
; 2026-10-12 (pointer cell, postfix ++, direct handle and dword28 fields,
; raw PlayingAudio pointer, continue form, reordered conditions) all land on
; the identical 5 bytes; earlier waves recorded 220+ accessor-spelling grids
; plus /Ob2 /G5 variants with no improvement. The dump body is byte-identical
; to retail outside its relocation slots.
; Evidence: targets/game/reverse/identity_evidence/006a6080-masm-codegen-blocker.md
EXTERN ?Rva006A16B0Empty@@3PADA:BYTE
EXTERN ?j_000046f6@@YAXXZ:NEAR
EXTERN ?j_000220c5@@YAXXZ:NEAR
EXTERN ?rva006990E0@@YIHHPAURva006990E0Request@@@Z:NEAR
EXTERN __imp__InterlockedDecrement@4:BYTE
EXTERN __imp__InterlockedIncrement@4:BYTE
EXTERN __imp__ReleaseMutex@4:BYTE
EXTERN __imp__WaitForSingleObject@8:BYTE
EXTERN g_Va01047F40:NEAR
EXTERN g_Va013596CC:BYTE
_TEXT SEGMENT
public ?Rva006A6080@@YAXXZ
?Rva006A6080@@YAXXZ PROC
    db 06Ah, 0FFh, 068h
    dd g_Va01047F40
    db 064h, 0A1h, 000h, 000h, 000h, 000h, 050h, 064h, 089h, 025h, 000h, 000h, 000h, 000h, 083h, 0ECh
    db 034h, 053h, 055h, 056h, 057h, 08Bh, 0D9h, 08Bh, 083h, 05Ch, 009h, 000h, 000h, 06Ah, 0FFh, 050h
    db 089h, 044h, 024h, 01Ch, 0C6h, 044h, 024h, 028h, 000h, 089h, 044h, 024h, 024h, 0FFh, 015h
    dd __imp__WaitForSingleObject@8
    db 03Dh, 002h, 001h, 000h, 000h, 074h, 005h, 0C6h, 044h, 024h, 020h, 001h, 033h, 0EDh, 089h, 06Ch
    db 024h, 04Ch, 089h, 06Ch, 024h, 010h, 08Bh, 083h, 0D0h, 009h, 000h, 000h, 08Bh, 038h, 03Bh, 0F8h
    db 0C6h, 044h, 024h, 04Ch, 001h, 00Fh, 084h, 0A6h, 000h, 000h, 000h, 08Dh, 077h, 008h, 08Dh, 044h
    db 024h, 010h, 03Bh, 0C6h, 074h, 031h, 08Bh, 006h, 085h, 0C0h, 074h, 00Ah, 083h, 0C0h, 004h, 050h
    db 0FFh, 015h
    dd __imp__InterlockedIncrement@4
    db 085h, 0EDh, 074h, 017h, 08Dh, 04Dh, 004h, 051h, 0FFh, 015h
    dd __imp__InterlockedDecrement@4
    db 085h, 0C0h, 07Fh, 009h, 08Bh, 055h, 000h, 06Ah, 001h, 08Bh, 0CDh, 0FFh, 012h, 08Bh, 02Eh, 089h
    db 06Ch, 024h, 010h, 085h, 0EDh, 074h, 058h, 08Bh, 075h, 014h, 08Bh, 046h, 008h, 08Bh, 088h, 084h
    db 000h, 000h, 000h, 085h, 0C9h, 075h, 048h, 08Bh, 044h, 024h, 05Ch, 039h, 046h, 028h, 075h, 03Fh
    db 08Bh, 04Ch, 024h, 060h, 039h, 04Eh, 064h, 075h, 036h, 08Bh, 054h, 024h, 054h, 052h, 08Dh, 04Eh
    db 014h
    call ?j_000220c5@@YAXXZ
    db 085h, 0C0h, 075h, 025h, 08Bh, 045h, 008h, 050h, 0FFh, 015h
    dd g_Va013596CC
    db 08Bh, 0D6h, 089h, 044h, 024h, 018h
    call ?rva006990E0@@YIHHPAURva006990E0Request@@@Z
    db 08Bh, 04Ch, 024h, 018h, 02Bh, 0C1h, 03Bh, 044h, 024h, 058h, 00Fh, 08Dh, 0DEh, 000h, 000h, 000h
    db 08Bh, 03Fh, 03Bh, 0BBh, 0D0h, 009h, 000h, 000h, 00Fh, 085h, 05Ah, 0FFh, 0FFh, 0FFh, 08Bh, 054h
    db 024h, 060h, 08Bh, 044h, 024h, 05Ch, 08Dh, 004h, 042h, 08Dh, 00Ch, 080h, 08Dh, 084h, 0CBh, 0D4h
    db 009h, 000h, 000h, 08Bh, 0D0h, 08Bh, 032h, 08Bh, 04Ah, 004h, 089h, 04Ch, 024h, 028h, 08Bh, 04Ah
    db 008h, 08Bh, 052h, 00Ch, 089h, 04Ch, 024h, 02Ch, 08Dh, 078h, 010h, 08Bh, 0CFh, 08Bh, 001h, 03Bh
    db 0F0h, 089h, 054h, 024h, 030h, 08Bh, 051h, 004h, 089h, 054h, 024h, 038h, 08Bh, 051h, 008h, 08Bh
    db 049h, 00Ch, 089h, 074h, 024h, 024h, 089h, 07Ch, 024h, 018h, 089h, 054h, 024h, 03Ch, 089h, 04Ch
    db 024h, 040h, 00Fh, 084h, 06Ch, 001h, 000h, 000h, 08Dh, 054h, 024h, 010h, 03Bh, 0D6h, 074h, 031h
    db 08Bh, 006h, 085h, 0C0h, 074h, 00Ah, 083h, 0C0h, 004h, 050h, 0FFh, 015h
    dd __imp__InterlockedIncrement@4
    db 085h, 0EDh, 074h, 017h, 08Dh, 045h, 004h, 050h, 0FFh, 015h
    dd __imp__InterlockedDecrement@4
    db 085h, 0C0h, 07Fh, 009h, 08Bh, 055h, 000h, 06Ah, 001h, 08Bh, 0CDh, 0FFh, 012h, 08Bh, 02Eh, 089h
    db 06Ch, 024h, 010h, 033h, 0D2h, 03Bh, 0EAh, 00Fh, 084h, 0DCh, 000h, 000h, 000h, 08Bh, 05Dh, 014h
    db 08Bh, 043h, 008h, 039h, 090h, 084h, 000h, 000h, 000h, 00Fh, 085h, 0CAh, 000h, 000h, 000h, 08Bh
    db 044h, 024h, 05Ch, 039h, 043h, 028h, 00Fh, 085h, 0BDh, 000h, 000h, 000h, 08Bh, 04Ch, 024h, 054h
    db 08Bh, 001h, 03Bh, 0C2h, 074h, 042h, 00Fh, 0B7h, 048h, 004h, 089h, 04Ch, 024h, 060h, 0EBh, 03Eh
    db 08Dh, 04Ch, 024h, 010h, 0C6h, 044h, 024h, 04Ch, 000h
    call ?j_000046f6@@YAXXZ
    db 08Ah, 044h, 024h, 020h, 084h, 0C0h, 074h, 00Bh, 08Bh, 04Ch, 024h, 014h, 051h, 0FFh, 015h
    dd __imp__ReleaseMutex@4
    db 05Fh, 05Eh, 05Dh, 0B0h, 001h, 05Bh, 08Bh, 04Ch, 024h, 034h, 064h, 089h, 00Dh, 000h, 000h, 000h
    db 000h, 083h, 0C4h, 040h, 0C2h, 010h, 000h, 089h, 054h, 024h, 060h, 08Bh, 0CAh, 03Bh, 0C2h, 08Dh
    db 078h, 008h, 075h, 005h, 0BFh
    dd ?Rva006A16B0Empty@@3PADA
    db 08Bh, 043h, 014h, 03Bh, 0C2h, 074h, 004h, 00Fh, 0B7h, 050h, 004h, 085h, 0C0h, 08Dh, 070h, 008h
    db 075h, 005h, 0BEh
    dd ?Rva006A16B0Empty@@3PADA
    db 03Bh, 0D1h, 07Dh, 002h, 08Bh, 0CAh, 033h, 0C0h, 0F3h, 0A6h, 074h, 005h, 01Bh, 0C0h, 083h, 0D8h
    db 0FFh, 085h, 0C0h, 075h, 02Bh, 02Bh, 054h, 024h, 060h, 08Bh, 0C2h, 085h, 0C0h, 075h, 021h, 08Bh
    db 055h, 008h, 052h, 0FFh, 015h
    dd g_Va013596CC
    db 08Bh, 0D3h, 08Bh, 0F0h
    call ?rva006990E0@@YIHHPAURva006990E0Request@@@Z
    db 08Bh, 04Ch, 024h, 058h, 02Bh, 0C6h, 03Bh, 0C1h, 00Fh, 08Dh, 09Fh, 000h, 000h, 000h, 08Bh, 07Ch
    db 024h, 018h, 08Bh, 074h, 024h, 024h, 08Bh, 044h, 024h, 02Ch, 083h, 0C6h, 004h, 03Bh, 0F0h, 089h
    db 074h, 024h, 024h, 075h, 01Dh, 08Bh, 044h, 024h, 030h, 083h, 0C0h, 004h, 089h, 044h, 024h, 030h
    db 08Bh, 000h, 08Dh, 088h, 080h, 000h, 000h, 000h, 089h, 04Ch, 024h, 02Ch, 089h, 044h, 024h, 024h
    db 08Bh, 0F0h, 08Bh, 0D7h, 08Bh, 002h, 03Bh, 0F0h, 08Bh, 04Ah, 004h, 089h, 04Ch, 024h, 038h, 08Bh
    db 04Ah, 008h, 08Bh, 052h, 00Ch, 089h, 04Ch, 024h, 03Ch, 089h, 054h, 024h, 040h, 00Fh, 085h, 094h
    db 0FEh, 0FFh, 0FFh, 085h, 0EDh, 0C6h, 044h, 024h, 04Ch, 000h, 074h, 017h, 08Dh, 04Dh, 004h, 051h
    db 0FFh, 015h
    dd __imp__InterlockedDecrement@4
    db 085h, 0C0h, 07Fh, 009h, 08Bh, 055h, 000h, 06Ah, 001h, 08Bh, 0CDh, 0FFh, 012h, 08Ah, 044h, 024h
    db 020h, 084h, 0C0h, 074h, 00Bh, 08Bh, 044h, 024h, 014h, 050h, 0FFh, 015h
    dd __imp__ReleaseMutex@4
    db 05Fh, 05Eh, 05Dh, 032h, 0C0h, 05Bh, 08Bh, 04Ch, 024h, 034h, 064h, 089h, 00Dh, 000h, 000h, 000h
    db 000h, 083h, 0C4h, 040h, 0C2h, 010h, 000h, 08Dh, 045h, 004h, 050h, 0C6h, 044h, 024h, 050h, 000h
    db 0FFh, 015h
    dd __imp__InterlockedDecrement@4
    db 085h, 0C0h, 07Fh, 009h, 08Bh, 055h, 000h, 06Ah, 001h, 08Bh, 0CDh, 0FFh, 012h, 08Ah, 044h, 024h
    db 020h, 084h, 0C0h, 074h, 00Bh, 08Bh, 044h, 024h, 014h, 050h, 0FFh, 015h
    dd __imp__ReleaseMutex@4
    db 08Bh, 04Ch, 024h, 044h, 05Fh, 05Eh, 05Dh, 0B0h, 001h, 05Bh, 064h, 089h, 00Dh, 000h, 000h, 000h
    db 000h, 083h, 0C4h, 040h, 0C2h, 010h, 000h
?Rva006A6080@@YAXXZ ENDP
_TEXT ENDS
END
