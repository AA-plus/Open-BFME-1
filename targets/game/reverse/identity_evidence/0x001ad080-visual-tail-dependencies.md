# Retained visual-call residue at 0x001AD080

The tested revision is `4fe1d0ff4462cabc7593685dc00559689d55da02`, using gpt-6.1-sol. No source recovery or ledger replacement resulted. The preferred body at targets/game/reverse/attempts/0x001ad080.cpp remains byte-identical to the initial working-tree snapshot. Its complete extent still measures 594 bytes with 17 non-relocation differences and aligned relocation sites. Reproduction is retained in build/finish-001ad080/baseline-clean.log and bank-final.log; the source hash and measured offsets are in final-facts.json and exact-difference-map.log. Every trial source and unedited subprocess probe output remains under build/finish-001ad080. The running record is build/verdict.txt.

The retry hypothesis was that an incorrect pointer-return declaration, scalar argument representation, coordinate-copy lifetime, or caller dependency concealed the apparent allocation residue. The first two declaration corrections and several independently different lifetime forms emit the same tail. That observation refutes them as finishing levers. The experiment does not prove that assembly is necessary. Reopening requires a new source dependency that produces the decoded module, scale, and matrix load order while preserving the already matching prefix, rather than another unchanged scratch-register spelling.

## Complete boundaries and interfaces

The target has two complete `ret 0x10` paths, at 0x001AD17A and 0x001AD2CF. The latter ends at 0x001AD2D2 and is followed by INT3. Every conditional branch remains inside the complete extent; there is no external tail jump, exception-registration prologue, or constructor cleanup in this target. Raw instructions and the checked call inventory are build/finish-001ad080/decode-001ad080.log and checked-001ad080.log.

Decoded ILT routes are 0x0001FA5F to the ten-byte allocator at 0x0042E520, 0x00012FFD to the 226-byte bucket lookup at 0x001A3060, 0x000451D3 to the 93-byte record copier at 0x001A5A60, and 0x00021E04 to the 340-byte vector growth body at 0x001ACA90. The growth helper reaches the complete 19-byte placement helper at 0x001A6D80 through 0x0001BBAD. The allocator returns the old receiver dword at +0x28 and increments it. The bucket helper consumes one coordinate pointer, dispatches bounds through receiver slot +0x28, and returns a dword with `ret 4`; the target narrows AX and sign-extends that word. The record copier returns its destination in EAX and cleans one pointer argument. Growth cleans five argument words. The complete decodes and checked inventories use the corresponding decode-XXXXXXXX.log and checked-XXXXXXXX.log filenames under build/finish-001ad080. Both direct diagnostic helpers were also decoded and checked completely at 0x008896D0 and 0x008896A0.

The container has no associative key. Its three pointers occupy receiver offsets +0x55C, +0x560 and +0x564; the count and finish update use a 48-byte stride. The complete actual copier transfers dwords at +0x00, +0x04, +0x08, +0x0C, +0x10, +0x14, +0x1C, +0x20, +0x24 and +0x28, bytes at +0x18, +0x2C and +0x2D, and a word at +0x2E. It leaves +0x19 through +0x1B untouched. The target initializes coordinate bits, allocator result, receiver counter, template pointer, selected limit, two flags and the previous bucket word. It leaves +0x1C through +0x24 uninitialized. Their meaning remains unknown. Growth copies these complete values and frees the old container storage; it makes no element-destructor calls. Payload and ownership conclusions come from these operations, not allocation size or the inherited template name.

All six incoming E8 hits were validated on instruction boundaries inside complete decoded bodies: 0x001D8B59, 0x001D91C2, 0x0025C124, 0x0038CC31, 0x00390052 and 0x00394DE1. Every call reaches ILT 0x000364AD, whose decoded jump targets this body. The five complete callers are 0x001D88C0, 0x0025C010, 0x0038C1E0, 0x0038F7B0 and 0x00394260. They pass template, coordinate pointer, matrix pointer and a four-byte scale, with the terrain receiver in ECX. Raw screening and complete-body validation are in build/finish-001ad080/caller-audit-raw.log, with full caller decodes and checked inventories beside it. No screened hit remains unvalidated.

The visual slot +0x84 forwards through complete bodies at 0x00730D90 and 0x006C8950 to the complete insertion at 0x00736B60. Both wrappers and the insertion clean 0x2C stack bytes. The insertion dereferences the matrix, uses scale and the fifth argument in floating-point operations, and reads the module pointer's string fields at +0x08, +0x0C and +0x48 and its flag at +0x54. The two final string arguments are references. EDX is not an incoming argument of either visual wrapper. Corresponding complete decode and checked logs are retained. This establishes a pointer return for the resource slot consumed here and a float representation for the fifth visual argument; the bank's inherited `getID` name is not independent identity evidence. The Tree diagnostic and the existing EA chain entry for TerrainLogic::addTree support the role, while the retained target owner and method remain address-qualified.

## Exact remaining differences

The measured byte offsets and their instruction causes are as follows. This table is derived from the final bank probe, not an opcode-only search.

| Byte offsets | Decoded difference |
|---|---|
| +0x209 | Retail first loads the saved module pointer into EDX; the bank first loads scale into EDX. |
| +0x211 | Retail next loads scale into ECX; the bank loads the matrix into ECX. |
| +0x21A and +0x21B | Retail loads the matrix into EAX and pushes the module from EDX; the bank loads the module into EAX and pushes EAX. |
| +0x21C through +0x221 | Retail loads the first coordinate word into EDX before pushing zero, matrix and scale. The bank pushes zero and matrix before loading that word into ECX. |
| +0x228, +0x22A, +0x22D, +0x230 and +0x233 | Coordinate stores and the remaining two coordinate loads use the resulting ECX/EDX assignments. |
| +0x23C and +0x243 | Retail places the visual table in EAX; the bank places it in EDX and dispatches through EDX. |

## Rejected experiments

Each individual variant below has one probe measurement (n=1); unchanged-bank reproduction was repeated. The exact sources, raw output and timestamped results are preserved in build/finish-001ad080/measurements.jsonl and the named trial files. No worse variant replaced the preferred bank.

| Hypothesis family | Trial files and measured result |
|---|---|
| Correct decoded pointer and float interfaces | pointer-slot, real-random-scale and typed-both retain the 17 differences. |
| Reference-taking visual operation with reordered forwarding parameters | forward-module-scale-transform and the other forward-* forms emit 562 bytes with 283 wrong or missing bytes. The helper remains a separate call. |
| Retained scan-result lifetime | outer-candidate, conditional-result and continue-result retain the original residue. |
| Scalar representation and alias metadata | scale-bits, scale-raw-local, matrix-reference-view, module-reference-view, module-const-pointer and resource-data-pointer retain the residue. |
| Coordinate aggregate operation | coord-whole-assignment, coord-field-assignment, coord-initializer-reverse and coord-two-field-copy retain the residue. An implicit copy emits 584 bytes with 222 wrong or missing bytes. |
| First coordinate component materialized separately | coord-explicit-first-value introduces x87 transfers and measures 48 differences. coord-first-raw-local measures 26; direct raw and reference forms remain at 17. |
| Native insertion expressed explicitly | vector-explicit-native-v2, vector-native-construct-v2 and vector-explicit-finish-v2 emit 615 bytes with 258 wrong or extra bytes, including a larger frame. Initial failed compile forms are also retained. |
| Result storage and value object | module-array-one, module-aggregate, module-union, module-reference-local and module-result-value-wrapper retain the residue. module-array-two enlarges the frame and measures 45 differences. |
| Bounded copy-lifetime generator | copy-family-00 through copy-family-03 retain the residue. The generator choices, raw search output and manifest are preserved; the manifest is build/shape_search/36daae3c61b64f70b84951f5f39c1127/result.json. |
| Two scratch-rotation probes | shadow-kind-getter and shadow-kind-reference-getter retain the residue. No further unchanged rotation sweep was run. |
| Alias contract and helper visibility | MSVC 7.1 refuses __restrict and __declspec(noalias). coord-copy-local-noalias, coord-copy-outline-inline and debug-flag-visible retain the residue. |
| Incoming argument read constraints | matrix-parameter-volatile-measured and scale-volatile-bit-load retain the residue. Volatile float reads introduce x87 transfers and emit 597 bytes with 72 wrong or extra bytes. Constraining both raw reads measures 24 differences. |
| Table adapter and copy aliasing | table-copy-noalias retains the additional coordinate reload and emits 597 bytes with 40 wrong or extra bytes. table-caller-noalias damages the loop and emits 583 bytes with 497 wrong or missing bytes. |
| Existing control-flow fact | retained-result-nonzero retains the residue. |
| Neighbouring native exception policy | native-terrain-eh-policy uses /EHsc and retains the complete 594-byte, 17-difference result without an EH frame. |
| Offset-zero payload construction by the landed copier | record-copy-subobject retains the residue while referring to the existing copier decoration. It remains a representation experiment, not a new identity claim or promoted source. |
| Oracle-supported allocator declaration | public-allocator-declaration retains the residue. No callee ledger row or pin was changed. |

## Verification and promotion limits

The strict candidate-row verifier fails byte comparison and reports the inherited record-copy and vector-overflow decorations as unresolved. Its row exists only in memory; raw output is build/finish-001ad080/scoped-gate-raw.log. CSV and global pin checks pass in check-csv-final.log and pin-consistency-raw.log. The scratch candidate fails class_gate because it privately defines canonical Coord3D, and find_declared_unmatched because it owns no matched row; raw output is class-gate-candidate.log and declared-unmatched.log. No full gate is required or claimed because no source, shared header, shim or ledger conversion was made.

The body-address ILT API confirms the public allocator decoration and contradicts the bank's protected decoration. Address-qualified target, bucket and record names do not gain real identities from the oracle. Direct diagnostic names are untestable by that oracle. Raw results are build/finish-001ad080/oracle-raw.log. These inherited declaration issues remain promotion work. The preferred bank is unchanged, so this run introduces no new or changed real name. A future retry must resolve those declarations and the strict relocation bindings in addition to finishing the located tail; masked equality alone would not suffice.

The verdict's statement about identity with HEAD refers to unchanged source content. Git stores this bank with LF while the initial checkout and retained bank use CRLF. A literal blob-byte comparison therefore fails; comparison with the initial raw snapshot passes, and normalized HEAD text also matches. The final audit explicitly checks both, in build/finish-001ad080/handoff-audit-raw.log. No bank line ending was changed.
