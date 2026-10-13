# 0x008BE760 bank class rename: Detail008BE760 -> Rva008BD2B0

The kind-13 record the 0x008BE760 body constructs is the vptr-only derived object whose
out-of-line constructor is `??0Rva008BD2B0@@QAE@XZ`, the matched ledger row at 0x008BD2B0
(`game/GameEngine/Source/Common/MidVptrOnlyDerivedCtors.cpp`), and whose vftable
`??_7Rva008BD2B0@@6B@` is recorded at 0x01136DD0 in `targets/game/reverse/dir32_addresses.csv`.

The landed translation unit must spell the class with the recorded address-derived name
`Rva008BD2B0` so the emitted vftable relocation resolves against the ledger and the body
re-probes byte-exact. The bank's speculative label `Detail008BE760` describes the same
entity but has no ledger backing, so it is withdrawn in the landing rename.
