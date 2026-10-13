# RVA 0x002A9000: native accessor and ABI evidence

The preferred reconstruction remains unchanged at 833 bytes with 70 differences outside relocations. No source recovery or ledger conversion is claimed. The normal byte verifier rejects the bank, and its address-derived coordinate-helper declaration is unpinned. This note describes working-tree measurements against revision 4db97d5ccf56b971c8d4de3e44279a5c05fed18d, using gpt-6.1-sol. The run began at 2026-10-13T13:52:56Z. This evidence snapshot was generated at 2026-10-13T14:40:49.455459+00:00.

## Identity and complete boundary

Retail decodes into 274 instructions over the full 833-byte extent. All conditional branches and direct jumps stay inside it. Returns at +0xD3, +0x22E, +0x29B, +0x2B0, +0x336 and +0x340 restore the applicable path's saved registers and frame. The final return is followed by 24 INT3 bytes. The complete raw decode and checked inventory are build/a9000-finish/target-decode.log and build/a9000-finish/target-checked.log. An outgoing branch or an omitted epilogue would refute this extent.

The primary vtable at VA 0x010C37B8 is installed at +0x5F in the complete 356-byte constructor. The oracle independently confirms the SpecialAbilityUpdate constructor decoration. Slot 12 reaches ILT RVA 0x00001AFA, which jumps to this body. The complete update-interface caller at RVA 0x002AA9D0 adjusts its incoming secondary receiver by -0x10 and calls primary slot +0x30 with no stack arguments. The complete direct caller at RVA 0x0025E430 also passes its unadjusted receiver and no stack arguments. These callers agree on the receiver and argument ABI. Neither caller consumes this body's result. Retail itself returns boolean values through AL. Constructor and destructor installation evidence is build/a9000-finish/owner-constructor-decode.log and build/a9000-finish/owner-destructor-decode.log. The current public destructor decoration is contradicted by the oracle; this run does not use that decoration to establish ownership and does not edit it.

The oracle confirms `?approachTarget@SpecialAbilityUpdate@@MAE_NXZ`, a protected virtual bool method. The original bank's public unsigned-char decoration and its public bool alternative are contradicted. The Zero Hour declaration and approach phase provide independent method-order and behavior evidence. The synthetic BfmeThing940B::bfmeTwo940B alias does not establish a second identity. Raw oracle results are build/a9000-finish/oracle-decorations.log. Vtable evidence is build/a9000-finish/vtable.log. Caller evidence is build/a9000-finish/caller-decode.log and build/a9000-finish/virtual-caller-decode.log. A different vtable route, slot order or contradictory oracle result for the protected bool decoration would refute the named identity.

## Field, callee and lifetime checks

The target reads object and module-data pointers at receiver +8 and +4, an ID at +0xAC, and three-float coordinates at +0xB0 and +0xBC. It reads a byte at +0xDD and writes a byte at +0xE5. Object position occupies +0x38 through +0x40; the target's Object ID, AI pointer, containment pointer and destination-ID store are at +0x74, +0x204, +0x214 and +0x3A0. Module-data accesses use template +0x1D8, float range +0x1EC, and a string at +0x250. Its string backing record reads a word length at +4 and a byte string beginning at +8. These offsets and operand widths agree in both complete instruction streams. There are no stack-slot or field-displacement differences in the bank.

The coordinate helper at RVA 0x002A5FB0 has 367 fully decoded bytes, four return paths and no outgoing branch. It reads its receiver's object at +8, takes a mutable three-float coordinate pointer and a float, and returns through AL with ret8. Successful output writes cover x, y and z at offsets 0, 4 and 8. There is no hidden return-storage argument. Its downstream path query at RVA 0x003EDF90 consumes a four-byte optional pointer as its fourth argument: it tests the full word, chooses the object's AI subrecord when it is null, and reads the selected record at +0x10. A boolean fourth parameter is refuted by those dereferences. Some existing path-query pins have incompatible scalar spellings; this run changes none. Raw evidence is build/a9000-finish/coordinate-helper-decode.log, build/a9000-finish/coordinate-helper-checked.log and build/a9000-finish/helper-path-decode.log. The exploratory coordinate-helper source emits 366 bytes and is not an exact helper recovery or accepted type witness.

Complete decodes and checked inventories are retained for the lookup, override resolver, kind-of predicate, scale query, contact query, face command, move command, obstacle update and onExit virtual target. Their logs are named build/a9000-finish/lookup-decode.log, override-decode.log, kindof-decode.log, scale-decode.log, contact-decode.log, face-decode.log, move-decode.log, obstacle-decode.log and onexit-decode.log, with corresponding checked logs. Lookup compares a four-byte key at hash-node +4 and returns the pointer payload at +8; the caller uses that pointer as Object storage. No STL value constructor or allocation is reached by this lookup body, so allocation sizes were not used to infer payload types.

The target has no EH frame. Its copied coordinates have three observed float fields, and separately decoded canonical copy/value constructors and the empty destructor agree with that representation. Raw constructor evidence is build/a9000-finish/coord-copy-decode.log, coord-values-decode.log, coord-default-decode.log and coord-destructor-decode.log. Command-wrapper EH cleanup remains in the copied visibility trials; those trials are compiler experiments, not additional recovered bodies. The scale copy independently matches all 22 bytes with no relocations. The face and move wrappers reproduce their existing 219-byte and 203-byte emissions outside relocation slots. The iterative override copy still differs at five bytes and is not an exact helper. Raw emission checks are build/a9000-finish/scale-emission-raw.log, face-emission-raw.log, move-emission-raw.log and override-emission-raw.log. The exploratory contact helper emits 596 rather than 609 bytes and is not an accepted helper recovery.

## Exact remaining residue

All 70 differing byte offsets are: +0x4, +0x6, +0x8, +0xb, +0x12, +0x24, +0x2a, +0x30, +0x3a, +0x6f, +0x75, +0x7b, +0xc2, +0xc8, +0xcc, +0xd6, +0xdb, +0xdd, +0xe7, +0xf7, +0xff, +0x129, +0x12e, +0x138, +0x179, +0x17f, +0x185, +0x190, +0x19f, +0x1a5, +0x1a9, +0x1b3, +0x1b9, +0x207, +0x20a, +0x219, +0x21c, +0x21e, +0x225, +0x227, +0x231, +0x259, +0x25b, +0x25e, +0x261, +0x265, +0x269, +0x26d, +0x273, +0x276, +0x278, +0x27b, +0x27d, +0x286, +0x289, +0x28b, +0x292, +0x294, +0x2a0, +0x2a7, +0x2a9, +0x2c9, +0x2de, +0x2ed, +0x2f1, +0x327, +0x32d, +0x32f, +0x337, +0x339.

Forty-eight bytes are exactly explained by the ESI/EDI exchange, including saves, restores and accesses through those registers. Twenty-two bytes also require scratch-register changes. The bank and retail have identical instruction starts, sizes and mnemonics after correctly aligning relocation operands. The normalized shape score alone was insufficient to distinguish the two groups. The machine-readable comparison is build/a9000-finish/bank-differences.json and build/a9000-finish/difference-groups.json; the unedited full probe is build/a9000-finish/bank-probe-raw.log.

| Instruction offset | Retail | Bank |
|---|---|---|
| 0x19e | `mov eax, dword ptr [edi + 0xac]` | `mov ecx, dword ptr [esi + 0xac]` |
| 0x1a4 | `mov ecx, dword ptr [esp + 0x14]` | `mov edx, dword ptr [esp + 0x14]` |
| 0x1a8 | `mov dword ptr [ecx + 0x3a0], eax` | `mov dword ptr [edx + 0x3a0], ecx` |
| 0x206 | `lea edx, [esp + 0x3c]` | `lea eax, [esp + 0x3c]` |
| 0x20a | `push edx` | `push eax` |
| 0x218 | `lea eax, [esp + 0x2c]` | `lea ecx, [esp + 0x2c]` |
| 0x21c | `push eax` | `push ecx` |
| 0x258 | `mov ecx, dword ptr [ebx]` | `mov edx, dword ptr [ebx]` |
| 0x25a | `mov edx, dword ptr [ebx + 4]` | `mov eax, dword ptr [ebx + 4]` |
| 0x25d | `mov eax, dword ptr [ebx + 8]` | `mov ecx, dword ptr [ebx + 8]` |
| 0x260 | `mov dword ptr [esp + 0x28], ecx` | `mov dword ptr [esp + 0x28], edx` |
| 0x264 | `mov ecx, dword ptr [esp + 0x18]` | `mov edx, dword ptr [esp + 0x18]` |
| 0x268 | `mov dword ptr [esp + 0x2c], edx` | `mov dword ptr [esp + 0x2c], eax` |
| 0x26c | `mov edx, dword ptr [ecx + 0x1ec]` | `mov eax, dword ptr [edx + 0x1ec]` |
| 0x272 | `mov dword ptr [esp + 0x30], eax` | `mov dword ptr [esp + 0x30], ecx` |
| 0x276 | `push edx` | `push eax` |
| 0x277 | `lea eax, [esp + 0x2c]` | `lea ecx, [esp + 0x2c]` |
| 0x27b | `push eax` | `push ecx` |
| 0x285 | `lea ecx, [esp + 0x2c]` | `lea edx, [esp + 0x2c]` |
| 0x289 | `push ecx` | `push edx` |
| 0x2ec | `mov edx, dword ptr [esp + 0x14]` | `mov eax, dword ptr [esp + 0x14]` |
| 0x2f0 | `mov eax, dword ptr [edx + 0x204]` | `mov eax, dword ptr [eax + 0x204]` |

The first scratch change is at +0x19E: the target-ID fallback store rotates EAX/ECX/EDX. The same rotation reaches contact-point argument addresses and the ranged coordinate copy. The final AI-pointer lookup uses a separate EDX-to-EAX choice. Neither constants nor memory offsets explain these differences.

## New experiments and limits

Both real Overridable resolver overloads matter. EA's const overload calls through its mutable next pointer and selects the mutable overload; the mutable overload then recurses. Providing only the const overload emitted a one-level walk and 819 bytes. Providing both actual definitions emitted the correct two-level walk, selected EDI for the receiver and emitted 835 bytes. It retained one extra two-byte join jump at +0x170. The second resolver use matched its retail join form. The raw source and output are build/a9000-finish/native-both-override-overloads.cpp and build/a9000-finish/native-both-override-overloads.log. This is a useful distinction from earlier declaration-only const-overload trials, but it is farther from retail by bytes than the bank.

Tests of separate getter layers, result merges, references, enum consumers, scalar-result temporaries, actual module accessors, complete Object/Thing declarations, native Coord3D with visible copy operations, canonical string access, complete helper visibility and statement lifetimes did not improve the 70-byte bank. Some changed the allocation to EDI while introducing extra joins or different coordinate loads. The confirmed protected bool target declaration also left the 70 bytes unchanged. Prior local-order, register-alias, calling-adapter, flag-sweep and argument-rotation experiments were reviewed rather than rerun as unchanged experiments. No assembly, numeric image literal, invented pin, shared-header change or baseline change was introduced.

Every trial below retains its exact source, SHA-256, stated hypothesis, refutation condition and unedited probe output in build/a9000-finish/<trial>.cpp, <trial>.json and <trial>.log. The index is build/a9000-finish/trial-index.json. The preferred body is still targets/game/reverse/attempts/0x002a9000.cpp. Reopening requires a distinct source hypothesis for the native first-result join or an independently verified compiler-visible helper; repeating the listed local or accessor choices is not new evidence. This run does not prove that all possible C++ forms are exhausted or that assembly is necessary.

| Trial | Raw measurement |
|---|---|
| barrier-coordinate-lifetime | size     ours=833 retail=833  relocs=22; diffs    73 non-reloc byte(s); first at +4 |
| barrier-power-consumer | size     ours=833 retail=833  relocs=22; diffs    70 non-reloc byte(s); first at +4 |
| base-init-delta-assignment | size     ours=833 retail=833  relocs=22; diffs    142 non-reloc byte(s); first at +35 |
| base-init-position-assignment | size     ours=833 retail=833  relocs=22; diffs    142 non-reloc byte(s); first at +35 |
| base-init-target-assignment | size     ours=833 retail=833  relocs=22; diffs    142 non-reloc byte(s); first at +35 |
| both-overloads-both-result-merges | size     ours=833 retail=833  relocs=22; diffs    83 non-reloc byte(s); first at +4 |
| both-overloads-const-result-merge | size     ours=839 retail=833  relocs=22; diffs    435 non-reloc byte(s); first at +4 |
| both-overloads-direct-first-resolver | size     ours=835 retail=833  relocs=22; diffs    395 non-reloc byte(s); first at +263 |
| both-overloads-direct-template-use | size     ours=800 retail=833  relocs=21; diffs    650 non-reloc byte(s); first at +4 |
| both-overloads-enum-payload | size     ours=835 retail=833  relocs=22; diffs    395 non-reloc byte(s); first at +263 |
| both-overloads-full-overridable-layout | size     ours=835 retail=833  relocs=22; diffs    395 non-reloc byte(s); first at +263 |
| both-overloads-late-template-assignment | size     ours=800 retail=833  relocs=21; diffs    650 non-reloc byte(s); first at +4 |
| both-overloads-mutable-pointer-local | size     ours=835 retail=833  relocs=22; diffs    395 non-reloc byte(s); first at +263 |
| both-overloads-mutable-result-merge | size     ours=837 retail=833  relocs=22; diffs    396 non-reloc byte(s); first at +263 |
| both-overloads-template-reference | size     ours=835 retail=833  relocs=22; diffs    395 non-reloc byte(s); first at +263 |
| branch-local-coordinate-copy | size     ours=852 retail=833  relocs=22; diffs    695 non-reloc byte(s); first at +4 |
| canonical-bool-return | size     ours=833 retail=833  relocs=22; diffs    70 non-reloc byte(s); first at +4 |
| canonical-thing-base | size     ours=833 retail=833  relocs=22; diffs    70 non-reloc byte(s); first at +4 |
| confirmed-native-module-accessors | size     ours=833 retail=833  relocs=22; diffs    70 non-reloc byte(s); first at +4 |
| confirmed-protected-bool | size     ours=833 retail=833  relocs=22; diffs    70 non-reloc byte(s); first at +4 |
| confirmed-protected-native-overloads | size     ours=835 retail=833  relocs=22; diffs    395 non-reloc byte(s); first at +263 |
| coordinate-distance-temporary | size     ours=833 retail=833  relocs=22; diffs    70 non-reloc byte(s); first at +4 |
| flag-before-coordinate-copy | size     ours=833 retail=833  relocs=22; diffs    70 non-reloc byte(s); first at +4 |
| forceinline-native-recursion | size     ours=819 retail=833  relocs=22; diffs    427 non-reloc byte(s); first at +4 |
| full-native-both-override-overloads | size     ours=835 retail=833  relocs=22; diffs    395 non-reloc byte(s); first at +263 |
| full-native-object-coordinates | size     ours=833 retail=833  relocs=22; diffs    70 non-reloc byte(s); first at +4 |
| full-native-object-lookup-override | size     ours=819 retail=833  relocs=22; diffs    427 non-reloc byte(s); first at +4 |
| full-native-object-lookup | size     ours=833 retail=833  relocs=22; diffs    70 non-reloc byte(s); first at +4 |
| getfo-base-const-local | size     ours=833 retail=833  relocs=22; diffs    70 non-reloc byte(s); first at +4 |
| getfo-base-result | size     ours=837 retail=833  relocs=22; diffs    417 non-reloc byte(s); first at +4 |
| getfo-conditional-result | size     ours=841 retail=833  relocs=22; diffs    407 non-reloc byte(s); first at +263 |
| getfo-consumer-temporary | size     ours=837 retail=833  relocs=22; diffs    396 non-reloc byte(s); first at +263 |
| getfo-enum-consumer | size     ours=837 retail=833  relocs=22; diffs    396 non-reloc byte(s); first at +263 |
| getfo-explicit-join | size     ours=833 retail=833  relocs=22; diffs    70 non-reloc byte(s); first at +4 |
| getfo-materialize-first-power-type | size     ours=837 retail=833  relocs=22; diffs    396 non-reloc byte(s); first at +263 |
| getfo-materialize-last-power-type | size     ours=837 retail=833  relocs=22; diffs    396 non-reloc byte(s); first at +263 |
| getfo-mutable-result | size     ours=837 retail=833  relocs=22; diffs    396 non-reloc byte(s); first at +263 |
| getfo-native-coordinates-visible | size     ours=808 retail=833  relocs=21; diffs    676 non-reloc byte(s); first at +2 |
| getfo-nested-result | size     ours=798 retail=833  relocs=21; diffs    659 non-reloc byte(s); first at +4 |
| getfo-null-first | size     ours=837 retail=833  relocs=22; diffs    404 non-reloc byte(s); first at +263 |
| getfo-pointer-reference | size     ours=839 retail=833  relocs=22; diffs    435 non-reloc byte(s); first at +4 |
| getfo-reference-result | size     ours=837 retail=833  relocs=22; diffs    396 non-reloc byte(s); first at +263 |
| getfo-result-local | size     ours=833 retail=833  relocs=22; diffs    70 non-reloc byte(s); first at +4 |
| getfo-typed-result-local | size     ours=833 retail=833  relocs=22; diffs    70 non-reloc byte(s); first at +4 |
| getfo-visible-command-wrappers | size     ours=837 retail=833  relocs=22; diffs    396 non-reloc byte(s); first at +263 |
| getfo-visible-coordinate-helper | size     ours=837 retail=833  relocs=22; diffs    396 non-reloc byte(s); first at +263 |
| getfo-visible-override-loop | size     ours=837 retail=833  relocs=22; diffs    396 non-reloc byte(s); first at +263 |
| getfo-with-visible-kindof | size     ours=837 retail=833  relocs=22; diffs    396 non-reloc byte(s); first at +263 |
| getfo-with-visible-scale | size     ours=837 retail=833  relocs=22; diffs    396 non-reloc byte(s); first at +263 |
| materialize-contact-result | size     ours=833 retail=833  relocs=22; diffs    70 non-reloc byte(s); first at +4 |
| materialize-first-power-type | size     ours=833 retail=833  relocs=22; diffs    70 non-reloc byte(s); first at +4 |
| materialize-kindof-result | size     ours=833 retail=833  relocs=22; diffs    70 non-reloc byte(s); first at +4 |
| materialize-last-power-type | size     ours=833 retail=833  relocs=22; diffs    70 non-reloc byte(s); first at +4 |
| native-both-overloads-const-local | size     ours=835 retail=833  relocs=22; diffs    395 non-reloc byte(s); first at +263 |
| native-both-override-overloads | size     ours=835 retail=833  relocs=22; diffs    395 non-reloc byte(s); first at +263 |
| native-const-explicit-else | size     ours=837 retail=833  relocs=22; diffs    396 non-reloc byte(s); first at +263 |
| native-const-next-local | size     ours=835 retail=833  relocs=22; diffs    395 non-reloc byte(s); first at +263 |
| native-const-null-first | size     ours=835 retail=833  relocs=22; diffs    403 non-reloc byte(s); first at +263 |
| native-const-ternary | size     ours=837 retail=833  relocs=22; diffs    396 non-reloc byte(s); first at +263 |
| native-contact-string-visible-empty | size     ours=833 retail=833  relocs=22; diffs    70 non-reloc byte(s); first at +4 |
| native-contact-string | size     ours=837 retail=833  relocs=23; diffs    452 non-reloc byte(s); first at +2 |
| native-coordinates-base-assignment | size     ours=804 retail=833  relocs=21; diffs    679 non-reloc byte(s); first at +2 |
| native-coordinates-base-initializer | size     ours=839 retail=833  relocs=22; diffs    701 non-reloc byte(s); first at +4 |
| native-coordinates-raw-base-init | size     ours=833 retail=833  relocs=22; diffs    142 non-reloc byte(s); first at +35 |
| native-coordinates-raw-base | size     ours=833 retail=833  relocs=22; diffs    70 non-reloc byte(s); first at +4 |
| native-coordinates-visible | size     ours=804 retail=833  relocs=21; diffs    679 non-reloc byte(s); first at +2 |
| native-forceinline-getter-layers | size     ours=819 retail=833  relocs=22; diffs    427 non-reloc byte(s); first at +4 |
| native-getfo-layer | size     ours=837 retail=833  relocs=22; diffs    396 non-reloc byte(s); first at +263 |
| native-module-accessor-layers | size     ours=833 retail=833  relocs=22; diffs    70 non-reloc byte(s); first at +4 |
| native-override-wrapper | size     ours=857 retail=833  relocs=24; diffs    437 non-reloc byte(s); first at +263 |
| native-power-recursion | size     ours=819 retail=833  relocs=22; diffs    427 non-reloc byte(s); first at +4 |
| native-recursion-depth-three | size     ours=819 retail=833  relocs=22; diffs    427 non-reloc byte(s); first at +4 |
| override-copy-lifetime | size     ours=833 retail=833  relocs=22; diffs    70 non-reloc byte(s); first at +4 |
| power-field-return-branches | size     ours=843 retail=833  relocs=22; diffs    389 non-reloc byte(s); first at +263 |
| power-nested-ternary | size     ours=837 retail=833  relocs=22; diffs    396 non-reloc byte(s); first at +263 |
| power-raw-pointer-join | size     ours=841 retail=833  relocs=22; diffs    407 non-reloc byte(s); first at +263 |
| power-reference-lifetime | size     ours=798 retail=833  relocs=21; diffs    655 non-reloc byte(s); first at +4 |
| power-ternary-walk | size     ours=837 retail=833  relocs=22; diffs    418 non-reloc byte(s); first at +263 |
| scalar-construct-delta-target | size     ours=829 retail=833  relocs=22; diffs    673 non-reloc byte(s); first at +31 |
| scalar-construct-delta | size     ours=829 retail=833  relocs=22; diffs    673 non-reloc byte(s); first at +31 |
| scalar-construct-position-delta-target | size     ours=833 retail=833  relocs=22; diffs    70 non-reloc byte(s); first at +4 |
| scalar-construct-position-delta | size     ours=833 retail=833  relocs=22; diffs    70 non-reloc byte(s); first at +4 |
| scalar-construct-position-target | size     ours=837 retail=833  relocs=22; diffs    622 non-reloc byte(s); first at +31 |
| scalar-construct-position | size     ours=837 retail=833  relocs=22; diffs    622 non-reloc byte(s); first at +31 |
| scalar-construct-target | size     ours=833 retail=833  relocs=22; diffs    142 non-reloc byte(s); first at +35 |
| visible-command-wrappers | size     ours=833 retail=833  relocs=22; diffs    70 non-reloc byte(s); first at +4 |
| visible-contact-helper | size     ours=833 retail=833  relocs=22; diffs    70 non-reloc byte(s); first at +4 |
| visible-coordinate-helper | size     ours=833 retail=833  relocs=22; diffs    70 non-reloc byte(s); first at +4 |
| visible-kindof-helper | size     ours=833 retail=833  relocs=22; diffs    70 non-reloc byte(s); first at +4 |
| visible-scale-helper | size     ours=833 retail=833  relocs=22; diffs    70 non-reloc byte(s); first at +4 |

## Gate result

The normal verifier was called with a temporary in-memory row for the bank and the existing symbol map. It failed byte comparison and reported the unpinned `?method@Rva002A5FB0@@QAEEPAUCoord3D@@M@Z` call. No ledger row or pin was added. Raw output is build/a9000-finish/candidate-byte-gate.log. The initial CSV check and global pin-consistency check passed; raw output is build/a9000-finish/check-csv-initial.log and build/a9000-finish/pin-consistency.log. This evidence note and one measured attempt row are the only intended tracked changes; no full gate is required for a source conversion because no conversion is being landed.
