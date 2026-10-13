# 00794040 exact recovery and private ABI

The 170-byte helper is recovered as clean C++ in game/GameEngineDevice/Source/W3DDevice/GameClient/GUI/Gadget/W3DPushButtonCenteredScaledImage00794040.cpp. The normal scoped gate and a separate strict comparison both pass, with zero differing bytes and no unresolved symbols. The existing name drawCenteredScaledImage00794040 remains address-derived; this recovery does not claim EA's original semantic name.

The successful representation forwards the four rounded float locals through a forced inline reference boundary. That boundary calls beginImageDraw before computing the draw arguments and restricts the two center reads in the additions through const volatile Real references. The resulting FLD instructions read each center first and the FADD instructions read its extent, while the earlier stores, subtractions, virtual calls, frame and tail jump remain exact. No assembly is used. The hypothesis would have been refuted by an unchanged load order or additional prefix spills; the retained exact probe and strict gate refute those outcomes.

The tested base revision is 47a6fd60ac390e9fcce18607dc2508bec432190f with the source and ledger changes in this working tree. The model is gpt-6.1-sol. The initial bank is preserved byte for byte in build/794040-second/baseline.cpp and build/794040-finish/baseline-final.cpp. The full history is in build/794040-second/session-target.log and the earlier saved-source review is in build/794040-finish/history-targets.txt and history-summary.txt. eligibility.open_dumps accepted the assigned row in build/794040-finish/eligibility.log. Every trial retains its complete TU and unedited probe output under build/794040-second/, with hypotheses and measurements appended to build/verdict.txt.

## Complete target and caller evidence

Retail 00794040 has no conditional branch or direct call. Its final instruction starts at +0xA4 and is JMP [EDX+0xDC], ending at +0xAA. INT3 padding follows. It restores ESI and its 16-byte local frame before that tail call. The full target and the 2761-byte caller at 00795140, including all caller returns and following padding, are decoded in build/794040-finish/retail-decode.log. The requested extents pass checked_callees in checked-target.log and checked-caller.log. The caller's final RET is at +0xAC8; earlier return paths also lie inside the extent. No direct conditional branch leaves either extent.

The instruction-aligned caller site at 00795140+0xAAE calls 00794040 directly. At +0xA9F it loads EDI from the cached image global, at +0xAA5 it sets ECX to the start coordinate pair, at +0xAA9 it sets EAX to the size coordinate pair, and at +0xAAD it pushes the color word from ESI. ADD ESP,4 follows the call. The helper reads EAX+0 and EAX+4 as signed 32-bit integers, then ECX+0 and ECX+4 as signed 32-bit integers, and EDI+0x24 and EDI+0x28 as signed 32-bit integers. The physical inputs are an image pointer, two pointers to pairs of signed 32-bit coordinates, and one stack word. There is no hidden result pointer or output store to an input object. The caller consumes no return value; the source's void return models this observed use.

The coordinate producers are independently matched GameWindow::winGetScreenPosition at 004781D0 (58 bytes) and winGetSize at 004782A0 (41 bytes). Their complete bodies write two dwords through the output pointers and return RET8. Both size return paths were inspected. Their decode is in build/794040-finish/coordinate-getters.log, with checked-position.log and checked-size.log. Caller sites at +0x514 and +0x525 route through ILT 0002F94B and 00036EBC to these bodies. This supports the coordinate widths independently of the bank's declarations.

The caller row at 00795140 is still a generated dump, rather than a verified source recovery. Its bank reproduces 2761 bytes with 139 differing bytes. Its helper call preserves EDI/ECX/EAX and the single stack color word, although the coordinate objects occupy different local slots. Complete bank object decoding and relocations are in build/794040-finish/bank-object-decode.log; the companion measurement is in companion-final.log. The caller's emitted exception cleanup was not independently verified for production. No companion source is promoted.

The existing helper name drawCenteredScaledImage00794040 is retained. It describes the measured arithmetic and preserves the address; neither the caller nor a literal establishes an original semantic name. ilt_oracle.check called with the body RVA returns UNTESTABLE, as recorded in build/794040-finish/helper-oracle.log. No real-name identity is added or corrected.

## Virtual contract and canonical declarations

The recorded W3DDisplay vtable at VA0111EDD0 is supported by the existing constructor and destructor sources, rather than inferred from the helper's name. Slots +0xB0, +0xD4 and +0xDC route respectively through ILT 000096F6, 0002743A and 00008265 to 006E9B70, 006F21B0 and 006E9B80. The table and decoded routes are retained in build/794040-finish/display-vtable.log and virtual-routes.log.

The two 11-byte begin/end bodies forward the receiver's +0x164 pointer and tail-jump to 00934820 and 00934940. Their complete decodes are in wrapper-decode.log, and the complete 276-byte and 8277-byte leaves are in virtual-leaf-decode.log. checked-begin.log, checked-end.log, checked-reset-leaf.log and checked-end-leaf.log retain the extent inventories. Both leaves return without stack argument cleanup. Their internal ownership and exception machinery are unchanged and are not claimed as recoveries here.

The +0xD4 callee has an ECX receiver and seven stack words, with RET1C at +0x502. Its null-image path and normal path share the final epilogue. Its complete 1285-byte code decode is in build/794040-finish/draw-slot-decode.log, with checked-draw-slot.log. Its indirect switch reads a six-entry table beginning at 006F26B8, beyond the code extent. All six entries were read and validated against instruction starts inside the complete code body; draw-slot-switch.log retains them. The caller passes one image pointer, four 32-bit floating-point coordinates, color and mode; no receiver adjustment is added at the call site.

The independently matched 70-byte Bfme5Host::bfmeRunE provider at 0040D900 forwards these seven words through the same B0/D4/DC sequence and returns RET1C at +0x43. Its actual donor source, game/GameEngine/Source/Common/Bfme5BeginWorkEnd.cpp, was read. Its complete decode and extent inventory are in build/794040-finish/wrapper-decode.log and checked-wrapper.log. The current shared game/GameEngine/Include/GameClient/Display.h retains the older integer-coordinate interface and does not declare this BFME sequence. The production source keeps the canonical Display singleton declaration and casts it to DisplayImageView00794040, an address-bearing view of the independently decoded float-coordinate slots. This view has no members besides the vptr and declares no owning class identity. The shared header is unchanged, and no class-gate allowance is used.

The assigned helper is not a constructor and has no exception frame, allocation, owning member or container value constructor. Constructor unwind and STL key/payload checks therefore do not apply to this target. This does not certify the unmatched companion's exception metadata.

## Independent emission and compatibility

The old claim that the genuine companion had to match before the helper could be promoted is refuted. Replacing the companion with either a minimal caller or a caller retaining the image after the call preserves the helper's EDI image, ECX start, EAX size and stack color ABI. The trials are build/794040-second/isolated-emitter.cpp and isolated-live-image.cpp, with their same-named raw logs. The production source uses the minimal emission caller marked absent-from-retail. Its complete emitted body sets those registers, pushes the color, calls the helper, and performs ADD ESP,4 before returning. Both complete production bodies and their relocations are in build/794040-second/production-object-decode.log. The 2761-byte companion is neither edited nor claimed by this change.

The existing game/gen_asm/d_00793520.asm still calls the retired dump name from its caller body. targets/game/reverse/symbols.csv therefore gains only the required address-only compatibility pin for ?d_00794040@@YAXXZ at 00794040. The call is independently decoded at 00795140+0xAAE. The new pin preserves CRLF and passes the targeted and full pin-consistency checks in build/794040-second/compatibility-pin-after.log and pin-consistency.log. Both the inherited helper symbol and dump alias are UNTESTABLE under ilt_oracle.check with the body RVA; source-name-check.log retains those actual oracle results. They are placeholders rather than independently established original names.

## Starting residue and distinct experiments

The starting bank emits 170 bytes with four operand-displacement differences. Retail FLD at +0x5C reads the center at ESP+4, followed by FADD at +0x60 reading the extent at ESP+8. The bank reverses those operands. The corresponding X-axis pair begins at +0x72 and +0x76 after the outgoing argument area has been reserved. The complete starting decode is in build/794040-finish/retail-decode.log and the reproduced probe is build/794040-second/baseline.log.

| Byte offset | Retail | Starting bank | Instruction |
| --- | --- | --- | --- |
| +0x5F | 04 | 08 | FLD at +0x5C |
| +0x63 | 08 | 04 | FADD at +0x60 |
| +0x75 | 24 | 28 | FLD at +0x72 |
| +0x79 | 28 | 24 | FADD at +0x76 |

Earlier source operand reversal, declaration orders, compound-assignment helpers, negative-extent subtraction, direct sequencing and volatile reads were already recorded and were not repeated unchanged. The first run's /Op trial emitted 230 bytes with 135 differences in the probe window; double center and extent promotions and the visible native member wrapper retained the four-byte residue. Their complete sources and raw logs remain under build/794040-finish/. This continuation tests distinct aggregate, accessor, parameter, inline-boundary, caller and compilation representations. The delayed restricted reads combine a newly verified reference boundary with volatility after beginImageDraw, rather than applying it to the initial locals or original wrapper-call arguments.

The following rows are generated from each retained raw probe. For a short compiled body, the probe's difference count describes its compared window; the missing tail is also incorrect. None of the shorter or longer candidates is treated as a recovery. The failed direct CLI invocation of name_regression with file paths is retained in name-regression.log; the tool accepts Git revisions, so source-name-check.log uses its regressions API on the actual bank and production snapshots.

| Trial | Size and probe result | Raw probe |
| --- | --- | --- |
| baseline | 170 bytes; 4 differences in the probe window | build/794040-second/baseline.log |
| axis-records | 170 bytes; 4 differences in the probe window | build/794040-second/axis-records.log |
| reference-forwarding | 113 bytes; 78 differences in the probe window | build/794040-second/reference-forwarding.log |
| neighbor-eh-flags | 170 bytes; 4 differences in the probe window | build/794040-second/neighbor-eh-flags.log |
| value-forwarding | 92 bytes; 67 differences in the probe window | build/794040-second/value-forwarding.log |
| reference-forceinline | 170 bytes; 4 differences in the probe window | build/794040-second/reference-forceinline.log |
| value-forceinline | 170 bytes; 4 differences in the probe window | build/794040-second/value-forceinline.log |
| inline-stdcall | 170 bytes; 4 differences in the probe window | build/794040-second/inline-stdcall.log |
| pair-setter | 170 bytes; 10 differences in the probe window | build/794040-second/pair-setter.log |
| pair-operators | 183 bytes; 86 differences in the probe window | build/794040-second/pair-operators.log |
| alias-union | 170 bytes; 10 differences in the probe window | build/794040-second/alias-union.log |
| target-global-opt-off | 205 bytes; 144 differences in the probe window | build/794040-second/target-global-opt-off.log |
| target-g5 | 170 bytes; 4 differences in the probe window | build/794040-second/target-g5.log |
| target-g7 | 170 bytes; 4 differences in the probe window | build/794040-second/target-g7.log |
| target-size-opt | 131 bytes; 110 differences in the probe window | build/794040-second/target-size-opt.log |
| native-image-accessors | 170 bytes; 4 differences in the probe window | build/794040-second/native-image-accessors.log |
| native-image-size-pointer | 170 bytes; 4 differences in the probe window | build/794040-second/native-image-size-pointer.log |
| color-unsigned | 170 bytes; 4 differences in the probe window | build/794040-second/color-unsigned.log |
| coordinate-references | 170 bytes; 4 differences in the probe window | build/794040-second/coordinate-references.log |
| isolated-emitter | 170 bytes; 4 differences in the probe window | build/794040-second/isolated-emitter.log |
| isolated-live-image | 170 bytes; 4 differences in the probe window | build/794040-second/isolated-live-image.log |
| axis-methods | 170 bytes; 4 differences in the probe window | build/794040-second/axis-methods.log |
| late-volatile-center | 170 bytes; exact outside relocation slots | build/794040-second/late-volatile-center.log |

The production probe is build/794040-second/production-view-probe.log. The final call-view cast retains the same exact 170-byte body while preserving the canonical Display global declaration. The intermediate production declaration and its raw strict comparison are retained in production-display-class.cpp and display-class-scoped-gate.log; its class allowance was removed before the final verification.

## Checks and retained working tree

build/794040-second/add-match.log records the normal add_match conversion, source claims, one matched function, constant references, DIR32 references and body guard. The final source uses the call view and passes the normal gate again in build/794040-second/final-build-python.log. build.cmd could not find its Python launcher in this sandbox; final-byte-gate.log retains that entry-point failure, and the unmodified tools/build.py successfully performs the same scoped gate. The independent build API comparison in scoped-gate.log freshly compiles the final source, compares all 170 patched bytes with Masked=False, resolves every symbol and verifies all four float constant references and five DIR32 references. scoped-compile.log retains the compiler output and scoped_gate.py reproduces that check. The compiler is MSVC 13.10.3077.

The final declaration check, class gate, member-name oracle, direct bank-to-source name regression and full pin consistency pass in declarations-final.log, class-gate-final.log, member-names.log, source-name-check.log and pin-consistency.log under build/794040-second/. There is no header or shared shim change, so no full gate is required. No baseline is broadened. The ledger and tombstone change through add_match, which also deletes the converted bank.

check_csv passed before implementation in build/794040-second/check_csv-initial.log. Its final run stops with FileNotFoundError at the unstaged bank deletion, because its inventory still comes from the read-only Git index. build/794040-second/check_csv-final.log retains the raw failure. The exact source, repointed row, tombstone and bank deletion are preserved for coordinator staging, followed by final ledger and commit-hook validation. This is a collection blocker, rather than an unresolved boundary, type, ABI or byte-match claim.

The existing uncommitted verdict row is updated in place to converted, and no second row is appended. build/794040-second/handoff.json records measured timestamps and source hashes. There are no local commits or background processes from this continuation. All trial sources and raw logs are retained for collection.
