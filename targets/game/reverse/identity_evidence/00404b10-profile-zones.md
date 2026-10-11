# RVA 0x00404B10: profile-zone partial

The complete native reconstruction remains a partial. No source recovery or semantic name is claimed. The preserved bank retains the existing names, including `PathfindZoneManager::bfmeBuildProfileZones`, which is descriptive rather than an independently recovered original method name. The tested base is `b6ffa9f781516c238e733f00596c9c306103a20c`; the worker model is `gpt-6.1-sol`.

## Retry hypothesis and result

The current ledger supplies a six-argument `bfmeResolveZones` pin and landed BFME pair-construction and map-index helpers. These can replace the bank's linker-only alias and test its node representation independently. The first hypothesis was that incorrect ABI or payload declarations accounted for the stack surplus. The refuting observation was unchanged emitted bytes after using the correct direct declaration, native STLport iterator and independently checked record widths. Those experiments refute that explanation for the surplus.

The target's grid comparisons read both cell types and then compare masked layer bits. A combined inline comparison can give those two values a shared lifetime instead of expanding two independent `substituteZero` calls. This hypothesis would fail if the frame remained larger or measured finish quality failed to improve. Trial 07 removes the frame surplus and improves positional byte agreement; it still does not match. Trial 21 retains that result with the signed layer spellings used by the independently decoded landed construction helper. The final bank is the complete trial 21 body with stale measurements and alias comments removed.

## Boundary and ABI evidence

`build/worker-00404b10/retail-target.txt` decodes every instruction in `0x00404B10,0x00405799)`. Its only return is `ret 0x14` at +0xC86. `flow-audit.log` checks complete decodes, all direct jump destinations, instruction boundaries, every return and outgoing jumps. The target has no outgoing branch, tail jump or indirect call. Its plain prologue and epilogue contain no constructor cleanup or exception state machinery.

The complete scheduler at 0x00408AD0 and dispatcher at 0x00408CD0 both call the target through ILT 0x00024983. They pass five dword stack arguments in reverse order: end percentage, start percentage, bounds address, layer-array address and map address, with the manager in ECX. The callee consumes all five and cleans 20 bytes. It returns no value, has no hidden return storage and applies no receiver adjustment. The named callers establish the owning manager; they do not establish the bank's descriptive method name. Complete decodes and checked-callee outputs are `retail-scheduler.txt`, `retail-dispatch.txt`, `retail-target-thunk.txt`, `callees-scheduler.log` and `callees-dispatch.log` in the task folder.

All twenty merger calls push six dword arguments and clean 24 bytes: source zone, target zone, equivalency pointer, list-head pointer, list-next pointer and maximum zone. ILT 0x0002B648 jumps to the complete 107-byte body at 0x00403C90. That body reads only the first five arguments and returns with plain `ret`. The existing six-argument pin is consistent; no pin was invented. The remaining direct call is 0x0082B870, which takes one node pointer, returns the next node in EAX and is followed by four-byte caller cleanup. Its complete decode agrees with STLport 4.6 `_Rb_global<bool>::_M_increment` and the native iterator's use of parent, left and right fields at +4, +8 and +0xC. No virtual or other indirect call needs an invented declaration. Raw evidence is `retail-merger.txt`, `retail-merger-thunk.txt`, `retail-increment.txt` and their `callees-*.log` files.

## Independently constructed container representation

The complete producer at 0x00407030 actually reaches 0x00406EC0 through ILT 0x0001EA06. The complete construction body sorts two ushort zone values, swaps their cell pointers together and forms `(lowerZone << 16) | upperZone`. The map is addressed at manager +0x235FC. This is independent construction evidence for the unsigned packed key, not an allocation-size inference.

The helper constructs both complete property records from cell +0xC, then copies eight dwords into the mapped value. Each record contains a ushort type at +0, unwritten alignment bytes at +2, a dword layer at +4, a dword connection layer at +8, byte flags at +0xC and +0xD, and a ushort profile layer at +0xE. It extracts bits 0..2, 6..11, 12..17, 20, 21 and 22..23 respectively. The complete helper reads the zones at cell +0xA; the target uses a 16-byte cell stride. These fields explain every target read at node +0x14 through +0x33. The dword layer values are nonnegative six-bit extractions; the target's equality tests alone cannot distinguish signed and unsigned C++ spellings. The retained signed spelling follows the landed construction source, without treating that spelling as independent semantic type proof.

The actual map-index body at 0x00406C50 uses unsigned comparisons against node +0x10, initializes and copies the full 32-byte mapped value, and returns node +0x14. Its actual hinted insertion reaches 0x004065D0, then 0x00405CD0. The latter constructs at node +0x10 through ILT 0x0003BACA, whose complete 34-byte copy helper at 0x00404290 copies the key dword and all eight payload dwords. The payload is not a scalar inferred from the 52-byte allocation. This establishes its representation; a generated or aliased template name is not original container identity. The target does not destroy or own additional fields in these records. Relevant complete decodes are `retail-pairs-populator.txt`, `retail-pair-construction.txt`, `retail-map-index.txt`, `retail-hinted-insert.txt`, `retail-insert.txt` and `retail-value-copy.txt`, each with a checked-callee log.

The target itself witnesses the three 12-by-6 pointer matrices at manager +0x2329C, +0x233BC and +0x234DC, the maximum zone at +0x23298, the tree count at +0x23600 and the current node at +0x23608. The nearby noop and allocator do not supply this layout. The landed constructor and initial zone pass agree with it; constructor unwind ownership was not used to claim an exact recovery of this target.

The actual Zero Hour source is `inputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/GameEngine/Source/GameLogic/AI/AIPathfind.cpp`. Its zone logic lacks this BFME incremental pair tree and its merger has a different argument list. It is contextual algorithm evidence, not a complete donor for this body. This run's body is a native reconstruction from the existing bank and decoded BFME instructions, rather than a port of that Zero Hour function.

## Compiler measurements

Each table entry is derived from its preserved raw probe. Finish quality penalizes size drift twice and is distinct from normalized instruction similarity. The retail extent is fixed for every trial. The original bank's old author score does not use this formula. Trial 02 emits the same bytes as that bank and is the comparable baseline. Trial 15's higher normalized similarity is not a better byte bank. The complete experiment index and all trial sources, objects and raw logs remain under `build/worker-00404b10/`; generated finite-search trials also remain under `build/shape_search/af9667ee2e084a22bca671c3b3849e4e/`.

| Trial | Object bytes | Masked differences | First difference | REL32 and DIR32 sites | Finish quality |
| --- | ---: | ---: | ---: | ---: | ---: |
| [02-direct-six (`02-direct-six-probe.log`) | 3269 | 2965 | +0x2 | 22 | 0.0386 |
| 04-native-iterator (`04-native-iterator-probe.log`) | 3269 | 2965 | +0x2 | 22 | 0.0386 |
| 07-profile-helper (`07-profile-helper-probe.log`) | 3229 | 2844 | +0xE | 22 | 0.1013 |
| 08-profile-helper-sequential (`08-profile-helper-sequential-probe.log`) | 3193 | 2928 | +0x2 | 22 | 0.0776 |
| 09-visible-merger (`09-visible-merger-probe.log`) | 3092 | 2671 | +0xE | 22 | 0.0947 |
| 13-inline-merger-profile (`13-inline-merger-profile-probe.log`) | 3229 | 2844 | +0xE | 22 | 0.1013 |
| 15-retail-profiles (`15-retail-profiles-probe.log`) | 3176 | 2933 | +0x5 | 22 | 0.0654 |
| 21-signed-record-layers (`21-signed-record-layers-probe.log`) | 3229 | 2844 | +0xE | 22 | 0.1013 |
| 25-enum-profiles-correct (`25-enum-profiles-correct-probe.log`) | 3176 | 2933 | +0x5 | 22 | 0.0654 |
| 26-profile-value-lifetimes (`26-profile-value-lifetimes-probe.log`) | 3023 | 2311 | +0x2 | 24 | 0.1639 |
| 28-inline-profile-values (`28-inline-profile-values-probe.log`) | 3439 | 3026 | +0x0 | 22 | 0.0000 |
| 30-bool-return-lifetime (`30-bool-return-lifetime-probe.log`) | 3229 | 2844 | +0xE | 22 | 0.1013 |
| 31-bool-return-lifetime (`31-bool-return-lifetime-probe.log`) | 3176 | 2933 | +0x5 | 22 | 0.0654 |
| final (`final-probe.log`) | 3229 | 2844 | +0xE | 22 | 0.1013 |

Making a private static merger visible changes the private calling convention and removes the independently required sixth argument. Trials 09 through 11 are rejected as target candidates despite some improved diagnostic numbers. An externally callable inline definition restores the original ABI and reproduces the corresponding baseline shapes. Materializing full property values in grid comparisons introduces two absent helper calls (trial 26); forcing inlining produces a larger valid-call-graph body (trial 28). These are rejected. Signed layer declarations, native iterator spelling, enum-valued getters, explicit index scopes and the finite frame family do not improve the best valid body. Two final boolean-return lifetime experiments reproduce their previous shapes; no further unchanged register experiment was performed.

## Remaining checks and reopening condition

The scoped strict byte gate fails on this candidate's own byte differences; it reports no unresolved call. This is not an unrelated gate failure. Its raw output and command receipt are `build/worker-00404b10/scoped-gate.log` and `scoped-gate.receipt.json`. The first divergence is the receiver register at +0xE, followed by retail's manager spill at +0xF, which the candidate omits. Later grid comparisons use different preserved registers and stack slots. The frame now agrees at 0x34 bytes. Reopening needs independent evidence for the missing native comparison lifetime or a measured experiment that improves these offsets; repeating the tested field widths or iterator declaration is unsupported.

The global read at image VA 0x012B4D2C has no current entry in `dir32_addresses.csv`, `symbols.csv` or `data_rows.csv`. The existing bank's address-derived name is retained without inventing a pin. Its semantic identity remains unproved; a future exact source must establish and record the datum through the designated recorder. The full unsigned-key payload representation is established, while its original template and method spelling remain unresolved. Those names are not byte-match proof.

`check-csv-final.log`, `pin-consistency-all.log` and `class-gate.log` pass. The name-regression command in the brief expects Git revisions in this checkout, so file arguments fail before comparison; `name-and-measure-final.log` instead calls the repository's file-content comparison directly and checks all old/new tokens and layouts. The combined comparison uses a `substituteZero` overload to preserve the bank's existing helper name. The finish-measure CLI refuses its cache-validity receipt because Windows dependency paths are truncated; the bank recorder's parser and direct raw probes still measure the exact candidate. Neither cache validity nor a strict exact match is claimed. No shared header, game source, policy, tool, ledger or symbol pin changed, so no full gate is required for this partial.
