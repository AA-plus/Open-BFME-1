# Native coordinate retry at 0x0027C250

## Result and retained bodies

No source recovery landed. The tested revision is 575c226488c88f72ccfbe8ccc54983580a4b4e8b. The model is gpt-6.1-sol. The preferred saved body targets/game/reverse/attempts/0x0027c250.cpp remains byte-for-byte unchanged. The table below is generated from unedited probe output with tools/finish_measure.py; build/0027c250-retry/measurements.json contains source hashes and parsed measurements. The useful but worse visible-normalizer alternative is preserved in targets/game/reverse/attempt_history/0x0027c250/2569875f814d8d478a4d0abd1ff9cd180cbbee769769ca8fdad284e0f7a12f1d.json. Its score is measured, not an author estimate. All trial sources and raw logs remain under build/0027c250-retry/. Trial 08 was prepared but not compiled and has no result.

## Hypothesis and refutation

The retry tested whether native coordinate constructors, copy lifetime and inline accessor context explain the integer X/Y copies combined with the x87 Z snapshot at the first divergence. Supporting context was read from the actual neighbouring landed AIUpdate sources, the native WWMath coordinate declarations and implementation, ActionManagerCanDoSpecialPower.cpp and PathfinderValidMovementPosition.cpp. The preceding attempt had already tried local order and angle-helper variants. This run instead changed concrete type and constructor context, then made independently decoded helpers visible. The hypothesis would be refuted if those compiled forms retained the first divergence or scored no better than the saved body. Every measured form met that refutation condition.

The visible noinline movement predicate was independently reproduced as 226 bytes by the probe in build/0027c250-retry/predicate-independent-probe.log, but did not change the target's output. The visible native normalizer was independently reproduced as 79 bytes and passed the strict function, constant, DIR32 and body checks in build/0027c250-retry/scoped-normalize-gate.log. It removed the intermediate scaled X/Y stores after normalization in the caller, but did not repair the earlier coordinate snapshot and worsened the overall measurement. This helper result is a reproduction of an existing recovery, not new recovered progress.

## Boundary, receiver and coordinate evidence

The complete target decode is build/0027c250-retry/0027c250-decoded.txt. All nine return paths use plain RET; the final RET is at +0xA6C, followed by INT3 padding. The saved control-flow audit in build/0027c250-retry/boundary-audits.json records every direct branch within the extent. The checked-callee output is build/0027c250-retry/0027c250-checked-callees.log. The function receives only ECX and returns an EAX update result. No exception registration or unwind machinery appears in this target.

The complete 843-byte caller at 0x0027E5A0 calls the target's ILT at caller +0x129 with ECX adjusted by -0x10 and no stack arguments. The branch then jumps to caller +0x140 and stores EAX in the stack local at [ESP+0x10] before later combining update results. Its current AnimalAIUpdate destructor ledger name is not used as identity evidence because the decoded call and result handling contradict that description. The source identity remains ?method@Rva0027C250@@QAEHXZ; no new class or method identity is asserted.

Canonical Thing and Object declarations were checked against the target's position at +0x38, angle at +0x44, model-condition words from +0x110, containment at +0x1FC, AI at +0x204, physics at +0x208, contained-by at +0x214 and private status at +0x344. The native coordinate header declares three float components, constructors and destructor, while the canonical game include declares a POD. The actual 25-byte copy constructor at 0x0005BC20 reads and writes all three components at offsets 0, 4 and 8 using integer moves and returns with RET 4. Its complete decode and checked-callee output are build/0027c250-retry/0005bc20-decoded.txt and build/0027c250-retry/checked-copy-constructor.log. The complete normalizer at 0x000FB930 reads and writes all three float components, has no calls, does not retain its receiver and uses plain RET. A matching donor name was not treated as independent type evidence.

The 940-byte movement helper at 0x003FD7D0 explicitly writes all fields of its 36-byte output: a float at 0, coordinates at 4/8/0xC and 0x10/0x14/0x18, layer at 0x1C and node ID at 0x20. Its four stack slots are Object, locomotor, output storage and a low-byte Boolean; RET 16 establishes cleanup. These fields come from the complete decode, not allocation size. The 27-byte path destructor at 0x003FEB80 reads the head at receiver +4 and traverses owned nodes through their next field at 0, deleting each node. The target then deletes its owned path object and clears its own path pointer at +0x140. No STL value type was inferred for this target.

The complete locomotor dispatcher has executable size 557 bytes. Its ledger size of 596 includes a nine-entry inline jump table following a three-byte alignment instruction. The initial checked-callee rejection is retained in build/0027c250-retry/001bc820-checked-callees.log; the executable extent passes in build/0027c250-retry/checked-locomotor-code.log. All switch entries lead to decoded instructions in the executable body, recorded in build/0027c250-retry/locomotor-switch.json. Its five stack slots are Object, coordinate reference, two floats and output Boolean storage, with RET 20. Treating the inline data as executable code would have produced a false boundary objection.

The other direct helper extents were decoded and checked, with the per-helper files named by RVA in build/0027c250-retry/. This does not certify every indirect implementation. Self virtual slots +0x184/+0x18C return AL, state +0x30 slot +0x10 has no stack arguments, containment +0x68 returns an interface whose +0x174 result is tested in AL, and self +0x214 has no stack arguments with its result unused. The existing terrain-slot evidence and complete terrain body at 0x006BE2A0 support five stack slots and an x87 float result with RET 20, but this run did not independently re-extract that vtable or enumerate every virtual implementation. Those identity and indirect-ABI checks remain unresolved and would block an exact-recovery claim.

## Measured compiler forms

Each target probe used the explicit retail size and preserved its complete output. Quality is computed by tools/finish_measure.py from differences and size error. Instruction-normalized shape similarity is diagnostic only. The native-class forms also change Coord3D's struct/class decoration in two Pathfinder declarations; their strict target gate reports those unresolved spellings. No pin was added to force the alternative through the gate.

| Trial | Compiled hypothesis | Candidate bytes | Non-relocation differences | First difference | Quality | Raw output |
| --- | --- | ---: | ---: | --- | ---: | --- |
| 00 | Saved body | 2652 | 1009 | +0x42E | 0.6092 | build/0027c250-retry/baseline-probe.log |
| 01 | Native coordinate declaration and copy lifetime | 2660 | 1298 | +0x42E | 0.5069 | build/0027c250-retry/native-coordinate-probe.log |
| 02 | Native coordinate construction and methods | 2660 | 1298 | +0x42E | 0.5069 | build/0027c250-retry/native-construction-probe.log |
| 03 | Inline position accessor | 2660 | 1298 | +0x42E | 0.5069 | build/0027c250-retry/native-accessor-probe.log |
| 04 | Landed donor copy class and snapshot lifetime | 2660 | 1298 | +0x42E | 0.5069 | build/0027c250-retry/donor-coordinate-copy-probe.log |
| 05 | Donor copy initialization | 2660 | 1298 | +0x42E | 0.5069 | build/0027c250-retry/donor-initialization-probe.log |
| 06 | Scalar primary construction with nontrivial snapshot | 2664 | 1374 | +0x2 | 0.4815 | build/0027c250-retry/scalar-construction-probe.log |
| 07 | Visible noinline movement predicate | 2652 | 1009 | +0x42E | 0.6092 | build/0027c250-retry/visible-predicate-probe.log |
| 09 | Explicit snapshot fields | 2660 | 1298 | +0x42E | 0.5069 | build/0027c250-retry/field-snapshot-probe.log |
| 10 | Scalar snapshot locals | 2660 | 1310 | +0xE2 | 0.5024 | build/0027c250-retry/scalar-snapshot-probe.log |
| 11 | Snapshot directly from Object | 2661 | 1293 | +0x42E | 0.5096 | build/0027c250-retry/source-snapshot-probe.log |
| 12 | Direct primary and snapshot fields | 2660 | 1337 | +0x3C0 | 0.4923 | build/0027c250-retry/direct-coordinate-fields-probe.log |
| 13 | Direct primary fields with POD snapshot | 2652 | 1137 | +0x3C0 | 0.5613 | build/0027c250-retry/direct-primary-raw-snapshot-probe.log |
| 14 | Scalar primary setter with POD snapshot | 2668 | 1402 | +0x3C0 | 0.4740 | build/0027c250-retry/scalar-primary-raw-snapshot-probe.log |
| 15 | Native declaration with typed normalize call | 2660 | 1298 | +0x42E | 0.5069 | build/0027c250-retry/typed-normalize-probe.log |
| 16 | Visible noinline native normalizer | 2646 | 1277 | +0x42E | 0.5043 | build/0027c250-retry/visible-normalize-probe.log |
| 17 | Float value constructor with visible normalizer | 2650 | 1378 | +0x2 | 0.4695 | build/0027c250-retry/coordinate-value-constructor-probe.log |
| 18 | Raw base snapshot with visible normalizer | 2638 | 1232 | +0x42E | 0.5152 | build/0027c250-retry/visible-normalize-raw-snapshot-probe.log |
| 19 | Portable include paths for trial 16 | 2646 | 1277 | +0x42E | 0.5043 | build/0027c250-retry/bankable-visible-normalize-probe.log |

The source-level generator in build/0027c250-retry/family-generator.log reported no applicable copy/register/frame choice for the saved source. No invalid choice set was passed to shape_search. Scalar field initialization, donor copy construction, native accessor visibility, nontrivial snapshot lifetime and normalizer visibility did not improve the saved bank. Register and x87 spelling changes without new evidence are not a justified next experiment.

## Checks and reopening condition

The strict target gate fails for the preferred bank in build/0027c250-retry/scoped-bank-gate.log. The visible-normalizer target fails in build/0027c250-retry/scoped-visible-trial-gate.log and additionally has the two unresolved native-class Pathfinder spellings. Relocation diagnostics taken at already-diverged instruction offsets are not new callee identity evidence. The class gates pass for the bank and alternative in build/0027c250-retry/class-gate-bank.log and build/0027c250-retry/class-gate-alternative.log. Pin consistency passes in build/0027c250-retry/pin-consistency.log. The initial ledger check passes in build/0027c250-retry/check-csv-initial.log; the final check is retained as build/0027c250-retry/check-csv-final.log. The declaration-to-ledger check on the bank fails in build/0027c250-retry/declared-bank.log because this attempted source has no landed row. That is not waived or represented as an exact recovery. No shared header or shim was changed and no full gate was required.

The source-name comparison passes through the repository's name_regression.regressions API in build/0027c250-retry/name-regression-source-api.log, and every descriptive bank identifier remains in the alternative. The suggested file-to-file CLI invocation was rejected because this checkout's CLI expects Git revisions; that raw failure remains in build/0027c250-retry/name-regression-alternative.log. The alternative's declaration-to-ledger check also fails in build/0027c250-retry/declared-alternative.log because this is an unlanded experiment. The archive is evidence, not a game source registration.

The remaining byte blocker is codegen-order/coordinate-copy-x87 at the coordinate snapshot and subsequent x87 scheduling. Reopen with independently supported source context that explains the mixed snapshot operations, or a measured compiler form that improves the preferred bank. Before any exact claim, finish the concrete virtual-implementation audit and resolve the native-class decoration through proven canonical declarations. A new name, allocation-size guess or repetition of the rejected forms is insufficient.
