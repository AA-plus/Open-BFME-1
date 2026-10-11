# Correct receiver scheduling experiment at 0067EE40

Worker A2, gpt-6.1-sol, 2026-10-11. This is an experimental bank, not a production conversion.

The established identity is `?ConstructNetCommandMsgFromRawData@NetPacket@@SAPAVNetCommandRef@@PAEG@Z`; the ILT oracle confirms it with p_false=2.61e-4. The matched getReadyCommands caller uses ILT 00048301, and all 31 distinct direct targets have ledger names. Native return at +0x3AB followed by INT3 +0x3AC proves the 940-byte extent. The previously documented retail receiver is the actual message in ECX; the historical preferred 940-byte/19-difference bank clears that pointer before detach and must not land.

Starting from that preferred source, remove the pointer-clearing statement. The corrected baseline emits 944 bytes, 36 relocations and 186 non-relocation differences (first +0x21). This is the same correct-receiver result independently documented in the preceding BFME2 donor retry. Fresh compiler scheduling-fence experiments give:

| Fence position | Object bytes | Non-relocation differences |
| --- | ---: | ---: |
| none, corrected receiver | 944 | 186 |
| before offset reload | 944 | 190 |
| after offset reload | 944 | 188 |
| after reference construction | 944 | 190 |
| before detach | 944 | 184 |
| before null-reader guard | 939 | 647 |

The before-detach variant retains the actual message receiver and improves the measured correct-source quality from 0.7936 to 0.7957 using the current finish metric (1 - (differing bytes + twice the size error) / retail size). `_ReadWriteBarrier` is only a source-shaping experiment: no EA intrinsic usage is proven, and it does not solve the rotated callee-saved roles or the four-byte size excess. Relocation operands still drift at three sites; these results are not binding proof.

Four other fresh local-type experiments (four-byte cursor with a value constructor, an empty constructor plus assignment, and a two-element scalar array using either element) each emit the unchanged 944-byte/186-difference result. The name oracle reports no witnessed Rva0067EE40Cursor layout, so the opaque cursor is not an identity claim and is discarded. These trials do not repeat the exhausted tail permutations, pointer-clearing copies, or leading-null source.

The first submission cited an older denominator-based quality calculation; it is retracted with a void row, and the corrected current finish metric is recorded through re_log. The partial is archived as a corrected-receiver alternative by re_log; the preferred historical bank is retained by the tool's score policy and remains semantically unsuitable. Production game sources, headers, bindings and ledger rows are unchanged. NetPacket.cpp still does not link, LINKED 0 -> 0 bytes (supplied census e49332fa21), with 3,827 authored bytes in the TU and existing unresolved or duplicate definitions.
