# RVA 0x0025C010 initialization-order retry

The tested revision is 1d8a12f21352c5d4893b7b5caf4caaf06bcb4ff0. The worker model is gpt-6.1-sol. No source recovery is claimed. The preferred bank remains unchanged because none of the measured alternatives improves it.

## Retry hypothesis and refutation

The retry first tested whether a wrong terrain argument declaration, missing callee source visibility, or a missing native temporary explains the initialization schedule. The previous records already reject ordinary declaration-order changes, scale accessors, matrix setter spellings, scalar type variants, free-stdcall calls, barriers, and register rotations. A trial is refuted when the scale spill and first flag test still precede the identity stores, or when it introduces differences outside that region. Each preserved source and its unedited probe output is listed below. The source and experiment ledger in build/verdict.txt records each new hypothesis and result.

## Complete boundary and identity

The target decodes completely over 0x0025C010 through 0x0025C18E. Its five return instructions at offsets +0x0083, +0x0120, +0x014D, +0x0172 and +0x017B all pop eight bytes. Every conditional branch stays inside that extent, and there is no outgoing tail jump. The target has no exception registration, unwinding state, owning container construction, hidden result pointer or x87 return.

The complete matched caller at 0x0025C7C0 preserves the owner in ECX and calls ILT 0x00028C5E at caller offset +0x00DF after pushing an AsciiString reference and the location pointer. The thunk jumps to this target. The complete caller at 0x0025C220 independently reaches the same thunk at +0x03C2 and tests the returned EAX pointer. These witnesses support the inherited address-derived member name applyAt0025C010 and a pointer-or-null return. They do not establish EA's original method or owner spelling; the bank names remain unchanged.

The six direct call routes are ILT 0x00028560 to 0x00137E80, 0x0004494A to 0x00138520, 0x0003A1A7 to 0x00132CE0, 0x000364AD to 0x001AD080, 0x000050C9 to 0x001A7A90 and 0x00037F83 to 0x001A34C0. Each entire callee and thunk was decoded. Checked inventories are in build/0025c010-worker/callees-<rva>.log; complete instruction dumps are in build/0025c010-worker/decode-<rva>.log. The checker alone is not a boundary certificate; all decoded returns and branches were reviewed.

The factory lookup takes one reference, returns the template pointer in EAX and pops four bytes. Object creation takes four stack arguments and pops sixteen bytes. The three-word zero mask passed by address agrees with the canonical BitFlags<86> factory declaration. The position setter takes a Coord3D pointer and pops four bytes. The owner at +0x08 and its Object member +0x23C agree with the witnessed m_team layout.

Object's actual primary table is at VA 0x0109EE58. Slot +0x50 contains ILT 0x0002B74C, which reaches the complete 0x001C6F10 setTeam body. That body consumes one team pointer with no receiver adjustment and returns with RET4. The lookup report is build/0025c010-worker/object-vtable.log, and the entire setter is retained in the corresponding decode and checked-callee logs. The shared Object and Thing declarations were probed through the canonical-object trial while keeping the bank's slot50 spelling as an inline forwarding method. They preserve the bank's diagnostic result.

## Terrain payload proof through complete virtual receivers

At the target's three placement sites, the third stack argument is a matrix address and the fourth is the raw float scale. The target also materializes TheTerrainLogic in ECX at each site. The helper at 0x001A34C0 consumes the third argument as a matrix pointer, calls the complete eight-byte Matrix3D::Get_Z_Rotation body at 0x008D68A0, and forwards its x87 float result to TerrainVisual slot +0x80. It pops sixteen bytes and does not use its incoming receiver.

The landed 0x001A7A90 source declares its third argument as a float angle. Its own decoded body only forwards those bits, which is insufficient type evidence. The first interpretation in this run treated that declaration as an angle witness. Following the actual virtual receivers refutes it. The complete W3DTerrainVisual constructor at 0x007304E0 installs the primary table at VA 0x011212F0. Table slot +0x98 reaches ILT 0x0001EECF and the complete 87-byte forwarding body at 0x00730F70. That body passes every argument unchanged to ILT 0x00047898, reaching the complete 93-byte forwarder at 0x006C8AA0. The latter calls ILT 0x00017C6A, which reaches the complete 1312-byte shrub-buffer body at 0x00720D10.

The shrub body loads the forwarded argument as a pointer into ECX at +0x0174. It reads all twelve dwords at offsets +0x00 through +0x2C and stores them into the appended record's 48-byte transform. The instruction range +0x0184 through +0x01D7 proves that payload independently of its name or the allocation size. The complete tree route similarly follows table slot +0x84 through ILT 0x0001D764 to 0x00730D90, then ILT 0x0002B2C4 to 0x006C8950, and ILT 0x00018FF2 to the complete 1313-byte body at 0x00736B60. That body reads and writes the same twelve pointer-reached dwords at +0x0115 through +0x0168. Both final bodies return with RET44, matching the complete eleven-word call setup through the forwarding chain.

The 0x001AD080 helper uses incoming ECX as terrain state and writes member +0x18F0; the shrub and matrix-dispatch helpers do not use their incoming receivers. All three pop sixteen bytes. The bank's matrix-pointer payload is supported by these complete consumers, despite the older shrub source's scalar declaration. No shared declaration or unrelated source was changed. Raw virtual-table inventory is build/0025c010-worker/terrain-visual-vtable.log. Each entire receiver and forwarder has a corresponding decode and checked-callee log under build/0025c010-worker/.

The visible-shrub-matrix-proof-fixed trial copies the complete landed helper as an inline non-inlined member, changes the payload declaration to the independently witnessed matrix pointer, and keeps an address-derived template view. Its helper body reproduces all 311 bytes outside relocation slots with ten relocations in build/0025c010-worker/probe-shrub-visible-helper.log. The assigned target nevertheless retains its unchanged scheduling residue. The two earlier angle-bit trials remain preserved as rejected hypotheses; their payload interpretation is refuted by the complete final receivers. The bank's three terrain member spellings still lack current pins, which the strict resolver reports separately.

## Measured residue

The bank emits 382 bytes against a 382-byte target, with 42 differing nonrelocation bytes and 11 relocations. The exact differing offsets are +0x008C, +0x008D, +0x008F, +0x0090, +0x0091, +0x0092, +0x0093, +0x0094, +0x0095, +0x0096, +0x0097, +0x009B, +0x009F, +0x00A2, +0x00A3, +0x00A7, +0x00AF, +0x00B7, +0x00BA, +0x00BB, +0x00BF, +0x00C7, +0x00CA, +0x00CB, +0x00CF, +0x00D7, +0x00DF, +0x00E2, +0x00E3, +0x00E7, +0x00EC, +0x00ED, +0x00EF, +0x00F0, +0x00F1, +0x00F2, +0x00F3, +0x00F4, +0x00F5, +0x00F6, +0x00F7, +0x00FB. The raw comparison is build/0025c010-worker/probe-bank.log, and hashes, object receipt and offsets are in build/0025c010-worker/measurement.json.

Retail loads the scale into ECX at +0x0086, emits twelve identity stores at +0x008C through +0x00E4, spills ECX to [esp+0x4C] at +0x00EC, then loads flags at +0x00F0 and tests them at +0x00F6. The bank performs the same operations and uses the same registers and stack locations, but spills at +0x008C, loads flags at +0x0090 and tests them at +0x0096 before the identity stores. Bytes before the first difference and after +0x00FB agree outside relocation slots. There is no differing field offset, immediate value or stack-frame size in this residue.

The compiler listing in build/0025c010-worker/bank.cod places the status mask at -60, the matrix at -48 and extra in the dead second-argument slot +12. These are the slots retail uses. The prior stack-slot diagnosis does not describe a slot mismatch; the unresolved issue is scheduling the stores and flag read. The exact compiler invocation is retained in build/0025c010-worker/compiler-command.txt.

The strict candidate resolver plus explicit equality and unresolved-call checks fails. Its raw output is build/0025c010-worker/scoped-candidate-gate.log. The initial wrapper's misleading success label is preserved in build/0025c010-worker/scoped-resolver-initial.log; that wrapper only called compile_function, which returns a patch and does not enforce equality. The corrected wrapper rejects the differing bytes and the three unresolved terrain calls. No pin, source ledger row or baseline was changed to silence the failure.

## Preserved trials

| Trial | Emitted bytes | Nonrelocation differences | Raw output |
|---|---:|---:|---|
| abi-angle-memcpy | 373 | 108 | build/0025c010-worker/probe-abi-angle-memcpy.log |
| abi-angle-union | 373 | 108 | build/0025c010-worker/probe-abi-angle-union.log |
| aggregate-matrix-first | 386 | 213 | build/0025c010-worker/probe-aggregate-matrix-first.log |
| aggregate-scale-first | 382 | 57 | build/0025c010-worker/probe-aggregate-scale-first.log |
| arm-matrix-lifetimes | 378 | 193 | build/0025c010-worker/probe-arm-matrix-lifetimes.log |
| array-scale-local | 382 | 42 | build/0025c010-worker/probe-array-scale-local.log |
| bank | 382 | 42 | build/0025c010-worker/probe-bank.log |
| c-array-const-identity | 382 | 42 | build/0025c010-worker/probe-c-array-const-identity.log |
| c-array-identity | 382 | 42 | build/0025c010-worker/probe-c-array-identity.log |
| canonical-object | 382 | 42 | build/0025c010-worker/probe-canonical-object.log |
| comma-assignment-temp | 382 | 42 | build/0025c010-worker/probe-comma-assignment-temp.log |
| comma-init-scale | 382 | 42 | build/0025c010-worker/probe-comma-init-scale.log |
| comma-scale-init | 382 | 42 | build/0025c010-worker/probe-comma-scale-init.log |
| constructed-scale-copy | 382 | 42 | build/0025c010-worker/probe-constructed-scale-copy.log |
| flag-Gy | 382 | 42 | build/0025c010-worker/probe-flag-Gy.log |
| flag-Ob1 | 382 | 42 | build/0025c010-worker/probe-flag-Ob1.log |
| flag-Ogoff | 472 | 340 | build/0025c010-worker/probe-flag-Ogoff.log |
| flag-Oioff | 347 | 272 | build/0025c010-worker/probe-flag-Oioff.log |
| flag-Op | 308 | 246 | build/0025c010-worker/probe-flag-Op.log |
| flag-Os | 270 | 220 | build/0025c010-worker/probe-flag-Os.log |
| flag-Z7 | 382 | 42 | build/0025c010-worker/probe-flag-Z7.log |
| flag-Zi | 382 | 42 | build/0025c010-worker/probe-flag-Zi.log |
| flags-volatile-field | 384 | 193 | build/0025c010-worker/probe-flags-volatile-field.log |
| flat-identity-storage | 382 | 42 | build/0025c010-worker/probe-flat-identity-storage.log |
| helper-opt-all-off | 362 | 242 | build/0025c010-worker/probe-helper-opt-all-off.log |
| helper-opt-g-off | 362 | 242 | build/0025c010-worker/probe-helper-opt-g-off.log |
| helper-opt-s-off | 382 | 42 | build/0025c010-worker/probe-helper-opt-s-off.log |
| helper-opt-t-off | 382 | 42 | build/0025c010-worker/probe-helper-opt-t-off.log |
| helper-opt-y-off | 382 | 42 | build/0025c010-worker/probe-helper-opt-y-off.log |
| inline-object-return | 382 | 42 | build/0025c010-worker/probe-inline-object-return.log |
| inline-void-return | 382 | 42 | build/0025c010-worker/probe-inline-void-return.log |
| listing | 382 | 42 | build/0025c010-worker/probe-listing.log |
| matrix-const-object | 382 | 42 | build/0025c010-worker/probe-matrix-const-object.log |
| matrix-mutable-argument | 382 | 42 | build/0025c010-worker/probe-matrix-mutable-argument.log |
| matrix-reference-arguments | 382 | 42 | build/0025c010-worker/probe-matrix-reference-arguments.log |
| native-release-macros | 382 | 42 | build/0025c010-worker/probe-native-release-macros.log |
| native-string-compatible | 382 | 42 | build/0025c010-worker/probe-native-string-compatible.log |
| native-string-context | Compilation failed | Unmeasured | build/0025c010-worker/probe-native-string-context.log |
| native-string-fixed | Compilation failed | Unmeasured | build/0025c010-worker/probe-native-string-fixed.log |
| placement-forward-labels | 382 | 81 | build/0025c010-worker/probe-placement-forward-labels.log |
| placement-identity-lifetime | 382 | 42 | build/0025c010-worker/probe-placement-identity-lifetime.log |
| placement-switch | 396 | 200 | build/0025c010-worker/probe-placement-switch.log |
| pod-scale-copy | 382 | 42 | build/0025c010-worker/probe-pod-scale-copy.log |
| row-identity-storage | 382 | 42 | build/0025c010-worker/probe-row-identity-storage.log |
| scalar-copy | 382 | 42 | build/0025c010-worker/probe-scalar-copy.log |
| scale-volatile-field | 382 | 42 | build/0025c010-worker/probe-scale-volatile-field.log |
| selective-memset-intrinsic | 382 | 42 | build/0025c010-worker/probe-selective-memset-intrinsic.log |
| status-extended-temporary | 382 | 42 | build/0025c010-worker/probe-status-extended-temporary.log |
| status-prvalue | 382 | 42 | build/0025c010-worker/probe-status-prvalue.log |
| status-return-value | 382 | 42 | build/0025c010-worker/probe-status-return-value.log |
| template-dword-padding | 382 | 42 | build/0025c010-worker/probe-template-dword-padding.log |
| template-union-padding | 382 | 42 | build/0025c010-worker/probe-template-union-padding.log |
| visible-dispatch-native | 382 | 42 | build/0025c010-worker/probe-visible-dispatch-native.log |
| visible-dispatch | Compilation failed | Unmeasured | build/0025c010-worker/probe-visible-dispatch.log |
| visible-helpers-canonical-object | 382 | 42 | build/0025c010-worker/probe-visible-helpers-canonical-object.log |
| visible-lookup-and-shrub | 382 | 42 | build/0025c010-worker/probe-visible-lookup-and-shrub.log |
| visible-lookup-shrub-dispatch | 382 | 42 | build/0025c010-worker/probe-visible-lookup-shrub-dispatch.log |
| visible-lookup | 382 | 42 | build/0025c010-worker/probe-visible-lookup.log |
| visible-shrub-matrix-proof-fixed | 382 | 42 | build/0025c010-worker/probe-visible-shrub-matrix-proof-fixed.log |
| visible-shrub-matrix-proof | Compilation failed | Unmeasured | build/0025c010-worker/probe-visible-shrub-matrix-proof.log |
| zero-hour-math | 382 | 42 | build/0025c010-worker/probe-zero-hour-math.log |

The generic copy/frame generator found no applicable target transformation; its sole output concerns the unrelated weighted-choice caller and was not executed. The source-donor lookup returned no exact operand-shape donor. The similarity result in build/0025c010-worker/similar.log supplied no matrix-initialization donor; the two relevant object-creation sources were inspected directly. Source visibility for the currently generated 0x001AD080 helper has no authored definition available to copy. No other target was selected or modified.

## Checks and preservation

The working-tree check_csv result is passing in build/0025c010-worker/check_csv-final.log. The complete pin consistency check is passing in build/0025c010-worker/pin-consistency.log. The strict candidate check remains failing, as described above. No full gate is required by this evidence-only change, and no source recovery is being landed.

The preferred bank is byte-identical to the initial saved snapshot, including its CRLF endings, as checked in build/0025c010-worker/bank-preservation.log. Git stores its normalized text with LF endings, so direct comparison against the Git blob is not a working-tree preservation test. All trial sources, unedited probe outputs, instruction decodes, helper receipts and the running verdict remain under build/0025c010-worker/ and build/verdict.txt. No Git write or synchronization command was used.

## Reopening condition

Reopen with an independently justified source or compiler experiment that preserves all observed call values, receiver loads and frame slots while moving the scale spill and first flag read after the twelve matrix stores. An original source witness for the larger tree helper with verified non-retention and side effects would also justify another ABI and source-visibility investigation. An unchanged accessor, declaration rotation, matrix setter spelling or register experiment does not supply that evidence. This run has not proved that assembly is necessary.
