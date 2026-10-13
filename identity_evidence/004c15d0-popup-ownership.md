# Popup manager ownership transaction at 004C15D0

Round41, gpt-6-astra. No production conversion or new verified bytes.

## Independently bounded owner set

The ZH donor `inputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/GameEngine/Source/GameClient/GUI/GUICallbacks/ControlBarPopupDescription.cpp:104` declares `static AnimateWindowManager *theAnimateWindowManager = NULL`. Its show/hide/delete/update family shares that object. This establishes donor compilation context, not BFME spelling by itself.

A scan of the current baseline `.text` for the little-endian VA012F368C finds exactly 11 operands. Disassembly confirms all are absolute manager loads/stores within these four complete retail extents (full listings and operand RVAs in the adjacent JSON):

| Body RVA | Bytes | Existing source owner | Manager instruction offsets |
|---|---:|---|---|
|004C15D0|678|`game/gen_asm/d_004b2470.asm`|174,26A,287|
|004C1450|92|`GUI/GUICallbacks/ControlBar_buildTooltipLayout.cpp`|43,54|
|004C1940|61|`GUI/GUICallbacks/ControlBar_hideBuildTooltipLayout.cpp`|0|
|004C1990|267|`GUI/ControlBar/ControlBarPopupDescriptionUpdateFunc.cpp`|D,4F,A2,D1,F9|

The three C++ paths are below `game/GameEngine/Source/GameClient/`. The assembly filename does NOT identify another manager consumer: its references belong to the show body itself. The scan bounds direct absolute references; it is not a claim that arbitrary indirect aliasing has been disproved.

Existing `symbols.csv` maps `?Glo012F368C@@3PAVGlo012F368CType@@A` to VA012F368C. There is **no data_rows owner** for it. The animation-enable byte at VA012F3690 and show-local state at VA012F369C/012F36A0 likewise have no data_rows entry. Do not invent a duplicate data owner or claim a private scratch global has already been linked.

## One coherent measured trial

Starting from the preferred 678-byte/16-difference bank, a scratch TU retained the existing show body and added the matched hide/delete/update operations around ONE private manager object. The manager fields are independently witnessed at +10/+11; update dispatch is vtable+14. The first callback probe caught an extra scratch virtual slot (+18 instead of +14); removing that accidental extra slot restores the witnessed contract. This was a scratch construction correction, not a gate refusal.

Final masked probes: show678B/3 differences, delete92B/exact, hide61B/exact, update267B/exact. The show differences remain at instructions +200/+203/+20B: ECX and EDX swap between the clone-return load and by-value assignment argument. The manager store at +26A now has the retail position after EH-state reset. No permutations of handle expressions were attempted.

The bank contains all four manager users so the earlier isolated-static bank hazard has an explicit proposed closure. No production row was moved; no strict scoped gate or link result is claimed. The JSON archives raw probe results, original callback mismatch, retail listings, and candidate SHA256. The normal re_log capture performs its own measurement before replacing the weaker preferred bank.

## Identities and contracts

Actual-RVA API checks confirm all three descriptive sibling names. Show's existing `bfmeShowDN` name is tier=invented; its CONTRADICTED statistic does not assert a retail spelling and is exempt under the existing guard. Existing matched callers in `ControlBarRva004C1B60.cpp`, `BfmeConv1941.cpp`, and `Rva003BF540_applyOwner.cpp` provide its independent call contract. No identity was renamed.

Existing constructor/reverse/register methods remain in `GUI/AnimateWindowManager.cpp` (0045D6B0/0045D3E0/0045DB50). Existing equality helper004C10D0 remains in `Common/BfmeTwoHundredThree.cpp`; existing release005929E0 remains in `Common/S3DeleteOwnedMemberAndClear.cpp`. None needs a new pin. Assignment004C1510 remains in `GUI/ControlBar/ControlBarRva004C1510Handle.cpp`; its source models the consuming by-value handle. The unknown source-level clone-to-argument transfer form remains the concrete missing code-generation witness.

## Smallest future production transaction

After resolving that transfer witness, put show/delete/hide/update together in the proven official `GUI/GUICallbacks/ControlBarPopupDescription.cpp`, preserving each identity, and remove only their superseded definitions. Keep the unrelated 26-byte repopulate004C1920 body in the existing buildTooltipLayout source or explicitly claim/validate it if moved. doRepopulate004C1320 and assignment004C1510 do not reference the manager and need not move merely for static ownership.

Validate all four function extents plus their local-data binding and all affected source files. In particular, a masked probe does not establish the private manager's actual address or linked ownership; use the existing normal TU-local data/relocation checks. Do not add an external duplicate via add_data_match: that tool admits EXTERNAL symbols, whereas this proposed owner is a TU static. Preserve existing global names at remaining external bindings, and resolve canonical declaration/adoption requirements before promotion. No new pins, numeric aliases, fallback definitions, baseline changes, or verifier changes are part of this packet.
