# RVA 0x003A1A30: coordinate copying and instruction scheduling

## Result

No C++ recovery is claimed. The existing bank at `targets/game/reverse/attempts/0x003a1a30.cpp` remains unchanged, including its checkout line endings. Its function emits 566 bytes and differs from the complete retail body in 31 non-relocation bytes. No measured alternative improves the byte comparison. The new useful observation is that scalar union word transfers recover the retail floating-point load order and final x87 cleanup order, but lose the output-base address calculation. This narrows the unresolved source-shape question; it does not prove that assembly is required.

The tested revision is `9778a932c11c43066d2674eafc0ce24b7cdcd517`. The model is `gpt-6.1-sol`. Raw measurements, immutable source snapshots, compiler objects, function bytes and relocations are retained under `build/rva003a1a30/`. `bank_measurement.json` binds the bank source, emitted bytes and retail bytes with SHA-256 hashes; `bank_audit_final.log` verifies that the bank equals HEAD after checkout line-ending normalization and that its emitted function equals the empty-destructor control. No game source, ledger row, pin, baseline, shared header or tooling is changed.

## Complete boundary and callers

Retail starts at `0x003A1A30`. ILT `0x000481FD` is a complete five-byte jump to that address. The three returns are `ret 12` at target offsets `+0x36`, `+0x153` and `+0x233`. The last ends at `0x003A1C66`, where INT3 padding begins. Every conditional branch and ordinary jump remains inside the complete 566-byte target. Its only call is indirect, through the receiver vtable at slot `+0x6C`; there are no direct calls, outgoing tail jumps or exception states in this body. Complete decoded instructions and following bytes are retained in `build/rva003a1a30/decode_final.log`; `checked_target.log` independently checks the requested extent and direct-call inventory.

Complete callers at `0x00148800` (124 bytes), `0x003A2070` (404 bytes), `0x00741360` (545 bytes), and `0x00149470` (1943 bytes) contain six decoded calls to that actual ILT. The first caller passes object, zero flag and null output, then tests AL. The update caller does that twice. The caller at `0x00741360` pushes an EAX whose AL was produced by SETE, independently confirming that the flag's high bytes are irrelevant. The second call in `0x00149470` supplies a stack float's address as the third argument. These are decoded instruction-boundary sites in full bodies, rather than raw opcode hits. `checked_caller1.log` through `checked_caller4.log` retain their inventories and outgoing-branch checks.

At entry, argument one is the object pointer at stack `+4`; argument two is tested only as the byte at stack `+8`; argument three is an optional float-output pointer at stack `+12`. Incoming ECX is unused before being overwritten. Failure clears AL, success writes AL=1, and every exit removes twelve argument bytes. The member-call view preserves the caller's receiver setup, but the body alone cannot distinguish an unused receiver from a static callee with equivalent stack cleanup. No hidden return storage or receiver adjustment is present. The outer index and inner index occupy object offsets `+0x20` and `+0x40`; the inner positive test is signed. Floating-point state is read at `+0x18`, `+0x1C` and `+0x3C`. The coordinate result occupies `+0x48..+0x50`.

The legacy name `BfmeMgrGK::bfmeCheckGK` is not independently proved by the old pin and caller view. The ILT oracle returns CONTRADICTED for both the bank's decoration (char return with two int parameters after the object pointer) and the historical decoration (bool return with a bool flag and float output pointer) at the body's own thunk `0x000481FD`. Raw outputs are `oracle_bank.log` and `oracle_old_abi.log`. The inherited bank names are retained. A future recovery must resolve the name check or retain the descriptive word with an address token as the current brief permits; no semantic manager identity is claimed here.

## Range payload and actual value helpers

The target reads begin and end at object offsets `+0x2C` and `+0x30` and divides their signed byte difference by `0xB8`, then compares the count as unsigned. These operations support the bank's indexing shape, but cannot independently establish an owning STL specialization, a pair, or a key type. No range construction, allocation or destruction occurs in the target.

The actual neighboring copy route is complete body `0x003A24F0`, ILT `0x000072F2`, placement helper `0x003A2460`, ILT `0x0001F573`, and complete value copy `0x003A2360`. The value helper copies word `+0`, all forty bytes at `+4..+0x2B`, ten twelve-byte values at `+0x2C..+0xA3`, three separate words at `+0xA4`, `+0xA8` and `+0xAC`, the four-byte string object at `+0xB0`, and final word `+0xB4`. The array callback ILT `0x00036B6A` resolves to the complete three-field constructor at `0x0005BC20`, whose only reads and writes are offsets 0, 4 and 8, and whose return removes one four-byte source pointer. Export 218 names this constructor `Coord3D::Coord3D(const Coord3D &)`. Its destruction callback ILT `0x0001364C` resolves to the complete one-byte return at `0x0005BC40`.

The string copy at `0x00887B60` is decoded through every return and branch. It copies the source's buffer pointer, increments a non-null buffer's reference count, and uses the witnessed critical-section imports around that operation. Export 184 independently names the narrow `StringBase<char>` copy constructor. The bank's scalar declaration at `+0xB0` therefore must remain an opaque view and cannot describe payload ownership. The generated pair instantiation at `0x003A2460` is not independent evidence for a pair or key. The target itself interprets the prefix as float durations and samples, and separately reads the three tail words as coordinate bits. Trial 22 separates the ten-element array from this tail and leaves its non-relocation output unchanged.

The complete CRT copy helper at `0x009F7036` receives destination, source, stride, count, constructor and destructor. It passes each source pointer on the stack and the destination in ECX to the actual constructor callback, then advances both by twelve bytes for ten elements. Its completion flag and copied count feed the complete action at `0x009F7084`. On failure that action calls the complete `__ArrayUnwind` at `0x009F6D18`, which walks completed destinations backwards by the stride and dispatches the provided empty destructor; success skips that destruction. The SEH prologue and epilogue are decoded completely at `0x009F7E88` and `0x009F7EC3`. The checked-helper logs cover the value copy, string, coordinate constructor/destructor, copy walk, placement helper, CRT copy, unwind action, array unwind and SEH helpers. This does not introduce an ownership or allocator claim for the interpolation target.

The View tables at VAs `0x010F6940` and `0x011217A0` have slot `+0x6C` pointing to ILTs `0x00021779` and `0x00039220`. They resolve to complete bodies at `0x0045BAE0` (three bytes) and `0x0073D880` (58 bytes). Both remove one four-byte argument with `ret 4`; the second reads that word from the stack, compares or stores the receiver field at `+0x23BC`, and may forward the word through message dispatch. Its two return paths and indirect dispatch are retained in the complete decode. The source's opaque slot has the required physical ABI; no new method identity or pin is inferred from the slot. `checked_virtual1.log` and `checked_virtual2.log` retain the independent extent checks.

## Exact residue and experiments

The bank's exact differing offsets are: +0x1C9, +0x1CA, +0x1CC, +0x1CD, +0x1CE, +0x1D0, +0x1D1, +0x1D2, +0x1D3, +0x1D4, +0x1D5, +0x1D6, +0x1E1, +0x1E2, +0x1E4, +0x1E5, +0x1E6, +0x1E8, +0x1E9, +0x1EA, +0x1EB, +0x1EC, +0x1ED, +0x1EE, +0x1EF, +0x201, +0x202, +0x203, +0x204, +0x205, +0x206. These are computed from `bank_measurement.json`, rather than inferred from the similarity score. At `+0x1C9..+0x1D6`, retail loads the next Y component, loads the rounded X word into EDI, subtracts the Y source, and stores X. The bank loads and stores X before beginning that Y calculation. The analogous Z/Y swap occupies `+0x1E1..+0x1EF`. At `+0x201..+0x206`, retail pops the remaining interpolation factor before loading argument three; the bank reverses those independent operations. The stack slots, arithmetic operands, widths, destinations and frame agree. `probe00_bank.log` retains the unedited whole-body comparison.

Each row below comes from `measurements.jsonl`. Wrong bytes include non-relocation differences and every missing or excess emitted byte, so short candidates cannot receive credit for their omitted tail. Probe's own emitted-overlap count can differ from this total. Each row has a same-stem immutable `.cpp`, unedited `.log`, `.obj`, `.compiled.bin`, `.retail.bin`, and `.relocs.json`. The JSON record and running `build/verdict.txt` state the hypothesis, its evidence, and the observation that would refute it.

| Trial | Emitted bytes | Wrong bytes including extent difference | First wrong offset |
|---|---:|---:|---|
| trial01_empty_destructor | 566 | 31 | +0x1C9 |
| trial02_native_raw_assignment | 603 | 219 | +0x16E |
| trial03_output_raw_assignment | 579 | 151 | +0x188 |
| trial04_union_bit_copy | 564 | 107 | +0x1C2 |
| trial05_union_member_copy | 577 | 167 | +0x188 |
| trial06_union_word_pointer | 577 | 171 | +0x188 |
| trial07_union_word_subobjects | 564 | 103 | +0x1C2 |
| trial08_union_whole_words | 566 | 31 | +0x1C9 |
| trial09_union_value_setter | 577 | 171 | +0x188 |
| trial10_union_result_getter | 564 | 107 | +0x1C2 |
| trial11_union_pair_copy | 564 | 103 | +0x1C2 |
| trial12_union_copy_loop | 577 | 167 | +0x188 |
| trial13_native_coord3d | 595 | 252 | +0x002 |
| trial14_union_axis_setters | 564 | 107 | +0x1C2 |
| trial15_native_coord_visible_copy | 595 | 252 | +0x002 |
| trial16_union_reference_accessor | 564 | 107 | +0x1C2 |
| trial17_typed_float_bit_transfer | 576 | 119 | +0x1C2 |
| trial18_native_coord_alias | 591 | 211 | +0x16E |
| trial19_native_merged_selection | 567 | 187 | +0x0EA |
| trial20_output_union_assignment | 577 | 167 | +0x188 |
| trial21_generated_store_1 | 564 | 102 | +0x1C2 |
| trial22_separate_record_tail | 566 | 31 | +0x1C9 |
| trial23_pointer_alias_context | 599 | 442 | +0x057 |
| trial24_typed_float_pointer | 569 | 163 | +0x188 |

The empty destructor and whole-word aggregate controls reproduce the bank's scheduling residue. The union scalar copy instead preserves rounded representations and recovers retail's FP-first loads and final x87 pop, but folds the output base into ESI-relative stores, losing `lea edx,[esi+0x48]` and shifting the tail. Native raw assignments, output-only assignments, pointer and word-valued setters, scalar subobjects, pair copying, individual setters, pointer/reference accessors, an unrolled copy loop, and typed float transfers do not preserve both requirements. The native Coord3D context initially creates an unwanted derived constructor call; direct native-type use removes that call but still changes the source-selection shape. Selecting the source pointer before native assignment does not recover the prefix. The targeted `/Oa` diagnostic affects the earlier virtual-call reload and worsens the body, so it is not an accepted fix. The separate tail declaration corrects the payload view without improving the bytes.

Only the newly introduced union word-store family was passed to `shape_family_levers` and `shape_search`. Its one applicable output-store ordering was exhausted and remains nonmatching. Raw generator/search output is `build/rva003a1a30/family_store_search.log`; immutable shape-search files are under `build/shape_search/826c87600bfb41b8b5e9d32c1c02c049/`. Previously recorded scalar local-order, component-order, generic setter, native Vector3 and broad flag experiments were not used as the starting hypothesis for this run.

## Verification and reopening

`check_csv_initial.log` passes for the initial tree, and `check_csv_final.log` passes after the single verdict row was appended. `pin_consistency.log` passes the pin, CRT import and DIR32 checks. `scoped_dump_gate_bash.log` passes the existing single assembly row, including its body guard; it establishes no C++ recovery. The first batch attempt could not locate `build.cmd`, and the explicit batch attempt's Python launcher could not find an installed interpreter. Both failures are retained in `scoped_dump_gate.log` and `scoped_dump_gate_retry.log`; the successful check uses the explicit Git Bash build entry. No shared header or shim changed, so a full gate is not required. No source conversion exists for class, declaration or bank-to-source naming checks.

The remaining blocker is the combination of rounded scalar transfer scheduling and output-subobject address materialization. A source form that keeps the union experiment's FP-first copies, preserves the bank's complete prefix and materializes the output base would justify reopening. A separately verified native inline with different copy semantics could also justify it. Another unchanged bank spelling, a matching donor name, an allocation size, or the normalized instruction score would not. A decoded branch outside the recorded target, an ABI-disagreeing caller or virtual callee, an additional field touched by the actual value constructor, or a changed raw probe would refute the corresponding evidence above. Exact code equality, even if reached later, would still need the independent identity and ABI checks.
