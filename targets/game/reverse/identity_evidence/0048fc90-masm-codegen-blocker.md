# 0x0048FC90 timed-text word-wrap forward -- MASM landing with a measured codegen blocker

Target: RVA 0x0048FC90..0x00490042, 898 bytes, name `?Rva0048FC90@@YAXXZ`
(address-derived placeholder). The only caller is the tail forwarder at
0x0043BC10 (`mov ecx,[ecx+0x81C]; test; jmp ILT thunk 0x000198B2`), which names
nothing; `tools/ilt_oracle.py check '?bfmeForward@Gen_0048FA30@@QAEXABVUnicodeString@@H@Z'
0x000198B2` returns CONTRADICTED (p_false 9.13e-04), so no real name is
provable and the ILT slot still routes through the `?j_000198b2` gen-thunk.
Source: `game/masm_dumps/Rva0048FC90TimedTextForward.asm`, derived from the
gen-dump row `?d_0048fc90@@YAXXZ` in `game/gen_asm/d_0048a320.asm`.

## Body and ABI (first-hand)

- `ret 8` at +0x37C; ECX is the timed-text object whose clear 0x0048FA30 is
  virtual slot +0x10 (landed as `Gen_0048FA30::bfmeClear` in
  `Bfme5DestroyRangeClear.cpp`); two stack arguments: const UnicodeString&
  text and int seconds. SEH frame `push -1; push g_Va010271B0`.
- Clears the object, copies the text through the inlined
  `StringBase<unsigned short>` copy ctor, asks the target (+0x08) to prepare,
  stamps +0x18 from `TheGameClient` slot +0x68 and, with a duration,
  +0x1C/+0x20 get frame + 30*seconds and 30 frames below it; otherwise
  +0x20 gets frame + 450 and +0x1C stays 0.
- A new DisplayString takes the target's font; the whitespace state machine
  feeds words to 0x0048FAC0 (`Rva0048FAC0Owner::appendWord`, ILT thunk
  `?j_0000badc`) and line breaks to 0x0048F8C0 (`?j_0001ad25`, the withdrawn
  `?d_0048f8c0` byte dump) through a stack line record; each line is then
  placed (x advances 1.5 font heights from 100) and stacked by the 0x0048E730
  walk (ILT thunk `?j_0001d30e`) from the +0x18 value in steps of 30; the
  display string is freed at the end (`?Rva0048EC80TheManager` slot +0x28).

## Why this lands as a MASM dump (measured)

- The reconstructible C++ body (`targets/game/reverse/attempts/0x0048fc90.cpp`)
  compiles to exactly 898 bytes with 33 relocations and shape 1.000; its whole
  residue is one register swap in the inlined placement loop: retail keeps the
  running offset in EDX (init 0x14) and the element cursor in ECX, while VC7.1
  always allocates them the other way. Eight non-relocation bytes at +0x2CE,
  +0x2D3, +0x2D7, +0x2D9, +0x2DC, +0x2DF and +0x2E2:
  retail `mov edx,0x14; mov ecx,eax; ... [ecx] ... [eax+0x10],edx;
  add edx,[eax+0xC]; add ecx,4; cmp ecx,ebp` vs ours with ecx/edx swapped.
- 30+ spellings measured on 2026-10-12 all land on the identical 8 bytes:
  `_STL::for_each` with a temporary functor; a named functor; functor by value
  and by reference; member declaration and constructor-init order swaps; a
  two-argument functor modeled on the landed 0x0048E790 sibling; a static
  helper with the sibling's `while (first != last) { layout(*first); ++first; }`
  shape; explicit `while` and `do/while` rewrites at the call site; unsigned
  offsets; explicit begin/end locals; argument-order permutations. Plain loops
  without the functor reallocate the whole body (181 diffs, 887 bytes).
- The dump body is byte-identical to retail outside its relocation slots
  (`tools/probe.py` on the .asm prints `result EXACT (modulo relocation slots)`;
  the 33-vs-29 relocation-count delta is only the SEH `__except_list` sites
  that the gen dump encodes as raw zeros, exactly as in the landed
  0x006A6080 dump).
- The existing `?b_0048fc90@@YAXXZ` symbols.csv pin (gen-thunk body) stays the
  entry for thunk 0x000198B2 in `game/gen_small/thunks_011.cpp`, and no
  gen_asm file calls the withdrawn `?d_0048fc90@@YAXXZ` name, so no
  compatibility pin is added.
