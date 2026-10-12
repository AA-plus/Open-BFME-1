# 0x00597FC0 Rva00597FC0Client constructor -- MASM landing with a measured codegen blocker

Target: RVA 0x00597FC0..0x00598760, 1953 bytes, name
`??0Rva00597FC0Client@@QAE@XZ`.
Source: `game/masm_dumps/Rva00597FC0ClientConstructor.asm`, converted from the
gen-dump row `?d_00597fc0@@YAXXZ` in `game/gen_asm/d_00593a30.asm` (rows
900..1026 of that multi-function scaffold; row notes: gen-dump,
ghidra=FUN_00997fc0).

## Identity (first-hand, pre-existing)

The assigned body installs vtables 0x0110C2D8 and 0x0110C2C4; its only caller
is the AptPalantir constructor 0x0079D9F0, which reaches it through ILT
0x0000DA58 with the receiver in ECX. The constructor symbol
`??0Rva00597FC0Client@@QAE@XZ,0x00597FC0` is already pinned in
`targets/game/reverse/symbols.csv` (line 3665); the historical `GameClient`
name was refuted in
`00431380-gameclient-vs-00597fc0-client.md`, and the donor/cleanup audit is in
`00597fc0-donor-and-cleanup.md` (secondary-vtable geometry, 24-state unwind
map, wrapper copy constructor 0x0058D220, first registration through ILT
0x0003A0BC to 0x0046DBC0). That prior work also records the standing wall:
XOR ECX/EAX at +0x190 plus the register drift and cleanup/unwind mismatches.

## Banked C++ and the measured residue

- Recorded stash (banked 2026-09-22, similarity 0.988):
  `targets/game/reverse/attempts/0x00597fc0.cpp`,
  sha256 26758446578b7bac0479a8b2a381f3a130dd15113de514324de36e6b7b505803
  (byte-identical working copy `build/scratch/t3/deep/base.cpp`; preserved as
  `build/scratch/0x00597fc0.attempts-bank.cpp`).
  Probe: `size ours=1953 retail=1953  relocs=108`,
  `diffs 24 non-reloc byte(s); first at +401`, shape 0.996.
- Best measured bank (this session):
  sha256 3a8a9c95f48e1f5712427adcf0add886d7958d60da4ba5cb46d5acfe9b3fb7b9,
  preserved at `build/scratch/0x00597fc0.bank.cpp` (variant `vH_barrier`).
  Probe: `size ours=1953 retail=1953  relocs=108`,
  `diffs 14 non-reloc byte(s); first at +401`, shape 1.000 -- "identical once
  registers and constants are normalised: the residue is register/stack-slot
  ALLOCATION only".

The whole 14-byte residue (raw side-by-side in
`build/scratch/t3/probe-vH-all.txt`):

| offset | retail | ours |
| --- | --- | --- |
| +0x190 | `xor ecx, ecx` | `xor eax, eax` |
| +0x192 | `mov [esi+0x18], ecx` | `mov [esi+0x18], eax` |
| +0x195 | `mov word [esi+0x1C], cx` | `mov word [esi+0x1C], ax` |
| +0x1CE | `mov ecx, [esp+0x28]` | `mov edx, [esp+0x28]` |
| +0x1D2 | `lea edx, [eax+8]` | `lea ecx, [eax+8]` |
| +0x1D5 | `mov [edx], esi` | `mov [ecx], esi` |
| +0x1D7 | `mov [edx+4], ecx` | `mov [ecx+4], edx` |
| +0x1DA | `mov ecx, [esp+0x30]` | `mov edx, [esp+0x30]` |
| +0x1DE | `mov [edx+8], edi` | `mov [ecx+8], edi` |
| +0x1EA | `mov [edx+0xC], ecx` | `mov [ecx+0xC], edx` |
| +0x1F3 | `mov edx, [esp+0x18]` | `mov ecx, [esp+0x18]` |
| +0x1F7 | `mov [edx], eax` | `mov [ecx], eax` |
| +0x205 | `lea eax, [esp+0x18]` | `lea edx, [esp+0x18]` |
| +0x209 | `push eax` | `push edx` |

Two clusters: the state-zeroing at +0x190..+0x195 picks ECX in retail and EAX
in the bank, and the first `new GameClientFunctorWrapper0(binding)` placement
copy at +0x1CE..+0x1EA swaps the scratch register with the
`&wrapper->m_binding` pointer, followed by the holder store at
+0x1F3/+0x1F7 and the `registerPalantirPlayerSide` argument LEA/push at
+0x205/+0x209.

## Wall: measured formulations that leave the fourteen bytes unchanged

The discovery of this session is that an `extern "C" _ReadWriteBarrier()`
intrinsic placed after the `GameClientStateFields zero = {};` stores lifts
shape from 0.996 to 1.000 and the residue from 24 to 14 bytes (it changes
allocator pressure around the +0x190 cluster and the wrapper copy without
changing any instruction form), but no formulation moves the remaining
allocation choices. All numbers are
`tools/probe.py <file> '??0GameClient@@QAE@XZ' 0x00597FC0 --size 1953`
non-relocation byte counts, all with `ours=1953 retail=1953 relocs=108`:

| variant | formulation | non-reloc diffs | shape |
| --- | --- | ---: | --- |
| base | recorded stash | 24 | 0.996 |
| vH_barrier | barrier after the zero block | 14 | 1.000 |
| vJ_barrier_in_block | barrier inside the zero block | 14 | 1.000 |
| vN_barrier_before | barrier before the zero block | 14 | 1.000 |
| vO_zero_then_cb | callback assignment first + barrier | 14 | 1.000 |
| vP_barrier_named | barrier + named GameClientFunctorBinding | 14 | 1.000 |
| vQ_barrier_moved | barrier between name ctor and call | 42 | 0.995 |
| v2_const | `const GameClientStateFields zero` | 24 | 0.996 |
| v5_named_binding | named binding, no barrier | 24 | 0.996 |
| v6_holderref | holder reference spelling | 24 | 0.996 |
| v10_second_binding | second binding named | 24 | 0.996 |
| vA_cb_mid | callback assigned mid-block | 25 | 0.996 |
| v9_zero_above_call | zero block moved above the epilogue call | 38 | 0.996 |
| v1_direct / v7_direct_named | direct member writes | 1142 | 0.993 |
| vK_uninit_then_store / vL_direct_barrier / vM_uint_temp | temporaries | 1142 | 0.993..0.996 |
| vB_cb_above | callback assigned above the block | 1147 | 0.987 |
| vC_name_first | name constructed first | 1151 | 0.987 |
| vD_whole_assign / vF_ptr_store | whole-struct assignment | 1158 | 0.995 |
| v3_brace2 | extra braces around the zero | 1185 | 0.995 |

Twenty formulations (plus the prior session's cleanup/unwind trials recorded
in `00597fc0-donor-and-cleanup.md`) leave those 14 bytes untouched, and five
different barrier placements produce the same 14. This is a VC7.1
register-allocation choice in two clusters, not source-spellable; the fourth
cluster population (unwind/unwind-map and vtable-drift items recorded in the
prior evidence) is already absorbed by the bank.

## Byte identity of the dump

`python3 tools/probe.py game/masm_dumps/Rva00597FC0ClientConstructor.asm
'??0Rva00597FC0Client@@QAE@XZ' 0x00597FC0 --size 1953` prints
`size ours=1953 retail=1953  relocs=0` and
`result EXACT (modulo relocation slots)`. Unlike the 0x002632F0 conversion,
this function's scaffold block inside `game/gen_asm/d_00593a30.asm` is a pure
`db` byte body (no `dd`/`call` symbolic lines), so the lift is verbatim: the
three self-references (`public`, `PROC`, `ENDP`) are renamed to the official
symbol and every body byte is unchanged, outer `_TEXT SEGMENT`/`ENDS` with a
plain `END`. The assembled object carries zero COFF relocations; its bytes are
the retail image bytes, identical to retail both between and inside the
retail relocation slots. The dump was generated by
`build/scratch/gen_597fc0_dump.py` (asserts the exact source line range, the
three occurrences and the 1953-byte count).

No pin was needed for this conversion: no file under `game/gen_asm/` or
`game/gen_small/` calls `?d_00597fc0@@YAXXZ`. The ILT thunk in
`game/gen_small/thunks_006.cpp` (`j_0000da58` calls `b_00597fc0`) is covered
by the existing address-based pin
`?b_00597fc0@@YAXXZ,0x00597FC0,gen-thunk body` in `symbols.csv` (line 59778);
`python3 tools/build.py game/gen_small/thunks_006.cpp` verifies the caller.

## Reopen condition

A source form that frees ECX before the +0x190 zero (or seeds EAX as live
across it) and simultaneously makes the wrapper-binding copy prefer ECX as
scratch and EDX as destination while keeping shape 1.000 would close the two
clusters; twenty measured forms, including five `_ReadWriteBarrier`
placements, do not. If a future session finds such a form, it can supersede
this dump with a real C++ conversion.
