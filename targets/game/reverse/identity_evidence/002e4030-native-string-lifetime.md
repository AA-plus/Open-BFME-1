# 002E4030 native string lifetime

Model: gpt-6-astra. Lane R, budget 30m.

## Boundary and identity

The complete retail body starts at RVA 002E4030, ends with RET 4 at
002E413A, and is followed by INT3 at 002E413D: 269 bytes. Incoming ECX is
saved as the host; its Lua states are at +8 and +C. The argument supplies
an object ID at +74, an optional override chain via +4, and the +204 field
used in the early guard. The bank's address-qualified entry and owner names
are retained; no EA class or method identity is asserted.

## Independent contracts

Retail calls 002E32A0 with an object pointer and hidden four-byte return
storage. The existing matched formatter in this TU constructs canonical
AsciiString, reads ID +74 and formats ObjID#%08x. Its existing ledger mapping
and internal linkage remain intact. Expanding its receiver layout preserves
its ID offset; the newly exposed offsets are witnessed by the caller.

The chain call is ILT 000022BB -> 00087A80, the existing final-override
walk. The native Overridable header and its existing const getFinalOverride binding replace the bank's unresolved BfmeSubBIA alias. Automatic inlining is disabled while parsing that header so the retail call remains out of line. No pin is added.

Rva00990030Lookup at 00990030 is the matched 52-byte noncalling Lua record
lookup (Common/Rva00990030RecordLookup.cpp). It takes lua_State* and an int;
its source only tests/reads records. Its nonthrowing declaration is also
witnessed in the matched 002E42C0 Lua-global-check sibling.

00990780 is the C function bfmeGoUPC in vendored Lua/lapi.c. Its existing
identity evidence describes EA's sized-table extension. It receives a Lua
state and integer and returns void; the bank's C++ linkage and opaque
receiver declaration hid its C exception surface. The caller still passes
the independently witnessed object-ID value unchanged.

The other direct calls are Lua C APIs at 0098FDE0, 0098FF40, 00990560 and
009907C0, plus canonical StringBase<char>::releaseBuffer at 00887940.

## Measurements

The preferred bank freshly emitted 269 bytes with 103 nonrelocation
byte differences, starting at +6A where it initialized cleanup state 0.
Canonical AsciiString alone emitted 277 bytes with 121 differences.
Canonical AsciiString plus the independently proven lookup/C-API contracts
emitted exactly 269 bytes with 17 relocations. Retail keeps its EH frame
but stores only state -1 at +ED before releaseBuffer. The existing formatter
TU preserves this exact caller shape and keeps the formatter internal.

The earlier custom string facade is retained as a typedef to AsciiString,
so no existing descriptive identifier is replaced with an opaque name.
No numeric-address workaround, new pin, assembly or shared header edit is
introduced. Strict add_match/scoped verification is recorded in the round
handoff; a probe alone is not a landing verdict.

The canonical override header trial also preserves all 269 bytes and 17 relocations.
The first dated link preview exposed the old BfmeSubBIA alias as unresolved;
this is why the final source uses the existing native binding.

Final validation: strict scoped build passes all three claims; the designated
EH tool updates the formatter cleanup label to $L3106 using its retail state.
Dated link preview (2026-10-09 04:31, e8980d290e) LINKS 142 -> 411 bytes,
a +269-byte preview. This is dated census credit, not a fresh full-link measurement.
Outcome recorded once: t=7.05min, model=gpt-6-astra, lane=R, budget=30m.
