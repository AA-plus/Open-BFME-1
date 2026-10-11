# Supply truck queue finishing attempt

The preferred bank remains `targets/game/reverse/attempts/0x00165d50.cpp` under its existing name, `?queueSupplyTruck@AIPlayer@@IAEXXZ`. No source recovery or ledger row is claimed. All measurements in this note use revision `f392c3ed0bf9f6e8e9741ef2ffefdc0e6eadbbb7` and model `gpt-6.1-sol`.

## Verified boundary and residue

The retail entry at RVA `0x00165D50` follows sixteen INT3 bytes. Complete decoding covers 649 instructions and 2,333 bytes, with the sole return at `+0x91C` and eight inspected INT3 bytes after the endpoint at `+0x91D`. Every direct branch stays inside the extent and lands on a decoded instruction. There are no indirect jumps. The raw disassembly is `build/fin-supply/retail.log`; the boundary assertions and indirect-call inventory are `build/fin-supply/audit.log`. `build/fin-supply/checked-callees.log` records the checked direct-callee inventory.

The unmodified bank emits 2,333 bytes with 63 relocations. Its ten masked differences are at `+0x377`, `+0x378`, `+0x379`, `+0x37A`, `+0x37B`, `+0x37D`, `+0x384`, `+0x385`, `+0x386` and `+0x38A`. The measured masked score is `0.9957136733819117`. Retail loads `TheWritableGlobalData` into ECX, loads its signed box value at `+0xB24` into EDX, and multiplies EDX by the signed warehouse field at EAX `+0x88`. The bank loads the warehouse field into ECX first and uses the global field as IMUL's memory operand. This is an operand-selection and load-order blocker, not an exact match.

The bank's global DIR32 operand lies at `+0x37E`, where retail instead has the displacement `0xB24`. Therefore the relocation count does not establish matching global bindings. The prospective-row scoped byte gate fails, with no row written to the ledger. Its raw output is `build/fin-supply/scoped-gate.log`; `build/fin-supply/strict-differences.log` enumerates the same ten differences from the gate's printed byte streams. The baseline raw probe is `build/fin-supply/bank-probe.log`.

## Current evidence and hypotheses

The current ledger and pins were searched at the target and all 17 direct callee destinations, with results retained in `build/fin-supply/inventory.log`. The target remains rowless. The newly available native `PartitionFilter::link` body at `0x009F2AE0` verifies its one-argument thiscall contract, its next pointer at `+4`, its receiver return in EAX and both RET 4 paths. It supports an existing bank declaration but does not repair the cash-multiply blocker. No current callee identity or member-width correction was found that closes that blocker.

The complete `Object::findModule` body at `0x001BEE60` was independently decoded through all three RET 4 paths. It reads the behavior array at receiver `+0x1F0`, invokes module vtable slot `+0x10`, compares the full returned key, and returns the selected pointer or null in EAX. The call at target `+0x36D` reaches it through ILT `0x0002AE23`. Raw output is `build/fin-supply/find-module-retail.log`; checked decoding is `build/fin-supply/callee-find-module-check.log`.

The complete warehouse constructor proves the unadjusted receiver, primary module-data pointer at `+4`, interface vptrs at `+0`, `+0xC`, `+0x10` and `+0x20`, and a four-byte box member at `+0x88` copied from module data `+0x10`. Its canonical local declarations are in `SupplyWarehouseDockUpdateConstructor.cpp`; the Zero Hour header independently supports the signed view by declaring `Int getBoxesStored() const` and an `Int` member. The hypothesis was that replacing the bank's flat warehouse padding with this supported inheritance could change alias analysis or register allocation. Identical emitted target bytes would refute that hypothesis. Raw decoding and checked extents are retained in `build/fin-supply/warehouse-constructor-retail.log` and `build/fin-supply/callee-warehouse-ctor-check.log`.

The second hypothesis was that exposing the now-decoded native filter-link body as `inline __declspec(noinline)` could change the compiler's knowledge of effects before the multiplication. This preserves the existing strong definition's ownership. Identical target bytes would refute it. The third experiment tested a small inline-assembly block with explicit C++ input and output variables for the established instruction-selection residue. Extra spills or a changed frame would refute its usefulness. A further assembly branch trial tested whether avoiding an output spill preserved the surrounding optimizer behavior. A frame-pointer prologue or widespread instruction changes would refute it.

The final comparison measured the already-existing complete native body in `game/GameEngine/Source/GameLogic/AI/AIPlayer.cpp`. This checked whether the larger translation unit's canonical declarations and visible helpers supply a useful context missing from the bank. A shorter body with broad layout drift would refute using that translation unit unchanged.

## Measured experiments

| Source retained under `build/fin-supply/` | Emitted bytes | Relocations | Raw probe differences in the compared overlap | Raw output |
|---|---:|---:|---:|---|
| `baseline.cpp` | 2333 | 63 | 10 | `bank-probe.log` |
| `warehouse-inheritance.cpp` | 2333 | 63 | 10 | `warehouse-inheritance-probe.log` |
| `visible-partition-link.cpp` | 2333 | 63 | 10 | `visible-partition-link-probe.log` |
| `explicit-cash-asm.cpp` | 2349 | 63 | 1505 | `explicit-cash-asm-probe.log` |
| `cash-register-branch-unused.cpp` | Compile failed | Not measured | C4101 for the unused local | `cash-register-branch-probe.log` |
| `cash-register-branch.cpp` | 3006 | 164 | 1735 | `cash-register-branch-probe2.log` |
| `canonical-ai-player.cpp` | 2093 | 64 | 1733 | `canonical-ai-player-probe.log` |

The two structural trials reproduce the baseline residue without improvement. The explicit assembly input and output increase the frame by four bytes. The assembly branch trial changes the prologue and produces broad code growth. The native translation unit reads the queue head at `+8` where this retail target reads `+4`, and its emitted extent omits 240 required bytes. Extra emitted bytes and missing tail bytes are failures in addition to the overlap counts shown above. None of these alternatives is suitable for the preferred bank. The original bank remains byte-for-byte unchanged relative to the initial checkout snapshot. Raw logs have adjacent `.receipt` files with command, exit status and measured elapsed seconds; `build/fin-supply/source-hashes.json` identifies the retained snapshots.

## Identity and acceptance limits

The existing name is retained. The inspected Zero Hour source and current native `AIPlayer.cpp` identify the supply-truck queue algorithm, warehouse module-key literal and supply-truck debug message. This run does not repeat the previous note's claim that `isAGoodIdeaToBuildTeam` is a verified matched caller. The current native source calls `queueSupplyTruck` from `queueUnits`. The raw caller screen reports no named direct caller for the rowless target and is not an instruction-boundary proof. A complete decoded caller and its ILT route remain required for any renewed caller-based identity claim.

The retail unwind map was read and retained in `build/fin-supply/retail-eh.log`. It contains five states covering the three filters, the warehouse-key initialization guard and the string temporary. This read is not a complete comparison of all emitted cleanup helpers or exception ownership. The hash-map payload construction, list value provenance and all concrete virtual callee bodies were not independently re-established in this run. Those acceptance checks remain unresolved; a byte match alone would not close them. No new container identity, pin, layout witness or source-level name is claimed.

Reopening requires supported new declaration or callee-effect evidence that changes this specific multiplication, or a bounded compiler experiment that improves the measured baseline while preserving its extent and relocation operands. Repeating the rejected flat-versus-inherited warehouse view, visible filter-link body or these assembly blocks is not justified. An exact candidate would still require complete caller, container-value and unwind-cleanup evidence before landing.

## Second run: requested cash expression variants

The second run tests the coordinator's expression-shape hypothesis against the unchanged bank. Swapping factors, using the canonical const global view, explicitly loading either factor into a local, or reading the public box member directly might affect MSVC 7.1 operand selection. The supporting source evidence is Zero Hour GlobalData.h, which defines TheGlobalData as a const cast of TheWritableGlobalData, and SupplyWarehouseDockUpdate.h, which declares the box accessor and member as Int. Identical target code and relocation records would refute these as finishing levers in this context.

The current target and direct-callee ledger entries and pins were independently searched in this revision. The raw inventory is build/fin-supply-expression/audit.log. No newly supported declaration or callee identity repairs the existing cash-multiplication blocker. Complete retail decoding was repeated for the target, Object::findModule, the warehouse constructor, and its cash setter. Their disassembly and checked-callee outputs are retained in build/fin-supply-expression/. The constructor copies a full dword from module data +0x10 to the warehouse +0x88; the cash setter uses signed integer division by GlobalData +0xB24 and stores the resulting box count at +0x88. No proposed container identity relies on this scalar field evidence.

Every candidate is a complete body copied from the saved bank. Only the cash expression and, for the const-view trials, the canonical macro definition differ. The bank's public m_boxesStored declaration permits the direct-member trials. build/fin-supply-expression/trials.json records the exact source expressions and source hashes; results.json is the machine-generated measurement record. Each source and its raw COFF object is preserved beside its unedited probe log and command receipt. The compiler experiments were all measured at the complete retail extent.

| Trial | Emitted bytes | Relocations | Masked differences | Raw output under build/fin-supply-expression/ |
|---|---:|---:|---:|---|
| baseline | 2333 | 63 | 10 | probe-baseline.log |
| swapped | 2333 | 63 | 10 | probe-swapped.log |
| const-view-global-first | 2333 | 63 | 10 | probe-const-view-global-first.log |
| boxes-local-global-first | 2333 | 63 | 10 | probe-boxes-local-global-first.log |
| global-local-global-first | 2333 | 63 | 10 | probe-global-local-global-first.log |
| direct-member-global-first | 2333 | 63 | 10 | probe-direct-member-global-first.log |
| const-view-boxes-first | 2333 | 63 | 10 | probe-const-view-boxes-first.log |
| boxes-local-boxes-first | 2333 | 63 | 10 | probe-boxes-local-boxes-first.log |
| global-local-boxes-first | 2333 | 63 | 10 | probe-global-local-boxes-first.log |
| direct-member-boxes-first | 2333 | 63 | 10 | probe-direct-member-boxes-first.log |

The independent object comparison finds identical target bytes and identical relocation records for the baseline and every requested alternative. Its raw output is build/fin-supply-expression/object-comparison.log. The hypotheses are refuted for these expressions and declarations in this translation unit. The remaining offsets are unchanged from the first run, including the displaced global relocation, so none of these candidates is a strict byte match. The preferred bank remains byte-for-byte unchanged.

The prospective-row scoped byte gate reports FAIL 1/1 in build/fin-supply-expression/scoped-gate.log. No ledger row or game source was added. The name remains inherited from the bank; the second run does not resolve the first run's caller-identity, complete container construction, virtual-callee, or unwind-cleanup acceptance limits. Reopening requires an independently supported declaration, callee effect, or source-context difference that changes the measured multiplication while preserving the complete extent and verified relocation operands. Repeating any expression in trials.json with this same context is not justified.
