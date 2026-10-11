# RVA 0x002408E0: native type retry

## Result and reopening condition

No source recovery was installed. The preferred bank at targets/game/reverse/attempts/0x002408e0.cpp remains byte-for-byte unchanged. Its complete body emits 439 bytes with 114 probe-masked differences beginning at +0x6 and three relocation-layout drifts. The strict scoped byte check fails its single selected function. All nine new complete-body trial sources and their unedited probe output remain under build/horde-002408e0-run8/.

The retry hypothesis was that independently decoded native key and member types, together with the current landed neighbours and helper declarations, explain the early key spill. A type change must improve the measured body to support further iteration. None improved on the preferred bank. ObjectID conversion delays the key store to the retail position but introduces the already troublesome EBX/EBP lifetime swap. Reopening requires evidence that distinguishes the actual receiver and inline helper lifetime from these measured forms, or a proved declaration for the guarded indirect dispatch. More cached-field or same-type cast variants have no demonstrated lever.

The tested revision is 9e3be919b10ae956e3c8a13995e0d62f2be1d016. The actual model is gpt-6.1-sol. The measurement receipt records the UTC interval from 2026-10-11 09:35:49 UTC to 2026-10-11 09:55:13 UTC, with 1164 elapsed seconds before preservation.

## Boundary, identity and ABI

build/horde-002408e0-run8/retail_decodes.log contains the full target and the complete direct lookup, both erase bodies, the guarded forwarder and the relevant virtual implementations. The target has two RET 4 paths at RVA 0x00240A5B and RVA 0x00240A94. INT3 starts at RVA 0x00240A97. Every conditional destination stays inside the 439-byte body; there is no outgoing tail jump or target EH registration. The incoming receiver is secondary +0xE4 and the stack argument is the member Object pointer. The complete createPayload caller passes that pointer through the same slot and consumes no result.

The constructor decode in build/horde-002408e0-run8/identity-and-calls.log installs VA 0x010AED58 at complete owner +0xE4 at RVA 0x0023EB71. Slot 13 routes through ILT 0x000398F6 to this target. The full matched createPayload body at RVA 0x0023C000 calls slot 13 at RVA 0x0023C10D. Vtable slot 84 routes through 0x00023F1A to the complete 261-byte count body at 0x00238BC0; it returns EAX and accepts a filter pointer. Primary slot 34 routes through 0x0002D001 to the complete 562-byte predicate at 0x00240C50, which returns AL and has no stack argument. The raw table inventories are vtable_secondary.log and vtable_primary.log under the same build directory. measurement.json retains the actual table entry bytes and decoded jump destinations. The existing address-derived view and all bank names are preserved.

The corrected complete Eva extent is 146 bytes, with all three RET 8 paths in build/horde-002408e0-run8/corrected-eva.log. An earlier broad 170-byte capture in identity-and-calls.log includes following padding and is not its boundary certificate. GameLogic destruction ends in RET 4. The BannerCarrierUpdate finder is a complete 110-byte stdcall body: it reads its Object argument from the stack and overwrites incoming ECX. The bank preserves retail receiver setup through its established typed thunk expression. The guarded forwarder ends either in RET 4 or an indirect jump through holder slot +0x54. Its actual indirect target and return declaration remain unverified, so no exact ABI recovery is claimed.

## Independent container evidence

The secondary +0x3C lookup follows 0x0001F91F to 0x00226FA0. Its complete 115-byte body compares signed four-byte keys at node +0x10 and returns the address at node +0x14. Missing-key insertion at 0x00224AD0 reaches 0x00223D20 directly and through 0x00223E00. Both node construction paths call 0x00030788, which jumps to 0x00222520. The full 23-byte value-copy helper reads source +0 and +4, writes destination +0 and +4, and returns after its destination-null guard. It has no other field access. Those accesses establish a two-dword key and payload representation independently of allocation size or donor names. The native STLport 4.6 map<int,int,Rva00226FA0Less> operator[] emitted by the bank independently probes exact over 115 bytes with one relocation in build/horde-002408e0-run8/helper-native-map.log. Its unchanged pin remains a candidate binding, not proof of an original source typedef.

The secondary +0x30 index is not the generated twelve-byte-payload map claimed by an old ledger name. The complete matched neighbour at 0x00240F10 passes Object +0x74 through a scalar temporary to 0x000499F9, which jumps to 0x000EEC50. That complete 145-byte helper reads the signed key at node +0x10 and returns an iterator and bool through hidden storage, with RET 8. Its insertion calls 0x0002ED39, which jumps to 0x000EE420. On both branches the complete 179-byte node constructor reads only source +0 and writes it to node +0x10; all other node writes are the tree header and links. There is no second payload field or external value constructor. This establishes a four-byte identity-key tree. ObjectID is supported by the complete caller and the canonical Object declaration, rather than the 20-byte allocation or a donor name.

Erase 0x0023DC00 uses signed equal-range 0x0023B360 and range erase 0x002358B0. The latter and its recursive cleanup 0x000EE330 release nodes without reading or destroying an additional value field. The native STLport set<ObjectID> trial keeps index30 and its count at secondary +0x34; both its declaration-only and empty() forms emit the identical bank result. The actual lookup chain, node construction and erase decodes are in helper-decoded.log and ownership-and-cleanup.log. Each extent has a corresponding checked_<rva>.log. Generated helper names and constructor payload spellings were not used as independent type evidence.

The free-list construction in the target writes a single dword at node +8 and the next/previous fields at +0/+4. The bank explicitly models insertion before the first node and uses the decoded node-pool allocation entry. Native list and allocator alternatives did not preserve the required inline block. Constructor unwind maps are retained in activebody_unwind.log and hordecontain_unwind.log; they were used to check the evidence routes, not to claim that every base cleanup declaration was recovered. The target constructs no complete owner or BodyModule object. The returned body aggregate field remains address-derived in the preferred bank.

## Complete-body measurements

The table is generated from the retained raw probe logs. Difference counts mask relocation slots diagnostically and do not establish call binding or exactness.

| Trial | Hypothesis | Emitted bytes | Masked differences | First offset | Raw output |
| --- | --- | ---: | ---: | --- | --- |
| baseline | Unedited preferred bank | 439 | 114 | +0x6 | build/horde-002408e0-run8/baseline.log |
| trial01-enum | Keep the cached ID as ObjectID and convert at the signed map lookup | 441 | 311 | +0x2 | build/horde-002408e0-run8/trial01-enum.log |
| trial02-body-accessor | Use the native inline Object getBodyModule accessor | 438 | 332 | +0x6 | build/horde-002408e0-run8/trial02-body-accessor.log |
| trial03-enum-accessor | Combine ObjectID conversion and the body accessor | 439 | 132 | +0x2 | build/horde-002408e0-run8/trial03-enum-accessor.log |
| trial04-set | Declare the independently decoded scalar-key set at secondary +0x30 | 439 | 114 | +0x6 | build/horde-002408e0-run8/trial04-set.log |
| trial05-set-empty | Read the native set count through empty() | 439 | 114 | +0x6 | build/horde-002408e0-run8/trial05-set-empty.log |
| trial06-enum-map | Model the map key as ObjectID and convert the cached int at lookup | 441 | 311 | +0x2 | build/horde-002408e0-run8/trial06-enum-map.log |
| trial07-native-list-eh | Use STLport 4.6 list<int> under the bank exception settings | 420 | 347 | +0x0 | build/horde-002408e0-run8/trial07-native-list-eh.log |
| trial08-allocator | Use the typed native allocator in the manual node insertion | 403 | 313 | +0x0 | build/horde-002408e0-run8/trial08-allocator.log |
| trial09-field-cache | Cache the first owner ID field before reading the member ID | 439 | 114 | +0x6 | build/horde-002408e0-run8/trial09-field-cache.log |

The generated family choices only permute later node-link stores. Those stores already have the retail order and do not supply a supported experiment for the first divergence. They were retained as generated-choices.json rather than used to repeat unrelated register experiments.

The unchanged bank differs at +0x6..+0x2C, +0x31..+0x3D, +0x42..+0x4B, +0x50..+0x66, +0x68..+0x6B, +0x6D..+0x72, +0x74..+0x7A, +0x165..+0x169, +0x16F..+0x173, +0x175..+0x176. measurement.json retains every offset, the source and object hashes, relocation symbols and return-path inventory. The remaining byte blocker is regalloc/source-lifetime: early key materialization, initial body-pointer receiver loading and the early EDI pop. The guarded indirect-call target and return declaration are a separate unresolved ABI check.

## Checks and retained work

The strict scoped byte gate fails 1/1 in build/horde-002408e0-run8/scoped_gate_bank.log. CSV validation, pin consistency and the unchanged bank class gate pass in check_csv_final.log, pin_consistency_final.log and class_gate_bank.log under the same directory. No source ledger, symbol pin, shared header, baseline or preferred bank was changed. A full gate is not required for this evidence-only retry. One blocked verdict is recorded for this run; the existing better bank remains available for a justified future experiment.
