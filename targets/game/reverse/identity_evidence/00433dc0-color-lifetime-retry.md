# Color lifetime retry at RVA 0x00433DC0

## Result and reopening condition

No source recovery was landed. The retained bank is `targets/game/reverse/attempts/0x00433dc0.cpp`, unchanged from the incoming revision. Its measured quality is 0.6472, with 360 emitted bytes and 127 non-relocation differences, beginning at +0x05. One relocation site does not align with a retail operand, so the diagnostic score is not a binding or acceptance certificate. The strict scoped gate fails on the candidate itself. Reopen only with a native color or draw-wrapper source structure that explains retail's completed packed color before its first virtual call, or new independently supported declarations that change that scheduling. No boundary, receiver, argument-width or callee-route ambiguity was found.

The tested revision is `4d34555fd5ba0ccb8f4ba7c20de283af6ace925b`; the model is `gpt-6.1-sol`. The relevant landed rows and declarations did not change between the prior attempt's tested revision and this revision. Thus no previous scheduling blocker was removed by new ledger context. The current end wrapper at RVA 0x006E9B80 is real C++, but its complete forwarding ABI was already in the earlier evidence. Its unknown semantic name supplies no additional color-lifetime evidence.

## Hypothesis and refutation

Retail computes the alpha clamp and completes the fill color before the virtual begin operation. The bank masks the incoming color early and delays its final shift and OR until after that operation. The retry tested whether a separate packed-color local, a color helper, or independent alpha and packed-color outputs preserve retail's pre-call lifetime. The hypothesis would be refuted if these complete, ABI-equivalent shapes failed to improve the saved bank. None improved the full-body measurement. A separate packed-color local reproduces the first fourteen bytes, but emits 362 bytes with 304 overlapping differences. Moving its mask after the clamp restores the worse 363-byte shape. These are rejected compiler-shape hypotheses, not evidence against the function's validity.

The additional tested forms separate scalar versus reference progress inputs, scalar versus reference original alpha, temporary alpha, a reference fill-wrapper argument, an unsigned-long fill-wrapper argument, late inline wrapper definition, manually expanded fill wrapper, and in-place coordinate subtraction. The current STLport 4.6 minimum template also reproduces the old bank's shape. No optimization flags, alpha-mutation spellings or minimum operand reversals from the earlier run were repeated. The generated register and pointer-copy families have no applicable choices. The full family generator proposes only the two-element original-alpha frame already tested by the earlier run; that exhausted experiment was not repeated.

## Boundary, identity and ABI

The complete target decodes from RVA 0x00433DC0 through the `ret 0x18` at 0x00433F25, ending at 0x00433F28. All its conditional branches stay inside this extent; it has no direct call, external tail jump, exception frame, container, owning construction or unwind cleanup. Both outline sequences are unconditional. The complete caller at RVA 0x00435270 passes receiver fields +0x4C, +0x50, +0x54 and +0x58 as four single-precision values, the word at +0x2C, and signed border word 1. Its call at RVA 0x0043529B reaches the complete ILT jump at RVA 0x00007356 and then the target. ECX remains the same receiver; there is no hidden return storage or consumed result. The target reads the signed progress word at receiver +0x28, as the landed apply and range declarations specify. The existing `Rva00435270Layout::setRect` spelling is retained. No original EA owner or method identity is established.

The actual W3DDisplay vtable at VA 0x0111EDD0 supplies slots +0xB0, +0xBC, +0xC0 and +0xDC through ILT RVAs 0x000096F6, 0x00046E39, 0x0000A06A and 0x00008265. The complete begin and end wrappers at RVAs 0x006E9B70 and 0x006E9B80 load their receiver member at +0x164 and tail-jump to complete renderer extents 0x00934820 (276 bytes) and 0x00934940 (8277 bytes). Both renderer targets have plain returns and no stack arguments. Their results are ignored. The complete fill and outline bodies at RVAs 0x006EA050 and 0x006E9D40 end on every path with `ret 0x14` and `ret 0x18`, respectively. Their x87 field operations establish four float coordinates and the outline's float line width; their color operands are packed four-byte words. The existing fill `int` and outline `unsigned long` declarations were retained. The target's sixth parameter is signed, converted with `fild`; it is not an outline enable flag.

The canonical global is `Display *TheDisplay`, recorded at VA 0x012F1270 by `dir32_addresses.csv`. The shared Display header still declares integer coordinate draw operations and a different virtual layout, so the bank's opaque slot view does not claim that header's class identity. There is no shared header for the opaque layout owner. The STLport 4.6 `_algobase.h` minimum returns a reference selected by signed comparison of its two four-byte inputs; its complete 17-byte retail body and a fresh native-template compile are equal. This establishes the minimum's behavior, without treating the adjacent template pin as proof of the target owner's identity.

Complete raw instructions are in `build/rectangle-00433dc0/{target,caller,minimum,setter-thunk,begin-thunk,end-thunk,fill-thunk,outline-thunk,begin,end,reset,render,fill,outline}.disasm`. `boundaries.json` records the exact bytes' hashes, all returns and direct branches. Checked callee inventories for the target, caller, minimum, both wrappers, both renderer targets, fill and outline are retained as `checked-*.log`. The indirect routes are retained in `vtable.log`. The native minimum probe is `min-evidence.log` and is verification of an already-landed helper, not additional recovered bytes.

## Measured trials

Each row is generated from an unedited probe log and has a complete source snapshot of the same name under `build/rectangle-00433dc0/`, except the initial probe, which used the unchanged bank. Differences count the overlapping retail extent; excess emitted bytes are additional mismatches. Every probe explicitly used the independently checked 360-byte extent. Each command has a JSON receipt with UTC timestamps and exit code. The best source remains the incoming bank, copied byte-for-byte to `retained-bank.cpp` for collection.

| Raw probe | Emitted bytes | Overlapping differences | First offset |
|---|---:|---:|---:|
| [bank-baseline](../../../../build/rectangle-00433dc0/bank-baseline.log) | 360 | 127 | +0x05 |
| [pack-helper](../../../../build/rectangle-00433dc0/pack-helper.log) | 363 | 302 | +0x05 |
| [alpha-helper](../../../../build/rectangle-00433dc0/alpha-helper.log) | 373 | 318 | +0x00 |
| [reference-helper](../../../../build/rectangle-00433dc0/reference-helper.log) | 373 | 318 | +0x00 |
| [unsigned-wrapper](../../../../build/rectangle-00433dc0/unsigned-wrapper.log) | 360 | 127 | +0x05 |
| [mask-after-min](../../../../build/rectangle-00433dc0/mask-after-min.log) | 363 | 302 | +0x05 |
| [packed-local](../../../../build/rectangle-00433dc0/packed-local.log) | 362 | 304 | +0x0E |
| [alpha-helper-ref](../../../../build/rectangle-00433dc0/alpha-helper-ref.log) | 363 | 302 | +0x05 |
| [stlport-min](../../../../build/rectangle-00433dc0/stlport-min.log) | 360 | 127 | +0x05 |
| [reference-wrapper](../../../../build/rectangle-00433dc0/reference-wrapper.log) | 360 | 127 | +0x05 |
| [packed-mask-after](../../../../build/rectangle-00433dc0/packed-mask-after.log) | 363 | 302 | +0x05 |
| [packed-declare-after](../../../../build/rectangle-00433dc0/packed-declare-after.log) | 363 | 302 | +0x05 |
| [packed-getter](../../../../build/rectangle-00433dc0/packed-getter.log) | 363 | 302 | +0x05 |
| [packed-split-helper](../../../../build/rectangle-00433dc0/packed-split-helper.log) | 362 | 304 | +0x0E |
| [two-output-helper](../../../../build/rectangle-00433dc0/two-output-helper.log) | 363 | 300 | +0x05 |
| [color-reference-helper](../../../../build/rectangle-00433dc0/color-reference-helper.log) | 363 | 302 | +0x05 |
| [temporary-alpha](../../../../build/rectangle-00433dc0/temporary-alpha.log) | 360 | 139 | +0x05 |
| [reference-original-alpha](../../../../build/rectangle-00433dc0/reference-original-alpha.log) | 360 | 127 | +0x05 |
| [packed-fill-expanded](../../../../build/rectangle-00433dc0/packed-fill-expanded.log) | 362 | 303 | +0x0E |
| [fill-late-definition](../../../../build/rectangle-00433dc0/fill-late-definition.log) | 360 | 127 | +0x05 |
| [packed-fill-late-definition](../../../../build/rectangle-00433dc0/packed-fill-late-definition.log) | 362 | 304 | +0x0E |
| [bottom-parameter](../../../../build/rectangle-00433dc0/bottom-parameter.log) | 360 | 127 | +0x05 |
| [right-parameter](../../../../build/rectangle-00433dc0/right-parameter.log) | 360 | 127 | +0x05 |

## Verification and preserved state

`scoped-gate.log` retains the raw failure from the repository's unchanged `build.verify_functions` with one in-memory candidate row. It does not change the ledger or relax relocation checks. The baseline hash check passes. `check-csv.log`, `pin-consistency.log` and `class-gate.log` pass. `finish-measure.log` independently reproduces the retained bank's measured score. The declared-definition check in `declared-unmatched.log` fails because the existing bank has zero landed ledger rows; no source landing is proposed and no whitelist was changed. A full gate is unnecessary for this evidence-only handoff. No source, shared header, pin, function row or bank was edited. No background process was started.

The sole verdict row for this run records the unsuccessful retry and points to this note while preserving the better existing bank. All trial sources, raw outputs, receipts and scripts remain under the task's untracked build directory for coordinator collection.
