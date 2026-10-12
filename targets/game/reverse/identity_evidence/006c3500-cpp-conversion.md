# 0x006C3500 Rva006C3500W3DRadar::method -- byte-exact C++ conversion

Target: RVA 0x006C3500..0x006C38D4, 980 bytes, converted from the gen-dump row
`?d_006c3500@@YAXXZ` (source `game/gen_asm/d_006c0fa0.asm`).
Landed source: `game/Libraries/Source/WWVegas/WW3D2/Rva006C3500W3DRadarShroudCopy.cpp`
at the address-derived name `?method@Rva006C3500W3DRadar@@UAEXXZ`.

Boundary, receiver, vtable and callee identity evidence are in the companion
file `identity_evidence/006c3500-native-accessor.md`: sole normal return at
+0x3A1, the cold no-match clear block rejoining the unlock path at +0x2B2,
constructor 0x006C1D70 installing vtable 0x0111D7B4 whose slot-8 ILT
0x00004E08 jumps here without adjusting ECX. No official class name is proven,
so the opaque address-derived identity is kept (docs/naming_evidence.md).

## Residual resolved by this conversion

Every earlier wave stalled on the same measured residue: ten non-relocation
bytes at +0x11B +0x12E +0x13C +0x140 +0x233 +0x237 +0x23B +0x245 +0x24F
+0x3A5, a pure exchange of the two `SurfaceClass::SurfaceDescription` stack
slots (24-byte region at [esp+0x44]..[esp+0x5C]; retail pairs destination low
and source high, the bank paired them the other way). Declaration-order swaps
and a struct-of-references variant did not move the pairing.

Two levers made the body exact:

1. The two descriptors are one aggregate declared destination-then-source,
   accessed directly (no reference aliases):
   `struct SurfaceDescriptionPair { SurfaceDescription destination;
   SurfaceDescription source; };` -- member offsets then force retail's
   pairing: destination at [esp+0x44], source at [esp+0x50], while the calls
   keep their retail order (source's Get_Description first, receiver at
   [esp+0x18]). A same-shape variant with reference aliases perturbed the
   addressing (978 B, 105 diffs).
2. The row-copy size multiplies the destination descriptor's Width:
   retail +0x284 is `imul ecx, [esp+0x48]` ([esp+0x48] = destination.Width),
   reproduced by `memcpy(destinationBits, sourceBits, bytesPerPixel *
   descriptions.destination.Width)`. The equal-width guard immediately above
   (`+0x230` source.Width vs destination.Width) makes the spelling safe.

## Verification (2026-10-13, this worktree)

- `python3 tools/probe.py game/Libraries/Source/WWVegas/WW3D2/Rva006C3500W3DRadarShroudCopy.cpp "?method@Rva006C3500W3DRadar@@UAEXXZ" 0x006C3500`
  -> `size ours=980 retail=980 relocs=42`, `result EXACT (modulo relocation slots)`.
- `python3 tools/add_match.py '?method@Rva006C3500W3DRadar@@UAEXXZ' 0x006C3500 980 game/Libraries/Source/WWVegas/WW3D2/Rva006C3500W3DRadarShroudCopy.cpp --replace-rva 0x006C3500 --model inconnu`
  -> `Source claims: OK`, `Functions: OK 1/1 matched`,
  `String-ref verify: OK (5 literals)`,
  `DIR32 addresses: OK (10 reference(s) checked against 17356 recorded symbols)`,
  `Body guard: OK`, `add_match: verified OK — row is live`; the gen-dump row
  was replaced and the banked attempt cleared.
- `./build.sh game/Libraries/Source/WWVegas/WW3D2/Rva006C3500W3DRadarShroudCopy.cpp`
  re-run after landing -> `Functions: OK 1/1 matched`.
- `python3 tools/class_gate.py <file>` and `python3 tools/pin_consistency.py --check`: pass.

No pin was added: no `call ?d_006c3500@@YAXXZ` site exists in
`game/gen_asm/` or `game/gen_small/` (the only reference to the old name was
its own definition row), and the ILT thunk `?j_00004e08` targets 0x006C3500 by
address, which the repointed row preserves.
