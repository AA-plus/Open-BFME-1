# Storage setup at RVA 0x008C6130

The clean C++ storage view in `game/Libraries/Source/Apt/BfmePoolXA008C6130Setup.cpp` reproduces the complete retail body. The inherited `BfmePoolXA`, `BfmeSpecXA`, `bfmeSetupXA` and member names are converter placeholders, not recovered EA identities. The method's ILT oracle result is `UNTESTABLE`. EA's file evidence places the address in `Libraries/Source/Apt/AptActionInterpreter.cpp`; the source remains in that Apt directory. There is no canonical declaration registered for either inherited view.

The tested base revision is `9ba522700c8fd907582ded977dcc4566503a0c52`, with this conversion applied in the working tree. Raw measurements and reproducible trial sources are retained under `build/rva008c6130-worker/`. No shared header, tool, pin, baseline or generated assembly source changed.

## Boundary and calling convention

The retail target has 234 bytes and 73 completely decoded instructions. Its preceding bytes are `INT3` padding; its only return is `ret 4` at `+0xE7`, followed by padding at `+0xEA`. It contains no conditional branch, outgoing jump, tail call or exception registration. Complete target and caller disassembly is in build/rva008c6130-worker/decoded.txt. The checked inventories are build/rva008c6130-worker/checked-target.txt and build/rva008c6130-worker/checked-caller.txt.

The complete 524-byte caller at RVA `0x00894800` passes the configuration in EDI with `push edi` at `+0x5C`, sets ECX to the receiver at VA `0x01338748`, and calls the target at `+0x62`. The target moves ECX to ESI and reads its single four-byte stack argument at `[esp+0x0C]` after saving ESI and EDI. There is no receiver adjustment or hidden return storage. The caller ignores the result, so the reconstructed method returns void. The target preserves ESI and EDI and removes its argument with `ret 4`.

## Storage and allocation contract

The target reads configuration dwords at offsets `0x20`, `0x24`, `0x28`, `0x2C`, `0x30` and `0x3C`, stores the corresponding capacities at receiver offsets `0x04`, `0x10`, `0x1C`, `0x28`, `0x34` and `0x40`, and stores allocation results at `0x08`, `0x14`, `0x20`, `0x2C`, `0x38` and `0x44`. Configuration offsets `0x40` and `0x44` supply receiver fields `0x4C` and `0x50`. Their low-word product, multiplied by four, supplies the final allocation and zero-fill size. The pointer is stored at `0x54`. The final tail reads the old dword at `0x48`, multiplies it by the dword at `0x50`, increments and stores the counter, stores the selected four-byte-cell address at `0x58`, and clears the dword at `0x80`.

The pointer declarations are local four-byte storage views. This body neither constructs nor copies an STL value, identifies a container key, nor establishes whether a stored cell is an integer or a pointer. No native payload type is inferred from allocation size. The source retains the bank's representation without adding an ownership or native class claim.

Every allocation calls the existing cdecl `void *(unsigned int)` callback cell `Rva008C5D70Alloc`. All seven DIR32 operands resolve to VA `0x01337828`, as independently checked in build/rva008c6130-worker/exact-audit-raw.log. The target defers caller cleanup until `add esp,0x1C`, removing seven four-byte byte-count arguments. Each result is a four-byte pointer in EAX and is consumed as an address. The callback's data row and DIR32 registry already own the cell, so no pin or data definition is introduced.

The complete installer at RVA `0x00789440` writes VA `0x00B831E0` into that cell. The five-byte thunk at RVA `0x007831E0` jumps to the complete 17-byte `operator new[]` body at RVA `0x00881F70`. That body reads its one argument from `[esp+4]`, pushes allocator group two and the byte count, calls the existing memory-manager callback, removes those two arguments, and returns the EAX pointer without removing its own argument. The actual matched donor `game/Libraries/Source/WWVegas/WWLib/mem_ops.cpp` declares precisely that cdecl allocation contract. Decoder and checked-inventory evidence is in build/rva008c6130-worker/allocator-installer-disassembly.txt, build/rva008c6130-worker/checked-allocator-thunk.log and build/rva008c6130-worker/checked-allocator-body.log. The loader initially zero-fills the Apt callback cell; its initial value must not be read as raw file bytes beyond the section's raw extent. This is checked in build/rva008c6130-worker/identity-checks.log.

There is no value constructor, destructor, unwind state, virtual dispatch or cleanup helper in the target. The counter view has no constructor or destructor and adds no emitted helper call. MSVC 7.1 passes 29 compile-time size and offset assertions, including the counter's four-byte size, receiver offsets through `0x80`, and every configuration offset used by the body. The checks and actual compiler command are retained in build/rva008c6130-worker/layout-check.cpp and build/rva008c6130-worker/exact-audit-raw.log.

## Scheduling experiment

The unchanged preferred bank reproduces 234 bytes with seven relocations and eight differing non-relocation bytes, all at `+0xD1` through `+0xD8`. Retail emits `40 89 46 48 8D 0C 8A 5F`, while the bank emits `8D 0C 8A 40 5F 89 46 48`. These are the counter increment, counter store, pointer LEA and EDI restore in different orders. Every instruction before and after that window matches. The baseline raw probe is build/rva008c6130-worker/baseline-probe.log, and its exact source snapshot is build/rva008c6130-worker/original-bank.cpp.

The successful new hypothesis was that a four-byte member view with an inline conversion and assignment could retain the native update schedule after scalar spellings had failed. `Counter008C6130` contains one int, converts by reading it, and assigns by storing the supplied int and returning itself. Replacing only the counter's declaration with this view makes the complete body exact. Removing an unused postincrement operator preserves the result. The view is a measured compiler-facing representation, not evidence that EA used a counter wrapper. The hypothesis would be refuted by a changed member offset, any additional runtime instruction, or a differing final-path byte or relocation operand.

| Trial | Compiled size | Differing non-relocation bytes | Raw probe |
|---|---:|---:|---|
| Inline reserve with pointer output reference | 234 | 18 | build/rva008c6130-worker/output-reference-probe.log |
| Inline pointer return scope | 234 | 18 | build/rva008c6130-worker/pointer-return-scope-probe.log |
| Inline scalar output reference | 234 | 18 | build/rva008c6130-worker/scalar-out-reference-probe.log |
| Neighboring Apt runtime and inline flags | 234 | 8 | build/rva008c6130-worker/native-neighbour-flags-probe.log |
| Aggregate holding base and scaled index | 234 | 22 | build/rva008c6130-worker/aggregate-pending-pointer-probe.log |
| Aggregate holding base, stride and index | 236 | 34 | build/rva008c6130-worker/aggregate-unscaled-index-probe.log |
| Aggregate method advancing a reference | 235 | 39 | build/rva008c6130-worker/aggregate-member-advance-probe.log |
| One-pointer conversion wrapper | 234 | 8 | build/rva008c6130-worker/pointer-value-wrapper-probe.log |
| Disable global optimization | 422 | 211 | build/rva008c6130-worker/global-optimizer-disabled-probe.log |
| Paired inline setters | 234 | 8 | build/rva008c6130-worker/paired-inline-setters-probe.log |
| Inline getters and setters | 236 | 35 | build/rva008c6130-worker/getters-and-setters-probe.log |
| Counter postincrement wrapper | 236 | 40 | build/rva008c6130-worker/counter-postincrement-wrapper-probe.log |
| Counter assignment and conversion wrapper | 234 | 0 | build/rva008c6130-worker/counter-assignment-wrapper-probe.log |
| Minimal counter wrapper | 234 | 0 | build/rva008c6130-worker/counter-minimal-wrapper-probe.log |

The full earlier history was read from build/rva008c6130-worker/history.txt, and saved alternatives were inspected directly. Their source differences are retained in build/rva008c6130-worker/archived-source-diffs.txt. The store/copy generator's eight choices are in build/rva008c6130-worker/family-choices.json. They swap allocation stores, dimension stores or the same final stores already covered by earlier attempts, so its combinations were not rerun.

## Verification and collection

The final source passes the exact probe in build/rva008c6130-worker/final-source-probe.log, the independent instruction and relocation audit in build/rva008c6130-worker/exact-audit-raw.log, the normal add-match byte gate in build/rva008c6130-worker/add-match.log, and the scoped build in build/rva008c6130-worker/scoped-gate-bash.log. The gate verifies the complete body and all seven DIR32 references without a body-guard baseline finding. No header or shim changed, so this conversion requires the scoped gate rather than a full gate.

Declared-function ownership, pin consistency and class declarations pass in build/rva008c6130-worker/declared-unmatched.log, build/rva008c6130-worker/pin-consistency.log and build/rva008c6130-worker/class-gate-final.log. The bank-to-source name regression API reports no lost descriptive names in build/rva008c6130-worker/exact-audit-raw.log. The name-regression CLI in this revision accepts Git revisions rather than source paths; its commit-time invocation remains for the coordinator after staging. Oracle and canonical-declaration checks make no new real-name claim. The old dump name occurs only in its original assembly definition, with no other source referencing it, so no compatibility pin is needed.

The initial `check_csv.py` passed. After conversion, its normal working-tree invocation fails while trying to read the deleted bank still listed in Git's unstaged index. The raw failure is build/rva008c6130-worker/check-csv.log. Git writes are forbidden for this worker, so the verified source, repointed ledger, tombstone and bank deletion remain together for the coordinator to stage and check. The bank is not restored to conceal that expected staging dependency.
