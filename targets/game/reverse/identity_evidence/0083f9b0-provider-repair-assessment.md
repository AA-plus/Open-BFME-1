# Wide STLport initializer provider repair, 2026-10-13

This is a dependency experiment after the independently strict-verified
195-byte conversion at RVA 0083F9B0. It is not another conversion or a new
matched-byte claim. Root's round42 packet authorized scoped provider repair.
The accepted production source remains unchanged by this experiment.

## Concrete starting conflict

Round41 compared current-source objects with the Oct9 e8980d290e census.
StreamInstantiations is still the first provider of wrong wide init (179B,
f7c5d8634054) and imbue (263B, db06d1f2473d), as well as canonical first copies
of exception-mask check (14B), wide clear (30B), and wide rdbuf setter (39B).
The pending failure TU emits differing 33B/48B/57B copies of the latter three.
Its existing24B failure body and three relocations remain unchanged.

## Declaration-only ownership experiment

Before the four full-class instantiations in StreamInstantiations.cpp:

```cpp
template <> void
_STL::basic_ios<wchar_t, _STL::char_traits<wchar_t> >::init(
    _STL::basic_streambuf<wchar_t, _STL::char_traits<wchar_t> > *);
template <> _STL::locale
_STL::basic_ios<wchar_t, _STL::char_traits<wchar_t> >::imbue(const _STL::locale &);
```

Fresh compilation removes the wrong wide init and imbue copies. An in-memory
unchanged link_check.refresh/check_object overlay of this object, current
narrow-init and wide-imbue providers, and the accepted pending target changes
its blockers from three COMDAT plus two wrong-selected to **two COMDAT and
zero wrong-selected**. Remaining conflicts: exception-mask check and wide
clear. The wide rdbuf setter also disappears from StreamInstantiations, so the
pending57B copy becomes first; this is not independent retail proof for it.
No global index was changed and no fresh global census is claimed.

This patch is not ready to land. It also removes the existing claimed wide
fill setter at0083E960 from StreamInstantiations. The old object defines the
16-byte body `66 8b 54 24 04 66 8b 41 54 66 89 51 54 c2 04 00`; the candidate
has no such symbol. Seventeen readable claimed bodies retain identical object
bytes and relocations. Two $L EH labels were not directly found by the narrow
symbol comparison and require the normal funclet-aware gate. The missing fill
owner must be retained explicitly before considering production integration.

## Bounded target-TU context experiments

All used native existing types and signatures; no pins, aliases, generated
edits, verifier changes or guessed identities.

| Source context | Initializer result | Emission result |
|---|---|---|
| Explicit specialization expanding native rdbuf/clear/check logic |191B,133 differing bytes|Rejected byte shape|
| extern-template clear/rdbuf declarations with original init |158B,108 differences|Necessary inlining lost|
| force-inline native clear/rdbuf specializations, expanded mask check |195B,1 byte at+2F: TEST operand order|48B clear and57B rdbuf still emitted|
| Reverse mask accessor operands in that check |Same195B/1 byte|No improvement|
| force-inline setters calling canonical mask check |195B exact modulo11 relocations|All three conflicting copies remain|
| Instantiate shared setters before visible failure body, init after |195B exact modulo11 relocations|All three conflicting copies remain|

The identical initializer is already accepted; neither exact variant is a
provider improvement. No new bank or conversion was recorded. These trials
close this bounded source-context approach; do not repeat them as fresh work.

## Remaining repair contract

A wider ownership/emission solution must simultaneously preserve the195B
initializer, the24B failure body, existing fill16B owner and all other claimed
stream bodies, while eliminating the two remaining first-provider conflicts.
Merely suppressing wide init/imbue is incomplete. Force-inline does not suppress
VC7.1's standalone helper emission. Moving instantiation text around the failure
definition also does not isolate that emission context. No complete small
repair is proved here, and no nonmatching production patch was retained.

Raw scratch: build/worker1-round42/declaration-only-unlanded.patch,
stream.cpp, init.cpp, extern.cpp, inline.cpp, inline-mask.cpp,
inline-native.cpp, context.cpp, corresponding *-probe.log,
emissions-final.txt, context-emissions.txt and overlay.txt. Scratch harness
errors (inspect.py shadowing Python inspect, then missing RetailTruth argument)
were corrected; final emission audit completed successfully. No strict or
commit gate refusal occurred during these experiments.
