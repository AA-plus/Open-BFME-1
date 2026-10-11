# Partial reconstruction of 0x006E0580

## Result and next action

This is a compiling partial, not an exact recovery. The preferred bank remains under its inherited `FXParticleSystem::RenderObjectParticleUpdateModule::update` spelling because this assignment prohibits renaming an existing bank. That spelling is not independently established and should not be used as identity evidence. The matched caller instead supports the address-derived receiver `Rva006E0580State` and its existing `build(Gen_006DFC60 *)` pin. A human naming correction is needed before changing the bank's class and method names.

The tested base revision is `6f33128a744092188b5c7a3455de411055b55f4e`. The model is `gpt-6.1-sol`. No ledger entry, symbol pin, shared header or game source was changed. The target still points at its generated assembly dump. All experiment sources, compiler output, disassembly and check output are retained under `build/r006e0580/` for coordinator collection.

The remaining compiler residue begins at the frame allocation and the first floating-point spill. Reopening needs an evidence-backed explanation for the additional retail stack slot and the `fst`/`fstp` order at target offset `+0x31`, or a different witnessed matrix constructor implementation. Two subsequent declaration and axis-object lifetime experiments produced identical instructions and relocations. Repeating those spellings does not supply a new hypothesis. Exact recovery also requires resolving the bank's transition-helper declaration and one-argument matrix-helper declaration against canonical ownership without inventing aliases or pins.

## Retry hypothesis and its test

The previous bank omitted both pairs of axis-angle matrices and the object-follow branch. The current matched `W3DView::buildCameraTransform` caller supplies separate receiver and context pointers, and current landed matrix, string, shaker and object helpers supply decoded ABI evidence. The hypothesis was that completing the missing control flow with those types and calling conventions would improve the saved bank. It would be refuted if measured, ABI-correct shapes were no closer than the remeasured original body. The experiment table below records that comparison. Instruction-shape agreement is supplementary evidence; it does not certify byte equality or identity.

The neighbouring landed sources were inspected: `Rva006D1D70TinyBodies.cpp`, `BfmeConv1713.cpp` and `BfmeTimerAZTick.cpp`. They supply verified neighbouring boundaries but no camera-owner declaration. The Zero Hour donor `GameEngineDevice/Source/W3DDevice/GameClient/W3DView.cpp` was read directly. Its rotation, zoom, shaker and camera-slave statements informed the reconstruction; its unrelated disabled alternative implementation was not ported. Original comments accompanying ported statements are retained in the bank. BFME-specific object-follow and final look-at paths come from retail instructions rather than that donor.

## Boundary, receiver and context

The complete target decode consumes the requested extent and ends at `0x006E12C8`. Both exits are `ret 4`, at offsets `+0xF8` and `+0xD45`. The target has no outgoing direct conditional branches, indirect branch or direct tail jump. Its entry saves the context argument in ESI and the ECX receiver in EBP. The return value is unused in the complete caller. This supports a void thiscall method with one pointer argument and no hidden return storage.

The complete landed caller at `0x00741D30` contains an instruction-aligned call at `0x007421B5`, through ILT `0x000035B7` to the assigned body. It pushes its constructed context address and places its own address plus `0xB4` in ECX. The caller's context constructor at `0x006DFC60` was completely decoded and checked. Its stores cover the context through offset `0xD4`; the candidate's compile-time size assertion agrees with the caller's allocation. This corrects the previous bank's conflation of the receiver and context.

Target field accesses witness the matrix pointer at context `+0`, the floating-point source, target and shake vectors at `+8`, `+0x14` and `+0x20`, integrated coordinates at `+0x4C`, copied coordinates at `+0x58`, and optional look-at coordinates at `+0x64`. The receiver separately receives a three-float copy at `+0x10` and a byte flag update at `+0x1E`. The context's string handles occupy `+0xAC` and `+0xB0`. The new angle and flag fields overlay the old bank's padding unions so its existing descriptive members remain present. Field names inherited from the old bank are retained spellings, not new semantic assertions.

Complete decoded bodies are retained as `build/r006e0580/<rva>-decode.txt`. The initial structure audit's target, constructor and transition results are valid, but its attempted EH-data interpretation failed because the pushed address was a handler thunk. That failure is retained in `structure-audit.txt`; `unwind-audit-complete-funclets.txt` decodes the thunk first and reads the actual FuncInfo.

## Direct and indirect call evidence

`checked-target.txt` records every direct target. Complete helpers used as ABI evidence were decoded and checked separately, including `Look_At`, the in-place vector transform, object lookup, kind-of test, camera timestep and shaker update, string copying, draw-module lookup, object-drawable lookup, letterboxing and the bone-transform implementation. The helper checks report call inventories, not a signature certificate. Individual return instructions, field accesses and the target's argument setup supply the ABI evidence.

- The four calls through ILT `0x00010CFD` reach `0x001C0D10`. That complete helper reads all twelve matrix floats and all three input coordinates, writes all three result coordinates, and returns with `ret 4`. The shared matrix header forwards the one-argument overload to a two-argument overload. The bank uses an address-derived declaration view to preserve the witnessed one-pointer call; this declaration remains unbound and cannot pass the byte gate.
- The calls through ILT `0x0001F253` reach `0x0009A510`, with ECX as the GameLogic pointer and one four-byte ID. The helper checks zero, performs its bucket lookup and returns the object pointer with `ret 4`. The candidate includes the native `GameLogicObjectLookup.h` declaration rather than reproducing its class privately.
- The call through ILT `0x0003251F` reaches `0x000A2CF0`, with a four-byte enum argument and a byte boolean return tested by the caller. The proposed `KindOfType` width follows the complete helper, not the old pin name.
- The call through ILT `0x000273DB` reaches the complete transition body `0x006E0080`, using the same receiver and three pointers in source, target, context order. Its exits all clean twelve argument bytes. Its five switch-table entries lie beyond its executable extent and all route back into the decoded body. The old bank's `adjustTarget` spelling remains unbound; no pin was added.
- The shaker calls use a pointer loaded from the recorded `CameraShakerSystem` global. The Zero Hour declaration describes an object, so the bank dereferences its named storage as a pointer. Timestep takes one float and cleans four bytes. Shaker update takes a twelve-byte vector value followed by a pointer and cleans sixteen bytes.
- The actual string copy at `0x00887B60` reads and writes one buffer handle and increments its shared reference count under the buffer lock. It is the canonical `StringBase<char>` copy constructor, despite unrelated ledger aliases. The bank uses native `ascii_string.h`, rather than the Zero Hour standalone string implementation.
- The ScriptEngine call uses vtable slot 27 (`+0x6C`) and passes the copied string by value. The complete slot body `0x0034F570` returns an Object pointer with `ret 4`. Its handler reaches the decoded four-state unwind map. The argument cleanup at state zero addresses the caller-owned argument slot and jumps through the string destructor ILT to `0x00887940`; the complete release body was also decoded. Other states clean the local canonical string and the two-string key. The key destructor's internals were not newly audited, so this is not a complete independent verification of the ScriptEngine helper's container types.
- Object drawable lookup uses virtual slot 10 (`+0x28`); the complete target is a pointer getter. Draw-module lookup is a niladic getter at `0x00411580`, reads receiver `+0x150`, and returns a pointer. The bank calls the existing address-derived generated declaration for that body. The ObjectDrawInterface query uses slot 39 (`+0x9C`), and the bone-transform call uses its returned interface, a string reference and a matrix output pointer. The complete bone-transform implementation is retained; its secondary-interface receiver relationship still needs independent class-layout verification before an exact ownership claim.

The target itself has no EH frame or locally owning string. The by-value ScriptEngine argument is released by the callee. No STL value type is inferred from allocation size, a donor name or a named pin in this attempt.

## Measurements and rejected shapes

The table is generated from retained raw probe output using `finish_measure.parse`. Quality uses the repository formula, which penalizes size error twice. Early rows that used incorrect shaker, string or virtual-call declarations are compiler-shape screening results, not valid ABI candidates. The final body includes the corrected declarations. The earlier scratch `measurements.json` also contains a positional byte-agreement calculation with a single missing-byte penalty; that quantity is not the repository banking score.

| Trial | Compiled bytes | Differing overlapping bytes | Quality | Raw output |
| --- | ---: | ---: | ---: | --- |
| 00-original | 1533 | 1434 | 0.0000 | `build/r006e0580/00-original-raw-probe.txt` |
| 02-complete | 3372 | 2871 | 0.1391 | `build/r006e0580/02-complete-probe.txt` |
| 03-matrix-scope | 3324 | 2857 | 0.1150 | `build/r006e0580/03-matrix-scope-probe.txt` |
| 04-position-reference | 3340 | 2796 | 0.1424 | `build/r006e0580/04-position-reference-probe.txt` |
| 05-string-value | 3344 | 2841 | 0.1315 | `build/r006e0580/05-string-value-probe.txt` |
| 06-coord-position | 3363 | 2846 | 0.1412 | `build/r006e0580/06-coord-position-probe.txt` |
| 07-late-position-reference | 3360 | 2876 | 0.1306 | `build/r006e0580/07-late-position-reference-probe.txt` |
| 08-integration-locals | 3359 | 2769 | 0.1615 | `build/r006e0580/08-integration-locals-probe.txt` |
| 09-position-value-copy | 3360 | 2876 | 0.1306 | `build/r006e0580/09-position-value-copy-probe.txt` |
| 10-coord-target | 3360 | 2876 | 0.1306 | `build/r006e0580/10-coord-target-probe.txt` |
| 11-vector-value-product | 3362 | 2816 | 0.1494 | `build/r006e0580/11-vector-value-product-probe.txt` |
| 12-frame-00 | 3360 | 2876 | 0.1306 | `build/r006e0580/12-frame-00-probe.txt` |
| 13-visible-vector-helper | 3341 | 2884 | 0.1171 | `build/r006e0580/13-visible-vector-helper-probe.txt` |
| 14-visible-object-lookup | 3359 | 2769 | 0.1615 | `build/r006e0580/14-visible-object-lookup-probe.txt` |
| 15-shaker-pointer | 3361 | 2800 | 0.1535 | `build/r006e0580/15-shaker-pointer-probe.txt` |
| 17-native-string | 3357 | 2801 | 0.1509 | `build/r006e0580/17-native-string-probe.txt` |
| 18-draw-interface-slot | 3360 | 2788 | 0.1565 | `build/r006e0580/18-draw-interface-slot-probe.txt` |
| 19-draw-getter-abi | 3360 | 2788 | 0.1565 | `build/r006e0580/19-draw-getter-abi-probe.txt` |
| 20-native-integration | 3362 | 2864 | 0.1353 | `build/r006e0580/20-native-integration-probe.txt` |
| 21-native-y-lifetime | 3361 | 2548 | 0.2276 | `build/r006e0580/21-native-y-lifetime-probe.txt` |
| 22-y-before-target | 3361 | 2548 | 0.2276 | `build/r006e0580/22-y-before-target-probe.txt` |
| 23-axis-object-lifetimes | 3361 | 2548 | 0.2276 | `build/r006e0580/23-axis-object-lifetimes-probe.txt` |
| final | 3361 | 2548 | 0.2276 | `build/r006e0580/final-probe.txt` |

The missing axis-angle and object-follow paths supplied substantial structural progress. Coordinate fields, by-value string handling, pointer loading for the shaker, and the corrected virtual slot offsets were retained for independent ABI evidence. Explicit vector-product temporaries, visibility of a copied matrix helper, and visibility of the native lookup helper did not improve the preferred body. The frame-family generator produced no alternatives. The two final changes to declaration order and named axis-object lifetimes emitted the same result as the preferred trial. No unchanged register or x87 experiment follows those two results.

## Verification limits

The scoped byte check in `final-scoped-byte-gate.txt` compiles the candidate through the repository resolver and fails. Its raw unresolved-symbol list and resolved byte differences are retained. These results prohibit an exact or landed verdict. A relocation-masked probe cannot establish those missing bindings.

`check-csv-before-bank.txt`, `pin-consistency.txt` and `class-gate.txt` pass. `name-source-comparison.txt` reports no descriptive-to-placeholder regressions using the repository's direct source comparison. The brief's filename arguments to `name_regression.py` were rejected because this revision of that CLI expects Git snapshots; the raw failure is retained in `name-regression.txt`. A full staged name gate and commit hooks remain for the coordinator. No full gate was run because this attempt only banks evidence and does not alter a shared header or land source. All uncollected scratch and raw logs are preserved.
