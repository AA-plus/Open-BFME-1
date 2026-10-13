# 0x00167930: AIPlayer::recruitSpecificAITeam, not updateBridgeRepair

The 1077-byte body at `0x00167930` (`ret 0xC` at +0x432, then int3 padding)
was claimed as `?updateBridgeRepair@AIPlayer@@IAEXXZ` by a naked `__emit`
lift. That name is a thiscall `void(void)`, but the body pops three dword
arguments, and its only strings are Zero Hour's recruit lines. A 2026-09
verdict in `re_attempts.log` already refuted the old name for these reasons.

## Vtable slot

The AIPlayer vtable at VA `0x010968B0` (installed by `??1AIPlayer@@MAE@XZ` and
the constructor) has slot 10 (+0x28) = `0x0041177A`, an ILT `jmp` to
`0x00167930`. The neighbouring slots fix the numbering:

| slot | target | identity |
| ---: | --- | --- |
| 9 | 0x001650F0 | `AIPlayer::buildSpecificAITeam` (matched, AIPlayerBuildSpecificAITeam.cpp) |
| 10 | 0x00167930 | this body |
| 11 | 0x00160E00 | 3-byte `return false` (isSkirmishAI) |
| 12 | 0x00160E10 | 3-byte `return 0` (getAiEnemy) |
| 13 | 0x00160E20 | 5-byte `return false; ret 8` (checkBridges) |
| 14 | 0x00165070 | `AIPlayer::repairStructure` (matched, AIPlayerRepairStructure.cpp) |

In Zero Hour's `AIPlayer.h`, `recruitSpecificAITeam` follows
`buildSpecificAITeam` once the three base-building virtuals BFME dropped are
removed.

## Callers

The matched `Player::recruitSpecificTeam` at `0x000C9790`
(PlayerAIDispatch.cpp) calls slot 10 of `Player::m_ai` with
`(teamPrototype, recruitRadius, position)`. The matched
`AISkirmishPlayer::recruitSpecificAITeam` at `0x001699C0` is the slot-10
override in the AISkirmishPlayer vtable, with the same three arguments.

## Body

The body is Zero Hour's `AIPlayer::recruitSpecificAITeam`. Its literals,
read from retail, are verbatim: `"Unable to recruit singleton team '"`,
`"' because team already exists."`, `" - Recruiting."`, `"Team '"`,
`"' recruits "`, `" from team '"`, `"'"`, `" - Finished recruiting."`,
`" - Recruited 0 units, disbanding."`. The calls are the ones that source
makes: `TeamFactory::findTeam` / `createInactiveTeam`, `Team::hasAnyObjects`,
`ThingFactory::findTemplate`, the recruit search (0x000F2A00), Object
vtable slot 20 `setTeam`, `AICommandInterface::aiMoveToPosition`, and
`ScriptEngine::AppendDebugMessage`.

`game/GameEngine/Source/GameLogic/AI/AIPlayerRecruitSpecificAITeam.cpp`
reproduces all 1077 bytes, modulo relocations.

## Decoration

`python3 tools/ilt_oracle.py check` reports
`?recruitSpecificAITeam@AIPlayer@@UAEXPAVTeamPrototype@@MPBVCoord3D@@@Z` as
CONFIRMED (exact) for `0x00167930`. The `PBUCoord3D`, protected and
two-argument spellings are all CONTRADICTED. BFME's `Coord3D` is therefore a
class in this signature, as in the matched AISkirmishPlayer override.
