# Copy constructor at 0x0035E1F0

The complete address-derived reconstruction emits 352 bytes with no non-relocation differences. It is banked, not landed. The corrected extent overlaps the separate catch row at 0x0035E323, and the native template bindings require an identity decision outside this assignment. The final working tree keeps the existing ledger and symbol pins unchanged.

## New evidence and refutation tests

The previous attempts lacked a record layout and treated the first vector as Object-like pointers. The current landed sources `game/GameEngine/Source/Common/Rva0035D460StringRecordCopy.cpp`, `Rva00359330StringRecordFindIndex.cpp`, `Rva003568C0StringRecordFindNameIndex.cpp`, and `Rva00359330StringRecordClearNodes.cpp` supply declarations to check against retail. The retry hypothesis was that this is the copy constructor of the second 32-byte string-record table. A different complete caller argument convention, a different record field access, or incompatible constructor cleanup would refute that hypothesis.

The neighbour rows at 0x0035E030, 0x0035E163, 0x0035E323, and 0x0035E3B0 remain generated assembly. They do not supply a named owner. `Rva00359530StringRecordTable` retains the address-derived table name used by the landed lookup and release sources. No EA owner identity is claimed.

## Complete extent and caller ABI

The recorded 307-byte range ends at 0x0035E323. The conditional branch at 0x0035E2A4 instead reaches 0x0035E33B. The inner catch begins at 0x0035E30E, the outer catch begins at 0x0035E323, and the normal epilogue starts at 0x0035E33B. Its `ret 4` starts at 0x0035E34D and ends at 0x0035E350. Padding follows. The complete extent is therefore 352 bytes, including the separately recorded 24-byte outer catch and the 21-byte epilogue.

The complete 123-byte caller at 0x0035E3B0 pushes its source plus 0x2C and supplies its destination plus 0x2C in ECX before calling ILT 0x0000A687. That thunk resolves to 0x0035E1F0. The target reads one four-byte source address, uses the destination receiver in ECX, returns that receiver in EAX, and pops four argument bytes. This agrees with the proposed copy-constructor declaration. There are no indirect or virtual calls in the target. The memmove IAT slot is independently named by the PE import table, and its three cdecl arguments are destination, source, and byte count.

The complete target and caller inventories are retained in `build/target-0035e1f0/callees-target-352.log` and `callees-caller.log`. Their decoded instructions are in `decoded-core.log`. The initial 307-byte inventory, which exposes the outgoing conditional branch, is retained separately.

## Container fields and payload

The table contains three four-byte index-vector pointers at offsets 0, 4, and 8; three record-vector pointers at 0x0C, 0x10, and 0x14; and the two copied four-byte list indexes at 0x18 and 0x1C. The complete lower-bound lookup at 0x00356A60 loads a four-byte element through `[indexes + middle * 4]`, then multiplies that element by 20 to reach a record name at offset 8. These elements are record indexes. They are not established as Object pointers by their allocation size or by the older pointer-vector pin.

The actual placement construction reached through ILT 0x0002DE52 resolves to 0x003550F0. Its complete 107-byte body copies the following fields. It reads no byte at offset 0x0D, which is alignment padding in the reconstruction.

| Offset | Read and write | Declaration |
|---|---|---|
| 0x00 | Four bytes. | `int m_previous`. |
| 0x04 | Four bytes. | `int m_next`. |
| 0x08 | A StringBase<char> copy constructor on one string handle. | `AsciiString m_name`. |
| 0x0C | One byte. | `unsigned char m_released`. |
| 0x0E | Two bytes. | `unsigned short m_references`. |
| 0x10 | Four bytes. | `BfmeNodeY *m_nodes`. |

The target first zero-initializes the temporary name and node pointer, then calls 0x0035D460 through ILT 0x0004B30D. That complete 577-byte helper copies the index fields, assigns the name, copies the byte and word fields, clears the destination node pointer, and traverses source links at node offset 0. It allocates a 0x44-byte node, invokes the independently landed Script copy constructor on the payload at node offset 4, and rebuilds the linked list in source order using a local stack. Its explicit catch clears any copied nodes. All returns, branch exits, and the post-catch stack teardown were decoded. The ledger's 433-byte helper row does not contain that whole function.

The independent `construct-evidence.cpp` uses the proposed record declaration with natural alignment padding and reproduces all 107 bytes of 0x003550F0 modulo relocations. Its raw result is `probe-construct-evidence.log`. The record destructor is only the name's release at offset 8 and independently reproduces the complete eight-byte body at 0x00351980. Owning nodes are cleared explicitly rather than by this record destructor.

## Helpers and exception ownership

The complete getter at 0x001F8F80 returns its incoming hidden result-storage pointer in EAX and pops one stack slot. It writes nothing and ignores the receiver. The complete vector-base constructor at 0x001F9330 consumes the element count and allocator reference in that order, initializes all three vector pointers, allocates four bytes per index, returns its receiver, and pops eight bytes. Its allocator-proxy helper is a store of the second argument into the receiver. Those instructions establish the ABI independently of the older generated template names.

The complete reserve at 0x00359B50 takes an unsigned count in one four-byte stack slot, uses a 20-byte record stride and the three vector pointers, and returns with `ret 4`. The complete overflow insert at 0x0035B130 consumes position, value reference, empty tag reference, unsigned fill count, and a one-byte Boolean occupying a four-byte stack slot. It returns with `ret 0x14`. It reads position, value, fill count, and the Boolean, but never reads the empty tag reference. Its construction loops call the same complete helper at 0x003550F0. This is the evidence for making its real operation visible to the caller; a matching donor name alone was not used as type proof.

The constructor has seven unwind states. The predecessor sequence is `-1, 0, 1, 2, 3, 3, 1`. State 0 destroys the four-byte index vector. State 1 destroys the record vector at receiver offset 0x0C. State 3 destroys the temporary record at EBP minus 0x28. The other states have no cleanup action. The three cleanup action instruction sequences agree with retail, including receiver adjustments. The native record-vector destructor reproduces the complete 167-byte body at 0x0035AA50; the index-vector destructor reproduces the complete 45-byte body at 0x000D0190; and the record destructor reproduces the complete eight-byte body at 0x00351980, each modulo relocation slots.

The first catch entry has states 4 through 4, catch state 5, and one catch-all handler at target offset 0x11E. It surrounds insertion only. The copy helper runs outside it and cleans its own failed copies. This insertion catch clears the temporary node chain before rethrowing; the temporary's unwind destructor releases its name. The second catch entry has states 2 through 5, catch state 6, and one catch-all handler at offset 0x133. It drains appended nodes and records through 0x0035ADC0 before rethrowing, after which the record-vector unwind destructor releases its allocation. The metadata and both catch entries agree exactly with the compiler object. See `object10.log` and `eh-offset3.log`.

Complete checked inventories are retained for the target, caller, record copy, placement construction, reserve, overflow insert, record clear, table clear, vector destructors, index lookup, allocator getter, vector base, and Script copy. The initial EH tool rejected the EBP prologue; reading from the actual registration sequence at target plus 3 exposed the complete map instead of skipping it.

The complete eight-byte node destructor at 0x00354A60 adjusts the receiver by 4 and tail-jumps through ILT 0x0003F94F to the complete 156-byte Script destructor at 0x00352C20. That destructor separately guards and invokes three slot-zero deleting destructors on its condition and action pointers at offsets 0x1C, 0x20, and 0x24, each with one four-byte flag argument equal to 1. Their results are unused. It also releases the four string members. These indirect calls belong to the already landed Script destructor; the table constructor introduces no new virtual dispatch or declaration of those interfaces. `decoded-final-helper-extents.log`, `checked-node-dtor.log`, and `checked-script-dtor.log` retain this ownership evidence.

## Measured experiments

| Trial | Source change | Emitted bytes | Non-relocation differences |
|---|---|---:|---:|
| 01 | Native vectors and a complete constructor, with both catches. | 357 | 175 |
| 02 | The real non-retaining allocator getter is visible without inlining. | 357 | 168 |
| 03 | The source record end is cached before the loop. | 352 | 50 |
| 04 | The record copy precedes the insertion catch. | 356 | 73 |
| 05 | The empty dispatch tag is default-initialized instead of value-initialized. | 352 | 10 |
| 06 | A temporary derived empty tag tests slot reuse. | 352 | 10 |
| 07 | The real vector-base operation is visible without inlining. | 352 | 10 |
| 08 | The actual overflow insertion operation is visible without inlining. | 352 | 0 |
| 09 | An explicit clear declaration tests helper visibility. | 352 | 0 |
| 10 | Alignment padding replaces the uncopied byte member at 0x0D. | 352 | 0 |

The mechanical EH search tested twelve candidates before manual EH iteration. It did not improve the first trial; /EHsc- reduced the body to 309 bytes and made it worse. Sources, the full search result, and raw probe outputs are retained under build/. The best final source is trial10.cpp. The visible overflow helper itself emits 235 bytes rather than retail's 287 and is not claimed as a helper recovery; its complete semantic operation and unused tag provide caller compilation evidence only.

## Acceptance blockers

`add_match.py` refuses the 352-byte replacement because the range contains the live row `?d_0035e323@@YAXXZ`. Its exact refusal is in `add-match-boundary-refusal.log`. No row was retired manually, and the 307-byte source boundary was not used to hide the epilogue.

The strict candidate gate initially reports four unresolved native template calls and a conflicting existing vector-base binding. Eight trial bindings covered those calls and the three unwind cleanups. With those bindings, strict comparison, string references, constants, DIR32 checks, and body guard pass at the complete 352-byte extent. The separate pin-consistency audit rejects all eight route aliases because their native template names differ from the ledger's existing generated or address-derived names. The trial bindings were removed rather than bypassing that identity rule. The conditional gate result is not an acceptance receipt for the final tree. The proposed rows and the raw rejection remain in `rejected-pins.csv` and `pin-consistency.log`; the final pin audit is green.

Reopening requires an authorized correction of the interior catch row and a consistent binding of the independently decoded helper operations to the existing ledger identities. The final source has no masked byte mismatch. Its current strict gate is blocked by the unresolved and conflicting call bindings. A full gate is not claimed. No new source recovery or retail byte progress is reported until those blockers are resolved.

The tested base revision is ecab5577078a97e29fb692f61c15f07ee372b746. The actual model is gpt-6.1-sol. All raw paths named above are relative to `build/target-0035e1f0/`. Trial sources and compiler objects remain local for reproduction.

The preferred bank is `targets/game/reverse/attempts/0x0035e1f0.cpp`. A probe of that saved file at the complete 352-byte extent remains exact modulo relocations (`probe-bank-352.log`). The banking tool assigns score 0.7068 using the unchanged 307-byte ledger extent; its diagnostic explicitly reports 352 emitted bytes, 307 retail bytes, and zero differences within that shorter comparison (`measure-bank-diagnostic.log`). That automatic queue score was preserved. The run recorded exactly one partial verdict, with clock-derived duration 22.09 minutes at verdict submission.
