# 008B06C0 record lifetime dependency (round33)

Read-only follow-up to worker5 round32, model gpt-6-astra. No production
reconstruction or bank revision is proposed. The unchanged oracle API with
explicit integer RVA returns UNTESTABLE; this is not semantic identity proof.
Keep the bank entry name unchanged pending independent identity correction.

## Newly traced construction and destruction witnesses

- Matched `BfmeSubmitter1283CreateCharacter.cpp`, RVA008BE760/1162:
  BfmeNodeDX has the record pointer at +50. Descriptor kind5 allocates
  Rva008BD2B0 (kind13). The reused-node path directly assigns node->m_record;
  the new-node path passes the allocated record to bfmeCreate1284. At the
  common tail the record's +0C receives descriptorArg and +04 receives value.
- Matched `MidVptrOnlyDerivedCtors.cpp`, RVA008BD2B0/18, calls the base
  constructor and sets the derived vtable01136DD0. The relevant base is
  Gen_008AC620, constructed by RVA008AD3F0 in Rva008AD3F0Constructor.cpp.
- That constructor's native source allocates `new Rva0089C860State(8)` into
  record+10, sets record+2C to zero and initializes the member at +24.
  Thus the bank State008B06C0 facade denotes a polymorphic per-character
  record; its +10 is a separately allocated child. It is not evidence for
  a local reference-counted wrapper around the record pointer.
- Matched `Rva008AC620Dtor.cpp`, RVA008AC620/133: raw +23 loads record+2C;
  +2B compares against1; +33 loads descriptor+0C and +37 frees it only on
  that branch. +40 prepares member+24 destruction. +53 loads child+10;
  +64 calls0089CC70 then +69/+6C frees that child with size16. RET is+84.
  These observations prove nested ownership actions, without guessing the
  semantic record or descriptor class names.

## Connection to the unfinished body

008B06C0 has complete RET at+2D9 (730B). Raw +1C loads receiver+50 into
EBX; +56 tests record+2C; +61 reads record+0C; +64 reads descriptor+4 and
+6E adds8. +99 reads record+10 as setter receiver. The constructor and
teardown witnesses therefore corroborate the borrowed record pointer and
owned child that the bank already accesses. They do not add a local cleanup
lifetime to finish008B06C0. Adding an owning automatic object here to move
its stack slot would invent retain/release behavior.

The preferred bank's recorded residue remains frame16 versus retail12 and
state/pair register roles. Previous register qualifiers, final-state reload,
scopes, holder layout, EH and helper binding trials already cover those
mechanisms. No new compile or byte progress is claimed by this note.

## Actionable next dependency

Trace the descriptor producer for the object stored at record+0C: prove the
embedded entries object at descriptor+4+8, its fields+10/+28/+2C, and the
8-byte pair's pointer/index element types from its allocator, population and
teardown bodies. The record lifetime itself is now corroborated and should
not be used as grounds for another wrapper trial. A native descriptor/table
layout or proven alias contract could justify a single typed pair traversal
trial; absent that witness, preserve the current bank and choose other work.
