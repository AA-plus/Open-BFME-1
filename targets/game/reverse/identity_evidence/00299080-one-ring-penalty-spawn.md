# 0x00299080: OneRingPenaltyUpdate helper, not PathfindLayer::isPointOnWall

A naked lift claimed the 257-byte body at `0x00299080` as
`?isPointOnWall@PathfindLayer@@QAE_NPAW4ObjectID@@HPBUCoord3D@@@Z`. That name
takes three arguments and returns a Bool, but the body ends in a plain `ret`
with no stack arguments. It also does nothing Zero Hour's isPointOnWall does
(no wall-piece loop, no geometry test).

Instead it calls `GetGameLogicRandomValueReal(-PI, PI, file, 0xDB)` with the
literal `F:\bfme\Code\gameengine\Source\GameLogic\Object\Update\OneRingPenaltyUpdate.cpp`
(VA 0x010C06B8). Its only caller (through ILT 0x0001085C) is the dump at
0x002995E0, which sits beside the matched OneRingPenaltyUpdate bodies
(0x00298CE0-0x00298FA0, 0x00299400). The body reads module data at +4 and the
owning object at +8, as an UpdateModule does. It then:

- finds the template named at module data +0x08;
- creates it on the neutral player's default team (or the owner's team);
- stores the new object's id at +0x24;
- offsets the owner's position by the module data radius (+0x18) along the
  random angle, on the terrain;
- stores the angle at +0x2C.

The source file is proven by the literal. No caller, vtable or string names
the method, so `OneRingPenaltyUpdateRva00299080.cpp` lands it as
`?rva00299080@OneRingPenaltyUpdate@@QAEXXZ`, matching all 257 bytes modulo
relocations.
