# NewEvaEvent parser retry at RVA 0x00426C60

The tested base revision is `9e3be919b10ae956e3c8a13995e0d62f2be1d016`. This run used `gpt-6.1-sol` and retained the existing bank at `targets/game/reverse/attempts/0x00426c60.cpp` without changing its bytes or names. The ledger remains the 813-byte dump. This is a refuted retry hypothesis, not a verified source recovery. Trial sources, original subprocess byte streams, compiler listings and timestamped command receipts remain under `build/worker-00426c60-retry/`.

## New context and refutation test

The earlier record reported an oversized frame and constructor-temporary sharing, and deferred scalar STLport bindings. The current checkout has the neighbouring record-vector push and resize recoveries, a scalar-aware lookup declaration, the address-derived record constructor and STLport 4.6 headers. The donor constructor declares only 24 bytes; its declaration cannot establish the complete vector value type. The pointer-payload insertion and resize donors also cannot establish this caller's mapped type. Their source was read rather than inferred from their ledger descriptions.

The hypothesis was that native pair, iterator and record lifetimes would restore the frame and the two independently witnessed constructor cleanup slots. It would be refuted by incompatible helper fields, unchanged slot placement or measured bodies no closer than the saved bank. Native pair and iterator declarations left the result unchanged. A native check temporary changes the frame to 0x34, but preserves the difference count. Reference-bound records, named records, a record-reference adapter, a native vector element and a distinct second temporary type worsen the measurements. An adapted visible noinline constructor does not improve the caller. Its helper body is not claimed as an additional recovery. No further register or x87 spelling experiments were made.

The current prospective scoped gate resolves the constructor's existing object symbol. Unlike the earlier gate receipt, it lists only scalar `insert_unique_noresize` and `resize` as unresolved. Their target addresses and aggregate ABI are decoded, but no new pin was added for this nonmatching caller. The open STLport lane does not itself supply independently proven scalar bindings or the missing lifetime shape.

## Independently checked boundary, values and ABI

The target's complete decode ends at its normal return at +0x32c. All conditional branches and internal jumps stay inside the 813-byte extent. Every successful path reaches the shared default-record assignment and `initFromINI`; four exception sites call the runtime throw helper. Raw files are `01-retail-target.log` and `01-checked-target.log`.

The registration record at RVA 0x00EB525C contains `NewEvaEvent` and callback VA 0x0043F0EE. Its complete five-byte ILT reaches RVA 0x00426C60. `27-registry.stdout.log` retains the exact record and string. Complete `INI::parseLine` pushes the INI receiver at +0x72, calls the returned callback indirectly at +0x77 and removes four bytes at +0x93. The target reads one 32-bit stack pointer and returns with plain `ret`. This establishes a void cdecl INI callback, without establishing EA's original owning class or member spelling. The bank keeps `Rva00426C60EvaEvent::parse`.

The complete scalar insertion copy helper at 0x00423E00 copies the AsciiString at value offset 0 and only the dword at offset 4. The caller compares that dword as a signed index, including sentinel -1 and bound 17. Both insertion returns write a node pointer, table pointer and bool into hidden storage and use `ret 8`. Resize accepts a 32-bit count and uses `ret 4`; it does not inspect the mapped payload. STLport 4.6 `_pair.h`, `_hashtable.h` and `_hashtable.c` were inspected for the corresponding pair, iterator and return declarations. A pointer payload name or node allocation width was not treated as type proof.

The complete vector copy helper at 0x00425EC0 copies four head dwords and constructs the tree tail at offset 16. The vector push advances by 28. The default constructor at 0x00425680 writes the four heads and the tree header/count; it returns its receiver. The check copy helper at 0x00422F80 copies dwords at 0, 4, 8, 12 and 16 and a byte at 20. Its vector advances by 24. Only the first two floats and the last bool are initialized by this callback. The three intervening words remain opaque in this evidence.

Tree assignment reaches the complete 171-byte tree-copy helper at 0x00424610 and the complete 93-byte value constructor at 0x00423E90. The value constructor copies the AsciiString and pointer, then increments the pointed object's count at offset 4. Tree erasure reaches the complete 103-byte destructor at 0x00423280, which decrements that count, supplies the original receiver and 32-bit deleting flag 1 to virtual slot zero, then releases the key. The pointed class and dynamic virtual target remain unknown. No class identity is inferred from the tree's existing generated template spelling.

The complete INI token helper uses `ret 4`; the complete `initFromINI` uses `ret 8`, with the target pushing field table before destination. The existing named `TheEva` DIR32 entry is used. INIException's complete constructor, copy helper, copy constructor and destructor agree on the owned message pointer and argument count, and the existing ThrowInfo identifies its copy and destruction routines. Per-address `*-decode.stdout.log` and `*-checked.stdout.log` files retain these complete helper inventories and return paths.

## Cleanup and unresolved placement

`03-eh-target.stdout.log` records five unwind states. States 1 and 3 destroy constructor objects at distinct EH-frame offsets -0x44 and -0x28; the complete 0x00425060 tail wrapper adds 16 before the complete tree destructor. States 2 and 4 destroy scalar-index pairs through the string-release thunk. The bank has the same predecessor-state structure and cleanup kinds, but its compiler listing places both constructor temporaries at -40. Its name is at -100, pair locals at -96 and -88, and check at -64. With a native check temporary, the name moves to -64, the pairs to -60 and -52, and both constructor temporaries and the check share -40. Neither arrangement matches retail.

The helper unwind maps were reread in `27-eh-*.stdout.log`. All three placement copy helpers clean up through the one-byte placement-delete body at 0x000607F0. Tree constructor and destructor cleanup reaches the complete header deallocator at 0x00423560. The owning-value destructor still releases its string if its virtual deleting call throws. The exact generated cleanup locations and targets remain unverified for landing because no candidate matches the main body.

## Measurements and checks

The table is generated from `measurements.jsonl`, which names each exact source snapshot. Each stem identifies its unedited `*.stdout.log` and `*.stderr.log`. Counts mask the candidate's COFF relocation slots. Layout drift means these are ranking measurements, not relocation or identity certificates. Missing bytes count against a shorter candidate.

| Trial stem | Measurement |
|---|---|
| 03-original-raw | 813 emitted bytes; 147 masked differences; 0 missing retail bytes; first +0x17 |
| 06-native-pair | 813 emitted bytes; 147 masked differences; 0 missing retail bytes; first +0x17 |
| 07-native-iterator-copy | 813 emitted bytes; 147 masked differences; 0 missing retail bytes; first +0x17 |
| 08-native-iterator-insert | 813 emitted bytes; 147 masked differences; 0 missing retail bytes; first +0x17 |
| 09-native-hashtable | Compile refusal |
| 10-native-hashtable-natural-find | 806 emitted bytes; 332 masked differences; 7 missing retail bytes; first +0x17 |
| 11-native-check-temporary | 813 emitted bytes; 147 masked differences; 0 missing retail bytes; first +0x17 |
| 12-record-derived | 813 emitted bytes; 147 masked differences; 0 missing retail bytes; first +0x17 |
| 13-first-bound-record | 807 emitted bytes; 460 masked differences; 6 missing retail bytes; first +0x17 |
| 14-second-bound-record | 814 emitted bytes; 302 masked differences; 0 missing retail bytes; first +0x17 |
| 15-both-bound-records | 814 emitted bytes; 474 masked differences; 0 missing retail bytes; first +0x17 |
| 17-record-reference-adapter | 813 emitted bytes; 155 masked differences; 0 missing retail bytes; first +0x17 |
| 18-native-vector-record | 811 emitted bytes; 476 masked differences; 2 missing retail bytes; first +0x17 |
| 19-distinct-record-temporaries | 814 emitted bytes; 302 masked differences; 0 missing retail bytes; first +0x17 |
| 20-first-named-native | 807 emitted bytes; 460 masked differences; 6 missing retail bytes; first +0x17 |
| 21-second-named-native | 814 emitted bytes; 302 masked differences; 0 missing retail bytes; first +0x17 |
| 22-both-named-native | 814 emitted bytes; 474 masked differences; 0 missing retail bytes; first +0x17 |
| 23-visible-constructor | 813 emitted bytes; 147 masked differences; 0 missing retail bytes; first +0x17 |
| 28-final-bank | 813 emitted bytes; 147 masked differences; 0 missing retail bytes; first +0x17 |

The nine generated EH combinations on the changed native check-temporary source all emit 813 bytes with 147 masked differences. `25-eh-manifest.json`, the generated choices and individual probe logs retain them. The frame-family generator finds no applicable choice; its raw refusal is in `24-frame-family.stderr.log`.

The preferred bank's final probe is `28-final-bank.stdout.log`. The prospective scoped byte gate fails in `26-scoped-gate.stdout.log`, with the two unresolved scalar hashtable declarations and byte differences. `26-check-csv.stdout.log`, `26-pin-consistency.stdout.log`, `26-class-gate.receipt.json` and `26-name-regression.stdout.log` pass. `26-declared-unmatched.stdout.log` refuses the bank because it owns no ledger row; the bank is unchanged and is not a new game source. No full gate is required for this evidence-only retry, and none was run. No ledger, pin, shared header or game source was changed.

Reopening needs evidence that explains why retail gives the two record temporaries separate slots while sharing the first slot with the check and second pair, or a measured complete source shape that improves on the retained bank. Repeating pair copy declarations, record reference binding or the tested adapters is not justified. One final blocked verdict preserves the better existing bank; no new partial replaces it.
