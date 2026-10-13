# RVA 00588AD0: indexed record access

Round47, model=gpt-6-astra, lane=R, budget=30m.

The eligible generated body is 282 bytes. RET4 instructions at 00588BB8,
00588BD5 and 00588BE7 end the complete extent at 00588BEA. The matched
Rva005896F0 adjustment thunk adds 104 to ECX before tail-calling the body;
it establishes an incoming receiver route, not a semantic class identity.
Actual-RVA API preflight for the existing bank symbol reports
`tier=placeholder`, `CONTRADICTED`. This opaque spelling makes no retail
name claim and is exempt under the unchanged ilt_guard tier policy.

Full direct callees were decoded and their existing source definitions read:
0046F1A0 (168-byte named audio helper), 004C1940 (61-byte ControlBar
hideBuildTooltipLayout), 00478C60 (4-byte window instance getter), and
00478CA0 (4-byte window ID getter). No callee declarations or pins changed.

Retail starts with an index shift by five, then LEA of receiver plus index,
and reads records at +2C, +30, and +38. The preferred bank instead retained
`&m_records[index]`, folding +2C into that pointer. Following the indexed
member-array lever in docs/shape_levers.md, the trial accesses each field
as `m_records[index].field`. It preserves all existing member/getter names.

| Trial | Size | Non-relocation differences | First difference | Measured quality |
|---|---:|---:|---:|---:|
| Preferred bank | 284 / 282 | 128 | +9 | .5319 |
| Direct indexed member accesses | 284 / 282 | 121 | +19 | .5567 |
| Separate callback-local lifetime | 284 / 282 | 121 | +19 | .5567 |

The second trial enclosed the owner/manager-mode argument locals around the
callback and used a separate tail manager-mode local. Retail's save/restore
scope supported this test, but it emitted identical code and was discarded.
Normal re_log stash capture independently accepted .5567 and archived the
prior bank. Original line endings were preserved.

The remaining first operand mismatch is the branch displacement at +19;
address-base formation now agrees. Later instance and manager-mode registers
still differ, and the compiler retains constant 2 across the callback/tail
while retail uses immediate comparisons. No unsupported enum or volatile
field was introduced to force those bytes. No production/header/baseline
changes, strict-build claim, or verified-byte credit is made.

Raw evidence: build/worker3-round47/{base,indexed,scoped}.{cpp,log},
retail.txt,callers.txt,callees.txt,measurements.json.
