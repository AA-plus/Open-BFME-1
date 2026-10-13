# 003AEBB0 native string copy assessment — 2026-10-13

Boundary: the generated row is open fallback work per list_naked_candidates
shard0/5 and brief.py. Full disassembly ends at +0x74 with RET, confirming
117 bytes (the queue dump excludes relocation bytes and lists 102).
The matched PAVectorEraseRangeFamily003AF.cpp erase specialization for
Elem003AF860 calls this copy-range body. Its semantics and address are known;
no retail spelling is asserted by `_Rva003AEBB0CopyRange`.
Explicit integer-RVA oracle result is tier=placeholder, CONTRADICTED
(slot13698, window10184-10189). This is exempt under the existing production
real-name policy; no renaming or gate modification was attempted.

The preferred bank declares UnicodeString::set. Current callees.py instead
resolves all three direct calls to compiled object symbol
`?set@?$StringBase@D@@QAEXABV1@@Z` at0x00887C90. The definition in
`game/Libraries/Source/string/StringBase.cpp` acquires StringBaseLock<T>,
releases the receiver buffer, copies the source pointer and increments its
reference count. Canonical declaration is in
`game/Libraries/Source/WWVegas/WWLib/string_base.h`. This supplies an existing
native contract without a new pin or duplicate string class.

Scratch starts from the unchanged bank, replaces its local UnicodeString
class with that header and uses StringBase<char> for the three string fields.
The bank's positive-count return `result + total` advances the already-walked
pointer a second time. Retail instead preserves original result+count*32 in
EBP (+0x13 load, +0x1B shift, +0x24 add) and returns it after the walk.
Scalar/string offsets and element names are unchanged.

Measured unchanged probe.py results (BUILD_POOL=1):

- Return the advanced result: 111B versus117B, 82 nonrelocation byte differences,
  first +0x10. Native call binding compiles but EBP endpoint is absent.
- Preserve an endpoint before the loop and return it:119B versus117B,
  86 nonrelocation byte differences, first +5. It loads destination into ECX
  before saved-register setup; retail delays that load into EBP. Shape0.898,
  seven structural differences. This is not byte-match proof.

Initial scratch compile lacked repository-root /I.; adding it in the scratch
cl comment fixed that routine include-path error. Both intended probes then
completed successfully. No strict production gate was invoked; no source,
ledger, bank, pin, shared header or baseline was changed. No new score claimed
or bank replacement: two supported native/return trials did not become exact.
Earlier loop/permutation attempts remain exhausted. Future work requires an
independent source-context explanation for destination setup, not a repetition
of these return forms. Scratch originals, sources and raw probe output remain
in build/worker1-round48/.

t=1.6min model=gpt-6-astra lane=R budget=30m blocker=regalloc/prologue-schedule.
