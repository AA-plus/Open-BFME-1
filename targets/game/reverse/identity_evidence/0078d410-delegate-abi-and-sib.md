# 0x0078D410: exact delegate recovery and SIB selection

The recovery in game/GameEngineDevice/Source/W3DDevice/GameClient/GUI/W3DGameWinDefaultDraw0078D410.cpp reproduces the complete 557-byte retail body. Its emitted symbol is `?W3DGameWinDefaultDraw0078D410@Rva0078D410Delegate@@UAEXPAVGameWindow@@PAVWinInstanceData@@@Z`. The original bank has one differing byte at +0x8A: retail 08 versus compiled 01 in the instruction at +0x88. Moving the complete image-coordinate and drawing block into a static forced inline helper with reference parameters selects retail's `lea edi,[eax+ecx]`. All other instructions and all 19 relocation sites are preserved. The strict resolved comparison is exact, with no unresolved symbol and no library masking, in build/78d410-run2/final-abi-and-strict.log and final-strict-measurement.json. The scoped byte gate passes in build/78d410-run2/final-scoped-gate.log.

The tested revision is 9434acd25444f3f36f67473dee9c5b33de1280ba. The actual model is gpt-6.1-sol. Raw probe outputs, immutable trial sources, objects, relocation tables and timestamped command receipts are retained under build/78d410-run2/. The original first-run evidence is preserved as first-run-evidence.md there; its raw decodes remain under build/78d410-worker/. build/verdict.txt records each hypothesis before the measurement. The single existing uncommitted verdict row is updated in place; this continuation adds no second row.

## Boundary and direct callee ABI

The complete target decode is in build/78d410-worker/audit.log. Its only return is `ret 8` at +0x22A, ending at +0x22D. INT3 padding follows. Every conditional and unconditional branch targets an instruction start within the extent, and no tail jump leaves it. The fresh checked_callees result is in build/78d410-run2/target-checked.log. The strict measurement independently asserts the complete emitted extent rather than accepting a truncated ledger size.

Direct calls reach ILT RVAs 0x0002F94B, 0x00036EBC and 0x00023DDA. Their complete decoded jumps reach bodies 0x004781D0, 0x004782A0 and 0x00478480. The complete accessor and 117-byte __ftol2 decodes are in build/78d410-worker/audit.log, with individual checked_callees outputs in accessor-screen-checked.log, accessor-size-checked.log, accessor-status-checked.log and ftol2-checked.log. The screen-position accessor reads four-byte signed coordinates at receiver +0x14 and +0x18, follows the parent at +0x200 and accumulates each parent's coordinates into the two four-byte output pointers. It uses ECX and returns with `ret 8`. The size accessor writes receiver +0x0C and +0x10 through its output pointers and returns with `ret 8`; its null-argument path returns -3 and is inside the reviewed extent. The status accessor is the complete `mov eax,[ecx+8]; ret` body. __ftol2 consumes ST(0), returns EDX:EAX and uses a plain return; the target uses EAX for its four integer coordinate conversions.

The body-RVA oracle confirms the existing screen-position and size decorations. It contradicts the bank's nonconst status decoration and confirms `?winGetStatus@GameWindow@@QBEIXZ`. The final source declares the const accessor. A single new body pin at 0x00478480 supplies this independently established decoration; the resolver derives its actual ILT encoding automatically. Raw oracle and complete status/thunk evidence is in build/78d410-run2/oracle-and-pin.log. Pin preflight is in const-status-prepin.log, and the added pin passes const-status-postpin.log. Existing pins and shared declarations remain unchanged. The pre-pin strict gate reports only the missing const status binding in final-prepin-scoped-gate.log; adding the evidenced binding resolves it.

## Delegate identity and incoming ABI

Retail vtable VA 0x01126DA0 has slot 1 pointing to VA 0x004137F5. The complete five-byte ILT entry at RVA 0x000137F5 jumps to this target. Constructor 0x0078D1C0 installs that table. The complete host constructor at 0x0078D270 constructs the embedded object at host +0x218. Raw evidence is in build/78d410-worker/target-vtable.log, owner-and-caller-decode.log, host-constructor-decode.log, ctor-checked.log and host-constructor-checked.log.

The complete matched caller 0x00799FA0 invokes slot +4 on two fallback paths at +0x3F and +0xA9. Each loads the vptr from window +0x218, sets ECX to that embedded delegate, pushes instData and window in that order, and calls the slot without caller cleanup. Its separate free callback at window +0x1E8 uses caller cleanup of eight bytes. The target consumes the two stack pointers and ignores incoming ECX, so an unused-receiver thiscall member describes the observed delegate call. No hidden return storage is passed and no returned value is used. The declaration includes the preceding unknown slot so its recovered method occupies slot 1. Raw evidence is in build/78d410-worker/owner-and-caller-decode.log and grid-caller-checked.log.

The Zero Hour W3DGameWinDefaultDraw body is a source donor for the drawing statements, not proof of a BFME free-function identity. The body-RVA oracle contradicts the bank's stdcall free-function decoration and the donor's cdecl decoration. The original delegate owner and original method name remain unknown. The recovery uses the address-derived owner Rva0078D410Delegate and preserves the bank's descriptive word with an address suffix, W3DGameWinDefaultDraw0078D410. The oracle classifies the final decoration as a placeholder; no guessed original identity or name-correction exemption is claimed. Raw results are in build/78d410-run2/oracle-and-pin.log and final-abi-and-strict.log.

## Fields and indirect calls

The target reads image and color data at window +0x48, +0xB4 and +0x120 and their following color words, instance state at +0x08, coordinate offsets at +0x17C and +0x180, and an opaque pointer at +0x1A4. Signed `fild` loads and four-byte output stores support the signed coordinate widths. The field oracle identifies +0x1A4 as m_videoBuffer in build/78d410-run2/field-oracle.log. The bank's layouts are kept as translation-unit views of these decoded fields. No STL value, constructor, owned allocation or unwind cleanup is reconstructed by this body.

The W3DGameWindowManager table installed at VA 0x01126ED0 routes slots +0xF4, +0xF8 and +0xFC through complete decoded thunks to 0x00479E60, 0x00479ED0 and 0x00479F60. The complete wrappers return with `ret 0x18`; their argument loads agree with the target's six four-byte slots, including integer coordinates, four-byte color and four-byte border width. Their incoming receiver is unused. All three extents pass checked_callees. Raw evidence is in build/78d410-worker/drawing-helpers-decode.log and image-helper-checked.log, fill-helper-checked.log and open-helper-checked.log.

The display table installed at VA 0x0111EDD0 routes slot +0xE0 through ILT 0x0001680B to 0x006EA360. The complete 425-byte body is retained in build/78d410-worker/display-slot-decode.log and passes display-slot-checked.log. It reads the four coordinate argument slots with `fld` and returns with `ret 0x18` on both paths. It also reads the object at +0x28, +0x40, +0x0C and +0x10 and calls its virtual slot +0x28. The reference Display interface uses integer coordinates and is incompatible with these retail instructions, so the final translation-unit slot view uses Real coordinates. The existing callee row names this implementation drawImage, while the donor and bank call their role drawVideoBuffer. Those names do not prove the payload's original class. The final m_videoBuffer field and corresponding slot argument use void pointers; no VideoBuffer or Image payload layout or ownership is asserted. The inherited slot name is retained only as the bank's descriptive role. The helper's internal EH and payload cleanup are outside this recovery and are not used as type or ownership evidence.

## Compiler experiments

Every earlier target verdict and saved reconstruction was reviewed. The fresh retrieved records are in build/78d410-run2/history.log. Already recorded operand reversal, local ordering, scalarization, aggregate copying, processor targets, compiler flags and generated SIB spellings were excluded. The first-run unused-receiver and mutable aggregate-initialization trials are retained in build/78d410-worker/ and were not repeated.

The continuation tests the real member-access graph, donor inline declarations, coordinate alias views and reference lifetimes, native accessor visibility, native getter definition position, image-selection joins, switch and guard forms, and inlining the complete image drawing block. Each hypothesis and its refutation condition is written to build/verdict.txt before compilation. Probe logs are unedited. Counts for regressed trials are diagnostic masked comparisons, including missing or extra bytes; exact acceptance uses the strict repository gate.

| Trial | Emitted bytes | Diagnostic differing or missing bytes |
|---|---:|---:|
| 00-bank | 557 | 1 |
| 03-nested-instance | 557 | 1 |
| 04-native-inline-declarations | 557 | 1 |
| 05-coordinate-array-view | 557 | 1 |
| 06-offset-aggregate-reference | 557 | 1 |
| 07-immutable-coordinate-results | 557 | 1 |
| 08-visible-screen-position | 568 | 408 |
| 09-visible-size | 557 | 36 |
| 10-visible-status | 557 | 1 |
| 11-all-accessors-visible | 562 | 400 |
| 12-inline-getters-after-caller | 557 | 1 |
| 13-inline-getters-before-caller | 557 | 1 |
| 14-forceinline-native-getters | 557 | 1 |
| 15-conditional-image-selection | 557 | 1 |
| 16-enabled-state-switch | 557 | 27 |
| 17-image-break-block | 557 | 1 |
| 18-null-image-goto | 557 | 1 |
| 19-inline-image-reference-helper | 557 | 0 |
| 20-inline-image-value-helper | 566 | 385 |
| 21-inline-image-reversed-bindings | 557 | 0 |
| 22-final-source | 557 | 0 |
| 23-opaque-payload-abi | 557 | 0 |

Trial 19 passes coordinate aggregates by reference to a static forced inline helper and is exact. Trial 20 passes them by value and regresses. Trial 21 reverses the reference binding order and is also exact. The final source follows trial 19. The helper has no retail body and folds into the caller; its definition has an absent-from-retail marker. The original EA comments from inputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/GameEngineDevice/Source/W3DDevice/GameClient/GUI/W3DGameWindow.cpp accompany their corresponding statements, including separators and end comments. The automated comment inventory has no missing donor comment in build/78d410-run2/donor-comment-check.json.

## Landing checks

Strict resolved equality, relocation resolution, float constants, recorded DIR32 globals and global consistency pass in build/78d410-run2/final-abi-and-strict.log. Class preflight passes in class-gate.log and the member oracle reports no new conflict in member-oracle.log. The source-to-source core of the repository name-regression checker reports no regression in final-abi-and-strict.log. Its command-line entry point accepts Git revisions rather than file paths; the brief's file-path command therefore fails in name-preservation.log, and the coordinator must run the staged snapshot check with its normal hooks. No Git write is attempted in this seat.

The add_match command, final source-scoped byte gate, ledger integrity, declaration and global pin-consistency results are retained in their corresponding add-match.log, final-build-bash.log, check-csv-final.log, declarations-final.log and pin-consistency-final.log files under build/78d410-run2/. A full gate is not required because no header, shim, tooling or baseline changes. The exact conversion and bank deletion are left uncommitted for coordinator staging. If check_csv refuses the unstaged transaction, its raw failure is retained and the exact working-tree conversion remains intact as directed.

Measured active work is 46.56 minutes across the initial run and this continuation (28.62 minutes in the continuation). Timestamp sources are build/worker-runs/20261013-123524/worker-run.json and build/78d410-run2/handoff-receipt.json. The initial run uses its complete process start and end timestamps, including its final preservation checks. The preferred bank is retired by the verified add_match transaction, and its exact original bytes remain in build/78d410-run2/bank-before.cpp. The CSV integrity check ends only at the unstaged missing bank in check-csv-final.log; declaration and pin checks pass. The staged revision-based name-regression hook remains for coordinator collection.

The final preservation audit passes in build/78d410-run2/preservation-check-pass.log. Only the assigned ledger row changes; the tombstone and const pin are additive, the pin retains CRLF, all unrelated bytes retain their existing line endings, and every earlier attempt record is unchanged. No background task remains from this worker.
