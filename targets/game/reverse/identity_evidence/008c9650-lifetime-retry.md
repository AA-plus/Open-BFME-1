# Numeric conversion lifetime retry at 0x008C9650

The retry did not improve the preferred reconstruction. The bank at targets/game/reverse/attempts/0x008c9650.cpp remains byte-for-byte unchanged. The strict scoped comparison fails, and the first unwind cleanup still addresses the wrong local slot. No source was promoted into game/ and no target ledger or pin was changed.

## Revision and hypothesis

This run tests revision 9e3be919b10ae956e3c8a13995e0d62f2be1d016 with model gpt-6.1-sol. All five earlier verdicts, the preferred bank and the immutable historical sources were inspected. The target remains eligible dump work according to tools/eligibility.py. The actual neighbouring sources, scalar constructors, string conversion helpers and current symbols were read before source trials.

A comparison with the previous evidence revision finds one new declaration in the neighbouring string handler: the deallocator pointer now uses g_rva01337A30AllocPair. Its pointer and free-slot layout agree with the old bank's view. A complete trial using this canonical declaration emits the same target shape. The current scalar layouts and callee contracts address no outstanding frame or register blocker beyond the preceding retry.

The first new lifetime hypothesis keeps a separate integer length live for the exponent bounds test while retaining the loop's repeated member read. Retail reads length into EDI at +0x1E3 and +0x272, and uses it with the next index at +0x22C. This trial restores the larger frame but worsens the byte comparison and produces an extra cleanup block. Its measured result refutes this source shape as a closer recovery.

The second hypothesis removes the artificial two-parameter inline validation call and expresses the same validation directly in the handler with scoped string cleanup. Retail contains the validation instructions inline and keeps its first string in a caller local, which motivates this test. The initial trial leaves a field predicate out of line. Forcing the observed field accessor inlining reproduces the original bank's instruction result, including its smaller frame. This refutes flattening the validation as the missing lifetime lever.

A visible noinline copy of the complete six-byte SWF getter also leaves the target unchanged. The first copy used an unsigned global declaration; it was corrected to the donor's canonical static int declaration and measured again. Neither scratch copy is banked. The old cached-length source was extracted byte-for-byte from immutable JSON and measured under its actual one-argument symbol. It reproduces the reported near instruction shape and the much worse byte distance. Its declaration is superseded by the independently verified two-argument dispatch ABI.

## Measurements

Each row is one measured probe (n=1) at the complete retail extent. Difference counts and diagnostic quality are parsed from the unedited probe logs with tools/finish_measure.py. Instruction shape normalizes registers and constants and cannot establish equality. All raw logs in this table are under build/worker-008c9650-20261011/. The corresponding complete source snapshots and compiler evidence are retained there and under build/experiments/.

| Raw log | Compiled bytes | Non-relocation differences | Diagnostic quality | Instruction shape |
| --- | ---: | ---: | ---: | ---: |
| probe-original.log | 1278 | 553 | 0.5360 | 0.969 |
| probe-length-exponent-live.log | 1327 | 1066 | 0.1472 | 0.975 |
| probe-visible-getter.log | 1278 | 553 | 0.5360 | 0.969 |
| probe-visible-getter-canonical.log | 1278 | 553 | 0.5360 | 0.969 |
| probe-direct-validation.log | 1242 | 1032 | 0.1135 | 0.920 |
| probe-direct-validation-forced.log | 1278 | 553 | 0.5360 | 0.969 |
| probe-historical-shape.log | 1295 | 1056 | 0.1764 | 0.997 |
| probe-canonical-pool.log | 1278 | 553 | 0.5360 | 0.969 |

The preferred bank's raw strict gate is build/worker-008c9650-20261011/original-bank-gate.log; original-bank-gate.json retains every difference offset. The gate resolves actual REL32 targets and reports no unresolved symbol. Its first difference is at +0x17, where the local frame differs. The bank also omits the state reloads at +0x27F, +0x2A9 and +0x4C7, and the separately emitted replacement stores at +0x2E0 through +0x2F5. The bank's byte-derived quality stays at its existing measured value.

## Boundary, ABI and payload checks

build/worker-008c9650-20261011/complete-evidence.log records complete code decodes, return paths, outgoing branches, indirect transfers, validated switch targets, dispatch-table bytes and CRT import identities. The retail-code-*.txt files retain complete decoded instructions. The target's plain RET is at +0x517, followed by padding and the next prologue at +0x520. Every conditional target lies on an instruction boundary inside the target; there is no outgoing direct tail jump.

The complete dispatcher at 0x008CCED0 reaches this body through opcode 0x4A. At +0xB9 it pushes its context address, at +0xBA it pushes its unchanged interpreter pointer, and at +0xC5 it cleans eight bytes. The target reads its first stack argument and does not adjust a receiver, consume its second argument or use hidden return storage. The address-qualified stackNumber008C9650 name and two-pointer cdecl declaration remain appropriate. No original owner identity is claimed.

Complete scalar constructor decodes prove flags at +4 and a single four-byte payload at +8. The float path receives ST0 from toNumber; the integer path receives EAX from toInteger. Complete pool-link helpers write the prior head pointer into that same +8 slot. This establishes the scalar/pointer unions independently of allocation size. The root pool reads capacity +0, count +4 and the item array +8. Vtable slots +0 and +4 reach the completely decoded retain and release methods; release's indirect tail at +0x75 reaches the scalar link helper through slot +8. No STL type is inferred.

getName's complete executable range is 1740 bytes, followed by its jump table and tag map. toInteger and toNumber likewise have separate executable ranges and inline switch data. The initial whole-ledger-extent checks refuse linear decoding through these tables; code-only checked_callees runs pass, and every table target and map index is independently validated. The integer pool-link ledger row has size 13, which cuts its six-byte store. Its complete decoded body is 15 bytes through RET at +0xE. The corrected read-only check passes; the unrelated ledger row is left untouched.

getName uses ECX and one output pointer with RET 4. find0089FF80 uses ECX, a character pointer and signed start index with RET 8. strtol and isdigit are independently resolved through the PE import table to MSVCR71.dll, and their argument widths and caller cleanup agree with the target. toInteger's float arm tail-jumps into the completely decoded 117-byte __ftol2 body. Its EDX:EAX result supplies the caller's integer low word; toNumber returns through ST0. checked-target.log and the checked-*.log files retain the inventories and the tail-jump check.

## Unwind and stopping condition

The target's two unwind states both return to state -1. Retail cleanup 0x00C59EF0 destroys the first string at [ebp-0x20], and cleanup 0x00C59EF8 destroys the later string at [ebp-0x14]. Both complete actions tail-jump to the 22-byte refcount destructor at 0x00891B80. The bank uses the same destructor shape and state transitions, but its first action uses [ebp+4]. The raw scoped gate retains both object and retail cleanup decodes. This offset remains a required blocker even if an instruction-shape metric looks close.

The earlier EH and finite family searches are already exhausted in the attempt history. This run retains fresh eh_levers output in eh-choices.log and does not repeat those unchanged searches. The new lifetime shapes and the current declaration correction do not improve the bank, so the retry hypothesis is refuted. Reopening requires independent native lifetime or aliasing evidence that retains the per-iteration length in a saved register, preserves the incoming state argument and places the first string at the retail offset. A further unchanged register spelling supplies none of that evidence.

Pin consistency and the existing bank's class gate pass in final-pin-consistency.log and final-class-gate.log. check-csv-initial.log records the initial ledger check; final validation is retained in check-csv-final.log. An evidence-only blocked verdict needs no full gate. All work remains local and uncommitted.
