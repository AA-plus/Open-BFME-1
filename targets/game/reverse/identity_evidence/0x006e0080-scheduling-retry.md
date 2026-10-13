# 0x006E0080 scheduling retry

## Result and reopening condition

The existing 986-byte reconstruction remains a partial. Both the reproduced probe and the scoped strict gate report fourteen differing byte positions: +0x1EB through +0x1EF, +0x1FD through +0x201, and +0x34A through +0x34D. No tested candidate improved the bank, so its source and score label are unchanged. No function was converted and no bytes were landed.

Reopening needs a concrete source structure that changes the completion comparison interleaving or the final position load while retaining the rest of the decoded stream. The tested lifetime, native math, alias, copy, switch and compile-mode alternatives below provide no such improvement. The residue does not prove that assembly is necessary. Original owner and guarded-static class identities remain unknown; the address-derived owner and decoded compatible storage views are retained.

The tested revision is 02f7597a2ef4c238a7ec8f3baba40e91d5136eac. The model is gpt-6.1-sol. Raw authoritative failure: build/worker-006e0080-retry/target-strict-gate.log. The probe reports a 1008-byte object section, including two alignment bytes and the separately located twenty-byte switch table after the 986-byte executable body. Its relocation-layout warning is consistent with the moved comparison operand; the difference count is the existing gate measurement, not a certification of all DIR32 bindings.

## Located residue

At +0x1EB, retail executes fcomp against the verified 1.0f constant before storing position X from EAX. The candidate stores X first. Retail subsequently executes fnstsw ax before storing position Z from EDX; the candidate stores Z first. The X store must precede fnstsw because that instruction overwrites AX. The compare, Y copy, Z load and Z store otherwise have the same operands. At +0x34A, retail loads receiver+0x30 into the FPU before popping EDI, whereas the candidate pops EDI before that load. The later arithmetic and return cleanup agree. Complete raw comparison: build/worker-006e0080-retry/baseline-probe.log.

## Boundary, ABI and declaration evidence

The target ends at RVA 0x006E045A. All six return paths clean twelve bytes. All immediate branches land on internal instruction boundaries, and the five table entries at RVA 0x006E045C reach the five internal case starts. The complete 3400-byte caller reaches the target through the decoded five-byte ILT at RVA 0x000273DB. It restores its original receiver from its saved frame slot at RVA 0x006E0DEB, then places that receiver in ECX at the target call. Its pushes provide context, target and position in reverse argument order; the two twelve-byte coordinate records occupy distinct caller stack ranges. It consumes no return value. This supports the retained void thiscall method with three pointer parameters and no hidden return storage.

Both actual REL32 routes were decoded completely. RVA 0x0004B01A jumps to the complete ninety-byte StringBase<char>::compare body at RVA 0x000A2BB0. It reads a sixteen-bit string length, compares byte characters and returns a signed dword result with ret 4. RVA 0x0001F253 jumps to the complete 82-byte GameLogic lookup at RVA 0x0009A510. The lookup reads bucket pointers at receiver+0xB4 and receiver+0xB8, the next pointer at node+0, a complete dword equality key at node+4 and the returned pointer at node+8. It contains no memory writes, allocation, value constructor, copy helper or cleanup. The canonical GameLogicObjectLookup.h was inspected directly, and its emitted helper passes the complete strict gate independently. No type was inferred from allocation size or a donor label. All five target REL32 calls resolve with no missing pin.

The indirect call was checked independently through the established W3DView vtable at VA 0x011217A0. Slot +0x164 contains VA 0x00425194, whose complete jump reaches the complete 787-byte screenToTerrain body at RVA 0x00746420. Its three parameters are the screen pair pointer, the world coordinate pointer and the Boolean flag; all three return paths use ret 12, and its result is in AL. The caller passes zero for the flag and ignores the result. Signed divide-by-two instructions witness the four-byte dimensions. Returned object coordinates are read as dword floats at object+0x38, +0x3C and +0x40. Owner tracks occupy +0x30 and +0x3C, state occupies +0x2C, and the context fields remain at their decoded offsets.

There is no target EH frame or owning local destructor. The guarded statics use inspected native empty Vector3 constructors as compatible twelve-byte storage; their original class identities are unproved. Canonical Coord3D, AsciiString and lookup declarations are retained. Full decoded bodies: build/worker-006e0080-retry/decoded.log. Independent assertions and exact constant bytes: build/worker-006e0080-retry/abi-audit.log. Checked inventories: build/worker-006e0080-retry/checked-target.log, checked-caller.log, checked-compare.log, checked-lookup.log and checked-screen.log. Independently resolved vtable: build/worker-006e0080-retry/vtable-lookup.log.

## Rejected experiments

The retry tested actual coordinate lifetime and alias information. Specifications record the source hypotheses; unchanged or worsened complete streams reject those candidates. Every attempted source and unedited probe output is retained under build/worker-006e0080-retry/. The table is generated from build/worker-006e0080-retry/measurements.jsonl; object lengths include section tails, and non-relocation counts are lower bounds when extents differ. The copy-family generator found no applicable additional source choice; raw output: build/worker-006e0080-retry/copy-family-generator.log. The earlier store-family search was not repeated.

| Trial | Object bytes | Non-relocation differences | Raw probe |
|---|---:|---:|---|
| restricted-output-pointers | Compile failed | Not measured | build/worker-006e0080-retry/restricted-output-pointers-probe.log |
| scalar-coordinate-copy-setter | 1008 | 81 | build/worker-006e0080-retry/scalar-coordinate-copy-setter-probe.log |
| shared-object-coordinate-lifetime | 1008 | 14 | build/worker-006e0080-retry/shared-object-coordinate-lifetime-probe.log |
| copy-with-value-completion-predicate | 1008 | 14 | build/worker-006e0080-retry/copy-with-value-completion-predicate-probe.log |
| alias-analysis-flag | 996 | 535 | build/worker-006e0080-retry/alias-analysis-flag-probe.log |
| float-consistency-flag | 1016 | 591 | build/worker-006e0080-retry/float-consistency-flag-probe.log |
| native-local-vector-construction | 1008 | 14 | build/worker-006e0080-retry/native-local-vector-construction-probe.log |
| native-vector-lerp-after-object-interpolation | 1008 | 14 | build/worker-006e0080-retry/native-vector-lerp-after-object-interpolation-probe.log |
| function-static-blend-lifetimes | 1008 | 14 | build/worker-006e0080-retry/function-static-blend-lifetimes-probe.log |
| position-reference-temporary | 1008 | 14 | build/worker-006e0080-retry/position-reference-temporary-probe.log |
| native-world-output-lifetime | 1008 | 14 | build/worker-006e0080-retry/native-world-output-lifetime-probe.log |
| empty-screen-record-constructor | 1008 | 14 | build/worker-006e0080-retry/empty-screen-record-constructor-probe.log |
| complete-case-inline-boundaries | 1008 | 14 | build/worker-006e0080-retry/complete-case-inline-boundaries-probe.log |
| switch-arm-source-order | 1000 | 415 | build/worker-006e0080-retry/switch-arm-source-order-probe.log |
| common-position-copy-after-transition | 1000 | 427 | build/worker-006e0080-retry/common-position-copy-after-transition-probe.log |
| target-output-inner-lifetime | 1008 | 14 | build/worker-006e0080-retry/target-output-inner-lifetime-probe.log |
| size-optimization-preference | 882 | 665 | build/worker-006e0080-retry/size-optimization-preference-probe.log |
| local-versus-global-optimization | 1287 | 758 | build/worker-006e0080-retry/local-versus-global-optimization-probe.log |
| adjacent-blend-record-storage | 1008 | 14 | build/worker-006e0080-retry/adjacent-blend-record-storage-probe.log |
| captured-object-position-components | 1008 | 14 | build/worker-006e0080-retry/captured-object-position-components-probe.log |
| by-value-position-copy-helper | 1032 | 393 | build/worker-006e0080-retry/by-value-position-copy-helper-probe.log |
| intrinsic-coordinate-bit-copy | 1012 | 386 | build/worker-006e0080-retry/intrinsic-coordinate-bit-copy-probe.log |

The restricted-pointer trial cannot compile because this MSVC 7.1 product does not support __restrict. It establishes no byte result. Scalar setters introduce x87 loads and stores in the copied position. By-value and memcpy copies introduce an extra address materialization and change the full extent. Moving the common copy after the transition rotates the previously correct saved registers. Exchanging switch arm source order changes float retention and block offsets. /Oa changes reloads and register choice; /Op changes float consistency and extent; /Os and /Og- rewrite the prologue and other operations. The retained lifetime and native helper alternatives leave the same residue. These are refutations of the tested source shapes, not proof that the routine is exhausted under every possible C++ spelling.

## Checks and preservation

Passing checks: the complete lookup strict gate, class gate, pin consistency and check_csv. Raw outputs: build/worker-006e0080-retry/lookup-strict-gate.log, class-gate.log, pin-consistency.log and check-csv.log. The target strict gate fails on the located bytes. The source-ownership check reports zero ledger rows for the existing bank and exits nonzero, which is expected for an attempt source rather than a proposed game source; no whitelist was changed. Raw output: build/worker-006e0080-retry/declared-unmatched.log. Target DIR32 validation after the failed byte comparison remains uncertified. No shared source, header, pin, policy, tooling or baseline was changed, so no full gate was required.

The original bank is retained byte-for-byte in build/worker-006e0080-retry/baseline-bank.cpp and remains at targets/game/reverse/attempts/0x006e0080.cpp. Its SHA-256 is 57cbfc940f55c3335f1c14cdb63cae137e524df9ed477625da655bbe7dc94e85. There was no closer candidate to re-bank. Git was read-only throughout; no commit or synchronization occurred. All worker-started check processes were polled to completion.
