# Declaration retry at RVA 0x002382D0

## Result

No source recovery is claimed. The preferred bank remains unchanged at `targets/game/reverse/attempts/0x002382d0.cpp`, with SHA-256 `650d0ef59210659c105509beef6f6db9635e8dfbd2738abadc9f13f676f17a54`. The tested revision is `ce739ed4115ab6618d48d5bd64fa25e5a48bbe69`, and the model is `gpt-6.1-sol`. The ledger still names the generated assembly. This run adds evidence and one blocked verdict only.

## Hypotheses and refutation

The previous bank already incorporates the shared Object layout, independently decoded pointer-list payloads, native list find, and the landed factory and lookup contracts. The current neighboring and callee rows supply no newly resolved blocker. A read-only Git history check from the previous evidence's tested revision through this revision finds no changes to those selected declarations and sources.

The first hypothesis was that expressing the canonical `Object::m_contain` type directly, instead of repeatedly casting it to `ModuleView002382D0`, would remove the receiver copy before slot 26. Trial 01 defines the same witnessed interface slots on `ContainModuleInterface` and retains the bank's address-qualified view name. The observation that refutes this hypothesis is unchanged emitted instructions and distance from retail. Its measurement is unchanged.

Trial 02 uses a typed one-receiver fastcall table entry for the same independently decoded zero-stack-argument slot. It tests the documented vtable-temporary adapter without adding a stack argument or changing the retail contract. Its emitted body grows and its distance worsens, so it is rejected.

Trial 03 moves the empty status temporary and zero extra argument into default arguments on the independently established four-argument BFME factory declaration. Zero Hour's factory declaration independently demonstrates default-argument syntax, but its by-value global mask is different from BFME's witnessed reference argument. This trial is a compiler-shape hypothesis, not a claim that the BFME source used that default. Its measurement is unchanged. Trials 01 and 03 reach the assignment's limit of two unchanged register experiments; no further register spelling sweep is justified.

## Measurements

Each measurement comes from the unedited corresponding `build/rva002382d0-retry/<trial>-probe.log`. `00-bank.cpp` is the unchanged starting bank; the final `0x002382d0` probe measures the retained bank at its actual path. Sources, compiler objects, raw output and timestamps are preserved under `build/`. Quality is the repository finish-measure formula. Relocation layout drift makes these diagnostic scores, not strict byte verification.

| Trial | Emitted bytes | Masked differences | First difference | Quality |
|---|---:|---:|---:|---:|
| 00-bank | 543 | 159 | +0x18 | 0.7072 |
| 01-canonical-interface | 543 | 159 | +0x18 | 0.7072 |
| 02-interface-adapter | 547 | 266 | +0x18 | 0.4954 |
| 03-native-default-arguments | 543 | 159 | +0x18 | 0.7072 |
| 0x002382d0 | 543 | 159 | +0x18 | 0.7072 |

## Boundary, types and ABI evidence

The full target and the actual direct and virtual helpers were decoded into `build/rva002382d0-retry/decode-<rva>.log`; their checked inventories are `checked-<rva>.log`. The target has returns at 0x00238358 and 0x002384EC, both cleaning one dword, with padding starting at 0x002384EF. Its conditional branches stay within the complete extent, and it has no tail jump. It forwards a template pointer, a Team pointer, the address of three zero status words, and a zero extra dword to the factory, whose complete body returns an Object pointer and cleans four dwords.

The complete population helper at 0x00237FB0 copies precisely one dword from node +8 to node +8 on both list-copy loops. Its lookup path stores the Object pointer returned from hash-node +8 into the same payload. The complete synchronization helper at 0x0023FDB0 loads each payload from node +8 and dereferences Object fields +0x204 and +0x210. This establishes pointer payloads independently of allocation size, donor names, and destructor pins. The STLport 4.6 `_List_node`, `_List_base` and `clear` implementation agrees with the witnessed next and previous links, one pointer payload, and destruction of nodes without deletion of pointed-to Objects. The actual destructor at 0x000CEBD0 cleans nodes and sentinel through the independently decoded cdecl pointer-and-size deallocator; its pinned `list<int>` spelling does not establish the target's value type.

`build/rva002382d0-retry/table-routes.json` records actual table entries and every ILT route used for secondary slots 17, 25, 28, 29, 52, 81, 111, 112 and 122. The primary slot 26 helper at 0x00230730 returns the secondary interface at owner +0xE4; the secondary slot 122 helper at 0x00230830 subtracts that offset. Slot 28's complete body at 0x00245BF0 consumes two pointer arguments and a byte boolean in a dword stack slot, returns zero on rejection and the created Object pointer on success, and cleans three dwords. Slot 81 consumes one dword; slots 52, 111 and 112 consume no stack arguments. The target does not use slot 28's return value.

`build/rva002382d0-retry/eh-target.log` records both unwind states. State zero destroys the local list at EBP-0x20; its cleanup routes through 0x00018949, 0x000D0020 and 0x0000E68D to 0x000CEBD0. State one restores the latch at EBP-0x18 through 0x00033C17 to 0x0010D360. Complete constructor 0x0010D330, destructor 0x0010D360 and deleting destructor 0x0010D3E0 agree with the native `LatchRestore<bool>` saved byte at +4 and referenced destination at +8. The target restores the owner byte at +0x210 on both normal exits from the nested scope.

## Remaining blockers

The initial mismatch remains at +0x18, where retail preloads the template pointer into EDX. The bank saves registers first and loads that argument later. The additional receiver copy before slot 26 shifts the early return and later setup; loop alignment compensates before +0xF0. No current declaration experiment improves this. The original evidence's unresolved incoming return contract also remains. `build/rva002382d0-retry/caller-screen.json` preserves the bounded raw-opcode screen and instruction-boundary validation. The complete decoded candidate `caller-0029e330.log` calls +0x64 using the primary pointer from Object +0x1FC, without extraction of the secondary interface on that path, so it is rejected as a caller of the assigned target. The screen does not prove there are no other callers.

Reopening requires new native source or declaration evidence that produces an improved measured body, or a complete caller that witnesses the assigned secondary slot's input and return contract. An aligned EA name is still only a lead; no new method or owner identity is claimed.

## Checks and retained work

`build/rva002382d0-retry/strict-gate.log` is the ordinary scoped verifier on an ephemeral in-memory row for the retained bank. The immutable retail baseline passes and the strict byte comparison fails. There is no unrelated failure to waive. `final-check-csv.log`, `pin-consistency.log` and `class-gate.log` pass, with their actual exit codes in `check-results.json`. No production source, bank, ledger, pin, shared header, baseline or tooling is changed, so no full gate is required. All trials and raw logs remain uncollected under `build/rva002382d0-retry/`.
