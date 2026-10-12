# 0x0043A3B0 GlobalLanguage::parseFontFileName -- MASM landing with a measured codegen blocker

Target: RVA 0x0043A3B0..0x0043A47B, 203 bytes, name
`?parseFontFileName@GlobalLanguage@@SAXPAVINI@@PAX1PBX@Z` (Ghidra calls it
FUN_0083a3b0: the image base is 0x400000, so ledger RVA 0x0043A3B0 is VA
0x0083A3B0). Source: `game/masm_dumps/Rva0043A3B0LocalFontFileParser.asm`,
derived from the gen-dump row `?d_0043a3b0@@YAXXZ` in
`game/gen_asm/d_00435170.asm` lines 945-969 (that block stays in place, the
same way 0x0048FC90 stayed inside d_0048a320.asm).

## Body and ABI (first-hand)

- Prologue `push -1; push g_Va010228C9` (SEH frame), `sub esp,0x10`, saves
  ebx/esi/edi; epilogue restores the FS cookie and returns at +0xCA; bytes
  +0xCB.. onward are the next body (INT3-free boundary confirmed by the
  breakpoint padding of the gen row).
- Three AsciiString locals at esp+0xC / +0x14 / +0x18. The token comes from
  `INI::getNextAsciiString` (0x008516E0, landed 393 B). The record's first
  string is assigned through `StringBase<char>::set` (0x00887C90, landed
  135 B); the record is an 8-byte pair `Open2Rec439370` whose out-of-line copy
  constructor at 0x00439370 (landed 81 B, `??0Open2Rec439370@@QAE@ABV0@@Z`)
  is reached through the ILT thunk 0x00020BAD (`e9` rel32 -> 0x00439370).
- The instance's local-font list pointer is read at instance+0x134; the node
  is 0x10 bytes from `__new_alloc::allocate` (0x0082E540, landed 162 B),
  spliced before end (`mov [edi+4]; mov [esi]; mov [esi+4]; mov [eax]; mov
  [edi+4]`), followed by three `releaseBuffer` calls (0x00887940, landed
  134 B) for the three temporaries. STLport list codegen as before.

## Identity (first-hand)

- The FieldParse row at VA 0x010F3B18 (table 0x010F3AD8) pairs the name
  pointer VA 0x010F3FDC -> "LocalFontFile" with callback VA 0x004178FF, a
  gen thunk (`?j_000178ff@@YAXXZ`, row target=0x0043A3B0) whose `e9 ac 2a 42
  00` jmps here; userData 0, table offset 0.
- `INI::parseLanguageDefinition` at 0x00438F70 hands that table to
  initFromINI, so the Zero Hour reference source names this parser
  `GlobalLanguage::parseFontFileName` with the exact static FieldParse
  signature, and `targets/game/reverse/symbols.csv` already pins that name at
  0x0043A3B0. The name is therefore not address-derived.

## Why this lands as a MASM dump (measured)

- The reconstructible C++ body (`targets/game/reverse/attempts/0x0043a3b0.cpp`)
  compiles with `tools/probe.py` to exactly 203 bytes with 11 relocations and
  shape 1.000; its whole residue is two non-relocation bytes at +0x76 and
  +0x7A, where the pushed record-address temporary uses EAX (`lea
  eax,[esp+0x14]; push eax`) instead of retail's EDX (`lea edx,[esp+0x14];
  push edx`, both bytes visible in the image at file offsets 0x43A426 and
  0x43A42B).
- Variants measured on 2026-10-13: 16 fresh spellings (reference receivers,
  forced-inline helpers taking the list and the record, an explicit
  `_STL::_Construct<Open2Rec439370, Open2Rec439370>` instantiation, an
  iterator temp with insert, typedef, comma and deref forms) plus a 10-flag
  sweep (/Os /Ot /G7 /G6 /GR- /Op- /O2+Og- /O2+Ob1 /GA /Gf). Every
  shape-preserving trial lands on the identical two bytes; /Os (107 B) and
  /O2+Og- (167 B) lose the 203-byte shape entirely. Earlier waves in
  `targets/game/reverse/re_attempts.log`: 13 spellings + 17-flag sweep, 33
  shape-family/EH trials (sib register, bool test, copy store, loop branch,
  constant frame, x four combinations, plus throw/ehsc/stlp/nodelete and
  callee-throw variants), 10 rotation-sweep call and local forms, and
  operator=, insert(end(), x), volatile-pointer-alias and const-reference
  variants (rows at log lines 24575 and 35759-60598). A retail-uniqueness
  scan over .text finds ours as the only site with this exact instruction
  shape. `docs/shape_levers.md` records this residual and states that
  register-only sweeps are exhausted.
- The dump body is byte-identical to retail outside its 8 relocation slots
  (checked by masking the 4-byte dd at +0x3 and the 5-byte call rel32 fields
  at +0x24 +0x45 +0x58 +0x7B +0x96 +0xA3 +0xB4: zero mismatching bytes over
  the 203).

## Relocations in the dump

`g_Va010228C9`; `?getNextAsciiString@INI@@QAE?AVAsciiString@@XZ`;
`?set@?$StringBase@D@@QAEXABV1@@Z`; `?allocate@__new_alloc@_STL@@SAPAXI@Z`;
`?j_00020bad@@YAXXZ`; `?releaseBuffer@?$StringBase@D@@AAEXXZ` (three call
sites). All resolve through existing functions.csv rows (0x8516E0, 0x887C90,
0x82E540, 0x00020BAD, 0x887940). No gen_asm file calls the withdrawn
`?d_0043a3b0@@YAXXZ` name, so no symbols.csv compatibility pin is added; the
`?b_0043a3b0@@YAXXZ` gen-thunk pin at 0x0043A3B0 stays as it is.
