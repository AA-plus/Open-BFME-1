# Animation debugger retry at RVA 0x006F2CC0

The target remains a generated dump. This run banks a complete C++ attempt under the existing `W3DDisplay::gatherAnimationDebuggingInfo` name and claims no recovered bytes. The best corrected experiment compiles to 3,880 bytes against 3,881 retail bytes, with 2,459 differing non-relocation bytes and the first difference at decimal offset 33 (`+0x21`). The repository's length-penalized byte quality is 0.3659. The normalized instruction fraction of 0.953 is a separate diagnostic and is not the bank score. The scoped byte gate fails.

The tested checkout starts at revision `12a2887a4210e39db0b01e506f60463d75a2aaf9`. The target image SHA256 is `1fbdc0ced8f283732c094c4f0804ce8dc1e3e3675b720bcab066c94fed964e75`. Raw sources, compiler objects, checked inventories, probes and gate receipts are retained under `build/006f2cc0/`. Search trials also remain in their original `build/shape_search/` directories. These artifacts must be collected with this note to reproduce the measurements.

## New hypothesis and refutation test

The previous bank is a 31-byte placeholder rather than a reconstruction of the debug ladder. The newly landed diff-description body at RVA 0x006EFF30 supplies a verified output-string argument, ten-word flag receiver, second flag reference, byte-sized Boolean and integer line-limit argument. Its two actual calls inside this target occur at RVAs 0x006F377C and 0x006F3A2F. Canonical string definitions and visible `GameLogic::findObjectByID` also provide compiler information the placeholder lacked. The retry hypothesis was that a complete body with these independently decoded declarations would improve the saved bank. A measured body no closer than the saved bank would refute it. The complete experiments improve the measured score, but they do not establish exact recovery.

The adjacent vector helpers supply the three-pointer range layout, 56-byte stride and overflow ABI. Their opaque element declarations do not establish the payload. Their pointer-form `push_back` name is also not an independent STLport identity witness: pristine STLport 4.6 declares a const-reference parameter, although the machine ABI is the same. No new helper pin or identity correction was added.

## Boundary and owner evidence

The complete target starts after sixteen INT3 bytes at RVA 0x006F2CC0 and ends with a plain return at RVA 0x006F3BE8. INT3 padding starts at 0x006F3BE9. Its entire 3,881-byte instruction extent is reachable from the entry, and every direct internal branch destination is instruction-aligned. It has no outgoing conditional branch or tail jump. The alleged entry at 0x006F37F4 in older records is an internal instruction in this function.

The complete caller at RVA 0x006F3FC0 has a call at RVA 0x006F4015 through ILT RVA 0x00048216. It passes its display receiver in ECX and no stack argument, and ignores the result. Both of the caller's return paths were decoded. The retail W3DDisplay table at VA 0x0111EDD0 has slot 7 at offset 0x1C pointing through ILT RVA 0x000093EF to this caller. The landed constructor at RVA 0x006EF850 and destructor at RVA 0x006EFC20 install the table. Their sources independently show the 25 display-string pointers beginning at receiver offset 0x1C8.

The embedded diagnostic names `W3DDisplay::gatherAnimationDebuggingInfo` explicitly and accompanies the locked-object, animation, weapon and condition-history text. The public `ilt_oracle.check(name, 0x006F2CC0)` API returns CONFIRMED for the existing protected-member spelling. This consistency check corroborates the embedded name; it does not prove identity on its own. The Zero Hour display source was inspected and has no corresponding animation-debug body, so no donor body or donor comments were transplanted. The `name_oracle` has no witnessed W3DDisplay layout at offset 0x1C8; the actual constructor, destructor and target field accesses supply the offset evidence instead.

## Complete value and cleanup evidence

The actual placement construction helper at RVA 0x006EF760 is 66 bytes and calls the complete 110-byte constructor at RVA 0x006EE740. That constructor reads and writes both narrow-string members at offsets 0 and 4, copies ten dwords at offsets 8 through 0x2C, and copies the final dwords at offsets 0x30 and 0x34. It returns the receiver in EAX and cleans one four-byte source-reference argument. Its exception state releases the first string if constructing the second string fails. The allocation width is not used as type proof.

The string operations were followed to their complete canonical bodies. Narrow copy at RVA 0x00887B60 shares an eight-byte-header buffer and maintains its reference count. Narrow release at RVA 0x00887940 owns the corresponding release operation. The complete record destructor at RVA 0x006EDEA0 releases the string at offset 4 and then the string at offset 0; its unwind action also releases offset 0. The complete range-copy helper at RVA 0x006ED250 assigns both strings, copies all ten flag words and both trailing frame dwords, and advances the source and destination by 56 bytes.

The target itself fills the first string with the animation name returned through hidden storage at virtual slot 0x28, fills the second through the description call at slot 0x2C, copies the drawable's ten words from offset 0x250, and writes the current frame into both trailing fields. Its history update writes the final frame field. The flag description body at RVA 0x001B9980 scans the 304 condition indices, independently supporting the `BitFlags<304>` interpretation. The proposed value therefore has two owning `AsciiString` members, one 304-bit flag value stored in ten words, and two frame fields. It is not a scalar or a guessed pair inferred from allocation size.

The independently compiled native copy constructor is exactly 110 bytes modulo relocation slots, and the native destructor is exactly 76 bytes modulo relocation slots. Their probes are type and cleanup evidence only. Neither helper was landed or renamed in this assignment.

The target's eleven unwind states protect the local Unicode string, description AsciiString, complete current record, font-name temporary, weapon-name temporary, two animation-name temporaries, placement construction, and the first record string during the two inlined destruction paths. The cleanup thunks at RVAs 0x0005EE90 and 0x0005EEA0 tail-jump to the complete narrow and wide release bodies. The placement cleanup calls ILT RVA 0x0002AAA9, whose actual target at RVA 0x000607F0 is a one-byte plain return. The candidate now has eleven unwind states, but their numbering and action ordering still differ. Equal state counts do not certify the exception graph.

## ABI corrections and limits

The debug-message global is canonically `TheCRCParameterCheck`, not a FILE pointer. The complete 215-byte logger at RVA 0x00065C80 receives the check pointer followed by a format string and variadic arguments, uses `_vsnprintf`, and appends an owning narrow string to the receiver's vector at offset 4. The candidate now calls its existing C-linkage declaration and uses the existing recorded global. The earlier trial's same-width FILE declaration was rejected despite its unchanged parent bytes.

The decoded weapon helpers establish the four-byte weapon-slot output, 32-bit status return, private const computation method with a Boolean output pointer, float result in ST(0), and next-shot field at offset 0x18. The complete percent helper has 128 instruction bytes followed by a six-entry, 24-byte jump table; all table destinations were resolved and checked on instruction boundaries. The CRT conversion consumes ST(0) and returns EDX:EAX, of which this target uses EAX. The 38-byte FP-mode helper has no stack argument. The entry and exit logic-depth expressions retain the target's pointer-width field access.

Direct helper bodies and all their returns, external branches and tail jumps are listed in `cfg-audit-final.stdout.log`; the per-helper decoded instructions and checked inventories are in `helpers/`. An indirect tail in the object containment helper and the target's display, UI, draw-module and animation-interface calls still require complete concrete virtual-target evidence before any exact claim. The source retains address-derived views for these unknown owners. Existing member names or pins are not promoted into new identity claims.

The existing `AnimationDebugUnwind` placeholder declaration remains unused in the new bank to preserve its descriptive name. The complete routine does not instantiate it. Direct `name_regression.regressions` against the old bank reports no descriptive-to-placeholder substitution after preserving that declaration. The repository CLI accepts Git revisions rather than two source paths in this checkout, so the requested source-path invocation fails; both the failure and the direct source comparison are retained. No correction entry was invented.

## Measurements and rejected shapes

| Trial | Compiled size | Differing bytes | Observation |
| --- | ---: | ---: | --- |
| Saved placeholder | 31 | 23 in the short overlap | Most of the target is absent. |
| First complete body | 3945 | 2766 | Reconstructs the full debugger ladder. |
| Native frame initialization | 3929 | 2584 | Frame fields remain uninitialized until their observed assignment. |
| Visible canonical lookup | 3913 | 2514 | Removes unsupported lookup reloads. |
| Native bitset comparison | 3848 | 2452 | Removes the extra placement state and restores the later out-of-line append, but outlines the comparison. |
| Inline ten-word comparison | 3864 | 2502 | Restores the decoded comparison loop. |
| Best corrected bank | 3880 | 2459 | Correct locked-object null guard, private weapon method and canonical logger. |

The first corrected-bank difference is the receiver register choice at `+0x21`. Other residues include zero-register lifetime, UI receiver-load order, module-loop entry shape, weapon-logic branch placement, history-index evaluation across string comparison, and exception-state ordering. The first normalized structural difference is at `+0x164`; table relocations are not aligned there. Raw relocation-layout drift is not a usable instruction-level callee-binding proof.

Rejected trials include an array-pointer alias (3,929 bytes and 2,745 differing bytes), a shared history-append label (3,963 bytes and 2,509 differing bytes), a cached per-case history index (3,864 bytes and 2,499 differing bytes before the required null correction), a module do-loop (3,868 bytes and 2,599 differing bytes), and a logic-state switch (3,832 bytes and 2,479 differing bytes). Making the complete native copy constructor visible reproduces its independent helper but does not improve that parent trial. Source changes that omitted the required locked-object null guard are not preferred over the corrected body merely because their raw score was higher.

Mechanical EH searches retained seven trials in `build/shape_search/3f9a9ac86ace4394a55f288e47f6d682/` and nine trials in `build/shape_search/a8a15a721a204d438ed2776e92e4ef24/`. The later search produced no improving output. These bounded searches do not exhaust every possible throw declaration. Register and loop family generators report no applicable source-level choice for the tested body; their raw generator outputs are retained. No inline assembly, exception-table writes, forced register directive or new pin was used.

## Checks and reopening condition

The scoped candidate gate calls the repository's `build.verify_functions` with a one-row in-memory substitution and leaves the actual ledger unchanged. It fails for this target, rather than an unrelated source. The raw output is `scoped-candidate-gate.stdout.log` with its command and exit status in the adjacent receipt. CSV integrity, pin consistency and the class gate pass. The declared-unmatched check correctly reports the trial as having no matched row; the bank is evidence, not a game source or a recovery. No shared header or shim was changed, so this partial does not require a full gate.

Reopening is justified by concrete virtual-target bodies that resolve the outstanding declarations, independently verified STL helper identities for this actual value, or a source-level lifetime or visibility change that measurably improves the first divergent instruction without dropping a decoded path. Another unchanged register or x87 spelling is not justified. The remaining byte mismatch, incomplete virtual ABI evidence, unresolved address-derived dependencies and differing unwind-state graph all block an exact claim.
