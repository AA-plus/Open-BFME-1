# 0x00128FA0: ModuleFactory::~ModuleFactory, not UpgradeModuleModuleData's

The 273-byte SEH body at `0x00128FA0` (plain `ret` at +0x110) was a naked
`__emit` lift named `??1UpgradeModuleModuleData@@UAE@XZ`. A 2026-09 verdict
already flagged that the layout contradicts that class.

## Vftables

The body's entry stamps vftables `0x0108ECE0` at +0 and `0x0108ECCC` at +8.
`dir32_addresses.csv` records exactly these as
`??_7ModuleFactory@@6BSubsystemInterface@@@` and
`??_7ModuleFactory@@6BSnapshot@@@`.

## Teardown order

The teardown is Zero Hour's `ModuleFactory::~ModuleFactory` followed by its
members and bases, in order:

1. Clear the map at +0x0C.
2. Delete every element of the pointer vector at +0x18 through the element's
   first virtual slot.
3. Erase the vector, then free its storage.
4. Destroy the map.
5. Reset +8 to `0x01073744` (`??_7Snapshot@@6B@`).
6. Call `??1SubsystemInterface@@UAE@XZ` on `this`.

## Placement and names

- The matched `??0ModuleFactory@@QAE@XZ` is at `0x00128E30`, just before
  this body.
- `python3 tools/ilt_oracle.py check '??1ModuleFactory@@UAE@XZ' 0x00128FA0`
  is CONFIRMED (exact).
- The `UpgradeModuleModuleData` spelling has no support here.

`game/GameEngine/Source/Common/Thing/ModuleFactoryDestructor.cpp` reproduces
all 273 bytes from Zero Hour's body. It uses STLport `map<NameKeyType, ModuleTemplate>`
and `vector<const ModuleData *>`, and BFME's slot-0 `ModuleData` destructor.

## The scalar-deleting destructor

`0x001295C0` (30 bytes) calls this body through ILT `0x000248E8` and then
frees `this` when bit 0 of its flag is set. It was named
`??_GUpgradeModuleModuleData@@UAEPAXI@Z` only because this body carried that
class's name. `ilt_oracle.py` CONFIRMS `??_GModuleFactory@@UAEPAXI@Z` at
`0x001295C0` (exact), and the row follows the destructor to
`ModuleFactoryDeletingDestructor.cpp`.

## The map's callees

The two map calls go through ILT `0x00037ECF` (`_M_erase`, body `0x00125010`,
53 bytes) and ILT `0x0004A377` (`~_Rb_tree`, body `0x001272E0`, 124 bytes).
Both bodies were generator rows (`game/gen_small/tgrid_104.cpp`) under
placeholder value types. `ilt_oracle.py` CONFIRMS the
`_Rb_tree<NameKeyType, pair<const NameKeyType, ModuleFactory::ModuleTemplate>>`
spelling at both thunks and CONTRADICTS the `int`-keyed destructor. That is
Zero Hour's `std::map<NameKeyType, ModuleTemplate, std::less<NameKeyType>>`.

`ModuleFactoryDestructor.cpp` instantiates both members, and they match
exactly once `ModuleTemplate` has BFME's 16-byte layout: the tree node is
0x24 bytes, and `ModuleFactory.cpp` already reads the interface mask at
+0x0C. Both rows move to that TU under the confirmed names.
