# Snapshot copy and alias scheduling at RVA 0x0073D6D0

The tested revision is `cad8b7c5926ae06e9ed769454a6af23d3818ef4b`. The retained symbol is `?apply@Rva0073D6D0@@UAEXI@Z`. Its identity remains address-derived. This attempt improves a partial reconstruction and recovers no verified source bytes. The original bank is preserved verbatim in build/0073d6d0-finish/00-bank.cpp and in the immutable attempt history; its SHA-256 is d0954183296a546c660e8a1143816697586c948f22ce17bc4acefb6bb52761e0.

## Result and next action

The original bank emits 306 bytes with 12 masked differences. Independently resolving its external addresses gives 20 differences, at every offset from +0x3A through +0x4D. The improved body in build/0073d6d0-finish/07-alias-fov-barrier.cpp emits 306 bytes with 11 masked differences and 19 independently resolved differences, at every offset from +0x27 through +0x39. Both normal scoped byte gates fail 1/1. Both constant checks pass all three references. Raw outputs are build/0073d6d0-finish/00-bank-probe.log, scoped-bank-gate-rerun.log, 07-alias-fov-barrier-probe.log and scoped-07-gate.log.

The new hypothesis is that memory-alias information prevents the bank from scheduling a snapshot scalar load ahead of the preceding coordinate or scalar store. The alias options /Oa and /Ow reproduce retail's entire original differing interval, but they also move earlier coordinate loads ahead of their stores. A compiler barrier after the field006C restore keeps that first scalar store in place and leaves the smaller coordinate-copy mismatch. This measured response distinguishes the retry from the previous scalar-local and CPU-scheduling experiments. It does not establish retail's original compiler flags. The barrier is reconstruction shaping, not recovered EA source. The refutation condition for an exact candidate remains any difference after independent address resolution at the complete extent.

The remaining instructions have the same coordinate accesses and register destinations. Retail loads position X into EAX, computes its destination in EDX and stores X before loading Y into ECX. It stores Y before loading Z into EAX. The improved candidate loads Y before computing the destination and loads Z before storing Y. The original bank already had retail's coordinate-copy order but lacked the following scalar preloads. A justified retry must preserve the aggregate copy's destination calculation while restricting the earlier load motion, or independently establish a different native access structure. Simply repeating scalar locals, source-store permutations, a visible scalar setter, native View::setPosition, memcpy, G6/G7 or a whole-function alias switch supplies no new experiment.

## Complete boundary, helpers and declarations

The complete target has one return, ret 4 at RVA 0x0073D7FF, ending at 0x0073D802. All conditional branches and the local jump remain inside that extent. There are no direct callees, external tail jumps, EH registration, allocation or owning member operations. Container and constructor cleanup acceptance checks do not apply to this target. The complete decoded bodies and checked inventories are retained in build/0073d6d0-finish/decoded-bodies.log and checked-0073d6d0.log.

The constructor-installed primary table at VA 0x011217A0 routes slot 150 through ILT RVA 0x00003102 to this entry. Its outgoing slots 103 and 117 route to complete bodies at RVAs 0x0073F960 (72 bytes, no incoming argument) and 0x0045BF90 (13 bytes, full dword argument and ret 4). The latter writes +0x88. The embedded object at receiver +0x24B8 uses the constructor-installed table at VA 0x0111E188; its first three scalar getters are the complete four-byte bodies at RVAs 0x006DF5A0, 0x006DF5B0 and 0x006DF5C0. They load float fields +0x08, +0x0C and +0x10 into ST0 and consume no stack arguments. Each getter receives exactly this+0x24B8. The target's two owner calls and three embedded calls are indirect calls, not assumed direct calls to the ledger names. Raw routes are in build/0073d6d0-finish/vtable-routes.log; every named helper has a separate checked-<rva>.log.

The terrain call passes X, Y and a null Coord3D normal pointer to table offset +0x18. Its installed route reaches the complete 59-byte forwarder at RVA 0x006BE250. That body either returns a float with ret 12 or tail-jumps through render-object slot +0x248. The installed BaseHeightMap table routes that slot to the complete 957-byte body at RVA 0x006CBB50. Its three return paths consume 12 bytes and return a float in ST0; the first two arguments are read as floats, and the optional normal receives three float writes. All its conditional branches remain inside the verified extent. These bodies prove the argument order, scalar widths, optional output layout and tail-call receiver adjustment used by the bank. Their internal math calls are not evidence for the target's unresolved return type.

The complete 530-byte snapshot writer at RVA 0x00743CE0 copies the three position components into VAs 0x012F9DE4, 0x012F9DE8 and 0x012F9DEC, and copies view fields +0x6C, +0x3C and +0x50 into VAs 0x012F9DD8, 0x012F9DD4 and 0x012F9DD0. It sets the +0x2439 flag after those stores. This independently confirms the snapshot addresses used in the comparison. The complete 977-byte owner constructor confirms the three receiver bases, primary table, +0x2434 float, +0x2439 bool and +0x24B8 embedded object. Its construction and unwind implementation is unchanged and is not claimed by this attempt. The complete 89-byte factory at RVA 0x006FBE60 allocates 0x24E4 bytes and invokes that constructor. Its allocation route supports treating valid owner storage and the distinct snapshot globals as separate objects, but does not prove a historical /Oa option. Raw factory instructions and its checked inventory are in build/0073d6d0-finish/factory-006fbe60.log and checked-006fbe60.log.

The bank includes the canonical Coord3D header. The reference BaseType.h also defines Coord3D as three floats with an implicit assignment operator. The reference View.h setPosition implementation performs that aggregate assignment. No new type, member identity, shared header, global definition or symbol pin is needed for this partial. No body was ported from Zero Hour. The related parameterless initHeightForMap source is a different routine and supplies no missing statement or signature.

## ABI and name limits

The target uses ECX as the owner, consumes one unread four-byte incoming stack slot, leaves no x87 result and reads no hidden return-storage pointer. Its final EAX value is the raw Y component copied from a local. Without a caller, that residue does not prove the original void declaration or the original argument's semantic type. The bank retains its unsigned argument and void return as an explicitly unresolved ABI hypothesis. This blocks exact acceptance independently of byte equality.

The direct caller tool finds no named caller. A broader screen validates +0x258 memory displacements against decoded instructions inside inventory-selected bodies and includes calls, tail jumps and separately loaded dispatch pointers. Its aligned hits contain no direct memory call or tail jump at +0x258. The candidate owner-family hits are ordinary data fields or constructor member addresses. No target caller was established. These negative screens do not exclude computed dispatch or other caller forms, and no screen hit is used as affirmative ABI evidence. Raw output and decoded candidate bodies are in build/0073d6d0-finish/direct-callers-tool.log, dispatch-screen-rerun.log and slot150-screen.log.

The ILT Python API checks the actual body and reports CONTRADICTED. The current commit guard classifies the unchanged name as a placeholder and reports no rejection. Thus the two latest historical ILT refusals do not apply to the current guard; the name remains opaque rather than being changed or salted. Raw outputs are build/0073d6d0-finish/ilt-api-check.log and ilt-guard-check.log.

## Rejected measured experiments

| Trial | Hypothesis | Emitted bytes | Masked differences | First difference |
|---|---|---:|---:|---:|
| 00 | Original bank | 306 | 12 | +0x3A |
| 01 | Copy helper with scalar arguments by value | 304 | 220 | +0x18 |
| 02 | Copy helper with coordinate and scalar arguments by value | 305 | 218 | +0x18 |
| 03 | Whole-function /Oa alias information | 306 | 15 | +0x1F |
| 04 | Whole-function /Ow alias information | 306 | 15 | +0x1F |
| 05 | Adjacent scalar pair aggregate | 316 | 206 | +0x18 |
| 06 | Copy helper with scalar arguments by const reference | 306 | 12 | +0x3A |
| 07 | /Oa with barrier after field006C | 306 | 11 | +0x27 |
| 08 | Explicit coordinate pointer writes with per-component barriers | 304 | 221 | +0x18 |
| 09 | /Oa with volatile field006C | 306 | 15 | +0x1F |
| 10 | Alias pragma on an inline restore helper | 306 | 12 | +0x3A |
| 11 | Restricted coordinate pointer | Compile failure | Not measured | MSVC 7.1 does not support __restrict |
| 12 | Derived coordinate copy with per-component barriers | 304 | 221 | +0x18 |

Each trial's complete source and unedited probe output is retained under build/0073d6d0-finish/, using the table's numeric prefix. The copy-family generator reports no applicable source-level choice in copy-generator.log, so there is no generated search to run. The store generator's already-recorded original/reversed shapes are not repeated. No new x87-expression or unchanged register experiment is used. A byte count above 306 or below 306 is not an exact extent; the wider mismatches in rejected trials are diagnostic results, not acceptance scores.

CSV verification, pin consistency, the candidate class gate and descriptive-name regression checks pass. Raw logs are build/0073d6d0-finish/check-csv-before.log, pin-consistency.log, class-07.log and name-regression-07.log. find_declared_unmatched rejects the scratch candidate because it has no matched ledger row, as expected for a partial; its raw output is find-declared-07.log. This is not a claimed production-source conversion. No full gate is required for an evidence-only bank update. Final banking and bank-path verification logs are retained in the same task folder. Exactly one verdict row is recorded for this run.

Final re-probing the preferred bank at targets/game/reverse/attempts/0x0073d6d0.cpp reproduces 306 bytes with 11 masked differences. The scoped gate fails 1/1 and independent resolution confirms exactly the 19 offsets above; all three constants pass. Raw outputs are build/0073d6d0-finish/bank-final-probe.log and bank-final-scoped-gate.log. Final CSV, class and name preservation results pass in check-csv-final.log, class-bank-final.log and name-bank-final.log. Banking measured the preferred score as 0.9641 and preserved the original body in immutable history. The first-stage recording timestamp is in build/0073d6d0-finish/verdict-receipt.json; its full elapsed duration is recorded in build/0073d6d0-finish/handoff-clock.txt. The continuation updates the same uncommitted verdict row in place; its clock receipt is build/0073d6d0-finish2/verdict-receipt.json. No Git write, source-ledger edit, pin edit, shared-header edit or full gate was performed.

## Continuation of the bounded finish attempt

The preferred bank is retained byte for byte from the start of the continuation. No exact recovery or assembly-only conclusion is claimed. The target is still a dump row at the tested revision. The updated verdict is blocked, with the better first-stage reconstruction preserved in its existing bank. A reopening needs new evidence for native snapshot alias visibility or a complete retail caller establishing the return contract and unread argument type. Repeating the measured copy, scalar, flag, declaration-order or helper spellings below is unsupported.

Every resolved difference is enumerated with both byte values in build/0073d6d0-finish2/each-difference.log. At +0x27 the candidate loads position Y before retail computes the destination in EDX and stores X. At +0x32 it loads position Z before storing Y. Those reordered operations occupy every offset from +0x27 through +0x39; the bindings, registers, offsets and instructions from +0x3A onward are unchanged after independent resolution. There is no differing loop, switch, argument width, receiver adjustment, float operand, constant, stack cleanup or callee route in that interval. Signedness of the unread argument cannot be decided from this body, so a differently spelled parameter would supply no independent ABI evidence.

The new hypothesis was that aggregate-copy visibility or lifetime could preserve conservative copying inside the coordinate assignment while allowing later scalar preloads. The unchanged complete extent after independent binding was the refutation test. Conservative helper alias metadata survives inlining: an alias-off copy helper returns to the older 20-difference scalar interval even when the caller explicitly enables alias optimization. The off/on control without a helper retains the current 19-difference interval, and mixed scalar/helper alias states do not combine the two desired schedules. Source and destination accessors, native BaseType.h, assignment wrappers, a return reference, full restore helpers, declaration lifetime, the negated guard and matched-neighbour defines retain the current mismatch. A placement copy adds a null test. Splitting XY removes the aggregate destination LEA and emits a shorter body. The native Coord3D::set form likewise removes the LEA. No legitimate outgoing direct call exists in the target for an unresolved pin repair.

All trial sources and full raw probe logs use their table prefix under build/0073d6d0-finish2/. The scalar-definition and memcpy controls reproduce already recorded mechanisms and are not new independent evidence. The unsupported _ReadBarrier annotation emits unresolved calls; function-local optimize pragmas and noalias are rejected by MSVC 7.1. Volatile-storage and disabled-global-optimization trials have unresolved diagnostic bindings. Their masked probe measurements are retained, but their independent comparisons are not claimed. The finite copy generator supplies one alternate alias. Both search trials emit the same instruction result; raw choices and search output are copy-choices.json and copy-search.log. The original search sources and manifest remain under build/shape_search/248a8fc05ccf47c0948e494f8c5c40f6/. Trial 47 preserves the alternate full probe output. No x87 rewrite is tried; the two allocation/scheduling controls are the G5 flag and moving the existing uninitialized offset declaration.

| Trial | Emitted bytes | Masked differences | Independently resolved differences |
|---|---:|---:|---:|
| 00-reproduced | 306 | 11 | 19 |
| 01-inline-copy-alias-off | 306 | 12 | 20 |
| 02-inline-copy-alias-on | 306 | 11 | 19 |
| 03-inline-copy-read-barriers | 314 | 213 | Not complete |
| 04-inline-copy-write-barriers | 304 | 221 | 259 |
| 05-copy-off-caller-on | 306 | 12 | 20 |
| 06-copy-pragma-inside | Not emitted | Compile failure | Not complete |
| 07-copy-noalias | Not emitted | Compile failure | Not complete |
| 08-source-address-helper | 306 | 11 | 19 |
| 09-destination-reference-helper | 306 | 11 | 19 |
| 10-coordinate-copy-construction | 306 | 11 | 19 |
| 11-coordinate-placement-copy | 311 | 228 | 264 |
| 12-coordinate-temporary-lifetime | 306 | 38 | 51 |
| 13-source-volatile-coordinate | 304 | 221 | 259 |
| 14-aggregate-nested-block | 306 | 11 | 19 |
| 15-matched-neighbour-flags | 306 | 11 | 19 |
| 16-inline-argument-binding | 306 | 11 | 19 |
| 17-defined-scalar-globals | 306 | 12 | 20 |
| 18-file-static-volatile-scalars | 304 | 208 | Not complete |
| 19-external-volatile-scalars | 304 | 207 | Not complete |
| 20-pentium-alias-bank | 306 | 11 | 19 |
| 21-native-basetype-context | Not emitted | Compile failure | Not complete |
| 22-returning-coordinate-copy | 306 | 11 | 19 |
| 23-coordinate-set-inline | Not emitted | Compile failure | Not complete |
| 24-native-basetype-complete-includes | 306 | 11 | 19 |
| 25-coordinate-set-complete-includes | 304 | 220 | 255 |
| 26-global-optimization-off | 416 | 252 | Not complete |
| 27-size-optimization | 264 | 226 | 300 |
| 28-base-packed-coordinate | 306 | 11 | 19 |
| 29-scalar-memcpy-both | 306 | 12 | 20 |
| 30-scalar-memcpy-first | 306 | 12 | 20 |
| 31-scalar-memcpy-second | 306 | 12 | 20 |
| 32-scalar-aggregate-view | 306 | 12 | 20 |
| 33-base-copy-operator | 306 | 11 | 19 |
| 34-cast-base-copy-operator | 306 | 11 | 19 |
| 35-memcpy-copy-operator | 306 | 11 | 19 |
| 36-alias-off-on-control | 306 | 11 | 19 |
| 37-copy-scalar-mixed-alias | 306 | 12 | 20 |
| 38-scalar-copy-mixed-alias | 306 | 12 | 20 |
| 39-split-xy-aggregate | 304 | 221 | 259 |
| 40-split-xy-pointer | 304 | 221 | 259 |
| 41-split-xy-memcpy-z | 304 | 221 | 259 |
| 42-offset-declared-at-entry | 306 | 11 | 19 |
| 43-negated-restore-goto | 306 | 11 | 19 |
| 44-forceinline-full-restore | 306 | 11 | 19 |
| 45-forceinline-restore-reference | 306 | 11 | 19 |
| 46-aggregate-pointer-lifetime | 306 | 11 | 19 |
| 47-generated-copy-alias | 306 | 11 | 19 |

Fresh complete retail decodes and checked callee outputs are in build/0073d6d0-finish2/decoded-bodies.log and checked-<rva>.log. The target has one ret 4 and no outgoing branch. The terminal terrain body has three ret 12 paths, the snapshot writer has two ret 16 paths, and the owner constructor has two returns. All immediate conditional branches remain inside their supplied complete extents. The terrain forwarder indirect tail route, constructor table stores, embedded scalar getters and snapshot field mappings agree with the earlier evidence. The owner constructor is evidence for member locations only. This attempt does not reconstruct its ownership or cleanup and makes no new unwind correctness claim. Container and constructor-unwind acceptance items do not apply to the non-owning target. The target incoming argument and return semantics remain unresolved.

The final scoped byte gate fails 1/1 and all three constant references pass in build/0073d6d0-finish2/bank-scoped-gate.log. CSV, pin consistency and the class gate pass in check-csv.log, pin-consistency.log and class-bank.log. name_regression.regressions reports no descriptive-name change, and the bank SHA-256 and exact continuation preservation check are in name-and-bank-preservation.log. find-declared-bank.log refuses the bank for zero authored matched ledger rows; no whitelist is changed. No production source, function ledger, pin, header, baseline or shared tool is edited. A full gate is not required for this evidence-only update. The attempt-log prefix at HEAD is checked byte for byte before replacing its one uncommitted row, and the old row is retained in previous-uncommitted-verdict.tsv. No second verdict row, new re-bank, Git write or background process is introduced.
