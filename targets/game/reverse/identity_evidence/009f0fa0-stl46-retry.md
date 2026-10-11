# 0x009F0FA0 STLport 4.6 retry

This retry does not recover an exact body. The existing `targets/game/reverse/attempts/0x009f0fa0.cpp` remains the preferred reconstruction and is unchanged. The tested revision is `00675ef0bc7920d0d81c41d2a65690e21da11142`, and the model is `gpt-6.1-sol`. All trial sources, compiler objects and raw outputs are retained under `build/009f0fa0-layout-retry/`. The diagnostic measurement and every remaining masked difference offset are computed in `build/009f0fa0-layout-retry/measurement.json`; they are not strict byte acceptance.

## Hypotheses and current context

The assignment proposed that newly landed receiver layouts or callee declarations could address the previous STL and register-allocation blockers. A streaming comparison with the previous attempt's tested revision, `b57be48c295c3d8041151f86e5eafc2eabeb2197`, finds the relevant function rows and pins unchanged. The compared addresses cover the target, its landed neighbours, the queue helpers, the actual set insertion and destruction routes, the lock release and `AssetManagerImpl::AddRequiredAssets`. The raw comparison is `build/009f0fa0-layout-retry/context-diff.log`. The neighbouring source files and STLport deque header also have no intervening commits in that revision interval. There is no new declaration or layout evidence that removes an earlier blocker.

The new computation hypothesis was that signed iterator distance, or placing the last-index decrement inside one iterator segment, would preserve retail's separate node-count decrement. STLport 4.6 exposes signed iterator distance while `deque::size()` returns an unsigned size. A closer measured target body, with the separate decrement at the retail instruction offset, would support this hypothesis. Unchanged or worse output refutes it. Both outcomes occurred, and no trial improves the bank.

The new helper-visibility hypothesis was that exposing the complete STLport subscript or pop implementation would change receiver or result liveness around the two subscript calls and the pop. The trial definitions are inline and explicitly noinline, so they do not introduce another strong definition. Unchanged target output refutes this hypothesis. Each trial retains the bank's mismatch count and offsets. These are helper-visibility experiments, not evidence for a new helper identity.

## Complete boundary, values and ABI

`build/009f0fa0-layout-retry/retail-decodes.log` retains complete decodes of the target and the helpers used below, including every return and direct outgoing branch. The fifteen corresponding `checked-XXXXXXXX.log` files retain successful checked callee inventories. No direct branch leaves those body extents. The separately decoded five-byte routing thunks have their external jumps recorded and are not claimed as functions.

The target has 1198 executable bytes ending in `ret 4` at RVA `0x009F144B`. Its two padding bytes and seven-entry switch table complete the ledger's 1228-byte extent. Every switch entry lands on a decoded instruction inside the body; all direct branches remain inside the executable extent. The probe warning at the table endpoint is a linear decode of data, not a shortened epilogue. The complete caller at `0x009EB8A0` preserves its receiver as the one stacked object pointer, loads ECX from the existing registry global, and calls the target at `0x009EB8BE`. This agrees with the bank's existing opaque thiscall declaration and four-byte argument cleanup. No owner or method name is changed.

The actual set insert route is `0x000065AA` to `0x001408C0` to `0x00030413` to `0x0013FA60`, which calls `0x00048478` and then `0x0013F760`. The complete final helper reads one dword from the value reference and writes one dword at node offset `+0x10` on both construction paths. The other writes establish links at `+4`, `+8` and `+0xC`; there is no additional payload field. The helper returns an iterator through hidden storage and pops twenty bytes for that storage and four explicit arguments. The insert-unique and set-forwarding bodies each pop eight bytes and copy the iterator and success byte to hidden result storage. The tree lookup at `0x009EC290` compares the unsigned dword at node `+0x10`, returns through hidden iterator storage, and pops eight bytes on both returns. These observations establish a single unsigned four-byte key representation. They do not decide whether the nominal key is a pointer, integer handle or another four-byte value. The existing `Rva001408C0Target *` spelling is retained without a new semantic type claim.

The complete push helper at `0x009EF0D0` reads exactly one dword from its reference argument and writes it to the element slot, retaining that value across allocation. In the complete `0x009EFBF0` caller, this value is the object pointer whose flags at `+4` were just read and written. Thus the deque payload is independently established as an object pointer, rather than inferred from an integer-template donor or the block allocation size. The helper pops four bytes. The complete subscript at `0x009EF060` copies all four iterator fields, calls the complete signed advance helper at `0x009ED4A0`, and returns the element-slot address in EAX with `ret 4`. Advance handles same-block and positive and negative cross-block offsets with a four-byte element stride. The complete pop at `0x009ED8A0` has two returns, no stacked argument and no element or pointee destructor. Its cross-block path frees the old block and updates the finish iterator.

`build/009f0fa0-layout-retry/object-inspect.log` retains the emitted helper bodies from the pointer-valued STLport 4.6 instantiations. Subscript, signed advance, pop and push have matching extents and no differences outside relocation operands. This is an additional template-shape check, not a strict relocation or nominal identity certificate. No pins or other helpers' ledger rows are changed.

## Cleanup and indirect calls

`build/009f0fa0-layout-retry/eh-target.log` maps all three retail unwind states. State 0 has predecessor -1 and destroys the local wrapper at `[ebp-0x20]`; state 1 has predecessor 0 and releases the lock at `[ebp+4]`; state 2 has predecessor -1 and releases the final lock at `[ebp-0x28]`. The emitted object's map has the same predecessor states and receiver offsets. `build/009f0fa0-layout-retry/final-measurement.log` decodes the emitted wrapper destructor's tail jump to the canonical tree destructor and the lock destructor's pointer load and `LeaveCriticalSection` import call.

The retail wrapper constructor route `0x0002FB80` to `0x00143B20` writes its header and count, zero at wrapper `+0xC`, and a byte one at `+0x10`. Cleanup follows `0x0000E746` to `0x00141CC0` to `0x00015D7A` to the complete tree destructor at `0x00140950`. The destructor's erase route reaches the complete `0x00134AA0` body, which visits the right subtree recursively and the left subtree iteratively, frees nodes and calls no payload destructor or pointee deletion. The separately decoded `0x009ECAC0` cleanup reads the lock pointer at receiver offset zero, passes it to the import, and returns without a stacked argument. This agrees with the proposed ownership. The initial direct lock has no automatic cleanup, including on the retail early-return path.

The target's element virtual calls use the element receiver without adjustment. Slot zero supplies a pointer consumed as a narrow string; slot `+0x10` receives the local wrapper address; slot `+0x38` supplies the dword accumulated at receiver `+0x20`. The debug receiver and stream chain use the slot offsets already declared in the bank. Runtime implementation identities and return widths of unused virtual results remain unresolved. This retry does not certify those indirect declarations as complete canonical interfaces.

## Measurements and rejected experiments

Every target probe explicitly requests the verified 1228-byte retail extent. Trial names below also name the retained `.cpp` and raw `.log` files under `build/009f0fa0-layout-retry/`.

| Trial | Emitted bytes | Masked differing bytes | Outcome |
|---|---:|---:|---|
| `00-original-raw` (source `00-original.cpp`) | 1228 | 145 | Reproduces the existing bank. |
| `01-iterator-distance` | 1288 | 719 | Returned iterator temporaries enlarge the frame and worsen the body. |
| `03-native-signed` | 1236 | 607 | Direct exposed iterator fields introduce reloads and the old register exchange. |
| `04-visible-subscript` | 1228 | 145 | No improvement. |
| `05-visible-pop` | 1228 | 145 | No improvement. |
| `06-native-signed-count` | 1228 | 145 | A signed native count accessor does not prevent the arithmetic fold. |
| `07-last-head` | 1228 | 145 | Putting the decrement in the head segment does not prevent the fold. |
| `08-last-tail` | 1228 | 145 | Putting the decrement in the tail segment does not prevent the fold. |
| `09-nodecount-locals` | 1228 | 455 | Explicit node, head and tail locals worsen the body. |

The finite exception search has no improvement; its raw receipt is `build/009f0fa0-layout-retry/eh-search-fixed.log`, and its retained sources and result are under `build/shape_search/0ca45c2ba6b648ea91ae19d9dff8fd68/`. The initial search invocation failed because PowerShell wrote its choices as UTF-16; that diagnostic is preserved in `build/009f0fa0-layout-retry/eh-search.log`. It is not a compiler measurement. The non-EH generator's complete applicable choices are retained in `build/009f0fa0-layout-retry/all-family-choices.log`. They only reorder an unused wrapper constructor and respell the already matching queue-eight wait loop, so they supply no additional hypothesis for the first computation divergence. The unprobed `02-iterator-distance-post.cpp` is retained preparation, not a measured result.

## Verdict and reopening condition

The preferred body still has its first masked byte difference at `+0x204`, a branch displacement. Its first computation difference is `+0x2A1`. Retail decrements the node difference before shifting; the candidate folds that decrement and the final index decrement into a `lea` displacement of `-0x21`. Copy/pop scheduling and later switch scratch registers also differ, and twelve relocation sites do not align with retail operands. The saved diagnostic quality is reproduced, not increased.

The strict supplied-row byte gate fails in `build/009f0fa0-layout-retry/scoped-byte-gate.log`, with the body mismatch and the unresolved pointer-valued subscript and pop names. The supplied row exists only in the scratch driver; the tracked ledger is unchanged. `check_csv.py` and `pin_consistency.py --check` pass, with raw outputs in `build/009f0fa0-layout-retry/check-csv-final.log` and `build/009f0fa0-layout-retry/pin-consistency.log`. No shared header or authored game source changes, so this retry requires no full gate.

Reopen only for independently verified new declarations or helper visibility that the above trials did not test, or a justified arithmetic expression that reproduces the separate node decrement and improves the target measurement. Repeating the signed-count, segment-decrement or visible subscript/pop experiments does not provide a new hypothesis. The existing bank and all experiment artifacts remain available for collection.
