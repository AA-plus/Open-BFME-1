# Finish investigation for 0x00377550

## Result and reopening condition

The preferred bank remains unchanged. It reproduces at 392 bytes with 27 non-relocation differences. No trial improved it, and no source recovery is claimed. The remaining differences concern the early saved-register schedule and the EBX/ESI allocation of the receiver, outer index, player, and team. Reopening needs independently verified compiler context or a different source lifetime that preserves the witnessed instructions. These finite experiments do not prove that C++ recovery is impossible or that assembly is required.

The tested base is 16a4cde5255c3670cbe00cddd70f670df651f845. The model is gpt-6.1-sol. All trial sources and unedited outputs remain in build/r377550_finish/. The method keeps the bank's address-derived rva00377550 name. No production source, pin, shared header, tooling, or function-ledger row changed.

## Boundary, owner, and calling convention

The complete target decode is build/r377550_finish/target.disasm. Its checked inventory is build/r377550_finish/target_callees.log. The true return is at +0x172, and the false return is at +0x187. The end is 0x003776D8, followed by INT3 padding. All conditional branches remain inside the extent, and there is no tail jump. The receiver arrives in ECX, there are no stack arguments or hidden return storage, and the result is a Boolean in AL.

The complete caller is 0x00377740. Its 502-byte code portion is followed by two alignment bytes and six jump-table entries. The full linear checked-callees request rejects the final table byte as an incomplete instruction, so that output is not a boundary certificate. build/r377550_finish/caller_code_callees.log checks the complete code portion instead. build/r377550_finish/bank_offsets.log decodes every table entry and verifies that its destination lies inside the code. The state-zero path at caller +0x61 forms this-0x10, calls ILT 0x0002A5F4 without arguments, and tests AL.

The CastleBehavior constructor at 0x00376250 installs its secondary vtable at this+0x10. The landed interface caller uses the corresponding receiver adjustment. The data04/object08 layout and calls to the independently landed status helper at 0x00371EE0 further support the inherited CastleBehavior owner. These facts do not identify EA's private method name. Complete constructor and status-helper decodes and checked inventories are retained in owner_constructor.disasm, owner_constructor_callees.log, status_helper.disasm, and status_helper_callees.log under the task's build directory.

The Object dispatch at target +0x96 uses vtable slot 0x50 and passes one four-byte pointer from player+0x230. The canonical Object header names the slot setTeam(Team *). The complete 346-byte retail body, including its ret 4 and Team operations, agrees with this declaration. Its evidence is set_team.disasm and set_team_callees.log. The name oracle does not independently witness CastleBehavior+0xA4 or Player+0x230; name_owner.log and name_player.log preserve those negative results. Existing bank field names are retained.

## Complete value-copy and cleanup evidence

The vector starts at data+0x54 and ends at data+0x58. The target divides their byte difference by eight. This stride is not used alone to identify the value type. At +0xD0 through +0xE3, the target copies the first field through the complete StringBase<char> copy constructor at 0x00887B60, then reads the separate four-byte payload at entry+4 and stores it in the second local word. At +0x103 through +0x10F, the payload becomes the builder's second argument.

The complete 181-byte builder at 0x00372FA0 checks that argument against signed -2, performs unsigned upper clamping and a signed negative check, and returns with ret 12. The first argument is the template pointer, the second is the index word, and the third is the flag word. The third word is forwarded to the complete 280-byte downstream wrapper, whose flag decision reads BL. These bodies are retained in build_objects.disasm and build_member.disasm with checked inventories. pair<AsciiString,int> is a compatible representation; the exact pair template identity is not independently established by allocation size or a donor name.

string_copy.disasm contains all paths of the 121-byte constructor. It reads only the source handle at +0, writes destination+0, and increments the buffer's four-byte reference count when non-null. The complete compare helper independently reads the narrow buffer's two-byte length at +4 and characters at +8. string_release.disasm contains every path of the 134-byte release, which decrements the reference count, frees a zero-count buffer, and clears the handle. These helpers never access the scalar payload at entry+4.

The aligned-frame instructions precede the EH registration, so eh_info is invoked at 0x00377556. eh.log reports one unwind state, predecessor -1, and cleanup action 0x00C1AD10. The action adjusts ECX to EBP-0x18 and jumps through ILT 0x0004B10A to 0x0036CC00. That five-byte body jumps to the complete releaseBuffer at 0x00887940. This agrees with one owning string and a non-owning scalar payload. The state-zero store follows the complete string and scalar copy, and normal destruction follows the reset to -1.

Complete Object helper decodes and checked inventories are retained for 0x001BF300, 0x001CA2E0, and 0x001C15F0. The activation helper's tail at +0x78 reaches PartitionData::makeDirty at 0x008F7B30. Its complete 27-byte body takes no stack argument and ends in plain ret. The unpack helper's complete 1104-byte extent ends in ret 4 and reads its Boolean argument. Other indirect sites inside these helpers remain explicitly decoded; their semantic identities are not invented.

## Exact residue

The authoritative offsets are computed from the bank's COFF relocation slots and retail bytes in build/r377550_finish/bank_offsets.json and bank_offsets.log. The 27 offsets are +0x01F, +0x020, +0x021, +0x022, +0x023, +0x024, +0x025, +0x027, +0x028, +0x029, +0x02A, +0x02D, +0x040, +0x043, +0x046, +0x053, +0x05A, +0x05C, +0x064, +0x078, +0x07A, +0x083, +0x089, +0x093, +0x12B, +0x12F, and +0x158.

The first eleven concern register saves around receiver materialization and the pending-byte test. The receiver save and data/Object loads differ at +0x2D, +0x40, and +0x43. The outer-index sites are +0x46, +0x53, +0x78, and +0x7A. The player/team sites are +0x5A, +0x5C, +0x64, +0x83, +0x89, and +0x93. Receiver restoration and final use differ at +0x12B, +0x12F, and +0x158. Between +0xB9 and +0x12A, both builds use ESI for the inner count and EBX for the inner index. This is therefore not one whole-function register renaming. bank_probe.log preserves the full comparison, and bank_offsets.log associates each byte with its instruction.

## Rejected hypotheses and limitations

history.log contains the full earlier verdict rows. Previously reported local-order, variable-name, ordinary loop, EH, /Ob, getter, compare-visibility, and flag sweeps were not repeated. The two pure register experiments were outer-index/count reuse and a redundant null guard inside the already proven non-null branch. Both retain the bank. The guard's two-trial search is retained in redundant_guard_search.log and build/shape_search/5cff33d102ca41ff97edb6c98d709e97/result.json.

New value-lifetime experiments split the string and scalar, used an implicit two-field record, used the pair's two-reference constructor, made the key const, formed an elided pair temporary, and used a one-element local array. The changed forms worsen frame, copy order, or call layout. Native bitset storage and a free conditional-update layer retain the residue.

The actual matched StringBase copy, release, and factory lookup bodies were copied with inline/noinline definitions and independently reproduce at 121, 134, and 284 bytes modulo relocations. Both individual and combined caller contexts retain the residue. combined_copy_probe.log, combined_release_probe.log, and combined_factory_probe.log verify the helpers again in the combined TU.

The saved activation and unpack bodies were read and independently probed. Activation is not exact: the saved body wrongly guards its final active-byte store, and correcting that still lacks the nullable receiver adjustment. The corrected experiment is 359 bytes against 367. The unpack bank reproduces its separate four-byte register residue at 1104 bytes. A reconstructed builder context is 181 bytes with 40 differences. Their caller-context tests remain exploratory because these helpers are not independently exact. No helper recovery or pin is landed.

Actual ILT symbols with decoded member-call contracts were tested for lookup, comparison, Object calls, and owner calls. The combined candidate resolves all calls through existing symbols and retains the residue. The canonical Object header, Team pointer, and setTeam slot preserve this result.

The final direct API oracle checks use body RVAs without the CLI's image-base ambiguity. oracle_routes.log confirms the CastleBehavior constructor, StringBase compare, and Object::setTeam names. It contradicts inherited non-const getNthPlayer and notifyModelConditionChanged spellings, and the BfmeThingFactory surrogate spelling. The address-derived target name is not a claim to EA's original decoration; its raw oracle rejection does not establish a wrong owner. A finite check of the four getNthPlayer receiver/result constness combinations confirms only getNthPlayer(int) const returning Player *. lookup_const_oracle.log preserves the results. The corresponding source trial still measures 392 bytes with 27 differences in const_lookup_decl_probe.log. Existing bank names and shared pins remain unchanged. The other inherited spellings remain identity limitations rather than newly verified names. A green pin-consistency check does not override these oracle results.

Inline depth 1 changes the early receiver allocation but suppresses vector::begin and AsciiString forwarding calls, yielding a worse 416-byte body. Depths 2 through 4 retain the bank. Direct begin access at depth 1 restores the original residue, including under implicit-record and selectively forced-forwarder experiments. The private header copy is scratch evidence and is not proposed as a shared-header change.

## Verification and retained work

The existing dump passes scoped byte, string-reference, constant-reference, DIR32, and body checks in build/r377550_finish/dump_scoped_gate.log. The candidate's normal REL32-resolving comparison fails with exactly 27 bound-byte differences and no unresolved calls in scoped_candidate_gate.log and canonical_candidate_gate.log. These are the target's own failures. A full gate is not required for evidence-only changes and was not run. Final CSV and pin checks are retained in check_csv_final.log and pin_consistency_final.log.

The original bank remains targets/game/reverse/attempts/0x00377550.cpp. The canonical declaration candidate is build/r377550_finish/canonical_routes.cpp. Every trial and raw output remains in the task's build directory. The clock-derived elapsed time is recorded in this run's single verdict row. No Git write or synchronization is performed.
