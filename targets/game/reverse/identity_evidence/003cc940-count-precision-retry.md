# RVA 003CC940 count precision retry

## Result and retained body

No source recovery was achieved. The preferred bank remains byte-for-byte unchanged at targets/game/reverse/attempts/0x003cc940.cpp. The initial probe reproduces its recorded measurement. All new shapes either worsen the measurement or reproduce that instruction stream. The single verdict for this run is blocked because the proposed retry levers were refuted by compiler experiments; the earlier partial bank remains available.

The tested revision is ca266c53563d96c7f453009f87737c28904c7c92 and the actual model is gpt-6.1-sol. Reproduce with python tools/probe.py targets/game/reverse/attempts/0x003cc940.cpp "?method@Rva003CC940@@QAE?AURva003CC940Point@@XZ" 0x003CC940 --size 437 --all --shape. The initial immutable source is build/cc940-worker/000-bank.cpp. All trial sources and unedited probe output remain under build/cc940-worker/; generated source snapshots and their manifest remain in the shape_search directory named by build/cc940-worker/family-search-location.txt.

## New context and hypotheses

The neighboring landed source declarations were inspected directly: Rva003CC780RecordCopyConstructor.cpp, Rva003CC890AudioRelease.cpp and Y1EightSlotRefCounts.cpp. They confirm the eight pointer slots at receiver +0x10 through +0x2C and reference-count byte +0x38. They provide no new declaration or lifetime evidence that resolves the previous X accumulator blocker. Rva003CC780Record uses an unsigned 32-bit view at +0x30, while the target reads that offset with signed FILD and its complete caller compares it with JL; the bank's signed address-qualified view is retained. No shared header was edited.

The currently landed getHeightMapHeight body at RVA 006CBB50 supplies independently decoded evidence for the terrain float arguments, normal output and return width. Its source was read, rather than treating its name or opaque forwarder donor as type proof. This strengthens the indirect-call ABI evidence without resolving the earlier x87 ordering mismatch. No LargeGroupAudio source twin was found in the inspected Zero Hour tree. The EA chain label remains a naming lead; no inherited bank name was changed and no semantic owner is claimed.

The new precision hypothesis follows retail's first count conversion: FILD produces an extended value, FST writes a four-byte temporary, and FLD reloads its rounded copy. At the next neighbor, retail's FADDP ST(3) updates the extended weight and FSUBP ST(1) updates the rounded offset. The bank's FADDP ST(2) and FSUBP ST(2) update the opposite stack positions. An explicit distinction between conversion precision and rounded-copy lifetime was predicted to correct that first operand divergence. The refutation condition was an unchanged first divergence or a worse full-body measurement. The distinct conversion and conditional-lifetime trials both worsened the body.

The slot-base hypothesis came from the landed Y1EightSlotRefCounts source, whose two matching bodies bind their slot array before accessing it. A local slot base and individual node locals were measured here; neither improved the saved body. The slot-base shape repeats the earlier worse copy-family outcome, so that family remains closed. A double final division and double second-count conversion were separate precision probes; both were worse. Changing the diagonal temporary to double follows the observed double product, but emitted additional stack exchanges and was also worse.

An inline second-neighbor numerical update was tested as a source-lifetime lever; it removed a receiver copy without fixing the X operand order. The finite register/store/frame generator supplied exactly one independent store-order choice; shape_search exhausted its baseline and swapped-store variants with STOP_WORKER checked by the evaluator before each compile. Both source snapshots and both unedited probes were retained. The copy-constructor assignment body and implicit count conversions independently reproduced the saved stream. These are the two unchanged new x87 experiments permitted by the assignment, so no further unchanged iteration was started. Previously rejected accumulator, grouped-declaration, pair-storage, normalized-fraction and getter families were not reopened.

## Complete boundaries, control flow and ABI

build/cc940-worker/complete-decode.log contains every instruction in the target, both actual callers, the terrain forwarder, both vtable-installing constructors and the complete height implementation. build/cc940-worker/cfg-audit.json records every return and branch, including the forwarder's indirect tail jump. The required checked_callees output for each of the seven extents is retained as build/cc940-worker/checked-<rva>.log. Eligibility was queried through tools/eligibility.py and its target-only result is build/cc940-worker/eligibility.json.

The target's only return is RET 4 at +0x1B2, ending its 437-byte body before INT3 padding. Every conditional branch and direct jump stays inside the extent and lands on a decoded instruction. It has no exception-registration sequence, constructor, container allocation or value-copy helper. No unwind ownership or STL payload inference is needed for this body.

ILT RVA 0004327F decodes to JMP 003CC940. The complete 400-byte caller at 003CCB70 pushes its 12-byte output local at +0x16 and calls at +0x17 with the original receiver still in ECX. The complete 1465-byte caller at 003D1A60 loads ECX from [EBP], pushes another coordinate local and calls the same ILT at +0x3D0. The returned storage has three four-byte components. The target returns its output pointer in EAX, consumes one stack slot, and applies no receiver adjustment. The address-qualified three-float return view models this observed ABI; it does not identify the original source result type.

Every node payload access in the target is a signed four-byte FILD from +0x30. The complete second caller also performs a signed comparison at that offset. The receiver reads floating coordinate words at +0 and +4, a configuration pointer at +8, its float at +0x0C, and eight nullable links. Unaccessed node and configuration fields are padding views, without inferred ownership or value-type claims.

The target's only indirect call at +0x198 pushes null normal, Y float bits and X float bits, uses unadjusted TheTerrainLogic, and consumes ST(0) as a float. The complete terrain constructor installs primary table VA 0111D090. Its +0x18 entry is ILT RVA 000445CB, which decodes to JMP 006BE250. The complete forwarder defaults the three normal fields and either returns with RET 12 or tail-jumps to the render object's +0x248 slot without changing the stack argument widths. The complete render constructor installs table VA 0111D8B8, whose +0x248 entry is ILT RVA 0003065C, decoding to JMP 006CBB50. The complete height implementation reads both scalar arguments with four-byte FLD instructions and its three return paths use RET 12. Vtable bytes and all three thunks are retained in complete-decode.log. The constructors are used solely as table-installation evidence, without a claim about their member ownership or unwind cleanup.

The canonical TerrainLogic declaration and Zero Hour declaration both specify getGroundHeight(float, float, Coord3D *) const. Zero Hour BaseType.h defines Coord3D as three floats. The bank retains the canonical TerrainLogic singleton declaration and an address-qualified const virtual view. The observed constant bytes are also retained in complete-decode.log: the float one-third, float zero and double square-root-of-one-half correspond to the bank's plain literals. No global address literal, symbol pin, table or ledger entry was added.

## Measurements and unresolved bytes

The following table is generated from build/cc940-worker/measurements.json. Differences are the probe's non-relocation byte count at the explicitly decoded retail extent. The quality uses tools/finish_measure.py's formula, including twice the size error; relocation-layout drift makes these diagnostic figures rather than acceptance evidence.

| Trial | Emitted bytes | Differences | First difference | Measured quality |
|---|---:|---:|---:|---:|
| 000-bank | 439 | 106 | +0x5C | 0.7483 |
| 001-distinct-conversion | 439 | 359 | +0x27 | 0.1693 |
| 002-conditional-lifetime | 421 | 340 | +0x2 | 0.1487 |
| 003-slot-base | 437 | 236 | +0x3D | 0.4600 |
| 004-local-nodes | 435 | 319 | +0x3D | 0.2609 |
| 006-double-final-division | 439 | 108 | +0x5C | 0.7437 |
| 007-double-second-conversion | 441 | 305 | +0x55 | 0.2838 |
| 008-copy-assignment-body | 439 | 106 | +0x5C | 0.7483 |
| 009-inline-second-update | 437 | 212 | +0x5C | 0.5149 |
| 010-double-diagonal-temporary | 459 | 244 | +0x5C | 0.3410 |
| 011-family-0 | 439 | 106 | +0x5C | 0.7483 |
| 011-family-1 | 439 | 112 | +0x4 | 0.7346 |
| 012-split-count-guards | 436 | 365 | +0x27 | 0.1602 |
| 015-implicit-count-conversions | 439 | 106 | +0x5C | 0.7483 |

The retained bank still reverses the X accumulator stack operands beginning at +0x5C. That reversal propagates through the diagonal accumulations and X-weight comparison. The extra FXCH ST(1) at candidate +0x14D displaces the later Y arithmetic and terrain dispatch by two bytes. The const dispatch view also exchanges EAX and EDX in the argument and vtable loads. The exact differing byte offsets and raw object/retail values are retained in build/cc940-worker/mismatch-offsets.json, together with the relocation list and a layout-drift limitation. The corresponding raw bytes are bank-object-bytes.bin and retail.bin in the same directory. The initial probe remains in build/cc940-worker/000-bank-probe.log; the full resolved comparison is build/cc940-worker/scoped-byte-gate.log. The gate fails for this candidate itself, rather than an unrelated dependency.

Reopening requires independent native lifetime or representation evidence that predicts the correct X stack allocation and preserves the first-count conversion sequence, followed by a measured improvement over this bank. The tested precision casts, conditional lifetime, slot base, node locals, inline update, result-copy spelling, store swap and implicit conversions do not justify another identical retry. Unknown semantic identity remains address-derived and is not the blocker. The exact recovery is blocked by float/x87-accumulator-order.

## Verification and preservation

The scoped gate invokes the repository's build.verify_functions on the retained bank at the proven extent, without modifying the ledger. It fails Functions: FAIL 1/1. No conversion was attempted and no full gate is required for an evidence-only change. The initial ledger check, pin consistency and class gate pass. Their raw outputs are build/cc940-worker/check-csv-initial.log, build/cc940-worker/pin-consistency.log and build/cc940-worker/class-gate.log. The final ledger check is build/cc940-worker/check-csv-final.log. The source naming comparison is build/cc940-worker/name-regression-source.log and the unchanged-bank hash is build/cc940-worker/bank-preservation.json.

No Git write, synchronization command, shared policy edit or tooling edit was performed. No background job remains from these experiments. The preserved build evidence remains available for collection; it was not deleted because the coordinator requires the uncollected sources and raw logs.
