# AIGroup scatter and visible command lifetime

This is a partial reconstruction of the complete function at RVA 0x00155490. It does not claim an exact recovery. The tested repository revision is e5baa250729b78a33aadc4b41bee11eea2a709ef, and the actual model is gpt-6.1-sol. The original preferred bank is preserved in the attempt history. Trial sources and unedited probe output are retained in build/scatter-close/.

## Reproduced boundary and identity

The decoded body contains one return, RET 4 at offsets 0x20A through 0x20C, followed by INT3. Its complete extent is 525 bytes. The generated ledger extent of 509 bytes ends before the complete epilogue. Every conditional branch stays inside the complete extent, and there is no outgoing tail jump. The decoded dispatcher calls ILT 0x00038EE2 at RVA 0x00398F0A with the selected group in ECX and CMD_FROM_PLAYER, a four-byte zero argument, on the stack. The thunk jumps to 0x00155490. The repository's named GameLogic scatter case and EA's groupScatter body independently support the target identity. The ILT oracle confirms the target decoration.

Raw evidence: build/scatter-close/retail.log, build/scatter-close/checked_target.log, build/scatter-close/session_target.log, and build/scatter-close/oracle.log.

## New hypothesis and measurement

The saved bank reproduces at 525 bytes with 34 differences. Its explicit minimum/destination union puts snapshots into retail's destination slot and the destination into retail's snapshot slot. The new hypothesis was that the compiler lacked the actual non-retaining command implementation, so it conservatively prevented two address-taken coordinate lifetimes from sharing storage. The refutation condition was that exposing the complete command body would leave those stack displacements unchanged.

Making the complete position-command implementation visible as an inline, noinline definition permits ordinary scoped bounds and destination locals to share retail's storage. The improved candidate emits 525 bytes with eight differences, and all coordinate stack displacements now match. This effect survives moving the helper after the target. The bounds helper can remain an external declaration. An earlier intermediate experiment exposing the bounds implementation reduced 34 differences to 27, but that helper is unnecessary in the preferred candidate and is omitted.

The visible command copy uses the same static STLport allocator setting as its existing matched owner. Its complete 219-byte body matches retail outside relocation operands. Its cleanup reads the parameter object at EBP minus 0xA8 and tail-jumps to the existing AICommandParms destructor, matching retail's unwind action. It is an inline definition, so it does not introduce a second strong definition. This is visibility evidence, not a new recovery or a new helper identity claim.

Raw evidence: build/scatter-close/bank.log, build/scatter-close/bank_canonical_recompute.log, build/scatter-close/move_visible_only.log, build/scatter-close/move_helper_after_target.log, build/scatter-close/native_static_helper.log, build/scatter-close/improved.cod, and build/scatter-close/eh_move.log.

## ABI, fields and cleanup

The target receives its group through ECX and one four-byte command-source argument, and returns with RET 4. It does not use hidden result storage. The complete bounds helper receives minimum, maximum and center pointers in that order and returns with RET 12. It writes two floats at offsets zero and four through each bounds pointer, and three floats at offsets zero, four and eight through the center pointer. It does not retain those pointers. The target's snapshots read Object offsets 0x38, 0x3C and 0x40, and the movement helper copies every destination component before its virtual command dispatch. The command receiver adjustment is AI plus 0x20, as decoded at the target's call site.

Iterator insertion consumes an Object pointer and the float representation produced by the distance expression and returns with RET 8. The iterator constructor initializes the vptr and the three fields at offsets four, eight and twelve. The actual vtable slots four and eight reach complete first and next implementations. First forwards a null numeric-output pointer to firstWithNumeric, which returns Object through EAX and returns with RET 4. Next returns Object through EAX without stack arguments. Both returned pointers are tested at the target. The node payload is read at offset eight; no container value type is inferred from allocation size alone.

The visible command's parameter constructor initializes the vector header at offsets 0x20, 0x24 and 0x28, and its actual copy helper reads and writes every element word at offsets zero, four and eight with a twelve-byte stride. The helper is decoded completely, including both returns. The vector declaration is inherited from the existing canonical donor; this experiment does not infer floating payload semantics from its stride or mangled pin. The coordinate argument copied into the parameter object's position member is independently established by its three field accesses and the target's floating arithmetic.

The target has one unwind state, active only around the iterator constructor. Its cleanup reads the allocation pointer at EBP minus 0x30, calls the global deallocator, pops the argument and returns. The retained compiler listing emits the same complete eleven-byte action. After successful construction, the target resets the state to minus one and performs no iterator destruction on its ordinary return. No member ownership is added by the reconstruction.

The bank's recompute declaration is corrected to private, matching the existing canonical decoration and confirmed oracle result. No pin is added or rewritten.

Raw evidence: build/scatter-close/checked_bounds.log, build/scatter-close/checked_iterator_ctor.log, build/scatter-close/checked_insert.log, build/scatter-close/checked_move.log, build/scatter-close/abi.log, build/scatter-close/vector_copy.log, build/scatter-close/checked_vector_copy.log, build/scatter-close/eh_target.log, build/scatter-close/improved.cod, and build/scatter-close/oracle_recompute.log.

## Remaining mismatch and rejected hypotheses

The strict scoped comparison resolves every direct call and reports exactly eight differing bytes at +0x13D, +0x13E, +0x13F, +0x140, +0x141, +0x142, +0x143 and +0x145. Retail stores the x snapshot from EAX, then loads y into EAX and stores it. The candidate preloads y into EDX before the x store, then stores y from EDX. The instruction stream rejoins at +0x148. This is the remaining blocker; stack size, coordinate displacements and the allocation cleanup slot agree.

Raw evidence: build/scatter-close/scoped_gate_final.log. The raw byte table in that log is authoritative. The final preferred bank is independently reprobed in build/scatter-close/bank_final.log. CSV and pin checks pass in build/scatter-close/check_csv_final.log and build/scatter-close/pin_consistency_final.log. The bank retains its descriptive declarations and the original complete donor source is archived. Its target method and the inherited isReady definition are the only group definitions retained in the preferred file.

The retained trials reject explicit aggregate storage overlays, larger bounds storage, separate phase unions, shared or nested snapshot lifetimes, empty coordinate constructors, value-returning snapshot and destination helpers, ordinary and forced inline factories, accessor references, native pointer setters, three-argument setters, aggregate initialization, zero initialization, source-bit copies, inherited position accessors, native receiver acquisition order, full EA declaration lifetimes, literal math constants, processor tuning and float-consistency flags. Generated adjacent-store choices and exception specifications on the actual bounds, recompute and sort declarations do not improve the residue. Diagnostic volatility worsens the body and is not adopted. Whole-struct snapshot copy introduces a position-pointer shape absent from retail. Every trial source has a same-named raw probe log in build/scatter-close/. The running experiment record is build/verdict.txt.

Reopen with an independently justified copy or aliasing construct that explains the sequential one-register snapshot transfer, or evidence of a different native getter declaration. Repeating scope, field-store order or coordinate declaration-order changes without new evidence is not justified.

## Inherited helper identity limitation

The existing aiMoveToPosition decoration at 0x000D86C0 is contradicted by the ILT oracle, including at its actual thunk 0x0003436A. The tested access, virtual and const variants are also contradicted. Both the existing function row and pin are already in the repository's contradicted-name baseline. The bank retains this established name and adds no identity claim or ledger row. This inherited helper identity needs coordinator review before an exact landing can be claimed. The address, complete command behavior and ABI are decoded; a byte match does not resolve the name dispute.

Raw evidence: build/scatter-close/oracle_helper_access.log and build/scatter-close/oracle_move.log. No baseline, policy, shared header or tooling file is changed.
