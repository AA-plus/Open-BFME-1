# 0x0023FED0: retained register residue

## Result and reopening condition

No source recovery landed. The preferred body remains targets/game/reverse/attempts/0x0023fed0.cpp, byte-for-byte unchanged, at the tested revision 48b8a46fb685e53a8b79d4bf09faefa9dc7e6668. The fresh strict gate resolves every direct call and still rejects the same 15 bytes of the 316-byte body. Its raw output is build/0023fed0-second/scoped-bank-gate.log. Every differing offset is explained in the table below. No tied or worse trial replaces the bank.

The continued run tested the structural forms recorded below, including newly verified virtual dispatch and a genuine additional visible helper. None improves the residue. The address-derived class and method names are retained. The original semantic method name and an independently decoded incoming return contract remain unresolved. Exhaustive impossibility or a requirement for assembly is not claimed. Reopening needs a distinct evidence-backed frontend lifetime or complete authentic Path helper visibility hypothesis, rather than another recorded register hint, coordinate comparison spelling, native accessor, iterator temporary or append wrapper.

## Complete boundaries and ABI evidence

build/0023fed0-retry/retail-target.log decodes the target and its following padding. The sole return is RET 0x0C at +0x139, followed by INT3 at +0x13C. The empty-list branch enters the shared epilogue at +0x135; all other conditional branches and jumps remain inside the body. There is no exception frame or tail call. build/0023fed0-retry/checked-target.log confirms a complete decode and inventories all direct calls. EBP holds the list iterator, not a frame pointer.

The incoming receiver supplies the STLport list header pointer through [ECX-0xAC]. Loading [header] obtains the first node, comparing it with header tests end, and each iteration reloads the receiver's header before testing the advanced iterator. Nodes supply a pointer at +8; the target reads that object's +0x204 AI pointer and +0x74 ObjectID. The canonical object.h declarations were inspected. The address-derived Rva0023FED0MemberScanBase and its scan name remain unchanged.

The three incoming stack slots are borrowed vector pointers in needRepath, lookupFailed, ok order. With four saved registers and the local frame, they appear at ESP+0x3C, +0x40, and +0x44. The inline append temporarily reuses the third incoming parameter slot for the copied ObjectID after the vector pointer has been retained in a register. No hidden return storage or receiver adjustment is emitted. The wider dispatch evidence below ties the receiver to the HordeContain family secondary interface; the semantic method name remains unproved. build/0023fed0-retry/callers-decoded.log validates the one raw direct hit as the ILT jump itself; it found no direct incoming caller. build/0023fed0-retry/vtable-target.log found no installed table within that tool's slot cap. An incoming caller's return contract remains unverified, so the inherited void declaration is not presented as a canonical signature certificate.

build/0023fed0-retry/retail-append.log and retail-overflow.log decode the entire append and overflow helpers. Their checked inventories are checked-append.log and checked-overflow.log in the same folder. Both append exits clean one stack slot. Every value copy reads one source dword and writes one destination dword; prefix, inserted value, repeated fill, and suffix paths all advance by four. No second payload field is read or written. The overflow helper has one RET 0x14 and no outgoing branch. Its arguments are position, a reference to the scalar, an empty trait reference, an unsigned fill count, and a bool consumed as a byte. Thus scalar ObjectID payloads follow from actual copies and the target's Object+0x74 loads, rather than allocation size or the generated type name. These vectors have no separate key.

build/0023fed0-retry/retail-thunk-append.log, retail-thunk-overflow.log, retail-thunk-pathpoint.log, and retail-thunk-missingwaypoint.log preserve each complete ILT jump. They reach the helpers at 0x00152780, 0x001523D0, 0x003FD7D0, and 0x003FD0B0 respectively.

build/0023fed0-retry/retail-pathpoint.log decodes the complete Path helper, including all its branches and its RET 0x10. checked-pathpoint.log reports no outgoing branch. The argument slots are the object pointer, locomotor pointer, output pointer, and flag; the flag is read as a byte. The helper writes all output fields: float at +0, three floats at +4/+8/+0xC, another coordinate triple at +0x10/+0x14/+0x18, a layer dword at +0x1C, and waypoint ID at +0x20. The target compares both triples and reads the waypoint ID. The bank's unused dword declarations preserve representation but do not supply semantic field names. The complete named needToRotate caller independently passes AIUpdateInterface+0x1CC in the locomotor slot and AIUpdateInterface+0x140 as receiver. Its raw decode and checked inventory are retail-needtorotate.log and checked-needtorotate.log. The source in AIUpdate.cpp was read directly. The helper mutates its Path cache, so a const receiver declaration would not describe its semantics; the bank's active member-pointer adapter uses a non-const receiver. The reference AIPathfind.h signature and its shorter output record describe Zero Hour, so they cannot replace the decoded BFME view.

build/0023fed0-retry/retail-missingwaypoint.log covers both bool return paths and checked-missingwaypoint.log its extent. The target tests AL, agreeing with its bool declaration. Both the target and this helper invoke TheTerrainLogic slot +0x80 with one waypoint ID. vtable-terrain.log reads that slot as ILT 0x000346FD, and retail-thunk-terrainlookup.log decodes its jump to the named getWaypointByID body. retail-terrainlookup.log and checked-terrainlookup.log cover all its returns, each RET 4, and its pointer result in EAX. The canonical declaration returns Waypoint*, whereas the bank's void* result has the same pointer width. The existing TheTerrainLogic DIR32 record covers the global. No numeric image literal or new pin was added.

## Located residue

The strict resolved comparison has 15 differing bytes in the 316-byte body. All four REL32 call sites resolve to retail routes, and the one DIR32 slot is covered by the existing global. Offsets +0x019 through +0x01E arise because retail saves ESI and EDI before loading ok into EDI, whereas the bank loads ok into EBX before those saves. Every later differing byte is a ModRM byte using that EBX/EDI mirror for path or ok. The frame, local offsets, conditional jumps, float comparisons, member loads, and epilogue otherwise agree. Exact byte evidence follows; each offset was derived from the strict verifier output rather than transcribed from the brief.

| Offset | Retail byte | Bank byte | Containing retail instruction |
|---|---|---|---|
| +0x019 | 56 | 8B | +0x019: `push esi` |
| +0x01A | 57 | 5C | +0x01A: `push edi` |
| +0x01B | 8B | 24 | +0x01B: `mov edi, dword ptr [esp + 0x44]` |
| +0x01C | 7C | 3C | +0x01B: `mov edi, dword ptr [esp + 0x44]` |
| +0x01D | 24 | 56 | +0x01B: `mov edi, dword ptr [esp + 0x44]` |
| +0x01E | 44 | 57 | +0x01B: `mov edi, dword ptr [esp + 0x44]` |
| +0x03A | 98 | B8 | +0x039: `mov ebx, dword ptr [eax + 0x140]` |
| +0x040 | DB | FF | +0x03F: `test ebx, ebx` |
| +0x053 | CB | CF | +0x052: `mov ecx, ebx` |
| +0x08D | 47 | 43 | +0x08C: `mov eax, dword ptr [edi + 4]` |
| +0x090 | 47 | 43 | +0x08F: `cmp eax, dword ptr [edi + 8]` |
| +0x0A2 | 47 | 43 | +0x0A1: `add dword ptr [edi + 4], 4` |
| +0x0B7 | CF | CB | +0x0B6: `mov ecx, edi` |
| +0x0F0 | CB | CF | +0x0EF: `mov ecx, ebx` |
| +0x119 | CF | CB | +0x118: `mov ecx, edi` |

## First run hypotheses and measured trials

| Hypothesis | Supporting evidence and refutation condition | Measured result | Preserved source and raw output |
|---|---|---|---|
| Native ObjectID appends at all four sites recover the original inlining decisions. | The complete copy helpers prove scalar values. The bank substitutes a generated struct specialization at three sites. Refuted if native calls inline into a different extent or retain the residue. | All-native calls produce 378 bytes and 283 differing bytes in the shared requested window, plus a longer body. This regresses. | build/0023fed0-retry/native-appends.cpp and native-appends.log |
| Native coordinate equality changes the frontend's temporary structure. | The complete Path helper writes two coordinate triples, and the existing Coord3D implementation compares x, y, z in that order. Refuted if all original differing offsets persist. | 316 bytes with the same 15 differences. | build/0023fed0-retry/coord-equality.cpp and coord-equality.log |
| A typed route to the actual append ILT removes allocation effects from the generated struct specialization. | The decoded jump reaches the scalar append helper; receiver and reference argument follow its complete body. Refuted if all original differing offsets persist. | 316 bytes with the same 15 differences. Its relocation spelling changes, but the instruction residue does not. | build/0023fed0-retry/append-ilt-route.cpp and append-ilt-route.log |

The prior verdicts were retrieved in build/0023fed0-retry/session-target.log. Every saved reconstruction was read and retained under build/0023fed0-retry/saved-*.cpp; reconstruction hashes and comparison with the preferred body are in retained-evidence-v2.log. The preferred bank's untouched snapshot is bank-original.cpp. Raw probe outputs and compiler receipts remain available under build/. No inferior or tied candidate replaces the bank.

The effective compiler uses the repository's /O2, /GR-, /EHsc- defaults with the bank's /DNDEBUG, /MD, /D_STLP_USE_STATIC_LIB and Object include path. The neighboring formation source also uses /MD and /EHsc-. The scalar-vector donor has /EHsc with _STLP_NO_EXCEPTIONS; this target has no EH frame. The native equality donor was read from coord3d.cpp, and the STLport push and overflow implementations were read from _vector.h. No compiler-switch sweep was repeated.

## Verification limits

Initial check_csv passed; its output is build/0023fed0-retry/check-csv-initial.log. Final ledger validation is preserved as check-csv-final.log in the same folder. The scoped bank gate fails on the documented residue and reports no unresolved calls. No source or header was landed, no pin changed, and no full gate was required or run. No acceptance is claimed for the bank or the trial bodies. No background task was started.

## Continued run dispatch and helper evidence

The first search used the default 64-slot cap. The wider search in build/0023fed0-second/vtable-target-wide.log finds the actual thunk at slot 123 (+0x1EC) of tables 0x010AE230, 0x010AED58 and 0x010B07E0. The complete HorseHordeContain constructor at 0x0024D220 installs the third table at complete-object +0xE4 and returns with RET 8. The complete HordeContain constructor at 0x0023EAF0 installs the second table at +0xE4 and returns with RET 8. Their decoded bodies and checked inventories are build/0023fed0-second/retail-horse-ctor.log, retail-horde-constructor.log, checked-horse-constructor.log and checked-horde-constructor.log. The live constructor sources and Rva0023A730Slot03.cpp were read directly. The first table is a screening lead from the AOD constructor, without a new independent constructor audit here.

Thus the target's receiver belongs to the secondary interface, and this-0xAC reaches complete-object +0x38. The target performs no entry adjustment. This proves a family dispatch position and a physical member offset, not the original semantic method name. Virtual declaration and ordinal slot-view trials both retain the same 15-byte residue. Native secondary-base downcasts add null-adjustment guards and regress; expressing the already-valid nonnull receiver contract removes initial guard code but still regresses. These trials do not alter the preferred bank.

build/0023fed0-second/virtual-callers.log validates raw slot-offset hits against complete decoded ledger bodies and rejects incomplete extents. The full candidate bodies remain in virtual-caller-XXXXXXXX.log, with screening windows in caller-windows.log. The reviewed complete hits take no three-vector argument sequence and use AIUpdateInterface or RenderObjClass receivers. They are not evidence for this target's incoming return width. No complete incoming caller was independently established. Incomplete candidate extents remain rejected, rather than becoming signature evidence.

The list's word at this-0xAC is its native sentinel-header pointer. Treating that word as another pointer to a separate list adds an extra load at +9; list-pointer-member-view.cpp is rejected for that semantic mismatch. Correct embedded-list reference views preserve the two retail loads and reproduce the unchanged residue.

The actual TerrainLogic lookup source was copied verbatim with an inline noinline definition, preserving virtual dispatch. A qualified-call wrapper is used only to make the copied helper emit for its independent probe. build/0023fed0-second/terrain-lookup-visible-emitted-helper.log measures its complete 116 bytes as exact modulo four relocations. build/0023fed0-second/scoped-helper-gate.log then passes strict byte and binding verification for that helper using an in-memory row, with no ledger or pin edits. The scan still has the same 15 differences in terrain-lookup-visible-emitted.log. The unemitted variant and its failed helper-symbol probe are separately retained. This is evidence for the visibility experiment, not a new recovery claim for the already-owned helper.

The native ObjectID push_back name already belongs to 0x0036B720 in Squad.cpp. Its spelling is not a binding for the called helper at 0x00152780. The preferred bank's genuine scalar copy evidence and actual route are retained. The source variants which expand all native appends or alter inline depth regress. Both selected-output forms shrink the failure blocks and lose the retail setup order. Double promotion and reversed float operands preserve the original register residue and add six load-order differences. The existing width, offset, register-save and slot evidence is not contradicted by those trials.

## Continued run retained trials

Every hypothesis, supporting observation, refutation condition and measured result was written to build/verdict.txt before or after its probe. The manifest build/0023fed0-second/trial-index.json records exact source and raw-log hashes. Trial size and difference values below are parsed from the raw probe logs. Difference counts for changed extents are diagnostic masked-window counts; a missing tail or extra body remains a failure. No entry is an acceptance certificate. Raw logs are named as plain paths because build/ is untracked.

| Trial source and raw output under build/0023fed0-second/ | Compiled bytes | Non-relocation differences |
|---|---:|---:|
| append-inclass-route.cpp and append-inclass-route.log | 316 | 15 |
| combined-native-accessors.cpp and combined-native-accessors.log | 316 | 15 |
| compare-record-outer-scope.cpp and compare-record-outer-scope.log | 316 | 15 |
| compare-reference-adapter.cpp and compare-reference-adapter.log | 316 | 15 |
| conditional-path-append.cpp and conditional-path-append.log | 316 | 15 |
| const-iterator.cpp and const-iterator.log | 316 | 15 |
| decoded-unused-record-types.cpp and decoded-unused-record-types.log | 316 | 15 |
| equal-byte-width.cpp and equal-byte-width.log | 316 | 15 |
| equal-int-width.cpp and equal-int-width.log | 316 | 15 |
| equality-double-promotion.cpp and equality-double-promotion.log | 316 | 21 |
| equality-operands-reversed.cpp and equality-operands-reversed.log | 316 | 21 |
| equality-ternary-chain.cpp and equality-ternary-chain.log | 316 | 15 |
| exception-flags-neighbour.cpp and exception-flags-neighbour.log | 316 | 15 |
| failure-goto-merge.cpp and failure-goto-merge.log | 299 | 101 |
| failure-id-and-vector.cpp and failure-id-and-vector.log | 306 | 101 |
| guarded-native-iterator-do.cpp and guarded-native-iterator-do.log | 316 | 15 |
| id-block-temporaries.cpp and id-block-temporaries.log | 316 | 15 |
| id-local-after-compute.cpp and id-local-after-compute.log | 307 | 228 |
| inverted-equality-local.cpp and inverted-equality-local.log | 316 | 15 |
| list-inclass-reference.cpp and list-inclass-reference.log | 316 | 15 |
| list-member-reference.cpp and list-member-reference.log | 316 | 15 |
| list-pointer-member-view.cpp and list-pointer-member-view.log | 319 | 271 |
| loop-adapter-0-first.cpp and loop-adapter-0-first.log | 316 | 15 |
| loop-adapter-0-last.cpp and loop-adapter-0-last.log | 316 | 15 |
| loop-adapter-2-first.cpp and loop-adapter-2-first.log | 316 | 15 |
| loop-adapter-2-last.cpp and loop-adapter-2-last.log | 316 | 15 |
| loop-adapter-5-first.cpp and loop-adapter-5-first.log | 316 | 15 |
| loop-adapter-5-last.cpp and loop-adapter-5-last.log | 316 | 15 |
| member-adapter-member.cpp and member-adapter-member.log | 316 | 15 |
| member-adapter-ok.cpp and member-adapter-ok.log | 316 | 15 |
| native-depth-one.cpp and native-depth-one.log | 379 | 281 |
| native-depth-two.cpp and native-depth-two.log | 504 | 286 |
| native-getai-chain.cpp and native-getai-chain.log | 316 | 15 |
| native-inline-append-reference.cpp and native-inline-append-reference.log | 316 | 15 |
| native-inline-append-view.cpp and native-inline-append-view.log | 316 | 15 |
| native-insert-end.cpp and native-insert-end.log | 289 | 147 |
| native-secondary-downcast-pointer.cpp and native-secondary-downcast-pointer.log | 388 | 280 |
| native-secondary-downcast-reference.cpp and native-secondary-downcast-reference.log | 388 | 280 |
| native-wrapper-noinline.cpp and native-wrapper-noinline.log | 305 | 85 |
| no-exception-marker-removed.cpp and no-exception-marker-removed.log | 316 | 15 |
| output-value-reference.cpp and output-value-reference.log | 316 | 15 |
| path-borrowed-value.cpp and path-borrowed-value.log | 316 | 15 |
| path-value-reference.cpp and path-value-reference.log | 321 | 224 |
| postincrement-iterator.cpp and postincrement-iterator.log | 316 | 15 |
| redundant-member-success-guard.cpp and redundant-member-success-guard.log | 316 | 15 |
| redundant-path-compute-guard.cpp and redundant-path-compute-guard.log | 316 | 15 |
| redundant-path-waypoint-guard.cpp and redundant-path-waypoint-guard.log | 316 | 15 |
| secondary-downcast-assume.cpp and secondary-downcast-assume.log | 376 | 278 |
| selected-failure-vector.cpp and selected-failure-vector.log | 290 | 79 |
| shortcircuit-null-guards.cpp and shortcircuit-null-guards.log | 316 | 15 |
| shortcircuit-path-equality.cpp and shortcircuit-path-equality.log | 330 | 217 |
| signed-waypoint-id.cpp and signed-waypoint-id.log | 316 | 15 |
| success-reference-inline-adapter.cpp and success-reference-inline-adapter.log | 316 | 15 |
| success-vector-reference.cpp and success-vector-reference.log | 316 | 15 |
| terrain-lookup-visible-emitted.cpp and terrain-lookup-visible-emitted.log | 316 | 15 |
| terrain-lookup-visible-unemitted.cpp and terrain-lookup-visible-unemitted.log | 316 | 15 |
| terrain-lookup-visible.cpp and terrain-lookup-visible.log | 316 | 15 |
| typed-update-fields.cpp and typed-update-fields.log | 316 | 15 |
| virtual-method-declaration.cpp and virtual-method-declaration.log | 316 | 15 |
| virtual-slot-view.cpp and virtual-slot-view.log | 316 | 15 |
| waypoint-result-local.cpp and waypoint-result-local.log | 324 | 151 |
| while-native-iterator.cpp and while-native-iterator.log | 316 | 15 |

## Continued run verification and measured duration

Initial and final ledger validation pass in build/0023fed0-second/check-csv-initial.log and check-csv-final.log. Pin, CRT import and DIR32 consistency pass in pin-consistency-current.log. The assigned body fails its ordinary strict scoped check in scoped-bank-gate.log with no unresolved direct call. The copied lookup helper passes its strict scoped check in scoped-helper-gate.log. No production source, shared header, pin, baseline or ledger row changed, so no full gate was required or run. No background task was started.

The attempt log's committed prefix and CRLF endings are preserved exactly. The ordinary Git whitespace check reports the carriage return of the added row as trailing whitespace in git-diff-check.log. The same check with explicit CRLF recognition and the ordinary blank-space checks enabled passes in git-diff-check-crlf.log. No Git configuration or hook was changed.

The current run started at 2026-10-13T08:33:10+00:00 and evidence was preserved at 2026-10-13T09:07:20.641200+00:00, measuring 34.18 minutes. The archived first run measured 16.29 minutes; the sum of the two measured active spans is 50.47 minutes, excluding the gap between runs. The actual model is gpt-6.1-sol. The existing uncommitted verdict row is updated in place; this continuation adds no second row. Collection remains uncommitted because Git writes are forbidden in this checkout.
