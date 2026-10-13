.386
.model flat
; ?WOLGameSetupMenuInit@@YAXPAVWindowLayout@@PAX@Z
; Retail @ 0x004F52C0 size 2101
;
; MASM dump carrying a measured VC7.1 codegen blocker. Identity is proven:
; Zero Hour's WOLGameSetupMenu.cpp carries the same
; `void WOLGameSetupMenuInit( WindowLayout *, void * )` and the same
; game-in-progress / host-client / lobby-list flow, the unique FunctionLexicon
; entry names it, and the matching retail calls and strings (GameSpy overlay,
; AsciiString .format sites) agree; retail returns at +0x834 and INT3 padding
; follows, confirming the 2,101-byte extent (Ghidra bounds-high agrees).
; ABI: __cdecl, two stack arguments, result unused.
;
; The reconstructible C++ body (targets/game/reverse/attempts/0x004f52c0.cpp,
; bank score 0.9933) compiles to exactly 2,101 bytes with 162 relocations; its
; whole residue is fourteen non-relocation bytes, all EH state-store
; immediates in the client cleanup block. Retail numbers the host cleanup
; states 6-8 and the client cleanup states 9-14; the bank numbers the client
; regions first (exact +6 mod 9 rotation over the 9-state window). Host-first
; switch/if spellings restore the retail state numbering exactly but then swap
; the two live registers (hostSlot EDI / loop counter ESI) in 17 bytes, so the
; two residues are mutually exclusive; _STLP_NO_EXCEPTIONS and nothrow
; operator delete[] are flat. The apparent global accesses at +0x662..+0x692
; are relocation artifacts. The dump body is byte-identical to retail outside
; its relocation slots.
; Evidence: targets/game/reverse/identity_evidence/004f52c0-masm-codegen-blocker.md

EXTERN ??0?$StringBase@D@@AAE@ABV0@@Z:NEAR
EXTERN ??0?$StringBase@D@@AAE@PBD@Z:NEAR
EXTERN ??0?$StringBase@G@@AAE@ABV0@@Z:NEAR
EXTERN ?BFMEEmptyPlayerName@@3VUnicodeString@@B:BYTE
EXTERN ?Control0040F780@@3PAUMovieControl0040F780@@A:BYTE
EXTERN ?Rva006A16B0Empty@@3PADA:BYTE
EXTERN ?Rva012F7194@@3PAVRva012F7194Slots@@A:BYTE
EXTERN ?TheGameSpyGame@@3PAVBfmeEstablishGameSpyGame@@A:BYTE
EXTERN ?TheGameSpyPeerMessageQueue@@3PAVGameSpyPeerMessageQueueInterface@@A:BYTE
EXTERN ?TheGameText@@3PAVBfmeGameText@@A:BYTE
EXTERN ?TheMapCache@@3PAVMapCache@@A:BYTE
EXTERN ?TheNAT@@3PAVNAT@@A:BYTE
EXTERN ?TheShell@@3PAVBfmeShell@@A:BYTE
EXTERN ?TheTransitionHandler@@3PAURva005A00B0Transition@@A:BYTE
EXTERN ?enterTime@@3IA:BYTE
EXTERN ?format@AsciiString@@QAAXV1@ZZ:NEAR
EXTERN ?forward@CustomMatchPreferencesCtorThunk@@QAEXXZ:NEAR
EXTERN ?g_bfmeState02VJ@@3HA:BYTE
EXTERN ?g_bfmeState03VJ@@3HA:BYTE
EXTERN ?g_bfmeState05VJ@@3HA:BYTE
EXTERN ?g_bfmeState06VJ@@3HA:BYTE
EXTERN ?g_bfmeState09VJ@@3HA:BYTE
EXTERN ?g_bfmeState11VJ@@3HA:BYTE
EXTERN ?g_bfmeState12VJ@@3HA:BYTE
EXTERN ?g_bfmeState13VJ@@3HA:BYTE
EXTERN ?g_bfmeState15VJ@@3HA:BYTE
EXTERN ?initialAcceptEnable@@3_NA:BYTE
EXTERN ?j_00001307@@YAXXZ:NEAR
EXTERN ?j_00004557@@YAXXZ:NEAR
EXTERN ?j_000061d6@@YAXXZ:NEAR
EXTERN ?j_00006942@@YAXXZ:NEAR
EXTERN ?j_0000a3df@@YAXXZ:NEAR
EXTERN ?j_0000bebf@@YAXXZ:NEAR
EXTERN ?j_0000e3cc@@YAXXZ:NEAR
EXTERN ?j_0000f5ab@@YAXXZ:NEAR
EXTERN ?j_0000f6d2@@YAXXZ:NEAR
EXTERN ?j_00016bd5@@YAXXZ:NEAR
EXTERN ?j_000171fc@@YAXXZ:NEAR
EXTERN ?j_00018f0c@@YAXXZ:NEAR
EXTERN ?j_0001983f@@YAXXZ:NEAR
EXTERN ?j_0001b34c@@YAXXZ:NEAR
EXTERN ?j_0001b5db@@YAXXZ:NEAR
EXTERN ?j_00022124@@YAXXZ:NEAR
EXTERN ?j_00025e32@@YAXXZ:NEAR
EXTERN ?j_000263d7@@YAXXZ:NEAR
EXTERN ?j_0002b297@@YAXXZ:NEAR
EXTERN ?j_0002bbe8@@YAXXZ:NEAR
EXTERN ?j_0002caca@@YAXXZ:NEAR
EXTERN ?j_0002ec9e@@YAXXZ:NEAR
EXTERN ?j_000339a6@@YAXXZ:NEAR
EXTERN ?j_000345ef@@YAXXZ:NEAR
EXTERN ?j_0003713C@@YAXXZ:NEAR
EXTERN ?j_0003a20b@@YAXXZ:NEAR
EXTERN ?j_00040dfe@@YAXXZ:NEAR
EXTERN ?j_00041f6a@@YAXXZ:NEAR
EXTERN ?j_00045bc4@@YAXXZ:NEAR
EXTERN ?j_00045c28@@YAXXZ:NEAR
EXTERN ?j_00045ee9@@YAXXZ:NEAR
EXTERN ?j_00049c33@@YAXXZ:NEAR
EXTERN ?j_0004a1fb@@YAXXZ:NEAR
EXTERN ?lastSlotlistTime@@3IA:BYTE
EXTERN ?releaseBuffer@?$StringBase@D@@AAEXXZ:NEAR
EXTERN ?releaseBuffer@?$StringBase@G@@AAEXXZ:NEAR
EXTERN ?set@?$StringBase@G@@QAEXABV1@@Z:NEAR
EXTERN ?toLower@?$StringBase@D@@QAEXXZ:NEAR
EXTERN ?translate@AsciiString@@QAEXABVUnicodeString@@@Z:NEAR
EXTERN __imp__timeGetTime@0:BYTE
EXTERN g_Va0102CA30:NEAR
EXTERN g_Va010FF16C:BYTE
EXTERN g_Va010FF5DC:BYTE
EXTERN g_Va010FF5F4:BYTE
EXTERN g_Va0110267C:BYTE
EXTERN g_Va0110276C:BYTE
EXTERN g_Va0110278C:BYTE
EXTERN g_Va01102D30:BYTE
EXTERN g_Va01102D34:BYTE
EXTERN g_Va01102D78:BYTE
EXTERN g_Va01102D84:BYTE
EXTERN g_Va01102D8C:BYTE
EXTERN g_Va012F42C0:BYTE
EXTERN g_Va012F42C1:BYTE
EXTERN g_Va012F42C4:BYTE
EXTERN g_Va012F42C8:BYTE
EXTERN g_Va012F42C9:BYTE
EXTERN g_Va012F4528:BYTE
_TEXT SEGMENT
public ?WOLGameSetupMenuInit@@YAXPAVWindowLayout@@PAX@Z
?WOLGameSetupMenuInit@@YAXPAVWindowLayout@@PAX@Z PROC
    db 064h, 0A1h, 000h, 000h, 000h, 000h, 06Ah, 0FFh, 068h
    dd g_Va0102CA30
    db 050h, 0A1h
    dd ?TheGameSpyGame@@3PAVBfmeEstablishGameSpyGame@@A
    db 064h, 089h, 025h, 000h, 000h, 000h, 000h, 081h, 0ECh, 0DCh, 001h, 000h, 000h, 053h, 055h, 033h
    db 0DBh, 03Bh, 0C3h, 056h, 057h, 00Fh, 084h, 0BCh, 001h, 000h, 000h, 038h, 058h, 00Dh, 00Fh, 084h
    db 0B3h, 001h, 000h, 000h, 088h, 058h, 00Dh, 08Bh, 00Dh
    dd ?Rva012F7194@@3PAVRva012F7194Slots@@A
    db 08Bh, 001h, 08Dh, 054h, 024h, 028h, 052h, 0FFh, 090h, 058h, 001h, 000h, 000h, 084h, 0C0h, 00Fh
    db 084h, 04Ch, 001h, 000h, 000h, 089h, 05Ch, 024h, 014h, 08Bh, 044h, 024h, 028h, 050h, 051h, 089h
    db 064h, 024h, 024h, 08Bh, 0CCh, 068h
    dd g_Va01102D8C
    db 089h, 09Ch, 024h, 000h, 002h, 000h, 000h
    call ??0?$StringBase@D@@AAE@PBD@Z
    db 08Dh, 04Ch, 024h, 01Ch, 051h
    call ?format@AsciiString@@QAAXV1@ZZ
    db 083h, 0C4h, 00Ch, 089h, 05Ch, 024h, 020h, 089h, 05Ch, 024h, 010h, 08Bh, 00Dh
    dd ?TheGameText@@3PAVBfmeGameText@@A
    db 08Bh, 011h, 053h, 068h
    dd g_Va0110267C
    db 08Dh, 044h, 024h, 024h, 050h, 0C6h, 084h, 024h, 000h, 002h, 000h, 000h, 002h, 0FFh, 052h, 028h
    db 050h, 08Dh, 04Ch, 024h, 024h, 0C6h, 084h, 024h, 0F8h, 001h, 000h, 000h, 003h
    call ?set@?$StringBase@G@@QAEXABV1@@Z
    db 08Dh, 04Ch, 024h, 01Ch, 0C6h, 084h, 024h, 0F4h, 001h, 000h, 000h, 002h
    call ?releaseBuffer@?$StringBase@G@@AAEXXZ
    db 053h, 051h, 08Dh, 054h, 024h, 01Ch, 089h, 064h, 024h, 024h, 08Bh, 0CCh, 052h
    call ??0?$StringBase@D@@AAE@ABV0@@Z
    db 08Bh, 00Dh
    dd ?TheGameText@@3PAVBfmeGameText@@A
    db 08Bh, 001h, 08Dh, 054h, 024h, 024h, 052h, 0FFh, 050h, 024h, 050h, 08Dh, 04Ch, 024h, 014h, 0C6h
    db 084h, 024h, 0F8h, 001h, 000h, 000h, 004h
    call ?set@?$StringBase@G@@QAEXABV1@@Z
    db 08Dh, 04Ch, 024h, 01Ch, 0C6h, 084h, 024h, 0F4h, 001h, 000h, 000h, 002h
    call ?releaseBuffer@?$StringBase@G@@AAEXXZ
    call ?j_0000f5ab@@YAXXZ
    db 053h, 051h, 08Dh, 044h, 024h, 018h, 089h, 064h, 024h, 024h, 08Bh, 0CCh, 050h
    call ??0?$StringBase@G@@AAE@ABV0@@Z
    db 051h, 08Dh, 054h, 024h, 02Ch, 089h, 064h, 024h, 024h, 08Bh, 0CCh, 052h, 0C6h, 084h, 024h, 004h
    db 002h, 000h, 000h, 005h
    call ??0?$StringBase@G@@AAE@ABV0@@Z
    db 0C6h, 084h, 024h, 000h, 002h, 000h, 000h, 002h
    call ?j_0002bbe8@@YAXXZ
    db 08Bh, 00Dh
    dd ?Rva012F7194@@3PAVRva012F7194Slots@@A
    db 08Bh, 001h, 083h, 0C4h, 00Ch, 0FFh, 050h, 004h, 08Bh, 00Dh
    dd ?TheShell@@3PAVBfmeShell@@A
    call ?j_00045ee9@@YAXXZ
    db 08Dh, 04Ch, 024h, 010h, 0C6h, 084h, 024h, 0F4h, 001h, 000h, 000h, 001h
    call ?releaseBuffer@?$StringBase@G@@AAEXXZ
    db 08Dh, 04Ch, 024h, 020h, 088h, 09Ch, 024h, 0F4h, 001h, 000h, 000h
    call ?releaseBuffer@?$StringBase@G@@AAEXXZ
    db 08Dh, 04Ch, 024h, 014h, 0C7h, 084h, 024h, 0F4h, 001h, 000h, 000h, 0FFh, 0FFh, 0FFh, 0FFh
    call ?releaseBuffer@?$StringBase@D@@AAEXXZ
    db 0E9h, 07Bh, 006h, 000h, 000h, 08Bh, 00Dh
    dd ?TheShell@@3PAVBfmeShell@@A
    call ?j_00045ee9@@YAXXZ
    db 08Bh, 00Dh
    dd ?TheGameSpyPeerMessageQueue@@3PAVGameSpyPeerMessageQueueInterface@@A
    db 03Bh, 0CBh, 00Fh, 084h, 062h, 006h, 000h, 000h, 08Bh, 011h, 0FFh, 052h, 010h, 084h, 0C0h, 00Fh
    db 084h, 055h, 006h, 000h, 000h, 06Ah, 001h, 051h, 089h, 064h, 024h, 020h, 08Bh, 0CCh, 068h
    dd g_Va0110276C
    call ??0?$StringBase@D@@AAE@PBD@Z
    db 08Bh, 00Dh
    dd ?TheShell@@3PAVBfmeShell@@A
    call ?j_000339a6@@YAXXZ
    db 0E9h, 032h, 006h, 000h, 000h, 08Bh, 00Dh
    dd ?Rva012F7194@@3PAVRva012F7194Slots@@A
    db 08Bh, 001h, 053h, 0FFh, 050h, 028h, 08Bh, 00Dh
    dd ?TheNAT@@3PAVNAT@@A
    db 03Bh, 0CBh, 074h, 00Ch, 08Bh, 011h, 06Ah, 001h, 0FFh, 012h, 089h, 01Dh
    dd ?TheNAT@@3PAVNAT@@A
    db 053h, 089h, 01Dh
    dd g_Va012F42C4
    db 088h, 01Dh
    dd g_Va012F42C1
    db 088h, 01Dh
    dd g_Va012F42C0
    db 088h, 01Dh
    dd g_Va012F42C9
    call ?j_000345ef@@YAXXZ
    call ?j_00025e32@@YAXXZ
    db 06Ah, 001h
    call ?j_000345ef@@YAXXZ
    db 08Bh, 00Dh
    dd ?Rva012F7194@@3PAVRva012F7194Slots@@A
    db 08Bh, 015h
    dd ?g_bfmeState05VJ@@3HA
    db 08Bh, 001h, 083h, 0C4h, 008h, 052h, 0FFh, 090h, 0E4h, 000h, 000h, 000h, 08Bh, 00Dh
    dd ?TheMapCache@@3PAVMapCache@@A
    call ?j_00018f0c@@YAXXZ
    db 08Bh, 00Dh
    dd ?Rva012F7194@@3PAVRva012F7194Slots@@A
    db 08Bh, 001h, 0FFh, 090h, 0C4h, 000h, 000h, 000h, 08Bh, 0E8h, 053h, 08Bh, 0CDh
    call ?j_000061d6@@YAXXZ
    db 08Bh, 0F8h, 0C6h, 047h, 008h, 001h, 08Bh, 00Dh
    dd ?Rva012F7194@@3PAVRva012F7194Slots@@A
    db 08Bh, 011h, 0FFh, 092h, 0C0h, 000h, 000h, 000h, 084h, 0C0h, 08Dh, 04Ch, 024h, 044h, 00Fh, 084h
    db 055h, 001h, 000h, 000h
    call ?j_0003713C@@YAXXZ
    db 08Dh, 04Ch, 024h, 030h, 0C7h, 084h, 024h, 0F4h, 001h, 000h, 000h, 006h, 000h, 000h, 000h
    call ?forward@CustomMatchPreferencesCtorThunk@@QAEXXZ
    db 08Dh, 04Ch, 024h, 030h, 0C6h, 084h, 024h, 0F4h, 001h, 000h, 000h, 007h
    call ?j_0002caca@@YAXXZ
    db 08Dh, 04Ch, 024h, 030h, 089h, 047h, 00Ch
    call ?j_0000bebf@@YAXXZ
    db 083h, 0F8h, 0FEh, 089h, 047h, 014h, 07Fh, 007h, 0C7h, 047h, 010h, 0FFh, 0FFh, 0FFh, 0FFh, 08Dh
    db 04Ch, 024h, 044h
    call ?j_0000f6d2@@YAXXZ
    db 089h, 047h, 038h, 08Bh, 00Dh
    dd ?Rva012F7194@@3PAVRva012F7194Slots@@A
    db 08Bh, 001h, 0FFh, 090h, 014h, 001h, 000h, 000h, 051h, 089h, 064h, 024h, 01Ch, 08Bh, 0CCh, 050h
    call ??0?$StringBase@D@@AAE@ABV0@@Z
    db 08Bh, 0CFh
    call ?j_0000e3cc@@YAXXZ
    db 051h, 08Bh, 0CCh, 089h, 064h, 024h, 01Ch, 051h, 08Dh, 04Ch, 024h, 038h
    call ?j_00004557@@YAXXZ
    db 08Bh, 0CDh
    call ?j_0001b5db@@YAXXZ
    db 0BEh, 001h, 000h, 000h, 000h, 056h, 08Bh, 0CDh
    call ?j_000061d6@@YAXXZ
    db 08Dh, 054h, 024h, 028h, 052h, 051h, 089h, 064h, 024h, 020h, 08Bh, 0CCh, 068h
    dd ?BFMEEmptyPlayerName@@3VUnicodeString@@B
    db 089h, 044h, 024h, 028h, 089h, 05Ch, 024h, 034h, 066h, 089h, 05Ch, 024h, 038h
    call ??0?$StringBase@G@@AAE@ABV0@@Z
    db 08Bh, 04Ch, 024h, 024h, 053h
    call ?j_0002ec9e@@YAXXZ
    db 046h, 083h, 0FEh, 008h, 07Ch, 0C5h, 08Dh, 044h, 024h, 014h, 050h, 08Dh, 04Ch, 024h, 034h
    call ?j_00004557@@YAXXZ
    db 08Dh, 04Ch, 024h, 014h, 0C6h, 084h, 024h, 0F4h, 001h, 000h, 000h, 008h
    call ?toLower@?$StringBase@D@@QAEXXZ
    db 08Dh, 04Ch, 024h, 014h, 051h, 08Bh, 00Dh
    dd ?TheMapCache@@3PAVMapCache@@A
    call ?j_000263d7@@YAXXZ
    db 08Bh, 015h
    dd ?TheMapCache@@3PAVMapCache@@A
    db 08Bh, 0F0h, 03Bh, 032h, 074h, 027h, 06Ah, 001h, 08Bh, 0CFh
    call ?j_00045bc4@@YAXXZ
    db 08Bh, 046h, 040h, 050h, 08Bh, 0CDh
    call ?j_00040dfe@@YAXXZ
    db 08Bh, 04Eh, 03Ch, 051h, 08Bh, 0CDh
    call ?j_0001b34c@@YAXXZ
    db 08Bh, 055h, 000h, 08Bh, 0CDh, 0FFh, 052h, 020h
    call ?j_00006942@@YAXXZ
    call ?j_00022124@@YAXXZ
    db 08Dh, 04Ch, 024h, 014h, 0C6h, 084h, 024h, 0F4h, 001h, 000h, 000h, 007h
    call ?releaseBuffer@?$StringBase@D@@AAEXXZ
    db 0C6h, 084h, 024h, 0F4h, 001h, 000h, 000h, 006h, 0E9h, 04Eh, 003h, 000h, 000h
    call ?j_0003713C@@YAXXZ
    db 08Dh, 04Ch, 024h, 030h, 0C7h, 084h, 024h, 0F4h, 001h, 000h, 000h, 009h, 000h, 000h, 000h
    call ?forward@CustomMatchPreferencesCtorThunk@@QAEXXZ
    db 089h, 05Ch, 024h, 010h, 08Dh, 04Ch, 024h, 058h, 0C6h, 084h, 024h, 0F4h, 001h, 000h, 000h, 00Bh
    call ?j_000171fc@@YAXXZ
    db 08Dh, 044h, 024h, 020h, 050h, 08Bh, 0CFh, 0C6h, 084h, 024h, 0F8h, 001h, 000h, 000h, 00Ch
    call ?j_0003a20b@@YAXXZ
    db 089h, 05Ch, 024h, 014h, 08Dh, 04Ch, 024h, 020h, 051h, 08Dh, 04Ch, 024h, 018h, 0C6h, 084h, 024h
    db 0F8h, 001h, 000h, 000h, 00Eh
    call ?translate@AsciiString@@QAEXABVUnicodeString@@@Z
    db 068h
    dd g_Va01102D34
    db 068h
    dd g_Va01102D30
    db 08Dh, 08Ch, 024h, 094h, 000h, 000h, 000h, 0C7h, 044h, 024h, 060h, 00Dh, 000h, 000h, 000h, 0C6h
    db 084h, 024h, 044h, 001h, 000h, 000h, 001h
    call ?j_0002b297@@YAXXZ
    db 08Bh, 044h, 024h, 014h, 03Bh, 0C3h, 08Dh, 070h, 008h, 075h, 005h, 0BEh
    dd ?Rva006A16B0Empty@@3PADA
    db 08Bh, 0C6h, 08Dh, 050h, 001h, 08Dh, 049h, 000h, 08Ah, 008h, 040h, 03Ah, 0CBh, 075h, 0F9h, 02Bh
    db 0C2h, 003h, 0C6h, 050h, 056h, 08Dh, 04Ch, 024h, 064h
    call ?j_0002b297@@YAXXZ
    db 08Dh, 04Ch, 024h, 030h
    call ?j_0000bebf@@YAXXZ
    db 050h, 051h, 089h, 064h, 024h, 020h, 08Bh, 0CCh, 068h
    dd g_Va010FF5DC
    call ??0?$StringBase@D@@AAE@PBD@Z
    db 08Dh, 054h, 024h, 018h, 052h
    call ?format@AsciiString@@QAAXV1@ZZ
    db 08Bh, 044h, 024h, 01Ch, 083h, 0C4h, 00Ch, 03Bh, 0C3h, 08Dh, 070h, 008h, 075h, 005h, 0BEh
    dd ?Rva006A16B0Empty@@3PADA
    db 08Bh, 0C6h, 08Dh, 050h, 001h, 08Ah, 008h, 040h, 03Ah, 0CBh, 075h, 0F9h, 02Bh, 0C2h, 003h, 0C6h
    db 050h, 056h, 08Dh, 08Ch, 024h, 0A0h, 000h, 000h, 000h
    call ?j_0002b297@@YAXXZ
    db 08Bh, 00Dh
    dd ?TheGameSpyPeerMessageQueue@@3PAVGameSpyPeerMessageQueueInterface@@A
    db 08Bh, 001h, 08Dh, 054h, 024h, 058h, 052h, 0FFh, 050h, 018h, 08Dh, 04Ch, 024h, 030h
    call ?j_0002caca@@YAXXZ
    db 050h, 051h, 089h, 064h, 024h, 020h, 08Bh, 0CCh, 068h
    dd g_Va010FF16C
    call ??0?$StringBase@D@@AAE@PBD@Z
    db 08Dh, 044h, 024h, 018h, 050h
    call ?format@AsciiString@@QAAXV1@ZZ
    db 08Bh, 044h, 024h, 01Ch, 083h, 0C4h, 00Ch, 03Bh, 0C3h, 08Dh, 070h, 008h, 075h, 005h, 0BEh
    dd ?Rva006A16B0Empty@@3PADA
    db 08Bh, 0C6h, 08Dh, 050h, 001h, 08Dh, 0A4h, 024h, 000h, 000h, 000h, 000h, 08Ah, 008h, 040h, 03Ah
    db 0CBh, 075h, 0F9h, 02Bh, 0C2h, 003h, 0C6h, 050h, 056h, 08Dh, 08Ch, 024h, 0A0h, 000h, 000h, 000h
    call ?j_0002b297@@YAXXZ
    db 08Bh, 00Dh
    dd ?TheGameSpyPeerMessageQueue@@3PAVGameSpyPeerMessageQueueInterface@@A
    db 08Bh, 011h, 08Dh, 044h, 024h, 058h, 050h, 0FFh, 052h, 018h, 08Dh, 04Ch, 024h, 044h
    call ?j_0000f6d2@@YAXXZ
    db 050h, 051h, 089h, 064h, 024h, 020h, 08Bh, 0CCh, 068h
    dd g_Va01102D84
    call ??0?$StringBase@D@@AAE@PBD@Z
    db 08Dh, 04Ch, 024h, 018h, 051h
    call ?format@AsciiString@@QAAXV1@ZZ
    db 08Bh, 044h, 024h, 01Ch, 083h, 0C4h, 00Ch, 03Bh, 0C3h, 08Dh, 070h, 008h, 075h, 005h, 0BEh
    dd ?Rva006A16B0Empty@@3PADA
    db 08Bh, 0C6h, 08Dh, 050h, 001h, 08Ah, 008h, 040h, 03Ah, 0CBh, 075h, 0F9h, 02Bh, 0C2h, 003h, 0C6h
    db 050h, 056h, 08Dh, 08Ch, 024h, 0A0h, 000h, 000h, 000h
    call ?j_0002b297@@YAXXZ
    db 08Bh, 00Dh
    dd ?TheGameSpyPeerMessageQueue@@3PAVGameSpyPeerMessageQueueInterface@@A
    db 08Bh, 011h, 08Dh, 044h, 024h, 058h, 050h, 0FFh, 052h, 018h, 08Bh, 00Dh
    dd ?Rva012F7194@@3PAVRva012F7194Slots@@A
    db 08Bh, 011h, 0FFh, 092h, 014h, 001h, 000h, 000h, 08Bh, 000h, 03Bh, 0C3h, 074h, 005h, 083h, 0C0h
    db 008h, 0EBh, 005h, 0B8h
    dd ?Rva006A16B0Empty@@3PADA
    db 050h, 051h, 089h, 064h, 024h, 020h, 08Bh, 0CCh, 068h
    dd g_Va01102D78
    call ??0?$StringBase@D@@AAE@PBD@Z
    db 08Dh, 044h, 024h, 018h, 050h
    call ?format@AsciiString@@QAAXV1@ZZ
    db 08Bh, 044h, 024h, 01Ch, 083h, 0C4h, 00Ch, 03Bh, 0C3h, 08Dh, 070h, 008h, 075h, 005h, 0BEh
    dd ?Rva006A16B0Empty@@3PADA
    db 08Bh, 0C6h, 08Dh, 050h, 001h, 08Ah, 008h, 040h, 03Ah, 0CBh, 075h, 0F9h, 02Bh, 0C2h, 003h, 0C6h
    db 050h, 056h, 08Dh, 08Ch, 024h, 0A0h, 000h, 000h, 000h
    call ?j_0002b297@@YAXXZ
    db 08Bh, 00Dh
    dd ?TheGameSpyPeerMessageQueue@@3PAVGameSpyPeerMessageQueueInterface@@A
    db 08Bh, 011h, 08Dh, 044h, 024h, 058h, 050h, 0FFh, 052h, 018h, 08Bh, 045h, 040h, 050h, 08Bh, 0CDh
    call ?j_00040dfe@@YAXXZ
    db 08Bh, 045h, 044h, 050h, 08Bh, 0CDh
    call ?j_0001b34c@@YAXXZ
    db 033h, 0F6h, 08Bh, 08Eh
    dd ?g_bfmeState09VJ@@3HA
    db 053h
    call ?j_0004a1fb@@YAXXZ
    db 08Bh, 08Eh
    dd ?g_bfmeState11VJ@@3HA
    db 053h
    call ?j_0004a1fb@@YAXXZ
    db 08Bh, 08Eh
    dd ?g_bfmeState12VJ@@3HA
    db 053h
    call ?j_0004a1fb@@YAXXZ
    db 08Bh, 08Eh
    dd ?g_bfmeState13VJ@@3HA
    db 053h
    call ?j_0004a1fb@@YAXXZ
    db 08Bh, 08Eh
    dd ?g_bfmeState15VJ@@3HA
    db 053h
    call ?j_0004a1fb@@YAXXZ
    db 083h, 0C6h, 004h, 083h, 0FEh, 020h, 07Ch, 0BCh, 08Bh, 00Dh
    dd ?TheGameText@@3PAVBfmeGameText@@A
    db 08Bh, 011h, 051h, 08Bh, 0C4h, 089h, 064h, 024h, 01Ch, 053h, 068h
    dd g_Va010FF5F4
    db 050h, 0FFh, 052h, 028h, 08Bh, 00Dh
    dd ?g_bfmeState03VJ@@3HA
    call ?j_00049c33@@YAXXZ
    db 08Bh, 00Dh
    dd ?g_bfmeState03VJ@@3HA
    db 053h
    call ?j_0004a1fb@@YAXXZ
    db 08Bh, 00Dh
    dd ?g_bfmeState02VJ@@3HA
    db 053h
    call ?j_0004a1fb@@YAXXZ
    db 08Dh, 04Ch, 024h, 014h, 088h, 01Dh
    dd ?initialAcceptEnable@@3_NA
    db 0C6h, 084h, 024h, 0F4h, 001h, 000h, 000h, 00Dh
    call ?releaseBuffer@?$StringBase@D@@AAEXXZ
    db 08Dh, 04Ch, 024h, 020h, 0C6h, 084h, 024h, 0F4h, 001h, 000h, 000h, 00Ch
    call ?releaseBuffer@?$StringBase@G@@AAEXXZ
    db 08Dh, 04Ch, 024h, 058h, 0C6h, 084h, 024h, 0F4h, 001h, 000h, 000h, 00Bh
    call ?j_00016bd5@@YAXXZ
    db 08Dh, 04Ch, 024h, 010h, 0C6h, 084h, 024h, 0F4h, 001h, 000h, 000h, 00Ah
    call ?releaseBuffer@?$StringBase@D@@AAEXXZ
    db 0C6h, 084h, 024h, 0F4h, 001h, 000h, 000h, 009h, 08Dh, 04Ch, 024h, 030h
    call ?j_00041f6a@@YAXXZ
    db 08Dh, 04Ch, 024h, 044h, 0C7h, 084h, 024h, 0F4h, 001h, 000h, 000h, 0FFh, 0FFh, 0FFh, 0FFh
    call ?j_00001307@@YAXXZ
    db 08Bh, 08Ch, 024h, 0FCh, 001h, 000h, 000h, 08Bh, 011h, 053h, 0FFh, 052h, 010h, 0A1h
    dd ?g_bfmeState05VJ@@3HA
    db 050h
    call ?j_0000a3df@@YAXXZ
    db 083h, 0C4h, 004h, 068h
    dd ?BFMEEmptyPlayerName@@3VUnicodeString@@B
    db 08Dh, 04Ch, 024h, 028h
    call ??0?$StringBase@G@@AAE@ABV0@@Z
    db 08Bh, 00Dh
    dd ?Control0040F780@@3PAUMovieControl0040F780@@A
    db 08Bh, 011h, 053h, 08Dh, 044h, 024h, 028h, 050h, 0A1h
    dd ?g_bfmeState06VJ@@3HA
    db 068h, 02Fh, 040h, 000h, 000h, 050h, 0C7h, 084h, 024h, 004h, 002h, 000h, 000h, 00Fh, 000h, 000h
    db 000h, 0FFh, 092h, 0D4h, 000h, 000h, 000h, 08Dh, 04Ch, 024h, 024h, 0C7h, 084h, 024h, 0F4h, 001h
    db 000h, 000h, 0FFh, 0FFh, 0FFh, 0FFh
    call ?releaseBuffer@?$StringBase@G@@AAEXXZ
    db 08Bh, 00Dh
    dd ?Rva012F7194@@3PAVRva012F7194Slots@@A
    db 08Bh, 011h, 0C6h, 005h
    dd g_Va012F4528
    db 001h, 0FFh, 092h, 0CCh, 000h, 000h, 000h
    call ?j_0001983f@@YAXXZ
    db 089h, 01Dh
    dd ?lastSlotlistTime@@3IA
    db 0FFh, 015h
    dd __imp__timeGetTime@0
    db 08Bh, 00Dh
    dd ?Control0040F780@@3PAUMovieControl0040F780@@A
    db 08Bh, 015h
    dd ?g_bfmeState06VJ@@3HA
    db 0A3h
    dd ?enterTime@@3IA
    db 08Bh, 001h, 052h, 0FFh, 090h, 0B0h, 000h, 000h, 000h, 053h, 051h, 089h, 064h, 024h, 020h, 08Bh
    db 0CCh, 068h
    dd g_Va0110278C
    db 0C6h, 005h
    dd g_Va012F42C8
    db 001h
    call ??0?$StringBase@D@@AAE@PBD@Z
    db 08Bh, 00Dh
    dd ?TheTransitionHandler@@3PAURva005A00B0Transition@@A
    call ?j_00045c28@@YAXXZ
    db 08Bh, 08Ch, 024h, 0ECh, 001h, 000h, 000h, 05Fh, 05Eh, 05Dh, 064h, 089h, 00Dh, 000h, 000h, 000h
    db 000h, 05Bh, 081h, 0C4h, 0E8h, 001h, 000h, 000h, 0C3h
?WOLGameSetupMenuInit@@YAXPAVWindowLayout@@PAX@Z ENDP
_TEXT ENDS
END
