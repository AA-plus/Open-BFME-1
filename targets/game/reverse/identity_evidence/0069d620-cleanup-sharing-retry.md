# RVA 0069D620 cleanup-sharing retry

The target remains unconverted. The preferred body at targets/game/reverse/attempts/0x0069d620.cpp is unchanged. It emits 285 bytes against the independently decoded 285-byte retail extent, with 13 non-relocation differences. No trial is closer, and this note does not claim that clean C++ recovery is impossible.

## Boundary, ABI and identity

The tested revision is 9ba522700c8fd907582ded977dcc4566503a0c52, using gpt-6.1-sol and the repository MSVC 7.1 compiler. The ledger still points to the dump in game/gen_asm/d_00693e20.asm. The requested target is open according to tools/eligibility.py. Raw screening and all nine prior verdicts are retained in build/69d620-run/history.log.

The complete target has two returns, at +0xE3 and +0x11A, each RET12. INT3 padding begins at +0x11D. Its loop back edge and every conditional jump stay inside the 285-byte extent; there is no tail jump. Raw decode and checked inventory are build/69d620-run/decode-0069d620.log and build/69d620-run/checked-target.log.

ILT 0001815B jumps to this body. Complete callers 0069D790 (31 bytes), 0069F740 (271 bytes), 0069D920 (277 bytes), and 0069F5D0 (295 bytes) pass ECX as the receiver, push two 32-bit values followed by hidden return storage, and consume the returned storage pointer in EAX. The callee writes one node pointer and removes twelve stack bytes. The scan compares two dword fields for equality; signedness has no observable effect on those comparisons and is not independently identified. Caller decodes and checked inventories are the corresponding decode-<address>.log and checked-caller-*.log files under build/69d620-run/.

The complete matched callers use an address-derived ILT call, so they establish the ABI rather than the proprietary method name. Contrary to the earliest attempt's claim, they do not prove the decoration getSlot. The Python API ilt_oracle.check(symbol, 0x0069D620) reports CONTRADICTED for the bank's getSlot decoration. A later exact conversion must retain the descriptive word with an address suffix, as allowed by the worker brief. No name or pin was changed. Raw output is build/69d620-run/identity-precheck.log.

## Value construction and destruction

The actual inlined acquisition loads a single pointer from node+8, tests it, and calls KERNEL32 InterlockedIncrement with pointee+4. It reads no second payload field. The complete adjacent pointer constructor 006967B0 (29 bytes) stores exactly one pointer and increments pointee+4; copy constructor 006967E0 (31 bytes) additionally reads exactly one pointer from the source handle. Both return their receiver and remove one stack argument. These adjacent copies support the representation but are not used alone to assign the original type identity. Raw decoded bodies and checked inventories are build/69d620-run/decode-006967b0.log, build/69d620-run/decode-006967e0.log and their checked-<address>.log counterparts.

The actual cleanup helper is selected by retail unwind state zero, through C47A40 -> ILT 46F6 -> 696870. The complete 35-byte helper loads the one-pointer handle, skips null, calls KERNEL32 InterlockedDecrement on pointee+4, and invokes virtual slot zero with ECX equal to the pointee and stack flag 1 only when the signed count is nonpositive. RET at 696892 is followed by INT3 at 696893. There are no outgoing conditional branches. Raw evidence is build/69d620-run/retail-eh.log, build/69d620-run/decode-00696870.log and build/69d620-run/checked-handle-dtor.log. The landed allocator TU and targets/game/reverse/identity_evidence/00696870-playingaudio-return-cleanup.md call this selected helper PlayingAudioRef, but the independent Python oracle reports CONTRADICTED for that destructor decoration. The original handle spelling is therefore unresolved. The decoded ownership and ABI are independently usable under the bank's address-derived view; no generic byte pattern or donor name proves a type spelling. This existing row is outside the assigned target and was not edited.

The PlayingAudio constructor and destructor sources were read directly. Their retail bodies are independently decoded at 006B9F70 (153 bytes) and 006BA030 (137 bytes). The oracle confirms the PlayingAudio constructor, complete destructor and scalar deleting destructor decorations. Vtable VA 0111C8C4 contains VA 004219C2; ILT 000219C2 reaches the complete 30-byte scalar deleting destructor at 006BA0E0. That wrapper uses ECX, tests flag bit 1 in the single stack argument, invokes the destructor and conditional deallocator, returns the receiver in EAX, and ends in RET4. It does not read incoming EDX. The constructor confirms a byte at +0x34 and an owning one-pointer field at +0x14. No shared header was changed, and the bank's unknown owner and member spellings were preserved. Raw evidence is build/69d620-run/oracle-names.log, build/69d620-run/virtual-delete-evidence.log and the corresponding decode-<address>.log and checked-<address>.log files.

The target follows value+0x14 to a pointer, then pointer+8 to a holder, then reads the holder's dword at +0x84. It compares dwords at binding+0x28 and binding+0x64 against the two arguments. These are decoded accesses, not a complete declaration of AudioEventRTS or AudioEventInfo. The layout oracle has no witness for the owner's class or these particular members. No guessed semantic member name was introduced.

The bank has the same single unwind state (0 -> -1), the same EBP-0x10 cleanup receiver, and a strictly byte-identical 35-byte handle destructor after resolving its guarded import. The passing helper check is retained in build/69d620-run/result-audit.log. The raw object dump and compiler listing retain its funclet, FuncInfo, unwind row, destructor and all main relocations in build/69d620-run/bank-object.log and build/69d620-run/bank-listing.cod. The main loop contains no state-zero store; its four state resets to -1 agree with retail. No extra ownership cleanup is required by the proposed pointer view.

The separately decoded PlayingAudio constructor has two unwind states: its ref-counted base at +0 and its completed event handle at +0x14. The complete destructor has three states, adding the +0x18 file handle. Their actions are decoded fully in the decode-00c493*.log files under build/69d620-run/, and their maps are build/69d620-run/value-constructor-eh.log and build/69d620-run/value-destructor-eh.log. Base cleanup 000AF7E0 (7 bytes) writes the base vtable and returns. Event-handle cleanup 00691200 (38 bytes) reads its sole pointer, adjusts to the pointee's secondary base at +0x70, decrements that base's count at +4, and performs slot-zero deletion with flag 1 only for a nonpositive result. File-handle cleanup 00691030 (12 bytes) loads its sole pointer, skips null, and tail-jumps through ILT 000442B0 to 006BA220 (136 bytes). That complete release holds the owner's mutex, decrements a dword at +0x34, stamps +0x38 and notifies its owner only at zero, then releases the mutex and returns. The matching source was read directly. Raw decodes and checked inventories are the corresponding decode-<address>.log and checked-<address>.log files. This confirms the distinct ownership cleanup at those member offsets; it does not assign an original name to either handle wrapper.

## Exact remaining bytes

| Offset | Retail | Bank |
|---|---|---|
| +0x5D | 14 | 42 |
| +0x6F | 46 | 56 |
| +0x71 | 50 | 52 |
| +0x81 | 16 | 06 |
| +0x87 | 12 | 10 |
| +0x94 | 4C | 54 |
| +0x98 | 48 | 50 |
| +0x9D | 56 | 46 |
| +0x9F | 52 | 50 |
| +0xAF | 06 | 16 |
| +0xB5 | 10 | 12 |
| +0xEB | 4E | 46 |
| +0xED | 51 | 50 |

At +0x5C, retail jumps to the early rejection cleanup at +0x72, while the bank jumps to the comparison-failure cleanup at +0xA0. Both share the already pushed counter address. The other twelve differences are register operands: the busy cleanup's LEA/PUSH and virtual table load/call, the second comparison's stack load/CMP, the mismatch cleanup's LEA/PUSH and virtual table load/call, and the successful-return cleanup's LEA/PUSH. All access offsets, counters, conditional tests, vtable slots, return stores and stack cleanup already agree. The probe's normalized shape score alone hides the differing jump destination and must not be treated as proof that the CFG is identical. Raw authority for the exact byte pairs is build/69d620-run/bank-strict-gate.log.

## New experiments

The new hypothesis was that native helper visibility, ownership lifetime or result construction selects a different shared cleanup block. Refutation was a retained 13-byte residue or a structural/ABI regression after a complete source trial. No prior rotation sweep, barrier experiment, field-type sweep, comparison-order sweep, or direct continue/fallthrough sweep was repeated. Each new candidate and unedited probe output is retained under build/69d620-run/ with the same numeric prefix and .cpp/.log suffix. build/verdict.txt records the hypothesis and measured result after each trial.

The new structural levers cover a ref-counted base, a native STLport list and its prefix/postfix iterator paths, reference-taking construction, pointer conversion and null predicates, matcher/binding/accessor helpers, a pointer-returning scan, result and counted-handle factories, explicit clear and private-pointer clearing, reference-returning accessors, copied handle temporaries, private handle storage in a base, out-of-class release and handle-destructor definitions before or after the caller, discarded count/status results, shared or explicitly copied return-object lifetimes, switch rejection edges, separate and negated comparison predicates, and single-node lookup helpers preserving result-store ordering. The EH-bearing loop and node helpers remain out of line even with __forceinline, so they cannot explain the retail expansion. Typed function-pointer and virtual fastcall deletion adapters were also measured against the independently decoded dynamic slot contract; both lose the reset stores and are rejected. A raw thiscall function-pointer declaration is rejected by MSVC 7.1 with C4234.

The prior rotation generator cannot reach address locals inside the retaining or releasing helper: it locates only the target definition and explicitly skips arguments beginning with &. A counter-address local in Add_Ref changes the main body to 279 bytes by removing the six-byte skip LEA/PUSH/jump stub and branching directly into the comparison-failure cleanup. The Release_Ref address local alone retains the bank's exact 13-byte residue; using both retains the 279-byte regression. Defining that changed constructor before or after the caller, retaining through the incoming pointer, storing the local pointer after retention, or copying through a native list or node handle does not repair it. These are retained in build/69d620-run/61-upstream-counter-address-local.log through build/69d620-run/69-address-local-node-handle-copy.log. The source gap in the earlier generator is real, but this measured address-local lever does not improve the bank.

The accessor-chain experiment changed EH lowering but did not improve the body. Every ordinary/forced-inline combination of the six getters emits the same shorter shape. The active-getter subset experiment identifies the holder getter call as the switch between that shorter shape and the unchanged bank. Nonthrowing specifications on the pure field getters do not repair it. The separate EH generator/search on the new typed slot adapter has raw output in build/69d620-run/adapter-eh-search-utf8.log and retained sources/result.json in build/shape_search/10086f8d41c1496dbcfd54db1ad2e6ad/; both trials retain the same shorter output. This is a measured inlining/EH sensitivity, not evidence for a new callee identity.

Measured standalone source trials so far: 201. Counts below come directly from their raw probe logs; differences for a shorter body count only its emitted overlap and therefore do not measure distance by themselves. The preferred full-size bank remains closest.

| Compiled size | Reported overlap differences | Trial count |
|---|---|---|
| Compile failure | Not measured | 1 |
| 26 | 22 | 1 |
| 90 | 83 | 1 |
| 97 | 91 | 2 |
| 251 | 193 | 109 |
| 251 | 196 | 1 |
| 277 | 230 | 1 |
| 278 | 210 | 1 |
| 279 | 181 | 1 |
| 279 | 180 | 8 |
| 283 | 182 | 1 |
| 285 | 13 | 73 |
| 319 | 216 | 1 |

The scoped strict build.compile_function check resolves all ordinary relocation targets, verifies the guarded IAT bindings, and fails on exactly the listed 13 bytes with no unresolved symbol. Its raw output is build/69d620-run/bank-strict-gate.log. Initial check_csv passes in build/69d620-run/check_csv-initial.log. No source or ledger conversion has been attempted, so no full gate is required.

A focused Capstone instruction interpreter compares the strictly resolved bank with retail over empty and one-to-three-node lists, all six scan outcomes, reference counts -1/0/1/5 and three deterministic volatile-register clobber sequences per constructed case. It compares result storage, retained/released/deleted pointers, callback order, output visibility at deletion, final counters, stack cleanup and preserved registers. All 3,099 paired executions over 1,033 constructed cases agree and collectively cover all 99 retail instructions. Raw output and interpreter are build/69d620-run/execution-compare.log and build/69d620-run/execute_compare.py. External calls are modeled callbacks; exception propagation, concurrent mutation and real game objects are not executed. This result supports equivalent ordinary return-path behavior under the decoded ABI, not byte equality or original identities.

Reopening requires a concrete source structure that changes the skip cleanup join or the associated operand allocation without losing the full 285-byte body and verified EH/ABI contract. Repeating a native accessor, constructor/return copy, visibility toggle or scratch rotation already rejected here is not a new hypothesis.

## Handoff checks

Exactly one blocked verdict was appended through tools/re_log.py after 3,021 measured seconds (t=50min); the model is gpt-6.1-sol. The row and timing receipt are retained in build/69d620-run/verdict-row-written.json. The preferred bank is byte-for-byte unchanged, and no source, pin, function ledger or shared declaration changed. Final check_csv passes in build/69d620-run/check_csv-final.log. The final main strict comparison still fails on the same thirteen bytes with no unresolved symbol in build/69d620-run/bank-strict-gate-final.log. The final helper and bank-preservation audit passes in build/69d620-run/result-audit-final.log. The default git diff whitespace check flags the tool-written CRLF terminator; the CRLF-aware check passes in build/69d620-run/diff-check-crlf.log. No Git write, synchronization, full gate or background monitor was started. All work remains uncommitted for collection.
