# 0076BF20 literal clamp lifetime probe

The 278-byte retail body stores literal 1.0f at ESP+0xC before selecting a
pointer between it and the computed value at ESP+8. EDI retains that pointer
across HAnimClass slot0x10. The second clamp also selects a reference, between
the converted frame count and its product. Existing bank uses scalar results.
Its baseline reproduces277B/180nonrelocation differences, first+2.

The new scratch trial uses a named `float one=1.0f` and reference-returning
`std::min` for both selections. It does not have a successful measurement.
Including algorithm after hanim causes VC7.1 include/new lines75/80 C2084
against always.h lines94/95: duplicate placement array new/delete. Reversing
the include order causes the corresponding C2084 in always.h against new
lines74/79. This is repeated scratch compile infrastructure failure, not a
mandatory byte/identity/commit gate refusal. No guard or header was altered.
A follow-up should first establish this TU's supported STLport/header setup;
no source-shape conclusion can be drawn from either failed compile.

Retail boundary: RET+0x115, INT3+0x116. Direct call ILT00028A29 resolves to
matched87B BfmeHostYA::bfmeGetYA001C3460 with ECX receiver/ST0 result.
The existing bank helper alias is retained in scratch; promotion would need
normal canonical-call binding review. No new pins or production changes.
Actual-RVA API: placeholder tier, CONTRADICTED diagnostic; this does not
claim an authentic retail class spelling or establish a real-name rejection.

Scratch: build/worker3-round40/base.cpp, native.cpp, base.log, native.log.
Bank unchanged; no measured improvement asserted.
