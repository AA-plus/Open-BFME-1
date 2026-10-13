# Contracts at00132AE0 and0029AC40

2026-10-13, gpt-6-astra, coordinator round39 targeted dependency investigation. This supplements00225700-native-integration-assessment.md; it does not retry that caller or its byte experiment.

## Result and permitted next step

Neither helper admits a proved small existing-definition correction under the no-new-pin constraint. Keep the existing production declarations unchanged pending an explicit identity repair. Do not widen KindOfMaskType merely to192, and do not infer the physics member name from callers that themselves adopted the same disputed pin. No C++/header/pin/ledger change, new alias, compiler probe or strict gate was attempted. This packet supplies a bounded mask contract, independent call-site witnesses, affected declarations and snapshots for a future repair.

##00132AE0: full contract, with a narrower remaining question

The41-byte wrapper is ECX-thiscall, receives one pointer/reference stack slot, returns a Boolean in AL and delegates cleanup to a tail-called RET4 leaf. It loads receiver+4 at+0, conditionally follows template+4 through000022BB ->00087A80 at+19, adds+C8 at+7 or+1E, and tail-jumps through000497D3 at+D/+24 to00132A20. There is no extra wrapper frame or local mask copy.

The independently matched109-byte leaf (`Common/Thing/Rva00132A20ThingMask.cpp`) ANDs both arguments at offsets0,4,8,C,10,14. It scans exactly six result words: indexed load+50, `cmp eax,6`+58, Boolean returns+5D/+65 and RET4+62/+6A; INT3 starts+6D. `name_oracle --class Thing --offset4` witnesses m_template (0.91), and `--class ThingTemplate --offset0xC8` witnesses m_kindof (1.00). These independently support the receiver and field association, not the original decorated method/type spelling.

A stronger caller bound comes from matched Drawable_setIndicatorColor.cpp, RVA004186E0,143B. It allocates18 hex bytes at+4, constructs six words at+2E..+52, sets mask word5 to0x80000 (+3E/+43: bit179) and word3 to0x800000 (+4B/+52: bit119), passes the mask address at+51, calls0004250A at+56, and tests AL at+5B. Thus a bit-count interpretation must include bit179: capacity is at least180, and six32-bit words bound it at192. This is more specific than the earlier161..192 storage-only bound. The bytes alone cannot distinguish180 from181..192 or establish that the original parameter was this template at all.

The current matched caller deliberately uses std::bitset<180> storage, then casts it to const BitFlags<116>& solely to reach the existing binding. PlayerBattlePlanBonuses_apply.cpp is a second independent matched caller at000D5A40: it declares BitFlags<116> with six explicit words and uses it in BattlePlanBonuses. Those byte-matched caller declarations therefore prove neither a116-bit storage type nor a consistent C++ type across translation units. The actual shared Common/BitFlags.h uses std::bitset<NUMBITS>, so native BitFlags<116> is only four words.

The one-index constructor000C4B00 independently zeros six words at+6..+14 and computes `index>>5` at+28, RET8+36. It has no bounds check or final-word mask; its current BitFlags192 object-symbol cannot establish the exact bit count. KindOfMaskCountThunk.cpp explicitly documents192 as a width-only choice. No name was brute-forced or selected merely by its hash.

Existing source-derived spellings checked with the unchanged explicit-RVA API:

- Thing::isAnyKindOf(BitFlags<116> const&): CONTRADICTED.
- Same member with180 (the matched indicator storage) or192 (the bank/native width surrogate): both CONTRADICTED.
- All three use target00132AE0, slot53505, window31461..31474. These checks do not locate an alternative identity.

### Required kind-of repair

Reconcile the original parameter/method spelling before replacing pins. Preserve and review all three competing existing pins at ILT0004250A: KindOfMask struct, BitFlags69 and BitFlags116. The matched wrapper row is the116 spelling. The leaf already has an honest address-qualified identity and needs no rename. Resolve canonical storage and signature together, migrate the cast-based matched callers coherently, then run the existing full gate for a shared-header change. An isolated signature substitution would leave inconsistent declarations and would not have an existing correct pin to bind the192 bank call.

At minimum inspect: Common/Thing/Thing.cpp; Common/Thing.h and Common/KindOf.h under GeneralsMD includes; Drawable_setIndicatorColor.cpp; PlayerBattlePlanBonuses_apply.cpp; Object.cpp's BfmeKindOfMask/BfmeKindOfTester views; WeaponSet_chooseBestWeaponForTarget.cpp and its KindOfMask call. Read-only textual inventory finds30 game/shim source paths mentioning isAnyKindOf (not a full compiler dependency closure). The exact list is in build/worker1-round39/kindof-affected-paths.txt.

##0029AC40: input proved, original member still unproved

The complete990-byte body has RET4 exits+51 and+3DB and following INT3+3DE. It saves ECX in EBP (+5), loads owning object from receiver+8 (+7), module data from+4 (+13), and eventually loads the incoming pointer from current ESP+40 at+1E2. It reads three float components at pointer+0/+4/+8 (+1E8..+1F1), computes squared magnitude/square roots, constructs a position and calls the three-stack-word helper0000CE28 ->0029AB10 at+3D0. It has no caller-visible result use in the inspected sites. Pointer lifetime is synchronous; no pointer retention was established.

Independent matched caller sites:

| Caller | Evidence |
|---|---|
|001D64B0,70B ApplyRandomForceNugget create | Object+208 loaded at+C; calcRandomForce receives a local three-float output at+2B; address pushed+37, receiver restored ECX+38, force ILT called+3A. |
|0029B310,40B zero-input wrapper |12-byte local, three zero stores+7/+F/+17, pointer pushed+6, ECX forwarded unchanged, same ILT called+1F. |
|00249F50,178B address-qualified list drain | Matched native coordinate-copy caller and identity_evidence/00249f50-list-force.md explicitly avoid claiming the callee name; owner Object+208 is the receiver, scaled XYZ is the one pointer argument. |

The first two callers reproduce bytes using the descriptive pin, but their source comments are not independent proof of that name. The explicit integer-RVA API contradicts applyZeroMotiveForce at0029B310 as well as applyMotiveForce at0029AC40. The other existing donor declarations applyForce and applyShock also contradict0029AC40. The zero-wrapper contradiction specifically invalidates the earlier circular argument in attempt23384 that this caller *confirms* applyMotiveForce. Its zero-vector ABI remains sound.

Actual algorithm landmarks that a future identity/provider repair must retain:

- owner+214 containment/template check at+A..+3C; sleep-forever call000157DA at+46 or wake call+93;
- AI pointer owner+204 and virtual+134 at+65..+79;
- current position owner+38/+3C/+40 at+98..+A1;
- TerrainLogic virtual+1C at+D4 and+361; module-data+4C and global+1AC multiplied in the flight calculation at+125/+128 and later;
- path adjustment through00039649 at+325;
- final three raw arguments at+3C5/+3CA/+3CF, helper0029AB10 at+3D0. Its existing address-qualified provider stores target/original position and the third raw word, then performs state/wake transitions. Its source names strength/when are not proof of the original float/integer semantics of every slot.

name_oracle reports no witnessed PhysicsBehavior layout, no witnessed PhysicsBehaviorModuleData+4C, and no Object+208 field name. The callers prove consistent offsets and an interface association; no new semantic field names are adopted. The donor applyMotiveForce is a39-byte expiry/reset wrapper in earlier measured records, structurally unlike this990-byte terrain/path computation. No fresh probe was needed to repeat that known result.

### Required force repair

Establish the original method identity and owner from a native BFME declaration or independently installed vtable/caller provenance. Then prepare the repository's original snapshots and correction evidence for the existing descriptive pin0002A284 and any affected false-name caller definitions. Audit13 game/shim paths mentioning applyMotiveForce, especially ApplyRandomForceNuggetCreateThunk.cpp, PhysicsBehaviorApplyZeroMotiveForce.cpp, PhysicsUpdate.cpp, and Rva002C1480PassengerRelease.cpp. Reconcile the ABI and semantics with the already matched address-qualified0029AB10 provider before writing a native990-byte body. A numerical alias or merely adding another descriptive pin would not repair this evidence gap.

## Reproduction and preserved state

Run callees.py for00132AE0/41 and0029AC40/990 and callers_of.py for both. dis_retail.py complete decodes are retained in build/worker1-round39 (the force990B decode was also inspected in round38). The caller inventory reports22 kind-of and9 force callers; these are tool-reported known callers, not a claim of complete retail xrefs.

Identity checks use `sys.path.insert(0,'tools'); import ilt_oracle; o=ilt_oracle.oracle(); o.check(symbol, integer_rva)`, with one unchanged oracle instance. Full verdicts are in build/worker1-round39/preflight.json. No ambiguous numeric CLI check was used.

Original source/header snapshots are in build/worker1-round39/originals, with SHA256 manifest snapshots.json. No descriptive identifier was edited. Future changes still require independent identity-correction evidence and normal mandatory gates; this packet is not a waiver.
