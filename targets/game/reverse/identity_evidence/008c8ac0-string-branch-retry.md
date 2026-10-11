# 0x008C8AC0 string comparison retry

## Result and remaining work

The complete saved reconstruction improves from 2973 bytes with 2419 masked differences at +0x24 to 2954 bytes with 2087 masked differences at +0x177, against retail's 2954 bytes. The repository's measured quality is 0.2935, computed as `1 - (2087 + 2 * abs(2954 - 2954)) / 2954`. This is a partial. No source recovery is landed, and the generated ledger row remains unchanged. The preferred body is targets/game/reverse/attempts/0x008c8ac0.cpp. Its unchanged historical symbol spelling is `?_FunctionAptActionEquals2@AptActionInterpreter@@SAXPAV1@PAULocalContextT@1@@Z`.

The scoped byte gate fails on the target. Its REL32 diagnostics follow shifted instruction positions and do not justify new pins. The principal unresolved issue is `blocker=codegen-order/dispatch-and-cleanup-scheduling`. Retail retains the undefined checks at +0x1D9 and +0x20E that the candidate folds or moves. The string selection, numeric comparison and parser cleanup paths then diverge. An exact recovery also needs the destructor correction described below and independent evidence for the historical owner spelling. A new experiment should explain those complete control-flow differences or reproduce the native parser's cleanup while retaining the improved dispatch shape. Repeating the exhausted declaration combinations alone has no supporting observation.

## Revision, history and new hypothesis

The tested checkout is d4c6d9a99879c112c8ec0cf1b4902c6d4c5f0eab. The actual model is gpt-6.1-sol. The three previous target records and the saved source were inspected, including targets/game/reverse/identity_evidence/008c8ac0-coercion-retry.md. The current ledger still describes the 2954-byte generated dump in game/gen_asm/d_008c39e0.asm. The repository's eligibility predicate returns that row as open work. This is an explicit isolated assignment; no claim command or Git mutation was issued because the current assignment prohibits Git writes and synchronization.

The actual landed sources at 0x008C8500, 0x008C8840 and 0x008C9B70 were read, together with AptValueToInteger.cpp, AptValue_toNumber.cpp, Rva008985C0ValueString.cpp, Rva00899560AptValueCtor.cpp, Rva008995E0AptBoolValueCtor.cpp, AptBooleanCreate.cpp, ValuePredicates008C4940.cpp and the string helpers. The only relevant donor change found since the previous retry was the allocator-pointer spelling change, not a new class layout or callee identity. No Apt twin source was found in the Zero Hour reference. The class oracle has no witnessed layout for the historical AptValue or AptActionInterpreter names. Those spellings were retained to avoid an unsupported bank rename, and are not independently established identities.

The new compiler hypothesis was that assigning the initial inline string comparison result to an integer forces boolean materialization, whereas retail uses the comparison directly to select a branch. Retail +0x2DC through +0x305 compares the two string lengths, compares block pointers, runs `repe cmpsb`, and branches to the common result path on failure before storing 1. The experiment changes only that assignment to `if (comparison) equal = 1;`. It would be refuted if the complete compiled body did not improve on the saved body's measured quality. Trial 04 improves the measured quality from 0.1682 to 0.2935 and moves the first masked divergence from +0x24 to +0x177. All names, class layouts and external declarations stay unchanged in that preferred trial.

## Complete boundaries and calling conventions

The full target decodes through its sole bare return at +0xB89. Every direct conditional branch and jump lands on an instruction boundary within the 2954-byte extent. The preceding bytes and the following alignment bytes were retained. The complete dispatcher at 0x008CCED0 is 375 bytes and returns with `ret 0xC`. Its +0x93 opcode byte load, +0xB5 context address, +0xB9 context push, +0xBA receiver push, +0xBB table call and +0xC5 eight-byte caller cleanup establish two four-byte cdecl arguments in receiver/context order. The table entry for opcode 0x49 is VA 0x00CC8AC0, which corresponds to the target RVA. This is its only occurrence in the first 256 slots. The target reads the receiver's count at +0 and stack pointer at +8, ignores the context argument and returns without a consumed value or hidden return storage. This establishes the dispatch role and ABI, not the historical C++ owner spelling.

Complete instruction bodies and coordinator checked-callee outputs were retained for the target, dispatcher and each helper used for type or ABI evidence. The fresh extents are: version getter 0x00892370 (6); toInteger 0x00898300 (136 executable bytes plus its 62-byte switch data); toNumber 0x008983D0 (108 executable bytes plus its 62-byte switch data); getName 0x008985C0 (1740 executable bytes plus its 126-byte switch data); Find 0x0089E230 (62); base constructor 0x00899560 (118); boolean constructor 0x008995E0 (101); retain 0x008991B0 (41); release 0x008991E0 (120); boolean free-list cleanup 0x008D2A90 (15); base virtual cleanup 0x00891810 (26); numeric validator 0x008C4A30 (873); string destructor 0x00891B80 (22); atof wrapper 0x008921B0 (14); and the statically linked float-to-integer helper 0x009F6E38 (117). The executable endpoints, every return and outgoing direct branch were inspected. The toInteger tail jump reaches the complete float-to-integer helper, which consumes ST0 and produces EDX:EAX. The caller uses EAX. The three compact switch maps were read in full; every map index is in range and every table destination is an aligned instruction in its helper.

The getName thiscall receiver is ECX and its one four-byte output-handle argument is removed by both `ret 4` paths. Find sign-extends its character argument, reads its four-byte start argument and removes eight stack bytes on both exits. toInteger returns a four-byte integer in EAX; toNumber returns through ST0. The full targets for the imported strtol, isdigit, atof and atoi routes are six-byte import jumps. The retail IAT independently binds them to MSVCR71.dll with those names. The actual caller pushes and cleanup establish strtol's text/end/base order and twelve-byte cdecl argument area, and isdigit's sign-extended integer argument and four-byte cdecl area. The atof wrapper and complete caller establish its text argument and ST0 result. No pin was added or changed.

## Field widths, virtual calls and ownership

The actual helper instructions, not object allocation size, establish value flags at +4, a byte boolean payload at +8, a four-byte integer at +8, a four-byte float at +8 and a four-byte string-block pointer at +8. Tags 1 and 42 route to the string paths; the latter follows a pointer at +0x20 before reading +8. The decoded getName helper increments the source block's two-byte reference count before decrementing and possibly freeing the destination block, then replaces the output's four-byte handle. String reference counts occupy +0, lengths are unsigned two-byte values at +2, and text starts at +8. Metadata at +4 through +7 is not read by the target; the bank's retained m_capacity declaration is not independent evidence of that metadata's real type.

The boolean constructor writes one byte at +8. The complete base constructor establishes the registry's capacity at +0, count at +4 and pointer array at +8, including the overflow path clearing bit 30. The target's indirect allocator call passes one four-byte size and removes it in the caller. The 12-byte allocation is only corroboration, not payload-type evidence. The installed base and boolean vtable prefixes were read: both first slots resolve to retain 0x008991B0 and release 0x008991E0. Their third entries differ, resolving to 0x00891810 and 0x008D2A90 respectively. Release tail-jumps through slot +8 without stack arguments. The boolean cleanup returns the object to the free list using its +8 payload as the next pointer. The base cleanup makes further virtual calls at +0x38, +0x3C and +0x34, the last with constant 1. Those deeper virtual identities remain unproven. Their dispatch mechanics and the target's no-argument receiver calls were checked separately from the direct calls. The pool's second function-pointer slot is called with one block pointer using cdecl cleanup; its runtime owner identity was not inferred from a donor name.

Retail's four unwind states are 0 to -1, 1 to -1, 2 to -1 and 3 to 2. The first two cleanup actions use ECX adjusted to EBP-0x1C; the remaining actions use EBP-0x14 and EBP-0x18. Every action tail-jumps to the complete 22-byte string destructor at 0x00891B80. The candidate COFF unwind map agrees with these state transitions and receiver adjustments. However, the preferred trial's emitted destructor is 24 bytes and reloads its handle after decrementing the block reference count. Retail retains the block pointer in EAX. This is an explicit outstanding cleanup check, despite the agreeing unwind map.

Trial 27 caches the block pointer in the destructor before decrementing it. Its separately scoped destructor gate passes 22/22 bytes, including the existing pool relocation. Its complete target is worse by the repository's positional score: 2922 bytes with 2213 differences at +0xC5, score 0.2292, although normalized instruction similarity rises to 0.945. It is retained as an ownership and cleanup alternative in build/008c8ac0-retry-20261011/trial-27-cached-string-destruction.cpp. It is not landed as a separate assigned recovery. Combining that destructor with the donor's integer-valued predicate spelling also worsens the main body. A future exact recovery must reconcile the correct destructor with the complete target, rather than accepting the preferred bank's destructor as verified.

## Measured experiments

Each complete source and raw probe output is retained under build/008c8ac0-retry-20261011. The table reports the latest receipt for each hand-written source. Scores penalize both positional differences and size drift. Small callback bodies from forced comparison helpers demonstrate that the compiler refused the requested inlining; they are rejected rather than presented as a recovery.

| Trial source | Compiled bytes | Masked differences | First difference | Quality |
| --- | ---: | ---: | --- | ---: |
| trial-00-bank.cpp | 2973 | 2419 | 0x24 | 0.1682 |
| trial-01-int-equality.cpp | 3001 | 2402 | 0x24 | 0.1550 |
| trial-02-int-type-predicate.cpp | 2973 | 2419 | 0x24 | 0.1682 |
| trial-03-native-type-predicate.cpp | 2863 | 2319 | 0x24 | 0.1534 |
| trial-04-direct-string-branch.cpp | 2954 | 2087 | 0x177 | 0.2935 |
| trial-05-inline-comparison.cpp | 285 | 258 | 0x0 | 0.0000 |
| trial-07-int-primitive.cpp | 2954 | 2087 | 0x177 | 0.2935 |
| trial-08-separate-primitive-exits.cpp | 2954 | 2087 | 0x177 | 0.2935 |
| trial-09-split-type-dispatch.cpp | 2954 | 2087 | 0x177 | 0.2935 |
| trial-10-dispatch-guard-return.cpp | 3117 | 2419 | 0x68 | 0.0708 |
| trial-11-type-dispatch-helper.cpp | 567 | 539 | 0x0 | 0.0000 |
| trial-12-native-nested-dispatch.cpp | 2954 | 2087 | 0x177 | 0.2935 |
| trial-13-explicit-undefined-result.cpp | 3146 | 2629 | 0x1a | 0.0000 |
| trial-14-integer-primitive-result.cpp | 2954 | 2087 | 0x177 | 0.2935 |
| trial-15-under-string-receiver.cpp | 2975 | 2226 | 0xc5 | 0.2322 |
| trial-16-positive-string-expression.cpp | 2990 | 2397 | 0x24 | 0.1642 |
| trial-17-promoted-string-length.cpp | 2954 | 2087 | 0x177 | 0.2935 |
| trial-18-explicit-string-outcome.cpp | 2971 | 2425 | 0x24 | 0.1676 |
| trial-19-member-validator.cpp | 2954 | 2087 | 0x177 | 0.2935 |
| trial-20-plain-inline-validator.cpp | 1712 | 1513 | 0x17 | 0.0000 |
| trial-21-integer-comparison-difference.cpp | 2946 | 2234 | 0xc5 | 0.2383 |
| trial-22-byte-string-result.cpp | 2954 | 2087 | 0x177 | 0.2935 |
| trial-23-normalized-scratch-result.cpp | 2958 | 2245 | 0xc5 | 0.2373 |
| trial-24-staged-integer-result.cpp | 2946 | 2234 | 0xc5 | 0.2383 |
| trial-25-separate-undefined-count.cpp | 3137 | 2614 | 0x1a | 0.0000 |
| trial-26-scoped-undefined-count.cpp | 3137 | 2616 | 0x1a | 0.0000 |
| trial-27-cached-string-destruction.cpp | 2922 | 2213 | 0xc5 | 0.2292 |
| trial-28-native-predicate-cached-destruction.cpp | 2737 | 2432 | 0x1a | 0.0298 |
| trial-29-direct-int-string-result.cpp | 2946 | 2232 | 0xc5 | 0.2390 |
| trial-30-direct-float-branch.cpp | 3145 | 2609 | 0x1a | 0.0000 |
| trial-31-direct-integer-branch.cpp | 2994 | 2624 | 0x17 | 0.0846 |

The improved trial was also subjected to the repository's finite generators. The exception-handling generator served five choices and tested 19 variants before stopping for no improving output. The non-EH family generator served four choices and exhausted 16 variants. Neither beat trial 04. All generated sources, unchanged raw probe logs, choice JSON and native search receipts are preserved. Previously exhausted local ordering, bitfield tags, numeric-first dispatch and handle-reference experiments were not repeated. The repeated donor predicate spelling was retested in the new cached-destructor context and rejected on its measured output.

## Raw evidence and checks

Raw logs are untracked reproducibility artifacts, not revision certificates. The baseline and winning probe are build/008c8ac0-retry-20261011/probe-trial-00-bank.log and build/008c8ac0-retry-20261011/probe-trial-04-direct-string-branch.log. All trial measurements are in build/008c8ac0-retry-20261011/measurements.jsonl. The main scoped gate is build/008c8ac0-retry-20261011/scoped-byte-gate-final.log (fails 1/1). The separate cached-destructor gate is build/008c8ac0-retry-20261011/cached-destructor-byte-gate-final.log (passes 1/1). The earlier synthetic-row harness failures are also retained and are not gate verdicts.

Complete disassemblies are build/008c8ac0-retry-20261011/decode-<eight-digit-rva>.txt, and the corresponding coordinator outputs are build/008c8ac0-retry-20261011/checked-<eight-digit-rva>.log. Fresh import, switch-map, dispatch-table and vtable observations are in build/008c8ac0-retry-20261011/supplemental-evidence.log. Retail and candidate unwind evidence is in build/008c8ac0-retry-20261011/eh-retail.log, build/008c8ac0-retry-20261011/eh-candidate.log and build/008c8ac0-retry-20261011/eh-candidate-cached-destructor.log. Generator outputs and receipts are build/008c8ac0-retry-20261011/eh-search.log, build/008c8ac0-retry-20261011/eh-search-receipt.json, build/008c8ac0-retry-20261011/family-search.log and build/008c8ac0-retry-20261011/family-search-receipt.json.

The initial ledger check, pin consistency, retained-name comparison and bank class gate pass. Their raw logs are build/008c8ac0-retry-20261011/check-csv-initial.log, build/008c8ac0-retry-20261011/pin-consistency.log, build/008c8ac0-retry-20261011/name-regression.log and build/008c8ac0-retry-20261011/class-gate-bank.log. The declared-unmatched preview refuses the partial bank because it owns zero ledger rows; its raw output is build/008c8ac0-retry-20261011/declared-unmatched-bank.log. That is not an exact conversion claim, and no whitelist or baseline was changed. Final banking and ledger validation logs are retained separately. No shared header, policy or tooling was changed, so a full gate was not required. No commit or synchronization was attempted, and all uncollected sources and logs remain available.

Exactly one new partial verdict was recorded through re_log.py. Its measured submitted and preferred scores both equal 0.2935. The raw banking output is build/008c8ac0-retry-20261011/bank.log. A fresh probe of the actual preferred bank reproduces 2954 bytes with 2087 differences at +0x177 in build/008c8ac0-retry-20261011/probe-0x008c8ac0.log. The final ledger, class and retained-name checks pass in build/008c8ac0-retry-20261011/check-csv-final.log, build/008c8ac0-retry-20261011/class-gate-final.log and build/008c8ac0-retry-20261011/name-regression-final.log. The CRLF-aware diff check passes in build/008c8ac0-retry-20261011/diff-check-crlf.log. The bank retains its original CRLF line endings, and the attempt log was appended only through the repository tool.
