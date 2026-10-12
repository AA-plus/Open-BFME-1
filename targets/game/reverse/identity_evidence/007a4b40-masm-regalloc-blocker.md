# 0x007A4B40 MASM dump evidence — VC7.1 register-schedule blocker

Row: `?getWaterHeight@WaterRenderObjClass@@QAEMMM@Z`, 0x007A4B40, 384 bytes,
source `game/masm_dumps/Rva007A4B40WaterHeight.asm`, converted from the
`?d_007a4b40@@YAXXZ` gen-dump row (game/gen_asm/d_0079d530.asm).

## Boundary and identity

- 384-byte extent: `ret 8` at +0x17D, then INT3 padding to the next body at
  0x007A4CC0; Ghidra FUN_00ba4b40 agrees.
- Identity is proven, not address-derived: retail ILT 0x0002D4D4
  (`?j_0002d4d4@@YAXXZ`, 5 bytes, `target=FUN_00ba4b40`) resolves to this
  body; symbols.csv pins `?getWaterHeight@WaterRenderObjClass@@QAEMMM@Z` at
  0x007A4B40; BFME's own W3DWater.cpp carries the same
  `Real WaterRenderObjClass::getWaterHeight(Real x, Real y)` signature
  (present-unmatched) and the matched callers 0x006C76B0/0x006C7CF0 call it
  with two Reals. `ret 8` confirms the two stack arguments.

## Why MASM: the measured wall

The banked C++ reconstruction `targets/game/reverse/attempts/0x007a4b40.cpp`
measures 384 bytes, 9 relocations, instruction shape 1.000, and four
non-relocation register bytes (probe log `build/probe007a4b40.txt`):

    offset  retail                       ours
    +0x137  lea ecx,[esp+0x24]           lea edx,[esp+0x24]
    +0x13B  push ecx                     push edx
    +0x15A  mov edx,[ebx+0x54]           mov eax,[ebx+0x54]
    +0x15D  fld [edx+8]                  fld [eax+8]

The first pair materialises the GridPoint2 pointer for `containsPoint`, the
second is the polygon points temp. Every other byte, including the whole
trigger loop, x87 schedule, calls and the shared pointer walk, is identical.
The bank reaches this shape only through volatile reads (`*(volatile
unsigned*)&y`, `*(volatile unsigned*)&x`, and a volatile sentinel read) that
the anti-lift rules bar from a landable body.

The clean spelling keeps MSVC's own schedule instead: retail interleaves the
coordinate snapshot around the list-head walk (+0x116 `mov [esp+28h],eax`
pos.y store, +0x11A `mov eax,[ecx]` list-head load, +0x11C `cmp eax,ecx`,
+0x11E `mov [esp+24h],edx` pos.x store, +0x122 pos.z store), while the
straight-line source emits the three stores together: measured clean residues
are 10 non-relocation bytes at +0x10C..+0x114, and up to 26 bytes across
+0x0FE..+0x11F in later variants (re_attempts.log verdicts for this RVA,
  2026-09-27..2026-10-13).

Formulations that all left the same bytes: 64 shape_search variants; split
xCopy/yCopy declarations and assignments; source-order and local-order swaps;
compiler barriers; a hoisted `pp=(Point2*)&pos`; `pp` declared inside the
loop; a local `pts=poly->m_points`; a found-flag with post-loop return;
reversed z compare; inline begin()/end() accessors (406 bytes); array
accessors; object-reference receiver spellings; removing volatile reads
(380 bytes, 88 non-relocation diffs). No spelling moves the two scratch
registers or advances the three stores past the list-head load.

## Byte identity

The dump body is the verbatim symbolic lift of the gen-dump bytes: `db`
literals with the reference sites symbolic (?g_bfmeADL, ?g_bfmeAFAE,
?g_01076C24, the three ILT thunks ?j_0000b0c8 / ?j_00028fd3 / ?j_0004ab6f
and the two IAT `__imp__floor` calls). It is byte-identical to retail outside
the relocation slots; the landing verification
(`./build.sh game/masm_dumps/Rva007A4B40WaterHeight.asm`) reports
Functions: OK. No literal image address is authored in the source.
