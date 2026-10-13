# Value query at 001C9310

The retained `Rva001C9310::value` spelling does not assert a semantic EA name.
The matched `PlayerDoBountyForKill.cpp` invokes ILT 0001CD91 through a const
Object query wrapper; independent retail decoding gives JMP 001C9310. That
caller proves a receiver and integer result, not the query's source name.

## Boundary, fields, and callee

Retail preserves incoming ECX in EDI and takes no explicit stack arguments.
RET instructions at 001C935A and 001C935F precede INT3 from 001C9360: the
complete extent is 80 bytes, not an older log's 70-byte estimate.
Both calls at 001C9322 and 001C933B reach ILT 000022BB, the existing const
Overridable::getFinalOverride binding. Decoding its 26-byte body at 00087A80
shows an ECX receiver, EAX final pointer, repeated next-pointer loads at +4,
and RET at 00087A99; it changes no object state.

The query reads its template pointer at +4, then template+448. After resolving
the template again it tests bit 25 at +D0. When set, it multiplies the result
by the integer at receiver+210 -> +28. Every view member retains the bank's
name and these directly witnessed offsets; no meaning is assigned to the
flag or multiplier. Native Overridable has size 12, so the existing pad to
+D0 is reduced by four bytes. No shared header is changed.

## Measured source change

The manual two-level chain walk measured 80 bytes with 18 differing bytes,
first at +1, using ESI for the receiver and EDI for the value. Native
Overridable and OVERRIDE<T>, with direct typed field expressions, produce
all 80 bytes modulo the two existing resolver relocations. No new pin,
volatile access, barrier, assembly, or guessed identifier is required.

A canonical Object-header view was tested in scratch: accessing its raw
m_template through an OVERRIDE reference or temporary cached the raw pointer,
grew the body to 96 bytes, and left 65 differences. The final source keeps
the original address-derived receiver layout view and native override member;
it does not redeclare Object or Thing. Both parked worktrees remain untouched.

## Strict validation

`add_match.py --model gpt-6-astra` ran the scoped strict build successfully:
one of one claimed bodies matched, both resolver call relocations passed,
no literal or float-reference obligations, zero DIR32 sites, and no baselined
body-guard findings. The generated scaffold row and bank were retired by the
tool; the matched claim remains queued for the root publisher.

The tool refreshed hatch_baseline.tsv by removing two stale object_symbol
entries for RVAs 0000DE77 and 0000F952, one allowance each. No allowance was
added. This unrelated shrink is included with an explicit Verifier-Change
trailer, as required by the coordinator.
