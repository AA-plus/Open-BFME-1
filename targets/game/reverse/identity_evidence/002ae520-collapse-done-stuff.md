# doCollapseDoneStuff is 0x002AE520; 0x002A38A0 is RubbleRiseUpdate::doRubbleDoneStuff

## 0x002AE520 (145 bytes, `ret`)

A naked lift claimed this body as
`?onDie@StructureToppleUpdate@@UAEXPBVDamageInfo@@@Z`, but it takes no stack
argument. Its only caller is a direct call at `0x002AEBD6` inside
`StructureCollapseUpdate::update` (0x002AE950), and it sits among the other
StructureCollapseUpdate bodies (0x002AE160-0x002AE950). It is Zero Hour's
`StructureCollapseUpdate::doCollapseDoneStuff` (the static "BoneFXUpdate" key,
findModule, stopAllBoneFX). BFME adds a module-data flag at +0xF0 that destroys
the object through `TheGameLogic->destroyObject`. `tools/ilt_oracle.py check`
reports `?doCollapseDoneStuff@StructureCollapseUpdate@@IAEXXZ` as CONFIRMED
(exact) here.

## 0x002A38A0 (123 bytes)

This body carried the doCollapseDoneStuff claim, which the oracle contradicts
at this address. Its only caller (through ILT 0x0000520E) is the matched
`RubbleRiseStep002A3B40::update`, on the RubbleRiseUpdate root object. The body
is the flagless Zero Hour shape. Of twelve RubbleRiseUpdate method names
tested, the oracle confirms only `?doRubbleDoneStuff@RubbleRiseUpdate@@IAEXXZ`
(exact). The private `AAE` spelling and `doRiseDoneStuff`,
`doRubbleRiseDoneStuff`, `doCollapseDoneStuff`, `doDoneStuff` and
`doRisingDoneStuff` are all contradicted.

Both bodies reproduce byte-for-byte, modulo relocations: StructureCollapseUpdate.cpp
for 0x002AE520 and RubbleRiseUpdateDoRubbleDoneStuff.cpp for 0x002A38A0.
