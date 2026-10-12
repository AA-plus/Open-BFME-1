# 0x0019F500 BfmeTableERJ refresh loop (MASM dump)

Retail 0x0019F500..0x0019F7BC (725 bytes), carved from the gen slab
`game/gen_asm/d_00198280.asm` (ghidra FUN_0059f500). Identity is
address-derived: GameLogic::init calls ILT 0x000456BA with ecx=g_bfmeTableERJ
and no arguments (symbols.csv 87851); the body ends plain RET at +0x2BD, then a
live _CxxThrowException tail through +0x2D4 followed by CC establishes 725B
(re_attempts.log 52263).

Why a MASM dump: the measured C++ reconstruction
(`targets/game/reverse/attempts/0x0019f500.cpp`, sha256
d890f778f3e6901d55bab3fca40dd8b896febbef3bde8b8209a21f834b89a012) compiles to
726 bytes (the trailing int3 is accepted by the flow-boundary check) with 41
relocations, and its throwing tail now carries the canonical
`enum ErrorCode` from Common/Errors.h so the +0x2BF ThrowInfo relocation reads
__TI1?AW4ErrorCode@@ (VA 0x011E0004), matching retail. Exactly 2
non-relocation bytes remain at +0xDC/+0xE0:

- +0xDC retail `lea eax,[esp+0x10]` vs bank `lea ecx,[esp+0x10]`;
- +0xE0 retail `push eax` vs bank `push ecx`,

the address of `path` passed to the AsciiString copy constructor of
`AsciiString filename(path);`. VC7.1 reuses ecx because esp+0x10 was the
receiver register of the immediately preceding `concat(".bse",4)` call; the
logged diagnostic shows that dropping the .bse concat merely moves the reuse to
the name concat, so the choice is a register-allocation artifact of the
preceding call, not of the copy statement. 25+ logged experiments (EH rotation
toggles, WWLib ascii_string.h base-class model, sibling-TU include set,
shape_search, const/ref-source and pointer aliases, copy-init, base casts,
by-value and ref-returning __forceinline helpers, arithmetic, assignment-as-
value and ternary spellings, this session's eight-variant batch) never move
those two bytes; only spellings that change the callee or add temporaries break
the other 700 bytes. The exact bytes are therefore kept as MASM: the carved
dump assembles to 725 bytes and `tools/probe.py` reports EXACT (modulo
relocation slots).

Reopen as C++ only with a reconstruction compiled byte-identical, or a
detected caller resolving the ABI.
