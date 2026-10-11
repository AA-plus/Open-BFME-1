# Radar object-list reconstruction at 0x006C43F0

The complete C++ bank remains partial. Its first mismatch consists of two adjacent reloads in the circle scanline path. The strict candidate check also lacks the address binding for the private endpoint helper. The original MASM ledger row remains unchanged.

The tested revision is `7f39a062e09bc8dea60f2e30e541b2def84f05a2`. The model is `gpt-6.1-sol`. Trial sources, decoded instructions, checked callees and unedited probe output are retained under `build/radar-006c43f0/`. The retained source is `009-retained-owner.cpp` in that directory, and its bank is `targets/game/reverse/attempts/0x006c43f0.cpp`.

## Retry hypothesis and identity

The previous bank omitted the circle path and could not supply the private register conventions for the two alpha-blending helpers. Both helpers now have landed C++ bodies. The new hypothesis was that their actual source, the native `DiscreteCircle` declaration and complete caller evidence would supply the missing control flow and ABI. A conflicting helper convention, additional payload fields or a caller that used a one-byte flag would refute this hypothesis. Each copied alpha helper and the circle destructor reproduces its complete decoded extent outside relocation slots. The resulting target has the retail extent and all but the adjacent reloads agree outside relocation slots.

The Zero Hour twin is `GameEngineDevice/Source/W3DDevice/Common/System/W3DRadar.cpp::renderObjectList`, with its owning declaration in `GameEngineDevice/Include/W3DDevice/Common/W3DRadar.h`. The paired calls in the complete body at 0x006C4A50, at offsets +0x3BA and +0x3C7, reach this target through ILT 0x000272A5. They pass the object lists from receiver offsets +0x10 and +0x14, the address of the texture holder at +0x1488, and a complete dword from EBP. The target passes that entire third slot to `Rva006C0890`, whose decoded body processes packed color channels. It ends with `ret 0x0C` at +0x50D. The nominal ledger signature's `Bool` parameter therefore does not describe the witnessed value width.

The final bank retains `W3DRadar` and every established descriptive name. Its private declaration uses a `const RadarObject *`, a `W3DRadarResetTexture *` and an `int` modulation argument. This is a banked private view, not an adopted canonical declaration. The ledger and shared headers were not changed. The earlier opaque-owner trial is retained only as experiment evidence. A direct comparison using `name_regression.regressions` reports no descriptive-to-placeholder substitutions for the final bank body; the revision-oriented CLI does not accept the file arguments described in the worker brief.

## Native layout and ABI evidence

The complete target reads RadarObject's object pointer at +4, next pointer at +8 and color at +0x0C. These differ from the Zero Hour header's Snapshot layout, so the bank keeps canonical method declarations but reads the independently witnessed fields by offset. Object position remains +0x38. Map lower x/y are +0x143C/+0x1440 and upper x/y are +0x1448/+0x144C. Scaling is `128 / (upper - lower)`. Texture dimensions are +0x14A4/+0x14A8; +0x14AC is the lazily cached fallback color. The fallback source comes through PlayerList +0x14 and Player +0x1C4. Color modulation applies to both ordinary and fallback colors. Whitening uses an arithmetic shift, not signed division by two.

The first template test uses word +0xD4 bit 23, index 119. The second uses word +0xD0 bit 25, index 89. The first selects the branch that looks up the literal `CastleBehavior`; its semantic kind name was not invented. The bank retains the older local name `disguised`. The radius query keeps the established address-derived method name `rva0036F2D0`; its complete body returns a float in ST0 and pops its Player-pointer argument.

The value-returning texture accessor receives hidden result storage, returns that address in EAX and pops the hidden slot. The returned surface wrapper owns one nullable pointer. The complete inner accessor copies that word and invokes AddRef through slot +4, while the complete destructor releases it through slot +8. The target creates its wrapper at the witnessed stack slot, and its cleanup state uses the same receiver adjustment.

The alpha helpers are copied as static, noinline definitions so MSVC can select their private conventions. The 0x006C2A20 call supplies the surface in ECX and width in EDX, then height, x, y, packed color and table on the stack. The 0x006C2DD0 call supplies width in ECX and surface plus the other five values on the stack. Both complete bodies return without popping those caller-owned slots. Their clipping paths and surface-lock cleanup were decoded. The tables were read from retail and retain all four and nine bytes respectively in `retail-data.txt`.

The complete endpoint helper at 0x006C1D00 uses EAX for xStart, EDI for xEnd, ESI for y and EBX for the surface-wrapper address. It clips each endpoint and calls the witnessed three-dword `SurfaceClass::DrawPixel`, which pops twelve bytes. The helper itself returns without stack arguments. Its copied static C++ definition reproduces the full extent outside its four relocation fields. No public calling convention or semantic helper name was inferred from the generated ledger name.

## Circle payload and exception cleanup

The actual constructor at 0x00069350 initializes the vector's three pointers at +0/+4/+8, stores yCenter at +0x0C and its doubled value at +0x10, then calls the actual generation and duplicate-removal helpers. The complete generator at 0x00069250 constructs three signed integer fields. The copy helper actually reached by the vector overflow path at 0x00068C50 reads and writes offsets +0/+4/+8, advances by twelve bytes and has no further field access; the actual fill helper at 0x00068CA0 does the same. Their null-destination and empty-range returns were inspected. The target uses +0 as yPos, +4 as xStart and +8 as xEnd. This establishes `HorzLine` from construction and use, independently of the existing Coord3D helper names and allocation sizes. The canonical native declaration in `game/GameEngine/Source/Common/discrete_circle.h` has this field order.

The compiled and retail target unwind maps both have state 0 to -1 releasing the surface at EBP-0x44, state 1 to 0 clearing the static initializer's guard bit, and state 2 to 0 destroying the circle at EBP-0x20. Raw maps and action disassembly are `target-eh.txt` and `retained-owner-eh.txt`. The circle cleanup at 0x006C43A0 has two returns and a complete 64-byte extent, followed by padding in the longer ledger row. It frees the vector storage through operator delete above 128 bytes and node deallocation otherwise; there is no element destructor or element ownership transfer. The bank's generated destructor reproduces these 64 bytes outside relocations.

The actual node allocator bodies at 0x0082E540 and 0x0082E5F0 were decoded completely and checked. Their free-list index is `(size - 1) >> 3`, with free-link reads/writes at element offset zero and lock acquisition/release around the list mutation. This agrees with STLport 4.6 `_alloc.h` and `_alloc.c`, including the 128-byte cutoff. The older `__new_alloc` alias at 0x0082E540 was not used as identity evidence. The constructor, vector growth and cleanup provide complete caller evidence for these parameter widths.

`flow-audit.txt` records every return, outgoing branch and indirect transfer in the decoded extents. The target has no outgoing branch or indirect transfer. The Object controlling-player tail reaches the completely decoded Team query through ILT 0x0002369B; the shroud-query tail reaches the completely decoded 0x008F8110 body. Their return paths and cleanup were included. Virtual slots in existing RadarObject, module and rendering helpers were recorded separately. Their concrete runtime implementations were not independently identified, so full virtual-target identity remains an unresolved landing check.

## Experiments and stopping point

The following table is generated from the retained raw probe logs using the repository's `finish_measure.parse` score. It is a compiler-distance metric, not a claim that declarations or relocations are verified.

| Trial | Compiled bytes | Non-relocation differences | Distance score |
| --- | ---: | ---: | ---: |
| 000 | 661 | 520 | 0.0 |
| 001 | 1221 | 919 | 0.1752 |
| 002 | 1215 | 934 | 0.1543 |
| 003 | 1352 | 867 | 0.2446 |
| 004 | 1264 | 648 | 0.4506 |
| 005 | 1259 | 326 | 0.6914 |
| 006 | 1287 | 262 | 0.784 |
| 007 | 1296 | 10 | 0.9923 |
| 008 | 1296 | 4 | 0.9969 |
| 009 | 1296 | 4 | 0.9969 |

The mechanical EH search on the earlier literal-bounds body tried eleven outputs without improving its baseline. Its source variants and result receipt are in `build/shape_search/38c2ab46d83a49318f01a7fd276a6d20/`. The final adjacent-order search is in `build/shape_search/32c5baacb0c94c609b70d2f54c720539/`. Moving yDoubled after longest produced 1,294 bytes. The search API reported 315 differences with its broader relocation mask; the retained raw CLI probe reports 317 differences and sixteen relocation-layout mismatches because it masks only instruction-aligned operands. Placing edges before yDoubled while leaving longest last retained the best instruction stream. Neither improved it. The latter was an unchanged register experiment. Raw CLI replay output accompanies every saved search variant as `*-probe-raw.txt`; the difference in counts is a masking definition, not an improvement. No x87 spelling trials were needed.

The residue is at +0x395, +0x397, +0x399 and +0x39B: retail reloads EDI from `[esp+0x24]` before EBX from `[esp+0x30]`; the bank reverses those two instructions. Reopening is justified by a different data-flow or scope hypothesis that predicts this reload order, rather than repeating the two tested declaration permutations.

## Checks and remaining blockers

The original assembly scoped gate passes in `baseline-scoped-gate.txt`. The bank's strict comparison fails in `retained-owner-strict-gate.txt` on the residue and the unrecorded `rva006C1D00` binding. No pin was invented to make it pass. Independent candidate string, float-constant, DIR32 and body-guard checks pass in the correspondingly named `retained-owner-*.txt` logs. Class gate passes, and pin consistency passes in `pin-consistency.txt`. The bank was probed again after the repository banking tool wrote it; `bank-probe-final.txt` retains the same measured residue. Final CSV validation passes in `check_csv-final.txt`. `find_declared_unmatched` rejects the scratch source because it owns no ledger row; it has not been offered as a landed source. The address-derived color global passes the current DIR32 check but needs the repository's recording procedure before landing. Canonical interface integration and the unresolved virtual-target identities remain blockers even if the remaining instruction bytes are recovered. No full gate or source recovery is claimed.
