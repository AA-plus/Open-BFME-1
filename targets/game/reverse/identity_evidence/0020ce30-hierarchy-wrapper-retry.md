# SpawnTownsmen update hierarchy and lookup-wrapper retry

The target remains a partial. Neither new hypothesis improves the preferred bank. No source recovery, byte equality with retail, new pin, or native container-template identity is claimed.

## Tested revision and hypotheses

The tested revision is fdcb83ed7d110639933115e4f7ecdc8e0b3beeb8. The actual model is gpt-6.1-sol. The prior bank and per-target evidence were read before changes. Eligibility reports the assigned row as an open dump; this does not certify a claim lease.

The current landed complete destructor, introduced by bc789c2468aa64eda3368f2461d4f78cac1254b8, confirms the Module, ObjectModule, BehaviorModule and UpdateModule base chain. The first hypothesis was that preserving this chain rather than the bank's flattened bases would change the receiver's register allocation while keeping the witnessed offsets. The hierarchy trial retains the bank's descriptive names and adds the verified intermediate bases. Identical or worse code refutes this compiler hypothesis. Its code section is byte-identical to the control.

The GeneralsMD ThingFactory header defines findTemplate as an in-class wrapper around findTemplateInternal. Current symbols.csv already pins the one-argument BFME internal spelling through ILT 0x00028560. The decoded body returns a pointer and uses ret 4; the Zero Hour check argument is absent in BFME. The second hypothesis was that restoring the native wrapper layer would alter the temporary allocation before status-mask construction. Identical or worse code refutes this hypothesis. The wrapper changes the relocation name to the existing internal spelling but leaves the code bytes identical. Neither trial changes argument widths or runtime operations.

No other previous blocker is addressed by new current-tree evidence. The generated EH and family manifests are retained in build/r0020ce30-context/eh-choices.json and build/r0020ce30-context/family-choices.json. Their choices repeat earlier rejected exception specifications, flags, store order, loop spellings and coordinate operand order, so no additional search was justified. Two unchanged register experiments reach the coordinator's stopping limit.

## Complete decode and retained ABI evidence

build/r0020ce30-context/decoded.log retains the complete target and helpers. Each extent has its own checked-callees raw log in the same folder. build/r0020ce30-context/branches.log lists all decoded direct branches and returns for the target and its principal helpers; every direct branch is instruction-aligned within its requested body. The target returns at +0x1B3 and +0x1C7, has no tail jump, receives the update-interface receiver in ECX, reads module data at receiver-0x0C and Object at receiver-8, and returns a full EAX word without stack arguments.

The complete owner constructor installs the primary vtable at object+0, the behavior interface at +0x0C and update interface at +0x10. Update slot zero routes through ILT 0x000416DC to the target. Primary slot four routes through ILT 0x0002F504 to the landed getModuleNameKey body, whose source and retail literal name SpawnTownsmenBehavior. This corroborates the inherited bank name independently of compiler shape. The corresponding GeneralsMD update-interface declaration has update as its first virtual slot. No SpawnTownsmen body was ported from a Zero Hour twin.

The list initializer at 0x001DB0F0 writes exactly two words of the allocation and returns its receiver. The find body at 0x001DB130 reads the key at node+0x0C and next pointer at +0x10 and uses ret 4. The complete node constructor initializes vector begin, end and capacity at +0, +4 and +8, stores one key at +0x0C and clears next at +0x10. The actual overflow helper reached through ILT 0x0003B075 is 0x000BBE70. Its complete value-copy loop reads only [value-reference], writes one destination word and advances by four; prefix and suffix copies use memmove. The complete add body has the same single-word construction and consumes key then value with ret 8. This independently refutes a pair payload. The original scalar category remains unproven; the inherited vector<void *> is a representation view, not an independently identified native specialization.

The full GameLogic lookup consumes a four-byte ID, compares the hash-node key at +4, returns Object at +8 and uses ret 4. Factory lookup consumes one AsciiString reference and returns a pointer. NewObject consumes template, team, status reference and extra word with ret 0x10. SetPosition consumes a Coord3D pointer with ret 4. The target's terrain call is through slot +0x18, with ECX as receiver, two four-byte float arguments, a null normal pointer and an x87 return. The canonical terrain declaration and complete landed default getGroundHeight body corroborate the signature and ret 0x0C. Concrete runtime overrides were not separately enumerated. No new identity or ABI pin is proposed.

build/r0020ce30-context/eh-evidence.log compares the control's COFF unwind map and complete cleanup with retail. There is one unwind state with predecessor -1. The cleanup matches all eleven instruction bytes after masking its call operand, and that operand independently resolves to scalar delete. It cleans the failed list allocation, not vector elements or the spawned object. This check passes; it does not make the main body exact.

## Measured results

The following values are generated from the unedited probe logs. Quality is the diagnostic finish-measure formula, which penalizes missing bytes twice. Misaligned relocation sites make this a queue score rather than a strict relocation check.

| Trial | Emitted bytes | Overlap differences | Missing bytes | First difference | Quality |
| --- | ---: | ---: | ---: | --- | ---: |
| baseline-control | 455 | 162 | 1 | +0x1D | 0.6404 |
| hierarchy | 455 | 162 | 1 | +0x1D | 0.6404 |
| factory-wrapper | 455 | 162 | 1 | +0x1D | 0.6404 |

Raw outputs are build/r0020ce30-context/baseline-control.log, build/r0020ce30-context/hierarchy.log and build/r0020ce30-context/factory-wrapper.log. Corresponding full sources are baseline.cpp, hierarchy.cpp and factory-wrapper.cpp in that folder. build/r0020ce30-context/byte-equality.log verifies their target code sections are identical before linking and verifies the preferred bank is unchanged byte for byte.

The remaining structural differences are the ESI/EDI assignment and save schedule starting at +0x1D, push ECX instead of retail's literal zero at +0x11B, the terrain-vtable temporary and load placement around +0x153, and list-add argument staging around +0x18C. The source still emits one fewer byte. The native wrapper and hierarchy do not change any of these residues.

## Checks and reopening condition

The scoped ordinary byte gate fails 1/1 in build/r0020ce30-context/scoped-gate-raw.log. It also reports the inherited unresolved ??0BfmeListAK@@QAE@XZ constructor declaration. The gate uses one in-memory candidate row and leaves functions.csv untouched. Its late relocation diagnostics are affected by the existing instruction-layout drift and are not new callee-identity findings. No pin was invented to make this check pass.

check_csv.py, pin_consistency.py --check, class_gate.py on the retained control, the branch checks and the constructor-cleanup comparison pass. Raw outputs are build/r0020ce30-context/check-csv-final.log, build/r0020ce30-context/pin-consistency-final.log, build/r0020ce30-context/class-gate.log, build/r0020ce30-context/branches.log and build/r0020ce30-context/eh-evidence.log. No header, shim, source or ledger change requires a full gate. Source-landing checks are inapplicable because no game source is added.

The preferred body remains targets/game/reverse/attempts/0x0020ce30.cpp. Reopen only with independent evidence for a native expression or type view that changes the first allocation divergence while preserving the decoded ABI and cleanup, or with a demonstrated new compiler shape. Repeating the hierarchy or factory wrapper now has no justification. All uncollected sources, objects and raw logs remain under build/.
