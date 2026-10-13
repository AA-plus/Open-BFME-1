# Finish audit of RVA 0x009F4900

The preferred bank remains unchanged. No source recovery, ledger replacement, pin, shared declaration or generated assembly was landed. This run starts from revision `86113c355e41e3a2ec27f9b1aafa626d55990e8b` and uses `gpt-6.1-sol`. The current dump row is still open according to `tools/eligibility.py`; the eligibility receipt is `build/009f4900-finish/eligibility.json`. All seven earlier target verdicts and both immutable saved bodies were inspected before trials.

## Result and exact remaining differences

The saved body emits the complete 225 bytes and reproduces 35 non-relocation differences. A strict `build.compile_function` comparison independently produces the same difference set after resolving every call, with no unresolved symbol and no masked fallback. The ordinary selected-row function verifier rejects the candidate. Its raw output is `build/009f4900-finish/bank-official-gate.log`; the resolved bytes, object hash, call bindings and exact offsets are in `build/009f4900-finish/bank-strict-gate.log`. The original bank snapshot and COFF object are `build/009f4900-finish/000-bank.cpp` and `build/009f4900-finish/000-bank.obj`.

The exact mismatch offsets are +0x03, +0x04, +0x05, +0x06, +0x07, +0x09, +0x0B, +0x12, +0x17, +0x1C, +0x1E, +0x21, +0x2C, +0x3D, +0x45, +0x59, +0x5C, +0x6A, +0x6C, +0x73, +0x78, +0x82, +0x83, +0x84, +0x85, +0x86, +0x87, +0x88, +0x89, +0x8A, +0x8B, +0x8C, +0x8D, +0x8E and +0x8F. `build/009f4900-finish/remaining-differences.json` associates every offset with its complete retail instruction and all overlapping compiled instructions.

At +0x03 through +0x07, retail loads the node into ESI before saving EDI; the bank saves EDI first and loads the node into EDI from the corresponding adjusted stack offset. At +0x08 the receiver moves to EDI in retail and ESI in the bank. The first returned view lives in EBP in retail and EBX in the bank; the second lives in EBX in retail and EDI in the bank. These changing homes account for the remaining isolated operand differences through +0x78. The output28 pointer remains EBP in both streams. The physical float addresses, operand order, immediate argument stores and all four call positions remain the same.

At +0x82, retail XORs the fourth return against the memory output, ORs it into ESI, loads the difference-output pointer into EAX, stores ESI, branches on the OR flags and copies ESI to EAX. The bank loads that memory value into ESI, loads the difference-output pointer into ECX, XORs in EAX, ORs with its EBX accumulator, stores EAX and then branches. The complete suffix beginning at +0x90 is byte-identical, including the mask operations and RET 16. These are specific allocation and scheduling differences, rather than a changed field offset, arithmetic width, direct-call route or boundary.

## Boundary, calls and declaration evidence

The complete target ends with RET 16 at +0xDE; INT3 padding follows its endpoint. All conditional branch destinations stay inside the target and converge on the same epilogue. There is no external tail jump, exception registration, cleanup funclet, constructor, container operation or ownership transfer in this body. `build/009f4900-finish/target.decode.txt` retains the full decoding and following bytes. `target.checked-callees.log` retains the checked inventory.

The complete callers at 0x009F4D80 and 0x009F5040 call this body's actual address, preserve the receiver without adjustment and pass four stack words in node, result28, result2c, result24 order. Insertion passes the node fields at +0x28, +0x2C and +0x24; Update passes three separate dword locals and compares them against those fields afterward. Neither caller consumes a returned EAX value. Their complete decodings and checked inventories are `build/009f4900-finish/caller-insert.decode.txt`, `caller-insert.checked-callees.log`, `caller-update.decode.txt` and `caller-update.checked-callees.log`. This supports the address-qualified void member and the retained pointer widths; it does not independently establish the vendor method name.

The target calls item virtual slots +0 and +4 with ECX as the item pointer and no stack arguments or hidden result storage. EAX from the first call supplies the float at +0x10 only after the second call; EAX from the second supplies floats at +0 and +4. Each item pointer is reloaded from node +4. The bank keeps opaque views and the established getter names. The dynamic getter implementation identities remain unproved; no object owner or inheritance is asserted from these accesses.

Both direct index providers were decoded completely, including both return paths. ER at 0x009F46E0 is 100 bytes; ES at 0x009F4750 is 101 bytes. Both take one float stack word and the original ECX receiver, return a dword in EAX, and return with RET 4 on both paths. They read the scale at +0xE8 and unsigned count at +0xEC; their distinct base floats are +0 and +4. Their only external call is the PE-bound floor(double) import, which receives an eight-byte stack argument and is cleaned up by the caller. The complete provider decodings and checked inventories are `build/009f4900-finish/index-er.decode.txt`, `index-er.checked-callees.log`, `index-es.decode.txt` and `index-es.checked-callees.log`.

The strict target call bindings at operands +0x31, +0x4A, +0x61 and +0x7A resolve to ER, ES, ER and ES respectively. No new symbol pin was required. The complete 64-byte log2Dword donor at 0x009F47C0 was decoded and compared with its actual source; its branch and return paths stay inside its extent. It is the binary-search algorithm donor, with no out-of-line call to it in the target. Its raw evidence is `build/009f4900-finish/log2.decode.txt` and `log2.checked-callees.log`.

No shared header in game declares the bank's opaque receiver, value views or index providers. The current caller source uses PartitionManagerImpl and a physical adapter to the dump name; the bank's older Gen009F5040 class is retained for its address identity. The body does not assert a new canonical class layout. The module API `ilt_oracle.check` returns UNTESTABLE for the bank name, both provider names and the existing calculate alias; the raw results are `build/009f4900-finish/bank-ilt-oracle.log`. They are not positive identity certificates.

## Retry hypothesis and rejected experiments

The initial hypothesis was that separate output-pointer and shifted-value lifetimes, rather than a different ABI or field offset, caused the bank's final XOR/store schedule. Every trial carries its more specific hypothesis, supporting instruction symptom, refutation condition, source path, timestamp and measured result in `build/009f4900-finish/measurements.jsonl`. Each named trial has an immutable source snapshot and unedited probe output under `build/009f4900-finish/`; the name prefixes below select them. The running `build/verdict.txt` was updated after every probe. All experiments check STOP_WORKER before compilation.

| Tested mechanism | Trial prefixes | Probe runs |
|---|---|---:|
| Output expression grouping and XOR temporaries | 001, 002, 003, 013, 029, 036, 037, 038, 052 | 16 |
| Guard input, search declaration order and scope | 004, 005, 006, 007, 055, 056, 057 | 12 |
| Typed, reference and qualified getter declarations | 008, 025, 063 | 11 |
| Signedness, full-width types and formal output types | 009, 010, 030, 033, 041, 062, 070 | 34 |
| Flat, pointer, member and returned-value inline search helpers | 011, 012, 014, 015, 046, 047, 072, 073 | 18 |
| First-step assignment, branch and switch forms | 016, 017, 018, 019, 020, 042, 043, 044 | 11 |
| Complete index-provider visibility | 021 | 6 |
| Array, aggregate, union and pointer lifetimes | 022, 023, 024, 034, 035, 039, 040, 053, 054 | 22 |
| Standalone compilation, method annotations and compile profiles | 026, 027, 064, 069 | 12 |
| Float argument temporaries and inline memory accessors | 028, 031, 032, 049, 050, 051, 067, 068, 071 | 32 |
| Compiler ordering intrinsics | 045, 048, 065 | 14 |
| Wide and narrowed search-value representations | 058, 059, 074, 075, 076 | 10 |
| Rejected forced-reload diagnostics | 060, 061 | 2 |
| Rejected pure-C++ provider alternatives | 066 | 4 |

The run retains 204 probe receipts, including 1 failed source compilation. The failed node-copy trial 024 accidentally changed a sibling use as well; trial 035 fixes the scope and reproduces the unchanged result. Trials 045 declared the ordering functions with C++ linkage and therefore emitted calls. They are excluded as intrinsic evidence. Trials 048 use the C declarations from existing landed sources and emit no extra call.

The target-only register, copy and frame generator produced one applicable frame alternative. Its two-trial shape_search result is unchanged. The raw generator receipt is `build/009f4900-finish/generated-search.log`; the exact choices, trial sources and result JSON are retained in `build/shape_search/0aba9748bc29477087455641d756f567/`. The generator did not serve changes to the preserved sibling functions.

Typed getters, reference returns, formal int/unsigned/long outputs, helper visibility, local order and scope, pointer copies, aggregate lifetimes, binary-search helper boundaries and branch spellings did not improve the faithful bank. The local guard restores the earlier 228-byte shape with the first high-bit test and shift on ESI plus an extra taken-arm copy. Nonemitting barriers move the initial copy to the native position but do not change that destructive ESI shift. Float argument temporaries, returned index temporaries, wide search values and narrowed search values add instructions or alter the native sequence. The relevant neighboring /Ob1 and /G7 profiles were tested; size profiles also change substantial portions of the function and were rejected.

The composed two-call XOR/OR calculation uses the high-Y provider first and adds an output-pointer reload. It is rejected by the actual call and operand order even though it recovers the native opening schedule and initial search copy. The separately computed high-index source likewise does not move the first XOR to the native point, even with complete provider visibility. Pure-C++ FISTP provider alternatives under /QIfist and /Op do not reproduce the complete existing providers; they were not used as visibility evidence.

The volatile-read and pre-load barrier diagnostics emit 225 bytes with 24 differences but read the stored output at +0x8E, where retail copies a register. Their apparent score improvement is rejected because that operation is absent from retail. They do not replace the preferred bank. Repeating the original-value store to keep it live emits an additional store; its lifetime hypothesis is also rejected. No assembly workaround, new pin, baseline modification or output-type claim was introduced.

This run closes the tested finite shape families, not the mathematical possibility of another source reconstruction. It does not prove that assembly is required. Reopening needs a new supported source structure that changes the independent shifted-value copy while preserving all native memory reads, float operand order and call order, or a different independently justified compilation mechanism that reaches both the prefix and suffix. Repeating the tested declarations, expressions or helper boundaries does not supply that evidence. A fresh strict comparison with a different offset set would refute the residual measurement; a different decoded return, outgoing branch, argument setup or provider field access would refute the respective physical-contract claim.

## Verification and preserved state

The unchanged index providers, log2Dword donor and caller TU pass the scoped byte gate: six bodies across four sources. String, float constant, DIR32 and body checks also pass. Raw output is `build/009f4900-finish/providers-callers-gate.log`. CSV and pin checks pass in `build/009f4900-finish/check-csv-final.log` and `pin-consistency.log`. The candidate fails its own function gate, so none of these other passing checks establishes an exact recovery. No header or shim change requires a full gate.

The preferred bank SHA-256 is `f99043abfa7ff0a2c20a44a3dc5542618ab92c788495ea6a9d94bbf2b5b3e81d` and is unchanged from the start snapshot. All uncollected sources, raw logs, generated search evidence and the strict object remain under build. No Git write, synchronization or background service was started. The final attempt verdict is written separately through tools/re_log.py, exactly once, with clock-derived elapsed time.
