# GetProperty bank at 0x008CD2F0

The target remains unconverted. The preferred bank still emits 254 bytes with eight differing non-relocation bytes. The continuation tests branch structure, decoded type and storage views, complete authored helper visibility, aggregate lifetimes, static-handler scope, typed output homes and native array views. None improves the preferred bank. No game source, ledger row, pin or preferred bank changed.

## Tested inputs and boundary

The tested revision is 522952efd276837484023fc376360e17d82a60b0. The retail image SHA-256 is 1fbdc0ced8f283732c094c4f0804ce8dc1e3e3675b720bcab066c94fed964e75. The target's 254-byte SHA-256 is b0216b0eebefe246db9598a254894bc1acc16a8cdee95394a12e58d88e6d7307. Its complete decoded extent is [0x008CD2F0, 0x008CD3EE). It starts after INT3 padding, ends with RET at +0xFD, and is followed by INT3 padding. Every conditional branch stays inside the extent. The exits at +0xAA and +0xF7 are indirect virtual tail jumps through slot zero after restoring all saved registers.

Raw evidence is in build/getproperty-008cd2f0/decoded_bodies.log, checked_target.log and audit_corrected.log. Each command's timestamps, arguments and exit code are retained in the adjacent receipt JSON. All twelve earlier verdict rows and both immutable saved alternatives were reviewed. The current bank and the canonical-call alternative were inspected directly.

## Identity and calling convention

The bank and older verdicts cite opcode-table slot VA 0x00ED5AF0. That location does not identify this body in the current baseline. The complete 375-byte runner at RVA 0x008CCED0 calls through table VA 0x012D5A68 at +0xBB. Its opcode 0x22 slot at VA 0x012D5AF0 contains VA 0x00CCD2F0, which is this target's RVA plus the image base. The runner pushes the execution-context pointer, then its interpreter pointer, and removes eight stack bytes after the call. This independently establishes a two-argument cdecl handler. The target has no receiver adjustment or hidden return storage, and its return value is unused. The existing descriptive name rva8CD2F0GetProperty retains its address token.

Raw evidence is in build/getproperty-008cd2f0/decoded_runner_and_ctor.log, checked_runner.log and audit_corrected.log. The original failed address assumption remains visible in audit.log; the corrected audit preserves both table reads. No raw opcode caller hit was accepted as identity evidence.

The resolver at 0x008CCCE0 takes four four-byte stack arguments in first-context, second-context, value and output-pointer order. The caller removes sixteen bytes. Its complete 118-byte decode has returns at +0x6D and +0x75, with no outgoing direct branch. Its slot +0x24 virtual predicate receives the value in ECX with no stack argument and returns a byte tested through AL. The representative string/base vtables place the three-byte false-return helper at 0x00891870 in that slot.

The integer conversion at 0x00898300 receives the top value in ECX and returns a 32-bit integer in EAX. Its canonical ledger extent is 198 bytes: 136 bytes of code, a twenty-byte jump table and a forty-two-byte tag map. Every table destination is an instruction boundary inside those code bytes, and every tag-map selector is valid. Tags 1 and 42 share the string arm; tags 5, 6 and 7 reach byte, float and integer payload arms. The float arm tail-jumps to the existing CRT conversion route at 0x009F6E38. The bank's Rva8CCCE0Value::toInteger declaration is unpinned; the trials use the existing AptValue::toInteger declaration instead, as the earlier saved canonical alternative already does.

Raw evidence is in build/getproperty-008cd2f0/checked_resolver.log, checked_integer.log, integer_tables.log, checked_resolver_virtual.log and pin_integer.log. The integer and getter pins are consistent. The ILT oracle reports UNTESTABLE for these library-region addresses; it supplies no additional identity proof. No new decoration or pin was introduced.

## Key and value evidence

The complete 917-byte getter at 0x008CC940 consumes ECX as the interpreter receiver and returns a pointer in EAX. Every return removes twenty-four stack bytes. The target passes six four-byte arguments in resolved-target, context, key-address, one, one and zero order. The getter loads its third argument into EBX at +0x2C, dereferences the dword at [EBX], and tests the block's character at +8. It increments that block's sixteen-bit reference count at +0xB9, later re-reads [EBX], and copies that pointer into the created value's +8 field. This supports a four-byte string-slot view for the key; the bank's integer-array cast does not establish an integer payload.

The independent helper [0x008982F0, 0x008982FC) loads a four-byte index, computes VA 0x01338480 plus four times that index and returns. Both ends have INT3 padding. This is independent address-formation evidence for the same key table, although its original function identity remains unknown. No source donor from Zero Hour exists for this Apt family in the reference tree.

The string constructor at 0x008A9B00 installs vtable VA 0x011367C8. Its first two slots point directly at 0x008991B0 and 0x008991E0. Their complete forty-one-byte and 120-byte decodes establish ECX receivers, no stack arguments, and the twelve-bit reference count in the flags dword at +4. The release helper also has an indirect tail jump through slot +8. These representative slots support the target's addRef/release ABI, without assigning a proven original owner to every possible runtime value.

Raw evidence is in build/getproperty-008cd2f0/checked_getter.log, decoded_bodies.log, decoded_key_helper.log, checked_key_helper.log, decoded_runner_and_ctor.log, checked_string_ctor.log, vtable_string.log, integer_tables.log, decoded_refcount.log, checked_refcount_add.log and checked_refcount_release.log. The target is not a constructor and has no EH frame. This investigation does not claim a reconstructed getter cleanup or a complete native class layout.

## Remaining bytes and rejected hypotheses

| Offset | Retail | Bank | Decoded cause |
|---|---|---|---|
| +0x46 | 57 | 4F | Context load at +0x45 uses EDX in retail and ECX in the bank. |
| +0x4F | 0C | 04 | Key-address LEA at +0x4E uses ECX in retail and EAX in the bank. |
| +0x55 | 51 | 50 | Key argument pushes the corresponding different register. |
| +0x56 | 52 | 51 | Context argument pushes the corresponding different register. |
| +0x67 | 06 | 16 | Release-loop count load at +0x66 uses EAX in retail and EDX in the bank. |
| +0x69 | 4E | 46 | Array load at +0x68 uses ECX in retail and EAX in the bank. |
| +0x6C | C7 | D7 | Subtraction at +0x6B retains the different count register. |
| +0x6F | 81 | 90 | Indexed load at +0x6D retains the different base and index registers. |

The new key-helper hypothesis was that retail's inline helper supplied a front-end temporary missing from the direct cast. A static inline pointer form and a static inline reference form both reproduce exactly the same eight offsets and byte values. That refutes this narrow hypothesis. The register-family generator found no applicable independent adjacent definition swap. Earlier verdicts already report accessor/local/call rotation, frame-array, loop, scheduling and visible noinline resolver/integer-conversion trials. The actual compiler commands match the adjacent SetProperty source's flags; no switch difference was found.

Raw probes and exact trial sources are retained at build/getproperty-008cd2f0/probe_bank.log, key_pointer_inline.cpp, probe_key_pointer_inline.log, key_reference_inline.cpp and probe_key_reference_inline.log. The generator output is generated_register_choices.log. audit_corrected.log prints the independent byte measurements and relocations; corresponding object bytes and relocation JSON are also retained. Probe's normalized shape percentage is diagnostic, not an exactness claim.

A separate semantic hypothesis concerns the resolver output. The bank declares it uninitialized, and the resolver can return without writing it for non-string or invalid values. Retail passes the first incoming parameter's stack home at caller +0x1C, where the interpreter pointer initially resides. Explicitly initializing a separate output local from that pointer emits 269 bytes, including a new initialization store. Saving the interpreter in owner and writing the incoming parameter directly emits 267 bytes with a different prologue and different reloads. Neither form explains retail. This does not establish that the original source intentionally used an uninitialized local, nor that the resolver's no-write paths are reachable at this opcode.

Raw evidence and trial sources are in build/getproperty-008cd2f0/initialized_output.cpp, probe_initialized_output.log, parameter_output.cpp and probe_parameter_output.log. Their relocation layouts drift, so their probe byte-difference totals must not be treated as aligned instruction comparisons.

## Gates and reopening

The canonical-call scratch view fails the strict scoped byte gate on the eight listed bytes, with all direct call relocations resolved. Raw output is build/getproperty-008cd2f0/scoped_bank_gate.log. CSV integrity and global pin consistency pass; raw output is check_csv_initial.log, check_csv_final.log and pin_check_final.log in the same task folder. No full gate is required because no game source, shared header, shim or ledger changed.

The preferred bank is retained unchanged. Reopening requires a distinct, evidence-backed structural lever, such as an authored and independently verified complete getter body for visibility testing, or path-level proof of the resolver output's source-level lifetime and initialization. No authored source currently defines the getter's 0x008CC940 body; its ledger row still points at a generated dump, and the searched callers only declare it. Neither that missing body nor these failed trials prove that assembly is necessary. The exact recovery and the resolver's no-write-path semantics remain unresolved.

## Continuation structural measurements

The continuation uses the same base revision and baseline. Its explicit 254-byte control reproduces every offset and byte in the table above. The canonical `AptValue::toInteger` declaration resolves the bank's unpinned integer-method declaration without changing instructions. The strict scoped gate resolves all three calls and all three global operands before rejecting the eight remaining bytes. Raw output is build/getproperty-second-008cd2f0/scoped-byte-gate.log; call, global, compiler-command and oracle details are in bindings-raw.log in the same folder. The oracle reports UNTESTABLE for these library addresses, which adds no identity evidence.

Each compiled trial has an unchanged raw probe log, exact source, emitted object bytes and a receipt under build/getproperty-second-008cd2f0/. The generated measurements.json is the authoritative inventory of sizes, offsets, hypotheses and failures. build/verdict.txt records each hypothesis and measurement as it was tested. Relocation-drift totals from differently sized sources are screening results, not aligned semantic comparisons.

| Structural lever | Measured result | Representative raw output in build/getproperty-second-008cd2f0/ |
|---|---|---|
| Success early return and pointer-zero switch | Both retain the eight bytes; null-first and forward-goto forms emit 259 bytes. | success-early-return.probe.log and pointer-zero-switch.probe.log |
| Shared release and push block | Emits 184 bytes and removes retail's duplicated loops. | shared-release-push.probe.log |
| Four-byte string slots, unsigned routes, raw context dwords, long counters and a two-bit flags view | All retain the eight bytes. A sixteen-bit count emits 261 bytes and contradicts retail's dword loads. | typed-string-slot.probe.log and ushort-count-view.probe.log |
| Complete integer and resolver bodies as ordinary inlines | Both keep their retail calls and retain the eight bytes. Forced inlining emits 462 and 349 bytes respectively. | native-integer-inline-single-global.probe.log and native-resolver-inline.probe.log |
| One-dword returned aggregates and union storage | Resolver and getter forms all retain the eight bytes. | resolver-value-temporary.probe.log and getter-union-storage.probe.log |
| Getter member-pointer ABI views | Pointer context, reference key and Boolean flags all retain the eight bytes and the existing canonical symbol. These results do not prove new native decorations. | getter-abi-pointer-context.probe.log and getter-abi-reference-key.probe.log |
| Nested count/capacity/array records, union storage and class-body static key helpers | All retain the eight bytes. | two-nested-stack-views.probe.log and class-body-static-key-reference.probe.log |
| Entire class-static handler and internal references | All retain the eight bytes with the external two-pointer cdecl ABI intact. | class-static-handler-scope.probe.log and class-static-two-references.probe.log |
| Correctly typed incoming resolver-output parameter | All four forms emit 269 bytes and add an initialization store. They do not explain retail. | typed-incoming-output-home.probe.log |
| Generic array and opaque route-record views | Value-return elements and copied route records retain the eight bytes. Reference-return elements emit 257 bytes; a reference route record emits 256 bytes. No STL identity is inferred. | template-array-value-elements.probe.log and route-record-reference.probe.log |
| Actual matched pop helper | Ordinary inline, forced inline, class-body inline and paired native integer/resolver visibility all retain the eight bytes. | native-pop-class-body-inline.probe.log and native-pop-integer-resolver-visibility.probe.log |

The pop helper was read directly from game/GameEngine/Source/Common/BfmeConv1232.cpp and its complete 61-byte retail body was decoded. The caller's success loop has the same count and array registers as the standalone helper, but none of the visibility forms reproduces those registers in this handler. Raw decode and checked inventory are decoded-native-pop.log and checked-native-pop.log. This is distinct from copying a guessed pop wrapper.

The compiler listing labels both `_resolved$` and `_state$` at the same incoming stack offset. Its source and byte control are bank-listing.cpp and bank-listing.probe.log; the unedited listing is bank-listing.cod. This verifies how the bank obtains the observed stack-home reuse. It does not prove that retail initialized the output or that the resolver's no-write paths are unreachable.

No authored source defines the complete getter at 0x008CC940; its current ledger row points at game/gen_asm/d_008cb600.asm. A scratch reconstruction of all observed getter paths was tested only to investigate visibility. The handler still has its eight differences, but that helper emits 764 bytes against the 917-byte retail extent and has relocation drift. Its independent probe is complete-getter-helper.probe.log. That helper is unverified, including its cleanup and internal bindings, and supplies no accepted visibility or type proof. It is not a substitute for a separately verified native getter.

Several setup failures are retained too: the first integer copy contained a second cl directive, and the next copy duplicated the fallback global with incompatible pointer types. They are compilation failures, not rejected compiler-shape hypotheses. Corrected sources have distinct filenames and their successful raw probes are preserved.

Fresh checked inventories pass for the target, resolver, integer code, getter, runner, key helper and both representative refcount slots. check_csv and pin_consistency pass, with raw logs check-csv.log and pin-consistency.log. No full gate is required because there is no game, header, shim, pin or ledger change. The scoped gate fails on this target's own eight bytes; no unrelated gate failure is asserted. No assembly necessity is proven. Reopening needs a separately exact getter for full visibility testing or a new structural hypothesis that explains the listed instructions; it must use the canonical integer call and preserve the bank's address-derived descriptive name.
