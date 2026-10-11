# Terrain traversal at 0x0072B580

## Result and next experiment

This is a compiler-measured partial against revision a34cf9bd7d8ba3496672c3dffc681130ec96e93f, not an exact recovery. The preferred bank reconstructs the special case, independent recursive guards, both edge walks and all triangle writes. The remaining work is stack allocation and scheduling. Reopening requires a hypothesis that accounts for the distinct Y-coordinate homes and the vector and scalar lifetimes without changing their values. The separate volatile bounds temporary is a diagnostic spelling, not evidence that EA used volatile.

The new hypothesis was that landed terrain neighbors resolve the earlier missing traversal and helper ABI context. Its supporting evidence is the complete decoded edge splitter, triangle writer, height accessor and callers described below. It would be refuted as a useful retry if complete translations using those declarations did not improve on the saved body. The measured improvement supports preserving the new translation; it does not prove semantic equivalence or the original declarations.

## Boundary, receiver and argument evidence

The complete target is decoded in `build/terrain-0072b580/target.disasm`. Both exits restore the same frame and use `RET 28`, at offsets +0x562 and +0xEBC. Every conditional edge and loop backedge lands on an instruction inside the extent, with no outgoing tail jump or indirect transfer. `boundary-audit.json` enumerates returns and outgoing edges for the target, all direct nonrecursive helpers and both external caller bodies. `checked-target.log` retains the checked callee inventory. The right walker is 310 bytes; the initial 314-byte read included four trailing INT3 padding bytes, which are excluded from the corrected decode and checked extent.

The receiver matches landed `W3DTerrainBackgroundTesselatedUpdate.cpp`, `W3DTerrainBackgroundAdvanceLeft.cpp`, `Rva00729F60TerrainCellHeights.cpp` and `W3DTerrainBackgroundRva0072E150.cpp`. The target reads the origin integers at +0x40 and +0x44, width at +0x48, map pointer at +0x4C and an integer threshold at +0x78. The declaration keeps the neighboring source's name `current` for the last field. The name oracle does not independently witness that name or its semantic meaning.

The two calls in the complete 2068-byte update body, at +0x418 and +0x4AF, and the call at +0x524 in the complete 1740-byte mode body pass seven stack words and the unchanged receiver in ECX. The mode caller supplies receiver +0xC0 as argument two. The target writes 16-bit indices through argument one, treats arguments three through five as signed coordinates and width, reads 16-bit entries through argument six and increments a 32-bit count through argument seven. The triangle calls establish argument two as a float-record buffer. No target return path or caller uses a value return or hidden result storage. The inherited bank spelling `VertexFormatXYZDUV2 *vb` is opaque and incomplete; it is not a claimed vertex declaration.

## Helper types and fields

The complete 897-byte helper at 0x00729F60 ends with `RET 32`. It receives a record pointer, four integer bounds and three pointers whose fields +0, +4 and +8 are read as float XYZ coordinates. It writes a float at record offset +0 or +4, depending on receiver mode +0xB8, using a three-float stride. The mode caller initializes all three float slots in the same records, copying the initial sample to slots +8 and +4 before the target call. Thus the record interpretation follows the actual constructor and writer accesses rather than allocation size. No vector ownership or destructor is introduced by this target. Native `Vector3` declarations come from `vector3.h`; there is no EH frame or cleanup funclet in the target.

The complete 39-byte accessor at 0x006BE030 returns AX and uses `RET 8`. It computes a signed linear index from map width +8 and integer arguments, checks it against +0x20 and checks the pointer at +0x24 before reading a 16-bit sample. Both zero paths also return AX. Six equivalent bounded reads are inlined in the target's edge-loop vertex paths, in addition to eleven outgoing accessor calls. The source retains exactly those six inline sites. Oracle results witness `m_dataSize` and `m_data` at +0x20 and +0x24. Map +0x10 is repeatedly converted to float and scaled before subtracting from world coordinates; the `m_borderSize` interpretation follows the EA twin's corresponding border calculation, although the oracle does not witness this BFME offset.

The complete 759-byte splitter at 0x0072B1C0 returns with `RET 44` on every path, writes four single-byte output flags and preserves the two opaque buffer arguments as stack words. Its canonical landed declaration is reused. At the target call, argument flags 2, 0 and 3 independently guard the lower-left, upper-left and lower-right recursions, respectively; flag 1 guards the upper-right tail iteration. Neither three nested guards nor unconditional recursions describe retail. Each edge walker takes a coordinate reference and four integers, returns AL and uses `RET 20`. The initial and repeated edge calls therefore require both width and height arguments; the old bank's four-slot declarations were insufficient.

The two bit-plane tests use two integer slots and return AL with `RET 8`; their arrays are distinct. The predicate at 0x0074CDD0 also returns the tested byte in AL with `RET 8`, including its early argument-byte return path. Its identity remains address-derived. The setter at 0x007497A0 consumes two integers and a byte boolean and uses `RET 12`. All these complete decodes and checked inventories are retained beside the target. No additional semantic pin is inferred from their ledger names.

## Measured experiments

Every trial source and raw probe output is retained under `build/terrain-0072b580/`. `measurements.json` and `build/verdict.txt` contain the running receipts. The table is derived from raw probe output. Quality uses the repository's `finish_measure.parse`, which penalizes size differences; normalized instruction similarity is not the banking score.

| Trial | Emitted bytes | Probe byte differences | Measured quality | Raw output |
| --- | ---: | ---: | ---: | --- |
| Saved incomplete bank | 965 | 854 | 0.0000 | `build/terrain-0072b580/00-bank-probe-raw.log` |
| Complete ordinary CFG | 3753 | 3097 | 0.1679 | `build/terrain-0072b580/02-probe.log` |
| Traversal loop | 3775 | 2993 | 0.2072 | `build/terrain-0072b580/10-probe.log` |
| Late Y bound | 3771 | 2752 | 0.2689 | `build/terrain-0072b580/13-probe.log` |
| Separate Y home | 3783 | 2495 | 0.3348 | `build/terrain-0072b580/16-probe.log` |
| Interleaved float lifetimes | 3783 | 1830 | 0.5110 | `build/terrain-0072b580/17-probe.log` |
| Visible height helper | 3781 | 2090 | 0.4432 | `build/terrain-0072b580/18-probe.log` |
| Y-first tail | 3783 | 1811 | 0.5160 | `build/terrain-0072b580/19-probe.log` |
| Ordinary Y home | 3771 | 3091 | 0.1791 | `build/terrain-0072b580/20-probe.log` |
| Width-first tail | 3783 | 1799 | 0.5192 | `build/terrain-0072b580/21-probe.log` |
| Volatile output Y | 3823 | 2467 | 0.3211 | `build/terrain-0072b580/22-probe.log` |
| Final formatted bank | 3783 | 1799 | 0.5192 | `build/terrain-0072b580/23-probe.log` |

The count-pointer register hint and reference spelling produced unchanged output and exhaust the two unchanged register experiments. Replacing the opaque record pointer with `float *` also produced unchanged output. The bounded frame-generator trials for the full loop and traversal-only loop did not change their respective output. The store-generator trial on the final CFG was also unchanged. These choices and official `shape_search` receipts are preserved under `build/shape_search/`, with location files in the target scratch directory. The helper-visibility experiment produced worse instruction alignment despite its closer size, so the mixed inline and out-of-line source remains preferred.

## Checks and limitations

The final probe first differs at +0x2: frame 0x98 versus retail 0x94. The first normalized structural difference is at +0x477; later differences include vector homes and instruction scheduling inside the edge loop. The scoped byte gate fails on the body mismatch and the unpinned recursive `fillVBRecursive` symbol. `build/terrain-0072b580/scoped-gate.log` is the raw gate output, using a temporary in-memory row without altering the ledger or symbol map. No pin is added to suppress that failure.

`check-csv.log`, `pin-consistency.log` and `class-gate.log` pass. The documented `name_regression.py OLD_FILE NEW_FILE` invocation fails because this revision expects Git revisions. `name-source-pair.log` instead records the same module's direct `regressions(before, after)` result for the original bank and final source, with no descriptive-to-placeholder regressions. The full staged revision check remains for the coordinator. No header, production source, ledger, pin, policy or tool changes are part of this attempt, so a full gate is not required for this bank.

The bank's `fillVBRecursive` identity is retained from the existing bank and the inspected Zero Hour traversal, including EA's original function comments. The matched BFME caller currently names only `rva0072B580`. The precise BFME semantic method name is not independently pinned by this attempt. No source recovery is claimed as verified, and no bytes are added to matched progress. Shared claim tooling would create and publish Git refs, so it is not invoked under the checkout's no-Git-writes and no-synchronization restriction.
