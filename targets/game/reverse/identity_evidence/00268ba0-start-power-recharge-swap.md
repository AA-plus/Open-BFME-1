# SpecialPowerModule::startPowerRecharge is 0x00268BA0, not 0x0026AE00

Two near-twin bodies were named the other way round:

| Body | Size | Was | ILT | `ilt_oracle.py` for `?startPowerRecharge@SpecialPowerModule@@UAEXXZ` |
| --- | ---: | --- | --- | --- |
| `0x00268BA0` | 214 | `?startPowerRecharge@Rva00268BA0ScaledPowerRecharge@@UAEXXZ` | `0x0000DC5B` | CONFIRMED (exact) |
| `0x0026AE00` | 112 | `?startPowerRecharge@SpecialPowerModule@@UAEXXZ` | `0x00014F6F` | CONTRADICTED (slots 11654-11658) |

## The layout agrees with the oracle

`0x00268BA0` is referenced from the SpecialPowerModuleInterface slot of many
concrete powers' vftables. It reaches the module data and Object at -0xC/-0x8
from the interface sub-object, which puts that sub-object at +0x10 behind the
ObjectModule part. That is exactly `SpecialPowerModule`'s own layout: its
constructor at `0x002693E0` stamps the interface vftable at +0x10, and the
matched `SpecialPowerModule::doSpecialPower` (0x0026A550) reaches its base at
-0x10.

`0x0026AE00` sits in only five vftables and reaches its links at -0x20/-0x1C.
It is therefore an override on a class whose interface sub-object lies at
+0x24, and that owner is not identified.

## The change

The base body takes the real name. The other keeps the method name on an
address-derived class, `?startPowerRecharge@Rva0026AE00SpecialPowerModule@@UAEXXZ`.
Both files are re-homed to match, and both bodies stay byte-exact.
