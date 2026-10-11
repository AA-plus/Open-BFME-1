# Collection transfer at RVA 0x00366CA0

The 612-byte body transfers a collection of LivingWorldPlayerArmy values and a separate vector of integers. The inherited name BfmeLivingWorldPlayerArmyCollection is a converter placeholder, retained from the saved reconstruction. This note does not establish EA's original owner name. The tested base revision is 5dc2bc772b5c670bcb177327ce703c6bb2789c57. The compiler experiments use gpt-6.1-sol.

## Boundary and receiver

The complete decoded body ends at RVA 0x00366F04. Its two return paths contain `ret 4` at offsets +0x1B7 and +0x261. Every conditional branch remains inside that extent, and there is no tail jump out of it. Raw instructions are in build/366ca0-retry/decode-00366ca0.txt and the checked inventory is in build/366ca0-retry/checked-target.log.

The neighbour constructor at RVA 0x00366B90 installs vtable VA 0x010E8F5C. Slot +0x0C contains ILT RVA 0x0002B9AE, whose decoded jump reaches this target. The constructor and destructor at RVA 0x003643C0 describe the same receiver layout. The full constructor is decoded in build/366ca0-retry/decode-00366b90.txt; its checked inventory and vtable lookup are in build/366ca0-retry/checked-owner-ctor.log and build/366ca0-retry/vtable-owner.log.

The complete Snapshot transfer dispatcher at RVA 0x009D6410 receives a snapshot pointer on the stack, uses it as ECX, pushes its own Xfer receiver, and calls the snapshot's slot +0x0C. It returns its original Xfer receiver in EAX and cleans its pointer argument with `ret 4`. This agrees with the target's ECX receiver, one stack argument, no hidden result storage, and no meaningful return value. Raw instructions and inventory are in build/366ca0-retry/decode-009d6410.txt and build/366ca0-retry/checked-snapshot-dispatch.log. No direct named caller was found; build/366ca0-retry/callers-target.log records that limitation. The source preserves the bank's nonvirtual method spelling as a TU view of the body; the retail entry is reached through the vtable.

## Header fields and transfer slots

The base Xfer vtable at VA 0x01129258 and complete decoded overloads establish the following transfers. Each overload takes one pointer argument, uses ECX without receiver adjustment, returns the same Xfer pointer in EAX, and ends with `ret 4`. The target ignores these returned pointers and tests only AL from IsLoading.

| Receiver offset | Xfer slot | Evidence and source representation |
|---|---|---|
| +0x04 | +0x68 | AsciiString transfer at RVA 0x009D6940 reads a StringBase buffer and transfers its character length and bytes. The receiver constructor constructs this member from an empty string. |
| +0x08 | +0x50 | Coord2D transfer at RVA 0x009D65F0 sends the `c2d` tag and eight payload bytes. The source includes the canonical Coord2D header. The original bank's integer array is replaced by this coordinate representation. |
| +0x10 | +0x8C | ILT RVA 0x00038866 reaches RVA 0x0006B240, which sends the `bool` tag and one payload byte. The receiver constructor also writes exactly one byte here. |
| +0x14 | +0x78 | ILT RVA 0x0002A405 reaches RVA 0x0006B270, which sends the `int` tag and four payload bytes. The same slot transfers all vector counts and integer elements. |

The source includes game/GameEngine/Source/Common/System/xfer.h and game/Libraries/Include/Lib/Coord2D.h rather than redefining those interfaces. The bool, int, coordinate and string overloads are completely decoded in build/366ca0-retry/decode-0006b240.txt, build/366ca0-retry/decode-0006b270.txt, build/366ca0-retry/decode-009d65f0.txt and build/366ca0-retry/decode-009d6940.txt. Their checked inventories have the corresponding checked-xfer-bool, checked-xfer-int, checked-xfer-coord and checked-xfer-string log names. The vtable lookup is build/366ca0-retry/vtable-xfer.log.

## Container payloads and construction

The collection embeds its army vector at +0x18 and its integer vector at +0x24. The target's fast insertion path constructs an army at the current finish pointer, increments that pointer by 0x58, and destroys the stack temporary at the end of each iteration. Its overflow path reaches RVA 0x003665C0 through ILT RVA 0x000345B8. That helper calls RVA 0x003661E0 through ILT RVA 0x000344A0 for every value construction. The complete construction helper passes its source by reference and its destination in ECX to the complete copy constructor at RVA 0x003651E0. A generated pair-template ledger name at RVA 0x003661E0 is not type evidence and does not describe this decoded construction chain. That unrelated row is unchanged.

The complete army copy constructor reads and writes the following fields, with no additional payload field omitted from the decode:

| Offset | Copy operation |
|---|---|
| +0x00 | Install army vtable VA 0x010E8F38. |
| +0x04 | Copy one dword. |
| +0x08 | Copy one byte; the following alignment bytes are not copied. |
| +0x0C, +0x10, +0x14 | Construct three StringBase-backed AsciiString members through RVA 0x00887B60. |
| +0x18, +0x1C, +0x20, +0x24, +0x28, +0x2C | Copy six dwords. |
| +0x30 | Copy the embedded owning vector through RVA 0x00364640. |
| +0x3C, +0x40, +0x44 | Copy three dwords. |
| +0x48 | Construct another AsciiString. |
| +0x4C | Copy one byte; the following alignment bytes are not copied. |
| +0x50 | Copy one dword. |
| +0x54 | Construct the last AsciiString, ending the value at +0x58. |

The StringBase copy helper is fully decoded: it copies the buffer pointer and increments the buffer reference count when nonnull. The embedded vector copy helper is also fully decoded; it copies three-word vector storage and constructs each nested record with a 0xB4 stride. The target's TU view leaves the army payload opaque and calls the existing army constructors and destructor, so it introduces no alternate declaration of those nested records. Raw decodes are build/366ca0-retry/decode-003661e0.txt, build/366ca0-retry/decode-003651e0.txt, build/366ca0-retry/decode-00887b60.txt and build/366ca0-retry/decode-00364640.txt; the checked-construct, checked-copy, checked-string-copy and checked-vector-copy logs retain the complete inventories.

The integer overflow helper at RVA 0x000BBE70 is fully decoded. Its value-copy loop reads exactly one dword from the passed value and writes exactly one dword to each destination; there is no second pair field. Its range copies call the PE-imported MSVCR71 memmove with byte distances, and all element arithmetic uses a four-byte stride. The target passes its transferred integer slot by reference and its fast insertion path also copies one dword. This establishes the scalar integer payload independently of the allocation size and donor name. See build/366ca0-retry/decode-000bbe70.txt and build/366ca0-retry/checked-overflow-int.log. Both container declarations use the current STLport 4.6 headers. No new pin is introduced.

The army range erase at RVA 0x003668E0 is fully decoded. Its suffix destruction dispatches slot zero with a zero deletion flag and advances by 0x58. The army vtable's slot zero reaches the scalar deleting destructor at RVA 0x00363E00, which calls the complete destructor at RVA 0x00362B20, conditionally deallocates when bit zero is set, returns the original receiver pointer, and ends with `ret 4`. The complete destructor releases strings at +0x54, +0x48, +0x14, +0x10 and +0x0C and destroys the owning vector at +0x30. The TU declares the canonical complete destructor as nonvirtual and represents the unused deleting-destructor slot with its pointer-returning one-argument ABI. It declares the already owned range-erase specialization instead of emitting another implementation with that view. Raw decodes are build/366ca0-retry/decode-003668e0.txt, build/366ca0-retry/decode-00363e00.txt and build/366ca0-retry/decode-00362b20.txt.

## Exception cleanup and call destinations

Retail's FuncInfo has two unwind states. State zero transitions to -1 and destroys the temporary army at `[ebp-0x64]` through ILT RVA 0x00006C4E to RVA 0x00362B20. State one transitions to zero, pushes the placement address from `[ebp+4]` and the construction destination from `[ebp-0x6C]`, and invokes placement delete through ILT RVA 0x0002AAA9 to the one-byte return body at RVA 0x000607F0. The final object's unwind map has the same predecessors, stack offsets, argument order and cleanup symbols. See build/366ca0-retry/eh-target.log and build/366ca0-retry/landing-eh.log. The copy constructor's six cleanup states account for its base, constructed string members and owning vector; build/366ca0-retry/eh-copy.log retains that map. The default constructor's seven states additionally protect the last constructed string at +0x54 before its body calls range erase; build/366ca0-retry/eh-default.log retains that map. Their cleanup helpers are fully decoded in build/366ca0-retry/decode-0005c520.txt, build/366ca0-retry/decode-0005ee90.txt and build/366ca0-retry/decode-003627d0.txt. The owning vector destroys each nested element through its deleting-destructor slot with flags zero and releases its storage through the size-selected allocator. The overflow helper's old-vector cleanup is fully decoded in build/366ca0-retry/decode-003639e0.txt and also destroys each 0x58-byte army with flags zero before releasing the allocation.

The target has seven direct calls. Their decoded ILT routes reach range erase 0x003668E0, default construction 0x003649D0, army transfer 0x00365880, copy construction 0x003651E0, army insertion overflow 0x003665C0, complete destruction 0x00362B20 and integer insertion overflow 0x000BBE70. The final source uses those canonical call declarations and existing pins. The army transfer's complete body and slot +0x0C are checked separately from the Xfer slots. The memmove call is a cdecl three-argument IAT call whose slot is read from the PE import table, not an invented numeric source address.

## Measured retry

The saved reconstruction was measured at the verified retail extent. It emitted 623 bytes with 477 non-relocation differences; the first differing byte was +0x1C. The typed and canonical-interface drafts emitted 620 bytes with 474 differences, still with the receiver and Xfer registers mirrored. Making the owner virtual did not improve that result. The bounded EH search tried /EHsc, /EHsc- and _STLP_NO_EXCEPTIONS combinations and retained the same instruction shape. The search receipt is build/shape_search/212bc483598d43b6b13e8b997d428238/result.json.

Replacing the inline integer-vector erase expression with clear(), or binding that vector to a reference before erase(), recovered the degenerate self-comparison, removed the redundant finish-pointer reload, and changed the compiler's register allocation to retail's. Both variants emitted the complete target exactly modulo relocation slots. The final source uses clear() for both vectors, canonical Xfer and Coord2D declarations, and the independently verified army call and destructor symbols. Its final-path probe is build/366ca0-retry/landing-probe.log. All trial sources and unedited probe outputs are retained in build/366ca0-retry/.

This reconstruction would be refuted by a different decoded endpoint or outgoing branch, a differing ILT destination, a value-copy field absent from the table above, an incompatible indirect-call argument or return width, a differing unwind cleanup, or a failing scoped byte gate. The original EA owner name remains unproven; the inherited Bfme placeholder makes no claim to it.

## Validation and collection

add_match.py accepted the conversion and cleared the old bank. Its raw output is build/366ca0-retry/add-match.log. A separate scoped build through Git Bash also passed function equality, source claims, string references, constant references, DIR32 addresses and the body guard; build/366ca0-retry/scoped-gate.log retains that output. No shared header or shim changed, so this source conversion does not require the full gate.

find_declared_unmatched.py --fail, class_gate.py and pin_consistency.py --check passed. The inline bfmeXfer adapter carries its absent-from-retail marker and preserves the bank's name. Raw outputs are build/366ca0-retry/declared-unmatched.log, build/366ca0-retry/class-gate.log and build/366ca0-retry/pin-consistency-after.log. This revision's name_regression.py CLI accepts Git revisions rather than two source paths; the requested file-path invocation fails before comparison in build/366ca0-retry/name-regression.log. The same module's exported regressions function compares the retained original bank against the final source and reports no regressions in build/366ca0-retry/name-regression-files.log.

check_csv.py passed before conversion. After conversion it cannot complete because its Git-derived source list still contains the removed unstaged bank, producing FileNotFoundError for that path. The new source is also unstaged. build/366ca0-retry/check_csv-after.log retains the unedited failure. Git writes are prohibited in this worker, so the bank remains removed and the exact conversion remains in the working tree. Collection must stage the new source, evidence note, ledger replacement, tombstone and bank deletion together, then rerun the official check_csv.py and revision-based naming check with hooks active.
