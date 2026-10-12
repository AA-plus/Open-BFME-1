# AISkirmishPlayer recruitment override at 0x001699C0

## Claim and row correction

Retail 0x001699C0 (1130 bytes, `RET 0xC` at +0x467, then INT3) is
`?recruitSpecificAITeam@AISkirmishPlayer@@UAEXPAVTeamPrototype@@MPBVCoord3D@@@Z`,
`AISkirmishPlayer`'s override of `AIPlayer::recruitSpecificAITeam`. The landed
source is `game/GameEngine/Source/GameLogic/AI/AISkirmishPlayerRecruitSpecificAITeam.cpp`.

The existing matched row claimed `?recruitSpecificAITeam@AIPlayer@@UAEXPAVTeamPrototype@@M@Z`
at 0x001699C2/1654B from `game/GameEngine/Source/GameLogic/AI/AIPlayer_recruitSpecificAITeam.asm`.
That row is wrong three ways: the name carries the two-argument Zero Hour ABI
this body does not implement, the start omits the two-byte `push -1` prologue at
0x001699C0, and the 1654-byte extent runs 0x20E bytes past the body's own
`RET 0xC`, over 0x10E bytes of `0xCC` padding and 232 bytes of thin accessor
stubs at 0x00169F50. This note lands the corrected row and retires the old one;
`tools/add_match.py` cannot express the correction itself, because its
`--replace-rva` containment rule requires the old range to sit inside the new
body and here it does not.

## Identity evidence

**Decorated name.** `python3 tools/ilt_oracle.py check '?recruitSpecificAITeam@AISkirmishPlayer@@UAEXPAVTeamPrototype@@MPBVCoord3D@@@Z' 0x001699C0`
returns `CONFIRMED p_false=6.52e-05 (exact)`. The frozen window
(`targets/game/reverse/ilt_windows.tsv`, slot 42270) is the single bucket
25460..25460, bounded by the anchors `?winGetInstanceData@GameWindow@@QAEPAVWinInstanceData@@XZ`
(0x00478C60, slot 42268) and `?WOLGameSetupMenuUpdate@@YAXPAVWindowLayout@@PAX@Z`
(0x004F6B60, slot 42271); a variant sweep found no other spelling that hashes
into it. The third parameter is spelled with the class key: the ILT name is
`...MPBVCoord3D@@@Z`, and `...MPBUCoord3D@@@Z` (the `struct` spelling) leaves the
third argument undefined in the object and does not compile against this body.

**Vtable and thunk.** The matched `AISkirmishPlayer` constructor at 0x00168660
installs vtable VA 0x01096FB0. Slot 10 (byte offset 0x28) holds VA 0x0043499B,
i.e. ILT RVA 0x0003499B, whose complete five-byte body `e9 20 50 13 00` jumps to
RVA 0x001699C0. The same table is self-consistent: its slot 4 (0x00169290) is
the already-landed `AISkirmishPlayer::computeSuperweaponTarget`
(`targets/game/reverse/identity_evidence/0x00169290-superweapon-return-abi.md`).

**Callers.** The matched `Player::recruitSpecificTeam` at 0x000C9790 loads its AI
receiver from `Player+0x220` and tail-jumps through vtable offset 0x28 without
changing the three stack arguments; the complete `ScriptActions::doRecruitTeam`
caller at 0x002F37E0 pushes a coordinate pointer, the radius dword and the
prototype pointer in that order, and its alternative path pushes a null
coordinate pointer. Both are matched rows, and both pass the three-argument
`(TeamPrototype *, Real, const Coord3D *)` list this body reads: the first slot
as the prototype pointer, the second compared as an x87 float, the third loaded
at +0x1E0 and tested at +0x1E6, where a non-null pointer replaces the template
home location.

**Extent.** The first instruction is the two-byte `push -1` at 0x001699C0
(`6a ff 68 00 59 00 01 ...`); the body's two returns are both `RET 0xC`, at
+0xC0 and +0x467, and byte +0x46A is `0xCC` padding. Both are consistent with the
three stack arguments (12 bytes) and a void return.

## Byte gate

`python3 tools/probe.py game/GameEngine/Source/GameLogic/AI/AISkirmishPlayerRecruitSpecificAITeam.cpp '?recruitSpecificAITeam@AISkirmishPlayer@@UAEXPAVTeamPrototype@@MPBVCoord3D@@@Z' 0x001699C0 --size 1130`
reports `ours=1130 retail=1130 relocs=65` and `EXACT (modulo relocation slots)`.

## Retired bytes

Retiring the old row leaves 0x00169E2A..0x00169F50 as `0xCC` padding and
0x00169F50..0x0016A038 as unclaimed sixteen-byte-aligned accessor stubs
(`mov eax,[ecx+0x208]; ret` and neighbours). Those are separate bodies with no
identity evidence yet and are deliberately left unclaimed rather than carried
under a name the retail bytes do not support.
