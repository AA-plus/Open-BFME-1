# Ground-path reconstruction at RVA 0x003F2160

## Result and reopening condition

This retry remains a partial reconstruction. The preferred candidate is `targets/game/reverse/attempts/0x003f2160.cpp`, copied from `build/groundpath-003f2160/27-banked.cpp`. The existing exact MASM row remains the owner of the retail body. No production source, shared header, symbol pin or ledger row was changed. The tested revision is `50d88fcd8075a2f427d1ea11e9409911478432c3`, and the actual model is `gpt-6.1-sol`.

Reopen when independently established source declarations or helper visibility produce measurable improvement at the first divergence. The preferred candidate reserves a different stack frame and keeps the owner in a different register. Native signatures and explicit workspace trials did not remove that divergence. Repeating an unchanged register-mirror spelling has no supporting evidence. A byte-equal future body would still require reconciliation of the public signature, canonical helper declarations and named global bindings described below.

## Retry hypothesis and refutation

The prior records reported an owner-register mismatch and incomplete opaque helper boundaries. The current checkout contains readable, matched donors for world-to-cell conversion, cell-info acquisition, cell lookup, clipping, line traversal, object field access, grid clearing and grid filling. Their actual sources and decoded bodies were checked before copying any implementation. This establishes their availability in this revision; it does not establish when they landed. The new hypothesis was that correct helper ABI, visibility and workspace lifetimes could change the caller's frame and owner allocation. The observation that would refute a particular helper-visibility experiment was an unchanged target instruction and relocation result after independently matching the helper. Several experiments produced exactly that result.

## Boundary, identity and machine ABI

The complete target is 2045 bytes. Returns occur at +0x29E, +0x421, +0x475 and +0x7FA, all with `ret 0x10`. Every direct conditional branch and direct jump stays inside the decoded body. The function has no exception frame. The raw complete target and checked call inventory are `build/groundpath-003f2160/003f2160-decoded.txt` and `build/groundpath-003f2160/003f2160-checked.txt`. All thirty-three distinct direct targets have ledger names, which does not prove their signatures.

The exact Zero Hour twin and declaration are in `inputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/GameEngine/Source/GameLogic/AI/AIPathfind.cpp` and its owning `AIPathfind.h`. The named method's control flow supplies a useful skeleton, but BFME's movement profile and zone manager differ. The existing method name is retained. No new identity is proposed for the opaque helpers.

The complete 966-byte `AIGroup::checkSpecial` caller at RVA 0x00154F00 pushes diameter 4, destination, the address of its center coordinate, and the selected object at +0x30A through +0x312, then calls the target's ILT thunk at +0x313. The target reads four full machine slots as object, source coordinate pointer, destination coordinate pointer and integer diameter. Its receiver is ECX, its pointer result is EAX and its stack cleanup is sixteen bytes. There is no hidden return buffer or receiver adjustment at this call. Raw caller evidence is `build/groundpath-003f2160/00154f00-decoded.txt`, and the landed C++ caller uses `Pathfinder::rva003F2160` in `game/GameEngine/Source/GameLogic/AI/AIGroup.cpp`.

The ledger's surviving decorated signature says two coordinate pointers, integer and boolean. That contradicts the decoded roles of the four machine slots. The preferred bank retains its inherited public declaration and reads the full diameter slot through an integer reference. This is an unresolved source-contract problem, not an accepted declaration. Trials 10, 11, 16 and 22 use the decoded public argument types and compile complete bodies, but do not match retail. The canonical `Object` declaration is included for the computer-control query. The two override-chain getters return a full integer and an unsigned byte respectively, use ECX without a dummy EDX argument, consume no stack arguments and return at +0x0D or +0x20 in their complete 33-byte bodies. Their ledger names remain opaque.

The helper reached through ILT 0x0001FA14 is RVA 0x003EEB90. Its ledger extent of 4836 bytes cuts off the common epilogue. Decoding through 4849 bytes includes the final `ret 0x1C` at +0x12EE and makes the four formerly outward branches internal. The main call pushes seven slots and consumes the pointer result. The corrected checked inventory is `build/groundpath-003f2160/003eeb90-complete-checked.txt`; the decoded file includes the epilogue as lookahead. Its nested indirect operations and ownership are not completely established here. The unrelated helper row was left unchanged.

## Value and layout evidence

The actual value-copy helper reached by this target is RVA 0x003D7C90. Its complete 77-byte body reads and writes dwords at offsets 0, 4 and 8, advances both pointers by twelve bytes, and has returns at +0x47 and +0x4C. It is a cdecl copy operation with three meaningful pointer arguments and two unused stack slots. A local reproduction matches all 77 bytes (`build/groundpath-003f2160/06-copy-helper-probe.txt` and `22-copy-helper-probe.txt`). The bank retains the inherited name `BfmeSeedNode` and represents its storage as twelve opaque bytes. The named Coord3D STL alias is insufficient to prove the value type.

The actual metric helper at RVA 0x003DB900 traverses the owner's vector in twelve-byte steps and reads offsets 4 and 8 as signed coordinate components. The semantic role of the first dword remains unproven. STLport 4.6 `_algobase.h` supplies the random-access copy shape, and `_vector.h` implements erase through copy. This accounts for the target copying finish to finish and resetting its end pointer. The address passed as the unused iterator tag is not an object argument to the copy helper. Complete decoded and checked evidence is saved for both helpers.

The cell-info helper reads free-list links at +0x2C and +0x30, sets the cell at +0x28, copies two coordinate dwords at +0 and +4, zeros the links and costs from +0x08 through +0x20, and clears five flag bits at +0x24. Its complete 104-byte reconstruction matches retail. The decoded cell and accessor bodies establish a cell-info pointer at +0, a zone word at +8 and packed layer bits at +0x0C. The owner uses map data at +0x10, extents at +0x14 through +0x20, a closed-list pointer at +0x838, a byte flag at +0x83C, layer storage at +0x85C, a zone-manager receiver at +0xC9C and vector pointers at +0x2470C and +0x24710. These private views are trial declarations, not a replacement for a fully validated canonical layout.

The effective-zone helper at RVA 0x004033E0 reads all movement-profile fields: the integer mask at +0, byte flags at +4 and +5, and integer layer at +8. Its executable interval ends at +0x0DD. The eight-entry jump table occupies +0x0E0 through +0x100 and targets +0x0D5, +0x087, +0x0D5, +0x0AF, +0x0D5, +0x0C2, +0x0D5 and +0x023. All table targets were checked against instruction boundaries, every direct branch remains internal, and all eight return sites pop eight bytes. The ordinary linear inventory cannot decode the embedded table as instructions. The independent table check and the exact array contents are retained in `build/groundpath-003f2160/evidence-check.txt` and its reproducing script. This closes the table-boundary question without changing a verifier.

The trial uses named declarations for the two neighbor arrays instead of numeric image literals. Their raw values were checked directly. The proposed array names are not recorded in `dir32_addresses.csv`, so they are not approved production bindings. No new address record or pin was added.

## Corrections to the saved skeleton

Retail rejects an already open or closed neighbor at +0x64B through +0x66E. The saved body instead considered updating such a neighbor when its cost was lower. Retail performs the clearance call at +0x6FC after optional info allocation and for the goal cell as well. The saved body placed it earlier and only in the non-goal arm. Cost calculation and blocked-by-ally reset also apply to the goal. Retail clears the owner byte at +0x83C on the empty-current and success paths. The corrected candidate follows these observed paths. It also supplies the live zone-manager receiver for grid fill and uses the actual zero-argument object getter ABI.

The visible helper experiments independently matched world-to-cell (156 bytes), cell-info acquisition (104 bytes), cell lookup (95 bytes), grid clear and fill (77 bytes each), clip (373 bytes), and line traversal (773 bytes). The line walker requires visible inline cell lookup to reproduce its own retail body. These are existing helpers copied as inline trial definitions, not additional recoveries. Their raw helper probes remain under `build/groundpath-003f2160/`.

## Compiler experiments

Every source and unedited probe is retained under `build/groundpath-003f2160/`. Receipt files record the command, UTC timestamps and exit code. The table below is generated directly from those raw outputs with `tools/finish_measure.py`'s parser. Quality is the repository's mismatch-and-length diagnostic, not the fraction of a semantically proven implementation. Relocation sites drift in these candidates, so a lower raw difference count alone does not prove a better reconstruction.

| Trial | Bytes | Differences | First difference | Measured quality | Raw probe |
| --- | ---: | ---: | ---: | ---: | --- |
| Saved reconstruction | 2112 | 1647 | +0x6 | 0.1291 | `build/groundpath-003f2160/00-saved-probe-repeat.txt` |
| Corrected neighbor flow and flag cleanup | 2070 | 1694 | +0x2 | 0.1472 | `build/groundpath-003f2160/01-retail-flow-probe.txt` |
| Native preparation locals | 2114 | 1698 | +0x0 | 0.1022 | `build/groundpath-003f2160/03-natural-locals-probe.txt` |
| Scoped native preparation locals | 2101 | 1690 | +0x0 | 0.1188 | `build/groundpath-003f2160/04-scoped-locals-probe.txt` |
| Visible twelve-byte copy helper | 2050 | 1696 | +0x2 | 0.1658 | `build/groundpath-003f2160/06-visible-copy-probe.txt` |
| Typed neighbor arrays and literal zero | 2070 | 1670 | +0x2 | 0.1589 | `build/groundpath-003f2160/08-typed-arrays-probe.txt` |
| Decoded four-slot public signature | 2070 | 1670 | +0x2 | 0.1589 | `build/groundpath-003f2160/10-caller-abi-probe.txt` |
| Visible line walker with inline cell lookup | 2101 | 1666 | +0x0 | 0.1306 | `build/groundpath-003f2160/14-native-visible-walk-probe.txt` |
| Zero-argument getters with full integer and byte results | 2059 | 1661 | +0x2 | 0.1741 | `build/groundpath-003f2160/15-getter-abi-probe.txt` |
| Native locals with canonical clearance argument types | 2113 | 1638 | +0x0 | 0.1325 | `build/groundpath-003f2160/18-flag-types-probe.txt` |
| Visible clip helper | 2113 | 1638 | +0x0 | 0.1325 | `build/groundpath-003f2160/19-visible-clip-probe.txt` |
| Visible copy and clip and line walker | 2113 | 1638 | +0x0 | 0.1325 | `build/groundpath-003f2160/21-complete-visible-context-probe.txt` |
| Native unused iterator-tag reference | 2113 | 1638 | +0x0 | 0.1325 | `build/groundpath-003f2160/22-native-empty-tag-probe.txt` |
| Explicit workspace at observed stack offsets | 2142 | 1653 | +0x0 | 0.0968 | `build/groundpath-003f2160/23-decoded-workspace-probe.txt` |
| Profile and callback workspace reuse | 2122 | 1683 | +0x2 | 0.1017 | `build/groundpath-003f2160/24-profile-line-reuse-probe.txt` |
| Explicit references to machine argument slots | 2188 | 1680 | +0x0 | 0.0386 | `build/groundpath-003f2160/25-argument-slots-probe.txt` |
| Argument-slot references with explicit workspace | 2153 | 1688 | +0x0 | 0.0689 | `build/groundpath-003f2160/26-argument-slots-probe.txt` |
| Final repeat of preferred trial with corrected comments | 2059 | 1661 | +0x2 | 0.1741 | `build/groundpath-003f2160/27-banked-probe.txt` |

The preferred trial reduces the length error while still having substantial instruction drift. Its first difference is the frame reservation, followed by the owner-register choice and a cached zone-manager receiver. The complete native-context and empty-tag trials remain useful alternatives under `build/` but did not outrank it under the repository's measured banking rule. Explicit workspace and argument-slot trials worsened the measured result. `shape_family_levers.py` found no applicable frame, boolean or test choice for trial 17, and its raw output is retained. No additional unchanged register-mirror experiment was run.

## Verification limits

`python tools/check_csv.py` and `python tools/pin_consistency.py --check` pass. The source name-regression comparison uses the tool's `regressions` API because its command-line interface accepts revisions rather than source paths; it reports no descriptive-name regressions. `class_gate.py` exits successfully for the bank candidate. These checks do not approve the private trial views or resolve the contradictory public signature.

The scoped byte gate passes for the existing MASM row and validates its single function, float reference and recorded global references. Its raw output is `build/groundpath-003f2160/scoped-byte-gate.txt`. It does not validate the bank as a source recovery. The Windows build wrapper fails because its `py -3` launcher reports no installed Python inside this sandbox; the same gate was run directly with the working Python interpreter. Both wrapper failures are preserved. No full gate is required for the bank and evidence changes. No C++ body was landed, and no commit or synchronization command was run.
