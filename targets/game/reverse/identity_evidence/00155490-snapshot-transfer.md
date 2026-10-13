# AIGroup scatter snapshot transfer

This run did not recover an exact source body. It preserves the preferred bank unchanged at targets/game/reverse/attempts/0x00155490.cpp, SHA-256 9919ef6ced47c7efbc1413b47df62b529d744b241f4c8e384cd3aa025b1ace6c. The tested revision is 8a584a7e69e17263c8f3c35e80c91f4155554f53 and the model is gpt-6.1-sol. Every trial source and its unedited output remain under build/scatter-00155490/. The running record is build/verdict.txt. No ledger, pin, shared header, policy or tooling change was made.

## Boundary, identity and ABI

The complete target is 525 bytes, from RVA 0x00155490 through 0x0015569C inclusive. RET 4 occupies offsets 0x20A through 0x20C and is followed by INT3. All decoded direct branches stay in the body and there is no outgoing tail jump. The generated ledger's 509-byte extent omits part of the epilogue. Raw evidence is build/scatter-00155490/retail_target.log and checked_target.log.

The complete dispatcher decode starts at RVA 0x00397540 and ends after RET 8 at offset 0x2D1F. Its complete extent is 11554 bytes. The inherited 11543-byte Ghidra extent stops inside the epilogue and is rejected by checked_callees. At RVA 0x00398F0A, its decoded scatter call takes the selected group in ECX and a four-byte zero command source on the stack. ILT 0x00038EE2 jumps to the assigned target. EA's surviving MSG_DO_SCATTER case and groupScatter body support the identity, and the target's ILT oracle returns CONFIRMED. The dispatcher has a pin, but this revision has no matched ledger row at its entry; earlier notes calling it a matched caller overstate the evidence. Raw evidence is build/scatter-00155490/retail_dispatcher.log, checked_dispatcher.log, checked_dispatcher_complete.log, retail_scatter_thunk.log and oracle_target.log.

The target has an ECX receiver, one four-byte stack argument and no hidden result storage. The bounds helper consumes minimum, maximum and center pointers in that order and returns with RET 12. It writes two four-byte floating fields through each bounds pointer and three through the center pointer. The object position is read at offsets 0x38, 0x3C and 0x40. The movement receiver is adjusted by 0x20. Complete helper decodes and checked inventories are retained as build/scatter-00155490/retail_bounds.log, checked_bounds.log, retail_move.log, checked_move.log, retail_recompute.log, checked_recompute.log, retail_override.log and checked_override.log.

The iterator constructor initializes its vptr and fields at offsets four, eight and twelve. The actual insertion body writes the Object argument at clump offset eight and the numeric argument's four raw bytes at offset twelve, links through offset four, and returns with RET 8. The target independently supplies that numeric argument with an FSTP of the squared-distance expression. The actual first and next virtual slots are resolved from the constructor's vtable and decoded completely: first forwards a null numeric-output pointer to firstWithNumeric, and next returns Object through EAX. All paths through the complete numeric helper return with RET 4. Raw evidence is build/scatter-00155490/vtable_iterator.log, retail_iterator_ctor.log, checked_iterator_ctor.log, retail_iterator_insert.log, checked_iterator_insert.log, retail_iterator_first.log, checked_iterator_first.log, retail_iterator_first_numeric.log, checked_iterator_first_numeric.log, retail_iterator_next.log and checked_iterator_next.log.

The visible command helper passes command and command source to the actual parameter constructor, copies all three destination words into the position at parameter offset eight, and dispatches through virtual slot zero. Its parameter constructor initializes the vector header at offsets 0x20, 0x24 and 0x28. The actual vector copy helper reads and writes every value word at offsets zero, four and eight, advances both pointers by twelve, and has two fully decoded return paths. That establishes its storage shape. The vector's floating coordinate interpretation is inherited from the existing native declarations; this run does not independently prove the payload type from the stride or the helper's name. Its lifetime and cleanup are checked below, but an independent payload-type audit remains required before treating this copied helper as a new identity or type recovery. Raw evidence is build/scatter-00155490/retail_parms_ctor.log, checked_parms_ctor.log, retail_vector_copy.log and checked_vector_copy.log.

The target has one unwind state around allocation construction. Its complete eleven-byte action loads the allocation from EBP minus 0x30, calls the global deallocator, pops the argument and returns. The retained compiler listing has the same slot and complete action. The command helper's unwind action uses the parameter object at EBP minus 0xA8 and tail-jumps through ILT 0x00017C2E to the complete parameter destructor. That destructor frees only the vector's allocation, selecting the same global or STLport deallocator on both complete return paths. The target performs no ordinary iterator destruction. Raw evidence is build/scatter-00155490/eh_target.log, eh_move.log, bank.cod, checked_target_cleanup.log, checked_move_cleanup.log and checked_parms_dtor.log.

## Located residue and hypotheses

The preferred bank, strict selected-row comparison and separately emitted compiler listing each reproduce the same eight differences. Retail stores the x snapshot from EAX, loads y into EAX, then stores y. The bank preloads y into EDX before the x store and subsequently stores y from EDX. Both streams rejoin at offset 0x148. The complete resolved byte table is build/scatter-00155490/resolved_byte_differences.log. No direct call is unresolved. The raw failing byte gate is build/scatter-00155490/scoped_bank_gate.log.

The first new hypothesis was native nontrivial copy construction, supported by EA's snapshot initializer and the actual matched AIUpdateWaypointPath donor's member-initializer copy constructor. It was refuted by instruction drift without removing the preload. Trivial aggregate and intrinsic copies were also tested after checking their fields; they introduce a position-pointer shape or remove snapshot stores that retail retains.

The second new hypothesis was a memory dependency rather than a register-only mismatch. Read/write and write barriers stop the early y read but move the centroid arithmetic and still use EDX for y. The read barrier emits an extra operation. Explicit minimum/snapshot storage, including reuse across both loops and aggregate copies into escaped storage, does not recover the retail transfer. These tests are distinct from the earlier minimum/destination overlap. Their results do not establish that assembly is necessary.

Complete bounds visibility, native list iterators and their original early lifetime, actual command-base receiver adjustment, native Thing/Object declarations, canonical coordinates, and the neighboring WIN32 define do not improve the bank. Exposing the actual iterator constructor removes the retail exception frame and is rejected. Exposing the actual virtual first and next implementations also leaves the residue unchanged; probe shows those helper bodies are absent from the emitted object, so this did not supply a resolved virtual callee. Raw evidence for that limitation is build/scatter-00155490/iterator_next_helper_probe.log and iterator_first_numeric_helper_probe.log.

The copy-family generator reports no applicable choice for the canonical target-only source in build/scatter-00155490/copy_choices.stderr. Earlier store and exception sweeps already on record were not rerun. Size-cost and no-alias flags change unrelated frame/control-flow bytes. The cross-function alias flag leaves the bank's residue unchanged. The unsupported __restrict spelling is a compile failure, not evidence against the target. The following measurements are generated directly from each retained raw probe log. A row is a single trial, not a general impossibility claim. The corresponding source has the same basename and .cpp extension under build/scatter-00155490/.

The probe's difference count compares the common prefix. The final error column also counts every missing or extra byte as wrong.

| Raw probe log under build/scatter-00155490/ | Emitted bytes | Compared retail bytes | Probe differences | Errors including missing or extra bytes | First difference |
|---|---:|---:|---:|---:|---|
| bank.log | 525 | 525 | 8 | 8 | 0x13D |
| bounds_visible.log | 525 | 525 | 8 | 8 | 0x13D |
| canonical_both_coordinates.log | 525 | 525 | 8 | 8 | 0x13D |
| canonical_coord3d.log | 525 | 525 | 8 | 8 | 0x13D |
| canonical_no_ready.log | 525 | 525 | 8 | 8 | 0x13D |
| canonical_pointer_const_getters.log | 525 | 525 | 8 | 8 | 0x13D |
| canonical_win32.log | 525 | 525 | 8 | 8 | 0x13D |
| copyctor_snapshot.log | 525 | 525 | 63 | 63 | 0x134 |
| ea_both_snapshots_copyctor.log | 525 | 525 | 75 | 75 | 0x134 |
| ea_copyctor_inline_assignment.log | 489 | 525 | 159 | 195 | 0x017 |
| ea_receiver_before_copyctor.log | 525 | 525 | 75 | 75 | 0x134 |
| escaped_snapshot_aggregate2.log | 517 | 525 | 158 | 166 | 0x0B3 |
| escaped_snapshot_both_loops.log | 525 | 525 | 48 | 48 | 0x0B3 |
| escaped_snapshot_memcpy8.log | 517 | 525 | 158 | 166 | 0x0B3 |
| explicit_command_subobject.log | 525 | 525 | 8 | 8 | 0x13D |
| inherited_command_receiver.log | 525 | 525 | 8 | 8 | 0x13D |
| iterator_ctor_visible.log | 466 | 525 | 394 | 453 | 0x000 |
| iterator_first_next_visible.log | 525 | 525 | 8 | 8 | 0x13D |
| iterator_next_visible.log | 525 | 525 | 8 | 8 | 0x13D |
| minimum_snapshot_live_object.log | 525 | 525 | 35 | 35 | 0x0C1 |
| minimum_snapshot_union.log | 525 | 525 | 35 | 35 | 0x0C1 |
| native_alias_assumption.log | 506 | 525 | 313 | 332 | 0x000 |
| native_cross_function_alias.log | 525 | 525 | 8 | 8 | 0x13D |
| native_direct_snapshot.log | 513 | 525 | 163 | 175 | 0x11E |
| native_disabled_mask_width.log | 525 | 525 | 153 | 153 | 0x072 |
| native_iterator_early_lifetime.log | 525 | 525 | 8 | 8 | 0x13D |
| native_position_snapshot.log | 513 | 525 | 163 | 175 | 0x11E |
| native_pure_virtual_receiver.log | 525 | 525 | 8 | 8 | 0x13D |
| native_size_cost.log | 397 | 525 | 321 | 449 | 0x000 |
| native_stl_list.log | 525 | 525 | 8 | 8 | 0x13D |
| native_thing_object_layout.log | 525 | 525 | 8 | 8 | 0x13D |
| native_two_field_ctor.log | 533 | 525 | 147 | 155 | 0x11E |
| snapshot_alias_restrict.log | compile failed | | | | |
| snapshot_assignment.log | 479 | 525 | 165 | 211 | 0x017 |
| snapshot_barrier.log | 525 | 525 | 14 | 14 | 0x130 |
| snapshot_barrier_centroid_value.log | 521 | 525 | 154 | 158 | 0x11E |
| snapshot_copy2d.log | 517 | 525 | 143 | 151 | 0x11E |
| snapshot_direct_nontrivial.log | 525 | 525 | 18 | 18 | 0x13D |
| snapshot_initlist_copy.log | 525 | 525 | 18 | 18 | 0x13D |
| snapshot_initlist_with_assignment.log | 479 | 525 | 165 | 211 | 0x017 |
| snapshot_memcpy8.log | 517 | 525 | 143 | 151 | 0x11E |
| snapshot_pointer_xy_ctor.log | 525 | 525 | 8 | 8 | 0x13D |
| snapshot_readbarrier.log | 530 | 525 | 191 | 196 | 0x119 |
| snapshot_return_assignment.log | 525 | 525 | 8 | 8 | 0x13D |
| snapshot_writebarrier.log | 525 | 525 | 14 | 14 | 0x130 |

## Checks and remaining blockers

The copied movement helper passes its strict 219-byte selected-row comparison and reference checks in build/scatter-00155490/scoped_move_gate.log. Its inherited aiMoveToPosition decoration remains CONTRADICTED at the actual ILT thunk in build/scatter-00155490/oracle_move.log. This is an inherited identity limitation, not a new pin or a helper recovery. The target and recompute names are CONFIRMED in oracle_target.log and oracle_recompute.log.

Target reference checks pass in build/scatter-00155490/target_references.log. CSV and pin checks pass in check_csv_current.log and pin_consistency.log. The canonical coordinate trial passes class_gate in class_canonical_both.log but retains the same eight-byte mismatch. The unchanged bank carries private coordinate declarations, so its class_gate output is not clean; class_bank.log retains that refusal. A source-file invocation of this revision's revision-based name_regression CLI fails and is preserved in name_regression_canonical.log. No conversion is claimed, so those checks are not represented as a passing landing certificate. No full gate is required by the evidence-only changes.

The source blocker remains regalloc/snapshot-copy-scheduling at the eight offsets in resolved_byte_differences.log. The inherited movement-helper identity and independent vector-payload interpretation remain acceptance limitations. Reopening requires an independently supported source lifetime or copy operation that produces the sequential EAX transfer while preserving centroid scheduling, or new canonical declaration/callee evidence that changes the eight-byte result. None of this run's candidates is closer than the preferred bank, so no bank replacement is made.
