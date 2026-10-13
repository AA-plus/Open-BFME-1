# 0x0010AF70: UpgradeCenter::canAffordUpgrade takes four arguments in BFME

The 86-byte body at `0x0010AF70` returns with `ret 0x10`, which is four stack
arguments. The naked lift claimed it under Zero Hour's three-argument
decoration `?canAffordUpgrade@UpgradeCenter@@QBE_NPAVPlayer@@PBVUpgradeTemplate@@_N@Z`.

The body passes its third argument, together with the player, to the
two-argument `UpgradeTemplate::calcCostToBuild(Player *, const ThingTemplate *)`
(ILT 0x0003F8D7 to the matched 0x0010A850). It tests its fourth argument
before posting `"GUI:NotEnoughMoneyToUpgrade"` through TheInGameUI's
variadic `message` (vtable +0x30, caller-cleaned).

`python3 tools/ilt_oracle.py check` reports
`?canAffordUpgrade@UpgradeCenter@@QBE_NPAVPlayer@@PBVUpgradeTemplate@@PBVThingTemplate@@_N@Z`
as CONFIRMED (exact) at `0x0010AF70`. It contradicts both the three-argument
name and the `(..., Bool, Bool)` spelling. The matched `AIPlayer::buildUpgrade`
(AIPlayerBuildUpgrade.cpp) calls it as `(player, upgrade, NULL, FALSE)`.
`UpgradeCenterCanAffordUpgrade.cpp` reproduces all 86 bytes, modulo
relocations.
