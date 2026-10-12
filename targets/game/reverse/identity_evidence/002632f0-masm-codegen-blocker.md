# 0x002632F0 OCLSpecialPower::doSpecialPowerAtLocation -- MASM landing with a measured codegen blocker

Target: RVA 0x002632F0..0x002636BB, 988 bytes, name
`?doSpecialPowerAtLocation@OCLSpecialPower@@UAEXPBUCoord3D@@I@Z`.
Source: `game/masm_dumps/Rva002632F0OCLSpecialPowerDoSpecialPowerAtLocation.asm`,
converted from the gen-dump row `?d_002632f0@@YAXXZ` in
`game/gen_asm/d_002632f0.asm` (row notes: gen-dump;switch-carved
start=int3-aligned end=switch-table+int3 refs=0).

## Identity (first-hand, pre-existing)

The registered OCLSpecialPower constructor 0x002628E0 stores the secondary
vtable 0x010B6010 at object+0x10; slot +0x34 (slot 13) routes through ILT
0x0002780E to this body. The landed slot-12 body 0x00262D60 calls it with a
coordinate pointer and a 32-bit options word, the sole return is RET 8
(0x002636A6), and the shared base body 0x0026A620 (RET 8) fills the slot for
powers that do not override it. The override chains to the base first, then
extends the Zero Hour OCL create-location logic with BFME waypoint spawn
points and the module data's AsciiString vector at data+0x224 (module-data
ctor 0x002631B0). Evidence:
`002632f0-retail-flow.md`, `002632f0-inline-accessor-stack-slots.md`,
`specialpower-slot11-12-dospecialpower.md`.

## Extent

988 bytes = 953 code bytes + one alignment LEA + the 8-entry switch table
(last 32 bytes at +0x3BC..+0x3DB). The table is inside the carved row extent
("end=switch-table+int3"), so the size stays 988. The probe boundary warning
at +0x3DA is the linear decoder reading the final table word as
`add ah, cl`; the size was deliberately NOT adjusted.

## Banked C++ and the measured residue

- Older bank (three sessions ago, recorded stash score 0.9879):
  `targets/game/reverse/attempts/0x002632f0.cpp`,
  sha256 5ba73c266fef5be4f72226a24fb7dc0f81e16ad4dacda8754f4117d9679a9ba6.
- Newest bank (last session, 12-byte residue): sha256
  67c452ed0e91ab86baa8ff6288250c26ad8625d358947c073d5e3c010207031b,
  preserved at `build/scratch/0x002632f0.bank.cpp` (its game/ TU copy was
  scratch and has been removed).
- `python3 tools/probe.py <bank> '<name>' 0x002632F0 --size 988`:
  `size ours=988 retail=988 relocs=47`,
  `diffs 12 non-reloc byte(s); first at +638`, shape 0.943.

The whole residue is twelve displacement bytes that swap the two 12-byte
frame objects. Retail keeps the AsciiString vector at ESP+0x20
(begin/end/cap 0x20/0x24/0x28) and the waypoint delta at ESP+0x2C
(x/y/z 0x2C/0x30/0x34); the C++ build reverses them (delta at 0x20..0x28,
vector at 0x2C..0x34):

| offset | retail | ours |
| --- | --- | --- |
| +0x27B | `lea ecx, [esp+0x2c]` (delta ctor) | `lea ecx, [esp+0x20]` |
| +0x287 | `mov [esp+0x34], eax` (delta.z) | `mov [esp+0x28], eax` |
| +0x28D | `fstp [esp+0x2c]` (delta.x) | `fstp [esp+0x20]` |
| +0x294 | `fstp [esp+0x30]` (delta.y) | `fstp [esp+0x24]` |
| +0x298 | `fld [esp+0x34]` (delta.z) | `fld [esp+0x28]` |
| +0x29F | `fstp [esp+0x34]` (delta.z) | `fstp [esp+0x28]` |
| +0x321 | `lea ecx, [esp+0x24]` (vector copy dest) | `lea ecx, [esp+0x30]` |
| +0x32A | `mov ecx, [esp+0x24]` (vector end) | `mov ecx, [esp+0x30]` |
| +0x32E | `mov eax, [esp+0x20]` (vector begin) | `mov eax, [esp+0x2c]` |
| +0x37E | `mov ecx, [esp+0x24]` (vector end) | `mov ecx, [esp+0x30]` |
| +0x382 | `mov eax, [esp+0x20]` (vector begin) | `mov eax, [esp+0x2c]` |
| +0x390 | `lea ecx, [esp+0x20]` (vector dtor) | `lea ecx, [esp+0x2c]` |

Raw side-by-side: `build/scratch/probe-all.txt` (header summary:
`build/scratch/probe-2632f0-base.txt`, sha-identical first `probe.py` run of
the newest bank). The exception cleanup follows the same swap: the retail
unwind (build/ocl-2632f0-retry/eh-target.log) passes EBP-0x64 to the vector
destructor while the compiled action uses EBP-0x58
(build/ocl-2632f0-retry/compiled-eh.txt).

## Wall: measured formulations that leave the twelve bytes unchanged

This session (all raw logs in `build/scratch/v2632/`):

| variant | emitted | non-reloc diffs |
| --- | ---: | ---: |
| v1_delta_fnscope (delta hoisted to function scope) | 988 | 12 |
| v2_delta_before_points (delta before the points array) | 988 | 12 |
| v3_vector_block (extra block around vector + loop) | 988 | 12 |
| v4_delta_inner_block (extra block around delta use) | 988 | 12 |
| r1_zdelta, r2_adelta (local renames) | 988 | 12 |

Rejected because they move real code: `v5_vector_before_switch` (968 bytes,
686 diffs, first at +23) changes the switch schedule;
`v6_vector_default_then_assign` (1032 bytes, 772 diffs, first at +39) grows
the frame.

Previous session, 31 measured minutes, all raw outputs preserved in
`build/ocl-2632f0-retry/` (15 ranked trials from baseline through
`split-xy-player-local` with measured quality 0.29..0.72, plus scope, const,
copy-initialization, explicit vector temporary, coordinate-destructor
visibility and waypoint-array-initialization trials; empty coordinate
constructor changed the switch layout and a by-value coordinate helper grew
the frame). The prior note
`002632f0-inline-accessor-stack-slots.md` enumerates them and already
concludes: scope changes, const qualification, copy-initialization, explicit
temporaries, declaration order, local names and accessor shapes do not move
the two slots. About thirty formulations over three sessions leave the
twelve displacement bytes untouched: this is a frame-slot allocation-order
choice in VC7.1, not source-spellable.

## Byte identity of the dump

`python3 tools/probe.py game/masm_dumps/Rva002632F0OCLSpecialPowerDoSpecialPowerAtLocation.asm '<name>' 0x002632F0 --size 988` prints
`size ours=988 retail=988  relocs=44` and
`result EXACT (modulo relocation slots)`. The dump body is the verbatim
gen-dump lift with the self-references renamed to the official symbol; its
relocation slots cover the SEH frame (g_Va0100F838), the two embedded
switch-table loads and their eight DIR32 entries, the four global loads
(Rva012ef4cc x4, Rva012ef214 x2, Rva012ef188, Clock00200420 not used here),
the string literals and every direct call (the j_ thunks plus
StringBase ctor, bfmeAdd1095, vector copy ctor, base doSpecialPowerAtLocation
and friends) -- all resolved symbolically, no literal addresses. Outside
those slots the bytes are identical to retail.

No pin was needed for this conversion: no file under `game/gen_asm/` or
`game/gen_small/` calls `?d_002632f0@@YAXXZ` (the only textual reference was
the retired row's own file, which stays in the tree for its sibling rows
0x00266F40 and 0x0028EF30/0x0028EF80/0x002A11F0/0x002B5CC0). The ILT thunk
row 0x0002780E reaches this address through the existing address-based pin
`?b_002632f0@@YAXXZ,0x002632F0,gen-thunk body` in `symbols.csv`.

## Reopen condition

A source form that opens/constructs the vector's EH scope before the delta's
first store while keeping the switch schedule and the call order would move
the slots; every measured form that touched scope or order either kept the
swap or broke the switch (v5/v6). If a future session finds such a form, it
can supersede this dump with a real C++ conversion.
