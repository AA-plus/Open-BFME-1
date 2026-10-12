# 0x002A1F80 RespawnUpdate level-apply -- MASM landing, address-derived name, measured call-setup blocker

Target: RVA 0x002A1F80..0x002A2168, 489 bytes, name
`?rva002A1F80@RespawnUpdate@@QAEXPAVObject@@@Z` (address-derived, intentionally
opaque result type; see Identity).
Source: `game/masm_dumps/Rva002A1F80RespawnUpdateApply.asm`, derived from the
gen-dump row `?d_002a1f80@@YAXXZ` in `game/gen_asm/d_0029c7b0.asm`.

## Identity (why the name keeps the address)

- The incremental-link thunk for this body is slot 59785 (thunk RVA 0x00049FB2,
  ledger row `?j_00049fb2@@YAXXZ`, notes `target=FUN_006a1f80`); its jmp target
  decodes to 0x002A1F80 in the retail image.
- EA's WorldBuilder map (`targets/game/reverse/ea_evidence.csv` lines 8102-8103)
  attributes the address to `GameEngine/Source/GameLogic/Object/Update/
  RespawnUpdate.cpp` and names it `RespawnUpdate::triggerRevival` (wb2, direct,
  aligned). The file attribution matches the neighbourhood (0x2A1BD0, 0x2A1C20,
  0x2A1D40, 0x2A1DA0, 0x2A21F0, 0x2A23B0 are all RespawnUpdate.cpp).
- But `tools/ilt_oracle.py check '?triggerRevival@RespawnUpdate@@QAEXPAVObject@@@Z'
  0x002A1F80` = CONTRADICTED (slot 59785, window 37006-37013), and a sweep of
  700 natural decorated variants (access Q/U/A/I/E/M/W, const, static SA,
  returns X/_N/H/I/M, parameters Object*, const Object*, Object&, plus extras)
  produced no fit except one float-return spelling, which is a semantically
  impossible false positive (~0.15 expected false fits over the sweep). The
  anchor check next door is healthy: `??0RespawnUpdate@@QAE@PAVThing@@
  PBVModuleData@@@Z` at 0x002A1510 = CONFIRMED (exact). So the real name is
  most likely not a natural triggerRevival spelling and `tools/ilt_guard.py`
  would refuse it; per `docs/naming_evidence.md` an unproven identity gets a
  floor name carrying the address, in the same style as the landed
  `?rva002A21F0@RespawnUpdate@@QAEXXZ` neighbour row.
- Body shape corroborates the RespawnUpdate level-apply role (EH-free frame,
  `ret 4` thiscall): model-condition bitset clear, FXList apply guarded by
  `isBlocked`, wake-frame at the level record's delay, control-bar dirty flag.

## Complete body and boundary

- `ret 4` ends the body at +0x1E6..+0x1E8 (`c2 04 00`); INT3 padding starts at
  +0x1E9 (RVA 0x002A2169). Ghidra boundary FUN_006a1f80 from the gen dump
  agrees with the ledger row size 489.

## Why this lands as a MASM dump (measured)

- The reconstructible C++ body (`targets/game/reverse/attempts/0x002a1f80.cpp`,
  bank score 0.9939, cleared by the landing) compiles with `tools/probe.py` to
  exactly 489 bytes and 13 relocations with shape 0.994. Three non-relocation
  bytes at +0xED refuse every equivalent spelling:

      retail: 6a 00 / 8b cb / 57 / e8 ..   (push 0, mov ecx,ebx, push edi, call)
      ours:   6a 00 / 57 / 8b cb / e8 ..   (push 0, push edi, mov ecx,ebx, call)

  Only the order of the receiver load `mov ecx, ebx` and the last argument push
  `push edi` differs; everything else matches, including the guarded
  `bfmeIsBlocked` call above and the whole body below.
- Measured spellings: 26 before 2026-10-13 recorded in re_attempts.log (lines
  45363, 45376, 46002, 46350, 46364, 46377, 47881, 48626, 49501, 50328, 52268,
  57836 -- guard shapes, local order, receiver copies, static wrappers, named
  arguments, 18 single and 168 paired source toggles, member-pointer and
  fastcall experiments) plus 13 on 2026-10-13 (nested `if`, bool local, one-case
  `switch`, braced body, `(Object*)0` and `(const Object*)0` null casts, object
  and const-object locals, member-wrapper call form, non-const callee
  declaration, and the shape_levers row-3/row-4 local-definition swaps). Every
  run lands on the identical three bytes (or grows the body when the control
  shape changes).
- `docs/shape_levers.md` records the same adjacent `mov ecx` / `push` order on
  a secondary receiver at 0x0024ECA0 ("Both local-alias orders and the fastcall
  table trial failed; /Oi, /Ot, virtual-base and pragma-off trials did not
  match"), so this is the documented VC7.1 scheduling family, not a missing
  source shape.
- The dump body is byte-identical to retail outside its relocation slots: 13
  relocations = 10 call sites to seven ILT thunks (0x95ed x2, 0x11f77, 0x157da
  x2, 0x20824, 0x22bba, 0x23d4e, 0x3994b x2) plus 3 DIR32 data sites
  (`?g_bfmeScaleBC@@3MA`, `?PlayerList005999B0@@3PAUPlayers005999B0@@A`,
  `?TheControlBar@@3PAURva002AD380ControlBar@@A`), all declared as EXTERNs and
  resolved by existing pins (DIR32 check: OK, 3 references).

## Why not inline asm

`docs/conversion_gate` blocks `__asm`/`__emit`/`__declspec(naked)` outside
`game/masm_dumps/*.asm`; the banked C++ remains in attempt_history for future
allocator work.
