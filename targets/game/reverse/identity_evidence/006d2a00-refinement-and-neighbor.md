# RVA 0x006D2A00: refinement loop and remaining neighbor schedule

The saved reconstruction now compiles to the independently decoded 1,984-byte extent with 13 differing bytes outside relocation operands. It remains a partial recovery. The earlier bank emitted 1,985 bytes with 169 non-relocation differences. The new body uses an ascending refinement counter and a single target-member reload after each refinement scan. Its direct calls resolve, its two float constants verify, and its nine DIR32 references verify. The sole remaining byte mismatch is the upper-neighbor load schedule.

The tested base revision is d567d6e61a2188aac9d62a2cb8771c22d07cb374. The model is gpt-6.1-sol, also reported by BFME_MODEL. No function ledger, pin, shared header, policy or tooling file is changed. Trials and unedited tool output are retained under build/heightmap-006d2a00/. The preferred submitted source before banking is build/heightmap-006d2a00/22-owned-globals.cpp.

## Boundary, calls and declarations

Complete retail decodes are in build/heightmap-006d2a00/decoded-retail.log. The target returns with ret 8 at +0x28 and +0x7BD. Every decoded jump destination is an instruction boundary inside the extent, and the following sixteen bytes are INT3. There is no exception frame, tail jump or outgoing conditional branch. The weak inventory start at 0x006D2F60 lies inside this complete body and is not a second recovery.

The target's checked inventory is build/heightmap-006d2a00/checked-target.log. Complete decoded and checked helper extents are 0x006C8E50 (197 bytes), 0x007287E0 (21 bytes), 0x0072EA60 (43 bytes), 0x00728D30 (874 bytes), 0x009202C0 (33 bytes) and the vtable installer at 0x006D1C80 (131 bytes). Their checked logs are checked-base-update.log, checked-state-reset.log, checked-neighbor-set.log, checked-terrain-update.log, checked-position.log and checked-constructor.log in the same task directory. All their return paths and internal jumps were inspected. The existing terrain helper's ambiguous inner release-function ledger identity is not changed or used as type evidence here.

The two base calls pass the camera first and the light iterator second, with the primary receiver unchanged in ECX. The base helper ends in ret 8 and forwards those two stack pointers in the same order. The terrain helper takes one camera pointer and ends in ret 4 on all three return paths. RenderObjClass::Get_Position takes hidden Vector3 return storage, writes X, Y and Z, returns that storage in EAX and ends in ret 4. Its indirect call is Validate_Transform at vtable byte offset 0x50, with an unchanged receiver and no explicit arguments. The canonical rendobj.h declaration is virtual void Validate_Transform(void) const, and Get_Position returns Vector3 by value. No concrete dynamic target for that virtual call is asserted.

The complete state-reset helper writes dword 1 at receiver +0x80, writes byte zero through its sole output pointer, returns dword 1 and ends in ret 4. This target writes its returned dword and output byte to state-array offsets +0 and +4 with an eight-byte stride. The last three bytes of that view remain padding of unknown meaning. Neither the adjacent allocation size nor its existing short-array source declaration establishes a native payload type. This is an address-derived ABI view, not an STL or pair identity claim.

The complete neighbor setter copies its first four stack dwords to receiver offsets +0x98, +0xA0, +0xA8 and +0xB0 and ends in ret 20. It never reads its fifth argument or the four-byte gaps between those stores. The caller supplies left, bottom, right, top and a normalized low-byte changed flag in that order. The bank's Bool view preserves the observed final stack slot without claiming that the existing five-int decoration independently proves its type. A typed member-pointer call through the decoded j_00031de0 thunk resolves this call without adding a pin. The old apply declaration is retained but is no longer called.

The tile stride is 0xC4. The complete terrain update helper witnesses the integer status at +0, texture multiplier at +0x34 and float distance at +0x54. The target uses the state pointer at +0x30D4, tile pointer at +0x30D8 and signed counts at +0x30DC, +0x30E0 and +0x30E4. Its camera position occupies +0x3108 through +0x3110. These are translation-unit views because the Zero Hour layouts differ. No ownership or constructor cleanup is inferred for untouched padding, and this target constructs no owning object or container.

## Owner evidence and preserved names

The constructor at 0x006D1C80 installs primary vtable VA 0x0111DC88. Its slot 135 contains VA 0x004155DC, whose complete five-byte thunk jumps to this target. That routing establishes the virtual slot, but the installer's existing HeightMapRenderObjClass name does not establish the owner. The direct caller search returns no named direct caller.

The actual algorithmic twin is GeneralsMD/Code/GameEngineDevice/Source/W3DDevice/GameClient/FlatHeightMap.cpp, not its HeightMap.cpp. Its updateCenter walks W3DTerrainBackground tiles, counts culled tiles and texture multipliers, forwards the same base arguments and updates the terrain state. The corresponding FlatHeightMap.h declares the same virtual signature. At the body's actual ILT, FlatHeightMapRenderObjClass::updateCenter is oracle-CONFIRMED; all six access and virtual decorations of HeightMapRenderObjClass::updateCenter are CONTRADICTED. The existing HeightMap constructor decoration is also CONTRADICTED. Raw results are flat-name-oracle.log and name-decorations.log in the task directory. This evidence supports the FlatHeightMap owner, and would be refuted by an independently decoded caller or vtable contract identifying another owner, or a corrected thunk window contradicting that candidate.

The bank uses HeightMapRenderObjClass006D2A00 as an address-derived view, preserving the bank's descriptive word and method name as the worker instructions permit. It does not assert that this is the true class identity. No neighboring landed identity or human-owned correction file is edited. preserved-name-check.log records an empty name_regression.regressions result, placeholder classification and no ilt_guard rejection. The direct oracle still reports the address-suffixed name's hash contradiction; placeholder classification, rather than a real-name identity claim, is why the guard permits it. The checkout's name_regression CLI accepts two Git revisions, so the brief's two-file CLI form fails; the retained validation script calls the repository's actual file-comparison function without changing the tool.

The two old global tokens are retained as view macros referring to the already-recorded Rva012F08A0 bool and Rva012ED5C8 void-pointer symbols. No image address is emitted as a numeric literal and no new pin or DIR32 row is added.

## Located residue and successful lever

The original suffix differs structurally at +0x65D because the target member is cached in EBP, at +0x679 because the pass counter spills, at +0x73A because a target reload is omitted, and at the loop footer because the bank counts down. Alignment and subsequent branch displacements account for the remaining suffix differences. Retail clears EBP, increments it after each pass and compares it with 20. A plain ascending counter alone did not release the cached target. A single volatile read view of +0x30FC after each scan, copied to an ordinary local for both comparisons, releases that register and restores the complete suffix. This qualifier enforces the witnessed reload; it is not evidence that the native member was declared volatile.

The final wrong offsets are +0x31C through +0x327 inclusive and +0x329. They contain no relocation operands. Retail loads the lower value into EBX, then the upper value into EBP, tests the lower changed byte, and stores the lower and upper values to stack slots +0x10 and +0x54. The reconstruction tests the changed byte first, stores the lower value early, then reuses EBX for the upper load and store. The outgoing jump and every subsequent instruction agree. The exact bytes, compiler command, object hash and source hash are in build/heightmap-006d2a00/final-exact-residue.log. Raw instruction comparisons are in owned-globals-probe.log.

## Rejected experiments

The table below is derived from the raw probe output retained beside every unchanged trial source. These are diagnostic comparisons, not acceptance receipts.

| Trial | Compiled bytes | Non-relocation differences | Raw probe log in build/heightmap-006d2a00/ |
|---|---:|---:|---|
| Ascending local pass counter | 1986 | 172 | ascending-probe.log |
| Reuse the existing i counter | 1986 | 209 | reuse-i-probe.log |
| Volatile target member | 1988 | 119 | volatile-target-probe.log |
| One volatile target snapshot per pass | 1984 | 13 | target-snapshot-probe.log |
| Bool state flag and reset output | 1984 | 13 | bool-state-probe.log |
| Test j + 1 against the height | 2016 | 1183 | next-index-guard-probe.log |
| Local target reload view | 1984 | 13 | local-target-reload-probe.log |
| Const references to three state records | 1984 | 13 | state-references-probe.log |
| Visible complete neighbor setter | 1984 | 13 | visible-neighbor-helper-probe.log |
| Explicit all-clear changed guard | 2032 | 1155 | negated-flag-guard-probe.log |
| Native flags with G7 scheduling | 2005 | 1807 | native-flags-g7-probe.log |
| Upper value assignment before lower | 1984 | 15 | upper-load-first-probe.log |
| Aggregate snapshot of the two values | 2000 | 1124 | paired-value-snapshot-probe.log |
| Genuine primary base inheritance | 1984 | 13 | native-inheritance-probe.log |
| Native isCulled and getTexMultiplier accessors | 1984 | 13 | native-tile-getters-probe.log |
| Register storage hint on the upper local | 1984 | 13 | register-upper-hint-probe.log |
| Folding apply adapter to the existing ILT | 1984 | 17 | bound-neighbor-adapter-probe.log |
| Typed ILT binding directly at the call site | 1984 | 13 | direct-bound-neighbor-probe.log |
| Visible complete state-reset helper | 1984 | 13 | visible-state-helper-probe.log |
| Inline value-input pair assignment | 1984 | 13 | inline-pair-assignment-probe.log |
| Address-derived owner view | 1984 | 13 | addressed-owner-probe.log |
| Owned global symbol bindings | 1984 | 13 | owned-globals-probe.log |
| Native flags without G7 | 1984 | 13 | native-flags-control-probe.log |

The copied state-reset helper independently matched its complete 21-byte extent in visible-state-helper-body-probe.log. The apply adapter added four x87 operand differences before the isolated neighbor residue; direct call-site binding removed those four. The register, store, copy and loop family generators found no applicable finite choices in the retained source. Previously recorded volatile reads, frame arrays, buffer wrappers, simple value getters and neighbor-local declaration permutations were not repeated as unchanged standalone trials. Direct allocation spelling trials stopped at the prescribed limit after state references and the register hint failed to change the residue.

## Checks and reopening condition

The strict scoped check in owned-globals-scoped-gate.log fails byte equality for this body. Every REL32 resolves. Constant-ref verification and DIR32 ownership pass separately. final-pin-consistency.log and final-class-gate.log pass. The unmatched-source check correctly refuses the scratch candidate because it has no matched row; it is not being submitted as a landed source. Initial CSV integrity passes in initial-check-csv.log. After banking, final-check-csv.log passes and banked-probe.log reproduces the same 13 differences. banked-scoped-gate.log fails bytes while its constant and DIR32 checks pass, and banked-class-gate.log passes. A full gate is not required for a bank, evidence note and attempt record with no header or shim change.

Exactly one partial verdict was appended through re_log.py. The preferred body is targets/game/reverse/attempts/0x006d2a00.cpp with measured score 0.9934. Its immutable archive is targets/game/reverse/attempt_history/0x006d2a00/c4c9ed18a7d02737e69daeffe9b725d770c96cf196098ad54dda6074e92f2e07.json. The earlier modern-path bank is retained byte for byte in d32ddd2e8ec799ede2389b1c73b1b553a518d2f4c25c5e5706e6647dd6810128.json in the same directory, and the original pre-migration archive is unchanged. record-verdict.log and record-verdict.receipt.json retain the recording output and measured elapsed time. Existing attempt-log bytes are unchanged before the new row, and the preferred bank equals its measured immutable archive. The source's two LF metadata lines and remaining CRLF lines preserve the bank's existing line-ending convention.

Reopening needs a new, independently supported source-lifetime, inline-helper or scheduling hypothesis that reproduces the two simultaneous neighbor loads while preserving the already-matching prefix and suffix. The remaining bytes are fully located, but this run does not prove that assembly is required or that every possible C++ spelling is exhausted. No exact recovery or newly recovered helper bytes are claimed.
