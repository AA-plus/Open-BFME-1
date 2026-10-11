# RVA 0x007921E0: exact highlight-helper bank

Seat C3, gpt-6.1-sol, 2026-10-11. This is a banked candidate, not a conversion.

The retail body starts at Ghidra function 0x007921E0 and ends at the RET at
offset 0x124, followed by INT3: 293 bytes. The neighboring 1,388-byte body at
0x00792350 calls it with three register arguments and four stack arguments.
The EA `W3DListBox.cpp` helper `drawHiliteBar` supplies the image-width loop,
clip-region setup and two end-image draws. Retail omits the donor's additional
small-center loop. No named ledger caller reaches this helper directly.

Fresh preferred-bank probe: 293 bytes, five aligned relocations, one differing
SIB byte at offset 0xFC. Giving all local coordinate values an empty default
constructor fixes that byte and reproduces all 293 bytes outside relocation
operands. Giving only `barWindowSize` a constructor leaves the one difference.

Raw probes are in `build/c3_007921e0/{bank,coord_ctor,size_ctor}.log`.
The constructor is a measured lifetime/codegen lever; it does not prove EA's
coordinate declaration. The bank retains its existing synthetic call site to
extract the compiler's private ABI. That call site is not production evidence.

Native `WWMath/icoord.h` adoption with visible native constructor and assignment
bodies emits 282 bytes with 247 differences and five shifted relocations.
The real-home scratch, retaining its real caller and omitting only the
small-center loop, emits 287 bytes. Scoped coordinate lifetime classes fix
the SIB there, but the native Display declaration calls `setClipRegion` at
slot 0x68 and `enableClipping` at slot 0x70; retail calls slots 0x88 and 0x90.
These two six-byte retail calls become three-byte calls with the donor slots.
Raw probes: `home_without_small.log`, `home_ctor.log`, `native_coord.log`.

The unchanged home TU passes `link_check.py`: LINKED 1,237 -> 1,237 bytes.
No game source, ledger row, header or pin was changed. Promotion needs a
complete canonical Display virtual contract, coordinate-type integration,
and the actual caller context. C3 appended one class-contract question to the
fleet owner queue; no shadow Display view was introduced in production.
