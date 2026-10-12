# 0x006BDC10 ghost-object transfer body (MASM dump)

Retail 0x006BDC10..0x006BDD8B (395 bytes), carved by the gen-dump bank
`game/gen_asm/d_00610140.asm` (notes: gen-dump, carved start=rel32-call/jmp,
end=jmp+int3, callers=1, ghidra=FUN_00abdc10). The body ends with a complete
backward JMP at +0x189 and the carve closes at +0x18B.

Identity is NOT provable: tools/ilt_oracle.py CONTRADICTS
`?xfer@W3DGhostObjectManager@@MAEXPAVXfer@@@Z` at this address (p_false
1.96e-04, outside its ILT slot window), so the pinned row keeps the
placeholder name `?Rva006BDC10@@YAXXZ`
(game/masm_dumps/Rva006BDC10GhostXfer.asm) and asserts nothing about that
name. The three data references use the recorded aliases
`?TheGhostObjectManager@@3PAVGhostObjectManager@@A` (0x012EF4FC),
`?TheBfmeGameLogic@@3PAVGameLogic@@A` (0x012F0898) and
`?TheShroudManager@@3PAVPartitionManager@@A` (0x012ED5BC) -- the names the
bank's own compilation resolves, per the DIR32 gate.

Why a MASM dump: the measured C++ reconstruction banked at
`targets/game/reverse/attempts/0x006bdc10.cpp` (sha256
94b8ebea2235e96c892eda5ad66d076e9c7dd0fdffcf5fea6ad9b8f668e12463) compiles
395 bytes with 7 relocations and shape 1.000, and its residue is a stack-slot
placement for the version local:

  +0x26 retail `mov byte [esp+0Ch],al`  VC7.1 `mov byte [esp+14h],al`
  +0x2A retail `mov byte [esp+0Dh],al`  VC7.1 `mov byte [esp+15h],al`
  +0x2F retail `lea eax,[esp+10h]`      VC7.1 `lea eax,[esp+18h]`

VC7.1 places the local in the already-dead incoming-argument area instead of
retail's frame slot; pointer locals, union wraps, declaration-order swaps and
a top-of-function declaration (20 diffs) were measured 2026-10-12 on top of
the BFME2-donor and corrected-callee-contract retries
(`006bdc10-bfme2-donor.md`, `006bdc10-callee-contract-retry.md`), refuting the
escape-analysis packing reading. The prior strongest bank also failed the raw
byte gate on exactly these three bytes.

The dump body is byte-identical to retail outside its 7 relocation slots
(probe EXACT; `./build.sh` verifies the row live).

Reopen as C++ only with a reconstruction compiled byte-identical, or with
independent identity evidence (a real ILT slot, string or caller) that
stabilises the version local's lifetime.
