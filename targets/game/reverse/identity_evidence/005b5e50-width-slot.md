# RVA 005B5E50 width spill retry

The retained body is `targets/game/reverse/attempts/0x005b5e50.cpp`, defining `?translate@Rva005B5E50@@UAEHPBVRva005B5E50Message@@@Z`. At revision `f392c3ed0bf9f6e8e9741ef2ffefdc0e6eadbbb7`, it emits 2,473 bytes with three non-relocation differences at +0x2EF, +0x37F and +0x3AA. Retail uses ESP+0x40 for the width spill; the reconstruction uses ESP+0x14. The assignment note reverses those operands. No new recovery or identity correction is claimed.

## Retry hypothesis and current evidence

The hypothesis was that a narrower width lifetime, an independently scoped bounds block or a scalar copy would move the spill onto the dead incoming argument home without changing the rest of the function. The three decoded instructions at +0x2EC, +0x37C and +0x3A7 support testing stack allocation alone. An unchanged spill or additional instruction differences refutes each proposed shape.

The current ledger still has no target row. Its constructor at RVA 005B5470 and destructor at RVA 005B5330 corroborate the object offsets, eight elements at +0x48 with stride 0x20, and vtable VA 0110DE48. They address layout uncertainty but supply no new stack-slot lever. The actual direct callees have existing ledger entries or witnessed ILT routes. These include the message argument accessor, mouse range and region helpers, input-enabled getter, scrolling helpers, wide StringBase copy and release, and UnicodeString format. No declaration or callee route was changed during this retry.

## Extent and identity

Sixteen INT3 bytes precede RVA 005B5E50. Complete linear decoding covers 2,228 executable bytes through RVA 005B6704. The sole return instruction is RET 4 at RVA 005B616D; the subsequent switch arms jump backward to that common return path. Every decoded direct jump destination is an instruction boundary inside the code extent. There is no outgoing direct conditional branch or direct tail jump in the target.

The referenced jump and index tables occupy the following 245 bytes through RVA 005B67F9. Independent resolution from the COFF symbols, section offsets and addends reproduces all 245 bytes, including all 18 local jump destinations. Each destination is an instruction boundary inside the executable extent. Sixteen INT3 bytes follow the tables. `build/fin-5b5e50/verify_bank.py` reproduces these assertions and the three remaining displacement differences.

Vtable VA 0110DE48 slot zero holds ILT RVA 000344C8, which jumps to RVA 005B5E50. Both installing functions above use this vtable. The target dispatches camera controls and eight bookmark slots, including the literal `GUI:BookmarkXSet`. Its address-qualified bank identity is retained because this evidence does not resolve the competing LookAtTranslator ownership declarations. This claim would be refuted by an independently decoded installing constructor or translator caller establishing another receiver adjustment or a different slot contract.

## ABI and cleanup observations

The target preserves its receiver in ESI, reads one pointer argument into EDI, returns the four-byte disposition in EAX and removes four argument bytes. Complete decoded callees confirm the message index argument and pointer result, two pointer arguments and AL result for the range test, one four-float output pointer for the region helper, one four-byte scrolling mode, and the zero-argument stop and input-enabled methods. The canonical Display declaration gives unsigned four-byte width and height results at virtual offsets +0x2C and +0x30, agreeing with the target's EAX results and comparisons. The region helper writes every output field at offsets 0, 8, 4 and 12 from four signed integer fields at receiver offsets +0x4D88 through +0x4D94.

The wide StringBase copy body reads one source buffer pointer, writes one destination pointer and increments that buffer's reference count. Its complete release body decrements the count, conditionally frees the buffer, clears the receiver pointer and returns without argument cleanup. The format body receives its receiver on the stack, consumes a four-byte by-value string and a varargs address, releases the string and returns with caller cleanup. The target has one unwind state. Its cleanup at RVA 00C39190 addresses EBP+4 and jumps through ILT RVA 0003B304 to the five-byte UnicodeString destructor at RVA 0005EEA0, which tail-jumps to the fully decoded release body at RVA 008881D0.

Complete translator callers, all indirect target bodies, the emitted cleanup funclet and all bank-global DIR32 identities were not independently certified in this retry. They remain acceptance checks for any future exact landing. No STL container type was inferred, and this target is not a constructor.

## Measured source shapes

Each measured source is preserved beside its unedited `*.probe.txt` output under `build/fin-5b5e50/`. Counts below come from `tools/probe.py` at the explicit retail size of 2,473 bytes. For a shorter object, the difference count excludes bytes it never emits; those missing bytes remain mismatches.

| Trial | Emitted bytes | Non-relocation differences | Result |
|---|---:|---:|---|
| baseline | 2473 | 3 | Reproduces the saved bank. |
| width_bounds_block | 2473 | 3 | A bounds block ending before rotation does not move the spill. |
| width_const_inner | 2473 | 3 | A const local inside the branch does not move the spill. |
| width_volatile | 2473 | 7 | Volatility adds subtraction instruction differences. |
| width_global_scope | 2473 | 3 | Function-wide declaration does not move the spill. |
| width_bounds_decl_before | 2473 | 3 | Declaration before height inside the block does not move the spill. |
| width_inline_scope | 2465 | 955 | An inline dimension helper with an output reference changes frame allocation and other instructions; eight bytes are also missing. |
| width_address_identity | 2473 | 3 | Explicit scalar address and dereference fold away without moving the spill. |
| width_aggregate_ctor | 2473 | 3 | A one-word wrapper with an empty constructor does not move the spill. |
| width_aggregate_union | 2473 | 3 | A four-byte union wrapper does not move the spill. |
| width_argument_alias | 2473 | 1253 | Explicit incoming-argument reuse changes disposition storage and other instructions. |
| width_initialized_zero | 2473 | 3 | A dead zero initializer does not move the spill. |
| width_initialized_type | 2473 | 3 | A dead type initializer does not move the spill. |
| width_signed | 2473 | 3 | Signed local storage does not move the spill. |
| width_memcpy | 2473 | 7 | A four-byte intrinsic copy changes additional arithmetic instructions. |
| width_inline_return | 2473 | 3 | A scalar inline getter does not move the spill. |

The probe's relocation-layout diagnostic reports table relocations because it linearly decodes the data tail as instructions. The independent table check above resolves that uncertainty; it does not turn the three width differences into a match. The retained score is 2470/2473, or 0.9987868985038415, and the old bank is unchanged.

## Checks and reopening condition

`build/fin-5b5e50/scoped_gate.raw.txt` contains the strict repository byte gate output for the bank with an in-memory row. It fails 1/1 with no unresolved direct call, and the same three operand differences remain. No ledger row was added. `check_csv_final.txt` and `pin_consistency.txt` pass. Complete target, helper, owner-vtable and cleanup decoding is retained in the same directory. No source, header or shim changed, so a full gate is not required for this evidence-only outcome.

Reopen only with a new source-level lifetime or allocation mechanism demonstrated to move the width spill to ESP+0x40 while preserving the other instructions, or with independently supported declarations that explain why the width cannot share the scalar scratch home at ESP+0x14. Repeating the scopes, wrappers, initializers, inline getters or explicit argument reuse measured here supplies no new experiment.
