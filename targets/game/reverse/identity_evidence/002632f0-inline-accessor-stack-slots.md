# 0x002632F0: inline accessor scheduling and remaining stack slots

## Result and next experiment

This run banks a complete partial at targets/game/reverse/attempts/0x002632f0.cpp. No body was converted and no ledger entry or pin changed. The bank-ready measurement in the table below is the preferred result. The strict scoped comparison resolves all calls and reproduces the same twelve differing bytes, starting at +0x27E. Retail places the waypoint delta at ESP+0x2C and the vector at ESP+0x20; the candidate places them at ESP+0x20 and ESP+0x2C. All remaining main-body differences are those stack displacements. The separate cleanup also remains wrong: the compiled action uses EBP-0x58, while retail uses EBP-0x64. An exact main body would still require checking that cleanup and the indirect dispatcher payload declarations.

Reopening needs a justified source lifetime or declaration shape that swaps those two slots without changing the switch, call scheduling or unwind ownership. Scope changes, const qualification, copy-initialization, an explicit vector temporary, coordinate destructor visibility and waypoint-array initialization did not move them. An empty coordinate constructor changed the switch layout; a helper returning the coordinate by value increased the frame. These measured alternatives do not justify repeating the same register or x87 trials. Artificial stack padding and forced physical frame layouts were not used.

The tested base revision is 71e37b30c98aaa873bd6c2ac7b4ac4782a3f09c1. The actual model is gpt-6.1-sol. Investigation began at 2026-10-11 10:25:28 UTC. This note was generated at 2026-10-11 10:56:56 UTC, after 31.48 clock-measured minutes. No commits were created because this checkout's Git directory is read-only. All trial sources and unedited raw outputs remain under build/ocl-2632f0-retry/. They are uncollected evidence and must be preserved.

## New hypothesis and its refutation

The saved bank's first substantive divergence was coordinate-copy scheduling at +0x9C. The current landed module-data neighbors still witness mode +0x220 and string vector +0x224. The matched PathfinderRva003D84A0.cpp exposes the actual worldToCell implementation; PathfinderIterateCircular1.cpp exposes the traversal reached by the pathfinder adjust helper. Complete decodes confirm the adjust method's receiver, one coordinate-pointer argument, two RET4 paths and boolean AL result. These sources address the historical callee evidence gap. They do not supply a new target identity or an automatic compiler-shape fix.

The new source hypothesis was that the original inline AI pathfinder accessor changes VC7.1's interleaving of the global load and coordinate stores. The Zero Hour AI.h independently contains an inline Pathfinder pointer accessor; retail reads the pointer at AI+0xC. The experiment uses the existing opaque AI view and a source-only getPathfinder helper, with no new pin. A result no closer than the original bank, or instructions reading another offset, would refute this scheduling hypothesis. Its measured improvement is shown by pathfinder-getter in the table. Replacing the member-call adapter with an unpinned direct method declaration did not improve the original bank and was rejected.

Loading waypoint X and Y into float locals before constructing and subtracting the delta reproduces retail's two FLD instructions, integer Z load, FXCH and subsequent field stores. Separating the controlling-player result from argument preparation reproduces retail's call-before-push order and upgrade index/payload registers. These changes address the old switch-copy and call-order blocker. Their combined result is split-xy-player-local. Earlier in-place/native-coordinate subtraction experiments did not contain this scalar-load ordering and were not silently treated as proof of the successful new expression.

## Boundary, identity and ABI evidence

build/ocl-2632f0-retry/002632f0.decode contains all 953 code bytes. The sole return is RET8 at RVA 0x002636A6; every direct branch stays within the code region. The next three bytes are alignment LEA, and the eight-entry switch table occupies the following 32 bytes. build/ocl-2632f0-retry/switch-table.txt records all destinations, each an instruction boundary in the code region. The code-only checked inventory is checked-002632f0.log. The full-size checked-target-full.log rejects linear interpretation of the embedded table. Probe's endpoint warning has the same cause; neither log establishes the boundary by itself.

The complete 46-byte constructor at RVA 0x002628E0 stores the secondary vtable at object+0x10. build/ocl-2632f0-retry/ocl-vtable.txt shows slot +0x34 reaching ILT 0x0002780E and this target. The complete 40-byte caller at RVA 0x00262D60 passes a coordinate pointer and a 32-bit options argument to that slot. It independently supports the location-method identity and two-word ABI, rather than the older rejected angle argument. The bank retains its existing Rva002632F0::method identity and all descriptive names. Its receiver-relative object and data fields remain -8 and -0xC, and findOCL receives this-0x10. The base helper at RVA 0x0026A620 is fully decoded for 80 bytes with RET8.

Complete decodes and checked inventories are retained for both hidden-result terrain methods (RVA 0x001A3770, 253 bytes; RVA 0x001A38B0, 151 bytes), waypoint lookup (RVA 0x001AA900, 294 bytes), pathfinder adjustment (RVA 0x003DAD60, 170 bytes), worldToCell (RVA 0x003D7EC0, 156 bytes), circular traversal (RVA 0x003DA3C0, 1017 bytes), and the 31-byte length estimate (RVA 0x000C3D10). The terrain results use 12 bytes of hidden return storage and RET8. The name lookup accepts a four-byte by-value handle and releases it along every return path. Waypoint XYZ is at +0xC, +0x10 and +0x14. The length helper reads X and Y, returns ST0 and has no stack arguments. Its donor's greater-than comparison differs for unordered inputs from the experimental less-than visible helper; those visible-helper trials are rejected and never banked.

The complete controlling-player getter (RVA 0x001BE3F0, 18 bytes) reads object+0x23C and tail-jumps through ILT 0x0002369B. The routed 12-byte Team getter has two returns and returns the pointer from its linked info. The complete 238-byte add-upgrade body (RVA 0x000D24C0) takes two stack words, returns an upgrade pointer in EAX and uses RET8. The bank's inherited bfmeAdd1095 declaration says void; the caller ignores EAX, so the call shape is usable for this partial, but the return declaration is not a proved canonical declaration. The complete name lookup (RVA 0x0010B0E0, 68 bytes) takes a string-handle reference, uses RET4 and calls the fully decoded 299-byte name-key generator (RVA 0x0008FFC0).

The six-word cdecl wrapper at RVA 0x00262890 reaches the full 62-byte dispatcher at RVA 0x001D6770, which forwards five words through virtual slot +4 and returns with RET20. The five-word wrapper at RVA 0x001F1E80 reaches the full 57-byte dispatcher at RVA 0x001D67C0, which forwards four words through slot +0xC and returns with RET16. Their complete branches and loops are decoded. The Zero Hour ObjectCreationList.h describes both corresponding creation overloads; this is consistent with the findOCL return and owner/coordinate arguments. Competing FXList pins are not independent proof. Concrete indirect nugget callees and the boolean-versus-word and semantic payload declarations have not been exhaustively established. These remain explicit promotion blockers. No invented dispatch or ABI pin was added.

The canonical POD Coord3D header is included. The native WWMath constructor, copy and assignment helpers were independently decoded at their complete extents, including the empty default constructor and destructor. A private delta-only constructor view worsened the shape. The best body uses the canonical three-float layout and does not require a shared-header migration. Source-only inline helpers carry absent-from-retail comments; the EA twin's corresponding original statement comments are retained in bank-ready.cpp.

## Vector payload and exception ownership

The actual call reaches the 162-byte vector copy constructor at RVA 0x000D2E70. Its allocator/base helper at RVA 0x000CC650 is 130 bytes and the allocator accessor at RVA 0x000CA2C0 is seven bytes. The actual element constructor at RVA 0x00887B60 is fully decoded for 121 bytes. It reads only source[0], writes only destination[0], and increments the non-null buffer's reference count after the lock setup. Every branch joins the single RET4 return. The loop advances each pointer by four. This proves a scalar string handle independently of allocation size, a donor label or the _STL pin.

The full 149-byte vector destructor at RVA 0x000658A0 calls the full 134-byte release helper at RVA 0x00887940 on each four-byte element before deallocation. The full 72-byte C-string constructor at RVA 0x00888BC0 explains the four temporary terrain names. All of these decodes and checked inventories are retained. The STLport 4.6 templates in inputs/vendor/stlport/stl/_vector.h and _construct.h were inspected alongside those instructions. No STL row or pin was added.

build/ocl-2632f0-retry/eh-target.log records the target's sole live state: state 0 unwinds to -1 through RVA 0x00C0F830, which passes EBP-0x64 to the vector destructor. build/ocl-2632f0-retry/compiled-eh.txt independently extracts the emitted cleanup using EBP-0x58. The twelve main-body offset differences therefore also have a real exception-cleanup consequence.

build/ocl-2632f0-retry/eh-vector-copy.log records two constructor states. State 0 frees the vector base through cleanup RVA 0x00BF9990 and the complete 45-byte base destructor at RVA 0x000657A0. State 1 calls the one-byte RET helper at RVA 0x000607F0 with two cdecl words through cleanup RVA 0x00BF9998, then falls to state 0. The placement-new expression in STLport's _Construct and the emitted COFF relocation to scalar placement delete support that cleanup identity. The earlier evidence note's destroy-range label for this state was incorrect. It is not an element-destruction loop. The corrected complete extent is one byte, not a span into the next function.

## Compiler measurements and rejected shapes

Each value below is computed from its raw probe output. The same stem identifies the preserved .cpp trial. Measurements are ranking evidence, never a recovery certificate. Getter-return vector trials contain an additional out-of-line helper and are rejected despite their apparent masked improvement. The direct-length and direct-player declaration trials lack independent new symbol bindings and are also rejected. The preferred body contains no new calls.

| Trial | Emitted bytes | Differing bytes | Measured quality | Raw probe |
| --- | ---: | ---: | ---: | --- |
| direct-adjust | 1000 | 338 | 0.6336 | build/ocl-2632f0-retry/direct-adjust.log |
| baseline | 1000 | 338 | 0.6336 | build/ocl-2632f0-retry/baseline.log |
| pathfinder-getter | 1000 | 298 | 0.6741 | build/ocl-2632f0-retry/pathfinder-getter.log |
| getter-loop-fields | 968 | 660 | 0.2915 | build/ocl-2632f0-retry/getter-loop-fields.log |
| getter-delta-constructor | 968 | 660 | 0.2915 | build/ocl-2632f0-retry/getter-delta-constructor.log |
| getter-loop-assign | 1000 | 298 | 0.6741 | build/ocl-2632f0-retry/getter-loop-assign.log |
| getter-vector-return | 988 | 279 | 0.7176 | build/ocl-2632f0-retry/getter-vector-return.log |
| eh-0 | 1000 | 298 | 0.6741 | build/ocl-2632f0-retry/eh-0.log |
| eh-1 | 1000 | 298 | 0.6741 | build/ocl-2632f0-retry/eh-1.log |
| getter-vector-return-inline | 988 | 279 | 0.7176 | build/ocl-2632f0-retry/getter-vector-return-inline.log |
| eh-2 | 1000 | 298 | 0.6741 | build/ocl-2632f0-retry/eh-2.log |
| getter-delta-outer-fields | 968 | 660 | 0.2915 | build/ocl-2632f0-retry/getter-delta-outer-fields.log |
| eh-3 | 1000 | 298 | 0.6741 | build/ocl-2632f0-retry/eh-3.log |
| eh-4 | 1000 | 298 | 0.6741 | build/ocl-2632f0-retry/eh-4.log |
| eh-5 | 1000 | 298 | 0.6741 | build/ocl-2632f0-retry/eh-5.log |
| getter-vector-reference | 1000 | 298 | 0.6741 | build/ocl-2632f0-retry/getter-vector-reference.log |
| getter-point-accessor | 1000 | 298 | 0.6741 | build/ocl-2632f0-retry/getter-point-accessor.log |
| getter-player-local | 1004 | 302 | 0.6619 | build/ocl-2632f0-retry/getter-player-local.log |
| getter-player-declaration | 1004 | 302 | 0.6619 | build/ocl-2632f0-retry/getter-player-declaration.log |
| getter-native-delta-sub | 968 | 660 | 0.2915 | build/ocl-2632f0-retry/getter-native-delta-sub.log |
| getter-delta-destructor | 968 | 660 | 0.2915 | build/ocl-2632f0-retry/getter-delta-destructor.log |
| getter-delta-scalar-set | 952 | 644 | 0.2753 | build/ocl-2632f0-retry/getter-delta-scalar-set.log |
| getter-delta-scalar-constructor | 952 | 644 | 0.2753 | build/ocl-2632f0-retry/getter-delta-scalar-constructor.log |
| getter-direct-length-fields | 968 | 660 | 0.2915 | build/ocl-2632f0-retry/getter-direct-length-fields.log |
| getter-delta-split-xy | 984 | 84 | 0.9069 | build/ocl-2632f0-retry/getter-delta-split-xy.log |
| getter-visible-length | 968 | 690 | 0.2611 | build/ocl-2632f0-retry/getter-visible-length.log |
| getter-visible-length-fields | 936 | 665 | 0.2217 | build/ocl-2632f0-retry/getter-visible-length-fields.log |
| split-xy-player-local | 988 | 12 | 0.9879 | build/ocl-2632f0-retry/split-xy-player-local.log |
| split-xy-vector-copy-init | 988 | 12 | 0.9879 | build/ocl-2632f0-retry/split-xy-vector-copy-init.log |
| split-xy-scope-order | 956 | 715 | 0.2115 | build/ocl-2632f0-retry/split-xy-scope-order.log |
| split-xy-outer-delta | 988 | 12 | 0.9879 | build/ocl-2632f0-retry/split-xy-outer-delta.log |
| split-xy-delta-ctor | 988 | 198 | 0.7996 | build/ocl-2632f0-retry/split-xy-delta-ctor.log |
| split-xy-delta-dtor | 988 | 12 | 0.9879 | build/ocl-2632f0-retry/split-xy-delta-dtor.log |
| split-xy-vector-scope | 988 | 12 | 0.9879 | build/ocl-2632f0-retry/split-xy-vector-scope.log |
| split-xy-const-vector | 988 | 12 | 0.9879 | build/ocl-2632f0-retry/split-xy-const-vector.log |
| split-xy-return-delta | 992 | 280 | 0.7085 | build/ocl-2632f0-retry/split-xy-return-delta.log |
| split-xy-explicit-vector-temp | 988 | 12 | 0.9879 | build/ocl-2632f0-retry/split-xy-explicit-vector-temp.log |
| split-xy-waypoint-initializers | 988 | 12 | 0.9879 | build/ocl-2632f0-retry/split-xy-waypoint-initializers.log |
| split-xy-length-abi-pointer | Compilation refused | | | build/ocl-2632f0-retry/split-xy-length-abi-pointer.log |
| bank-ready | 988 | 12 | 0.9879 | build/ocl-2632f0-retry/bank-ready.log |

The EH generator and a finite six-variant search through shape_search's variant engine were run on the accessor candidate. None improved the accessor candidate. Raw generator JSON and receipts are eh-choices.json, eh-generator.log and mechanical-search.log under build/ocl-2632f0-retry/. The non-EH family generator produced no applicable choices (families-choices.json and families-generator.log). No successful mechanical-family result is claimed.

## Checks and handoff limits

build/ocl-2632f0-retry/scoped-gate-best.log is the strict scoped byte gate at the tested base revision. It exits 1 for the twelve stack displacement differences, with no unresolved calls. Its resolved switch table matches; the eight relocation-layout warnings in the masked probe describe table entries, not eight failed call bindings. strict-differences.txt records the exact offsets. Separate COFF inspection exposes the cleanup difference described above. No exact reconstruction is claimed, so add_match was not run.

class-final.log, check-csv-final.log and pin-consistency-final.log pass. name-final.log records an empty result from name_regression.regressions(original_bank, bank_ready), because this checkout's CLI accepts Git revisions rather than two source paths. declarations-final.log exits 1 because this scratch bank has no functions.csv source claim. This is an expected source-promotion blocker, not a passing declaration gate. No whitelist or baseline was altered. A full gate is not required for this bank/evidence-only change; source promotion remains subject to all normal checks.

The bank was written through re_log exactly once; the target has five verdict rows after this run, compared with four before. The tool retained both the original CRLF bank and the improved measured body as immutable JSON alternatives. The active bank retains CRLF throughout, including the generated two-line metadata header. The original and final source names compare without regressions (name-banked.log). The post-bank CSV and class checks pass (check-csv-banked.log and class-banked.log). declarations-banked.log retains the same no-ledger-source refusal. scoped-gate-bank.log repeats the strict twelve-difference failure on the actual preferred bank path with no unresolved calls. No full gate, shared-header change, policy edit, baseline change or Git write was performed.
