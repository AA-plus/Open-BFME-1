# 000D6100 shared-owner assessment (round 54)

The requested padding-only Player transaction is not supported. Headers,
production sources and the exact 236-byte bank remain unchanged.

## Concrete layout conflict

A scratch compilation using the existing BfmeConv926.cpp include flags,
including inputs/reference/shims/player before sweep and the reference tree,
measures the unchanged Player header through public getScoreKeeper() and
sizeof(ScoreKeeper). No private-access macro or layout cast was used.
VC7.1 emits `add eax, 0x358` for the accessor and `mov eax, 0x190`
for the size. The next declared member is the four-byte STLport list
m_kindOfPercentProductionChangeList: its derived position is 0x4E8.
There is no explicit padding between that list and the next timer list.

By contrast, matched PlayerConstructor.cpp (000DD980, 898 bytes) asserts
m_scoreKeeper at 0x348 and defines its extent as 0x2EC. Its following
12-byte m_634 gap ends at the list m_kindChanges at 0x640. Matched
PlayerDestructor.cpp (000DD440, 1043 bytes) independently declares the
same 0x348 / 0x2EC / 0x634 / 0x640 layout and performs native list cleanup.
PlayerInit.cpp additionally asserts m_kindChanges at 0x640 and initializes
m_644 to zero. Retail getter 000C9C20 is exactly seven bytes:
`fld dword ptr [ecx+0x644]; ret`, then INT3 padding. Thus float use of that
storage is independently established, although the constructor/init views
label it as a raw integer word. The two existing wrapper declarations are
float getUpgradeCostChange() const and long getRva0058B590Value(int) const.

The shared shim is therefore short by 0x158 at the list, and already differs
at ScoreKeeper by 0x10 in start and 0x15C in size. Its only explicit BFME
padding arrays are earlier (radar, pre-science and pre-science-purchase).
None spans 0x640. Filling a purported tail gap would invent storage and
shift the existing timer/squad fields. Replacing ScoreKeeper or rebuilding
the whole Player tail is a broader ownership transaction, not this bounded
insertion. The shim itself warns that fields below sciencePurchasePoints
retain unverified Zero Hour relative layout. Adding two method declarations
alone cannot supply the required data layout.

## Public GameLogic route: supported, no access hook required

The authoritative function row for 0009A510, 82 bytes, is now
GameClient/GUI/Palantir/SelectionAll00595230.cpp. Its ordinary inline
GameLogic::findObjectByID(int) definition uses the existing shared
GameLogicObjectLookup.h class and private m_objHash legally, inside the
member definition: reject id zero, native find/end, then return second.
That TU documents one outlined and one inlined caller use. This is stronger
than the stale header comment naming GameLogicFindObjectByID.cpp.

The shared header's optional BFME_GAMELOGIC_LOOKUP_VISIBLE definition is
explicitly noinline, so enabling that option would not request the needed
hash expansion. A normal TU-visible definition following the existing
matched owner is a supported public route; no friend, private/public macro,
parallel GameLogic class or external hash accessor is necessary. This
resolves the prior packet's access concern conceptually. It does not resolve
Player's incompatible storage, nor prove final caller byte equivalence.
No caller shape trial was repeated.

## Validation and retained evidence

BUILD_POOL=1 scratch logs: build/worker2-round54/layout-offset.log and
score-size.log. These tiny accessor/sizeof compilations are layout evidence,
not byte-match attempts at 000D6100; their comparison scores are irrelevant.
The first diagnostic flag /d1reportSingleClassLayoutPlayer was unsupported
by VC7.1; the public-accessor compilation replaced that scratch invocation.
No verification guard was changed or refused. Actual-RVA oracle API for the
existing Player method reports tier placeholder and CONTRADICTED (exempt
under the real-name-only guard); no identity was changed. Boundary remains
236 bytes with RET4 at +0xE9 and padding at +0xEC, as previously established.

Next prerequisite is an authoritative shared BFME ScoreKeeper/Player tail
owner with independently verified timer/squad offsets, followed by complete
dependent inventory and a full header gate. Do not append guessed padding
or repeat the exact-bank shapes. No shared change was staged, so no header
gate or dependent-body claim expansion was initiated.
