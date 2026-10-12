# 0x006BD6E0 W3DGhostObject transfer body (MASM dump)

Retail 0x006BD6E0..0x006BDA28 (840 bytes), carried by the gen-dump bank
`game/gen_asm/d_006b9500.asm` (notes: ghidra=FUN_00abd6e0). The body returns
four stack bytes at +0x305 and then contains two cold throw queues; its last
call ends at +0x348, and the INT3 padding after it is outside the row. All
internal jumps land on decoded instruction boundaries and no jump leaves the
extent.

The dump body is byte-identical to retail outside its 22 relocation slots
(`tools/probe.py` on `game/masm_dumps/Rva006BD6E0Xfer.asm`: EXACT modulo
relocation slots, 840/840, 22 relocs). Every data/call slot keeps the same
symbol the gen-dump bank resolves, so the row is byte-true by construction
and `./build.sh` verifies it live.

## Identity

The body is an xfer-shaped W3DGhostObject virtual: thiscall plus one stack
argument (ret 4), extending the GhostObject transfer body at 0x001B3B70
(gen-dump row `?d_001b3b70@@YAXXZ`, 185 bytes, same ret 4 + GhostObject
layout whose snapshots sit at +0x80 and DrawableInfo at +0x100, both walked
here). ILT 0x000268D7 holds it in slot 3 of the W3DGhostObject vftable
0x0111CFB8, whose other slots are slot 0 `??_GW3DGhostObject@@UAEPAXI@Z`
(0x006BD070), slot 1 the landed `?loadPostProcess@W3DGhostObject@@MAEXXZ`
(0x006BC8B0, evidence `006bc8b0.md`) and slot 2 the class-name getter
returning the literal "W3DGhostObject" at 0x0111CFCC. The thunk
`?j_000268d7@@YAXXZ` (0x000268D7, `game/gen_small/gthunks_042.cpp:859`)
jumps here.

Identity is NOT provable, so the ledger row keeps the placeholder name
`?Rva006BD6E0@@YAXXZ` and asserts nothing. `tools/ilt_oracle.py check`
CONTRADICTS both `?xfer@W3DGhostObject@@MAEXPAVXfer@@@Z` and the unsigned
variant at this address (p_false 5.22e-04, outside slot 30762's window
19262-19269) -- and the same oracle also contradicts the already-landed
sibling `?loadPostProcess@W3DGhostObject@@MAEXXZ` (p_false 9.78e-04), so this
vtable family's windows cannot decide either name. A rename stays a
name-lane action backed by slot evidence; this dump asserts no name.

## Why a MASM dump

The measured C++ reconstruction banked at
`targets/game/reverse/attempts/0x006bd6e0.cpp` (sha256
bc85bc3f8af9e44554ac5ebedbb90d251a12bd3b2d430df32758b6eb50db53d0, score
0.9892984542211652) compiles to 841 bytes with 22 relocations and shape
0.996; the only structural difference is one trailing INT3. The whole
residue is stack-slot placement for the snapshot index and the index cursor.
Retail keeps `i` at [esp+28h] and the cursor at [esp+24h]; VC7.1 parks the
cursor in the dead incoming-argument slot ([esp+14h]) and moves the other
homes, eight non-relocation bytes:

  +0xBB  retail `mov [esp+28h],edi`  VC7.1 `mov [esp+24h],edi`
  +0xC5  retail `mov [esp+24h],edi`  VC7.1 `mov [esp+14h],edi`
  +0x219 retail `mov [esp+30h],edi`  VC7.1 `mov [esp+2Ch],edi`
  +0x25F retail `mov eax,[esp+28h]`  VC7.1 `mov eax,[esp+18h]`
  +0x2A9 retail `mov eax,[esp+2Ch]`  VC7.1 `mov eax,[esp+28h]`
  +0x2AD retail `mov edi,[esp+28h]`  VC7.1 `mov edi,[esp+18h]`
  +0x2B8 retail `mov [esp+2Ch],eax`  VC7.1 `mov [esp+28h],eax`
  +0x2BC retail `mov [esp+28h],edi`  VC7.1 `mov [esp+18h],edi`

Formulations measured 2026-10-13 on top of ten prior recorded attempts
(re_attempts.log lines 36916/37037/38392/38771/38782/52458/53969/58680/58845
and `006bd6e0-finishing-lifetimes.md`): flat scopes (25 diffs, frame 0x30),
error clause at the top of the loop, deleting the snapshot block, hoisting
scale/color/name before the error branch (42 diffs), `int i` declared
outside the for, count declared and initialised at the top, reversed
count/cursor declaration order, cursor declared outside the loop, cursor
declared first, cursor initialised -- every one leaves the same eight bytes.
The earlier separate probe of a two-byte XferVersion declaration (841 bytes,
14 diffs), a raw exception buffer outside the snapshot loop (8 diffs) and a
bounded EH search left the bank unchanged, and the 694-byte BFME2 donor
differs in shape; those live in the two prior evidence files.

Reopen as C++ only with a reconstruction compiled byte-identical, or with
independent evidence that stabilises the index/cursor homes while preserving
the three unwind states (0 -> -1, 1 -> 0, 2 -> 1).
