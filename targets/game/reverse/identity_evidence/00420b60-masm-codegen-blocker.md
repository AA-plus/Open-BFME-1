# 0x00420B60 Drawable::calcPhysicsXformThrust -- MASM landing with a measured codegen blocker

Target: RVA 0x00420B60..0x0042126F, 1743 bytes, name `?Rva00420B60@@YAXXZ`
(address-derived placeholder: identity is proven below, but
`targets/game/reverse/symbols.csv` already pins
`?calcPhysicsXformThrust@Drawable@@IAEXPBVLocomotor@@AAUPhysicsXformInfo@1@@Z`
to the ILT slot VA 0x00027651, so this row keeps the placeholder exactly like
the Rva007171F0 precedent). Source:
`game/masm_dumps/Rva00420B60CalcPhysicsXformThrust.asm`, derived from the
gen-dump row `?d_00420b60@@YAXXZ` in `game/gen_asm/d_003fa5b0.asm` lines
981-1092 (that block stays in place).

## Identity (first-hand)

- The matched `calcPhysicsXform` dispatcher at 0x004213F0 routes appearance 4
  (LOCO_THRUST in the Zero Hour enum, jump-table slot 3) through ILT
  0x00027651 (`?j_00027651@@YAXXZ`, row target=FUN_00820b60, jmp rel32 ->
  0x00420B60) to this body.
- symbols.csv line 80728 pins `?calcPhysicsXformThrust@Drawable@@...` to that
  ILT slot with the note "ILT thunk to the thrust physics transform helper".
- Boundary: `ret 8` at +0x6CC (`C2 08 00`), INT3 padding from +0x6CF, so the
  extent is 1743 bytes; carve start was the rel32 call/jmp boundary in the
  ledger row.

## Body and ABI (from decode and the banked C++ shape)

- Drawable member (ECX = this), two stack arguments (`const Locomotor *`,
  `PhysicsXformInfo &`), SEH frame `push -1` + FS cookie,
  `sub esp,0x4C`, saves ebx/ebp/esi/edi. LocomotorTemplate fields are read
  through the getters at +0x2C..+0x104 of the body (accel pitch limit, pitch
  stiffness, roll stiffness, pitch damping, roll damping, uniform axial
  damping).
- Four footprint corners come from a draw-module interface (vtable slot 41,
  +0xA4) or, failing that, `GeometryInfo::get2DBounds` (ledger
  Rva0087E370::method) rotated by the cached orientation angle
  (Drawable+0x44). Four `getLayerHeight` samples (0x452DB0 / 0x452DC0) give
  the pitch spring (`atan2(rear - front, dist)`) and the overlap-Z spring;
  the tail writes `info.m_totalPitch/m_totalRoll/m_totalZ` from the
  locoInfo at Drawable+0x138 (allocated via `new DrawableLocoInfo`, 0x58
  bytes, when null).

## Why this lands as a MASM dump (measured)

- The reconstructible C++ body (`targets/game/reverse/attempts/0x00420b60.cpp`)
  compiles with `tools/probe.py` to exactly 1743 bytes with 36 relocations and
  shape 0.996; its whole residue is 21 non-relocation bytes in two x87
  scheduler spots:
  +0x25E -- retail `fmul st(1)` then `mov ecx,[esp+0x40]`; bank `mov
  ecx,[esp+0x40]` then `fmul st(1)`;
  +0x2A8 -- retail `fld [esp+0x50]; fmul st(1); fld [esp+0x54]; fmul
  [esp+0x6C]` then `mov edx,[esp+0x40]`; bank loads `mov edx,[esp+0x40]`
  first.
  Instruction mix, registers and frame are otherwise identical across all
  1743 bytes - the difference is only where the corner-vector begin-pointer
  load got scheduled relative to the x87 operations.
- Waves measured (stash header plus `targets/game/reverse/re_attempts.log`
  lines 53694-57052): ZH-shaped inline `Overridable::getFinalOverride`;
  front/rear midpoints as two Coord2D locals (which did fix the frame and
  earlier register set); the geometry reference taken into a local before
  get2DBounds; heights summed low index first; operand-order respellings;
  scalar RHS locals for the two stores (1743B/21); grouping each corner
  behind a reference (1731B/1010); /Oa (1611B/1367); volatile `operator[]`
  (1793B/1458); an inline corner-store proxy; splitting both products into
  named Real intermediates (1747B/985); nine bounded shape-search trials
  covering indexed access, begin(), references, scalar temporaries,
  barriers, volatile, and helper calls. Every shape-preserving trial leaves
  the same two scheduler spots, which is the same class of wall as
  0x0048FC90, 0x006A6080 and 0x002A5500.
- The dump body is byte-identical to retail in all 1743 bytes (checked
  first-hand: 0 mismatching bytes). It carries no relocation slots: the
  gen-dump slab encoded every reference literally, and `.asm` files are
  outside the link-debt scanner (SUFFIXES is .cpp/.c/.h/.hpp/.inl), matching
  the Rva009C3630SpreadWmt precedent of a fully literal db dump.
