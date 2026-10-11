# RVA 009A5F50 frame and lifetime retry

## Result and reopening condition

No recovery is claimed at revision `09d0c156ebf84d7d24c49078c834ad8b55782c50`. The existing bank at `targets/game/reverse/attempts/0x009a5f50.cpp` is unchanged (SHA-256 `5b83641b6b414719d5f39f8635993530fb45dda23f53f3c7e41c8a71b66896cc`). The current ledger and neighbouring sources supply no new declaration that resolves the imported-random call commoning. Stop after the two row-storage experiments emit unchanged instructions and relocations. Reopen with independently justified source or toolchain evidence that changes the IAT hoist and the row-pointer lifetime, rather than another local ordering or flag sweep.

## Hypothesis, evidence and refutation

Retail allocates a larger frame and retains its current row pointer at `ESP+1C`; the saved reconstruction keeps that pointer in EBP and omits the slot. The documented frame-array lever in `docs/shape_levers.md` suggests testing indexed two-element automatic storage. The finite generator does not recognize the bank's uninitialized `next` declaration, so a preparation trial initializes it where the original assignment stood. The hypothesis predicts retail's frame, retained pointer and indirect-call sequence. An unchanged frame and IAT sequence, or a worse byte distance, refutes it.

`trial01_frame_base.cpp` makes the Gaussian copy static, preserves its established name and adds its absent-from-retail comment; the copied helper no longer supplies a second strong definition. It also prepares the initializer for the generator. Its target bytes and relocation tuples equal the unedited bank. The generated indexed table counter instead changes zero filling from `rep stos` into a scalar loop and worsens the measurement. Both row-pointer array placements compile to the bank's unchanged body. These are the two unchanged register experiments for this run. The `/FAsc` listing is a diagnostic compilation, not a new allocation hypothesis. No x87 respelling, random-pointer spelling or compiler flag sweep was repeated.

## Independently checked contracts

The target covers `009A5F50..009A612B`, with its sole return at `009A612A`. Every direct branch lands on an instruction start in the extent, and the next five bytes are INT3 padding. The complete Gaussian covers `009A5F00..009A5F41` and returns ST0 from three stack doubles; its density arithmetic matches the inlined sequence. The complete CRT helper covers `009F6E38..009F6EAD`, consumes ST0 and returns the converted integer in EDX:EAX, with no stack arguments or callee argument cleanup. Both target calls reach this body directly. The target uses the low integer result. Complete decodes and the required checked-callee inventories are retained for all three extents.

The complete dispatch caller at `009A6130` has code ending at `009A65B3` and a nine-entry jump table whose entries are independently checked against decoded instruction starts. Its call at `009A62DE` passes the destination byte pointer plus plane offset, width shifted by three, height shifted by three, stride and the scalar parameter, in that order. It removes twenty argument bytes and ignores the return value. The complete installer at `009B0D60..009B10D1` writes the target VA into slot `01356E60` at decoded instruction `009B10C3`. The other two installer branches write their tier-specific implementations into the same slot. This proves a five-dword cdecl dispatch contract without a receiver or hidden return storage. Width and height comparisons are unsigned, while the scalar enters signed `fild` arithmetic. Stride signedness and the original source return declaration remain unproved; the bank keeps its existing signed stride and void declaration. No new signature pin is inferred.

The two indirect call sites use IAT slot `01359470`, identified by the PE import directory as `MSVCR71.dll!rand`. The supplied compiler header declares `int __cdecl rand(void)` with DLL import. There are no virtual calls. Constants are read from the image and retained in `imports_constants.json`. Byte-array bases, their separation and the complete fill loops corroborate the bank's distribution and noise buffers. No STL payload, object member, constructor or unwind cleanup is being inferred.

The landed neighbours `BfmeOneHundredFiftyEight.cpp`, `BfmeGaussPdf.cpp`, `Rva009A6130PostFilterDispatch.cpp` and `Bfme5TinyNine.cpp` were read directly. The landed `Rva009BA790.cpp` source was also checked directly; its MMX kernel and signed width do not supply the generic target's compiler shape. The local Zero Hour source search supplies no matching Gaussian-noise implementation. The related [WebM source](https://android.googlesource.com/platform/external/libvpx/+/acb586e0536bb0ffc5b3f41dcdedf77fed3f02c5/vp8/common/postproc.c) separates noise generation into state storage and takes additional clamp buffers in the pixel kernel. It supplies no exact donor or original identity for this target. The address-derived `Rva009A5F50AddNoise` name is retained.

## Measurements

Every probe uses the independently verified retail extent. Quality is the repository's diagnostic finish score, not an acceptance result. The aligned-mask comparison excludes only relocation operands that align in both decoded streams; it reports additional differences where the ordinary probe masks misaligned relocation sites.

| Preserved trial | Object bytes | Probe differences | Finish quality | Aligned-mask emitted differences | Missing retail bytes |
|---|---:|---:|---:|---:|---:|
| `trial01_frame_base.cpp` | 444 | 170 | 0.5116 | 178 | 31 |
| `trial02_frame_0.cpp` | 443 | 201 | 0.4421 | 209 | 32 |
| `trial03_row_array_1.cpp` | 444 | 170 | 0.5116 | 178 | 31 |
| `trial04_listing.cpp` | 444 | 170 | 0.5116 | 178 | 31 |
| `trial03_row_array_0.cpp` | 444 | 170 | 0.5116 | 178 | 31 |
| `trial00_saved.cpp` | 444 | 170 | 0.5116 | 178 | 31 |

The bank's raw probe first differs at `+0x2`: frame `938` versus retail `93C`. The floating-point and distribution sequence otherwise agrees through `+101`, apart from the resulting frame displacements. At `+102`, retail hoists the random import into ESI. It stores the row pointer at `+145`, reloads it at `+1AE` and reloads the import at `+1B2`; those operations remain absent. The bank omits retail offsets `+1BC..+1DA`. Exact differing offsets and values, object bytes and relocations are retained in each `.measurement.json` and `.obj` file under `build/r009a5f50_20261011/`. The baseline was measured twice; other direct source variants have one probe each. The generated counter trial was also measured by the finite search.

## Verification and retained work

`scoped_gate.raw.log` records the ordinary failed byte gate against a candidate-only row, without mutating the ledger. `gaussian_gate.raw.log` and `ftol_gate.raw.log` pass the ordinary scoped helper gates. `check_csv.raw.log`, `pin_consistency.raw.log` and `class_gate.raw.log` pass. The current `name_regression.py` accepts revision identifiers, so the requested file-path invocation fails as recorded; no bank-to-source landing occurs. The scratch-only declared-source check reports the expected unclaimed definition because it has no ledger row; it is not an accepted source. Both raw diagnostic failures are retained without an exemption.

`trial02_frame_1.raw.log` records an unsuccessful invocation of a nonexistent second generated choice. The generator supplies one table-counter alternative; the path failure is excluded from all measurements. The actual two row-pointer variants have complete preserved sources and raw probe logs. `shape_search_frame.raw.log` and `shape_search_path.txt` locate the finite search receipt and immutable trial sources. All local experiments remain under `build/`; no nonmatching source remains in `game/`. No header, pin, baseline or policy is edited, and no full gate is required for this evidence-only outcome.
