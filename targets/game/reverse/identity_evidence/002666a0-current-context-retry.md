# RVA 0x002666A0: current declaration and caller retry

## Result and reopening condition

The context hypothesis is refuted by measured complete bodies. The existing bank at `targets/game/reverse/attempts/0x002666a0.cpp` remains the best body and is retained without modification. No source recovery, identity correction, pin or ledger conversion is claimed. The tested revision is `5dc2bc772b5c670bcb177327ce703c6bb2789c57`, and the actual model is `gpt-6.1-sol`. Trial sources and unedited outputs are retained under build/002666a0-context-retry/. The table below is generated from those raw probe outputs.

The bank emits one byte fewer than the independently established retail extent. Its first differing byte is the output-address register at +0xCD. The copies after the first helper and the later Pathfinder receiver loads remain different, with nine relocation sites displaced from retail operands. The strict scoped byte gate fails for this target, with no unresolved callee. Reopening needs a compiler-visible value or assignment lifetime that reproduces the helper result copies while preserving the shared twelve-byte storage. The matched caller's POD float declarations, native scoped returns, a reference-return view, visible authentic helper bodies and the canonical data-only coordinate view did not provide that lifetime. An unchanged first divergence and no better measured quality refute the proposed source change.

## New context checked against retail

The target still has the generated dump row and is eligible under `tools/eligibility.py`. The neighbouring landed sources are `Rva00266590Apply.cpp`, `SiegeDeploySpecialPowerDeletingDestructor.cpp`, `AICommandInterfacePositionCommands.cpp` and `Rva00266EB0SiegeDeployBaseTransition.cpp`. Their actual source confirms the existing Object layout, receiver +8, module-data +4 and data byte +0x1DA; it supplies no new declaration that resolves the saved copy-scheduling blocker. The target retains its existing opaque owner and method names. The inspected Zero Hour SpecialPower sources have no SiegeDeploy or SiegeDocking body to port.

`Rva00239E00HordeContain.cpp` is an additional landed caller of both coordinate helpers. Its complete 603-byte retail body calls the first helper at RVA 0x00239F50 through ILT 0x000398B5 and then subtracts position floats from all three returned words. It calls the second helper at RVAs 0x00239FBF and 0x00239FD4 through ILT 0x00024726 and consumes the returned first and second words with FLD and FCHS. The independently decoded helpers copy every field at offsets 0, 4 and 8. The target's complete callers copy all three second-helper words into output storage. These observations establish three float fields for the first helper and two for the second independently of donor names or allocation sizes. The guarded second helper's third field is copied but has no independently decoded floating-point consumer in this audit, so its scalar interpretation remains an acceptance blocker. The float-POD trials follow the donor declaration as a hypothesis, not as proof for that third field. None of these observations proves a user-defined copy constructor, destructor or particular class key. The landed HordeContain source re-probes exactly modulo relocations at its verified extent; raw output is build/002666a0-context-retry/donor-caller.probe.log.

The bank's integer helper views preserve three raw words and claim no additional scalar interpretation. Trials preserve their established names, while testing float payloads and POD declarations from the verified caller. They do not improve the target. The shared canonical `game/Libraries/Include/Lib/Coord3D.h` is a data-only struct, whereas the bank includes the WWMath nontrivial class view. Both have the witnessed twelve-byte layout. A POD coordinate view and the same view with the matched caller's in-class position accessor worsen the result. Exact source-level lifetime reconciliation remains unresolved; no shared header is changed. Reopening the second payload's third-field interpretation requires its complete construction path or a complete consumer of that field.

## Boundaries, direct calls and indirect ABI

The target starts at RVA 0x002666A0, has its common epilogue at RVA 0x00266948, and ends after RET 16 at RVA 0x00266972. All 725 bytes decode and all direct branch destinations are instruction boundaries within that extent. INT3 follows the return. Raw instructions are in build/002666a0-context-retry/decode-002666a0.log and the checked inventory is in build/002666a0-context-retry/checked-002666a0.log.

The complete direct callee extents checked with `checked_callees.py` are 0x0008FFC0 (299 bytes), 0x001BEE60 (63), 0x001C7370 (220), 0x000D3EB0 (68), 0x002060B0 (61), 0x00206100 (61), 0x003E3B20 (406) and 0x003D8BC0 (96). Each has its own decode and checked log under build/002666a0-context-retry/. Every return and branch was inspected; the vector adjustment's final backward jump stays in its body. The helper copies return their supplied storage in EAX and pop the output pointer and index with RET 8. Both guarded and fallback paths write the complete triple. The caller's mask is three words, the status boolean is a byte, the adjustment takes three stack pointers and returns with RET 12, and the ground predicate returns AL and pops two stack words with RET 8.

The complete callers are RVA 0x00266F40 with 681 executable bytes and RVA 0x002672B0 with 650 bytes. The first ledger extent also includes alignment and a five-entry switch table. Each table destination was independently checked against decoded instruction starts. The actual target calls at RVAs 0x0026713F and 0x00267442 go through ILT 0x00020455. Their pushes establish, in callee order, hidden result storage, Object pointer, coordinate output pointer and boolean output pointer. Both use all three result words through EAX and consume the boolean as a byte. Their receiver adjustments are -0x10 and -0x20 from the respective interface views; the target receives the adjusted primary receiver. Raw caller instructions and route assertions are in build/002666a0-context-retry/decode-00266f40.log, build/002666a0-context-retry/decode-002672b0.log and build/002666a0-context-retry/routes-unwind.log.

The complete 162-byte module constructor at RVA 0x002062C0 installs vtable VA 0x010A626C at +0x20. Slot 2 goes through ILT 0x0003D6D6 to the complete 295-byte body at RVA 0x00206B40. That body consumes one ObjectID word, returns a signed index or -1 and pops four bytes on both returns; it adjusts the secondary receiver by -0x20 for its outgoing call. The target passes Object+0x74 and uses the signed-negative result test. This supports the existing opaque dock view without assigning a new semantic method name. All ten relevant thunk routes were read and asserted in build/002666a0-context-retry/routes-unwind.log.

## Exception state and generator checks

Retail handler VA 0x0100FC5E loads FuncInfo VA 0x011FED70 (RVA 0x00DFED70). Its one unwind state has predecessor -1 and cleanup VA 0x0100FC50. The complete fourteen-byte cleanup clears the local-static initialization guard at VA 0x012EFD38 and returns. The compiled bank has the same one-state cleanup, with the guard relocation bound to its local-static symbol. Raw sections and relocations are in build/002666a0-context-retry/compiled-unwind.log; retail data and instructions are in build/002666a0-context-retry/routes-unwind.log. There is no coordinate destructor or allocated-element cleanup in either map.

The EH generator was fed into a bounded `shape_search` with a stop-file check before every evaluator call. All measured choices retained the bank's bytes. Its preserved manifest is build/shape_search/c89a8d4b358041ec8b598047d27fef1c/result.json and its raw probes are build/002666a0-context-retry/eh-00.probe.log through build/002666a0-context-retry/eh-05.probe.log. The non-EH family generator emitted an invalid edit that moves `first.original` initialization after the indirect call. It was rejected before compilation because the call would read an uninitialized member pointer; raw generator output is build/002666a0-context-retry/family-generator.log. No tooling or baseline was changed.

Both visible copied helpers independently probe exact at 61 bytes, with the donor bodies marked inline and noinline so they do not introduce a second strong definition. Raw outputs are build/002666a0-context-retry/helper-copy-visible.probe.log and build/002666a0-context-retry/helper-point-visible.probe.log. Their presence still leaves the target unchanged. This rejects the stronger hypothesis that authentic callee visibility alone repairs its result lifetime.

## Measurements

| Trial | Emitted bytes | Differing non-relocation bytes | First difference | Quality |
| --- | ---: | ---: | --- | ---: |
| `baseline-raw.probe` | 724 | 294 | `+0xCD` | 0.5917 |
| `eh-00.probe` | 724 | 294 | `+0xCD` | 0.5917 |
| `eh-01.probe` | 724 | 294 | `+0xCD` | 0.5917 |
| `eh-02.probe` | 724 | 294 | `+0xCD` | 0.5917 |
| `eh-03.probe` | 724 | 294 | `+0xCD` | 0.5917 |
| `eh-04.probe` | 724 | 294 | `+0xCD` | 0.5917 |
| `eh-05.probe` | 724 | 294 | `+0xCD` | 0.5917 |
| `reference-output.probe` | 724 | 294 | `+0xCD` | 0.5917 |
| `base-assignment.probe` | 724 | 294 | `+0xCD` | 0.5917 |
| `native-scoped-results.probe` | 724 | 302 | `+0x17` | 0.5807 |
| `pod-helper-results.probe` | 724 | 302 | `+0x17` | 0.5807 |
| `native-common-scoped.probe` | 724 | 302 | `+0x17` | 0.5807 |
| `visible-shared-storage.probe` | 724 | 294 | `+0xCD` | 0.5917 |
| `pod-coordinate-storage.probe` | 758 | 567 | `+0x20` | 0.1269 |
| `pod-native-common.probe` | 758 | 569 | `+0x17` | 0.1241 |
| `coordinate-without-base.probe` | 724 | 294 | `+0xCD` | 0.5917 |
| `helper-word-assignment.probe` | 724 | 294 | `+0xCD` | 0.5917 |
| `float-pod-shared-storage.probe` | 724 | 294 | `+0xCD` | 0.5917 |
| `float-pod-scoped-results.probe` | 724 | 302 | `+0x17` | 0.5807 |
| `float-pod-assignment.probe` | 724 | 294 | `+0xCD` | 0.5917 |
| `pod-coordinate-position-accessor.probe` | 758 | 567 | `+0x20` | 0.1269 |
| `pod-native-position-accessor.probe` | 758 | 569 | `+0x17` | 0.1241 |
| `float-pod-position-accessor.probe` | 724 | 302 | `+0x17` | 0.5807 |

Quality is the repository's diagnostic byte-distance score with its size penalty. It is not an identity, ABI or strict relocation acceptance score. The relocation-masked differences are diagnostic lower bounds when relocation sites drift. Each table row corresponds to a complete preserved source and unedited probe log under build/002666a0-context-retry/; EH trial source snapshots are in the shape-search directory named above.

## Validation and retained work

CSV validation and pin consistency pass, with raw outputs in build/002666a0-context-retry/check-csv-final.log and build/002666a0-context-retry/pin-consistency.log. The class gate on the retained bank passes in build/002666a0-context-retry/class-gate.log. The scoped `build.verify_functions` byte gate fails 1/1 in build/002666a0-context-retry/scoped-gate.log. Its downstream REL32 reports arise from differing instruction offsets, not an independently established callee identity failure. No exact recovery or full gate is claimed. The file-pair invocation of `name_regression.py` does not apply to this revision-based tool and is retained as build/002666a0-context-retry/bank-name-regression.log; the bank is byte-for-byte unchanged. No bank became a source, and no new source requires a declared-unmatched check. All trial bodies remain outside game/.

The measured session ran from 2026-10-11 10:13:05 UTC to 2026-10-11 10:34:57 UTC, totaling 21.88 minutes through verdict recording. Exactly one blocked verdict is appended. No Git write was performed.
