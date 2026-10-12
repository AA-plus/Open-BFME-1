.386
.model flat
; MASM dump carrying a measured VC7.1 codegen blocker. The body is a
; thiscall member (ret 4) that seeds one BfmeSeedTarget through the typed
; value protocol: the Gen_0022CD40::bfmeSeed preamble, the checksum/saving
; dispatch, the list<Object*> id sweep, the map<int,int> value sweep and a
; trailing boolValue. ILT 0x00016027 (?j_00016027@@YAXXZ,
; game/gen_small/thunks_010.cpp) jumps to VA 0x0062C2A0 = RVA 0x0022C2A0,
; and the landed caller ?bfmeSeed@Gen_0022A170@@QAEXPAVBfmeSeedTarget@@@Z
; (0x0022A170, game/GameEngine/Source/Common/S3SeedPairsSweep.cpp) takes
; this body as a member pointer through __identifier("?d_0022c2a0@@YAXXZ");
; targets/game/reverse/symbols.csv pins the candidate name
; ?bfmeAccept@Gen_0022A170@@AAEXPAVBfmeSeedTarget@@@Z at ILT 0x00016027.
; Identity is still NOT provable: tools/ilt_oracle.py CONTRADICTS that name
; at this address (p_false 3.26e-04, outside every window of slot 17210
; 12089-12093), so the row keeps the placeholder name ?Rva0022C2A0@@YAXXZ
; and asserts nothing; a rename stays a name-lane action.
; The reconstructible C++ body (targets/game/reverse/attempts/0x0022c2a0.cpp,
; score 0.9875) compiles to 559 bytes with 12 relocations and shape 1.000;
; the whole residue is the home of the transfer count and the map-load id
; loop slot. Retail keeps count at [esp+14h] and id at [esp+1Ch]; VC7.1
; parks count in the incoming-argument home [esp+24h] and puts id at
; [esp+14h], seven non-relocation bytes at +0x16D +0x171 +0x1D7 +0x1DF
; +0x1F0 +0x20A +0x21C. About thirty measured formulations (block-scope,
; function-scope, per-branch and shared declarations, loadpair and
; else-scope variants, value/id orders, array and tmp spills) never move
; them, and VC7.1 allocator experiments show the argument-death slot rule
; that trades these two homes cannot produce retail's combination.
; Evidence: targets/game/reverse/identity_evidence/0022c2a0-masm-codegen-blocker.md

EXTERN ?j_0003d37a@@YAXXZ:NEAR
EXTERN ?j_0000c9b4@@YAXXZ:NEAR
EXTERN ?_M_deallocate@?$__node_alloc@$00$0A@@_STL@@CAXPAXI@Z:NEAR
EXTERN ?Clock00200420@@3PAUFrame00200420@@A:BYTE
EXTERN ?j_0001d0de@@YAXXZ:NEAR
EXTERN ?j_0002fb8a@@YAXXZ:NEAR
EXTERN ?allocate@__new_alloc@_STL@@SAPAXI@Z:NEAR
EXTERN ?_M_increment@?$_Rb_global@_N@_STL@@SAPAU_Rb_tree_node_base@2@PAU32@@Z:NEAR
EXTERN ?j_0001f91f@@YAXXZ:NEAR
_TEXT SEGMENT
; retail VA 0x0062C2A0 size 559
public ?Rva0022C2A0@@YAXXZ
?Rva0022C2A0@@YAXXZ PROC
    db 083h, 0ECh, 010h, 053h, 055h, 056h, 08Bh, 074h, 024h, 020h, 057h, 056h, 08Bh, 0E9h
    call ?j_0003d37a@@YAXXZ
    db 08Bh, 006h, 08Bh, 0CEh, 0FFh, 050h, 010h, 084h, 0C0h, 00Fh, 085h, 003h, 002h, 000h, 000h, 08Bh
    db 016h, 0B0h, 001h, 088h, 044h, 024h, 010h, 088h, 044h, 024h, 011h, 08Dh, 044h, 024h, 010h, 050h
    db 08Bh, 0CEh, 0FFh, 052h, 028h, 08Bh, 016h, 08Bh, 0CEh, 0FFh, 052h, 008h, 084h, 0C0h, 074h, 047h
    db 08Bh, 006h, 08Dh, 08Dh, 0E8h, 000h, 000h, 000h, 051h, 08Bh, 0CEh, 0FFh, 050h, 074h, 08Bh, 085h
    db 0E4h, 000h, 000h, 000h, 08Bh, 038h, 03Bh, 0F8h, 00Fh, 084h, 0E6h, 000h, 000h, 000h, 08Bh, 057h
    db 008h, 08Bh, 042h, 074h, 08Dh, 04Ch, 024h, 024h, 051h, 056h, 089h, 044h, 024h, 02Ch
    call ?j_0000c9b4@@YAXXZ
    db 08Bh, 03Fh, 08Bh, 085h, 0E4h, 000h, 000h, 000h, 083h, 0C4h, 008h, 03Bh, 0F8h, 075h, 0DCh, 0E9h
    db 0BDh, 000h, 000h, 000h, 08Bh, 085h, 0E4h, 000h, 000h, 000h, 039h, 000h, 074h, 05Dh, 08Bh, 085h
    db 0E4h, 000h, 000h, 000h, 0C7h, 085h, 0E8h, 000h, 000h, 000h, 000h, 000h, 000h, 000h, 08Bh, 038h
    db 03Bh, 0F8h, 074h, 03Ch, 08Dh, 09Bh, 000h, 000h, 000h, 000h, 08Bh, 057h, 008h, 08Bh, 01Fh, 08Bh
    db 047h, 004h, 06Ah, 00Ch, 089h, 018h, 057h, 089h, 054h, 024h, 01Ch, 089h, 043h, 004h
    call ?_M_deallocate@?$__node_alloc@$00$0A@@_STL@@CAXPAXI@Z
    db 08Bh, 044h, 024h, 01Ch, 08Bh, 00Dh
    dd ?Clock00200420@@3PAUFrame00200420@@A
    db 083h, 0C4h, 008h, 050h, 08Bh, 0FBh
    call ?j_0001d0de@@YAXXZ
    db 03Bh, 09Dh, 0E4h, 000h, 000h, 000h, 075h, 0CAh, 08Dh, 08Dh, 0E4h, 000h, 000h, 000h
    call ?j_0002fb8a@@YAXXZ
    db 08Bh, 016h, 08Dh, 0BDh, 0E8h, 000h, 000h, 000h, 057h, 08Bh, 0CEh, 0FFh, 052h, 074h, 08Bh, 007h
    db 033h, 0DBh, 085h, 0C0h, 076h, 040h, 08Dh, 044h, 024h, 024h, 050h, 056h
    call ?j_0000c9b4@@YAXXZ
    db 08Bh, 0BDh, 0FCh, 000h, 000h, 000h, 06Ah, 00Ch
    call ?allocate@__new_alloc@_STL@@SAPAXI@Z
    db 08Dh, 048h, 008h, 083h, 0C4h, 00Ch, 085h, 0C9h, 074h, 006h, 08Bh, 054h, 024h, 024h, 089h, 011h
    db 08Bh, 04Fh, 004h, 089h, 038h, 089h, 048h, 004h, 089h, 001h, 089h, 047h, 004h, 08Bh, 085h, 0E8h
    db 000h, 000h, 000h, 043h, 03Bh, 0D8h, 072h, 0C0h, 08Bh, 006h, 08Dh, 08Dh, 0ECh, 000h, 000h, 000h
    db 051h, 08Bh, 0CEh, 0FFh, 090h, 08Ch, 000h, 000h, 000h, 08Bh, 016h, 08Bh, 0CEh, 0FFh, 052h, 008h
    db 084h, 0C0h, 08Bh, 016h, 08Bh, 0CEh, 074h, 070h, 08Bh, 085h, 0F4h, 000h, 000h, 000h, 089h, 044h
    db 024h, 014h, 08Dh, 044h, 024h, 014h, 050h, 0FFh, 052h, 078h, 08Bh, 085h, 0F0h, 000h, 000h, 000h
    db 08Bh, 078h, 008h, 03Bh, 0F8h, 00Fh, 084h, 09Bh, 000h, 000h, 000h, 08Dh, 09Bh, 000h, 000h, 000h
    db 000h, 08Bh, 04Fh, 010h, 08Bh, 057h, 014h, 08Dh, 044h, 024h, 018h, 050h, 056h, 089h, 04Ch, 024h
    db 020h, 089h, 054h, 024h, 024h
    call ?j_0000c9b4@@YAXXZ
    db 08Bh, 016h, 083h, 0C4h, 008h, 08Dh, 044h, 024h, 01Ch, 050h, 08Bh, 0CEh, 0FFh, 052h, 078h, 057h
    call ?_M_increment@?$_Rb_global@_N@_STL@@SAPAU_Rb_tree_node_base@2@PAU32@@Z
    db 08Bh, 0F8h, 08Bh, 085h, 0F0h, 000h, 000h, 000h, 083h, 0C4h, 004h, 03Bh, 0F8h, 075h, 0C3h, 05Fh
    db 05Eh, 05Dh, 05Bh, 083h, 0C4h, 010h, 0C2h, 004h, 000h, 08Dh, 044h, 024h, 014h, 050h, 0FFh, 052h
    db 078h, 08Bh, 044h, 024h, 014h, 033h, 0FFh, 085h, 0C0h, 07Eh, 03Ch, 08Dh, 09Dh, 0F0h, 000h, 000h
    db 000h, 090h, 08Dh, 04Ch, 024h, 01Ch, 051h, 056h
    call ?j_0000c9b4@@YAXXZ
    db 08Bh, 016h, 083h, 0C4h, 008h, 08Dh, 044h, 024h, 018h, 050h, 08Bh, 0CEh, 0FFh, 052h, 078h, 08Dh
    db 04Ch, 024h, 01Ch, 051h, 08Bh, 0CBh
    call ?j_0001f91f@@YAXXZ
    db 08Bh, 054h, 024h, 018h, 089h, 010h, 08Bh, 044h, 024h, 014h, 047h, 03Bh, 0F8h, 07Ch, 0CBh, 05Fh
    db 05Eh, 05Dh, 05Bh, 083h, 0C4h, 010h, 0C2h, 004h, 000h
?Rva0022C2A0@@YAXXZ ENDP
_TEXT ENDS
END
