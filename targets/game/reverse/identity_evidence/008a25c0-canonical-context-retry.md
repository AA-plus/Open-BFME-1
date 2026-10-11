# Retry evidence for 0x008A25C0

The retry did not improve the preferred reconstruction. The complete source remains a partial because the compiler schedules the kind-10 relocation amount differently and chooses different registers for the import-handle assignment. No source recovery or new pin is claimed. The preferred bank remains `targets/game/reverse/attempts/0x008a25c0.cpp`; all current trials and unedited probe and gate output are preserved under `build/retry-008a25c0-20261011/`.

The tested revision is `4d34555fd5ba0ccb8f4ba7c20de283af6ace925b`, with model `gpt-6.1-sol`. Ledger and symbol files were unchanged during the experiments. The supplied statement that the saved target is defined under the handle destructor symbol is refuted by its source and object: that destructor emits only the cleanup helper, while the complete target is defined as `?run@Rva008A25C0Object@@QAEXPAX@Z`. The initial destructor-symbol probe is retained as `000-bank-dtor.log` and is not a target reconstruction.

## New hypothesis and its test

The previous run lacked the now-landed `Rva008D3610Owner::update(int, void *)` declaration and body. The hypothesis was that canonical argument types, the complete nested layout, or visibility of the actual helper would correct the relocation amount's lifetime. A second test replaced address-bearing scalar views with pointer storage views justified by decoded accesses. Unchanged or more distant caller instructions refute either proposed route to an improvement.

The new declaration was first tried through the bank's retained `Rva008D3610Object::run` view, then called directly through the canonical owner. The inline forwarding view worsened argument-setup register choices. The direct call retained the original caller output. The actual update definition was then copied as an inline noinline definition, so the experiment introduced no second strong definition. Its own probe was exact modulo relocation slots over its complete emitted extent, but the target remained unchanged. The real drop helper was tested the same way, with the same caller result and a separately matching helper. These helper probes demonstrate local code generation only; they are not new recoveries or complete linked-gate certificates.

## Boundary and calling convention

The target decodes completely from RVA 0x008A25C0 through 0x008A2B6E. Its two returns are `ret 4` at +0x58C and +0x5AB. Every direct conditional and unconditional branch stays within this instruction extent and lands on an instruction boundary. The bounded switch at +0x1A4 reads ten entries at RVA 0x008A2B70. Every destination is an internal instruction boundary. Two alignment bytes separate the code endpoint from this table. The table has its own complete range ending at RVA 0x008A2B98. `checked-target.log`, `decode-target.log`, and `extent-evidence.log` retain these checks.

The complete matched `BfmeDropObjectA` destructor at RVA 0x00895260 supplies the incoming ABI. At +0x43 it loads its argument from member +0x0C, loads the owner from +0x10, pushes one dword, adjusts ECX by eight, and calls the assigned body at +0x4D. Both target returns pop that dword; the caller does not consume a returned value or supply hidden result storage. Its source and full decode support the inherited opaque `Rva008A25C0Object::run(void *)` interface. They do not identify an original EA class or method. The manager invoke source prepares deferred data and is not an independent direct caller of this body.

At target +0x1AB through +0x1B8, retail pushes the counter address followed by the incoming relocation dword, then sets ECX to the selected record plus eight before calling RVA 0x008D3610. The complete callee reads the relocation dword into EBP, uses the receiver's fields at zero, four and eight, forwards the context unchanged, and returns with `ret 8`. No hidden return storage or further receiver adjustment appears. The canonical declaration resolves this dependency through its current landed row; no alias pin is needed. `decode-update.log` and `checked-helper.log` retain the decoded evidence.

## Storage and ownership

The main receiver has a signed counted pointer table at +0x0C and +0x10, signed counted import records at +0x20 and +0x24, signed counted eight-byte records at +0x28 and +0x2C, and the counter at +0x30. The decoded loops establish four-byte pointer slots, sixteen-byte import records, eight-byte pair records, sixty-eight-byte kind-4 frame records, and fifty-six-byte kind-10 records. The kind-10 loop reads and conditionally rebases only the word at element +0x34, then rebases the array address. Its unexamined words remain padding. These are physical serialized record views, not inferred STL value types.

The complete landed reference-fixup helper at RVA 0x008A12C0 reads import +4 as the name pointer and +8 as the slot, and uses the handle at +0x0C as the owning lookup receiver. Its full source was read and its complete code decoded. The complete forward relocation code at RVA 0x008A2130 ends at the `ret 12` before its table, rebases the same address-bearing words, and constructs the import handle through `Rva00893030Manager::rva00895A00`. The source of that already-landed helper was inspected as further ownership context. Pointer declarations in the trials express these observed storage operations; they do not claim the original declaration of an otherwise unexamined field.

The complete search helper at RVA 0x008A0690 reads the receiver's signed count at +0x0C and pointer array at +0x10, compares every four-byte slot with its incoming dword, returns a four-byte index or minus one, and pops four stack bytes. The decrement and increment helpers at RVA 0x00894D90 and RVA 0x00894D80 operate on one pointed four-byte count, return it in EAX, and use plain returns with caller cleanup. The drop helper at RVA 0x00895320 calls the complete `BfmeDropObjectA` destructor and invokes the sized-free callback with that pointer and the object's size. It uses a plain return and caller cleanup. The visibility trials copied the actual landed helper bodies, not simplified substitutes.

The complete zero-third forwarder at RVA 0x008CC540 reads three incoming dwords, forwards them as first, second and fourth arguments with zero in the third position, pops sixteen bytes and returns plainly. Its complete callee at RVA 0x008CBDF0 reads a byte stream through the first argument, retains the relocation bits in the second, and increments the fourth argument's pointed dword at +0xB4. Its complete code ends with a plain return and no outgoing direct branch. This supports the counter-address view and the byte-stream pointer experiment. The target's other three indirect callbacks each receive one dword and have four-byte caller cleanup; their original return types are not inferred from an unused result.

## Exception cleanup

The target's handler at RVA 0x00C57CA8 loads the EH information at RVA 0x00E47090 and jumps to the C++ frame handler. Its single unwind state goes to minus one and invokes the cleanup at RVA 0x00C57CA0. That cleanup forms the temporary's address as EBP minus sixteen and follows RVA 0x000463AD to the complete one-pointer cleanup at RVA 0x00784A70. The cleanup conditionally decrements the owned pointer and rereads it before dropping it on a zero count. The corresponding emitted handle destructor separately matches this cleanup's instruction and relocation shape. That comparison supports the temporary's ownership and offset; it does not establish a second original name for the cleanup body.

The sole new EH declaration generated for the canonical update was fed to `shape_search` with a bounded two-trial search. Both trials were unchanged. Earlier EH and copy generators were already exhausted. The regenerated non-EH family choices contained only that same handle-copy experiment, so it was not repeated. Raw generator output, the selected choice, search manifest and both raw probe outputs are retained.

## Measurements and remaining mismatch

Every target probe uses the independently checked instruction extent explicitly. The emitted-size column includes the compiler's switch table; the retail comparison covers the instruction extent. Quality is the repository's finish-measure metric, computed from the raw difference and size counts, not the normalized instruction-similarity fraction. The complete object is larger than the retail code-and-table range because its last instruction ends seven bytes late and its table alignment differs.

| Experiment | Emitted bytes | Differing bytes | First offset | Measured quality | Raw output |
|---|---:|---:|---|---:|---|
| Original preferred bank | 1504 | 375 | +0x153 | 0.6733 | `001-bank-run.log` |
| Canonical callee through an inline forwarding view | 1504 | 391 | +0x153 | 0.6623 | `002-canonical.log` |
| Direct canonical update declaration | 1504 | 375 | +0x153 | 0.6733 | `004-canonical-direct.log` |
| Kind-10 pointer storage | 1504 | 375 | +0x153 | 0.6733 | `005-kind10-pointer.log` |
| Visible actual noinline update body | 1504 | 375 | +0x153 | 0.6733 | `006-visible-update.log` |
| Kind-10 reference helper | 1488 | 453 | +0x153 | 0.6417 | `007-kind10-reference-helper.log` |
| Kind-10 pointer and reference helper | 1488 | 453 | +0x153 | 0.6417 | `008-kind10-pointer-reference-helper.log` |
| New update exception specification | 1504 | 375 | +0x153 | 0.6733 | `009-new-eh-1.log` |
| Import pointer storage | 1504 | 375 | +0x153 | 0.6733 | `010-import-pointer-fields.log` |
| Import and byte-stream pointer storage | 1504 | 375 | +0x153 | 0.6733 | `011-import-and-stream-fields.log` |
| Entry reference storage | 1504 | 375 | +0x153 | 0.6733 | `012-typed-entry-words.log` |
| Visible actual noinline drop body | 1504 | 375 | +0x153 | 0.6733 | `013-visible-drop.log` |
| Visible drop with a typed owning handle | 1504 | 375 | +0x153 | 0.6733 | `014-visible-drop-typed-handle.log` |
| Register-qualified parameter | 1504 | 375 | +0x153 | 0.6733 | `015-register-parameter.log` |
| Register-qualified relocation local | 1504 | 375 | +0x153 | 0.6733 | `016-register-base.log` |

The meaningful first scheduling difference is at +0x3E8: retail loads the relocation amount into EBX before the loop guard and retains it for the array rebase at +0x43A. The candidate loads it inside the loop path and reloads EDX after the loop. The import assignment also chooses a different register for the record-array load, the temporary address and the drop argument. Changed branch displacements make the probe's first reported byte difference occur earlier, at +0x153. Alignment changes then shift the import loop and the final pair loop. `001-bank-run.log` and `006-visible-update.log` retain full side-by-side instructions.

The two allowed register-qualification experiments did not change the result and that family stopped. No further justified type or callee-visibility experiment was found after the measured rejections. Reopening requires independent native declaration or inline-lifetime evidence that explains the unconditional kind-10 preload, or a reproducibly closer compiled body. A newly named pin alone is insufficient.

## Verification and retained work

The original bank's scoped gate fails on its stale nested-run symbol as well as shifted instructions. The canonical candidate resolves that dependency and still fails the scoped strict byte comparison. These are failures of the assigned reconstruction, not unrelated gate failures. Raw output is retained in `original-bank-gate.log` and `canonical-candidate-gate.log`. Pin consistency passes in `pin-check.log`. The final CSV check is retained in `check-csv-final.log`. No shared header or game source was changed, so a full gate is not required by this evidence-only handoff.

The scratch candidate passes the class gate. The declaration check refuses it because it owns no matched ledger row, which is expected for an unlanded partial. The brief's file-to-file name-regression command is incompatible with the current revision-oriented CLI; its failure is preserved. The source comparison instead uses `name_regression.regressions` and an explicit identifier-retention check. This is not a revision-level name-gate certificate. Raw outputs are in `candidate-class-gate.log`, `candidate-declarations.log`, `candidate-name-regression.log`, and `source-name-check.log`.

`results.json` records source snapshots, raw-output hashes, exact commands and clock receipts. The initial forwarding trial was retained in `002-canonical.source.cpp` and its measurement reproduced in `017-wrapper-snapshot-reproduction.log`. The preferred bank stays unchanged; the equally close canonical declaration candidate is archived through the normal attempt tool without replacing it. All uncollected scratch sources and raw logs remain under the task directory.
