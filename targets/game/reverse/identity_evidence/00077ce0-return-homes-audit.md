# Return-object homes at 0x00077CE0

This retry tests the unchanged bank `targets/game/reverse/attempts/0x00077ce0.cpp` at revision `cad8b7c5926ae06e9ed769454a6af23d3818ef4b`, using gpt-6.1-sol. It recovers no new source bytes and changes no function row or pin. All trial sources and unedited subprocess outputs remain under build/target-00077ce0-run8. The bank remains byte-for-byte identical to its initial snapshot, whose SHA-256 is recorded in original-bank.json. The inherited marker assembly remains diagnostic; this note does not claim a clean C++ conversion.

## Result and refutation

The bank reproduces 339 bytes with eight differing non-relocation bytes and no missing bytes. All fifteen relocation operands align with complete decoded retail instructions. The raw baseline is build/target-00077ce0-run8/original-bank.probe.log; the independently checked relocation locations are in relocation-alignment.json. The strict scoped gate is build/target-00077ce0-run8/13-bank.gate.log.

The new hypothesis was that native accessor visibility or return-object lifetimes reserve the unused space below the receiver temporary. It was supported by the compiler's local-slot table and tested against the actual STLport find, end, iterator and pair definitions. A trial that left the frame and receiver/switch offsets unchanged, or introduced additional instructions instead of the required reservation, refuted that specific spelling. None of the trials improved the original bank. The justified experiments in this run are exhausted; this is not a claim that every possible original source spelling has been tested.

| Difference offset | Retail byte | Bank byte | Decoded operand |
|---|---|---|---|
| +0x05 | 0x48 | 0x2C | Frame reservation in `sub esp` |
| +0x08 | 0xC0 | 0xDC | Receiver spill at -0x40 instead of -0x24 |
| +0xBC | 0xBC | 0xD8 | Operation snapshot store at -0x44 instead of -0x28 |
| +0xBF | 0xBC | 0xD8 | Operation snapshot reload at -0x44 instead of -0x28 |
| +0xC2 | 0xB8 | 0xD4 | Switch working-value store at -0x48 instead of -0x2C |
| +0xC5 | 0xB8 | 0xD4 | First switch comparison at -0x48 instead of -0x2C |
| +0xCB | 0xB8 | 0xD4 | First switch decrement at -0x48 instead of -0x2C |
| +0xD1 | 0xB8 | 0xD4 | Second switch decrement at -0x48 instead of -0x2C |

The compiler listing build/target-00077ce0-run8/02-slots.cod places the two named iterators at -4 and -8, the record pointer at -12, the copied pair at -20, the end-result temporaries at -24 and -28, and the one-byte receiver temporary at -29. These accessed slots already agree with retail. The receiver spill and two switch snapshots follow them. Retail has an additional unused region before those final three slots. No decoded target instruction accesses that region, so padding alone would not establish the original declaration.

## Boundary, types and calling convention

The complete target is [0x00077CE0, 0x00077E33), with INT3 bytes before and after it. Its sole return at 0x00077E30 uses `ret 4`. Every conditional branch and ordinary jump remains inside the extent and reaches the common epilogue. There is no tail jump, indirect call, virtual call or exception registration. The incoming receiver is spilled and never read again. The incoming key occupies one four-byte stack slot and is passed by reference. The target constructs no owning object and has no constructor unwind path to check.

The complete enclosing caller [0x00079060, 0x0007ACFA) includes the instruction-aligned call at 0x0007ACE2. It pushes 0x36 and passes the address of a zero-initialized byte in ECX through ILT 0x000423F7. It does not consume a return value (one observed call site). The generated fragment starting at 0x0007AC77 is not used as a function boundary. The receiver layout and original owner remain unknown; this run preserves the bank's existing identifiers without claiming an EA identity.

Complete decodes are in build/target-00077ce0-run8/retail-complete.decode.txt. checked-<rva>.log files retain the checked-callee inventory for the target, complete caller, singleton accessors, search wrappers, searches, end-output helpers, comparisons, dereference, value copy and insertion chain. Those inventories report no outgoing conditional branch or tail jump. Top-level ILT instructions are in routes.decode.txt, and the search/insertion helper ILT instructions are in helper-routes.decode.txt. Each helper route was checked against its decoded jump target.

The search wrappers at 0x000762B0 and 0x00075E80 forward the hidden result pointer and key reference to 0x00072D70 and 0x00072730. Both searches compare four-byte keys using unsigned branches, write one node pointer through the hidden result on both return paths, return that output pointer in EAX and use `ret 8`. The end-output helpers at 0x00072510 and 0x000724F0 read the receiver's first word, write it through the result pointer, return the result pointer and use `ret 4`. The iterator comparisons at 0x00061B60 and 0x00064370 consume one four-byte argument and return a boolean that the target reads from AL. Dereference at 0x0006B540 returns node +0x10 and uses plain `ret`.

The complete value-copy helper at 0x0006C5E0 reads source +0 and +4, writes destination +0 and +4, returns the destination receiver and uses `ret 4`. It has no additional field access or return path. The target reads the copied second word as a record pointer. The complete membership insertion chain through 0x00077C70, 0x00076E10, 0x00076190 and 0x00072C90 copies one source word to node +0x10 on both allocation branches. This supports a scalar unsigned-ordered membership value and a two-word key/pointer map value independently of allocation sizes or donor names. It does not establish the original typedefs or modifier arithmetic signedness.

The target reads four-byte record fields at +0x18, +0x20, +0x24 and +0x30. It assigns, adds or subtracts the value through the destination pointer, then writes the processed flag. For an already processed record it calls 0x00077C70 with the same key and the zero-initialized byte receiver. That helper ignores its receiver and uses `ret 4`. The record pointer is non-owning in this target. The current bank's record and receiver declarations remain views of these accesses, not complete identified classes.

The existing singleton, output-copy and tree-insertion sources were read directly. The donor `ImageCollection::findImageByName` and the complete native STLport tree-search, iterator and pair definitions were also read. The singleton declarations use their existing pointer-returning names. No donor name, generated hash-map name, matching instantiation or allocation size was used as independent type evidence. No shared canonical class declaration was contradicted by a new source.

## Rejected experiments

Every trial source has a matching .probe.log and, when the target symbol was emitted, an object snapshot and JSON receipt. measurements.json derives its data from those receipts. Probe difference counts for shifted relocation layouts are only diagnostics; missing bytes remain failures, and no shifted trial is used to rank above the aligned baseline.

- The 04-wrapper trials independently expose set find, set end, map find, map end and map dereference through static force-inline accessors, then combine them. The dereference wrapper leaves the residue unchanged. The others introduce a saved ESI or different evaluation order and do not reserve the missing space. The combined body is shorter and has relocation drift.
- The 05-copy trials test copy initialization, a reference bound to a copied pair, an explicit pair temporary and references bound to the two find results. Copy initialization and the explicit pair temporary leave the residue unchanged. Bound references add loads/stores and move already-correct slots.
- The 06-pragma trials compare an explicitly unoptimized body under neighbouring optimization profiles, intrinsic expansion, embedded debug information and alias assumptions. They lose the bank's two-snapshot switch lowering and retain the wrong receiver home. They do not improve the bank.
- The 08-result trials materialize explicit iterator copies at each find and end expression, separately and together. End copies leave the residue unchanged. Find copies add loads/stores or a constructor call and enlarge the body instead of merely preserving unused homes.
- The 09-debug trials leave the residue unchanged under `/Zi`, `/Z7`, `_STLP_NO_EXCEPTIONS` and `_STLP_NO_EXTENSIONS`. `/ZI` is incompatible with `/Og`; that compiler rejection is retained and is not a measurement.
- The 10-body-pragma trials enable or disable global optimization specifically around the target. Enabling it leaves the residue unchanged; disabling it loses the switch snapshot shape. The 11-inline and 12-inside-class-emitted trials test inline declaration and a definition inside the class while forcing emission through a member-function pointer. Both leave the residue unchanged. The initial unused in-class definition emits no target symbol and is recorded as such.

The prescribed copy/frame generator reports no applicable choice in build/target-00077ce0-run8/03-family-choices.json. The unchanged shape-search invocation rejects the bank's inherited assembly, as recorded in 03-search.log. Neither tool was modified or bypassed; manual diagnostic probes retain the marker assembly and do not constitute acceptance.

The adjacent insertion helper is a read-only control, not another recovery. Its native ignored `set::insert` return produces 89 bytes with only the frame reservation and receiver spill different. Retail reserves eight additional unused bytes below its returned pair. The raw control is build/target-00077ce0-run8/07-control.probe.log, with its source and compiler listing beside it. That observation supports investigating unused return-object homes, but does not prove that retail reserves a second copy. Explicit result-copy trials did not reproduce that mechanism. No control ledger row, bank or pin is changed.

## Checks and remaining blockers

The strict scoped gate fails function verification on the eight shape bytes and seven unresolved decorated calls. The latter are the set/map find and end, map dereference, copied pair constructor and `Rva00077C70Receiver::method(int)`. Their machine routes and argument widths were decoded, but provider ownership and canonical binding remain unresolved. Adding all these pins without settling their existing generated identities would spread the dependency repair beyond this body. No pin was added.

String, constant, DIR32 and body guards pass in build/target-00077ce0-run8/13-bank.gate.log. CSV integrity and pin consistency pass in initial-check-csv.log and pin-consistency.log. The bank's class gate passes in final-bank-class-gate.log. The declared-unmatched check refuses the unchanged bank because it has no source ledger row; its raw output is bank-declared-unmatched.log. This is a bank, so no new or changed game source requires that refusal to be cleared. No source moved or renamed, and no header or shim changed; a full gate is not required for this evidence-only outcome.

The remaining blockers are `stack-slot/reserved-return-homes` and `callee/canonical-bindings`. Reopening needs a source- or compiler-supported lifetime that reserves the unused region without changing the decoded accesses, or independently settled callee declarations/providers together with a new frame experiment. A larger guessed value type, fake unused padding, another unchanged register spelling or relocation-masked equality is insufficient. Exactly one blocked verdict records this run. The preferred bank is retained without replacement because no trial measures closer.
