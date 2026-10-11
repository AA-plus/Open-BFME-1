# PathfindLayer classifier retry at 0x003FC790

## Result and next experiment

This is a partial reconstruction of `?classifyCells@PathfindLayer@@QAEXXZ`, tested against revision `924c8d8d9ce6cde2faf82447550a1fc59ad99fbc` with MSVC 7.1. The complete candidate has the retail size of 1405 bytes. Probe reports 34 non-relocation byte differences, first at +0x278, and two relocation operands whose positions differ from retail. The scoped repository byte gate also fails with 34 differing bytes. Its resolved output must not be treated as executable evidence in that region because the two float relocations are misaligned. There is no exact recovery or ledger change.

The preserved standalone candidate is `targets/game/reverse/attempts/0x003fc790.cpp`. Its pre-banking source and unedited probe output are `build/classifyCells-003fc790/27-preserved.cpp` and `build/classifyCells-003fc790/27-preserved-probe.txt`. The exact gate comparison is in `27-scoped-gate.txt`, and the differing offsets are in `27-resolved-measure.txt`, under the same scratch directory. The differences occupy +0x278 through +0x27B, +0x280 through +0x299, and +0x29E through +0x2A1. Outside the center-preparation region, the comparison agrees with retail, including the function epilogue.

Reopening needs evidence for a different native coordinate-access or cell-type-access expression that postpones the packed cell read until after all three center components are stored. Another permutation of the already tested plain field assignments is not a justified experiment. The remaining blocker is instruction scheduling and relocation-position drift in this region, rather than a missing pin, unknown function boundary, or missing stack argument.

## Identity and complete boundary

The existing assembly row is the assigned 1405-byte body at 0x003FC790. The exact Zero Hour twin is `PathfindLayer::classifyCells` in `inputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/GameEngine/Source/GameLogic/AI/AIPathfind.cpp`; its owning declaration and the `classifyLayerMapCell` implementation were read, rather than inferred from the earlier verdict. The EA evidence ledger independently associates this address with the aligned chain label `PathfindLayer::ClassifyBridgeCells` and `GameEngine/Source/GameLogic/Pathfinder/pathfinder_layer.cpp`. The existing bank's name remains unchanged.

Two complete callers corroborate the receiver and entry: `Pathfinder::bfmePrepareRefresh` at 0x003F9070 (99 bytes) and `PathfindLayer::setDestroyed` at 0x003FCEC0 (44 bytes) call the five-byte thunk at 0x0003B250, which jumps to 0x003FC790. Neither supplies a stack argument or hidden return destination. The target saves the incoming ECX receiver in EBX and has one final `ret` at +0x57C. All conditional and unconditional branches target decoded instructions within the extent; there is no outgoing tail jump. The following bytes are alignment `int3` instructions. Raw evidence is in `target-dis.txt`, `target-boundary-lookahead.txt`, `classify-thunk-dis.txt`, `refresh-caller-dis.txt`, and `destroyed-caller-dis.txt`.

`extent-audit.txt` records complete Capstone decoding, every return, and every branch for the target and thirteen helpers or callers. Each extent decodes fully, has a return, and has no outgoing or unaligned jump. This checks control-flow completeness; the source twin and callers supply the identity evidence. The target is a no-argument `__thiscall` method returning void. No SEH registration, unwind-state table, dynamic allocation, or destructor cleanup appears in this body. The STL payload and constructor ownership checks are therefore inapplicable to this target.

## Direct calls and ABI

The external read-only `checked_callees.py` helper was run for the complete target and the helper extents. The target's eight direct call destinations are five-byte thunks. Their resolved destinations and complete decoded implementations were inspected. There is no receiver adjustment in these routes and no new pin was introduced.

| Target thunk | Resolved body and extent | Independently decoded call contract |
| --- | --- | --- |
| 0x00014637 | `BridgePointOnBridgeShim::test`, 0x001A5F40, 344 bytes | ECX is the bridge receiver; one `const Coord3D *` stack argument; boolean in AL; all four return paths use `ret 4`. The existing public thunk name is `Bridge::isPointOnBridge`. |
| 0x0002C106 | `PathfindCell::reset`, 0x003F6EC0, 60 bytes | ECX is the cell; no stack argument; `ret`. The optional information release precedes the field reset. |
| 0x00017E27 | `Gen_003F68B0::bfmeSetMode`, 0x003F68B0, 49 bytes | ECX is the cell-compatible receiver; one unsigned 32-bit argument; both paths use `ret 4`. The helper updates the low three packed bits and forces mode 4 for its witnessed obstruction condition. The bank retains its existing inline `setType` spelling while calling this landed identity. |
| 0x00041862 | `Bridge::isCellOnSide`, 0x001A26D0, 504 bytes | One `const Region2D *` argument; boolean in AL; `ret 4`. |
| 0x0000DAAD | `Bridge::isCellOnEnd`, 0x001A24B0, 431 bytes | One `const Region2D *` argument; boolean in AL; `ret 4`. |
| 0x0001CF49 | `Bridge::isCellEntryPoint`, 0x001A2950, 510 bytes | First argument is `const Region2D *`; second is a writable float pointer. The successful paths write an endpoint height through the second pointer. Boolean result in AL; all three return paths use `ret 8`. |
| 0x0000B802 | `BridgeGetBridgeHeightShim::compute`, 0x001A7520, 664 bytes | A point pointer followed by an optional normal pointer; float result in ST0; `ret 8`. The normal output writes three float components when present. The existing public thunk is `Bridge::getBridgeHeight`. |
| 0x00019E9D | `BridgeInfo::BridgeInfo`, 0x001A1EC0, 85 bytes | ECX is destination storage; no stack argument; returns the receiver in EAX; `ret`. |

The raw files use the prefixes `point`, `reset`, `mode`, `side`, `end`, `entry`, `height`, and `info`, each with `-dis.txt` and `-callees.txt`. The bridge geometry helper reached from the side, end, and entry bodies is also decoded completely at 0x001A2020 (928 bytes), with evidence in `line-region-dis.txt` and `line-region-callees.txt`. Its region reads are four float fields, and its two point inputs supply two float fields each. No allocation-size inference is used.

The height helper's automatic EAX-based ABI hint suggested an unused or void result. The decoded ST0 returns and the target's following x87 comparison refute that hint. The reconstruction uses a float return. The earlier bank's one-argument entry-point declaration is likewise refuted by both target pushes and the callee's second-pointer write and `ret 8`.

## Indirect calls and CRT conversion

The terrain call loads `TheTerrainLogic`, takes slot +0x1C of its vtable, and passes x, y, layer 1, a null normal pointer, and clip true. The concrete vtable route is 0x00436F4D to 0x006BE2A0. Its complete 267-byte body and the 27-byte base implementation at 0x001A2DB0 return a float in ST0 and use `ret 20` on every return path. The optional normal is a three-float output. There is no receiver adjustment or hidden return storage. Evidence is in `terrain-vtable.txt`, `terrain-layer-thunk-dis.txt`, `terrain-layer-dis.txt`, `terrain-layer-callees.txt`, `terrain-base-dis.txt`, and `terrain-base-callees.txt`. Other virtual slot meanings are left unnamed.

Four endpoint conversions call the imported C `floor` with an eight-byte double argument and explicit caller cleanup. The double result in ST0 is converted to float and then processed by the repository's native `fast_float2long_round` helper. Its `fld` and `fistp` sequence is copied from the existing native helper, rather than replacing the method with assembly. The earlier direct float-to-int cast selected different compiler conversion machinery. `TheAI` and `TheTerrainLogic` use existing named DIR32 records. Float constants are literal values, with no numeric image address in the candidate source.

## Layout evidence and BFME differences

The canonical shared `Lib/Coord2D.h` and `Lib/Coord3D.h` headers are used. Their payloads are two and three floats respectively. A private nontrivial `Coord3D` copy implementation was tested but rejected as a landing form; the final bank achieves the same best difference count with the canonical headers and the native three-field setter expression.

The complete reset and mode helpers, the target's field masks, and the actual landed neighbouring source bodies independently establish a 16-byte `PathfindCell`. The information pointer is at +0, a 32-bit state is at +4, two short fields occupy +8 and +0xA, and the packed 32-bit field is at +0xC. Type is bits 0 through 2, layer is bits 6 through 11, and connection layer is bits 12 through 17. This is a BFME packing change relative to the Zero Hour view. The unused bits retain the bank's descriptive names without an added semantic claim.

The target reads the layer map at +4, dimensions at +8 and +0xC, origins at +0x10 and +0x14, endpoints at +0x18 through +0x24, layer at +0x28, destroyed byte at +0x34, and bridge pointer at +0x38. The complete refresh caller iterates layers with a 0x44-byte stride. The candidate only needs the observed prefix through +0x3B and does not use `sizeof(PathfindLayer)`; it is not a claim that the whole owner is 0x3C bytes. The existing landed reset, destruction, and refresh implementations agree with these offsets.

The complete `BridgeInfo` constructor zeros every field it handles: float components from +0 through +0x48, 32-bit fields at +0x4C and +0x50, a byte at +0x68, and six 32-bit fields from +0x54 through +0x64. The target copies 27 dwords from the bridge's +0xC prefix, giving a 0x6C-byte value. The from and to points occupy +0 and +0xC; the width and four corner points follow. The bank preserves the tail as opaque bytes, without inferring its unknown ownership or scalar meanings from the copy size. There is no cleanup helper for this value in the target.

## Retry hypotheses and measured experiments

The retry hypothesis was that current landed helper bodies expose ABI and native inline expressions missing from the earlier attempt. Its refutation condition was that corrected declarations and native expressions would not improve the saved body's measured frame or byte distance. The hypothesis was supported by the entry-point helper's extra output pointer, the native floor conversion, current canonical coordinate headers, and neighbouring BFME field accesses. It produced a substantial improvement, but did not reach equality.

| Preserved trial | Result | Observation |
| --- | --- | --- |
| `00-saved.cpp` | 1389 bytes; 1118 differences | Reproduces the earlier 0xD8 frame rather than retail's 0xE8 frame. |
| `01-entry-output.cpp` | 1389 bytes; 1121 differences | Correcting the second entry argument alone does not repair stack lifetimes. |
| `02-floor-helper.cpp` | 1468 bytes; 1155 differences | The native float conversion restores the 0xE8 frame but leaves different helper expansion. |
| `03-literals.cpp` | 1454 bytes; 994 differences | Named globals and literal constants remove address macros without resolving the inner-body shape. |
| `08-expanded.cpp` | 1405 bytes; 52 differences | Expanding classification into the owning loop with receiver reloads recovers the full frame, size, calls, and control flow. |
| `14-visible-setter.cpp` | 1405 bytes; 52 differences | Exposing the independently exact 49-byte setter body does not improve center scheduling. |
| `17-native-copy-lifetimes.cpp` | 1405 bytes; 34 differences | A private coordinate copy changes tail operand order, but is unsuitable as a canonical declaration. |
| `23-visible-point.cpp` | 1405 bytes; 52 differences | Exposing the independently exact 344-byte point helper does not improve the region. |
| `26-native-set-both.cpp` and `27-preserved.cpp` | 1405 bytes; 34 differences | Native three-field setters for center and direction retain canonical coordinate declarations and recover the tail's addition operand order. |

Every trial source and its unedited ordinary probe output is preserved under `build/classifyCells-003fc790`. The store, register, and frame family generator produced eight choices; the selected finite center-store search tested its baseline and the swapped x/y stores. The swap increased the difference count from 52 to 53. Its raw result is `09-center-search.txt`, with individual source and result records under `build/shape_search/5aec739769204848a8aa0389550f51ce`. Whole-coordinate copies, a by-value helper, a returned coordinate, explicit scalar copies, z-first assignment, and visible point/setter definitions did not improve the final canonical form. No further unchanged register or x87 experiment is warranted.

Retail stores center z, x, and y before reading the packed cell type at +0x297. The final candidate reads the type at +0x277 and interleaves center preparation with its comparison. The two center `fadd` relocation operands move with these instructions. Both streams realign at +0x2A2; the tail endpoint conversions and destroyed-layer loop then agree with retail. This is a decoded scheduling observation, not a claim that byte equality establishes all runtime semantics.

## Acceptance checks

`class_gate.py` passes for the complete canonical candidate and bank (`27-class-gate.txt` and `bank-class-gate.txt`). `pin_consistency.py --check` passes, including CRT and DIR32 checks (`final-pin-consistency.txt`). The file-to-file `name_regression.regressions` API reports an empty list (`bank-resolved-measure.txt`); this checkout's command-line interface accepts revisions rather than the two source paths stated in the worker brief. `check_csv.py` passes after banking (`final-check-csv.txt`). The final bank probe is `bank-final-probe.txt`; removing the duplicate symbol comment inserted by the banking tool leaves the same measured code. All raw results are under `build/classifyCells-003fc790`.

`find_declared_unmatched.py --fail` refuses the scratch candidate because it has no matched ledger row. This is expected for a partial and is not waived: the method continues to be owned by its existing assembly source. The five inline free helpers carry `absent-from-retail` annotations. No shared header, game source, baseline, pin, policy, or tooling is edited. A full gate is not required for this evidence-only bank; the scoped candidate byte gate fails the remaining region, so this body must not be landed.
