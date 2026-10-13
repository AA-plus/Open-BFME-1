# 0x00077A90 finish-bank review

The saved bank reproduces all 373 retail bytes outside 18 relocation operands, but it is not a completed C++ recovery. Its two inline assembly marker blocks supply 54 of those bytes. The current strict scoped gate also refuses eight unresolved STLport names at eleven call operands. The bank and the dump ledger row remain unchanged. No source, pin or identity was landed.

The tested revision is `cad8b7c5926ae06e9ed769454a6af23d3818ef4b`. The model is `gpt-6.1-sol`. The current bank, both immutable saved reconstructions and all seven earlier target verdicts were inspected. Raw retrieval is in build/77a90-20261013/session-target.log. Exact saved source text and its hash are in build/77a90-20261013/binding-audit-v2.log; build/77a90-20261013/bank-original.cpp preserves the bank without edits.

## Hypothesis and refutation

The coordinator's zero-difference screening suggested that the bank might have a remaining compiler-shape residue that could be closed. The review tested whether that measurement described an ordinary C++ reconstruction whose remaining obstacle was a callee binding or a source-structure choice. A complete decode showing discarded register assignments supplied directly by the bank's assembly, together with earlier failed C++ marker trials, would refute that interpretation.

That refutation was observed. There are no non-relocation differences to localize in the current bank. Its exactness depends on two explicit assembly blocks, not a register, stack-slot, field-offset or conditional-tail residue. The current source reproduces their numeric instruction address as well. The assignment explicitly retains the prior rejection of these marker streams as a lift. Moving the blocks into a macro or helper would preserve that unresolved conversion obstacle.

No new compiler-shape experiment was justified. The earlier native container and local-lifetime experiments already recovered the complete interior. The earlier unsigned-long and symbolic-address trial reproduced the complete body but retained assembly. The earlier C++ marker trial emitted 407 bytes with 281 differences, first at +0x0005, and relocation layout drift. Its source was inspected in build/stl-c2-worker/00077a90/trial-long-c-markers.cpp and its unedited measurement is in build/stl-c2-worker/00077a90/probe-long-c-markers.log. The marker-free trial's earlier recorded result was 319 bytes, 233 differences and 54 absent retail bytes, first at +0x0009; that result was not rerun or represented as a new measurement. No unchanged register experiment was repeated.

## Complete target and caller

The target occupies [0x00077A90, 0x00077C05). The conditional branch at +0x0061 reaches the common exit marker at +0x0154. The sole return is `ret 4` at +0x0172, followed by `int3` padding. There are no outgoing conditional branches, tail jumps, indirect calls, virtual calls or EH registration in the target. The receiver is spilled at frame offset -0x60 and is not read afterwards.

The complete 502-byte caller at 0x00078640 calls ILT 0x00043897 at +0x01D6. The complete five-byte thunk jumps to 0x00077A90. The caller supplies the address of an eight-byte stack request as the sole stack argument, and the address of a separate byte-sized local as the receiver in ECX. It consumes no target return value. This agrees with one pointer argument and callee cleanup in the bank's existing `Rva00077a90::grow(InputArg *)` declaration. The caller supplies ABI evidence, not a semantic owner name. Its constructor unwind ownership has not been reconstructed in this run; no recovery of that caller is claimed.

The two marker intervals are [0x0009, 0x0024) and [0x0154, 0x016F). Each saves EAX, assigns five immediate values to EAX and restores EAX. No assigned value is read before it is overwritten or restored. Their decoded bytes are:

| Retail offsets | Bytes |
|---|---|
| +0x0009 through +0x0023 | `50 b8 cc cd ce cf b8 9f 7a 47 00 b8 00 00 00 00 b8 00 00 00 00 b8 cc cd ce cf 58` |
| +0x0154 through +0x016E | `50 b8 cc cd ce cf b8 9f 7a 47 00 b8 00 00 00 00 b8 00 00 00 00 b8 cb cc cd ce 58` |

Complete fresh instruction decoding is in build/77a90-20261013/decoded-full.log. The current checked-callee commands, extents and exit codes are in build/77a90-20261013/checked-results.json, with unedited individual logs under that directory. Every requested extent decoded completely. The only reported outgoing jump is the caller's verified ILT thunk to this target. Decoding and the explicit return-path review support these extents; instruction alignment alone was not used as the boundary proof.

## Value construction and bindings

The target's request holds the record pointer at +0 and the array output pointer at +4. The pointed-to record supplies dwords at +8, +0x10, +0x14, +0x1C, +0x28 and +0x2C. The target writes a pointer at +0x24. The allocation count is scaled by four. The field at +0x2C is used as the array index.

The complete 22-byte value constructors at 0x0006B500 and 0x0006B520 dereference both incoming reference arguments and write one dword each to destination +0 and +4. The complete 19-byte conversion helpers at 0x0006C5A0 and 0x0006C5C0 copy source +0 and +4 to destination +0 and +4. The actual node paths through 0x00076F80 and 0x00077040 reach 0x000768D0 and 0x000769B0 respectively. On both allocation paths these call the complete 23-byte value helpers at 0x00072390 and 0x000723B0, which again copy exactly those two fields, with an explicit null destination path. This establishes a two-word value independently of the node allocation size. The target supplies the record pointer as the second word of its first inserted value; the other two inserted values copy record dwords. The scalar node body at 0x00072C90 copies only one dword on each allocation path. Unsigned branches in the complete lookup and insertion bodies establish the unsigned comparison representation, without establishing the keys' semantic meaning.

The lookup and insert wrappers preserve hidden return storage in ESI, pass it onward and return its address in EAX, with `ret 8`. The end helper writes one word through hidden return storage and uses `ret 4`. The iterator comparison's result is consumed through AL. The insertion bodies write the result iterator at +0 and a one-byte success flag at +4 on both result paths. The decoded copy helpers have no EH registration or object destructor calls. Complete helper extents, both return paths where present and the actual construction fields are retained in the fresh decode and checked-callee logs.

The strict bank gate fails on the operands beginning at +0x003F, +0x004F, +0x00C4, +0x00D0, +0x00E4, +0x00FA, +0x0106, +0x011A, +0x0130, +0x013C and +0x0150. Each operand is four bytes. The eight unresolved names are retained verbatim in build/77a90-20261013/scoped-bank-gate.log. The five real unsigned-int STLport spellings are contradicted by the current ILT oracle. The previously tried unsigned-long spellings remain CONFIRMED at 0x0006B500, 0x0006C5C0, 0x00072510, 0x000762B0 and 0x00077510. The three record-pointer spellings remain opaque placeholders. These oracle checks use body RVAs through the Python oracle API; raw results are in build/77a90-20261013/binding-audit-v2.log. The oracle is name evidence, not independent payload evidence. No contradicted spelling was pinned.

## Checks and reopening condition

The current bank probe passed its relocation-masked comparison twice. The raw, unmodified second output is in build/77a90-20261013/probe-bank-raw.log. The strict scoped gate failed 1/1 on the unresolved names; no strict recovery is claimed. Initial and final CSV validation, current pin consistency and the bank's class gate passed. Their logs are build/77a90-20261013/check-csv-initial.log, build/77a90-20261013/check-csv-final.log, build/77a90-20261013/pin-consistency.log and build/77a90-20261013/class-gate-bank.log. No shared header, shim or source changed, so no full gate is required for this evidence-only outcome.

The blocker remains `codegen-order/unrepresentable-marker-stream`, with the current bank also retaining unresolved and contradicted callee names. This review does not prove that every possible C++ spelling fails. Reopening needs an authentic source or compiler mechanism that emits both complete marker intervals within the accepted conversion rules, with a concrete compiler experiment and a stated refutation condition. Correcting the already-tested unsigned-long bindings alone does not remove the marker obstacle. The best bank is unchanged because no closer body was produced. Exactly one blocked verdict is recorded for this run.
