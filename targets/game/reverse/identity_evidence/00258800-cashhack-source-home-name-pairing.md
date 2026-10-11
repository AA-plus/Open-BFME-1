# CashHack action source-home move retains its identity

The deleted lift's `CashHackSpecialPower` type and `doSpecialPowerAtObject`
method have not been renamed to `Gen_000E8AF0` or `bfmeAddCount`.
Those are an additional, separately verified dependency declaration.

Independent identity evidence predates this conversion:

- `specialpower-slot11-12-dospecialpower.md` records the registered
  CashHackSpecialPower constructor at RVA 0x00258250 installing its
  secondary vtable 0x010B3888 at object +0x10. Slot 12 contains ILT
  0x00048699, which jumps to the action at RVA 0x00258800. Slot 11
  contains a different SpecialPowerModule action at RVA 0x0026A550.
- The retained canonical declaration is `class CashHackSpecialPower :
  public SpecialPowerModule` in the upstream `GameLogic/Module/
  CashHackSpecialPower.h`, included by the source home. It declares
  `virtual void doSpecialPowerAtObject(Object *, UnsignedInt)`.
- The new source home still defines
  `void CashHackSpecialPower::doSpecialPowerAtObject(Object *, UnsignedInt)`.
  Its ledger identity remains
  `?doSpecialPowerAtObject@CashHackSpecialPower@@UAEXPAVObject@@I@Z`
  at RVA 0x00258800, extent 439 bytes. GUI:AddCash/GUI:LoseCash remain
  target literal anchors; the strict scoped gate verifies this action,
  its cleanup and every sibling row (20 total).

`Gen_000E8AF0::bfmeAddCount(int)` is a different pre-existing function:
`Bfme5TinyTwenty.cpp` defines it, and its ledger row owns RVA 0x000E8B20,
30 bytes. Independently decoded retail loads TheGameLogic at 0x012F0898,
tests its byte +0x90, conditionally adds the argument to receiver +4,
and returns with RET4. The CashHack action calls it through ILT 0x0003A45E.
It is a dependency, not the action or its owning module class.

The regression checker pairs the deleted one-method lift against the expanded
canonical home and aligns it with this additional dependency's one-method
class. The two exact-snapshot entries close only those false pairings under
`docs/naming_evidence.md`'s documented source-snapshot procedure. They do not
change names, addresses, verifier behavior or any general baseline.
