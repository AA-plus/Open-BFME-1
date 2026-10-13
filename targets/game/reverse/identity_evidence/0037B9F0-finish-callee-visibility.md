# Exact recovery at RVA 0x0037B9F0

The complete body is recovered as `?update0037B9F0@Rva0037C310Owner@@QAE_NXZ` in game/GameEngine/Source/GameLogic/System/Rva0037B9F0Update.cpp. It passes the ordinary scoped gate with relocation-resolved equality over the complete 393-byte extent. The owner and original method identity remain unproved, so the bank's address-derived names are retained. The tested revision is cad8b7c5926ae06e9ed769454a6af23d3818ef4b plus this uncommitted conversion. The model is gpt-6.1-sol.

## Collection requirement

Stage the new source, repointed functions.csv row, deleted_rows.csv tombstone, removed bank, added getter pin, updated verdict and attempt archives together. Git is read-only in this worker. The ordinary check_csv invocation in build/rva0037b9f0-second/check-csv-final.log cannot read the deleted bank because its unstaged path remains in Git's source membership. The new source is also unstaged. Preserve the conversion and rerun check_csv and the normal hooks after staging. No shared header, shim, tooling or baseline was edited, so this source conversion does not require a full gate.

## Hypothesis and measured result

The original bank reproduced 15 differing bytes in 393 bytes. The new hypothesis was that source lifetimes and branch joins could release the zero register before the FX query. Separate zero and Object locals, one reused local, local unions, nested scopes, declaration orders, early returns and compiler flag changes tested that explanation. A separate `selected` local defined in both query branches, followed by `object=selected`, reduced the difference count to 11 without changing the extent or any field access. This established a live structural lever and refuted the earlier claim that only an unchanged register spelling remained. The measured intermediate bank was preserved by re_log._bank before conversion; its immutable archive is targets/game/reverse/attempt_history/0x0037b9f0/57147fc9bd9acfce8987d572dd7cc0832631f2833dfaa3448b1096888aa26bd1.json.

The second hypothesis was that a documented MSVC compiler barrier could separate the notify and FX optimization regions without emitting an instruction. The supporting evidence was the persistent zero at the query null comparison and the repository's existing barrier shaping examples in docs/shape_levers.md. `_ReadWriteBarrier()` immediately before the FX guard, combined with the result join, makes the complete body exact. The barrier is declared as an MSVC intrinsic and emits no instruction or relocation. This is reconstruction shaping, not a claim about EA's source. Strict byte inequality, an added call, a changed field access or a changed unwind action would refute this implementation. None occurred.

build/rva0037b9f0-second/ReadWriteBarrier-pre-fx.log retains the first exact probe. build/rva0037b9f0-second/final-source-probe.log repeats the match at the final game/ path. build/rva0037b9f0-second/strict-final-raw.log verifies all ordinary callee bindings, equality and compiled unwind metadata. build/rva0037b9f0-second/add-match.log and build/rva0037b9f0-second/scoped-gate-final-python.log pass source claims, function bytes, string and constant references, five recorded DIR32 references and the body guard. Exact equality has therefore been reproduced in multiple independent compilations and ordinary verification calls.

The ablation matters. Adding the same barrier to the original bank without the `selected` join retains 15 differences (build/rva0037b9f0-second/original-bank-barrier-ablation.log). Keeping the join without the barrier retains 11 (build/rva0037b9f0-second/selected-result-join-assignment.log). Moving the read/write barrier inside the FX block or directly after the query keeps 11. `_WriteBarrier()` at all tested positions also keeps 11. Both the join and the boundary before the FX guard are necessary in the tested forms.

## Every original difference and register lifetime

The original baseline's differences are derived from its compiled object, masking only relocation operands, in the following table. build/rva0037b9f0-second/diagnosis.log retains the complete instruction and lifetime derivation before banking. The final body has no remaining differences.

| Offset | Retail byte | Original bank byte |
|---|---|---|
| +0x0EF | 2E | 3E |
| +0x0F1 | CD | CF |
| +0x0F7 | 85 | 3B |
| +0x0F8 | C0 | C5 |
| +0x103 | E8 | F8 |
| +0x105 | 7E | 6E |
| +0x10D | 57 | 55 |
| +0x11A | FF | ED |
| +0x11E | ED | FF |
| +0x122 | 2E | 3E |
| +0x127 | 78 | 68 |
| +0x12A | FF | ED |
| +0x12E | CF | CD |
| +0x139 | 55 | 57 |
| +0x13B | CF | CD |

Retail materializes zero in EBP at +0x1B. It uses that zero to initialize the predicate temporary's handle at +0x1F, test the expiry frame at +0x26, test the first string handle at +0x4F and its word length at +0x53, write unwind state zero at +0xA2, test delay at +0xC2, test the AI pointer at +0xDD and test FX at +0xE9. The last zero use is +0xE9. At +0xEE it loads the primary Object into EBP, uses it as the query receiver at +0xF0, optionally replaces it with the virtual result at +0x102, tests it at +0x11D, reloads it at +0x121 if needed and pushes it for FX at +0x139. The query's null comparison at +0xF7 is therefore TEST EAX,EAX.

Retail EDI first holds the duration: either zero at +0x8D or config +0x48 at +0x91, then its last use as duration is the push at +0xA0. It later holds ID loaded at +0x104, pushed at +0x10D and last tested at +0x119. It becomes the reloaded FX pointer at +0x126, tested at +0x129, used as culling receiver at +0x12D and last used as dispatch receiver at +0x13A. The lookup result occupies EBX from +0x113 through its push at +0x138.

The original bank extends zero EBP to CMP EAX,EBP at +0xF7. Its Object occupies EDI throughout the corresponding window, while ID and FX occupy EBP. Thus +0xEF and +0xF1 encode the initial Object register, +0xF7 and +0xF8 encode the different null-test operation, +0x103 encodes the virtual result destination, +0x105 and +0x10D encode ID, +0x11A encodes the ID test, +0x11E and +0x122 encode the Object fallback, and +0x127, +0x12A, +0x12E, +0x139 and +0x13B encode the two FX arguments and receiver. Every changed byte is accounted for by those instructions. The final join plus barrier reproduces retail's whole allocation and test sequence.

## Complete boundary and caller ABI

build/rva0037b9f0-second/decode-0037b9f0.log and checked-0037b9f0.log retain the complete target through its only RET at RVA 0x0037BB78 and following INT3 padding. Every conditional branch stays inside the extent. The target has no tail jump. The complete caller remains in build/rva0037b9f0-writer8/decode_00290e50.log. Its actual instruction-aligned call at RVA 0x00291565 routes through ILT 0x0000C69E to this body. ECX holds the pointer loaded from caller +0x7C, no argument is pushed and the caller tests AL immediately afterward. This proves the retained niladic thiscall bool contract without a receiver adjustment; it does not prove a semantic method name.

The owner fields are Object pointer +0, config pointer +4, a dword ID at +8, expiry frame +0x2C and initial frame +0x30. The frame view reads the recorded GameLogic singleton's dword +0x3C. The config accesses are kind +4, FX pointer +0x34, owning string +0x3C, delay +0x40, byte flag +0x44, dword duration +0x48 and delay +0x50. Canonical Object, GameLogic lookup, FXList and AsciiString declarations are included. The owner and config views preserve the bank's names, and name_oracle has no witnessed layout for them. No semantic rename is claimed.

## Getter, ownership and complete callee evidence

The new pin `?copyString0037B0D0@Config0037B9F0@@QAE?AVAsciiString@@XZ` names only the address-derived getter already declared by the bank. The actual call routes through ILT 0x00041BF0 to the complete 32-byte body at RVA 0x0037B0D0. It takes hidden output storage as its sole stack argument, adds +0x3C to the receiver, passes that address to the string copy helper, returns output storage in EAX and ends with RET 4. build/rva0037b9f0-second/decode-0037b0d0.log and checked-0037b0d0.log retain it. Its generic existing ledger alias does not independently prove the config's identity.

The complete 121-byte copy helper at RVA 0x00887B60 reads one source handle, writes one destination handle, increments the pointed header's dword reference count at +0 and returns the receiver with RET 4. Its initialization and synchronization branches are also decoded. The complete 134-byte release helper at RVA 0x00887940 decrements that count, conditionally frees the header and clears the handle. The target compares the pointed header's unsigned 16-bit length at +4. These operations establish the owning AsciiString payload independently of allocation size or a donor name. Their raw files are build/rva0037b9f0-second/decode-final-00887b60.log, decode-final-00887940.log and the matching checked-final files. The added pin passes both its individual consistency check and the full pin-consistency check, while preserving symbols.csv's existing bytes and CRLF append.

All direct helper extents are decoded and checked again under build/rva0037b9f0-second/decode-final-<rva>.log and checked-final-<rva>.log. Object modifier at RVA 0x001C1DA0 takes a string reference followed by a dword duration, returns AL and uses RET 8 on all exits. Lookup at RVA 0x0009A510 consumes a dword ID, returns an Object pointer on every exit and uses RET 4. Notify at RVA 0x0026FCD0 consumes no explicit argument. Culling at RVA 0x0042DAA0 returns AL. FX dispatch at RVA 0x00428180 consumes primary and secondary Object pointers in that order and requires 166 bytes to include RET 8 at RVA 0x00428223. Its unrelated ledger size of 163 is unchanged. No new container value type is inferred by this conversion.

The complete query helper at RVA 0x001CF980 reads Object's template at +4, follows override +4, tests the template's +0xD4 flag, optionally selects Object +0x214 and either returns zero or tail-jumps through contain slot +0x68 after restoring ESI. The final source calls the canonical query declaration. Its actual niladic Object return from query-result slot +0x4C is checked separately: concrete Horde interface table VA 0x010AED58 and AOD table VA 0x010AE230 both route slot 19 through ILT 0x000495B2 to the complete 170-byte body at RVA 0x00237D70. build/rva0037b9f0-second/diagnosis.log records the two table bindings, and decode-00237d70.log plus checked-00237d70.log retain the entire selector. All its returns are a full EAX pointer or zero, it consumes no stack argument and all branches stay inside its extent. Its existing address-derived method name and deeper container types are not renamed.

## Unwind evidence

build/rva0037b9f0-second/eh-final.log derives one unwind state, 0 to -1, with cleanup RVA 0x00C1B1E0. The cleanup loads ECX from EBP-0x10 and jumps through ILT 0x0000D828 to the five-byte AsciiString destructor at RVA 0x0005EE90, which transfers directly to releaseBuffer at RVA 0x00887940. The complete cleanup and destructor routes have decoded and checked files in the same directory. build/rva0037b9f0-second/strict-final-raw.log independently reads the compiled COFF and finds the same one-state action, EBP-0x10 adjustment and AsciiString destructor. The protected object is the modifier-call string temporary. The target is not a constructor.

## Rejected experiments and checks

Every trial source and unedited probe output is retained in build/rva0037b9f0-second/. measurements.json indexes the target probes. The first run's sources and raw logs remain in build/rva0037b9f0-writer8/, and its original evidence note is preserved as build/rva0037b9f0-second/first-run-evidence.md. Running measurements were written to build/verdict.txt after each probe. The register/copy/branch generator found no applicable transformation for the 11-byte candidate; its output is join-generated-choices.json.

Compiler commands in build/rva0037b9f0-second/compiler-commands.log show that the bank and matched Emotion neighbour use the same -O2, runtime and EH options without CL or _CL_ overrides. G5, G6 and GB retain the original residue. G7, Os, O1 and Og- worsen it. The no-FX early return, disjoint result definitions without reassigning the original Object, separate string temporaries and alternate duration initialization change instruction layout or frame storage. Selected-result declaration order, scopes, inverted arms, third copies, const and integer pointer values, lookup visibility and complete query visibility retain the 11-byte intermediate. A typed fastcall view of the proven niladic virtual slot also retains 11. The attempted free-function __thiscall slot typedef does not compile under MSVC 7.1 and is rejected. Binding its return through a const pointer reference reduces the stack frame and is also rejected. The final source contains none of these rejected forms.

build/rva0037b9f0-second/declared-unmatched-final.log passes. build/rva0037b9f0-second/class-gate-final.log passes. build/rva0037b9f0-second/pin-consistency-final.log passes. The name_regression CLI expects Git revisions rather than the source-path arguments from the brief, so its initial invocation is retained as a failed diagnostic. The repository's name_regression.regressions API compares the original bank directly with the final source and returns no regressions in build/rva0037b9f0-second/name-regression-pair.log. The coordinator must still run the normal staged hook. build.cmd's py launcher fails inside this sandbox; invoking the same tools/build.py entry point with the available Python interpreter passes in scoped-gate-final-python.log.

The former register blocker is resolved. There is no unresolved boundary, ABI, unwind, call or byte check. Collection still requires staging and the normal CSV and commit-hook checks. The semantic owner and original method name remain unknown by design.
