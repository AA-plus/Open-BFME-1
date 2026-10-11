# Count-slot retry at 0x008AA650

The retained reconstruction remains partial. Its address-derived symbol is `?rva008AA650StringSplit@@YAPAVBfmeC1030@@PAVRva8CD130Value@@H@Z`. The active bank is `targets/game/reverse/attempts/0x008aa650.cpp`. This note describes the new bank; `008aa650-native-split-retry.md` describes the earlier run. No function-ledger row, symbol pin, shared header or tooling file changes in this retry.

## Hypothesis and refutation

The current ledger supplies the complete encoder at `0x008A0320` under `EAStringC::UTF8_Initialize008A0320(int)`, replacing the bank's address-derived encoder declaration with a canonical call through a retained inline wrapper. Its complete body independently confirms a one-pointer string receiver, a DWORD code point, a reference result in EAX and `ret 4`. It supplies a sound declaration but does not resolve the old stack-slot blocker.

The new scope hypothesis follows the compiler listing rather than an inferred owner: the saved reconstruction puts its `index` local in the dead `count` argument slot, while retail puts the owning input-string copy there. Declaring an uninitialized index at function scope and assigning it at the decoded point could have freed that slot for the input. Both measured scope variants left the instruction stream and cleanup locations unchanged, refuting this lever for the reconstruction. The source listings and raw probes remain under `build/aa650-worker7/`.

## Boundaries, ABI and field evidence

`008aa650-decoded.txt` contains every instruction through the final plain `ret` at `0x008AAB12`. The zero-count path has its own plain return. Negative counts skip string construction; reaching the limit skips remainder creation. All direct branches stay inside the complete target and land on decoded instruction boundaries. `008aa650-checked.txt` lists all twelve actual direct destinations; none is a jump thunk.

`008cf740-decoded.txt` covers the complete callback dispatcher, including its final `ret 12`; `008cf740-checked.txt` checks the complete extent. On the native path it pushes the count and then the value pointer, calls the callable's `+0x20` slot and removes eight bytes. It uses EAX as a value pointer. The complete constructor at `0x00899FC0` stores that callback pointer at `+0x20`. The property dispatcher's decoded call site installs this target. These establish two DWORD cdecl arguments, pointer return, no hidden result storage and no callback ECX receiver. The original callback identity remains unknown.

The complete array constructor and its base initialize kind 22 and fields `+0x20`, `+0x24` and `+0x28`. The complete setter takes a signed DWORD index followed by a value pointer and returns with `ret 8`. Its complete reserve helper copies four-byte elements. Its complete tagged store reads the incoming vtable, calls slots 0 and `+0x14`, tests AL, releases the previous value through slot 4 and stores the value pointer with its low tag bit. The payload is therefore a tagged value pointer, independently of allocation size or a donor's name. The exact dynamic virtual targets are not identified.

The complete string-value constructor writes flags at `+4`, the string-block pointer at `+8` and a free-list pointer at `+0x0C`, and registers through capacity/count/entries at offsets 0/4/8. The target chooses the direct value for tag 1 and the pointer at `+0x20` otherwise. Assignment at `0x008A9A70` reads every field of its one-pointer source view, increments the block's 16-bit reference count, releases the destination block, installs the source and returns with `ret 4`. Append, Find and truncate have their complete decoded extents and checked inventories retained. The pool free slot uses one caller-cleaned block pointer. Allocation uses one caller-cleaned size DWORD and a pointer result. Their dynamically installed implementations remain unknown.

`control-flow-tables.txt` verifies every direct branch and every table destination in the complete code regions of `toInteger`, `getName` and the property dispatcher, including tag-map bounds. The longer ledger extents contain data after the final returns. The external integer-conversion tail goes to the independently decoded complete CRT `__ftol2` helper; its low EAX result is consumed. This evidence does not use raw opcode hits or decompiler boundaries.

## Ownership and unwind evidence

Retail allocates a headered array object, registers `raw+8`, then constructs it. The complete failure delete unregisters the object and frees `storage-8` with `size+8`. The decoded cleanup and constructor substantiate the existing headered allocator and sized-delete declarations. No new ownership pin is introduced.

`eh-retail.txt` and `eh-state-*-checked.txt` retain the handler, FuncInfo, all cleanup bodies and tail destinations. `18-postincrement-compiled-eh.txt` and `18-postincrement-retained.obj` retain the candidate's COFF unwind map and cleanup instructions. The six-state transition topology and allocation cleanup agree; byte equality is not claimed. The remaining cleanup offsets are:

| State | Owned object | Retail EBP offset | Candidate EBP offset |
| --- | --- | --- | --- |
| 0 | Array allocation | -0x10 | -0x10 |
| 1 | Separator | -0x18 | -0x18 |
| 2 | Input string | +8 | -0x20 |
| 3 | Encoded string | -0x20 | -0x1C |
| 4 | Remainder string | -0x1C | -0x14 |
| 5 | Delimiter-found string | -0x20 | -0x1C |

## Compiler experiments

Each row below names an unchanged trial source and its unedited probe output. Every probe explicitly requested the proven retail extent. Quality comes from `finish_measure.parse`, which counts size drift twice. Relocation-layout drift means these masked distances are screening measurements, not acceptance evidence.

| Trial source under build/aa650-worker7 | Compiled bytes | Differing bytes | First offset | Measured quality |
| --- | ---: | ---: | --- | ---: |
| `00-saved.cpp` | 1223 | 709 | +0x86 | 0.4118 |
| `01-canonical.cpp` | 1223 | 709 | +0x86 | 0.4118 |
| `02-listing.cpp` | 1223 | 709 | +0x86 | 0.4118 |
| `03-capture-before-input.cpp` | 1224 | 863 | +0x86 | 0.2838 |
| `04-native-accessor.cpp` | 1224 | 789 | +0x86 | 0.3445 |
| `05-switch-accessor.cpp` | 1223 | 736 | +0x86 | 0.3897 |
| `06-length-after-input.cpp` | 1226 | 637 | +0x86 | 0.4660 |
| `07-index-inner-block.cpp` | 1226 | 637 | +0x86 | 0.4660 |
| `eh-new-00.cpp` | 1223 | 709 | +0x86 | 0.4118 |
| `eh-new-01.cpp` | 1223 | 709 | +0x86 | 0.4118 |
| `08-conditional-member.cpp` | 1223 | 734 | +0x86 | 0.3913 |
| `09-length-after-member.cpp` | 1224 | 784 | +0x86 | 0.3486 |
| `10-increment-first.cpp` | 1226 | 637 | +0x86 | 0.4660 |
| `11-copy-increment-first.cpp` | 1225 | 788 | +0x86 | 0.3437 |
| `12-acquire-result.cpp` | 1225 | 844 | +0x86 | 0.2978 |
| `13-index-function-scope.cpp` | 1223 | 709 | +0x86 | 0.4118 |
| `14-index-function-length.cpp` | 1226 | 637 | +0x86 | 0.4660 |
| `15-index-listing.cpp` | 1226 | 637 | +0x86 | 0.4660 |
| `16-nested-decode.cpp` | 1240 | 858 | +0x86 | 0.2617 |
| `17-count-storage.cpp` | 1243 | 864 | +0x17 | 0.2518 |
| `18-postincrement.cpp` | 1226 | 636 | +0x86 | 0.4668 |
| `19-pointer-ctor.cpp` | 1223 | 734 | +0x86 | 0.3913 |
| `20-pointer-length.cpp` | 1224 | 784 | +0x86 | 0.3486 |
| `21-native-string-class.cpp` | 1226 | 636 | +0x86 | 0.4668 |
| `22-value-getter.cpp` | 1208 | 839 | +0x86 | 0.2937 |
| `23-raw-payload.cpp` | 1224 | 783 | +0x86 | 0.3495 |
| `24-common-accessor.cpp` | 1224 | 781 | +0x86 | 0.3511 |
| `25-natural-inline.cpp` | 1224 | 781 | +0x86 | 0.3511 |
| `26-const-input.cpp` | 1226 | 636 | +0x86 | 0.4668 |

The best snapshot is `18-postincrement.cpp`. Its canonical encoder wrapper retains the bank's existing method name. Capturing separator length immediately after the input copy and using the integer switch accessor improved the masked distance. Incrementing the index in the append argument changed one further byte, but did not recover the native counter and limit registers or input lifetime.

The new encoder exception-specification search produced the same object result. Its generated choice, raw per-trial probes and search manifest are retained in `eh-new-choices.json`, `eh-new-*-probe.txt` and `build/shape_search/736753f5af9c48f68af3f627dfc442ec/result.json`. The non-register family generator found no applicable unique text edit in the retained body. Earlier frame-array and broad EH searches were not restarted.

Rejected shapes include capturing length before the input, branched/conditional/common-exit getters, reversing reference-count stores, a distinct allocation-result lifetime, nested UTF-8 decode control flow, explicitly constructing the input in the count slot with an RAII reference owner, a native string-base class, returned-by-value input acquisition, and a const input. Their trial rows above give the measurements. Explicit count-slot construction enlarged the frame and was rejected. The two function-scope index experiments produced unchanged outputs, and that scope lever was stopped.

## Checks and reopening condition

The strict scoped byte gate fails on this candidate's own mismatches, with no unresolved direct call. Its raw output is `build/aa650-worker7/scoped-byte-gate.txt`. `checks.json` records exit codes and raw paths for CSV, pin consistency, class gate and declared-unmatched checks. Name regression uses the tool's direct source comparison API and passes. Declared-unmatched is expected to fail for an unmatched bank without a ledger claim; no marker or whitelist is changed to suppress it. No full gate is required for a bank and no full-gate result is claimed.

Reopening needs evidence or a measured compiler shape that places the input copy in the dead count slot and preserves all four temporary cleanup offsets. Retrying the unchanged index-scope, encoder exception-specification or native-base shapes is not justified. The remaining blocker is `stack-slot/input-argument-reuse`, with associated UTF-8 scheduling and counter/limit allocation. The descriptive names from the existing bank remain present. No recovery is landed.
