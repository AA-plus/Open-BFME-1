# 0x0035F600 VictoryConditions end-game screen body (MASM dump)

Retail 0x0035F600..0x0035F727 (295 bytes), carved by the gen-dump bank
`game/gen_asm/d_003519c0.asm` (row `?d_0035f600@@YAXXZ` ... `gen-dump;bounds=high`).
RET 0x10 at +0x124, INT3 padding at +0x127; the body pushes the "ShowEndGame"
event literal (VA 0x010E8E10), fetches the title key through the GameText
interface, and drives the APT end-game display.

Owner is proven, the decorated name is not. The vtable at VA 0x010E8D90 slot 18
(+0x48) routes through ILT 0x00008B48 to this body, and the callers are
doVictory 0x002F1CF4, doDefeat 0x002F1E31, doLocalDefeat 0x002F1F72 and update
0x0035FC2B. But the ILT oracle CONTRADICTS both spellings the repo carries - the
symbols.csv pin `?_bfme_showEndGameScreen@VictoryConditions@@UAEXABVAsciiString@@_N00@Z`
and the census spelling `?showEndGame@VictoryConditions@@UAEXABVAsciiString@@_N00@Z`
- against the target's slot 0x8B48 window (buckets 6204-6207, p_false 2.61e-4).
No string or table names the body either, and the checked-in one-pointer
unicode_string.h/StringInline.h layout leaves the address-derived name
`?Rva0035F600@@YAXXZ`.

Why a MASM dump: the measured C++ bank
(`targets/game/reverse/attempts/0x0035f600.cpp`, sha256
cc1776618e8f8e7867ba8d61fb73d205d6cca915f019ab05470267c2efc6ba1c, score
0.9966) compiles to 295/295 bytes with 18 relocations and exactly one
non-relocation byte at +0x4B, the displacement of the EH saved-ESP store at
+0x48:

    +0048 retail: mov dword ptr [esp + 0x14], esp
    +0048 ours:   mov dword ptr [esp + 0x10], esp

Blocker class `eh/native-string-frame-layout`. The /FAsc listing of the bank
shows why the byte is unreachable: retail's 0xC frame carries three separate
four-byte objects (fieldName at -24, the Unicode fetch result at -20, and the
by-value argument pointer at -16), while the bank reaches retail's frame only by
padding UnicodeString to eight bytes, which parks the eight-byte temporary
$T558 at -20 and makes it overlap $T557 (the by-value argument pointer) at -20.
That padding is contradicted by the checked-in one-pointer StringInline.h
layout, so the one-byte bank is not a legitimate C++ conversion. Canonical
four-byte layouts shrink the frame to 8 and park the hidden return pointer in
the dead titleKey argument slot (14 stack displacements differ); naming or
reference-binding the fetch result restores the frame but emits LEA instead of
retail's pushed EAX at 299 bytes (130-145 diffs). 81+ logged trials across prior
sessions (named/reference/full-expression result lifetimes; native AsciiString
vs the bank's label wrapper; widening the fieldName block so the AsciiString
outlives the fetch; volatile pointer parameter; explicit ctor/dtor/throw()
variants; direct AsciiString value argument; the StringInline.h lever; twelve
bounded native lifetime/label parameter alternatives) leave the byte, and every
restructuring spelling (both call arguments as temporaries, named result)
loses the frame or reorders the prologue.

The dump body is byte-identical to retail outside its relocation slots:
`tools/probe.py` and the strict gate report EXACT / STRICT PASS with no
unresolved REL32 names.

Reopen as C++ only with a reconstruction compiled byte-identical, or a
detected caller resolving the ABI.
