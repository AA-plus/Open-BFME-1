# CloudTextureShader::set remaining instructions

## Result and reopening condition

The improved body is banked in `targets/game/reverse/attempts/0x007c34e0.cpp`. This run tests revision `88c40fcc06f9823feb8b60f2abe446a0b2836439` with model `gpt-6.1-sol`. No exact recovery, ledger change or pin change is claimed. All trial sources, compiler object receipts, complete disassembly and unedited probe outputs remain in build/cloud-set-finish/.

The starting bank independently emits 2118 bytes against the complete 2117-byte extent, with 273 non-relocation byte differences, 1 extra byte and 28 displaced relocation sites. The initial direct probe and the receipt-producing probe reproduce this result. Raw output is build/cloud-set-finish/probe-baseline.txt. Every differing raw offset, the source hash and the compiled object hash are in build/cloud-set-finish/baseline-metrics.json.

The retained improvement emits 2117 bytes with 14 differing non-relocation bytes, no extent difference and two displaced relocation sites. Its independently recompiled final snapshot and receipt are build/cloud-set-finish/preserved-near.cpp, build/cloud-set-finish/probe-preserved-near.txt and build/cloud-set-finish/preserved-near-metrics.json. The measured ranking score is 0.9934. Reopening requires a source or compiler observation that changes the two remaining initializations at retail +0x5E3 and +0x767 while retaining the matched prefix, final binding and cleanup paths. This run does not establish that assembly is necessary or that all possible C++ forms are exhausted.

## Located residue

build/cloud-set-finish/align.py aligns the complete decoded instruction streams by instruction ordinal and maps relocation operands at the aligned instructions. build/cloud-set-finish/aligned-differences.json retains its result. There are nine differing aligned instructions. The first three are branch displacements at +0x66A, +0x67D and +0x68A; their encoded bytes differ at +0x66B, +0x67F and +0x68B because their destination crosses the longer initialization.

At +0x6A3, retail loads the string buffer from [esp + 0x10] into EDX, loads the null character into AL at +0x6A7, and writes AL through EDX at +0x6AC. The bank loads the character into DL at +0x6A3, loads the buffer into EAX at +0x6A9, and writes DL through EAX at +0x6AD. The AL absolute load has a five-byte encoding; the DL absolute load has a six-byte encoding. This explains the one-byte extent difference and the suffix displacement.

At +0x767, retail loads the buffer into ECX, loads the character into DL at +0x76B and writes DL through ECX at +0x771. The bank loads the character into CL at +0x768, loads the buffer into EDX at +0x76E and writes CL through EDX at +0x772. Both versions of this second sequence occupy twelve bytes. Every other aligned instruction agrees outside its relocation operands. Consequently, the raw suffix differences are not independent missing operations or a different loop, field offset or constant.

These paragraphs describe the old bank. The retained candidate fixes +0x6A3 and the extent difference. build/cloud-set-finish/preserved-near-aligned-differences.json locates its six remaining differing instructions: +0x5E3, +0x5E7, +0x5ED, +0x767, +0x76B and +0x771. At both sites retail loads the pointer into ECX, then the character into DL, then stores DL through ECX. Ours loads the character into CL, then the pointer into EDX, then stores CL through EDX. The first site is ALPHAARG1 and the second is ALPHAOP. Each sequence still occupies twelve bytes, so there is no trailing displacement drift. The raw differing offsets are +0x5E3, +0x5E4, +0x5E9, +0x5EA, +0x5EB, +0x5EC, +0x5EE, +0x767, +0x768, +0x76D, +0x76E, +0x76F, +0x770 and +0x772. Every other aligned instruction agrees outside relocation operands.

## Hypotheses and trials

The retry hypothesis was that surrounding temporary lifetimes, helper visibility or compiler settings explain the two late load sequences. Its evidence is the complete target decode, the native StringClass declaration and the decoded helpers; its refutation test is the actual probe of each distinct structural change. Earlier verdicts already report native constructor inheritance, donor late construction, Get_String visibility, state-setter boundaries, pointer order, full owner layouts and seven exception choices. Those existing recipes were not repeated.

The new tests expose the actual counted getter, texture accessor, value-name helper, string cleanup and texture release as inline noinline definitions; replace the handle expression temporary with a scoped reference or a named value; replace the snapshot local with an expression temporary or a native StringClass member; vary sibling and nested block scopes; test equivalent state-control forms including explicit exits; vary the disabled snapshot macro; compare byte-copy primitives; and compare processor, optimization and aliasing settings. The independently compiled getter, accessor, Free_String and Release_Ref reproduce their complete 35-byte, 37-byte, 117-byte and 36-byte bodies outside relocations. The visible value helper reproduces the first 264 code bytes and carries 52 following bytes for its tables and alignment in the COFF section; these following bytes are not claimed as extra function code. None of these initial tests improves the old bank.

A targeted ordered-read wrapper applies pointer and character reads only to the final two snapshot constructors, rather than changing all nine constructions. It changes the first load order but retains the wrong registers and changes the subsequent cached-state comparison. The raw result is build/cloud-set-finish/probe-targeted-ordered-both.txt. A bounded four-trial search combines this wrapper with scoped handle storage and a nested state block; its sources and manifest are under build/shape_search/b40f7247d1464cb4b4188bcdd1fabf8c/, with the raw result in build/cloud-set-finish/shape-search-structural.txt. The selected combinations worsen the measured bank.

The register/copy family generator finds no applicable source-level transformation in this bank; its raw refusal is build/cloud-set-finish/choices-family.stderr. The EH generator is retained in build/cloud-set-finish/choices-eh.json but its already recorded choices are not rerun. The direct inline-argument experiment and the ordered-read experiment restricted to ALPHAOP leave the bank unchanged; no further isolated register spelling is tested.

The noise-helper visibility trial is unavailable: the actual matched donor includes inline assembly and additional declarations absent from the standalone bank. Its raw compile failure is build/cloud-set-finish/probe-visible-noise-helper.txt. It is retained as a rejected, non-compiling source, not as a measured caller result. No approximation replaces that donor to manufacture register-preservation information.

The constant-template setter changes the load schedule when used for every state. This observation justifies a finite boundary experiment rather than another isolated register spelling. All 256 choices between the macro and this inline constant-template helper are compiled. The manifest is build/cloud-set-finish/boundary-search-result.json; original search sources are under build/shape_search/d168824b60434b61be07222e90186bca/. Every combination has a source, object receipt and complete unedited probe named boundary-NNN under build/cloud-set-finish/. Its measured search duration is 114.03 seconds. Trial 004, which substitutes the helper only for ALPHAARG1, is the first best result: 2117 bytes with 14 differences. It removes the former ALPHAARG2 length difference while leaving a load-order difference inside ALPHAARG1. No combination reaches exact equality.

The new residue supports a fresh lifetime check in that improved context. Applying the donor late constructor to ALPHAARG1, ALPHAOP or both; making the snapshot wrapper own a StringClass member; and using expression temporaries at either or both sites each retain the same 14-byte mismatch. The old bank is therefore replaced only by the measured boundary-004 body. EA's original setup and noise-update comments are carried to their corresponding statements. The new helper is static and forceinline. Its fully expanded specialization name is independently read from a noinline metadata probe, and its absent-from-retail marker is retained above the definition. No second strong definition of an existing helper is introduced.

| Trial source | Emitted bytes | Non-relocation differences | Extent difference | Displaced relocations | Raw probe |
| --- | ---: | ---: | ---: | ---: | --- |
| baseline.cpp | 2118 | 273 | 1 | 28 | build/cloud-set-finish/probe-baseline.txt |
| flag-G7.cpp | 1891 | 1241 | 226 | 133 | build/cloud-set-finish/probe-flag-G7.txt |
| flag-G6.cpp | 2118 | 273 | 1 | 28 | build/cloud-set-finish/probe-flag-G6.txt |
| init-argument-order.cpp | 2118 | 273 | 1 | 28 | build/cloud-set-finish/probe-init-argument-order.txt |
| bind-named-scope.cpp | 2120 | 283 | 3 | 28 | build/cloud-set-finish/probe-bind-named-scope.txt |
| bind-receiver-order.cpp | 2103 | 1376 | 14 | 164 | build/cloud-set-finish/probe-bind-receiver-order.txt |
| flag-Os.cpp | 1504 | 1016 | 613 | 114 | build/cloud-set-finish/probe-flag-Os.txt |
| flag-Ogminus.cpp | 3196 | 1602 | 1079 | 176 | build/cloud-set-finish/probe-flag-Ogminus.txt |
| flag-Ob1.cpp | 2118 | 273 | 1 | 28 | build/cloud-set-finish/probe-flag-Ob1.txt |
| visible-getter.cpp | 2118 | 273 | 1 | 28 | build/cloud-set-finish/probe-visible-getter.txt |
| visible-accessor.cpp | 2118 | 273 | 1 | 28 | build/cloud-set-finish/probe-visible-accessor.txt |
| visible-getter-accessor.cpp | 2118 | 273 | 1 | 28 | build/cloud-set-finish/probe-visible-getter-accessor.txt |
| late-state-scope.cpp | 2118 | 273 | 1 | 28 | build/cloud-set-finish/probe-late-state-scope.txt |
| targeted-ordered-both.cpp | 2113 | 278 | 4 | 27 | build/cloud-set-finish/probe-targeted-ordered-both.txt |
| targeted-ordered-arg2.cpp | 2113 | 278 | 4 | 27 | build/cloud-set-finish/probe-targeted-ordered-arg2.txt |
| targeted-ordered-op.cpp | 2118 | 273 | 1 | 28 | build/cloud-set-finish/probe-targeted-ordered-op.txt |
| state-early-break.cpp | 2118 | 273 | 1 | 28 | build/cloud-set-finish/probe-state-early-break.txt |
| state-negated-tests.cpp | 2118 | 273 | 1 | 28 | build/cloud-set-finish/probe-state-negated-tests.txt |
| state-sibling-scopes.cpp | 2118 | 273 | 1 | 28 | build/cloud-set-finish/probe-state-sibling-scopes.txt |
| visible-value-helper.cpp | 2118 | 273 | 1 | 28 | build/cloud-set-finish/probe-visible-value-helper.txt |
| combination-1.cpp | 2113 | 278 | 4 | 27 | build/cloud-set-finish/probe-combination-1.txt |
| combination-2.cpp | 2115 | 279 | 2 | 27 | build/cloud-set-finish/probe-combination-2.txt |
| combination-3.cpp | 2115 | 279 | 2 | 27 | build/cloud-set-finish/probe-combination-3.txt |
| state-expression-temporary-both.cpp | 2118 | 273 | 1 | 28 | build/cloud-set-finish/probe-state-expression-temporary-both.txt |
| state-expression-temporary-all.cpp | 2118 | 273 | 1 | 28 | build/cloud-set-finish/probe-state-expression-temporary-all.txt |
| flag-G5.cpp | 2118 | 273 | 1 | 28 | build/cloud-set-finish/probe-flag-G5.txt |
| string-member-owner.cpp | 2118 | 273 | 1 | 28 | build/cloud-set-finish/probe-string-member-owner.txt |
| snapshot-empty-macro.cpp | 2118 | 273 | 1 | 28 | build/cloud-set-finish/probe-snapshot-empty-macro.txt |
| snapshot-noop-macro.cpp | 2118 | 273 | 1 | 28 | build/cloud-set-finish/probe-snapshot-noop-macro.txt |
| visible-free-helper.cpp | 2118 | 273 | 1 | 28 | build/cloud-set-finish/probe-visible-free-helper.txt |
| visible-release-helper.cpp | 2118 | 273 | 1 | 28 | build/cloud-set-finish/probe-visible-release-helper.txt |
| visible-free-release.cpp | 2118 | 273 | 1 | 28 | build/cloud-set-finish/probe-visible-free-release.txt |
| byte-memmove.cpp | 2130 | 1407 | 13 | 151 | build/cloud-set-finish/probe-byte-memmove.txt |
| byte-reference-copy.cpp | 2118 | 273 | 1 | 28 | build/cloud-set-finish/probe-byte-reference-copy.txt |
| flag-Oa.cpp | 2118 | 385 | 1 | 33 | build/cloud-set-finish/probe-flag-Oa.txt |
| flag-Ow.cpp | 2118 | 385 | 1 | 33 | build/cloud-set-finish/probe-flag-Ow.txt |
| state-explicit-exits.cpp | 2118 | 273 | 1 | 28 | build/cloud-set-finish/probe-state-explicit-exits.txt |
| state-explicit-exits-last.cpp | 2118 | 273 | 1 | 28 | build/cloud-set-finish/probe-state-explicit-exits-last.txt |
| state-constant-template-last.cpp | 2118 | 273 | 1 | 28 | build/cloud-set-finish/probe-state-constant-template-last.txt |
| state-constant-template-all.cpp | 2119 | 535 | 2 | 58 | build/cloud-set-finish/probe-state-constant-template-all.txt |
| preferred-near.cpp | 2117 | 14 | 0 | 2 | build/cloud-set-finish/probe-preferred-near.txt |
| near-late-arg1.cpp | 2117 | 14 | 0 | 2 | build/cloud-set-finish/probe-near-late-arg1.txt |
| near-late-op.cpp | 2117 | 14 | 0 | 2 | build/cloud-set-finish/probe-near-late-op.txt |
| near-late-both.cpp | 2117 | 14 | 0 | 2 | build/cloud-set-finish/probe-near-late-both.txt |
| near-member-owner.cpp | 2117 | 14 | 0 | 2 | build/cloud-set-finish/probe-near-member-owner.txt |
| near-temporary-arg1.cpp | 2117 | 14 | 0 | 2 | build/cloud-set-finish/probe-near-temporary-arg1.txt |
| near-temporary-op.cpp | 2117 | 14 | 0 | 2 | build/cloud-set-finish/probe-near-temporary-op.txt |
| near-temporary-both.cpp | 2117 | 14 | 0 | 2 | build/cloud-set-finish/probe-near-temporary-both.txt |
| preserved-near.cpp | 2117 | 14 | 0 | 2 | build/cloud-set-finish/probe-preserved-near.txt |

## Boundary, identity and ABI

build/cloud-set-finish/retail-complete.txt retains complete target and helper decodes. The corrected helper extents are checked in build/cloud-set-finish/checked-helpers.txt; the target inventory is build/cloud-set-finish/checked-target.txt. Preliminary guessed extents for the handle destructor, constructor and registration were rejected by the decoder and replaced with the decoded complete extents. The target ends at RVA 0x007C3D25 with its sole ret 4, followed by 32 INT3 bytes. Every direct conditional branch and jump stays inside the target at an instruction boundary. There is no outgoing target tail jump.

build/cloud-set-finish/audit-and-byte-gate.txt checks the installed vtable at VA 0x01128764. Its four slots resolve through their actual five-byte ILT routes to RVAs 0x007C34E0, 0x007C3420, 0x007C3400 and 0x007C33F0. The constructor at 0x007C34D0 installs that table. The instance at VA 0x012BBF48 contains it, and the complete registration stores the instance in shader entry eleven. The Zero Hour W3DShaderManager.h enumeration names entry eleven ST_CLOUD_TEXTURE, and the donor cloud projection body agrees with the decoded matrix and state operations. This supports the existing CloudTextureShader identity independently of byte comparison.

The complete 61-byte caller at RVA 0x00716980 loads the indexed receiver into ECX, pushes the 32-bit pass and calls slot zero. The target stores the pass at receiver offset eight, returns a 32-bit one and removes four stack bytes. It has no receiver adjustment or hidden result storage. The noise call routes through ILT 0x00019BFF to the complete 425-byte helper, with destination matrix, inverse matrix and a stack-word false; the helper ends with ret 12. Its field reads and writes agree with the existing offsets eight, twelve, sixteen, twenty and twenty-four.

The complete counted getter at 0x007C34A0 takes hidden output storage followed by a 32-bit index, writes one pointer into that storage, increments the low 16-bit count at pointee offset four when nonnull and returns the storage address in EAX. The caller removes eight bytes. The complete owning destructor at 0x0005CC00 is twelve bytes, guards that pointer and tail-jumps to the complete 36-byte release body at 0x009EB7A0. That body decrements the low word, checks the remaining count and flag 0x01000000 and dispatches through slot +0x20. No container payload is inferred from allocation size; this target has no STL container.

The complete texture accessor at 0x0090DC60 dereferences handle storage, returns zero for null, calls pointee slots +0x28 and +0x2C without stack arguments, tests AL from the first call and reads the device pointer through pointee offset +0x14 and nested offset eight. The canonical TextureBaseClass declaration names this accessor but does not describe the handle-storage layout; the retained caller explicitly uses that canonical entry with the decoded storage receiver. This preexisting owner mismatch remains documented, and no shared owner correction or new identity is claimed.

The complete string allocator at 0x009DB890 reads the bool as a byte in a stack word, accepts the 32-bit length, writes the receiver pointer and allocation headers and returns with ret 8 on every path. Free_String at 0x009DB7A0 handles its temporary-buffer and heap paths and returns without stack arguments. The complete value-name helper at 0x00906FE0 takes three cdecl slots, has six verified internal jump-table destinations and sends its outgoing tail jumps to the complete 151-byte varargs Format body at 0x009DBB90. The table bytes and selectors are checked in the audit. The 81-byte character assignment helper and 116-byte Uninitialised_Grow additionally confirm the string pointer, length header and byte payload; their complete decodes are in build/cloud-set-finish/additional-retail.txt. The public-access Get_String and Free_String spellings in the bank have existing pins to these independently decoded bodies.

The target separately establishes device-call argument order and widths at slots +0xB4, +0xB0, +0x10C, +0x114 and +0x104: transform, state, sampler and binding arguments occupy the observed 32-bit stack slots and follow stdcall cleanup. Their return values are unused. The external device implementations are unavailable for complete callee decoding, so their internal behavior is not claimed.

## Cleanup and checks

build/cloud-set-finish/eh-retail.txt retains all nine unwind states. build/cloud-set-finish/audit.py reads the compiled FuncInfo through the actual COFF relocation entries, checks each predecessor against retail, checks each immediate cleanup action and follows the destructor relocation at that action. States zero through seven have predecessor minus one and receiver EBP minus 0x9C; state eight has predecessor minus one and receiver EBP minus 0x94. The first eight destroy through the existing Free_String spelling. The last has the complete null guard and release jump. build/cloud-set-finish/audit-and-byte-gate.txt retains the old-bank audit. build/cloud-set-finish/audit-preserved-byte-gate.txt audits the retained improvement and passes these cleanup and identity checks, then reports the scoped byte gate failure with zero unresolved calls.

build/cloud-set-finish/check-csv-final.txt and build/cloud-set-finish/pin-consistency-final.txt pass. build/cloud-set-finish/class-bank.txt passes. build/cloud-set-finish/declared-bank.txt refuses the bank because CloudTextureShader::set has no authored matched row; no new source is proposed for landing. No header or landed source changes, so no full gate is required. The old bank is archived by the repository banking tool, and the closer measured body becomes the preferred bank. The verdict is the only new row for this address in this run.

The remaining blocker is the two observed snapshot load sequences at +0x5E3 and +0x767. It is not an unresolved boundary, a missing pin or a newly discovered ABI ambiguity. The retained negative results refute the tested structural recipes, not every possible future compiler experiment.

The exact bank after the banking tool's metadata update is independently recompiled in build/cloud-set-finish/final-bank.cpp. Its source hash equals the archived bank hash, and build/cloud-set-finish/probe-final-bank.txt reproduces the 2117-byte, 14-difference result. build/cloud-set-finish/audit-final-bank-byte-gate.txt passes the boundary, identity and nine-state cleanup assertions and fails the scoped byte comparison with zero unresolved calls. The final CSV, pin-consistency and class checks are rerun after banking and pass. No background process remains from the decoder or either bounded search.

The name getters' ledger extents include inline tables. Their complete code extents are 183 bytes at 0x00902A00, 83 bytes at 0x00902B20 and 67 bytes at 0x00902C50. The remaining ledger bytes are alignment and table payloads, rather than executable instructions. The code-only inventories are in build/cloud-set-finish/checked-additional.txt; build/cloud-set-finish/name-tables.txt retains the code and table-byte distinction. No ledger extent is changed.
