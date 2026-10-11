# 0x007DBD40: type and lifetime retry

The tested revision is 7f531c2158f73cfed209554abd29a7f9638befc2. The model is gpt-6.1-sol. The generated ledger row remains unchanged. No exact source recovery is claimed. This retry preserves a complete candidate with a modest measured improvement over the immutable reconstruction from the preceding run.

## Boundary, identity and ABI

The complete target decode covers 0x007DBD40 through 0x007DC4B7. Its three return paths end with RET 16 at +0x50, +0x6F and +0x774. Every immediate branch destination is an instruction boundary within the extent; there is no outgoing tail jump or exception registration. The matched 88-byte constructor at 0x007DCA80 writes vtable VA 0x01128C5C. Slot 3 contains ILT RVA 0x00003F5D, whose decoded jump reaches the target. The original owner name remains unknown, so the reconstruction retains Rva007DCA80. A different route, an escaping branch or an additional return path would refute this ownership and boundary evidence.

The complete filter wrapper at 0x00716A50 forwards four stack words to slot 3 with an unadjusted ECX receiver. The caller at 0x0073E050 reaches the wrapper through ILT 0x00035F3F. Its decoded call sites at 0x0073E184 and 0x0073E266 construct adjacent float dimensions at ESP+0x1C and ESP+0x20 and pass their address as the final argument. Those dimensions come from the two display virtuals at +0x2C and +0x30, including unsigned-to-float correction. The target divides by the two float fields, establishing the Coord2D* representation. The wrapper forwards the mode and coordinate reference before the bool reference and display-size pointer; the caller tests AL after the wrapper returns. The target does not read its second word, so its unused reference representation follows the existing bank and interface rather than a new claim about its contents.

The caller's ledger size of 5126 bytes stops inside MOV ESP,EBP. Its complete epilogue terminates at the RET at 0x0073F458, followed by INT3 padding. The independently decoded 5129-byte extent is retained only as caller ABI evidence. Its sole return is complete and its direct branches remain internal. No unrelated ledger row or source was edited.

All directly called non-thunk extents and the six relevant thunk routes were decoded completely and checked with checked_callees.py. The target's set call consumes one mode word and tests EAX; reset has no stack arguments. The floor import consumes an eight-byte double and returns ST(0). The CRT __ftol2 body consumes ST(0), returns EDX:EAX and has no stack arguments; the target consumes EAX. The current-data getter is a six-byte constant-address return and does not read ECX. The highlight helper receives seven four-byte words and returns without callee stack cleanup. The COM calls explicitly push their receiver and use the observed stdcall widths. Their slots are separate from the engine's thiscall virtuals. This evidence does not identify the unknown dynamic COM implementations.

The constructor iterator receives the element address, stride 44, count 4 and callback pointer. Its callback receives ECX, returns it in EAX and writes no fields. Both have complete returns and no cleanup path. Every vertex store in the target establishes four position floats, one colour word and six texture-coordinate floats, consistent with the draw stride and FVF 0x344. D3DXVECTOR4 is a tested representation, not a proven original typedef. No STL payload type is inferred from the opaque 12-byte snapshot field passed by address, and no local ownership or constructor unwind claim is added.

The texture accessor at 0x0090DC60 dereferences its ECX handle address, optionally invokes object virtuals +0x28 and +0x2C, then reads the resource pointer through object+0x14 and resource+8. This proves the receiver and result width, not the canonical TextureBaseClass owner. Its inherited name remains a routing declaration. The bank preserves the existing GlobalData prefix view and its descriptive names; only the byte at +0xDBD is witnessed here. An exact landing still needs canonical layout adoption and a defensible accessor routing declaration.

Raw evidence is retained in build/target-007dbd40-retry/. Files include retail-target.txt, boundary.json, complete-extents.json, decode-*.txt, checked-*.log, vtable-01128c5c.log, caller-abi.json, decode-render-caller.txt and checked-render-caller.log. Raw paths are plain text because build/ is untracked.

## New hypotheses and measurements

The prior blocker was a rotated run of scalar and D3DX temporary slots plus delayed final-point and UV stores. Named globals and literals tested whether raw pointer aliases affected scheduling. A late Coord2D offset aggregate and late scalar copies tested the two extra float values suggested by retail's spill slots. An origin aggregate and a scale storage object tested native aggregate allocation rather than another declaration permutation. These hypotheses would be refuted by unchanged allocation or a worse distance. A late copy of vertex 1's vertical coordinate into vertex 3 instead of another member read modestly improved the measured byte distance; it remains far from an exact recovery. The native Vector4 header was inspected and compiled as a distinct value-construction hypothesis, whose tested form is substantially worse.

Each trial source and unedited probe output is preserved. The store and frame choice generator output is family-choices-raw.json. Bounded searches tested only the last-point lifetime and final secondary-coordinate store order; store-search-manifest.json identifies their retained shape_search directories. STOP_WORKER was checked before each compiler experiment. Native BaseType compilation setup failures are retained and are not byte measurements. The reference-scale, floor-temporary and colour-chain forms emitted unchanged bytes; these are rejected, not further reopening proposals.

The quality column uses finish_measure.parse's distance: differences plus twice the missing or excess extent, divided by the verified retail size. Normalized instruction shape is diagnostic and does not establish equality. New relocation masks and layout drift limit fixed-offset score comparisons, so a higher score is only a banking preference.

| Candidate | Emitted bytes | Non-relocation differences | First difference | Measured quality | Raw probe |
|---|---:|---:|---|---:|---|
| 00-history | 1901 | 735 | +0xFE | 0.6049 | 00-history-probe.log |
| 01-named | 1901 | 735 | +0xFE | 0.6049 | 01-named-probe.log |
| 02-pair | 1899 | 995 | +0x2 | 0.4668 | 02-pair-probe.log |
| 03-scalar | 1890 | 706 | +0xFE | 0.6086 | 03-scalar-probe.log |
| 06-all-globals | 1901 | 727 | +0xFE | 0.6091 | 06-all-globals-probe.log |
| 07-scale-reference | 1901 | 735 | +0xFE | 0.6049 | 07-scale-reference-probe.log |
| 08-copy-bottom-v | 1907 | 714 | +0xFE | 0.6222 | 08-copy-bottom-v-probe.log |
| 09-copy-vertical | 1882 | 665 | +0xFE | 0.6217 | 09-copy-vertical-probe.log |
| 10-scale-storage | 1901 | 735 | +0xFE | 0.6049 | 10-scale-storage-probe.log |
| 11-origin-storage | 1901 | 809 | +0xFE | 0.5662 | 11-origin-storage-probe.log |
| store-12-1 | 1910 | 1019 | +0xFE | 0.4657 | store-12-1-probe.log |
| store-23-1 | 1907 | 714 | +0xFE | 0.6222 | store-23-1-probe.log |
| 16-vector4 | 1772 | 932 | +0x2 | 0.3668 | 16-vector4-probe.log |
| 18-retained-names | 1907 | 714 | +0xFE | 0.6222 | 18-retained-names-probe.log |
| old-preferred | 1574 | 1143 | +0xFE | 0.0492 | old-preferred-probe.log |

## Remaining mismatch and collection

The final source is build/target-007dbd40-retry/18-retained-names.cpp. It remains four bytes shorter than retail, with 714 non-relocation differences. At +0xFE frameScale still occupies ESP+0x0C instead of ESP+0x20. The first normalized structural divergence remains retail +0x487, where final-point, colour and secondary-coordinate stores have a different schedule. Late relocation diagnostics follow that layout drift and do not justify changing pins. Reopening needs independent evidence for a native local or value lifetime that explains the rotated slots and delayed stores, or a newly established callee representation that materially changes compilation. Repeating the rejected forms is unsupported.

The strict scoped gate fails byte equality; its raw output is 18-retained-names-scoped-gate.log. CSV and pin consistency pass. The declared-unmatched refusal is expected for a scratch partial with no repointed ledger row. The filename CLI form of name_regression is unsupported in this revision; its raw refusal is retained, and the tool's regressions function reports no name regression against the original preferred bank in name-regression-files.log. The earlier forward-GlobalData candidate was not banked because that comparison reported a descriptive-name replacement. No game source, shared header, pin, baseline or tooling was changed, so no full source gate is required. Exactly one verdict row is written for this run, and the improved body is preserved through re_log.py. No Git write or synchronization command was run.

The bank was recompiled at its saved path with the same 1907-byte extent and 714 differences. Its raw probe is banked-probe.log and its strict gate output is banked-scoped-gate.log. The bank class check, filename-independent name comparison and final CSV check pass; checks.json and verdict-count.json retain exit codes and the five-to-six record count. The preferred bank and immutable source JSON are the collection artifacts.
