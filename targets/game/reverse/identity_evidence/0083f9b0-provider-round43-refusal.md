# Wide STLport provider repair: round43 strict refusal

On 2026-10-13, the authorized next step added the native explicit instantiation
`template wchar_t _STL::basic_ios<wchar_t, _STL::char_traits<wchar_t> >::fill(wchar_t);`
to the round42 declaration-only StreamInstantiations candidate. This preserves
the existing 16-byte wide fill setter at RVA0083E960 while declaring the existing
wide init and imbue specializations without defining the wrong incidental copies.
No member, pin, alias, header, ledger, baseline or verifier was changed.

The unchanged mandatory scoped command was:

```sh
BUILD_POOL=1 ./build.sh game/stlport/StreamInstantiations.cpp game/Libraries/Source/WWVegas/WWLib/stlport_ios_base_throw_failure.cpp
```

It exited 1: 21/22 rows passed, but the existing cleanup row
`?dup_00C31B70@@YAXXZ` failed because `$L46470` was not found. The gate
separately recovered the other cleanup row00C55970 from its renumbered label
$L23140, so it was not simply a blanket rejection of label renumbering.
This refusal does not establish why the first cleanup disappeared or whether
its implementation bytes changed. It does establish that this patch cannot
be promoted with the existing unchanged gate.

The complete gate output and exact refused source patch follow. The production
edit was restored after preservation. No retries, repins or source variants
were made after the refusal; the proposed TU split/helper-ownership move was
not attempted. No current-object overlay or linked-credit claim was completed
in this round. The initializer195B and failure24B rows passed in the scoped
run, but this is no new conversion or complete provider repair.

Recommend root bank/defer the pending195B promotion and publish its unrelated
verified work; root alone decides any revert. A separately authorized targeted
assessment must resolve the missing existing cleanup owner before this provider
patch can be reconsidered. Existing round42 helper ownership constraints remain.

## Strict output

```text
Source claims: OK (2 sources, scoped byte-verified)
  FAIL ?dup_00C31B70@@YAXXZ (game/stlport/StreamInstantiations.cpp)
    symbol not found in object: $L46470
Funclet pins: 1 row(s) verified past a renumbered $L label
    ?dup_00C55970@@YAXXZ (game/stlport/StreamInstantiations.cpp): $L46874 was renumbered by an edit to this TU; the body is $L23140 in the object built now (stale ledger pin, not a byte mismatch)
Functions: FAIL 1/22
1 function(s) failed byte comparison
```

## Preserved refused patch

```diff
diff --git a/game/stlport/StreamInstantiations.cpp b/game/stlport/StreamInstantiations.cpp
index 5cf051ad91..b771ac1d46 100644
--- a/game/stlport/StreamInstantiations.cpp
+++ b/game/stlport/StreamInstantiations.cpp
@@ -12,7 +12,16 @@ template <>
 _STL::locale _STL::basic_streambuf<wchar_t, _STL::char_traits<wchar_t> >::pubimbue(
 	const _STL::locale &);
 
+// These wide methods have independently verified out-of-line owners.
+template <> void
+_STL::basic_ios<wchar_t, _STL::char_traits<wchar_t> >::init(
+    _STL::basic_streambuf<wchar_t, _STL::char_traits<wchar_t> > *);
+template <> _STL::locale
+_STL::basic_ios<wchar_t, _STL::char_traits<wchar_t> >::imbue(const _STL::locale &);
+
 template class _STL::basic_istream<char, _STL::char_traits<char> >;
 template class _STL::basic_istream<wchar_t, _STL::char_traits<wchar_t> >;
 template class _STL::basic_ostream<char, _STL::char_traits<char> >;
 template class _STL::basic_ostream<wchar_t, _STL::char_traits<wchar_t> >;
+
+template wchar_t _STL::basic_ios<wchar_t, _STL::char_traits<wchar_t> >::fill(wchar_t);
```

## Publication disposition

The initializer promotion was never published. The coordinator preserved its
source and the failed provider patches, and selected the unrelated reviewed
commits into a fresh integration branch without the initializer promotion.
A proposed reversal in the old integration worktree was itself rejected by
the conversion-direction gate and remains preserved there; it was not retried
or included in this publication. Thus this branch has no initializer source
change, ledger demotion, or claimed new linked credit at 0083F9B0. The historical
round42 statement that the candidate was accepted refers to scoped byte
verification, not acceptance for publication.
