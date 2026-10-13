# 000D6100 canonical integration dependency packet

Round 52 is dependency integration work, not another byte-shape attempt.
The accepted bank and the production wrapper are unchanged. With BUILD_POOL=1,
normal probe measures the banked Player method at 236 bytes with zero masked
differences and five relocations, and its included wrapper at 81 bytes with
zero masked differences and five relocations. Raw logs and snapshot hashes
are in build/worker2-round52. These are probe results, not strict promotion.

## Exact transaction prerequisites

| Dependency | Existing owner and evidence | Missing integration contract |
| --- | --- | --- |
| Player method and wrapper | Rva0058B590Value.cpp declares getRva0058B590Value(int) const and getUpgradeCostChange() const. Existing pins route through 0001D287 and 000225BB. Retail 000C9C20 reads float at +0x644 and returns through ST0. | The available shared Player declaration in inputs/reference/shims/player/Common/Player.h and the upstream Player.h declare neither method. They provide no supported BFME list member at +0x640 or TU member-extension hook. Replacing the wrapper's declaration by that header alone cannot define or call these members. |
| Object hash | GameLogicObjectLookup.h defines ObjectPtrHash at +0xB0, private m_objHash, and public findObjectByID. | Player is not a friend and there is no public hash accessor or TU member-extension hook. The bank inlines find/end and cannot directly access this private member. A private-to-public preprocessor trick, parallel GameLogic declaration or layout cast would evade adoption. Adding legitimate access requires a shared-header transaction. |
| Broad GameLogic header | inputs/reference/shims/sweep/GameLogic/GameLogic.h and GameLogic/System/GameLogic.cpp are based on the Zero Hour layout. | The header comments out m_objHash and instead declares m_objVector. It is not a drop-in owner for this BFME hash. Its implementation also comments out hash initialization/insertion/removal. |
| Object +0x118 | Canonical game/GameEngine/Source/GameLogic/Object/object.h exposes m_modelConditionFlags at +0x110, ten words, and layout checks. | The bank's BfmeObject::m_status is a misleading local label: the byte is in model-condition word 2, bit 3. Canonical adoption can express that existing field directly; it must not use m_status, which is at +0x90. No new Object header member is needed. |
| GameLogic singleton | data_rows owns ?TheGameLogic@@3PAVGameLogic@@A at VA 012F0898 in GameLogic/System/GameLogic.cpp. | Replace the bank's differently typed TheBfmeGameLogic only after choosing one compatible shared GameLogic declaration. |
| Constants | data_rows owns const float g_rva01075350 at VA 01075350 and g_rva0107533C at VA 0107533C, in BfmeAngleWrap0079D0.cpp and aptMathRound.cpp. | The zero and half can use these owners. g_bfmeScaleBC has an existing symbol binding to RVA 00C7FAC4 (VA 0107FAC4), but no corresponding data_rows owner was found. g_rva0058B590Scale is the wrapper's separate declaration; no data row or symbol row under that name was found. Their actual strict resolution still needs verification; no constant aliases or pins were added. |

The access issue spreads beyond the two requested bodies: a direct include
scan finds 44 C++ files including GameLogicObjectLookup.h and 172 including
Common/Player.h. These counts are lower-bound source inventories, not a
substitute for the build dependency graph or the required full gate. There
is no narrowly supported edit that supplies the missing Player layout and
unifies the incompatible GameLogic declarations without that transaction.
No shared header was edited and no gate was bypassed.

## Preserved ABI and identity evidence

Retail 000D6100 ends with RET4 at +0xE9, followed by padding at +0xEC.
Its only outgoing call is the floor import through IAT VA 013593B8;
the signature is double floor(double). The wrapper's two direct routes
are to this method and the seven-byte 000C9C20 float getter; the existing
float-to-long helper remains in its original TU. No helper was reimplemented.
The earlier native-container contract packet retains the hash/vector and
floating-value lifetime proof.

The unchanged actual-RVA oracle API reports placeholder tier and
CONTRADICTED diagnostics for both existing method spellings. Those results
are exempt under the production guard's real-name-only scope; they do not
prove identity. The existing matched wrapper route and full retail ABI remain
the independent evidence. No names were changed.

## Concrete next assignment

Establish the authoritative BFME Player header, including the witnessed
+0x640 list and +0x644 scalar and the two existing method declarations, and
choose a single GameLogic hash owner/access contract. Inventory dependent
bodies before editing and run the full shared-header gate for that transaction.
Then adopt Object and existing zero/half owners, establish strict constant
resolution, integrate the unchanged numerical body beside its wrapper, and
strictly verify both extents. Do not repeat container or expression shapes.
Until those prerequisites are owned, retain the exact bank.
