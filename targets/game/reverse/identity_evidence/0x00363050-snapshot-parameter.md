# RVA 0x00363050 snapshot parameter retry

The target remains a partial recovery. The preferred candidate uses the existing named scale and reproduces the full extent, with only a swapped integer-to-float load and receiver load remaining. The literal-scale diagnostic reproduces the masked bytes but fails global binding. Neither candidate is a landed recovery.

## New hypothesis and refutation

The previous bank already used the landed lookup's native vector and comparison expressions. Directly reading NetworkStringGetterIdentities.cpp, both neighbouring lookup sources, BfmeOwnVUM_ctor.cpp, BfmeOwnVUMCopy.cpp, BfmeConv1335.cpp and INILivingWorldPlayerArmy.cpp found no new declaration that by itself fixes the remaining stores. The useful distinction is between a nontrivial parameter conversion and a discarded returned object while keeping the canonical Coord2D declaration. A parameter view derived from Coord2D can materialize the two observed stack writes without replacing the shared header or changing the outer target's argument type. The hypothesis would be refuted if that parameter conversion retained the old frame or omitted those writes. Trial 02 instead reproduces the frame and both writes exactly. A returned snapshot in trial 01 retains the old shape; the reference-return-source alternative in trial 03 is worse.

Rva00363050Pair remains an alias of the included canonical Coord2D. Rva00363050PairSnapshot is an address-scoped transient layout view with the same two floats and no additional storage or ownership. Its inline converting and copy constructors read and write exactly those two fields. This does not identify an original class or an authentic inline setter signature. All established owner, operation and field names are retained. No pin, shared header, data definition or policy file changes.

## Complete boundary and ABI evidence

The unedited decode and checked inventories are retained under build/target-00363050-run/. decode_complete.log contains the entire target, caller, selector, pair arithmetic helper, string getter, string sharing constructor, string release helper, duration helper, __ftol2 and the target's caller route. Each extent has a checked_<rva>.log. The target ends at 0x00363183 with ret 16, followed by INT3 padding. Every conditional branch stays inside its extent; the empty-range arm joins the epilogue, the unequal-string arm joins the loop increment, and the back edge returns to the getter. The target has no external tail jump, virtual call, indirect call or exception-registration frame.

The complete caller at 0x003C2100 calls ILT 0x000191E1 at +0xD2, then the 11-byte receiver adjustment at 0x003838A0, then ILT 0x0002A419 and the target. The old note's nine-byte wrapper description is incorrect: the decoded ADD ECX,0x170 takes six bytes and the JMP takes five. The complete target's four stack slots are the string reference, signed 32-bit duration, reference to two floats and flag whose low byte is consumed. Caller pushes and target ret 16 agree, and the caller does not use a target return value. The Gen00363050::handle niladic pin is an address-derived routing label, not evidence for the typed signature. The owner remains address-derived.

The selector at 0x003C1EE0 receives the caller's output address and returns the signed selection in EAX. Its null-candidate arm stores 1.0f and 0.0f. Its actual helper at 0x003BEF70 reads two complete returned words, copies both to output, subtracts single-precision values through x87 and writes floats at output offsets zero and four. Its ret 8 agrees with the range and output references. This is independent two-float payload evidence, not an allocation-size or donor-name inference. No value constructor, allocation or record insertion is called by the target. The full STLport vector element ownership is not reconstructed or claimed by this partial record view.

The getter route is ILT 0x0001897B to 0x00361960. The complete getter passes record+0x10 to the sharing constructor, returns hidden result storage in EAX and cleans one four-byte stack slot. The full sharing constructor at 0x00887B60 copies the handle and increments the referenced count. The full release helper at 0x00887940 decrements that count, frees only at zero, clears the handle and returns without stack arguments. Both null and non-null paths are decoded. Canonical StringBase supplies the observed four-byte handle, unsigned-short length at buffer+4 and character data at buffer+8. The main temporary is released before the update arm, as in retail. Constructor unwind ownership is not an applicable target check: the target is not a constructor and the snapshot has no owning fields or cleanup calls.

The range uses receiver+0x18 and +0x1C with stride 0x58. The matching arm clears +0x20, converts the signed duration through __ftol2 into +0x24, copies the pair to +0x3C and +0x40, snapshots it into frame+0x1C and +0x20, and stores the flag at +0x4C. The complete __ftol2 accepts its value in ST(0), has a plain RET and produces EDX:EAX; only the low 32 bits are consumed here. Record identity and untouched members remain opaque. The adjacent constructors concern a different 0xB4-byte record and are not evidence for this target's record type.

## Measured experiments

All probes explicitly use retail size 307. Each named source below is preserved with its unedited <stem>.probe.log under build/target-00363050-run/. Quality comes from finish_measure.parse and includes its size penalty. byte_facts.json records the complete differing offsets and relocation names. These are compiler measurements, not runtime tests.

| Source | Emitted bytes | Non-relocation differences | Measured quality |
|---|---:|---:|---:|
| trial00_saved.cpp | 299 | 78 | 0.6938 |
| family00.cpp | 299 | 78 | 0.6938 |
| family01.cpp | 299 | 78 | 0.6938 |
| family02.cpp | 299 | 85 | 0.671 |
| trial01_snapshot_return.cpp | 299 | 78 | 0.6938 |
| family03.cpp | 299 | 85 | 0.671 |
| trial02_snapshot_parameter.cpp | 307 | 0 | 1.0 |
| trial03_ref_snapshot_return.cpp | 299 | 85 | 0.671 |
| trial04_bound_snapshot.cpp | 307 | 7 | 0.9772 |
| trial05_float_duration_arg.cpp | 307 | 7 | 0.9772 |
| trial06_static_duration.cpp | 307 | 7 | 0.9772 |
| bank_candidate.cpp | 307 | 7 | 0.9772 |
| 0x00363050.cpp | 307 | 7 | 0.9772 |

The generated copy/frame family was run through a bounded shape_search with raw per-trial probes. Its four trials do not improve the saved body; its manifest is build/shape_search/60ea3792d2164aa3bb7a01886d735212/result.json. The returned snapshot and reference-source snapshot hypotheses are rejected by their measurements. The converting by-value snapshot parameter supplies the missing stores while retaining canonical Coord2D. After binding the scale, the remaining offsets are +0xB7 through +0xBD. Retail emits FILD [ESP+0x2C] followed by MOV ESI,[EBP+0x18]; the candidate emits those two instructions in reverse order. Moving integer-to-float conversion into the inline setter argument and then into a static setter's floating argument reproduces the same mismatch. Those are the two unchanged scheduling experiments for this retry; do not repeat them unchanged.

## Binding and gates

gate02_literal.log passes the repository's scoped byte comparison, string references and float-content verification. It fails DIR32 address and consistency verification because __real@40a00000 is already recorded at VA 0x01075344, whereas this target reads VA 0x010E8F14. The latter contains float 5.0 and has the existing g_bfmeKUKC name; the complete duration helper at 0x003609C0 independently reads it. No new numeric image address is placed in candidate source. The literal diagnostic must not be reported as an exact recovery or collected as a source landing.

gate04_bound.log passes string references, constant references, DIR32 address and DIR32 consistency checks using g_bfmeKUKC. Its byte check fails on the instruction swap above. The formatted bank_candidate.cpp reproduces this same result. check_csv-final.log and pin_consistency.log pass. class_gate.log passes because the canonical coordinate and string declarations are included. The direct name_regression.regressions comparison returns no findings in name_regression_files.log; the requested two-file CLI spelling fails because this version expects Git revisions, with that raw failure in name_regression_cli.log. declared_unmatched.log refuses the scratch candidate for owning zero ledger rows, as expected for a non-matching bank. No whitelist or baseline is changed. A full gate is not required for a bank with no game source, shared header or ledger edit.

Final-path verification of targets/game/reverse/attempts/0x00363050.cpp is retained in 0x00363050.probe.log and gate_bank.log. The latter passes all reference checks and fails only bytes. check_csv-bank.log, class_gate-bank.log and name_regression-bank.log pass. preservation.json records the immutable source archives and verifies exactly one appended verdict with the earlier log bytes unchanged. The bank keeps its CRLF line endings. The repository writer appends a CRLF verdict line; Git's default diff whitespace check treats that carriage return as trailing whitespace, while the CR-aware check passes and no trailing space or tab was added.

Tested base revision: 399771f1ba83e75970efb62eaf65c1b3037dadeb. Actual model: gpt-6.1-sol. Reopen only with a binding-safe source or compiler hypothesis that changes the two-instruction schedule, or a repository-approved resolution of the compiler constant's existing DIR32 ownership. The pair frame and comparison are no longer the blocker. The original owner identity remains unproven and address-derived as required.
