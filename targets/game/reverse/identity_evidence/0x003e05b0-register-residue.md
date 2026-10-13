# Movement callback at 0x003E05B0

The 715-byte callback is recovered in game/GameEngine/Source/GameLogic/AI/PathfinderStepE05B0.cpp as Pathfinder::bfmeStepE05B0_003E05B0. Complete extent and strict relocation-resolved byte checks pass at revision 574de716f6fec638c9ae834f116549b9813d10c2 with gpt-6.1-sol. The eight-digit suffix retains an address identity because the EA method spelling is unknown. The original preferred bank is preserved verbatim in build/e05b0-run2/original-bank.cpp; the landing transaction removes its tracked bank path. No runtime test or EA method-name recovery is claimed.

The decisive source change separates the goal subtype tests into `if (cellSubType == 1)` and `else if (cellSubType == 4)`, each storing the same output byte. The original combined `if (cellSubType == 1 || cellSubType == 4)` produces the wrong long-lived register assignment. Both two-branch forms, with and without `else`, reproduce every retail instruction and the complete extent. The final source retains the bank's declarations and descriptive names, uses canonical Object and Thing headers, declares PathfindCell as a class to bind the actual callees, and uses the recorded TheGameLogic datum instead of a numeric image address. Applicable original Zero Hour comments accompany the corresponding statements.

## Retry hypothesis and decisive measurements

The second investigation began by reproducing the original register exchange and checking every remaining differing offset against the retail instruction stream. The new hypothesis was that the subtype dispatch graph, rather than the receiver ABI or stack-slot storage hints, changes the register allocator's value lifetimes. Its refutation condition was unchanged emitted bytes, register mapping and relocations after a structurally different dispatch.

A goal-only sparse switch removes the whole EBP/EDI exchange and emits the correct 715-byte extent, leaving five bytes different at +0x151, +0x152, +0x153, +0x157 and +0x158. Retail uses `CMP EBP,1` and `CMP EBP,4`; the switch uses `MOV EAX,EBP`, `DEC EAX` and `SUB EAX,3`. Separating the two goal branches then retains the native assignment while producing the retail comparisons. This refutes the earlier practical claim that the mirror was exhausted. The switch measurement is build/e05b0-run2/goal-switch-probe.log. Exact measurements are build/e05b0-run2/separate-goal-branches-probe.log and build/e05b0-run2/independent-goal-branches-probe.log. The final named source also probes exact in build/e05b0-run/run2-final-source-probe.log and passes the complete strict check in build/e05b0-run2/final-source-strict-gate.log.

The baseline reproduces 716 emitted bytes against 715 retail bytes, with 122 overlapping non-relocation differences and one extra byte. The source-shape search retains every hypothesis, trial source, timestamp and unedited probe output in build/e05b0-run2/. No unchanged register or compiler-flag sweep was repeated. The first run's prior experiments and raw evidence remain under build/e05b0-run/; its evidence note is preserved in build/e05b0-run2/first-run-evidence.md.

## Boundary and ABI evidence

The complete retail body spans 0x003E05B0 through 0x003E087A. Both return paths restore the four saved registers and the 0x18-byte local frame, return a Boolean in AL and execute RET 8. Every conditional branch and unconditional jump remains inside that extent. There is no exception registration, unwind map, tail call or indirect call in the target. Raw evidence is build/e05b0-run/003e05b0-decode.txt and build/e05b0-run/003e05b0-callees.log.

The complete callers at 0x003E5820 and 0x003E5950 pass a Pathfinder receiver in ECX, push their movement-state address first, and then push their Object pointer. The state starts at caller offsets +0x0C and +0x08 respectively. Their calls to ILT 0x0004A980 consume the Boolean through TEST AL. The decoded thunk jumps directly to this target. These callers prove the physical receiver and argument order, not an EA method name. Raw evidence is build/e05b0-run/003e5820-decode.txt, build/e05b0-run/003e5950-decode.txt and build/e05b0-run/0004a980-decode.txt.

Complete decoded extents and checked-callee output were retained for every direct callee body: PathfindLayer::getCell at 0x003FBAB0, Object's computer-control predicate at 0x001BE410, the movement predicate at 0x003D4F90, GameLogic's object lookup at 0x0009A510, the relationship body at 0x001C7950, Thing::isKindOf at 0x000A2CF0 and Object::canCrushOrSquish at 0x001C7600. Each target ILT was decoded separately. Their argument cleanup agrees with the caller's two coordinates, niladic predicate, two movement arguments, one object ID, one relationship argument, one kind argument and two crush arguments. The Object relationship body's outgoing tail jump at +0x127 was followed through 0x0000CC2A to the complete Team relationship body at 0x000F0E00, which returns an EAX relationship value with RET 4. The Object relationship body's virtual call at +0x9B has no pushed argument or hidden result storage and uses the returned pointer in EAX. These helper internals do not establish another owner or vtable identity. Raw files use build/e05b0-run/<eight-digit-rva>-decode.txt and build/e05b0-run/<eight-digit-rva>-callees.log.

The saved Object and Thing declarations include their canonical headers. Retail reads Object::m_id at +0x74 and the AI pointer at +0x204 without a receiver adjustment. Cell lookup fetches a four-byte row pointer indexed by x and adds y multiplied by 16; the cell's information pointer is at +0 and its bit word at +0x0C. The information record's object ID is read at +0x18. No allocation or template donor was used to infer those fields.

The complete movement predicate reads a dword at payload +0, separate bytes at +4 and +5, and a signed dword at +8. The complete initializer at 0x003D54E0 writes those same fields at state +0x1C, +0x20, +0x21 and +0x24, including -1 in the last field. It separately initializes the state coordinates, layer, radius, Boolean inputs, flags, ignore ID and output fields. The structured and flattened payload trials preserve these widths and offsets. Raw evidence is build/e05b0-run/003d4f90-decode.txt and build/e05b0-run/003d54e0-decode.txt. This initializer establishes a compatible storage layout; it does not prove that the separately named initializer class is the target's source type.

GameLogic's complete lookup walks linked nodes through +0, compares the four-byte key at +4 with the incoming object ID and returns the pointer payload at +8. It does not construct or copy values. No container value type is inferred from allocation size or from a named template instantiation.

## Original bank residue

The original bank and the first corrected declaration trial emit 716 bytes against retail's 715, with 122 differing overlapping non-relocation bytes. Counting the extra emitted byte gives the coordinator's 123-byte total mismatch. Raw measurements are build/e05b0-run/baseline-probe.log and build/e05b0-run/canonical-cell-probe.log. The strict resolved byte check is build/e05b0-run/canonical-scoped-gate.log; every relocation resolves, but byte equality and complete emitted extent fail.

Retail holds the state in EDI. It holds the Pathfinder receiver in EBP until +0x142, reuses EBP for the cell subtype, and reloads the receiver from [ESP+0x24] at +0x27F. The bank exchanges EBP and EDI throughout those value lifetimes. After substituting that exchange, accounting for the relocation operand and aligning branches by destination, every non-prologue operation agrees. The only alignment edits are the prologue's moved pushes and state loads and the missing retail NOP at +0x4F. The first state coordinate read at +0x3B needs an extra zero displacement when its base is EBP. That byte consumes the retail alignment NOP, so the inner loop starts at the same offset. The second coordinate read at +0x2A2 needs another zero displacement, which shifts the outer-loop tail and both epilogues by one byte. Forward exits to the false epilogue and the outer backward branch consequently have different displacement bytes. No branch destination changes after instruction alignment. The independently rerunnable comparison is build/e05b0-run/compare.py; its complete per-byte instruction attribution and strict relocation resolution are in build/e05b0-run/canonical-cell-differences.txt.

The exact differing overlapping byte offsets are +0x005 +0x006 +0x007 +0x008 +0x009 +0x00A +0x00B +0x00C +0x00D +0x00E +0x00F +0x010 +0x011 +0x013 +0x015 +0x01A +0x01E +0x021 +0x024 +0x027 +0x02A +0x03C +0x03D +0x03E +0x03F +0x040 +0x041 +0x042 +0x043 +0x044 +0x045 +0x046 +0x047 +0x048 +0x049 +0x04A +0x04B +0x04C +0x04D +0x04F +0x051 +0x054 +0x072 +0x075 +0x079 +0x07E +0x082 +0x087 +0x08B +0x090 +0x094 +0x0A9 +0x0BC +0x0C9 +0x0D9 +0x0F4 +0x0F7 +0x102 +0x128 +0x131 +0x135 +0x140 +0x143 +0x146 +0x149 +0x152 +0x157 +0x15C +0x17A +0x1A9 +0x1AE +0x1CB +0x1CF +0x1D8 +0x249 +0x24B +0x24F +0x251 +0x26A +0x26E +0x270 +0x280 +0x28F +0x2A3 +0x2A4 +0x2A5 +0x2A6 +0x2A7 +0x2A8 +0x2A9 +0x2AA +0x2AB +0x2AC +0x2AD +0x2AE +0x2AF +0x2B0 +0x2B1 +0x2B3 +0x2B4 +0x2B5 +0x2B6 +0x2B7 +0x2B8 +0x2B9 +0x2BA +0x2BB +0x2BC +0x2BD +0x2BE +0x2BF +0x2C0 +0x2C1 +0x2C2 +0x2C3 +0x2C4 +0x2C5 +0x2C6 +0x2C7 +0x2C8 +0x2C9 +0x2CA. The extra emitted byte is at +0x2CB.

## Rejected source hypotheses

Byte-sized subtype storage introduces a different narrow shift web and worsens the match. Signed packed-cell storage introduces arithmetic shifts that retail does not use. The post-lookup subtype switch removes the Boolean control shape and shortens the body. A single result variable changes the return graph and extent. Enum subtype storage, byte input flags, a shared failure label, disjoint pointer union, scoped info-pointer load, separate lookup-result declaration, native zero initializer, coordinate and extent aggregate views, the occupancy block and explicit while loops all preserve the original mirror. The goal switch's copy discriminator and labels restore the mirror; changing switch case order or duplicating case stores retains its five arithmetic-comparison differences. Narrow switch discriminators introduce new conversions. The measurements below retain these rejected hypotheses without inventing a semantic correction.

| Trial | Emitted bytes | Overlapping differences | Raw output |
| --- | --- | --- | --- |
| baseline | 716 | 122 | build/e05b0-run2/baseline-probe.log |
| byte-subtype | 716 | 627 | build/e05b0-run2/byte-subtype-probe.log |
| enum-subtype | 716 | 122 | build/e05b0-run2/enum-subtype-probe.log |
| shared-failure-label | 716 | 122 | build/e05b0-run2/shared-failure-label-probe.log |
| single-result-exit | 722 | 634 | build/e05b0-run2/single-result-exit-probe.log |
| signed-bitword | 716 | 124 | build/e05b0-run2/signed-bitword-probe.log |
| byte-input-flags | 716 | 122 | build/e05b0-run2/byte-input-flags-probe.log |
| cell-result-union | 716 | 122 | build/e05b0-run2/cell-result-union-probe.log |
| scoped-info-load | 716 | 122 | build/e05b0-run2/scoped-info-load-probe.log |
| split-object-result | 716 | 122 | build/e05b0-run2/split-object-result-probe.log |
| initialized-object-result | 716 | 122 | build/e05b0-run2/initialized-object-result-probe.log |
| subtype-switch | 688 | 601 | build/e05b0-run2/subtype-switch-probe.log |
| goal-switch | 715 | 5 | build/e05b0-run2/goal-switch-probe.log |
| aggregate-map-extent | 716 | 122 | build/e05b0-run2/aggregate-map-extent-probe.log |
| flattened-state-coordinates | 716 | 122 | build/e05b0-run2/flattened-state-coordinates-probe.log |
| scoped-occupancy | 716 | 122 | build/e05b0-run2/scoped-occupancy-probe.log |
| outer-while | 716 | 122 | build/e05b0-run2/outer-while-probe.log |
| inner-while | 716 | 122 | build/e05b0-run2/inner-while-probe.log |
| separate-goal-branches | 715 | 0 | build/e05b0-run2/separate-goal-branches-probe.log |
| independent-goal-branches | 715 | 0 | build/e05b0-run2/independent-goal-branches-probe.log |
| copy-goal-discriminator | 716 | 122 | build/e05b0-run2/copy-goal-discriminator-probe.log |
| distinct-goal-switch-bodies | 715 | 5 | build/e05b0-run2/distinct-goal-switch-bodies-probe.log |
| reverse-goal-switch-cases | 715 | 5 | build/e05b0-run2/reverse-goal-switch-cases-probe.log |
| goal-switch-default | 715 | 5 | build/e05b0-run2/goal-switch-default-probe.log |
| goal-dispatch-labels | 716 | 122 | build/e05b0-run2/goal-dispatch-labels-probe.log |
| switch-byte-discriminator | 717 | 569 | build/e05b0-run2/switch-byte-discriminator-probe.log |
| switch-short-discriminator | 716 | 333 | build/e05b0-run2/switch-short-discriminator-probe.log |
| switch-enum-discriminator | 715 | 5 | build/e05b0-run2/switch-enum-discriminator-probe.log |
| switch-plus-zero-case | 725 | 395 | build/e05b0-run2/switch-plus-zero-case-probe.log |
| switch-zero-one-four | 715 | 5 | build/e05b0-run2/switch-zero-one-four-probe.log |

## Names and collection checks

The inherited bank label is contradicted by the ILT oracle at the callback's own thunk 0x0004A980. Its EA spelling remains unknown. The final spelling preserves bfmeStepE05B0 and appends 003E05B0; ilt_oracle.tier classifies it as a placeholder, as the repository permits. Testing its hash is not identity evidence and the hash still does not fit. No pin is added for it. Matched callers prove the physical Pathfinder receiver, argument order, state layout and AL result; the source's address-qualified label makes no EA name claim. The inline getCell helper emits no body in this object and carries its complete absent-from-retail annotation. It must not be tested at this callback's RVA. Raw naming evidence is build/e05b0-run/check-ilt_oracle.log and build/e05b0-run2/oracle-final-names.log.

The final strict check resolves all twelve relocation sites and reports no unresolved symbols. The direct comparison using name_regression.regressions reports no bank-to-source descriptive-name regressions in build/e05b0-run2/bank-source-name-regression.log. The repository's name_regression command accepts Git revisions rather than two source paths; its path-form refusal is retained in build/e05b0-run/run2-name-regression-draft.log. No policy, shared header, shim, tooling or baseline changes are part of the conversion, so a full gate is not required. Scoped landing and final gate receipts are recorded under build/e05b0-run2/.

The final declaration check, class gate, pin consistency and ILT guard pass in build/e05b0-run2/declared-unmatched.log, build/e05b0-run2/class-gate.log, build/e05b0-run2/pin-consistency.log and build/e05b0-run2/ilt-guard-working-tree.log. The final scoped build passes in build/e05b0-run2/scoped-build.log. check_csv passed before the conversion; after it, check_csv.py stops with FileNotFoundError while reading the unstaged deleted bank from its Git-derived source membership. Its unedited output is build/e05b0-run2/check-csv.log. The conversion remains intact because this checkout cannot stage Git changes; the coordinator must stage the new source and bank deletion with both ledgers before rerunning the integrity check. This is a collection prerequisite, not an unresolved byte or ABI claim.

The final comment-restored source is exact in build/e05b0-run/run2-final-source-probe-after-comments.log and passes the scoped build in build/e05b0-run/run2-final-scoped-build.log. The decoded kind indices are 0x73 PATH_THROUGH_EACH_OTHER, 0x7C PATH_THROUGH_INFANTRY and 8 INFANTRY in the shipped OBSTACLE-to-MOVE_FOR_NOONE name table; the original infantry comment is retained at the corresponding infantry bypass. The member-name oracle reports zero conflicts but computes no members for these minimal views, so it supplies no additional layout proof. Its raw output is build/e05b0-run2/member-name-oracle.log. Before the deleted-bank exception, the integrity checker reports exactly one other staging prerequisite: the new source is not yet tracked. Those raw diagnostics are build/e05b0-run2/ledger-prerequisites.log.

The target and the two matched movement neighbours use the same MSVC 7.1 compiler with the build default O2, GR- and EHsc-. The bank retains its DNDEBUG, DWIN32, MD and static STLport directives. The actual command comparison is build/e05b0-run2/compiler-command-comparison.log. The previously exhausted flag sweep was not repeated. The declaration and bank-name checks pass again for the final source, with raw output in build/e05b0-run2/declared-unmatched-final.log and build/e05b0-run2/bank-source-name-regression-final.log.
