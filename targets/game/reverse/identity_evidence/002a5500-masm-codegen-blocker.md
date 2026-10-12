# 0x002A5500 SlavedUpdate::update -- MASM landing with a measured register-allocation blocker

Target: RVA 0x002A5500..0x002A5859, 858 bytes, name
`?update@SlavedUpdate@@UAE?AW4UpdateSleepTime@@XZ` (real, non-placeholder).
Source: `game/masm_dumps/Rva002A5500SlavedUpdateUpdate.asm`, derived from the
gen-dump row `?d_002a5500@@YAXXZ` in `game/gen_asm/d_0029c7b0.asm`.

## Identity (proven, not guessed)

- ILT: `python3 tools/ilt_oracle.py check
  '?update@SlavedUpdate@@UAE?AW4UpdateSleepTime@@XZ' 0x0002374F` -> CONFIRMED
  (exact; p_false=2.61e-04). Slot 0x0002374F is the five-byte thunk whose
  target is this RVA (`?j_0002374f@@YAXXZ` in functions.csv row 90424).
- Vtable: the SlavedUpdate constructor at 0x002A4260 installs vtable
  0x010C2BD4, whose slot 0 is the update entry (earlier wave evidence in
  `targets/game/reverse/re_attempts.log` line 37197).
- The ZH reference source `GeneralsMD/.../SlavedUpdate.cpp` `update()` and the
  BFME layout views in `targets/game/reverse/attempts/0x002a5500.cpp` agree on
  the body's control flow: slaver lookup, private-status guard, defect call,
  setLayer/clearWeaponBonusCondition, repair/attack/scout priorities, pinned
  guard position and the BFME-only `m_objectID040` guard-object branch.

## Complete body and boundary

- `ret` at RVA 0x002A5858 (decimal +359 from the entry) is the last byte of
  the body; 3 INT3 bytes follow (0x002A585A..0x002A585C); the next body starts
  at 0x002A5860. Frame is `sub esp, 0x20` after `push esi`. No SEH frame.

## Why this lands as a MASM dump (measured)

- The reconstructible C++ body (`targets/game/reverse/attempts/0x002a5500.cpp`,
  built with the canonical ZH SlavedUpdate layout and BFME offsets) compiles
  with `tools/probe.py` to exactly 858 bytes and 31 relocations with shape
  1.000: every instruction matches retail once registers and constants are
  normalised. The whole residue is four register-selection bytes at +0x280,
  +0x286, +0x289 and +0x298 in the guard-object copy:

      retail: mov edx,[ebp+0x38] / mov ecx,[ebp+0x40] / mov eax,[ebp+0x3c]
              mov [esp+0x24],edx / mov [esp+0x2c],ecx / mov [esp+0x2c],eax
      ours:   mov eax,[ebp+0x38] / mov ecx,[ebp+0x40] / mov ebp,[ebp+0x3c]
              mov [esp+0x24],eax / mov [esp+0x2c],ecx / mov [esp+0x2c],ebp

  Retail keeps the source pointer in ebp and loads the third value into eax;
  VC7.1's allocator reuses ebp for the third value even though the pointer is
  dead at that point. Every instruction in between already matches, including
  the -0x10 `this` adjustment and both `endRepair`/`doGuardLogic` call sites.
- 25 additional spellings measured on 2026-10-12 (direct assignments x/z/y and
  x/y/z, Coord3D references, memcpy chains with and without
  `_ReadWriteBarrier` at three placements, `Real`/`int`/`unsigned` temporaries
  with initialiser and memcpy forms, declaration orders gz-gy-gx and gy-gx-gz)
  all land on the identical 4 bytes; earlier waves recorded 36 further
  rotation/lifetime variants plus a four-way register-copy family search with
  no improvement (`targets/game/reverse/re_attempts.log` lines 39483, 45626,
  46615, 46627, 50808; bank score 0.9953).
- The dump body is byte-identical to retail outside its relocation slots; 23
  symbolic references, all already declared by the gen-dump file and resolved
  by existing functions.csv rows or symbols.csv pins.

## Why not inline asm

`docs/conversion_gate` blocks `__asm`/`__emit`/`__declspec(naked)` outside
`game/masm_dumps/*.asm`; the banked C++ above is the best non-dump artifact and
is retained for any future allocator work.
