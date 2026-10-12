# 0x006A6080 stream-budget predicate -- MASM landing with a measured codegen blocker

Target: RVA 0x006A6080..0x006A63E0, 865 bytes, name `?Rva006A6080@@YAXXZ`
(address-derived placeholder; no caller, string, ILT slot or vtable cites this
body, so the name stays address-derived). Source:
`game/masm_dumps/Rva006A6080StreamBudget.asm`, derived from the gen-dump row
`?d_006a6080@@YAXXZ` in `game/gen_asm/d_006a0bb0.asm`.

## Body and ABI (first-hand)

- `ret 0x10` at +0x360 (`C2 10 00`) returns `bool` in AL; ECX is the manager
  `this`. Four stack arguments: const AsciiString& name, int threshold,
  int index, unsigned layer; SEH frame `push -1; push g_Va01047F40`.
- The prologue takes the manager's scoped mutex from `[this+0x95C]` via
  `WaitForSingleObject(handle, -1)` / `ReleaseMutex`, matching the landed
  neighbors 0x006A5600 and 0x006A57D0 (same +0x95C mutex, +0x9D0 stream list).
- Two loops: the `_STL::list<PlayingAudioRef>` at +0x9D0, then the
  `_STL::deque<PlayingAudioRef>` cell at `layer + index * 2` (cell array at
  +0x9D4, deque stride 0x28). Each entry runs the intrusive Add_Ref/Release_Ref
  and, when the event name compares equal (inlined AsciiString::compare),
  evaluates `rva006990E0(event) - AIL_stream_loop_count(handle) >= threshold`.
- 0x006990E0 is the landed 88-byte helper row
  `?rva006990E0@@YIHHPAURva006990E0Request@@@Z`; the call at +0x269 and
  +0x0E8 resolves against it.

## Why this lands as a MASM dump (measured)

- The reconstructible C++ body (`targets/game/reverse/attempts/0x006a6080.cpp`)
  compiles with `tools/probe.py` to exactly 865 bytes with 24 relocations and
  shape 0.996; its whole residue is 5 non-relocation bytes in two sites:
  the handle argument load at +0x25B (retail `mov edx,[ebp+8]` / `push edx`;
  ours `mov eax,[ebp+8]` / `push eax`) and the deque node increment at
  +0x293..+0x297 (retail `mov eax,[esp+0x30]; add eax,4`; ours
  `mov edx,[esp+0x30]; lea eax,[edx+4]`). Both are register-selection
  differences in inlined STLport code; every other instruction matches.
- 9 additional loop-2 spellings measured on 2026-10-12 (pointer cell,
  postfix `it++`, direct `m_milesHandle` and `dword28` fields, raw
  `PlayingAudio *`, `continue` form, reordered conditions) all land on the
  identical 5 bytes; earlier waves recorded 220+ accessor-spelling grids,
  `/Ob2` and `/G5` with no improvement, best score 0.9942
  (`targets/game/reverse/re_attempts.log` lines 39910 and 46615).
- The dump body is byte-identical to retail outside its relocation slots; 10
  symbolic references, all declared by the gen-dump file, resolve through
  existing functions.csv rows, the `?b_006a6080@@YAXXZ` pin remains the
  gen-thunk entry for 0x00038645, and no gen_asm file calls the withdrawn
  `?d_006a6080@@YAXXZ` name, so no compatibility pin is added.
