# Retained recovery at RVA 0x001C2380

The candidate is a partial reconstruction of the complete 727-byte body at `0x001C2380..0x001C2657`. It emits 727 bytes. The repository probe reports 13 non-relocation differences, while separately normalizing each stream at its own decoded relocation operands gives 17 differing byte positions. The mismatch is confined to the scheduling of four instructions at `+0xA6..+0xB6`. This is not an exact recovery. The existing address-derived method name `Object::rva001c2380Distance` is retained. The tested base revision is `4d34555fd5ba0ccb8f4ba7c20de283af6ace925b`.

## Boundary and ABI evidence

The complete decode has three `ret 12` paths at `+0x2B0`, `+0x2C2` and `+0x2D4`. Every direct conditional branch stays inside the extent, and the body has no tail jump, indirect call, virtual call or exception handler. The decoded call at `0x003EA570+0x18A` goes through the five-byte ILT at `0x0001D31D`, which jumps to the target. The complete caller pushes the goal-coordinate pointer, the source Object pointer and the receiver's coordinate pointer at `Object+0x38`, then sets ECX to that Object receiver. It consumes the returned x87 value in a float comparison. Thus this is a thiscall method with three pointer arguments, a float return and no hidden output storage. Its semantic method name remains unknown.

The pointer passed to `0x0087E150` is the receiver plus `0xAC`. That complete 60-byte helper checks a signed index, reads begin and end pointers at `+0x2C/+0x30`, divides their difference by `0x24`, returns the indexed element or the sentinel at VA `0x012D4CE8`, and returns with `ret 4` on both paths. The target independently reads the returned element's byte at `+0x20` and float fields at `+0x08/+0x0C`. The saved `BfmeGeometryInfo` and `BfmeGeometryPiece` names are preserved as inherited layout views, rather than treated as independently established retail class identities. No STL container type is claimed from the stride alone.

The complete 134-byte helper at `0x0087DB10` receives that element in ECX, a three-float output pointer and a four-byte angle. Its fast path changes output `+0x08` from element `+0x18`. Its other path reads element `+0x10/+0x14/+0x18` and reads and writes all three output fields at `+0/+4/+8`; both paths use `ret 8`. The two seven-byte callees at `0x00873910` and `0x00873920` load a float argument, execute `fsin` or `fcos` and return without cleaning the argument. These are scalar math calls, not ownership or construction helpers.

The call at target `+0x194` uses the ILT at `0x00027A43`, whose complete instruction jumps to `0x00131C90`. That complete 82-byte helper reads one four-byte argument, calculates an inverse square root, returns through ST(0), and uses `ret 4`. The native `WWMath::Inv_Sqrt` declaration is a static fastcall method. Its float argument is passed on the stack; it is not an integer argument eligible for a fastcall register. The native declaration, mangled pin and decoded cleanup agree. No pin was changed.

The receiver's matrix starts at `+0x08`, its angle is at `+0x44`, and the other Object supplies a float at `+0xBC`. These accesses agree with the landed single-box neighbour and the native matrix row layout. `Coord3D` uses the canonical shared header. The full native `Vector3` constructors, copy assignment, scalar multiplication, dot product and `Length2` definitions were inspected. They operate on exactly three float fields. The third delta component is initialized to literal zero; retail nevertheless retains a direction component through the projections and multiplies it after inverse square root at `+0x1AD`. A two-field direction cannot reproduce this operation. There is no constructor cleanup or owned allocation in this target.

## Hypotheses and measurements

The starting bank was reproduced at 711 bytes with 379 non-relocation differences, first at instruction `+0x32` and displacement `+0x35`. The new hypothesis was that the third direction component and the lifetimes of native returned vectors explain the frame and arithmetic mismatch. A worse frame or the absence of the third-component multiplication would refute that spelling. Merely switching to a three-component direction was insufficient; constructing the scaled axes directly as values was the change that restored the `0x68` frame and the retail local slots. Native `Vector3::Length2()` then restored the square spills. Keeping the inside-box return as `BfmeZeroRange` while writing the final clamp with literal `0.0f` restored the separate return paths and the 727-byte extent.

| Trial under `build/rva001c2380-run/` | Emitted bytes | Non-relocation differences | Result |
|---|---:|---:|---|
| `00-baseline.cpp` | 711 | 379 | Reproduced the saved bank. |
| `01-native-2d-length.cpp` | 724 | 578 | Third component restored; frame grew to `0x6C`. |
| `02-native-delta.cpp` | 724 | 568 | Native delta with explicit two-component length; frame `0x70`. |
| `03-native-direct-radii.cpp` | 724 | 568 | Direct radius expressions produced unchanged bytes. |
| `04-scoped-center.cpp` | 724 | 568 | Narrow center scope produced unchanged bytes. |
| `05-native-products.cpp` | 726 | 572 | Separate square locals did not improve the frame. |
| `06-native-products-zero.cpp` | 726 | 572 | Literal normalization and clamp zeros did not improve that shape. |
| `07-radius-first.cpp` | 716 | 572 | Radius-first second branch removed an extra spill, but the frame stayed wrong. |
| `08-value-axes.cpp` | 713 | 332 | Direct scaled-vector initialization restored the retail frame and first stack slots. |
| `09-scalar-copy.cpp` | 703 | 318 | Field assignments improved the later vector schedule. |
| `10-external-copy-zero.cpp` | 710 | 519 | Unknown external zero changed projection and copy scheduling adversely. |
| `11-native-length2.cpp` | 711 | 48 | Native three-component `Length2` restored the square spills and normalization shape. |
| `12-squared-products.cpp` | 705 | 319 | Explicit square temporaries lost the native spill shape. |
| `13-literal-clamp.cpp` | 727 | 13 | Retained candidate; separate zero expressions restored all three returns. |
| `14-native-direction-ctor.cpp` | 727 | 13 | Explicit three-argument direction construction produced unchanged bytes. |
| `15-zero-first.cpp` | 719 | 330 | Early zero initialization worsened the shape. |
| `16-zero-between.cpp` | 727 | 13 | Moving zero between the two stores produced unchanged bytes. |

The generated store choices were tested through `shape_search`: the baseline was 727 bytes with 13 differences; swapping the final radius and distance stores emitted 751 bytes with 521 differences; swapping the delta field assignments emitted 727 bytes with 39 differences. The search stopped after two non-improving trials. Every direct trial source and unedited probe output is retained under `build/rva001c2380-run/`. The generated search sources and result are under `build/shape_search/513bd737a7464d6a9f742e8178d20c85/`. The checked-callee inventories and complete decoded target, caller and helpers are retained in the task folder.

## Remaining blocker

Retail orders the remaining sequence as a zero float load, the delta Y integer load, the matrix X float load, and the direction Y integer store. The candidate orders it as the delta Y integer load, the zero float load, the direction Y integer store, and the matrix X float load. The probe reports 13 differences and one shifted DIR32 relocation site. Independently decoding the absolute-memory operands and masking each stream at its own operand sites gives 17 differing byte positions, exactly `+0xA6..+0xB6`; the remaining normalized bytes are equal. The probe's use of the candidate's operand positions to mask both streams explains the smaller reported count. The independent diagnostic is preserved in `build/rva001c2380-run/independent-relocation-diagnostic.json`. Neither normalization establishes the unresolved datum binding. Reopening is justified by independent evidence for a different native copy lifetime or scheduling context that predicts this exact order. Repeating the tested scalar stores or constructor spelling is not a new hypothesis.

`BfmeZeroRange` is retained by name from the earlier bank. It still lacks a recorded DIR32 binding. Its references must resolve to the independently decoded zero datum at VA `0x01075350` before a landing is claimed, using the repository's authorized recording procedure. The datum is zero in retail, but that fact does not authorize renaming the inherited bank symbol. The existing bank-to-helper pins are reused; no ledger, pin, shared header, policy or tooling was edited by this retry.

## Verification of the bank

Re-probing `targets/game/reverse/attempts/0x001c2380.cpp` with the explicit retail extent reproduces 727 bytes with 13 differences. Its compiler-measured bank score is `0.9821`, which is a ranking measurement rather than acceptance. Raw output is `build/rva001c2380-run/final-bank-probe.log`.

`check_csv.py`, `pin_consistency.py --check` and `class_gate.py` pass. Their raw logs are `check-csv-final.log`, `pin-consistency-final.log` and `class-gate-final.log` in the task folder. The current `name_regression.py` CLI takes Git revisions, so the requested two-file invocation fails before checking names. Its source-comparison function `regressions` was then run against the saved starting source and the candidate and reported no findings; its output is `name-regression-files.log`. This does not substitute for the coordinator's eventual commit hook.

The repository byte verifier was run with an in-memory single-row selection, leaving `functions.csv` untouched. It reports `Functions: FAIL 1/1` for the preserved scheduling mismatch; raw output is `build/rva001c2380-run/scoped-byte-gate.log`. `find_declared_unmatched.py --fail` rejects the attempt file because it has zero matched ledger rows, as expected for a banked partial; raw output is `declared-unmatched-final.log`. No source was landed, no full gate was required for this bank-only change, and no commit was created. Exactly one partial verdict was recorded for this run.

The appended verdict reports the repository probe's count and cites this note; the independent relocation diagnostic was added afterward without appending a second verdict or rewriting the attempt log. A byte comparison with HEAD confirms that all earlier attempt-log bytes remain unchanged. The default `git diff --check` flags the appended row's CRLF terminator as trailing whitespace. That terminator is emitted by the mandated `re_log.py` writer and was preserved.
