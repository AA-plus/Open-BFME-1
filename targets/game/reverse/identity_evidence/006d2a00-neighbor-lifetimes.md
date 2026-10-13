# RVA 0x006D2A00: neighbor lifetimes and a finish-lane retry

The preferred bank remains unchanged. It emits the full independently decoded target extent, but the scoped byte gate still fails. No source recovery or new pin is claimed. The coordinator's close-bank measurement is reproduced, and the remaining instructions are explained below. This retry refutes the tested type, counter, helper, control-flow and output-lifetime hypotheses. It does not prove that assembly is required or that all possible C++ forms are exhausted.

The tested revision is 009aac951dc5d8b6ecf71ed24e0b608f1806573d. The assigned and actual model is gpt-6.1-sol. The ledger still points to game/gen_asm/d_00610140.asm. eligibility.open_dumps confirms that row is open work. Full historical records were retrieved into build/006d2a00-retry/session-target.log before implementation; the existing bank and its evidence note were read in full. The existing descriptive names are preserved. All sources, raw probe output, independent decodes and receipts are retained under build/006d2a00-retry/.

## Exact remaining instructions

The bank emits 1984 bytes against retail's 1984 bytes. The measured score is 0.9934475806451613. The differing offsets are +0x31C through +0x327 inclusive and +0x329, outside every relocation operand. The complete byte receipt, compiler command, source hash and object hash are in build/006d2a00-retry/bank-receipt.json. Its source hash is 5e9751bc4881d9401732c9db76c314c498b0997ea9f4d27529a6d2669bd873ea. The raw comparison is build/006d2a00-retry/00-bank-probe.log.

Retail loads the lower payload into EBX at +0x319 and the upper payload into EBP at +0x31C, compares the lower changed byte at +0x31F, and writes the two payloads to stack offsets +0x10 and +0x54 at +0x324 and +0x328. The bank compares that byte before loading the upper payload, stores the lower payload early and reuses EBX for the upper load. Both streams reach the identical jump at +0x32C, where their required general-purpose register sets agree. The subsequent right-neighbor load and all following instructions match. This diagnostic observation does not establish global semantic equivalence or relax the byte gate.

Complete CFG register liveness is retained in build/006d2a00-retry/neighbor-liveness.log, retail-liveness.json and bank-liveness.json. The old row index in EBP is dead after the height comparison at +0x2FF. Retail's temporary upper payload in EBP is dead after its stack store at +0x328. EBP is absent from the required registers at the +0x32C join and is redefined from the saved successor at +0x4C1. This refutes the hypothesis that the current row index prevents use of EBP. A source snapshot does not force the required overlap: trial 39 reorders the output stores and worsens the residue, and trial 40 folds back to the preferred stream.

## Complete boundaries and ABI evidence

The target decode is build/006d2a00-retry/decoded-retail.log. It has ret 8 paths at +0x28 and +0x7BD, ends after the latter instruction and is followed by sixteen INT3 bytes. Every jump stays inside the extent and lands on an instruction boundary. There is no EH registration or owning local object. The weak inventory start at 0x006D2F60 lies inside this complete body. checked-006d2a00.log retains the checked direct-call inventory.

The same decode file contains complete extents for 0x006C8E50 (197 bytes), 0x007287E0 (21 bytes), 0x0072EA60 (43 bytes), 0x00728D30 (874 bytes), 0x009202C0 (33 bytes), 0x006D1C80 (131 bytes), and the five-byte ILT routes actually used. The corresponding checked-<rva>.log files retain checked inventories. All return paths and outgoing branches were inspected. The ILTs route to the helper bodies recorded in the brief. No callee or thunk pin is invented or altered.

The complete state-reset helper stores dword 1 at receiver +0x80, stores byte zero through its sole pointer argument, returns dword 1 and ends in ret 4. The target places those results at state offsets +0 and +4 with an eight-byte stride. The remaining three bytes are unknown padding in the view. Neither a donor name nor an allocation establishes a native pair or STL type; no such identity is claimed. The complete neighbor setter writes its first four stack dwords at receiver +0x98, +0xA0, +0xA8 and +0xB0, ignores its fifth stack slot and ends in ret 20. The target supplies left, lower, right, upper and a normalized low-byte flag. The Bool declaration is an address-derived ABI view, not proof of the ignored native parameter's source type.

The terrain update helper takes one camera pointer and all its three return paths use ret 4. Its complete decode supports the integer status at +0, integer texture multiplier at +0x34 and float distance at +0x54. Its indirect call at +0x29C takes the unchanged global receiver, no explicit stack arguments and consumes a dword return. Its concrete dynamic target is not used as identity or state-payload evidence. The target's tile stride is 0xC4. The base update takes camera first and lights second, retains the primary receiver and ends in ret 8. Get_Position receives hidden Vector3 return storage, writes all three fields, returns the storage in EAX and ends in ret 4. Its indirect call through vtable byte offset +0x50 is consistent with canonical const Validate_Transform(), with unchanged receiver and no explicit arguments. The canonical rendobj.h and Vector3 declarations were checked.

Compiler assertions in build/006d2a00-retry/35-compiler-layout-audit.cpp check every accessed owner offset, int and Bool widths, Vector3 size, both array strides, state flag offset and member-pointer representation. The raw successful compile and unchanged residue are in 35-compiler-layout-audit-probe.log. These declarations are partial BFME layout views; the incompatible Zero Hour layout is not imposed on them. No ownership or constructor cleanup is inferred for untouched padding.

## Virtual callers and preserved identity

The raw incoming rel32 screening is independently validated in build/006d2a00-retry/incoming-final.log. Its sole hit is the complete ILT at 0x000155DC, which jumps to this body. It is an instruction boundary, not a caller hit inside another instruction. The constructor at 0x006D1C80 installs primary vtable VA 0x0111DC88; slot 135 points to that ILT. vtable_lookup.log retains the slot and installer output. No named direct caller reaches the body.

The separate virtual-call screen found two relevant complete callers: W3DView::setCameraTransform at 0x007423B0 (679 bytes) and W3DView::update at 0x007446A0 (2,618 bytes). Their complete decoded bodies are virtual-caller-007423b0.log and virtual-caller-007446a0.log, with checked inventories in checked-virtual-caller-007423b0.log and checked-virtual-caller-007446a0.log. They load the receiver from VA 0x012F7FE0, obtain its primary vptr, push the lights iterator and then the camera pointer, and call vtable byte offset +0x21C without receiver adjustment or caller stack cleanup. The corresponding source declarations and the recorded TheTerrainRenderObject global support the same two-pointer virtual contract. The precise dynamic instance at runtime is not asserted. Two other raw calls at the same slot belong to unrelated receiver contracts and were excluded; one has an incomplete ledger extent and is not used as evidence. The raw screening and validation output is virtual-callers.log.

The actual algorithmic donor is GeneralsMD/Code/GameEngineDevice/Source/W3DDevice/GameClient/FlatHeightMap.cpp. Its source was checked directly, including the tile scans, base forwarding and counters. It does not contain BFME's extra neighbor and refinement loops. The oracle, called from Python with the body RVA to avoid the CLI ambiguity, confirms the FlatHeightMapRenderObjClass decoration and contradicts the old HeightMapRenderObjClass decoration. identity-final.log retains the raw results. The preferred HeightMapRenderObjClass006D2A00 token is classified as a placeholder and preserves the bank's descriptive word. No human-owned identity correction is attempted. A decoded contract establishing another owner or a corrected ILT window contradicting FlatHeightMap would refute the owner inference.

## Distinct experiments and rejected hypotheses

The running hypotheses, refutation observations and each reproduced measurement are in build/verdict.txt. Its entries refer to immutable trial sources and unedited raw output. Simple volatile reads, begin/size buffer wrappers, scalar getters, neighbor-local declaration permutations, storage hints, native EH settings and G7 from earlier records were not repeated as unchanged standalone experiments. The register, copy and store family generator reports no applicable finite choices in family-choices.json. No EH generator is applicable to this body.

The new investigations cover payload signedness, current-index and successor lifetimes, explicitly sequenced loads, complete gather-helper visibility, scalar references, nested lifetime scopes, common right-neighbor load placement, positive flag CFGs, row and column switches, CPU scheduling controls, flag snapshots, indexed state views, class-body record accessors, reverse adapter parameters, deferred scalar-output assignments, and a complete local direction record. Each raw comparison is retained beside its source. Direct allocation-only controls are not used as evidence that the compiler needs assembly.

Trial 13 failed because the diagnostic script inserted the member helper into the unrelated base declaration as well as the owner. Its source and compiler output are retained unmodified. Trial 13b applies the intended owner-only change and measures the hypothesis. The corrected controls still fail to improve the bank. The first validation wrapper also treated successful None-returning verification functions as false exit statuses; constants-corrected.log and dir32-corrected.log rerun those functions with correct exit handling. Earlier raw logs are retained, not edited.

Trial 41 independently tests actual setter visibility, rather than defining a method that the preferred union-bound call never invokes. It directly calls a complete noinline inline setter with the observed stores and ABI. visible-setter-body-probe.log independently reproduces that helper's complete 43-byte extent with no relocations. The target still has the same residue. Its new placeholder call relocation is a diagnostic experiment, and no pin or helper recovery is submitted.

| Trial source stem | Compiled bytes | Raw probe differences | Wrong bytes including extent difference |
|---|---:|---:|---:|
| 00-bank | 1984 | 13 | 13 |
| 01-unsigned-payload | 1984 | 13 | 13 |
| 02-loop-successor | 1984 | 749 | 749 |
| 03-sequenced-payload | 1984 | 43 | 43 |
| 04-visible-gather | 1984 | 17 | 17 |
| 05-scalar-reference | 1984 | 13 | 13 |
| 06-gather-member | 1984 | 17 | 17 |
| 07-loop-index-scope | 1984 | 722 | 722 |
| 08-scope-neighbors | 1984 | 13 | 13 |
| 09-deferred-right | 2016 | 1137 | 1169 |
| 10-factored-edge-right | 2019 | 1207 | 1242 |
| 11-factored-edge-prefix | 2016 | 1338 | 1370 |
| 12-positive-flag-chain | 2016 | 1137 | 1169 |
| 13-complete-inline-tile | Compile failed | Not measured | Not measured |
| 13b-complete-inline-tile | 1984 | 13 | 13 |
| 14-out-of-class-tile | 1984 | 13 | 13 |
| 15-inner-while | 1984 | 13 | 13 |
| 16-explicit-middle-guard | 1987 | 1177 | 1180 |
| 17-row-switch | 1984 | 68 | 68 |
| 18-column-switch | 1984 | 621 | 621 |
| 19-index-reuse-interior | 2067 | 1336 | 1419 |
| 20-scheduling-g5 | 1984 | 13 | 13 |
| 21-scheduling-g6 | 1984 | 13 | 13 |
| 22-scheduling-gb | 1984 | 13 | 13 |
| 23-switch-boolean-row | 1984 | 68 | 68 |
| 24-default-false-interior | 2016 | 1135 | 1167 |
| 25-default-false-all-cases | 2032 | 1196 | 1244 |
| 26-explicit-true-false | 1984 | 13 | 13 |
| 27-flag-snapshots | 1984 | 13 | 13 |
| 28-ternary-flag | 2016 | 1137 | 1169 |
| 29-typed-interior-pointer | 1984 | 13 | 13 |
| 30-postload-record-flag | 1984 | 13 | 13 |
| 31-successor-native-order | 1984 | 722 | 722 |
| 32-successor-definition-boundary | 1984 | 722 | 722 |
| 33-indexed-state-view | 2000 | 1531 | 1547 |
| 34-read-state-accessor | 1984 | 13 | 13 |
| 35-compiler-layout-audit | 1984 | 13 | 13 |
| 36-reversed-pair-arguments | 1984 | 13 | 13 |
| 37-reversed-member-pair | 1984 | 13 | 13 |
| 38-reversed-gather-inputs | 1984 | 17 | 17 |
| 39-deferred-lower-output | 1984 | 15 | 15 |
| 40-deferred-upper-output | 1984 | 13 | 13 |
| 41-visible-called-setter | 1984 | 13 | 13 |
| 42-complete-direction-record | 1968 | 1085 | 1101 |
| 43-direction-constructor | 1968 | 1085 | 1101 |

Every table entry derives from the raw <trial>-probe.log next to <trial>.cpp under build/006d2a00-retry/. Each individual variant comparison is n=1. The preferred bank was independently reproduced in multiple checks. The final column adds every missing or excess extent byte to the probe's masked differences; the raw probe only compares the common extent. The table is diagnostic, not an acceptance receipt. Shorter output is not credited as a full reconstruction.

## Checks and reopening condition

Initial CSV integrity passes in build/006d2a00-retry/check_csv-initial.log. The strict scoped byte gate in gate.log fails. Constant-reference verification passes in constants-corrected.log, and DIR32 ownership passes in dir32-corrected.log. Pin consistency passes in pin_consistency.log; class_gate.log passes. There is no source, header, shim, ledger or pin change requiring a full gate. The preferred bank is retained byte for byte because no trial is closer.

The final preservation and branch audit is build/006d2a00-retry/final-preservation.log. It compares the bank with its initial working-tree snapshot, accounts for the checkout's CRLF conversion when comparing the Git blob, validates all branches in the target and evidence bodies, and checks that the original attempt-log bytes are unchanged before exactly one appended CRLF verdict. The blocked verdict is recorded through re_log.py, with no replacement bank or attempt archive. record-verdict.log and record-verdict.receipt.json retain the recording output and clock-derived investigation duration. Final CSV integrity is recorded in final-check_csv.log. All uncollected raw evidence remains local under build/006d2a00-retry/.

Reopening needs a new source dependency, native inline layer or demonstrated compiler scheduling mechanism that keeps the two payloads live together before the lower flag test while preserving the prefix, branch tail and suffix. The row-index explanation is specifically refuted by complete machine liveness, and the tested visible setter is specifically refuted by its independent exact body plus the unchanged caller. Merely changing register hints, wrappers, counter forms or field signedness again has no supporting new evidence.
