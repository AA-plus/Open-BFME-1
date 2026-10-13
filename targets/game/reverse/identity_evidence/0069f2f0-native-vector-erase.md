# Audio entry removal at 0069F2F0

The complete body is144 bytes, with RET4 at+0x8D. Its ECX receiver has
six12-byte vectors beginning at+0x4C. Each element is8 bytes; the comparison
reads its second word, and erasure shifts both words and subtracts8 from end.
Matched006A8120 and the existing006a8120-element-contracts packet establish
native STLport vector layout and the two-word element-copy contract.

The existing bank identity `Rva00699180Owner::removeByKey(unsigned int)`
is retained; it is an opaque address-derived owner, not a retail spelling claim.
The explicit integer-RVA oracle check reports tier=placeholder and CONTRADICTED;
that diagnostic is exempt under the existing real-name-only guard. No rename,
new pin, or semantic alias is introduced.

The preferred bank reproduced144 bytes with87 non-relocation differences.
Native vector::erase alone produced148 bytes with68 differences. The target
keeps ECX across its two helpers; their actual implementations at00699430
and00699180 also preserve ECX. Placing the native erase body in their existing
Rva00699180Volume.cpp translation unit produced all144 bytes and two call
relocations. Calls use the existing canonical productClamp owner and refreshPair
identities, rather than the bank's unbound productClamp declaration.

The existing direct includer Rva00699B40RefreshChannel.cpp needed the same
STLport marker and static-library compile option. Round39's compiler failure
is preserved in build/worker5-round39/dependent.log and preserved.patch;
round40 explicitly authorized this build-configuration repair. The unchanged
header_dependents inventory finds only that includer. Strict checks pass all
six target-TU rows and all three includer rows, including11 and6 DIR32 references
respectively. No header, verifier, baseline, or generator file changes.
