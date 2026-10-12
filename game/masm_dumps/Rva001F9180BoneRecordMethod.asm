.386
.model flat
; ?Rva001F9180@@YAXXZ
; Retail @ 0x001F9180 size 342
;
; MASM dump carrying a measured codegen blocker. Identity is not provable: the
; body is reached through ILT 0x0003BFF7; both decoded callers pass a Coord3D
; output and test AL, and the module pointer comes from DynamicPortalBehaviour's
; module list, so the name stays address-derived.
;
; The reconstructible C++ body (targets/game/reverse/attempts/0x001f9180.cpp,
; sha256 a056d84b6f1c769831b4b94fd0a5539b861a5453aa23c727593342bdd6f7a97a)
; compiles to exactly 342 bytes with 13 relocations and shape 1.000. Its
; entire residue is three bytes at +0x00B6 +0x00BC +0x00C2 (file +0xB8 +0xBE
; +0xC4): retail loads the record selector [esi+0xC8] into ECX first and the
; array base [esi+0xA8] into EAX second, then lea eax,[eax+ecx*8]; VC7.1
; canonicalizes this base[index] address to the opposite roles
; (lea eax,[ecx+eax*8] with the two loads swapped). 30+ measured spellings --
; p[i], *(p+i), i[p], (unsigned) pointer-as-integer addition, explicit char*
; scaling, typed alias, record pointer/value, member accessor, count
; reference and count accessor, index/base locals in both declaration orders
; (332-345 bytes), plus _ReadWriteBarrier (flips the load order but keeps the
; opposite SIB roles) -- never reproduce retail's encoding; this joins the
; documented exhausted hard-lane SIB family (docs/shape_levers.md). The C++
; lane is additionally blocked: the class-key call
; ?bfmeGroundCellThreshold@Pathfinder@@QAE_NPBVCoord3D@@_N@Z does not resolve
; against the landed struct-key pin ...PBUCoord3D... at 0x003D8BC0, and this
; dump's ILT call avoids the key question. The dump body is byte-identical to
; retail outside its relocation slots.
; The two temporary-array pushes name the folded 12-byte element ctor/dtor
; ??0Coord3D@@QAE@XZ (0x00416C93) and ??1Coord3D@@QAE@XZ (0x0041364C), matching
; the bank's Coord3D positions[16] temporary (element size 0xC; count 0x10).
; Evidence: targets/game/reverse/identity_evidence/001f9180-masm-codegen-blocker.md
EXTERN ??_L@YGXPAXIHP6EX0@Z1@Z:NEAR
EXTERN ??_M@YGXPAXIHP6EX0@Z@Z:NEAR
EXTERN ?j_000107ad@@YAXXZ:NEAR
EXTERN ??1Coord3D@@QAE@XZ:NEAR
EXTERN ??0Coord3D@@QAE@XZ:NEAR
EXTERN ?j_0003ce25@@YAXXZ:NEAR
EXTERN ?Rva012ef214@@3PAVRva0041D290Manager@@A:BYTE
_TEXT SEGMENT
public ?Rva001F9180@@YAXXZ
?Rva001F9180@@YAXXZ PROC
    db 064h, 0A1h, 000h, 000h, 000h, 000h, 06Ah, 0FFh, 068h, 066h, 0B0h, 000h, 001h, 050h, 064h, 089h
    db 025h, 000h, 000h, 000h, 000h, 081h, 0ECh, 0CCh, 000h, 000h, 000h, 056h, 057h, 08Bh, 0F9h, 08Bh
    db 077h, 004h, 08Bh, 086h, 0C8h, 000h, 000h, 000h, 085h, 0C0h, 07Ch, 013h, 08Bh, 096h, 0ACh, 000h
    db 000h, 000h, 02Bh, 096h, 0A8h, 000h, 000h, 000h, 0C1h, 0FAh, 003h, 03Bh, 0C2h, 07Ch, 028h, 08Bh
    db 084h, 024h, 0E4h, 000h, 000h, 000h, 085h, 0C0h, 074h, 016h, 08Bh, 07Fh, 008h, 083h, 0C7h, 038h
    db 08Bh, 00Fh, 089h, 008h, 08Bh, 057h, 004h, 089h, 050h, 004h, 08Bh, 04Fh, 008h, 089h, 048h, 008h
    db 0B0h, 001h, 0E9h, 0D6h, 000h, 000h, 000h, 068h
    dd ??1Coord3D@@QAE@XZ
    db 068h
    dd ??0Coord3D@@QAE@XZ
    db 06Ah, 010h, 06Ah, 00Ch, 08Dh, 054h, 024h, 024h, 052h
    call ??_L@YGXPAXIHP6EX0@Z1@Z
    db 08Bh, 086h, 0A4h, 000h, 000h, 000h, 085h, 0C0h, 08Bh, 04Fh, 008h, 0C7h, 084h, 024h, 0DCh, 000h
    db 000h, 000h, 000h, 000h, 000h, 000h, 074h, 005h, 083h, 0C0h, 008h, 0EBh, 005h, 0B8h, 08Bh, 038h
    db 007h, 001h, 06Ah, 000h, 06Ah, 001h, 06Ah, 000h, 08Dh, 054h, 024h, 020h, 052h, 08Bh, 056h, 070h
    db 052h, 050h
    call ?j_000107ad@@YAXXZ
    db 08Bh, 08Eh, 0C8h, 000h, 000h, 000h, 08Bh, 086h, 0A8h, 000h, 000h, 000h, 08Dh, 004h, 0C8h, 08Bh
    db 000h, 08Dh, 004h, 040h, 08Bh, 054h, 084h, 014h, 08Bh, 04Ch, 084h, 018h, 08Dh, 044h, 084h, 014h
    db 089h, 054h, 024h, 008h, 08Bh, 050h, 008h, 08Bh, 084h, 024h, 0E4h, 000h, 000h, 000h, 085h, 0C0h
    db 089h, 04Ch, 024h, 00Ch, 089h, 054h, 024h, 010h, 074h, 014h, 08Bh, 04Ch, 024h, 008h, 08Bh, 054h
    db 024h, 00Ch, 089h, 008h, 08Bh, 04Ch, 024h, 010h, 089h, 050h, 004h, 089h, 048h, 008h, 08Bh, 015h
    dd ?Rva012ef214@@3PAVRva0041D290Manager@@A
    db 08Bh, 04Ah, 00Ch, 053h, 06Ah, 000h, 08Dh, 044h, 024h, 010h, 050h
    call ?j_0003ce25@@YAXXZ
    db 068h
    dd ??1Coord3D@@QAE@XZ
    db 06Ah, 010h, 06Ah, 00Ch, 08Dh, 04Ch, 024h, 024h, 051h, 08Ah, 0D8h, 0C7h, 084h, 024h, 0F0h, 000h
    db 000h, 000h, 0FFh, 0FFh, 0FFh, 0FFh
    call ??_M@YGXPAXIHP6EX0@Z@Z
    db 08Ah, 0C3h, 05Bh, 08Bh, 08Ch, 024h, 0D4h, 000h, 000h, 000h, 05Fh, 05Eh, 064h, 089h, 00Dh, 000h
    db 000h, 000h, 000h, 081h, 0C4h, 0D8h, 000h, 000h, 000h, 0C2h, 004h, 000h
?Rva001F9180@@YAXXZ ENDP
_TEXT ENDS
END
