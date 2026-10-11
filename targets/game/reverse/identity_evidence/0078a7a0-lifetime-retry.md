# RVA 0x0078A7A0: lifetime retry

## Result and reopening condition

No source recovery was landed. The target remains the 816-byte generated assembly row at revision 19ce4e816871883ee38b2e8b498abde0be6d23f4. The preferred body remains targets/game/reverse/attempts/0x0078a7a0.cpp. Its baseline was reproduced, and no new trial improved its byte distance. The single verdict retains that better bank and archives the float-comparison alternative. The measurements below are compiler observations, not identity or acceptance certificates. Model: gpt-6.1-sol.

Reopening requires a concrete lifetime or declaration that prevents early caching of the first reference and prevents reuse of its incoming argument slot for the integer conversion and constructor-failure pointer. The first difference remains at +0x17, where the candidate reserves 0x60 bytes and retail reserves 0x64. Retail saves ESI at +0xBB and restores it at +0x26D around the bone loop. The candidate saves ESI before the asset-list block and holds the first reference there. Merely adjusting padding or reordering locals without evidence for this lifetime would repeat rejected experiments.

## Current context and hypotheses

The unnamed-owner and Light-layout blockers are addressed by the landed owner constructor, destructor, scene initializer, viewport implementation, bindHAnim sibling and native light.h, scene.h and rendobj.h declarations. Those sources were read, and the saved body already incorporates their useful declarations. The bank's existing address-derived owner and descriptive method name are retained. No EA class-name or original method-name claim is added. The Zero Hour reference search supplies no W3DAptComponentView3D source body to port.

The new hypotheses were that a constant threshold and a float expression would reproduce the observed comparison, that a conversion temporary rather than a named integer would require a local slot, and that native object alignment, member types or constructor visibility would recover the allocation cleanup lifetime. A hypothesis fails here if it leaves the relevant storage unchanged or fails to improve the bank's full-extent byte distance. The constant-threshold experiment changes the comparison but produces a qword comparison. Explicit float conversion produces retail's dword comparison and ordered flag test, while worsening the complete byte distance. Float division by 100 instead produces a dword multiplication, which retail's qword multiplication refutes. A double call-result local and a one-element integer array leave the corrected comparison candidate unchanged.

The two lifetime spellings tested were a function-scope matrix and named color vectors. Both leave the baseline unchanged, so further unchanged register spelling trials were stopped. Four-byte list alignment, a containing AssetList view and typed owner fields also leave it unchanged. Ordinary inline allocation is not expanded and introduces a helper call; forcing expansion restores the unchanged baseline and its incorrect cleanup slot. The do-loop spelling worsens the byte distance and reproduces the previously unsuccessful loop family. No compiler flag sweep or repeated two-element frame-array search was performed. Current EH and family generator choices are preserved in build/78a7a0-retry/eh-choices.json and family-choices.json. They expose the already recorded EH specifications, adjacent-store order and two-element frame-array choices, rather than a new supported lever, so that search was not repeated.

## Boundary, identity and ABI evidence

The complete target decode is build/78a7a0-retry/0078a7a0-decode.txt and its checked inventory is checked_target.log in the same folder. The terminal ret 0xC starts at +0x32D and ends at +0x330. Every direct branch destination is inside the complete body, including the two early-return paths. Vtable VA 0x01126CCC slot 3 follows ILT RVA 0x0001647D to the target; the complete constructor at RVA 0x00789900 writes that table. The complete caller at RVA 0x00462E80 pushes three string object addresses in reverse order and invokes slot 0x0C. There is no receiver adjustment, hidden result pointer or consumed return value at that call. The existing three-reference thiscall declaration is retained.

The caller, constructor, holder cleanup, base string cleanup, allocation functions and all helpers used for type evidence have full instruction dumps and checked-callee logs in build/78a7a0-retry/. The exit results are in checked-receipts.json and complete-receipts.json. Native field views preserve the owner offsets: scene at 0x0C, camera at 0x10, byte flag at 0x14, selected render object at 0x18, bone index at 0x1C and the reference pair at 0x20. The base cleanup at RVA 0x00789740 releases the canonical string at owner+8. The pair cleanup at RVA 0x00789600 releases and clears its two pointers. These decoded operations supply member-type evidence independently of donor labels.

The complete insertion chain again refutes the pointer interpretation supplied by existing donor names. AssetList insertion at RVA 0x00141D00 passes the result of RVA 0x009EC0B0 by address. Its complete lookup at RVA 0x009EED20 returns the key from RVA 0x009EDD70, whose complete body increments and returns the generator's dword key. Both value-construction arms of RVA 0x0013F760 read exactly one dword from the value and write it at node+0x10. There is no additional field or value constructor. Insert-unique compares the complete key with unsigned branches. Erase at RVA 0x00134AA0 performs no element destructor. The newly reviewed forwarding target at RVA 0x009F0BD0 consumes a list pointer, reads the same node+0x10 dword and compares it with unsigned branches. The opaque scalar descriptor is supported independently of allocation size and STL symbol names. No STL identity, ledger row or pin was changed.

Virtual dispatch chains and full implementations are preserved in virtual-dispatch.json and the corresponding virtual-decode.txt files. RenderObj slots 0xBC and 0xC0 use no argument and one dword argument respectively; slot 0x94 removes three dwords. The bounding-sphere implementation returns its sphere address in EAX, with radius at sphere+0x0C. Set_Transform copies all twelve dwords of the passed matrix and removes one pointer argument. Set_LOD_Level removes one dword. The scene table at VA 0x01126C28 routes Add_Render_Object and Register to their complete implementations. Register's code is 212 bytes; the remaining twenty bytes of its ledger range are a five-entry jump table. Its decoded table targets are recorded separately in scene-register-table.json. Both outgoing tail jumps reach the complete GenericMultiList Internal_Add body, and the LIGHT branch reaches Internal_Add_Tail. Their pointer arguments include the observed secondary adjustment of +8, and their bool arguments occupy dword stack slots but are read as bytes. No trailing table data is used as instruction evidence.

Light construction, the three complete vector setters, the scalar deleting destructor and its full tail destructor chain confirm the native allocation size, color offsets and ownership. Primary virtual slot zero reaches RefCountClass::Delete_This, which calls slot four with flag one. Light's slot four reaches its scalar deleting destructor, which invokes the complete Light destructor and scalar delete. These routes are checked separately from the direct call inventory. The unknown dynamic render-object subtype and original C++ typedef remain unclaimed.

## Exception cleanup blocker

Retail has two unwind states. State zero cleans the list at EBP-0x50. State one loads the allocated pointer from EBP-0x70 and calls scalar delete. Retail metadata is preserved in 0078a7a0-eh.txt and the exact cleanup extents were checked separately. The candidate has the corresponding scalar deallocator but loads its pointer from EBP+4. Its object cleanup disassembly is in baseline-eh.txt; forceinline_creation-eh.txt shows that expanding the allocation helper does not repair this slot. This remains a blocker to exact recovery. Light construction's own complete cleanup reloads its receiver at EBP-0x10 and tail-jumps to the RenderObj destructor; its raw map is 0093be90-eh.txt. No constructor-failure fallback or invented cleanup callee is added.

## Measurements

Each named experiment has a complete source, unedited probe output and timestamped receipt under build/78a7a0-retry/. The retail extent is explicitly 816 bytes in every probe. Results are n=1 per changed source; the unchanged baseline was measured again before preservation. Shifted relocation sites are layout diagnostics, not missing-pin evidence. Listing-only compilation reproduces the baseline; baseline.cod records the integer and allocation temporary sharing the incoming first-argument slot. The initial PowerShell-captured baseline output is retained separately from the final raw subprocess probe.

| Experiment | Emitted bytes | Differing non-relocation bytes | Shifted relocation sites | Raw output |
| --- | ---: | ---: | ---: | --- |
| baseline-final | 817 | 449 | 14 | build/78a7a0-retry/baseline-final.log |
| literal_threshold | 815 | 518 | 15 | build/78a7a0-retry/literal_threshold.log |
| float_comparison | 815 | 518 | 15 | build/78a7a0-retry/float_comparison.log |
| float_division | 815 | 514 | 16 | build/78a7a0-retry/float_division.log |
| double_call_result | 815 | 518 | 15 | build/78a7a0-retry/double_call_result.log |
| matrix_scope | 817 | 449 | 14 | build/78a7a0-retry/matrix_scope.log |
| vector_named | 817 | 449 | 14 | build/78a7a0-retry/vector_named.log |
| asset_alignment | 817 | 449 | 14 | build/78a7a0-retry/asset_alignment.log |
| inline_creation | 755 | 577 | 20 | build/78a7a0-retry/inline_creation.log |
| forceinline_creation | 817 | 449 | 14 | build/78a7a0-retry/forceinline_creation.log |
| loop_do | 803 | 606 | 21 | build/78a7a0-retry/loop_do.log |
| asset_composition | 817 | 449 | 14 | build/78a7a0-retry/asset_composition.log |
| owner_native_fields | 817 | 449 | 14 | build/78a7a0-retry/owner_native_fields.log |
| one_slot | 815 | 518 | 15 | build/78a7a0-retry/one_slot.log |

## Checks and retained work

The scoped verifier passes baseline integrity and fails one out of one candidate bodies on its own byte mismatch; raw output is build/78a7a0-retry/scoped_gate.log. CSV validation, global pin consistency and the candidate class gate pass, with raw outputs check_csv_final.log, pin_consistency.log and class_gate.log in that folder. The filepath invocation of name_regression.py printed a Git revision error because this revision's CLI accepts revisions. The read-only source comparison through its regressions function finds no name losses and confirms that baseline.cpp is identical to the retained bank; that result is in name-files-check.json. There is no promoted game source to apply a landing-only declared-unmatched check to. A full gate is not required for an attempt record and immutable alternative without shared headers, pins or promoted source.

Exactly one verdict is written through re_log.py at preservation. The prior bank, every measured source, the unused generated candidate spellings, raw logs, compiler objects and running verdict remain available for collection. No Git writes, synchronization, shared policy changes or tooling edits are performed. No background job is left running.
