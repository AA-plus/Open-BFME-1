# RVA 009B10E0: complete boundary, ABI and preserved compiler trials

## Result and reopening condition

No body was landed. The strongest positional trial is `19-mixed-two-dimensional.cpp`, preserved by `re_log.archive_attempt` in `targets/game/reverse/attempt_history/0x009b10e0/6b8a5a0d00905389498745a8a7b12fbdcaf1fe3086bf2de2554a2ad89806aa97.json`. Its measured quality at the complete first-body extent is 0.2315, using `finish_measure.parse` rather than an author estimate. The preferred bank is unchanged and retains its original label. The immutable archive is preservation evidence, not a byte-matching source recovery.

The remaining source mismatch starts at +0x02: retail allocates a 0x178-byte frame and the trial allocates 0x174 bytes. The subsequent quantizer and fallback-table loads are scheduled differently, and coefficient-table induction and output-loop common subexpressions remain different. Reopening needs an independently checked donor of this complete callback, or a concrete new induction, frame or load-lifetime hypothesis supported by decoded retail instructions. The tested flag, local-order, table-addressing and countdown spellings below do not justify repeating the same experiment.

Ordinary `re_log.py record ... partial --stash ...` cannot safely rank this target while its ledger extent is 3558 bytes. `finish_measure.measure` invokes `probe.py` without a size override, and `_bank` remeasures both the incoming and existing banks against that ledger extent. The raw default-size probe in `build/vp6-009b10e0/bank-extent.log` measures the new body against 3558 bytes and gives quality 0.0000. It would rewrite the preferred bank's label using the same conflated extent. No banking measurement, ledger policy or gate was bypassed; only the repository's immutable archival utility was used. The final verdict is `attempted`, with the preserved body and this limitation cited, rather than a bodyless `partial` or a claim that the decoded ABI remains ambiguous.

## Retry hypothesis and newly available evidence

The retry hypothesis was that recently landed neighbours and callers could resolve the prior boundary and code-generation blockers by supplying the actual callback ABI, canonical global declaration and MSVC 7.1 flags. It would be refuted as a useful compiler lever if those declarations and flags reproduced the saved bank's instructions and yielded no smaller mismatch. `BfmeVp6LoopFilter.cpp`, `BfmeCodecCpuDispatch.cpp`, `BfmeConv9C2320.cpp`, `Rva009B2530DeringFrame.cpp` and `Rva009B2A50DeringFrame.cpp` were read against the relevant retail instructions. The canonical global and neighbouring `/G6` flags reproduced the old bank's instruction result. Changing array indexing and output induction then improved positional differences, but lowered normalized instruction agreement relative to the best bank-like trial. Those are distinct measurements and neither is byte equality.

The existing preferred reconstruction and its immutable earlier alternative were read directly. Their descriptive function and local names were retained. No independently decoded Zero Hour or BFME2 twin of this callback was found in the named reference locations. Existing donor descriptions were not treated as identity proof.

## Complete boundaries and dispatch identity

The requested 3558-byte row combines `[0x009B10E0, 0x009B18CE)`, two INT3 bytes, and `[0x009B18D0, 0x009B1EC6)`. The first complete body is 2030 bytes with its sole plain return at 0x009B18CD. Its 78 direct branches all land on decoded instructions inside that body. It has no calls, outgoing conditional branches, indirect branches or tail jumps. The next body is independently entered at 0x009B18D0 and returns at 0x009B1EC5. The preceding complete installer returns at 0x009B10D0 and has INT3 padding before this target.

Complete decoding of the installer at 0x009B0D60 shows distinct generic dispatch entries: VA 0x00DB10E0 is written to VA 0x01356EC0, while VA 0x00DB18D0 is written to VA 0x01356EA0. Thus the second entry is not a continuation of this callback. The first-body retail byte SHA-256 is `5f7ee819e99e6649a03c1d3ffd28dee3bb5de59b5cf272ddce8d6f1052733a83`. Raw complete listings, padding, branch targets, return paths and hashes are in `build/vp6-009b10e0/retail-009b10e0.log`, `retail-009b18d0.log`, `retail-009b0d60.log`, `boundary-padding.log` and `decoded-extents.json`. No ledger boundary was changed.

The address-derived bank name `filterBlock009B10E0` is retained. Dispatch-slot use proves this entry's role and separates its boundary; it does not establish an upstream function name or context class.

## ABI, payload widths and canonical declarations

The complete callers at 0x009B2530 (1309 bytes) and 0x009B2A50 (1835 bytes) contain instruction-aligned indirect calls through VA 0x01356EC0. Their push sequences supply six words, from last to first: quantizer-table pointer, selector, stride, destination, source and context. The callers reclaim 24 bytes for one call or 48 bytes for a pair and do not consume a return value. The target's plain return, entry-stack reads and saved-register restoration agree with cdecl. There is no receiver adjustment or hidden return storage. The first word, context, is never read by this target; its class remains unknown. A void result is the existing canonical callback declaration and is consistent with the complete callers, not inferred from an accidental final EAX value.

Entry stack offsets +8 and +12 are byte pointers for source and destination, +16 is the 32-bit stride, +20 is the 32-bit selector, and +24 is the quantizer-table pointer. The bank's unsigned selector spelling is retained; instruction widths and valid selectors do not independently distinguish its original signedness. The target reads unsigned source bytes, writes byte results, reads dword quantizer values, writes two 72-element short coefficient tables, subsequently sign-extends those coefficient words, and buffers eight dword results before the row's byte stores. These types come from every table and pixel access in the complete target, not from allocation size or a donor name. There are no constructors, value-copy helpers, STL containers, EH states, virtual receiver calls or owned heap elements to resolve.

The actual fallback-table load addresses VA 0x012D8158. The existing DIR32 and data rows call it `_Vp6FilterEdgeTagTable`; its owning source defines a 64-element int table. The trial uses the canonical `extern "C" int Vp6FilterEdgeTagTable[64]` declaration. No new pin or numeric image-address literal was added to game source. The target has no direct callees. `checked_callees.py` was run on the complete target, both complete callers, the installer and the following entry; its raw reports are retained. Installer calls are not used as type or ABI evidence for this callback.

## Measurements and rejected shapes

The saved body independently reproduces 2045 bytes, 1930 probe differences and 0.783 normalized instruction agreement against the complete 2030-byte target. The best positional trial emits 2022 bytes with 1544 probe differences and an 8-byte shortfall. The strongest normalized instruction agreement is 0.786 from `04-unsigned-indices.cpp`. Probe differences compare overlapping bytes; the extent error is listed separately. Normalized instruction agreement ignores register and constant choices and must not be called a byte-match score.

Canonical declaration changes, `/G6`, subtract-before-bias spelling, destination delta and separate initialization produced no useful improvement. Moving the vertical and horizontal coefficient tables independently, changing source and destination cursors, countdown loops, clamp statements and signed loop indices were all measured. A finite store-order family search also reached a plateau. The raw search output is `build/vp6-009b10e0/family-search.log`, with generated trial sources retained under the result directory it names. No unchanged register spelling was repeated beyond the allowed limit.

All table entries below are computed from `build/vp6-009b10e0/all-measurements.json`. Every listed trial source, unedited probe output and command receipt remains under `build/vp6-009b10e0/`.

| Source trial | Emitted bytes | Probe differences | Extent error | Normalized instruction agreement |
| --- | ---: | ---: | ---: | ---: |
| 00-saved.cpp | 2045 | 1930 | 15 | 0.783 |
| 01-canonical.cpp | 2045 | 1930 | 15 | 0.783 |
| 02-g6-canonical.cpp | 2045 | 1930 | 15 | 0.783 |
| 03-subtract-then-bias.cpp | 2045 | 1930 | 15 | 0.783 |
| 04-unsigned-indices.cpp | 2045 | 1927 | 15 | 0.786 |
| 05-above-coefficient.cpp | 2078 | 1934 | 48 | 0.583 |
| 06-destination-delta.cpp | 2045 | 1927 | 15 | 0.786 |
| 07-below-inline.cpp | 2037 | 1922 | 7 | 0.730 |
| 08-two-dimensional.cpp | 2025 | 1897 | 5 | 0.653 |
| 09-unsigned-column-only.cpp | 2045 | 1942 | 15 | 0.752 |
| 10-coefficient-statements.cpp | 2045 | 1935 | 15 | 0.781 |
| 11-reverse-loads.cpp | 2025 | 1899 | 5 | 0.651 |
| 12-separate-initialization.cpp | 2025 | 1897 | 5 | 0.653 |
| 13-row-indexed.cpp | 2016 | 1882 | 14 | 0.524 |
| 14-array-relative.cpp | 2005 | 1869 | 25 | 0.708 |
| 15-vertical-countdown.cpp | 1867 | 1771 | 163 | 0.476 |
| 16-horizontal-countdown.cpp | 1953 | 1889 | 77 | 0.645 |
| 17-coefficient-countdowns.cpp | 1714 | 1652 | 316 | 0.516 |
| 18-mixed-row-indexed.cpp | 2043 | 1667 | 13 | 0.746 |
| 19-mixed-two-dimensional.cpp | 2022 | 1544 | 8 | 0.749 |
| 20-source-cursor.cpp | 1952 | 1592 | 78 | 0.744 |
| 21-two-output-cursors.cpp | 1892 | 1531 | 138 | 0.699 |
| 22-vertical-array-only.cpp | 2047 | 1634 | 17 | 0.698 |
| 23-horizontal-array-only.cpp | 2022 | 1612 | 8 | 0.772 |
| 24-signed-mixed-induction.cpp | 2024 | 1600 | 6 | 0.741 |

## Checks and limits

The tested base revision is `ba953cf44ffd88910aa26f6c4069e5dbc1706318`, with model `gpt-6.1-sol`. `check_csv.py`, `pin_consistency.py --check`, `class_gate.py` on the best trial and the bank-to-trial `name_regression.regressions` check pass. Raw logs are `build/vp6-009b10e0/check-csv-final.log`, `pin-consistency-final.log`, `19-class-gate.log` and `preservation.log`. The declaration check rejects this scratch trial because it has zero matched ledger rows, as expected for an unlanded attempt; raw output is `19-declarations.log`. No whitelist was added.

The repository scoped byte gate was run with an explicit 2030-byte selected row, without changing the ledger. Baseline verification passes and the function byte comparison fails. Raw output and exit receipt are `build/vp6-009b10e0/19-scoped-gate.log` and its receipt JSON. No full gate is required for an archive and evidence-only change; no shared header or game source changed.

A native MSVC 7.1 console harness executes the complete retail body and emitted trial bodies after patching only their genuine fallback-table operand to the same table. For each of the three final candidates, 1536 deterministic cases pass full-buffer comparison across every selector from 0 through 63, three shipped quantizer tables, eight stride variations including negative strides, overlapping source and destination positions, and flat and random pixels. The candidates are the best positional trial, the preceding mixed-index trial and the strongest normalized-instruction trial. The harness uses different unused-context sentinels. Source, build output, run output, candidate receipt and command timestamps are retained in `build/vp6-009b10e0/native-final/` and `native-final.log.receipt.json`. These repeated functional comparisons cover the recorded finite inputs and do not establish general equivalence, byte equality or an upstream semantic name.
