# Manager submission at RVA 0x00895D30

The tested base revision is ac8d79f711ce90f77ed8b0c218974b38b4442c90. The working-tree source is game/Libraries/Source/Apt/Rva00895D30ManagerSubmit.cpp. Its complete 462-byte body passes the strict relocation-resolving comparison and the recorded DIR32 checks. The copied lookup independently reproduces its existing 115-byte body and uses inline linkage with its original noinline declaration. No shared header, baseline or tooling changes are required.

## Identity, complete boundaries and ABI

The existing manager method name and all banked descriptive names are retained. The complete matched caller bfmeSubmitNameEVA at RVA 0x00891F30 constructs a four-byte pooled string, passes its address as the sole stack argument and loads the manager at VA 0x013377D4 into ECX before calling this body at caller offset 0x36. The complete owner destructor at RVA 0x00896060 passes its unchanged receiver and the head payload's string member at offset four. The target's recursive call also passes a string address and the unchanged manager receiver. These establish the retained address-derived owner and thiscall, void-return, one-pointer-argument ABI. The existing pin agrees with those independently decoded calls; ILT checking is UNTESTABLE and supplies no additional identity evidence.

The target has one complete epilogue ending with ret 4 at RVA 0x00895EFB, followed by two INT3 bytes and the next body at 0x00895F00. Every conditional branch and jump remains inside the claimed extent. Complete decoded extents and checked_callees inventories are retained for the target (462 bytes), lookup (115), string construction (125), list predicate (199), payload destructor (144), decrement (12), drop (30), handle cleanup (35), string destructor (22), both named callers (107 and 98), and the list predicate's actual callee at RVA 0x00895510 (308). Every return path was inspected. The string constructor and lookup each have two exits, as do the predicate and its callee. No truncated extent or external conditional branch is accepted.

The lookup receives ECX, the hidden result-storage pointer as the first stack argument and the key pointer second. Both exits leave the storage address in EAX and clean eight argument bytes. Its complete result construction writes one payload pointer and conditionally increments the payload's first dword. The list predicate receives one owning pointer-sized value on the stack, returns an int tested through EAX, destroys that value and returns with ret 4. Its complete callee at RVA 0x00895510 has the same stack-value ownership and int-return width. The target constructs a retained by-value argument before calling the list predicate. There are no virtual calls in the target. Its indirect buffer callback has one pointer argument and four-byte caller cleanup; its pooled-string release calls table offset four with one pointer argument and four-byte caller cleanup; sized payload deallocation passes pointer then unsigned size and cleans eight bytes.

## Layout and ownership

The complete lookup establishes the manager head and node payload/next pointers at offsets zero and four. The complete payload destructor reads the string at four, kind at eight, callback argument at twelve, callback object at sixteen and buffer at twenty. For kinds three through five it adjusts the callback object's receiver by eight before calling RVA 0x008A25C0. The complete drop helper destroys the payload and passes size 24 to the recorded TheBfmeFree global. This layout is established by field accesses and cleanup, rather than allocation size.

The complete string constructor writes its block pointer, word reference count at zero, word capacity at four, word length at two, word flags at six and the terminated byte sequence at eight. Its empty-string exit stores the shared empty block and increments that block's word count. The lookup reads that word length and the complete character sequence. The string destructor decrements the word count and frees through the second pool-table slot only at zero. These distinguish the string reference count from the payload's dword reference count.

For kinds three through five, the complete target reads a signed count at callback object plus 0x28 and an entry pointer at plus 0x2C. It uses sixteen-byte records and reads only their initial byte-string pointer. The complete predicate at RVA 0x00895510 independently repeats those accesses. The remaining twelve record bytes and preceding object fields stay opaque; no STL key, payload, or named APT object type is inferred.

The tracker global is declared under its recorded BfmeTracker4310 type and cast to the existing Rva008956C0List view at the call. This preserves the bank's list-method identity while using the recorded global symbol. The inherited bank's direct Rva008956C0List global declaration was rejected by DIR32 verification because that spelling was not recorded. The canonical declaration resolves that rejection without a new pin or address record.

Replacing the dump row removes its old address-only symbol from the resolver. The unchanged, matched owner destructor consequently reports that old symbol as its only unresolved call. One additive compatibility pin keeps ?d_00895d30@@YAXXZ at the same independently decoded 462-byte body. The owner gate passes after that pin, and pin_consistency reports the alias consistent with the retained manager-method row. This pin makes no additional semantic identity claim and changes no existing pin. Raw before/after gates are build/eva-retry-00895d30/owner-gate-before.log and build/eva-retry-00895d30/owner-gate-after.log.

## Exception cleanup

Retail FuncInfo at RVA 0x00E46608 has three states with predecessors minus one, zero and one. States zero and one use EBP minus 0x18 and EBP minus 0x14, respectively, and tail-jump through ILT RVA 0x000463AD to the complete handle cleanup at RVA 0x00784A70. State two uses EBP minus 0x20 and tail-jumps to the complete string destructor at RVA 0x00891B80. The emitted map has exactly those predecessors, local adjustments and object lifetimes. Its normal-path state stores are already included in the exact main-body comparison.

The former cleanup concern was checked against complete bodies rather than inferred from an inlining difference. Retail's handle cleanup tests the pointer, calls the complete decrement helper, and calls the complete drop helper only for a zero result. The decrement helper writes only the pointed payload's first dword and returns the decremented value; it cannot change the handle's separate pointer slot. The drop helper performs the same payload destructor and size-24 free as the emitted handle destructor. The emitted destructor's cached pointer and inline decrement/drop therefore have the same null guard, dword decrement, zero test, destructor receiver, free arguments and ownership. The emitted string destructor independently has the same complete 22-byte instruction shape and pool reference as retail. The cleanup-provider code outside the assigned main extent is not claimed as a new byte recovery. The unwind map, receiver adjustments and cleanup behavior are resolved, while that provider's different inlining remains explicitly documented.

## Hypotheses and measurements

The reproduced bank emits 462 bytes with 18 non-relocation differences at +0x80, +0x83, +0x94, +0x98, +0xA4, +0xA7, +0xA9, +0xAC, +0xC7, +0xCE, +0xF6, +0xF9, +0x160, +0x164, +0x167, +0x169, +0x16E and +0x170. Decoding locates these in dependency-pointer loads, temporary-address registers, the first pool-table load and the loop increment. All field offsets, instruction lengths, branch targets and direct-call locations already agree.

The new hypothesis was that a class-body accessor reading the independently established callback-object pointer would reproduce the front-end expression structure that the direct field spelling lost. It would be refuted by unchanged scratch registers or by a different field access. The accessor object00895D30 returns exactly the retained m_object field. Using it for the dependency count and entry expressions removes every main-body difference. Kind-only and buffer-only controls retain all 18 differences. Removing those unused accessors leaves the target exact. The accessor's address token states that no original method name is known; it introduces no runtime helper call.

| Trial | Hypothesis | Emitted bytes | Non-relocation differences |
|---|---|---:|---:|
| 00 | Reproduce retained bank | 462 | 18 |
| 01 | Native decrement/drop definitions and handle-pointer reload | 462 | 18 |
| 02 | Out-of-class handle destructor definition | 462 | 18 |
| 03 | Upstream callback argument copied to a local | 462 | 18 |
| 04 | Class-body field accessors | 462 | 0 |
| 05 | Complete matched list predicate visible | 462 | 18 |
| 06 | Dependency-object accessor alone | 462 | 0 |
| 07 | Kind accessor alone | 462 | 18 |
| 08 | Buffer accessor alone | 462 | 18 |
| 09 | Suppress automatic inlining in the cleanup-definition region | 417 | 186 |
| 10 | Canonical tracker global with the local call view | 462 | 0 |

The register/copy generator found no applicable source-level choices. The earlier frame-array and donor-wrapper experiments were not repeated. The cleanup inlining-region trial is rejected because it changes the frame and introduces structural differences. An EH flag-search invocation failed before compilation because PowerShell wrote UTF-16 choices; it is retained as a tooling failure and supplies no codegen evidence. Compiler flags in the final command are the normal /O2, /GR- and /EHsc configuration, without a switch sweep.

Raw sources, decoded bodies, checked call inventories, trial probes, the final complete emitted cleanup bodies, strict main and lookup gates, and the programmatic bank-to-source name comparison are retained under build/eva-retry-00895d30/. The final strict logs are build/eva-retry-00895d30/scoped-gate.log and build/eva-retry-00895d30/lookup-gate.log. The complete unwind comparison and name check are in build/eva-retry-00895d30/acceptance-evidence-02.log, with emitted bodies in build/eva-retry-00895d30/object-final.log. The file-argument name_regression CLI invocation fails because this revision expects Git revisions; its underlying regressions function reports no bank-to-source name regression.

A different caller argument order, receiver adjustment, dependency field offset, refcount width, cleanup-state predecessor or deallocation argument would refute the recovery. A successful main-body byte comparison alone would not settle any of those checks.

## Landing checks

add_match.py byte-verifies the new row, tombstones the retired dump row and removes the preferred bank. The normal source build through explicit Git Bash passes, as do the unchanged owner caller, pin_consistency, class_gate and find_declared_unmatched. The bank-to-source name comparison reports no regression. check_csv.py is blocked because the read-only Git index still enumerates the removed bank: its FileNotFoundError names targets/game/reverse/attempts/0x00895d30.cpp. The conversion and bank removal are preserved for coordinator staging, as required by the worker brief. No full gate is required by this source-only change; none was run. Raw logs are build/eva-retry-00895d30/add-match.log, build/eva-retry-00895d30/build-gate-bash.log, build/eva-retry-00895d30/check-csv.log, build/eva-retry-00895d30/pin-consistency-final.log, build/eva-retry-00895d30/declarations-final.log and build/eva-retry-00895d30/class-gate-final.log.
