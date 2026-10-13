# Multiplayer callback finish-lane evidence

No source recovery was completed. The preferred bank remains unchanged. It emits 335 bytes with 12 differing bytes outside relocation operands, and the repository's scoped function gate rejects the candidate even after every direct callee resolves. The result is a failed reconstruction, not an exact recovery or a proof that assembly is necessary.

Tested revision: 3432fd95a1fb0cb877e475caba437bfaaf4c7e66. All trial sources, unedited probe output, successful object files, compiler commands and source hashes are retained under build/db30-retry/. The measurement manifest is build/db30-retry/measurements.json. No game source, bank, shared header, pin or function ledger was changed. This run adds one verdict row.

## Boundary, calls and ownership

Addresses below are RVAs unless explicitly called VAs. build/db30-retry/decoded-main.log decodes the complete callback, its direct body callees and the complete 3411-byte registering constructor. The callback has two outgoing guard branches to its own navigation arm, one internal join and a single complete epilogue. It returns with ret 4 at +0x14C; INT3 padding begins at +0x14F. There is no outgoing conditional branch or tail jump in the claimed 335-byte extent. The checked inventory is build/db30-retry/checked-target.log.

The constructor's instruction at 0x0051FB59 pushes the literal at VA 0x011065A4, AptMainMenu::MultiplayerButtonPressed. At 0x0051FB68 it loads ILT 0x0001C27E, which jumps to 0x0051DB30. The subsequent decoded binding stores the complete target object, an opaque word, the code pointer and a zero receiver delta into the 16-byte payload passed to 0x0051EDB0. This proves the callback role and zero receiver adjustment. It does not prove the original C++ decoration of the bank's reconstructed method.

build/db30-retry/decoded-binding.log decodes all 79 bytes of the holder constructor, all 49 bytes of the binding copy constructor and all 11 bytes of the invoker. The holder copies every one of the four payload words, initializes the wrapper reference count at +4 and increments it after storing the wrapper pointer. The vtable at VA 0x01106398 has its invoke entry at +4 through ILT 0x00014727 to 0x0051E420. The invoker adds the stored delta to the stored receiver and tail-jumps to the stored code without changing the incoming stack. Raw routes and table output are in build/db30-retry/decoded-invoker-route.log and build/db30-retry/callback-vtable.log. The complete callback proves one ignored 32-bit stack slot. Its interpretation as const char * and the original callback return declaration are not independently established by this tail-forwarding invoker. A complete higher dispatcher would be needed to certify those source-level types.

The constructor-backed GameTextManager table is VA 0x010F39F0. The complete 161-byte constructor at 0x00438350 stores that vptr at +0x34, and the complete 89-byte factory at 0x004385A0 reaches the constructor through ILT 0x000046C4. These bodies and the route are decoded in build/db30-retry/decoded-game-text-construction.log; their checked inventories are build/db30-retry/checked-game-text-constructor.log and build/db30-retry/checked-game-text-factory.log. This establishes the table store, not an exclusive census of every possible assignment to TheGameText. No constructor recovery is claimed. Slot +0x28 contains ILT 0x00020A86, which jumps to 0x00437F60. build/db30-retry/decoded-fetch.log decodes all 622 bytes of that body and every branch through its common ret 12. The three stack words are the hidden result pointer, label pointer and optional exists pointer. The optional pointer receives a byte. Every result route constructs into the supplied storage, retains that storage in ESI and returns it in EAX. The char-label fetch decoration is confirmed by the oracle. The shadow header's prose about which overload occupies +0x28 is not relied on; its overloaded declarations compile to the observed slot.

The wide copy helper at 0x00888400 is fully decoded in build/db30-retry/decoded-wide-copy.log. Besides the singleton guard and critical-section operations, it reads one source-object pointer, writes that pointer to the destination, increments the first payload dword when non-null and returns the destination with ret 4. It reads no second source-object field. The complete fetch reads word lengths at buffer +4 and compares word characters from +8 with a two-byte increment. The 82-byte literal constructor at 0x00888DE0 calls the imported wcslen and the wide buffer helper, initializes the destination pointer and returns with ret 4 on every path. These are independent UTF-16 and ownership evidence, not an inference from allocation size. Raw output is build/db30-retry/decoded-wide-constructor.log.

The narrow and wide 134-byte release helpers are fully decoded in build/db30-retry/decoded-slot.log. They initialize or enter their distinct shared critical sections, read the receiver's one pointer, decrement the payload's first dword, free the payload only at zero, clear the receiver pointer and leave the section. The 135-byte wide assignment helper handles self-assignment, releases the old destination, copies the source pointer and increments its count. Its final indirect jump to LeaveCriticalSection replaces the incoming stack argument with the section pointer, so the imported stdcall return still consumes four bytes. No element or container type is inferred from a buffer allocation.

The firewall query at 0x00690B70 uses the receiver fields at +4, +9 and +0x10 and returns an AL boolean through every complete return. Its indirect COM call instructions, slot offsets and argument setup were decoded; the external COM implementations were not decoded. The query requires a view of the whole firewall state, rather than the bank's eight-byte prefix alone. The caller's +0x270 guard is the state object's +8 byte. The 206-byte callee at 0x004675F0 reads its first argument as an unsigned level, accepts eight stack words, returns the shared buffer pointer in EAX and consumes 32 bytes. The bank's void fire declaration is an ABI view, not proof of the callee's return type. Correcting the return and first-argument width did not change the residue. The 49-byte setter at 0x0046CBF0 takes two reference pointers and consumes eight bytes; its text field uses the wide assignment helper.

The constructor writes primary and secondary vptrs at +0 and +0x218, followed by initialized derived fields at +0x258. The target field at +0x250 lies inside the second base at +0x38. Trials using the existing BfmeAptScreenBaseLayout header and independently checked base extents still produce the same caller residue. The base views retain address-derived identities.

Complete checked inventories are preserved as build/db30-retry/checked-fetch.log, checked-ascii.log, checked-ttd.log, checked-textsetter.log, checked-level.log, checked-wide-copy.log, checked-wide-set.log, checked-ascii-release.log, checked-wide-release.log, checked-wide-constructor.log, checked-main-constructor.log, checked-binding.log, checked-binding-copy.log and checked-invoker.log. Each is in build/db30-retry/. An inventory's clean decode is used together with the complete branch and return review above, rather than as a boundary certificate by itself.

## Exception cleanup

build/db30-retry/eh-retail.log resolves handler 0x00C2FBF0 and FuncInfo 0x00E1FB50. The four unwind states are 0 to -1 (narrow name at ebp-0x1C), 1 to 0 (wide result at ebp-0x14), 2 to -1 (narrow name at ebp-0x18), and 3 to 2 (wide result at ebp-0x10). All four cleanup actions are decoded through their ILTs and exported destructor jumps to the already decoded narrow or wide release helper. Main-path state stores follow the same pairs and reset to -1 after each text block. This is temporary ownership evidence; the function is not a constructor.

## Exact remaining mismatch

The first fetch loads its vtable into EDX and its hidden result address into EAX in retail; the bank swaps the two. After the call, retail pushes EAX, computes and pushes the narrow-name address through ECX, then loads the manager into ECX. The bank loads the manager first and computes the name address through EAX. The second fetch/setter sequence is identical outside relocations. One first-setter DIR32 site is displaced, so the probe's masked count alone is not a relocation-valid match.

build/db30-retry/strict-canonical-gate-final.log uses the repository's relocation resolver with no library masking exception and no new pins. It reports no unresolved relocations and the following differing bytes. build/db30-retry/scoped-byte-gate.log independently invokes the repository's scoped verify_functions implementation and reports Functions: FAIL 1/1. String, constant and source acceptance are not claimed after that byte failure.

| Offset | Retail | Compiled |
| --- | --- | --- |
| +0x51 | 11 | 01 |
| +0x5A | 44 | 54 |
| +0x5D | 50 | 52 |
| +0x67 | 52 | 50 |
| +0x69 | 50 | 8B |
| +0x6A | 8D | 0D |
| +0x6F | 8B | 50 |
| +0x70 | 0D | 8D |
| +0x71 | E8 | 44 |
| +0x72 | 19 | 24 |
| +0x73 | 2F | 08 |
| +0x74 | 01 | 50 |

## Rejected experiments and reopening condition

The complete earlier verdicts were retrieved in build/db30-retry/history.log, and all immutable saved bodies were compared with the preferred source in build/db30-retry/saved-source-diffs.txt. Previously exhausted flag, guard inversion, named-result, explicit-pointer and dummy-slot EH sweeps were not rerun as an unchanged search. The running hypotheses and their refutation conditions are in build/verdict.txt. Every trial source and its unedited probe log uses the same stem under build/db30-retry/; each source below was measured once unless another named probe is explicitly listed.

The table is generated from raw probe output. Probe differences cover the common extent and mask object relocation slots, so layout drift can undercount them. The extent penalty also counts bytes that a shorter body never emits or a longer body adds. None beats the unchanged preferred body. Include failures in trials 06 and 10 are not negative shape evidence; trial 11 repairs those scratch-only includes and measures the intended native-interface hypothesis.

| Trial | Change | Compiled bytes | Probe differences | Extent penalty |
| --- | --- | --- | --- | --- |
| 01 | fire return | 335 | 12 | 0 |
| 02 | level width | 335 | 12 | 0 |
| 03 | nested state | 335 | 12 | 0 |
| 04 | nested direct | 335 | 12 | 0 |
| 05 | visible ctor | 335 | 12 | 0 |
| 06 | native interface | Compile failed | Unmeasured | Unmeasured |
| 07 | const result | 335 | 12 | 0 |
| 08 | inline fetch | 331 | 149 | 4 |
| 09 | forceinline fetch | 331 | 149 | 4 |
| 10 | native complete | Compile failed | Unmeasured | Unmeasured |
| 11 | native fixed | 335 | 12 | 0 |
| 12 | canonical state call | 335 | 12 | 0 |
| 13 | copy init | 335 | 12 | 0 |
| 14 | const name | 335 | 12 | 0 |
| 15 | argument barrier | 335 | 15 | 0 |
| 16 | argument reference | 335 | 12 | 0 |
| 17 | name member lifetime | 335 | 12 | 0 |
| 18 | name base lifetime | 335 | 12 | 0 |
| 19 | shared event tail | 317 | 53 | 18 |
| 20 | visible state callee | 335 | 12 | 0 |
| 21 | member fastcall abi | 335 | 22 | 0 |
| 22 | nothrow argument barrier | 335 | 15 | 0 |
| 23 | raw fetch owned storage | 339 | 144 | 4 |
| 24 | raw fetch return pointer | 339 | 145 | 4 |
| 25 | raw fetch return assume | 339 | 144 | 4 |
| 26 | forward nothrow copy | 331 | 149 | 4 |
| 27 | forward nothrow dtor | 321 | 152 | 14 |
| 28 | canonical callees | 335 | 12 | 0 |
| 29 | dominated conditional result | 362 | 230 | 27 |
| 30 | explicit guard labels | 330 | 198 | 5 |
| 31 | target return pointer | 335 | 12 | 0 |
| 32 | native inheritance | 335 | 12 | 0 |
| 33 | inherited target accessor | 335 | 12 | 0 |

The visible literal constructor also reproduces its own 72-byte body (build/db30-retry/05-ctor-callee.log). The visible firewall query reproduces its own 245-byte body (build/db30-retry/20-state-callee.log). Neither changes the caller. The member-fastcall experiment is rejected independently of its score because it moves the hidden result into EDX and pushes the table pointer. The raw owned-storage adapter produces the desired vtable/result registers with the correct three stack arguments, but changes cleanup storage and recomputes the result address. Caching the returned pointer adds a field and a store; a truthful __assume does not remove the recomputation. These results demonstrate that the desired registers are expressible, but do not supply a matching source with the retail temporary lifetime.

build/db30-retry/oracle-check.log calls the oracle's Python API on body RVAs to avoid the command-line VA ambiguity. The bank's callback decoration and the existing applicationIsEnabled, bfme_setAptText and bfmeBuildAN decorations are CONTRADICTED. The char-label GameTextManager::fetch decoration is CONFIRMED. No aliases were renamed and no new identity pin was written. The selector binding proves the callback role, while those reconstructed decorations remain unverified as original EA names.

Reopen with independently supported native source or a concrete expression that changes the first fetch while retaining its three stack arguments, returned pointer use, all four cleanup locations and 335-byte extent. A raw adapter that merely selects the desired registers is insufficient. This run does not prove that assembly is required, and an unused time allowance alone is not new evidence. The preferred body remains targets/game/reverse/attempts/0x0051db30.cpp; the canonical-call experiment remains build/db30-retry/28-canonical-callees.cpp for reproducing the strict failure.
