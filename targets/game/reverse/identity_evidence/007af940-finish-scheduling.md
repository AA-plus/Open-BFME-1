# 0x007AF940: bounded finish investigation

## Result and reopening condition

No source recovery was landed. The preferred bank is unchanged. Its complete body still has the two independent instructions in the opposite order. The tested source levers did not improve it. Reopen with a specific source or compiler-IR hypothesis that predicts a different ordering at the first hidden-return call, or with a verified reconstruction of the actual caller translation unit. An unchanged register or x87 spelling is not a new experiment. These results do not prove that C++ cannot reproduce the order or that assembly is necessary.

The tested revision is 522952efd276837484023fc376360e17d82a60b0. The actual model is gpt-6.1-sol. First-run experiments and raw logs remain under build/af940-finish/, continuation evidence under build/af940-resume/, and the generated store search under build/shape_search/54a04203c3d2499d8b2250d0af87ea46/. Nothing under game/, the function ledger, pins, policy, tooling or shared headers was edited by this investigation. Its single uncommitted attempt-log verdict is updated in place.

## Boundary, helpers and calling convention

The complete retail target decode is build/af940-finish/007af940-retail.txt. It has no branch or indirect call, calls 0x007AF710 twice, removes its frame and both helper argument blocks with ADD ESP 0x68, and returns at +0x119. INT3 padding starts at +0x11A. This establishes the 282-byte extent. The checked inventory is build/af940-finish/007af940-checked-callees.log.

The complete minMax4 decode is build/af940-finish/007af710-retail.txt. Its two returns are at +0x65 and +0x9B. All its conditional and unconditional branches remain inside the extent, and it makes no call. It receives four 32-bit float values at entry ESP+4, ESP+8, ESP+0xC and ESP+0x10. ECX is a hidden result address, rather than a class receiver. Every result path writes a float pair at ECX+0 and ECX+4, returns that address in EAX, and uses plain RET. The first two floats initialize the low and high values, and the third and fourth update them. The branch handling for unordered comparisons is retained in the bank. The 156-byte helper matches completely in both retained compiler objects. Raw checked inventory: build/af940-finish/007af710-checked-callees.log. Native declaration: game/Libraries/Source/WWVegas/WWMath/vector2.h.

The target receives axisA through ECX, axisB through EAX, the X range through EDI and the Y range through ESI. Its four entry stack floats are sizeA, sizeB, offA and offB, in that order. It reads X and Y at offsets 0 and 4 from both axes, computes four corner pairs, calls minMax4 for X and Y, and copies both returned dwords into each output pair. The inputs and outputs are pointers with a compiler-private register contract. They cannot be described as the zero-stack-argument thiscall suggested by the inventory heuristic. All return widths and cleanup agree with the decoded helper and call sites. The existing descriptive address names were retained; no semantic owner or EA function name was asserted.

The complete axis-construction helper at 0x007AF7E0 has three returns at +0x82, +0xF3 and +0x113, with every branch inside its 276-byte extent. It writes all three fields at offsets 0, 4 and 8 of both output axes. This field evidence, together with the actual caller pointers, supports the native Vector3 layout instead of inferring a value type from allocation size. The matrix input is in ESI and the output axes are in EDX and ECX. This complete helper matches in both retained objects. Raw decode and checked inventory: build/af940-finish/007af7e0-retail.txt and build/af940-finish/007af7e0-checked-callees.log. Native declaration: game/Libraries/Source/WWVegas/WWMath/vector3.h.

The full callers were decoded before reviewing their sites. Their retained files are build/af940-finish/007b23f0-retail.txt and build/af940-finish/007b4fe0-retail.txt. Their checked inventories have no outgoing branch warning or external tail jump. The former ends at RET 4 at +0x12D4 followed by INT3 at +0x12D7; the latter ends at RET 0xC at +0x10F2 followed by INT3 at +0x10F5. Instruction-aligned target calls are at 0x007B2A06, 0x007B2A47 and 0x007B52A9. The first caller defers the cleanup of two four-float argument blocks until after both calls. The second pushes offB from shadow+0x7C, offA from +0x78, sizeB from +0x5C and sizeA from +0x58, then removes 0x10 bytes after the call. In every case ECX and EAX point at the two axes and EDI and ESI point at distinct float pairs. At the queue site the axes are 12 bytes apart, and each output pair is explicitly zeroed as two dwords. The complete preceding axis helper proves the third vector field independently of this spacing.

No constructor body, owning container, virtual call, destructor or unwind cleanup was claimed. The target and supporting helpers have no EH frame; the inline Vector2 value construction has no owning cleanup. The caller bank's wider EH and ownership reconstruction was not certified or changed. It was used to reproduce the helper register contract, not claimed as a verified caller.

## Exact remaining difference

The bank emits 282 bytes for 282 retail bytes. Its non-relocation differences are +0xD8, +0xD9, +0xDB, +0xDC, +0xDD, +0xDF. At +0xD8 retail has `8D 4C 24 10 D9 5C 24 20`, while the bank has `D9 5C 24 20 8D 4C 24 10`. Retail first computes the hidden result address with LEA ECX,[ESP+0x10], then rounds and stores the last corner Y value with FSTP [ESP+0x20]. The bank reverses these two independent instructions. Both calls retain identical relocation positions and resolve directly to the canonical 0x007AF710 body. Raw full side-by-side probe: build/af940-finish/baseline.log. Strict resolved-byte check, which fails on precisely these bytes: build/af940-finish/candidate-strict-gate.log. Object receipt and retained object: build/af940-finish/baseline-receipt.json and build/af940-finish/baseline.obj.

## Corrected prior diagnosis

The statement that this private convention appears only beside exp7AF940Caller is refuted. The saved full reconstruction targets/game/reverse/attempts/0x007b4fe0.cpp compiles the target and both supporting helpers without that synthetic caller. The target has exactly the same bytes as the preferred bank, and its actual compiled queue call supplies the same pointer roles and four stack floats as retail. It has different local frame locations. The target's residue therefore does not disappear with a genuine caller reconstruction in the translation unit. The queue reconstruction itself remains non-matching and was not promoted into game/. Raw target probe: build/af940-finish/real-caller-bank.log. Complete decoded object and receipt: build/af940-finish/real-caller-bank-queue-object.txt and build/af940-finish/real-caller-bank-receipt.json. The two retained target bodies are byte-equal before relocation resolution, as their receipts show.

## Tested new levers

Earlier corner and scale permutations, named target-side range temporaries, the register-family generator, and forward or late definitions of minMax4 were read in the attempt history and were not rerun. The experiments below instead tested CPU scheduling, native last-corner Add and output Set, a complete real caller bank, pointer or reference parameter forms, source parameter order, named minMax4 return objects, moving the corner update inside a call argument, inlined indexed-component reductions, a component loop, defining the target after its caller, nonthrowing contracts, precision conversions on the last corner Y sum, and the generated X/Y reduction-order swap. The loop retained control flow and the return wrapper changed result-copy instructions, so both were rejected. The precision forms changed earlier arithmetic scheduling. No variant measured closer than the preferred bank. The store generator's one alternative was tested with shape_search; its manifest is build/shape_search/54a04203c3d2499d8b2250d0af87ea46/result.json. Register choices from an earlier run were not repeated.

The table reports positional diagnostics with missing or extra extent bytes counted as wrong. Variants with relocation-layout drift remain diagnostic failures, not acceptance receipts. Each raw probe is build/af940-finish/<trial>.log, and each source's exact SHA256 is recorded in build/verdict.txt. Prepared sources without a raw probe were not measured or submitted as banks.

| Trial | Emitted bytes | Diagnostic wrong bytes over the full extent |
|---|---:|---:|
| baseline | 282 | 6 |
| cpu-g5 | 282 | 6 |
| cpu-g7 | 282 | 6 |
| real-caller-bank | 282 | 6 |
| native-add-last-corner | 282 | 6 |
| native-result-set | 282 | 6 |
| output-pointers | 282 | 6 |
| axis-pointers | 282 | 6 |
| output-first | 282 | 6 |
| float-first | 282 | 6 |
| minmax-named-return | 282 | 6 |
| minmax-set-return | 282 | 6 |
| corner-in-call | 282 | 6 |
| corner-add-in-call | 282 | 6 |
| component-return-wrapper | 288 | 59 |
| component-output-wrapper | 282 | 6 |
| component-loop | 365 | 325 |
| target-after-synthetic-caller | 282 | 6 |
| target-after-real-caller | 282 | 6 |
| minmax-throw-contract | 282 | 6 |
| target-throw-contract | 282 | 6 |
| last-y-double | 274 | 109 |
| last-y-float-cast | 274 | 109 |
| store-search-0 | 282 | 6 |
| store-search-1 | 282 | 60 |

## Checks and preservation

The original dump passes its scoped byte gate, recorded in build/af940-finish/scoped-dump-gate.log. The two existing helper rows pass their scoped gate, including their float constants, recorded in build/af940-finish/scoped-existing-helpers-gate.log. The pin-consistency check passes, recorded in build/af940-finish/pin-consistency.log. The original bank fails the strict resolved-byte comparison on the six stated bytes and has no unresolved callee. These passing existing-row gates establish the unchanged baseline and helpers; they do not certify a new C++ recovery.

The unchanged preferred bank remains at targets/game/reverse/attempts/0x007af940.cpp. No replacement bank was written because no closer source was found. All trial sources, raw outputs and retained objects remain uncollected under build/. No full gate is required for this evidence-only change, and no new pin, class definition or shared header was introduced. The remaining blocker is the first-call LEA/FSTP instruction order. A later landing must also retain an acceptable translation unit that reproduces the decoded private convention; the wider caller bank is still not verified.

Preferred bank SHA256: 973964020a2f4b15318c8c79a2cb7b879f181e480612f98180dbf7c1f993d111.

## Continuation: source structure and complete rechecks

The continuation reproduced the unchanged preferred bank before any source experiment. Its raw probe is build/af940-resume/baseline.log. Fresh complete decoded extents, including every direct branch destination, are retained as build/af940-resume/007af940-retail.txt, build/af940-resume/007af710-retail.txt, build/af940-resume/007af7e0-retail.txt, build/af940-resume/007b23f0-retail.txt and build/af940-resume/007b4fe0-retail.txt. The checked inventories use the corresponding -checked-callees.log filenames. Every direct branch destination is an instruction in its own complete extent. The target and supporting helpers retain the return paths described above. Raw audit: build/af940-resume/audit.log. Structured extent and return evidence: build/af940-resume/complete-decodes.json.

The strict comparison still resolves both calls directly to the canonical minMax4 body and reports no unresolved callee. It fails on the same six bytes listed above. The retained baseline object independently matches both complete supporting helpers. Raw strict comparison: build/af940-resume/candidate-strict-gate.log. Object evidence: build/af940-resume/baseline.obj and build/af940-resume/baseline-object.json. The actual bank and matched neighbour compiler commands have identical optimization, exception, runtime, define and include switches; their only differences are their source and output paths. Recorded commands: build/af940-resume/compiler-commands.json. A flag mismatch is therefore refuted for this bank. Dynamic loop, switch, signed integer width and early-return hypotheses have no corresponding retail instruction in this straight-line four-float body. They do not justify changing its decoded argument or field contracts.

Each following family had a prediction and explicit refutation condition in build/verdict.txt before it ran. Raw probe logs and unchanged sources are build/af940-resume/<trial>.log and build/af940-resume/<trial>.cpp. Each probe also has a receipt with the exact command, source hash and timestamps. The final source-preservation audit checks every recorded hash against the retained file and is build/af940-resume/source-preservation-final.json. A raw probe compilation failure is retained as such; it is not counted as a measured body. Diagnostic wrong-byte counts add the emitted-versus-retail extent difference to the probe's non-relocation count. Relocation-layout-drift rows remain diagnostic failures and cannot establish acceptance.

The two delayed-Y comma-argument forms specifically moved only the last Y update into the first or last X argument, rather than repeating the earlier whole-corner-in-call experiment. Both removed earlier stores and regressed. Explicit inline/noinline declarations, top-level const arguments and a const result did not improve call lowering. Axis scopes, grouped native corner records, full aggregate return/output helpers and grouped scaled-axis records retained the residue. Endpoint arrays changed the frame. These tests preserve all native vector fields; no allocation size or donor label was used as independent type evidence.

Const-reference results changed the first post-call copy from EAX-based loads to known stack loads and grew the body. Keeping both assignments in one full expression also changed temporary storage and grew the body. Explicit native operator= retained the residue. Direct output placement construction compiled only after the native and standard allocation headers shared their existing guard; it changed alias-dependent scheduling and regressed. Earlier missing-overload and duplicate-definition failures are retained in their raw logs. No header or allocation overload was changed or invented.

Explicit minMax4 output-pointer and output-reference declarations reproduce its complete helper bytes and physical ECX/EAX contract. Their caller bodies are worse, so no new binding or declaration was promoted. This is additional evidence that an exact callee does not determine the caller's hidden-result ordering. Derived result views include the canonical Vector2 base, add no payload field, owning cleanup or asserted owner, and reproduce both helper bytes and the original target residue. They remain diagnostic sources. Safe placement construction into expired b1 or a1 storage also matches the helper but worsens the target. The retail hidden-result LEAs reuse one frame slot, but manual native lifetime reuse did not reproduce that compiler storage choice.

Sorting and updating the minMax4 value parameters instead of its low/high locals left the target residue and changed the callee, so both variants are rejected. Native corner-record constructors initially remained extra calls. Forcing their full field construction inline removed the extra call but increased the frame and retained the same LEA/FSTP inversion. Inline native member result/output methods also failed. No dummy callee, assembly, barrier, volatile access or guessed symbol pin was introduced.

| Trial | Emitted bytes | Diagnostic wrong bytes over full extent |
|---|---:|---:|
| axis-endpoint-arrays | 288 | 180 |
| axis-endpoint-record | 282 | 6 |
| axis-inner-scope | 282 | 6 |
| baseline | 282 | 6 |
| const-reference-result-scopes | 288 | 59 |
| const-reference-result | 288 | 59 |
| corner-aggregate-local | 282 | 6 |
| corner-aggregate-out-helper | 282 | 6 |
| corner-aggregate-return-helper | 282 | 6 |
| corner-member-assignment-forced | 285 | 41 |
| corner-member-assignment | 271 | 235 |
| corner-member-return | 277 | 236 |
| corner-record-constructor-forced | 285 | 41 |
| corner-record-constructor | 271 | 235 |
| corner-y-first-argument | 274 | 109 |
| corner-y-last-argument | 274 | 109 |
| explicit-native-assignment | 282 | 6 |
| explicit-result-reuse-a1-helper | 156 | 0 |
| explicit-result-reuse-a1 | 295 | 222 |
| explicit-result-reuse-b1-helper | 156 | 0 |
| explicit-result-reuse-b1 | 291 | 162 |
| first-assignment-in-y-argument | 285 | 168 |
| minmax-const-arguments | 282 | 6 |
| minmax-const-result | 282 | 6 |
| minmax-explicit-pointer-helper | 156 | 0 |
| minmax-explicit-pointer | 285 | 168 |
| minmax-explicit-reference-helper | 156 | 0 |
| minmax-explicit-reference | 285 | 168 |
| minmax-inline | 282 | 6 |
| minmax-noinline | 282 | 6 |
| minmax-parameter-and-local-high-helper | 162 | 139 |
| minmax-parameter-and-local-high | 282 | 6 |
| minmax-parameter-storage-helper | 156 | 24 |
| minmax-parameter-storage | 282 | 6 |
| nested-ordered-assignment | 285 | 168 |
| one-full-expression | 285 | 168 |
| output-placement-construction | Not compiled | Not measured |
| output-placement-guard | 270 | 238 |
| output-placement-native-array | Not compiled | Not measured |
| output-placement-native-header | Not compiled | Not measured |
| result-derived-construction-helper | 156 | 0 |
| result-derived-construction | 282 | 6 |
| result-derived-default-helper | 156 | 0 |
| result-derived-default | 282 | 6 |
| result-derived-explicit-copy-helper | 156 | 0 |
| result-derived-explicit-copy | 282 | 6 |

Timing is measured from the archived first-run receipt and the current worker receipt. At this preservation check the first run used 1732.49 seconds, the continuation used 1212.20 seconds, and their combined active elapsed time was 2944.69 seconds. The actual model in both receipts is gpt-6.1-sol. The first-run verdict is updated in place; no second verdict row or replacement bank is added.

No recovery is accepted. The remaining blocker is still the first-call LEA/FSTP order, rather than an unresolved callee, a proven ABI ambiguity or a proved requirement for assembly. Reopening needs a specific untested IR/lifetime hypothesis that predicts the observed ordering and retains both complete helper contracts, or a verified real caller translation unit that changes this residue. The nonmatching full caller bank remains evidence only. These experiments do not prove that portable C++ is incapable of reproducing retail. All existing and continuation trials remain uncollected under build/.

Final CSV and pin-consistency checks pass in build/af940-resume/check-csv-final.log and build/af940-resume/pin-consistency-final.log. The original dump and both existing helpers pass the required scoped gates through the explicit Git Bash entry point, recorded in build/af940-resume/scoped-dump-gate-bash.log and build/af940-resume/scoped-existing-helpers-gate-bash.log. These certify only the unchanged rows. The preferred candidate still fails its strict comparison. The initial bare build.cmd invocation did not resolve the command, and the absolute wrapper reached py -3 but reported No installed Python found in the sandbox. Both failures are retained and were superseded by the passing Bash gates; no tooling was changed. Git's plain whitespace check flags the required CRLF on the new verdict row. The read-only per-command cr-at-eol check passes in build/af940-resume/diff-check-crlf.log. All earlier attempt-log bytes are identical to HEAD, and its net addition remains one CRLF row. No full gate is required for these evidence-only paths.
