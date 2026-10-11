# 009B1ED0 context retry

## Result

No source recovery is landed. The unchanged preferred body is `targets/game/reverse/attempts/0x009b1ed0.cpp`, with SHA-256 `481e849bef66df721058b24f79c458db6e7b6c133040642db1915e790a06ba59`. This run tested revision `ad954ac591f68d579480ba62016a39ed214e9345` using `gpt-6.1-sol`. Its measured elapsed time through preservation is 10.51 minutes. The new hypotheses do not improve the saved body, so this run records one blocked verdict and keeps the prior bank.

The complete trial sources, unedited probe output and measurement receipts are retained under `build/009b1ed0-context-retry/`. `measurements.json` derives the values below from the corresponding raw probe logs using `finish_measure.parse`. The original PowerShell-captured output is retained separately as `00-original-powershell-probe.log`; `00-original-probe.log` is a fresh subprocess byte capture. The first center-update probe's console-print encoding failed after its raw output was saved; that failure did not alter the compiler output or source.

| Trial | Compiled bytes | Differing bytes outside relocation slots | First difference | Diagnostic quality |
|---|---:|---:|---:|---:|
| 00-original | 699 | 110 | +0x08 | 0.8374 |
| 01-center-update | 699 | 110 | +0x08 | 0.8374 |
| 02-combined-entry | 699 | 116 | +0x0C | 0.8288 |
| 03-canonical-table | 699 | 110 | +0x08 | 0.8374 |

Every probe explicitly requests the independently decoded retail extent. The quality formula penalizes both differing bytes and size error. The retained body remains shorter than retail and has a misaligned entry DIR32 operand. Diagnostic quality does not establish relocation correctness, identity or ABI. The strict candidate-only scoped byte gate fails in `build/009b1ed0-context-retry/scoped-byte-gate.log`; its baseline verification passes. No unrelated gate failure prevents this result. No shared header, shim, pin, live ledger row or production source changed, so no full gate was required.

## Complete boundary and ABI review

`build/009b1ed0-context-retry/retail-disassembly.log` decodes all 231 instructions from the target through its sole plain return at +0x2BC. The exclusive endpoint is 0x9b218d, followed by INT3 padding. `boundary-audit.json` verifies all 37 branch targets are aligned instructions within the extent. There are no direct calls, indirect calls, outgoing conditional branches, tail jumps, exception states, ownership cleanups or container helpers. The independent checked-callees output is `checked-callees-raw.log` in the same build directory. The repository eligibility predicate identifies the current row as an open generated dump, not a retired extent.

Entry-relative stack reads establish the minimum view: info at +4, source at +8, destination at +0xC, stride at +0x10, selector at +0x14, threshold pointer at +0x18 and variance at +0x1C. The info access is a signed dword at +8, compared with 100 before a subtract-by-100 override. Source samples are zero-extended bytes. Thresholds are dword loads and their subsequent comparisons are signed. Variance comparisons are unsigned. Stride arithmetic has dword width but does not independently prove native signedness. The decoded body does not consume an incoming receiver or write hidden return storage, preserves the four saved registers, and returns without argument cleanup. A void C entry with the inherited address identity `_rva009B1ED0` remains a reconstruction view; no complete caller proves unused argument count or return type.

`incoming-screen.log` and `incoming-screen.json` find no raw E8/E9 target hits in executable PE sections and no literal pointer to this body in the image. These are screening observations only. They do not prove the absence of computed indirect callers. No new owner or native symbol is established, and no existing descriptive bank name is changed.

## New context and hypotheses

Current ledger and pin searches reconfirm the landed CPU installer at 0x009B0D60 and the newer progressive plane filter at 0x009B2530. Their actual C++ sources were inspected. The latter's context also has a signed filter-level dword at +8, independently agreeing with this target's own access, but its six-argument callbacks do not establish this leaf's seven-slot ABI. The installer names other scalar dispatch kernels and gives no identity to this body. There is no new callee to bind because this target is a leaf. The neighbouring VP6 sources add context, but address none of the earlier unresolved code-generation blockers.

The actual `BfmeConv9C2320.cpp` definition has the canonical C-linkage signed dword array `Vp6FilterEdgeTagTable[64]`. The existing DIR32 record binds `_Vp6FilterEdgeTagTable` to retail VA 0x012D8158, the address decoded in the target's entry load. Trial 03 uses that complete declaration rather than the bank's incomplete array declaration. Its refutation condition is unchanged emitted instructions; the probe reproduces the original result exactly. No new pin or literal image address is added to source.

Trial 01 tests whether compound updates to `center` before its signed shift retain retail's ESI accumulator and separate EAX clamp result. Retail's `imul esi,ebx`, signed shift and move to EAX support this lifetime hypothesis. Its refutation condition is an unchanged tail. The measured object retains the bank's `imul ebx,esi` and EBX byte clamp, so this hypothesis is rejected.

Trial 02 puts the threshold and edge-tag values into one declaration with the threshold first, testing whether the initializer sequence creates the decoded threshold-before-global dependency. Retail loads the threshold through ECX, then consumes the selector in the EAX global load before spilling that value. The observation that refutes the trial is retained load reordering or a worse distance. The emitted global load still precedes the actual threshold dereference, and the result is worse than the bank. Both unchanged allocation outcomes are preserved, and no further unchanged register experiment is run.

`shape_family_levers.choices_for` generated the retained `family-choices.json`. Its choices affect already-matching gather stores or generate an invalid frame transformation from the comma declaration. None addresses the first entry divergence. They are not treated as evidence for changing the body. The filtered finite search therefore contains only the baseline; `finite-search.json`, `finite-search.log` and `finite-baseline-probe.log` preserve that verification. The unmeasured sources numbered 04 through 07 are exploratory spellings, not tested or rejected hypotheses. No external source twin was obtained or used.

## Remaining blocker and reopening condition

The first byte difference remains +0x08 in the entry load schedule, with one misaligned global relocation operand. The final arithmetic begins diverging at +0x243: retail consumes the center in ESI and routes the clamped byte through EAX; the bank consumes EBX and stores BL, changing the subsequent tail offsets and total extent. The complete weight loop remains reproduced. The blocker is `codegen-order/table-load-and-final-clamp`, not an unknown type or a missing callee pin.

Reopen with a verified source twin, a complete caller that adds an ABI constraint, or a new source-level dependency that specifically explains these two regions. Repeating compound center updates, the complete table extent or the combined initializer declaration is not justified by these measurements. The current run does not repeat the earlier pointer, volatile, helper, accumulator-width or compiler-flag searches.
