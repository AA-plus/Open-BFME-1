# 001CABE0 getter and lifetime experiments

The preferred bank is unchanged and remains a partial. The tested revision is 0f5bc7c5f257ab09fc9a2c0dc4ff1234afb8dffb. Its SHA-256 is 32eb8a6ee171d41ffaa114d8766d856fae5b4a53fd51b2302fafbaf3e9908a07. The actual worker model was gpt-6.1-sol, confirmed by BFME_MODEL. No source recovery, identity correction, pin change or ledger conversion is claimed.

The initial hypothesis was that a supported consumed-index lifetime could make the final disguise-index load reuse the module register and change the downstream virtual-call temporary without disturbing the rest of the function. The refutation condition was an unchanged residue, new differing operands elsewhere, or additional instructions, spills, call targets or receiver changes. Every tested variant met that refutation condition. This does not prove that assembly is necessary or that every possible C++ form has been exhausted.

## Boundary, field and ABI evidence

Complete decoding independently confirms [0x001CABE0, 0x001CAD58). All three RET paths restore the saved registers and exception registration, and no conditional branch leaves that extent. There are no incoming stack arguments, receiver adjustment or hidden return storage; the result is a full-width EAX value. Complete Object::attemptDamage at 0x001D0490 calls ILT 0x0002CA61 with its unadjusted Object pointer in ECX and forwards EAX. The complete 0x00232570 wrapper supplies the same receiver and returns EAX with RET 4 for its own pointer argument. BfmeSubBIC::bfmeAskBIC is the inherited bank spelling; an EA owner or method identity remains unproven and has not been renamed.

The target and every direct callee were decoded through every return and outgoing branch. The exact ILT routes were read as instructions. Team's accessor reads +4 and then +8 and has no stack cleanup. The override resolver follows +4 links and returns a pointer. NameKeyGenerator and Object module lookup each take one four-byte argument and return through EAX with RET 4. The Player relationship query takes a Team pointer and returns a four-byte enum with RET 4. The active query returns a boolean used through AL. PlayerList's lookup accepts a signed four-byte index, checks the range 0 through 31 and reads its array at +0x14 before RET 4.

The StealthUpdate constructor at 0x002ACB70 and serializer at 0x002AC200 were completely decoded. The former initializes +0x34 to -1 and +0x38 to null; the latter transfers +0x34 as an integer and uses +0x38 for template-name lookup. These independently support the bank's signed index and template-pointer views. The target reads one four-byte mask word at ThingTemplate+0xD0; the bank's three-word mask view does not claim a complete template layout. The canonical Object header agrees with the target's template, contain, team and indicator-color offsets. Native donor code was read directly in PlayerList.cpp, ObjectTeamAndPlayer.cpp, ObjectQueryRva001CF9F0.cpp, the Zero Hour Object.cpp and the Zero Hour StealthUpdate.h, rather than inferred from earlier verdict descriptions.

The contain call is separately checked. The registered secondary vtable at VA 0x010AB598 has its +0x3C entry routing through ILT 0x000085CB to the complete 88-byte 0x0021E340 body. Its ECX receiver is the interface pointer supplied by this target, its sole stack argument is the observing Player pointer, and both returns use RET 4 with a Player pointer in EAX. Its relationship path reads the observing player's default team at +0x230. The caller adds no secondary-base adjustment.

Raw complete decoding and checked-callee output are in build/cabe0-worker9/decoded-evidence.log. Additional complete callers, accessor tail jump and ILT routes are in build/cabe0-worker9/decoded-extra-evidence.log. Separate inventories are build/cabe0-worker9/checked-target.log, build/cabe0-worker9/checked-object-controller.log, build/cabe0-worker9/checked-bank-wrapper.log and build/cabe0-worker9/checked-cxx-handler-thunk.log. The five immutable saved reconstructions were read and copied verbatim under build/cabe0-worker9/history/; their complete text is in build/cabe0-worker9/history/saved-reconstructions.log. Older saved boundary comments and integer-shaped fields are not treated as evidence.

## Exact remaining operands

The initial bank probe and final strict resolved gate reproduce the same residue. Each instruction has the same length, field offset and dynamic or direct call contract in the bank and retail.

| Byte offset | Retail | Bank |
|---|---|---|
| +0xD8 | MOV ESI,[ESI+0x34] at +0xD7 | MOV EDX,[ESI+0x34] |
| +0xE0 | PUSH ESI | PUSH EDX |
| +0xFD | MOV EDX,[ECX] at +0xFC | MOV EAX,[ECX] |
| +0x100 | CALL [EDX+0x3C] at +0xFF | CALL [EAX+0x3C] |

The bank emits 376 bytes with 22 relocations and four strict differences. The raw independent receipts are build/cabe0-worker9/baseline-probe.log, build/cabe0-worker9/bank-final-probe.log and build/cabe0-worker9/bank-final-scoped-gate.log. The scoped byte gate fails on those four bytes, with no unresolved direct symbols. Its string, constant, recorded DIR32 and DIR32-consistency checks pass, as does its complete compiled-boundary check.

## Rejected source hypotheses

Nested guard structure, assignment in the selection condition and an explicit failure join preserve the bank residue. Complete index-lookup member and free inlines, including interaction with a visible native noinline PlayerList lookup, also preserve it. Direct canonical Object field access and its contain accessor preserve it. These experiments test full source regions rather than another isolated index-local spelling.

The native signed-index getter consumes the module register and gets the virtual temporary into EDX, but mirrors ESI and EDI through the whole function and leaves 21 differing bytes. Canonical Object access, an authentic controller inline, a direct local-player load, out-of-class definition, constant nonvirtual member-pointer invocation, internal value and reference return locals, and pairing it with the native template-pointer getter do not remove that mirror. Its default-team and contain-field interactions introduce spills or structural drift. The template-pointer getter is distinct from the previously exhausted boolean isDisguised accessor.

The native Zero Hour fallback tree changes branch layout and is worse; placing that fallback in a member inline restores the bank residue. Extracting the complete selection region into a helper with static-key EH initialization leaves an out-of-line call despite forceinline. Keeping EH initialization in the caller allows the module-only reference-output helper to inline, but it preserves the bank residue. Returning the selected pointer from that module helper introduces the wider register mirror.

A constant pointer-to-member virtual call generates a separate dispatch thunk. A qualified virtual-call spelling was a negative control that suppresses dynamic dispatch and is rejected. The raw probe's small difference count for these cases masks shifted address operands and is not a recovery claim. A member virtual fastcall adapter, distinct from the previous free slot-pointer adapter, preserves ECX and the sole stack pointer but inserts an extra MOV EDX,EAX; both the bank and native-index forms grow to 378 bytes. Neither adapter is retained.

The explicit /Ob1 and /GB controls reproduce the bank residue. /Oy- changes the prologue and body size. The register-family generator produces no applicable choices for the bank, saved as build/cabe0-worker9/choices-register.json; no redundant empty search or unrelated EH sweep was run. Prior verdicts already exhaust isolated getter, local-order, visible-callee, copy-family and EH experiments, and those were not replayed as standalone experiments.

One scratch-generation error accidentally made the controller helper recursive. The invalid native-index-controller-inline.cpp and its raw output remain preserved; native-index-controller-inline-corrected.cpp independently reproduces the 21-byte mirror. It is excluded as evidence for a source hypothesis. All other trial sources and unedited probe outputs are stored under build/cabe0-worker9/ with matching <trial>.cpp and <trial>-probe.log names. The running measurement ledger is build/verdict.txt. This run created 34 trial source receipts, including the generation error and qualified-call negative control.

## Trial measurements

The raw-difference column is copied from each probe. The extent column additionally counts bytes that a shorter body never emits or that a longer body adds. Both remain screening measurements when relocation layout shifts; a strict address-aware comparison is required for acceptance. No trial is closer than the existing bank.

| Trial | Emitted bytes | Raw differences | Extent difference lower bound | Relocations |
|---|---|---|---|---|
| assignment-condition | 376 | 4 | 4 | 22 |
| blended-cpu | 376 | 4 | 4 | 22 |
| canonical-object-contain-accessor | 376 | 4 | 4 | 22 |
| canonical-object-fields | 376 | 4 | 4 | 22 |
| canonical-object-native-index-accessor | 376 | 21 | 21 | 22 |
| constant-member-dispatch | 376 | 4 | 4 | 23 |
| early-guard-join | 376 | 4 | 4 | 22 |
| explicit-inline-level | 376 | 4 | 4 | 22 |
| module-inline-reference-outputs | 376 | 4 | 4 | 22 |
| module-inline-value-result | 376 | 23 | 23 | 22 |
| native-fallback-member-inline | 376 | 4 | 4 | 22 |
| native-fallback-tree | 376 | 39 | 39 | 22 |
| native-index-contain-field | 378 | 121 | 123 | 22 |
| native-index-controller-inline-corrected | 376 | 21 | 21 | 22 |
| native-index-controller-inline | 1 | 1 | 376 | 0 |
| native-index-default-team-field | 381 | 269 | 274 | 22 |
| native-index-local-player-field | 376 | 21 | 21 | 22 |
| native-index-member-pointer | 376 | 21 | 21 | 22 |
| native-index-member-register-adapter | 378 | 120 | 122 | 22 |
| native-index-out-of-class-inline | 376 | 21 | 21 | 22 |
| native-index-return-reference-local | 376 | 21 | 21 | 22 |
| native-index-return-value-local | 376 | 21 | 21 | 22 |
| native-member-register-adapter | 378 | 108 | 110 | 22 |
| nested-guards | 376 | 4 | 4 | 22 |
| no-frame-omission | 379 | 276 | 279 | 22 |
| paired-native-module-accessors | 376 | 21 | 21 | 22 |
| qualified-virtual-dispatch | 376 | 4 | 4 | 23 |
| reference-dispatch | 376 | 4 | 4 | 22 |
| selection-inline-reference-outputs | 155 | 134 | 355 | 4 |
| selection-inline-value-result | 136 | 115 | 355 | 4 |
| template-pointer-accessor | 376 | 4 | 4 | 22 |
| whole-index-lookup-free-inline | 376 | 4 | 4 | 22 |
| whole-index-lookup-inline | 376 | 4 | 4 | 22 |
| whole-lookup-visible-native | 376 | 4 | 4 | 22 |

## Unwind verification and handoff

Retail FuncInfo at 0x00DF79D8 has one unwind state and points to the map at 0x00DF79D0. State 0 transitions to -1 through the 14-byte cleanup at 0x00C090C0, which clears bit 0 of the static-key guard. The compiled FuncInfo, map and cleanup have the same state transition and cleanup bytes outside their two consistent guard relocations. The handler routes to the pinned CxxFrameHandler import thunk. There are no constructor-owned members or heap cleanups in this target. Raw compiled verification is build/cabe0-worker9/compiled-unwind-corrected.log. The earlier local audit failure in compiled-unwind.log was an extraction-boundary mistake: the COFF reader includes the following symbol, so the corrected audit checks that following bytes equal the independently extracted next symbol before taking the map and cleanup extents.

Pin consistency and class gate pass in build/cabe0-worker9/pin-consistency.log and build/cabe0-worker9/bank-class-gate.log. Ledger validation passes in build/cabe0-worker9/check-csv.log. No shared header or source is changed, so no full gate is required. The best body remains targets/game/reverse/attempts/0x001cabe0.cpp without re-banking; its contents and line endings are unchanged. The remaining blocker is source register allocation, not an ambiguous boundary or ABI. Reopening requires a distinct, supported source or compiler-visibility hypothesis that predicts the index-register reuse and EDX dispatch while preserving the existing owner and controller registers. The tested hypotheses above do not provide it.
