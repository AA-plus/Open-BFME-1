# Bridge tower damage at RVA 0x001F6250

## Result and reopening condition

No source recovery landed. The preferred body remains targets/game/reverse/attempts/0x001f6250.cpp, byte-for-byte unchanged (SHA-256 3bf914d6945a2117fdab7f98b285223a28e15ad51c5757dfece023b65c9025ec). It emits 514 bytes and fails the strict scoped comparison with 62 differences. The existing dump passes its scoped gate. The tested revision is a70037880c51ade71fd7b86b8939786b2aa0b818, using model=gpt-6.1-sol.

A useful next experiment must retain retail's two loads of the source object's template while assigning the damage-input and tower-counter web to EBX and the bridge interface to EBP. Exposing the real override helper reverses the register allocation, so the earlier claim that source cannot move the register assignment is refuted. That exposure also makes VC7.1 cache the template and changes the instruction sequence. None of this run's candidates improves the preferred body. Assembly necessity and a different compiler build have not been established.

The bank also declares its unused input m_sourceTemplate field as a pointer. The actual input constructor and copy helper use a 16-bit field at input+0x08, with padding before input+0x0C. A completed source must describe that representation with a verified local view; this note does not establish that field's semantic identity. Expanding the input and output views to the witnessed layout did not change the target's residue.

## Boundary, identity and ABI

The complete target decode is build/onDamage-001f6250/001f6250.decode.log. It has RET 4 paths at +0x0082 and +0x01FF, and the next fourteen bytes are INT3 padding. Every outgoing branch stays inside the extent and lands on an instruction boundary. The control-flow and stack audit is build/onDamage-001f6250/control_audit.log; its call-cleanup assumptions are printed and were checked against the direct helpers and the virtual call contracts. Both returns restore the incoming stack pointer before consuming the one explicit argument.

The complete 96-byte constructor at 0x001F6000 installs the damage-interface table at module+0x18. Its table at VA 0x010A2A68 has slot zero pointing through ILT 0x0003A4CC to this body, and slot one through ILT 0x00045C2D to the already-matched onHealing sibling. The table at module+0x10 supplies getBridgeID. Its ILT 0x0004B40C reaches the complete getter at 0x001F5FC0, which reads interface+0x0C and returns EAX. The target uses incoming ECX at the damage subobject, obtains that interface at this-0x08 and the owner object at this-0x10. The constructor and both tables were inspected, rather than accepting the earlier slot description alone.

The ILT oracle confirms onDamage, the constructor, getBridgeID, getTowerID, DamageInfo's constructor, DamageInfoInput's constructor and the const Overridable getter. Raw outputs are build/onDamage-001f6250/oracle_onDamage.log, oracle_bridge_ctor.log, oracle_bridge_getter.log, oracle_tower_getter.log, oracle_damage_ctor.log, oracle_damage_input.log and oracle_override.log. The enum decoration of GameLogic::findObjectByID is confirmed at its actual ILT, whereas the int decoration used by GameLogicObjectLookup.h is contradicted there. Those results are oracle_lookup_enum.log and oracle_lookup_int.log. The existing bank correctly retains the enum decoration. No callee row, pin or canonical header was changed.

The direct calls use ILTs 0x0001F253, 0x000022BB and 0x0002C9D5. Their complete bodies at 0x0009A510, 0x00087A80 and 0x000ED430 were decoded, with checked inventories in checked_lookup.log, checked_override.log and checked_damage_ctor.log under build/onDamage-001f6250/. Lookup takes the receiver in ECX and one 32-bit stack argument, returns the object in EAX and consumes four bytes. Override takes only ECX, returns the final pointer in EAX and uses a plain RET. DamageInfo construction receives the destination in ECX, calls the input constructor on destination+0x04 and returns that destination in EAX. No hidden stack return storage occurs at these sites.

Virtual calls were reviewed separately. The bridge-ID getter is the preceding interface's slot one; the module getter uses the module's +0x0C interface and slot +0x2C. getTowerID takes one signed 32-bit argument and returns one 32-bit ID; its complete 25-byte body rejects values below zero or at least four and ends in RET 4 on both paths. The health getter is slot +0x18 with a result consumed from ST(0), consistent with the canonical Real contract; a particular runtime body-module implementation is not asserted. Object's slot +0x34 routes through ILT 0x00038280 to the complete 109-byte body at 0x001D4810, which consumes one pointer argument on its return paths or forwards it by a tail jump to slot +0x38. That body and its indirect tail were inspected. No return value from damage dispatch is used by this target.

The frame holds the incoming receiver at +0x10, damage percentage at +0x14 and bridge pointer at +0x18 after all four saved-register pushes. The tower packet begins at +0x1C and the bridge packet at +0x78, each occupying 0x5C bytes. The original argument is reloaded from its incoming stack home. Source-ID, damage-type, death-type and amount accesses agree at packet offsets +0x08, +0x10, +0x18 and +0x1C. The death-type stores follow an argument push, which adds four to their printed ESP displacement. The target has no exception frame or cleanup calls.

## Value layout evidence

The object-lookup writer at 0x0038E490 reads Object+0x74 and passes that key by reference to the map at GameLogic+0xB0, then writes the original Object pointer through the returned mapped-value address. The complete indexing body at 0x0038B980 builds an eight-byte value with the ID in its first word and a zero mapped word. Its insertion body at 0x00389A20 reaches the actual value-copy helper through ILT 0x0002D074. The complete helper at 0x00385E30 copies both 32-bit words and no other fields. The insertion places them at node+0x04 and node+0x08, respectively; node+0 is the next pointer. The target then compares the first word with getTowerID's result and uses the second word as the Object receiver for body access and virtual dispatch. These decoded uses establish a 32-bit object-ID key and an object-pointer payload, independently of allocation size or the ledger's scalar-template spelling.

The packet constructor at 0x000ED430 initializes the input at +0x04 and output at +0x4C. Its complete input constructor at 0x000ED2D0 initializes every witnessed field through input+0x44, including the 16-bit input+0x08 field and the two one-byte fields at +0x1C and +0x1D. Object's pending-damage copy reaches the complete constructor at 0x001C3E00 and then the complete input-copy helper at 0x001C07A0. That helper copies the same narrow fields and every 32-bit input field through +0x44. The outer helper writes the output fields at packet+0x50, +0x54 and +0x58. Raw decoded bodies and checked inventories for all these extents are retained under build/onDamage-001f6250/.

## Located residue

Every difference is listed with its retail and object instruction in build/onDamage-001f6250/bank.analysis.log. The source emits the same meaningful instruction sequence after swapping EBX and EBP and accounting for loop padding, direct-call relocations and the recorded global. All branch destinations also correspond after instruction alignment; control_audit.log checks that separately rather than ignoring branch operands.

The first unequal byte is the saved-register push at +0x003C. The initial damage-input pointer and the later tower counter occupy EBX in retail and EBP in the bank; the bridge interface occupies the opposite register. Retail's [EBP] vtable load at +0x00E2 needs a zero displacement, making it one byte longer than the bank's [EBX] load. Instructions from the following push through the hash bucket lookup are consequently displaced by one byte. Retail emits a one-byte NOP at +0x011F; the bank emits two-byte padding starting at +0x011E, restoring alignment at +0x0120. Remaining differences affect the counter increment, comparison and saved-register pops. The global relocation inside the shifted region is included in the scoped comparison, so the printed count is a position-based byte comparison rather than an independent count of semantic errors.

Exact difference offsets from the saved measurement: +0x003C, +0x0041, +0x0048, +0x005E, +0x0069, +0x006B, +0x0078, +0x0079, +0x0086, +0x00E1, +0x00E3, +0x00E4, +0x00E5, +0x00E6, +0x00E7, +0x00E8, +0x00E9, +0x00EA, +0x00EB, +0x00EC, +0x00ED, +0x00EE, +0x00EF, +0x00F0, +0x00F1, +0x00F4, +0x00F5, +0x00FA, +0x00FB, +0x00FC, +0x00FD, +0x0100, +0x0101, +0x0102, +0x0103, +0x0106, +0x0107, +0x0108, +0x0109, +0x010A, +0x010B, +0x010C, +0x010D, +0x010E, +0x010F, +0x0111, +0x0112, +0x0113, +0x0114, +0x0117, +0x0118, +0x0119, +0x011A, +0x011B, +0x011C, +0x011D, +0x011E, +0x011F, +0x018E, +0x0190, +0x01F5, +0x01F6.

## New experiments

Each row below is generated from the unedited probe output. Sizes and differences come from that probe's explicit retail extent. A shorter or longer output has an additional extent mismatch; the differences column alone measures the overlapping bytes. Trial sources, object snapshots, relocation inventories and complete probe outputs are retained under build/onDamage-001f6250/ with the row's stem. The running record is build/verdict.txt.

| Trial stem | Emitted bytes | Probe differences | Raw output |
|---|---:|---:|---|
| bank | 514 | 62 | build/onDamage-001f6250/bank.probe.log |
| visible_lookup | 514 | 62 | build/onDamage-001f6250/visible_lookup.probe.log |
| visible_override | 514 | 85 | build/onDamage-001f6250/visible_override.probe.log |
| visible_override_native | 514 | 85 | build/onDamage-001f6250/visible_override_native.probe.log |
| visible_damage_ctor | 514 | 62 | build/onDamage-001f6250/visible_damage_ctor.probe.log |
| visible_damage_input | 514 | 62 | build/onDamage-001f6250/visible_damage_input.probe.log |
| opaque_first | 514 | 62 | build/onDamage-001f6250/opaque_first.probe.log |
| opaque_second | 514 | 85 | build/onDamage-001f6250/opaque_second.probe.log |
| nonconst_first | 514 | 62 | build/onDamage-001f6250/nonconst_first.probe.log |
| nonconst_second | 514 | 62 | build/onDamage-001f6250/nonconst_second.probe.log |
| override_default_inline | 534 | 321 | build/onDamage-001f6250/override_default_inline.probe.log |
| override_forceinline | 534 | 321 | build/onDamage-001f6250/override_forceinline.probe.log |
| override_volatile_template_diagnostic | 514 | 62 | build/onDamage-001f6250/override_volatile_template_diagnostic.probe.log |
| factored_dispatch | 493 | 351 | build/onDamage-001f6250/factored_dispatch.probe.log |
| factored_dispatch_inline | 493 | 351 | build/onDamage-001f6250/factored_dispatch_inline.probe.log |
| factored_fraction | 514 | 62 | build/onDamage-001f6250/factored_fraction.probe.log |
| factored_populate | 514 | 62 | build/onDamage-001f6250/factored_populate.probe.log |
| native_donor | 536 | 417 | build/onDamage-001f6250/native_donor.probe.log |
| native_port | 573 | 299 | build/onDamage-001f6250/native_port.probe.log |
| native_views | 514 | 62 | build/onDamage-001f6250/native_views.probe.log |
| native_enum_hash | 514 | 62 | build/onDamage-001f6250/native_enum_hash.probe.log |
| raw_hash | 501 | 260 | build/onDamage-001f6250/raw_hash.probe.log |
| raw_hash_iterator | 505 | 269 | build/onDamage-001f6250/raw_hash_iterator.probe.log |
| nested_success_iteration | 514 | 62 | build/onDamage-001f6250/nested_success_iteration.probe.log |
| nested_continue_iteration | 498 | 288 | build/onDamage-001f6250/nested_continue_iteration.probe.log |

The visible object lookup matches its complete body without relocations. The expanded visible packet and input constructors match their complete probe comparisons with relocation slots masked; those constructor trials have no strict landing certificate. Their raw checks are helper_lookup.probe.log, helper_damage_ctor.probe.log, helper_damage_outer.probe.log and helper_damage_input.probe.log under build/onDamage-001f6250/. They leave the caller unchanged. The first while-spelled override helper differs in its own registers and is not a usable copy. The native recursive noinline definition reproduces the override body exactly (helper_override_native.probe.log), gives retail's EBX/EBP assignments, and makes the caller retain the template instead of retaining the source object. Default and forced inlining expand the override traversal, contrary to retail's calls.

Keeping the first override call opaque restores retail's two template loads but also restores the bank's register allocation. Keeping the second call opaque does not prevent the first call's readonly summary from caching the template. The nonconst overload trials are negative diagnostics; adding that overload changes recursive overload resolution inside the const definition, so those trials are not accepted helper reconstructions. A volatile-template diagnostic restores the same bank bytes and is not proposed as a declaration recovery.

Factoring whole damage dispatch into one inline helper lets the two packets share a stack slot and changes the frame. Factoring just the fraction or packet population leaves the bank unchanged. The full native donor has incompatible BFME field, slot and destructor declarations. Native inheritance with decoded local BFME views returns to the same bank residue. Enum-key hashing leaves it unchanged. Simpler hash traversal loses the separate bucket-start reload that retail retains. Putting propagation inside the successful scan iteration leaves it unchanged; an explicit continue variant changes control flow and is worse. No global flag sweep, declaration-order sweep, typed fastcall sweep or previously exhausted shape-family sweep was repeated.

## Verification and retained work

build/onDamage-001f6250/check_csv_initial.log records the initial CSV pass. build/onDamage-001f6250/baseline.scoped-gate.log records the existing dump's normal scoped build, including call, body and DIR32 checks. build/onDamage-001f6250/bank.scoped-gate.log records the C++ bank's strict relocation resolution and expected byte failure, with no unresolved references or boundary issue. Final CSV validation is retained as build/onDamage-001f6250/check_csv_final.log. A full gate is not required for an evidence note and attempt-log row; no game source, ledger, pin, shared header or baseline changed.

The repository log tool appended exactly one verdict row and retained the existing log bytes. Its receipt is build/onDamage-001f6250/record_verdict.log. The default whitespace check reports that row's CRLF terminator as trailing whitespace (whitespace_default.log); the check configured to recognize CRLF passes (whitespace_crlf.log). Both raw outputs are under build/onDamage-001f6250/. symbols.csv remains entirely CRLF and unchanged.

The existing bank is preserved. Every trial and raw result remains under build/onDamage-001f6250/ for coordinator collection. These measurements establish the listed negative experiments and the helper-visibility effect. They do not establish an exact recovery or the impossibility of another C++ shape.
