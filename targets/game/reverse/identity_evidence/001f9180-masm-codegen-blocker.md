# 0x001F9180 bone-record method -- MASM landing with a measured codegen blocker

Target: RVA 0x001F9180..0x001F92D6, 342 bytes, name `?Rva001F9180@@YAXXZ`
(address-derived placeholder). The body is reached through ILT 0x0003BFF7;
both decoded callers pass a Coord3D output and test AL, and the module pointer
comes from DynamicPortalBehaviour's module list, so no real name is provable
and the name stays address-derived. Source:
`game/masm_dumps/Rva001F9180BoneRecordMethod.asm`, derived from the gen-dump
row `?d_001f9180@@YAXXZ` in `game/gen_asm/d_001f11e0.asm`.

## Body and ABI (first-hand)

- `__thiscall` bool method taking a Coord3D* out (`ret 4`). SEH frame
  (`push -1; push 0x0100B066`), `sub esp,0xCC`. Reads the record selector at
  this+0xC8 and the 8-byte-record array base at this+0xA8, bounds it against
  (this+0xAC - this+0xA8) >> 3 and walks base[selector]; with a live out
  pointer it stores the three words and returns AL.
- Calls resolve through ILT thunks: 0x009F6EE4 (`??_L`, eh vector ctor
  iterator), 0x000107AD, 0x0003CE25 and 0x009F6D76 (`??_M`, eh vector dtor
  iterator); the 0x3CE25 thunk routes to the Pathfinder predicate body, so the
  dump avoids the class-key question below. The two temporary-array pushes
reference the recorded folded names `??0Coord3D@@QAE@XZ` (0x00416C93) and
`??1Coord3D@@QAE@XZ` (0x0041364C), matching the bank's `Coord3D
positions[16]` temporary (element size 0xC, count 0x10).

## Why this lands as a MASM dump (measured)

- The reconstructible C++ body (`targets/game/reverse/attempts/0x001f9180.cpp`,
  sha256 a056d84b6f1c769831b4b94fd0a5539b861a5453aa23c727593342bdd6f7a97a)
  compiles to exactly 342 bytes with 13 relocations and shape 1.000. Its
  entire residue is three bytes at +0x00B6, +0x00BC and +0x00C2: retail
  `mov ecx,[esi+0xC8]; mov eax,[esi+0xA8]; lea eax,[eax+ecx*8]` (selector
  loaded first); VC7.1 canonicalises the base[index] address to the opposite
  roles (`mov ecx,[esi+0xA8]; mov eax,[esi+0xC8]; lea eax,[ecx+eax*8]`).
- 30+ measured spellings: `p[i]`, `*(p+i)`, `i[p]`, unsigned pointer-as-
  integer addition, explicit char* scaling, typed alias, record pointer/value,
  member accessor, count reference and count accessor, index/base locals in
  both declaration orders (332-345 bytes), `_ReadWriteBarrier` before the
  loads (flips the load order to 0xC8-in-EAX but keeps the opposite SIB
  roles). Scratch bodies: `build/t2/*.cpp`. This is the SIB-order family that
  `docs/shape_levers.md` records as exhausted, and the roles are the retail
  address expression's, not a constraint any C++ spelling can impose on
  VC7.1.
- The C++ lane is additionally blocked on identity: the class-key call
  `?bfmeGroundCellThreshold@Pathfinder@@QAE_NPBVCoord3D@@_N@Z` does not
  resolve against the landed struct-key pin
  (`...Pathfinder@@QAE_NPBUCoord3D@@_N@Z`) at 0x003D8BC0; the dump's ILT call
  (thunk 0x0003CE25, `?j_0003ce25@@YAXXZ`) does not commit to either key.
- The dump body is byte-identical to retail outside its relocation slots;
  `Vc7/bin/ml.exe` assembles the file clean (verified this session) and the
  add_match `./build.sh` gate compares it against retail with all 13
  relocation sites resolved or masked.
