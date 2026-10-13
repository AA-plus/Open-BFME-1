# 0x004F52C0 WOLGameSetupMenuInit -- MASM landing with a measured EH/codegen blocker

Target: RVA 0x004F52C0..0x004F5AF4, 2,101 bytes, name
`?WOLGameSetupMenuInit@@YAXPAVWindowLayout@@PAX@Z` (identity proven).
Source: `game/masm_dumps/Rva004F52C0WOLGameSetupMenuInit.asm`.

## Boundary and identity (proven)

- Extent proof: retail returns at +0x834 (`ret`), INT3 padding follows at
  +0x835, and Ghidra's bounds-high marker agrees; probe measures 2101/2101
  across sessions.
- Identity evidence: Zero Hour's `WOLGameSetupMenu.cpp` carries the same
  `void WOLGameSetupMenuInit( WindowLayout *, void * )` with the same
  game-in-progress / host-client / lobby-list flow (the banked attempt includes
  that TU and re-banks only the body), the unique FunctionLexicon entry names
  it, and the matching retail calls and strings (GameSpy overlay calls,
  AsciiString `.format` sites) agree. ABI: __cdecl, two stack arguments,
  result unused.
- Retail parent handler 0x00C2CA30 -> FuncInfo 0x00E1CD10 proves sixteen EH
  states; the host cleanup uses 6-8 and the client cleanup uses 9-14 (state 12
  cleans PeerRequest via 0x004D52D0).

## Why this lands as a MASM dump (measured wall)

- The reconstructible C++ body (`targets/game/reverse/attempts/0x004f52c0.cpp`,
  bank score 0.9933) compiles to exactly 2,101 bytes with 162 relocations; its
  whole residue is fourteen non-relocation bytes, all EH state-store
  immediates in the client cleanup block. The bank numbers the client regions
  first: its states equal retail's with a fixed +6 mod 9 rotation over the
  9-state window (retail uses 6..d, the bank 6..e with b unused).
- Host-first spellings (default-first switch, `if (amIHost())` host-first,
  Bool local, `case TRUE` first, renamed and shared counters) restore the
  retail state numbering exactly but then swap the two live registers
  (hostSlot EDI vs loop counter ESI) in 17 bytes at +0x271..+0x438; the two
  residues are mutually exclusive, so neither ordering reaches byte equality.
  `_STLP_NO_EXCEPTIONS` and nothrow `operator delete[]` are flat (14 diffs
  unchanged); earlier waves' hoists, split-counter, v_goto/v_not_if/usertData
  variants are also no-change or worse. Blockers: eh/state-order versus
  regalloc.
- The apparent global accesses at +0x662..+0x692 are relocation artifacts,
  not code differences.
- Landing: `python3 tools/add_match.py "?WOLGameSetupMenuInit@@YAXPAVWindowLayout@@PAX@Z"
  0x004F52C0 2101 game/masm_dumps/Rva004F52C0WOLGameSetupMenuInit.asm
  --replace-rva 0x004F52C0` verified OK (the tool byte-checks and would have
  restored the scaffold row on failure).
- The dump body is byte-identical to retail outside its relocation slots (the
  body text is the dump_apply-rewritten gen-dump body of `?d_004f52c0@@YAXXZ`
  in `game/gen_asm/d_004e1090.asm`, verbatim; all 85 reloc sites symbolic, no
  literal image address authored).
