# Tooltip adapter retry at 0x004C1C30

## Result and reopening condition

This is a partial reconstruction, tested at revision `77c60a168cdc00beda297aaed4c5bed30536d8df` with `gpt-6.1-sol`. No source recovery or new matched bytes is claimed. The ledger still points to `game/gen_asm/d_004ad980.asm`. The complete new body is preserved at `targets/game/reverse/attempts/0x004c1c30.cpp`, with the original bank and submitted body preserved by the repository tool in immutable attempt-history JSON. Every trial and unedited compiler probe is retained under `build/tooltip-004c1c30/`. `build/verdict.txt` contains the running measurements. Exactly one partial verdict was appended for this run.

Reopen this attempt with a concrete hypothesis about native receiver or local lifetimes, header visibility, or the mismatched unwind cleanup slots. Repeating the tested processor switches, exception switches, inheritance spelling, or const-button spelling is not justified. Strict relocation binding also needs independently supported declarations for the opaque callees before this body can land. Do not add pins merely to satisfy the scoped gate.

## New hypothesis and its refutation

The saved body implements the Zero Hour two-argument `ControlBar::populateBuildTooltipLayout` method. The newer landed adapter constructor and its caller provide a different BFME receiver and four output references. The hypothesis was that these declarations, together with the current string and container layouts, address the earlier ABI and frame mismatch. A decoded caller passing two arguments, a different receiver adjustment, or a target return other than `ret 16` would refute the four-output reconstruction. The retained complete caller and target decode support four outputs. Measured native declarations improve the body, but they do not make it exact.

The donor was read directly from `inputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/GameEngine/Source/GameClient/GUI/GUICallbacks/ControlBarPopupDescription.cpp`. Its building prerequisites, science selection, upgrade messages, and generic window tooltips supply corresponding statements and original comments. BFME has additional structure, command-point, prerequisite-upgrade, hero, and castle branches. The donor's overcharge and CanMake switch are not present in this target. The saved alternatives were inspected as source rather than accepted as descriptions of an implemented four-reference ABI.

## Receiver, boundary, and output evidence

`game/GameEngine/Source/GameClient/GUI/ControlBar/ControlBarRva004C1B60.cpp` implements the landed 156-byte adapter construction. Its stack object has owner, window, and data pointers at `+4`, `+8`, and `+12`. Vtable `0x010FD964` has the target at slot `+12`, through the corresponding ILT route. The constructor does not turn this adapter receiver into a ControlBar receiver.

`game/GameEngine/Source/GameClient/GUI/ControlBar/ControlBar_doRepopulateBuildTooltipLayout.cpp` implements the landed 235-byte caller at `0x004C1320`. Its complete decoded body constructs four UnicodeString objects, passes their addresses to virtual slot `+12`, and releases all four afterward. The target writes them as name, cost, command-point cost, and description. Its final instruction is `ret 16` at `+0x10BE`, and the decoded extent ends at `+0x10C1`. No conditional branch leaves the 4289-byte target. The caller ignores the result register; the candidate uses a void-compatible declaration, not an independently recovered EA method signature.

`build/tooltip-004c1c30/ledger-and-decode.txt` retains the target, landed caller, adapter constructor, direct-call thunks, and their decoded destinations. The corresponding `checked-*.log` files retain `checked_callees.py` output. `retail-target.log` retains the annotated target instructions. `eligibility.log` records the repository eligibility helper serving this target as an open dump. No shared claim or Git synchronization was performed in this isolated assignment.

The historical ControlBar method owner is not established for this receiver. The candidate retains ControlBar as the adapter's owner and retains the descriptive method spelling, while its implementation uses the already-landed opaque `Rva004C1B60Adapter` carrier. A direct source-name comparison flags the owner migration and a getRequiresList alignment. The latter name is still present in the new source. The supplied file-path invocation of `name_regression.py` fails because this version expects Git revisions; `bank-name-comparison.log` retains the direct comparison. A human must assess the established-owner correction before any eventual source landing. No correction entry or policy exception was written.

## Types, ABI, and actual helper bodies

The target indexes the science buffer with a four-byte stride and passes each complete 32-bit value to the decoded hasScience callee. Its three vector pointers are at CommandButton `+0x84`, `+0x88`, and `+0x8C`. The CommandButton constructor at `0x0049BBF0` was read and decoded completely. Native STLport size and const-reference indexing were tested against the installed 4.6 `_vector.h` template. The bank uses this as a compiler experiment; neither an allocation size nor an existing STL pin is asserted to prove the complete container identity.

The prerequisite records have a 36-byte stride in this target. The complete ProductionPrerequisite copy at `0x00138290` copies three vector members at offsets `0`, `12`, and `24`. Its actual first-vector helper at `0x00136840` reads and writes two 32-bit fields at element offsets `0` and `4`, invokes the complete StringBase<char> copy constructor on offset `8`, and advances both element pointers by 12 bytes. The second-vector copy at `0x000BB890` copies one 32-bit value and advances by four bytes. The third vector uses its complete byte range with memcpy. These observations establish field widths and string ownership without inferring them from allocation size. The flag and unit semantics still require the corresponding consumer evidence for a fully canonical declaration.

`construction-decode.txt` and `construction-checked-*.log` retain the complete constructors, actual copy helpers, resolved tails, and relevant string constructors. The four-byte science view and the richer prerequisite-value view are both preserved as trials. The richer value declaration alone did not change the measured instructions.

The affordability call at target `+0x42A` pushes false, ThingTemplate, UpgradeTemplate, and Player before calling ILT `0x0001CEA9`. Its complete destination at `0x0010AF70` consumes four stack arguments and returns with `ret 16`. The earlier three-argument naked provider does not certify this ABI. The receiver is not read by that helper. The trial supplies the four observed stack arguments through an opaque receiver view and does not introduce a pin.

Object's controlling-player helper at `0x001BE3F0` tails to Team's complete 12-byte getter at `0x000EC8F0`; both were decoded. Object's upgrade-membership helper tails to `0x001C59C0`; that complete destination was decoded too. The helper at `0x001BF670` returns an interface from a secondary module view. Its semantic identity is not established by the existing countermeasures name, so the final candidate calls an address-derived method. Its virtual slot `+0x2C` produces an x87 result stored to a float local. The body-interface slot `+0x14` also produces an x87 value. Their concrete virtual destinations and source return types remain unresolved acceptance checks.

GameText's actual by-value AsciiString overload at `0x00436F90` is 114 bytes, releases its input string, forwards through virtual slot `+0x28`, and returns with `ret 12`. Its char overload at `0x00437F60` was decoded through all 622 bytes and its `ret 12`. The input pointer, existence pointer, hidden return storage, and eight-byte string payload header agree with the target calls. The landed `GameTextFetchAscii.cpp` explains MSVC's reversed overload slot ordering: char then AsciiString declarations emit AsciiString at `+0x24` and char at `+0x28`. The trial already used that correct declaration order. `game-text-*-decode.log` and `checked-game-text-*.log` retain the complete decoded evidence.

## Exception handling

Retail has 29 unwind states. States 0 and 1 clean the two prerequisite UnicodeString locals; state 16 cleans the hero label AsciiString; state 21 cleans its level UnicodeString; state 22 clears the CastleBehavior static-initialization flag; the other states clean wide-string temporaries. The string copy and release helpers were decoded completely, including reference-count reads, writes, and buffer release. `eh-retail.log` retains the unwind map and `eh-actions.log` with `eh-checked-*.log` retains each complete cleanup action and its tail inventory.

The measured candidate also has 29 states and the corresponding narrow and wide string cleanup kinds, but its slots differ. Candidate state 0 uses `[ebp-0x28]` where retail uses `[ebp-0x20]`; candidate state 1 uses `[ebp-0x20]` where retail uses `[ebp-0x1C]`. Hero and generic-window temporary slots also differ. A shared state count does not establish cleanup equivalence. `candidate16-decode.log` retains the complete candidate instructions, relocations, and cleanup bodies. The exception-handling acceptance check remains unresolved.

## Measurements and rejected shapes

The following table is generated from the unedited probe logs. The bank quality uses `finish_measure.parse`: one minus the sum of differing overlap bytes and twice the extent error, divided by retail size, floored at zero. Relocation operands are masked. They are compiler-shape scores, not evidence of semantic or relocation acceptance.

| Experiment | Bytes | Differing overlap bytes | Extent error | First difference | Bank quality | Normalized instructions |
| --- | ---: | ---: | ---: | --- | ---: | ---: |
| Saved body (`probe00-raw.log`) | 4372 | 3199 | 83 | +0x2 | 0.2154 | 0.373 |
| Four-output adapter (`probe01.log`) | 4149 | 3083 | 140 | +0x2 | 0.2159 | 0.780 |
| Science reference accessor (`probe06-vector-access.log`) | 4152 | 3076 | 137 | +0x2D | 0.2189 | 0.836 |
| Native science vector (`probe10-native-vector.log`) | 4165 | 2980 | 124 | +0x2 | 0.2474 | 0.821 |
| Native prerequisite vector (`probe12-prerequisite-vector.log`) | 4152 | 2973 | 137 | +0x2 | 0.2429 | 0.839 |
| Separate cost paths (`probe16-native-cost-branches.log`) | 4218 | 2972 | 71 | +0x2 | 0.2740 | 0.834 |
| Combined native prerequisite trial (`probe17-native-prereq-cost.log`) | 4209 | 2997 | 80 | +0x2 | 0.2639 | 0.853 |
| Final body (`probe-final.log`) | 4218 | 2972 | 71 | +0x2 | 0.2740 | 0.834 |

Eight mechanical combinations of EHsc, STLport exception configuration, and nothrow array delete left the initial adapter instructions unchanged. The /G5 and /G6 trials also left those instructions unchanged, and no further processor-switch or x87 register experiments were made. Private StringBase inheritance did not change that shape. GUICommandType instead of int, a richer prerequisite element declaration, a const CommandButton receiver, and the canonical public AsciiString inheritance supplied no byte improvement over their parent trials.

The separate faction cost paths are supported by retail's two x87-to-integer conversions and two text-fetch sites that converge on the format call. The earlier combined Boolean expression had one shared fetch site. Restoring the separate paths improved the extent and score. Cold concatenations now call the actual StringBase reference overload rather than an unrelated out-of-line UnicodeString wrapper, without changing the masked instructions. Native prerequisite-vector access improves normalized instruction structure but scores below the preferred raw-byte body; trial 17 preserves it for a future hypothesis.

## Checks and limits

`scoped-gate.log` retains the strict `build.verify_functions` byte gate on an explicit trial row. It fails on byte inequality and 18 unresolved callee spellings. The row was supplied in memory; the ledger was not edited. Recompilation at the bank's actual path repeats the measured result in `probe-bank.log`, and `scoped-gate-bank.log` repeats the strict gate failure. `pin-consistency.log` passes against unchanged pins. `class-gate.log` passes for the trial path. `declared-unmatched.log` fails because the scratch source has no matched ledger row and declares an unlanded target; it is not a source-landing receipt. `check_csv-final.log` records a passing final ledger check. `bank.log` and its clock receipt retain the single banking operation.

No full gate was required for this partial because there is no game source, header, shim, pin, or ledger change. No hook was bypassed, baseline expanded, or literal image address introduced into game source. All experiments are retained for collection; no background verifier is intended to remain running at handoff.

## Coordinator note

The coordinator kept `targets/game/reverse/attempts/0x004c1c30.cpp` at its committed ControlBar version, because replacing it moves the method to the landed receiver Rva004C1B60Adapter, which name_regression treats as an identity correction for the maintainers. The 0.2740 body is preserved in full in `targets/game/reverse/attempt_history/0x004c1c30/610dbec6345f9870803d02c7502d6064fe233918462cf4f01d03c7c7a93662df.json`.
