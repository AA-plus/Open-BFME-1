# Virtual damage query at RVA 0x002DBD20

The reconstructed symbol is `?method@Rva002DBD20@@UAE_NPAVRva002DBD20Weapon@@PAVObject@@@Z`. The address-derived owner and every descriptive name from the existing bank are retained. This note does not establish an EA method name. The tested starting revision is `fc71f2537e40d3d7cea17914628687fc04a61d85`.

## Retry hypothesis and measurement

The earlier bank mixes the inline `Object::getContain()` accessor in the guard with a direct `m_contain` read in the receiver expression. Retail keeps that receiver in ECX and omits the additional move emitted by the bank. The new hypothesis is that expressing both accesses through the native accessor changes the compiler's temporary allocation and saved-register lifetimes. A probe that retained the receiver move or did not improve on the saved body would refute it.

The unchanged bank reproduced 401 emitted bytes against 399 retail bytes, with 142 reported non-relocation differences and the first at +0x06. Replacing only `source->m_contain->members()` with `source->getContain()->members()` produced 399 bytes with no relocation-masked differences. A separate trial exposing the complete header-only list-count operation also produced the exact target; that extra helper is not used by the delivered source. All trial sources and unedited probe output are retained under `build/rva002dbd20-retry/`. The raw initial, accessor and final-source measurements are `baseline.log`, `contain-accessor.log` and `final-source.log` there. The strict scoped build remains the acceptance test for relocation targets.

## Boundary and incoming ABI

`decoded-small.log` contains the complete target decode. The extent ends immediately after the third `ret 8` at +0x18C. The other returns are at +0x4A and +0x6F. Every conditional target is inside the extent. There is no outgoing tail jump, exception frame or cleanup funclet. The stack allocation is restored on every return, including the path that saves EBP only after the early guards.

The incoming receiver is ECX. The first stack argument supplies the context pointer, whose +4 pointer and +8 signed identifier are read. The second supplies the target Object pointer. The target passes these arguments in the same order to the predicate and to damage generation. All returns define AL; the upper EAX bits are not part of the Boolean result.

Retail table VA 0x010CE9CC slot 1 contains ILT RVA 0x00001839, whose complete five-byte body jumps to this target. `Rva001E4160List::any` at 0x001E4160 is completely decoded in `decoded-small.log`: its aligned call at +0x2C invokes handler slot 1 with two pointer-width arguments, tests AL, and has complete Boolean `ret 8` paths. This establishes the virtual-call contract rather than a guessed semantic owner. The matched `Made001E5940` constructor independently installs this table, and the adjacent landed `bfmeStepXJ` uses the same virtual slot. The former identity-only blockers no longer prevent an address-derived reconstruction.

## Callees and data views

The decoded direct-call routes and independent extents are retained in `checked-target.log` and the per-helper `checked-*.log` files. The complete instructions are in `decoded-small.log`, `decoded-large.log`, `decoded-record-mask.log` and `decoded-override.log`. These were read from the current retail baseline, rather than inferred from pin names.

| ILT RVA | Body RVA | Verified contract |
|---|---|---|
| 0x0001D813 | 0x002DF120 | ECX receiver, two pointer arguments, AL result, `ret 8`; all predicate return paths decoded. |
| 0x0002C9D5 | 0x000ED430 | DamageInfo constructor, ECX receiver, EAX receiver result, no stack arguments. |
| 0x000384F6 | 0x002DB880 | Damage generation, ECX receiver, context, Object and output pointers, AL result, `ret 12`. |
| 0x0001F253 | 0x0009A510 | GameLogic lookup, one four-byte identifier, Object pointer in EAX, `ret 4`. The canonical visible declaration is included. |
| 0x0001D49E | 0x002DB3F0 | Six-word comparison, const receiver, pointer argument, AL result, `ret 4`. |
| 0x0003DCCB | 0x00132B20 | Thing receiver, two mask references. Both tail jumps reach ILT 0x00019BCD and body 0x000E9910, whose complete Boolean `ret 8` paths are decoded. |
| 0x000202ED | 0x001BF830 | Object receiver, no arguments, module pointer in EAX. All local branches and the final return are decoded. |
| 0x0001FE4C | 0x003679D0 | Const module receiver, one signed four-byte index, unsigned frame comparison, AL result, `ret 4`. |
| 0x00043FAE | 0x001C7C20 | Receiver and one DamageInfoInput address, float result in ST(0), `ret 4`. Both zero/default returns and the indirect body-interface call are decoded. The existing Drawable spelling is not used to assert the target's class identity. |
| 0x0000C176 | 0x000F88F0 | Header receiver in ECX, no stack arguments, 32-bit unsigned count in EAX, plain `ret`. It reads only the header and node next pointers. |

The complete input constructor reached by DamageInfo is 0x000ED2D0, 79 bytes. It writes a vptr at +0, an identifier at +4, a 16-bit field at +8, dwords at +0x0C through +0x18, bytes at +0x1C and +0x1D, and dwords at +0x20 through +0x44. The outer constructor calls it at this+4 and writes the output vptr at +0x4C, floats at +0x50 and +0x54 and a byte at +0x58. These writes support the 0x5C-byte local object and the target's input pointer at local+4. Neither constructor allocates, calls a destructor or carries an unwind state. The declaration's unread tail is storage, not a claim about additional member identities or ownership.

The complete 230-byte mask helper reads all six words of both masks and of the receiver. Its complemented last word is masked with 0x001FFFFF, establishing 181 logical bits independently of any template pin. The target's temporary copy reads and writes exactly six dwords. `Rva002DB3F0Vec6` therefore states the observed storage without asserting the stale bit-count spellings in unrelated pins. The existing named NONE relocation is retained as a six-word storage view, not proof of a 192-bit source type.

The shared `object.h` supplies Object's layout, including `m_contain` at +0x1FC. No private Object or Thing layout is introduced. The context's +4 pointer supplies byte reads at +0x508 and +0x509; the latter is zero-extended before conversion of the unsigned count to float. No context or template semantic name is newly invented.

## Indirect calls and container limit

The target's containment call has no stack arguments and dispatches through the existing interface pointer's slot at +0x108. Its EAX result is used as the receiver of the header-only count operation. The declaration preserves that pointer-width contract and makes no element access. Concrete OpenContain, HordeContain and AODHordeContain tables have the same slot routed through ILT 0x000329C0 to the complete `xor eax,eax; ret` body at 0x002206A0; raw reads are in `virtual-contract-confirmed.log`. A null-return implementation is permitted by the recovered interface, and no non-null guarantee is asserted. The full OpenContain constructor decode records the table installation at its +0x20 secondary interface. A first exploratory table address was rejected because it contained zero rather than a code pointer; its failed raw read remains in `virtual-contract.log`.

The count helper never reads or constructs a payload. The final source intentionally retains the bank's opaque `Rva002DBD20Calls` receiver, and does not instantiate `list<Object*>` or infer a scalar or pair payload from allocation size. Thus there is no newly claimed STL value type or element destructor. The separately exposed count trial uses only a sentinel and next-pointer view and is not delivered as an additional retail identity.

The float-return callee's indirect call reads receiver+0x200 and passes the original input pointer through slot +8 with no adjustment to that interface pointer. The callee then returns ST(0). The target neither changes the input representation nor assumes a hidden return object. The public interface types in this source describe the observed ABI only.

## Refutation and collection

A different thunk route, an external branch from any claimed extent, a callee consuming a different stack width, a payload field read not represented by the opaque contract, an owned member requiring cleanup, or a strict relocation mismatch would invalidate this recovery. An independently proven semantic owner can refine the address-derived identity in a separate human-reviewed naming correction. No shared header or pin was edited, so a full header gate is not triggered.

The source compiled at its delivered path and the strict scoped gate passed; its raw receipt is `build/rva002dbd20-retry/scoped-gate.log`. `add_match.py` also verified the scoped body and cleared the bank, as recorded in `add-match.log`. Declaration ownership, the class gate and pin consistency passed, with raw output in `declared-unmatched-after.log`, `class-gate-after.log` and `pin-consistency-after.log`. The complete bank and source texts were compared using `name_regression.regressions`; no identifier regression was reported in `name-regression-direct.log`. This checkout's CLI expects Git revisions rather than source paths; the failed requested CLI invocation is preserved in `name-regression.log` for the coordinator, whose staged hook still needs to run.

Collection has one verification blocker: the working-tree `check_csv.py` enumerates bank paths from the unchanged Git index and raises `FileNotFoundError` for the bank that `add_match.py` correctly removed. The unedited failure is `check-csv-after.log`. This worker cannot stage that deletion because its Git directory is read-only. The coordinator must stage the complete transaction and rerun the normal staged integrity check and hooks. The bank is retained exactly in `build/rva002dbd20-retry/baseline.cpp`; it was not restored to distort the intended transaction. All uncollected raw evidence remains local under `build/`.
