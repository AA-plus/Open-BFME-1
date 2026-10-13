# RVA00206890 corrected query control flow (2026-10-13)

Selected from proven-boundary fallback shard0/5. The156-byte body ends
with RET4 at+99; all branches stay within00206890..0020692C. The misleading
generated labels at00606900/006068E0 are VAs within this body, not ICF proof.
The interface receives an ObjectID on the stack and subtracts0x20 from this
for the existing sweep callee. Its enclosing semantic method spelling remains
unproven; the original Rva00206890SiegeDockingInterface::query is retained.
Actual-RVA oracle API: tier=placeholder; CONTRADICTED p=0.0000652298700621,
slot30400 window19066-19066. This is not a real-name guard rejection.

## Contract correction and existing bindings

Retail+57 JNE+82 skips an entry with nonzero field+20. The old bank returns
true instead. Retail+79 JNE+93 returns true if bit0x400 is set in the resolved
template word+D8; +80 JE+93 also returns true if entry+4 is null. The bank
reverses this combined predicate. Correct result: for an unclaimed entry,
return true on (templateFlags &0x400) !=0 OR entry+4==null; otherwise advance.

The object+4 template pointer is conditionally resolved through its override
link+4, then dereferenced at+D8. A null pointer follows the common dereference
path in retail; adding a null skip changes behavior. Native
OVERRIDE<ThingTemplate> reproduces this instruction-level contract. The
canonical Object and Overridable headers and native template layout are
already used by matched Rva00372E40.cpp.

The direct routes independently resolve as follows:

- caller+0E: ILT0001F253 ->0009A510 GameLogic::findObjectByID; existing
  GameLogicObjectLookup.h exposes its native hash-map body when requested.
- caller+25: ILT0001011D ->00206460 BfmeHostERP::bfmeSweepERP; its matched
  BfmeConv1959.cpp definition iterates the same entry vector at outer+24.
  The old bank's BfmeOuterCFD::bfmeTwoCFD spelling was replaced only in scratch
  with this existing proven declaration, never with an address placeholder.
- caller+6B: ILT000022BB ->00087A80 const Overridable::getFinalOverride,
  a26-byte next-link traversal. The old nonconst declaration was corrected.

Original bank snapshot: build/worker1-round45/original.cpp. No bank/name/pin
mutation was made. No invented helper names or numerical aliases were used.

## Measured results

All three unchanged probe.py runs use BUILD_POOL=1, size156 and the same
original query symbol. Each compiled successfully:

| Candidate | Size | Nonrelocation differences | First difference |
|---|---:|---:|---|
| Corrected predicates and override traversal |143|108|+19|
| Canonical Object/OVERRIDE/ThingTemplate declarations |143|108|+19|
| Canonical declarations plus authentic lookup visibility |143|108|+19|

All have4 relocation sites, two shifted versus retail; normalized instruction
shape is0.862 (not a match score or strict verdict). Retail+19 branches over
an immediate false epilogue; reconstruction shares a later false tail and
changes the subsequent register schedule. The native header form reproduces
the corrected manual traversal but does not solve tail placement. Authentic
lookup visibility also has no effect here. No further expression permutations
were attempted after these bounded structural trials.

No bank improvement, conversion, strict gate result or linked-byte credit is
claimed. Production and the existing0.82-author-estimate bank stay untouched;
the latter's two reversed predicates must be repaired before reusing it.
Scratch contains original.cpp, corrected.cpp, native.cpp, visible.cpp, the
three probe logs and full retail.txt. A future trial needs new source-backed
control-flow or compiler-context evidence rather than repeating these shapes.
