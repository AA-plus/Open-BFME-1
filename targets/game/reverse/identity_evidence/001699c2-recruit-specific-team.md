# AISkirmishPlayer recruitment recovery

## Result and collection requirement

The complete C++ body is `AISkirmishPlayer::recruitSpecificAITeam(TeamPrototype *, float, const Coord3D *)` at RVA `0x001699C0`, ending at exclusive RVA `0x00169E2A`. Its measured bank is `targets/game/reverse/attempts/0x001699c0.cpp`; the selected trial is preserved under `build/recruit1699/v14-protected-queue.cpp`. The scoped gate passes at this corrected extent, including relocation resolution, string references, DIR32 references and the body guard. The four exception unwind actions also agree with retail. The assigned ledger row at `0x001699C2` has the wrong start, extent, owner and argument list. No ledger change is claimed by this note.

The tested repository revision is `43f1fd0ff339626b1d6148fd225055c08b5689d7`. The model is `gpt-6.1-sol`. All trial sources, generator results, complete disassemblies and unedited subprocess outputs remain under `build/`. This note concerns this assigned body only.

## Retry hypothesis and refutation

The earlier bank already identified the skirmish override and three arguments, but its implementation ignored the third argument, described the unit records from an interior cursor, used private string declarations and rebuilt queue insertion without the native list helpers. The new hypothesis was that current canonical string declarations and the landed `AIPlayerBuildSpecificAITeam.cpp` layout supplied the missing compiler-visible types and inline helpers. It would be refuted by complete callers proving another argument order, the actual loop reading a different record layout, or probes retaining the same first divergence after those changes. The measured candidates improved and the final candidate matches.

The Zero Hour twin was read directly in `inputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/GameEngine/Source/GameLogic/AI/AISkirmishPlayer.cpp`, beginning at its `recruitSpecificAITeam` definition. Its owning declaration is in `Include/GameLogic/AISkirmishPlayer.h`, its base declaration and list macros are in `Include/GameLogic/AIPlayer.h`, and the unit record declaration is in `Include/Common/Team.h`. The base AIPlayer method is a separate twin and is not the identity of this body.

## Boundary, identity and argument evidence

`build/recruit1699/boundary-context.txt` includes the preceding and following INT3 padding. The first instruction is the two-byte `push -1` at `0x001699C0`. The old row omits it and spans into adjacent code. The complete body has returns at offsets `+0xC0` and `+0x467`; both are `ret 0xC`. All decoded conditional and direct jump destinations stay inside this body and land on instruction boundaries. Its null-prototype branch reaches the common epilogue at `+0x457`. `build/recruit1699/retail-complete.txt` and `control-flow-audit.txt` retain those checks.

The matched AISkirmishPlayer constructor at `0x00168660` installs vtable VA `0x01096FB0`. Slot 10 at byte offset `0x28` points to ILT RVA `0x0003499B`, whose complete five-byte body jumps to `0x001699C0`. `build/recruit1699/00168660-dis.txt` and `0003499b-dis.txt` are the decoded constructor and thunk. The vtable slot, constructor identity, complete caller and exact Zero Hour twin establish the override independently of the old ledger name.

The matched `Player::recruitSpecificTeam` at `0x000C9790` loads its AI receiver from `Player+0x220` and tail-jumps through vtable offset `0x28` without changing the three stack arguments. Its null-AI path also pops 12 bytes. The complete `ScriptActions::doRecruitTeam` caller at `0x002F37E0` pushes a coordinate pointer, the radius dword and the prototype pointer in that order before calling the Player wrapper. Its alternative path pushes a null coordinate pointer. Both complete caller decodes and checked-callee outputs are preserved under their RVA filenames.

The callee reads the first slot as the prototype pointer, compares the second slot as an x87 float, and loads the third slot at `+0x1E0`. The branch at `+0x1E6` passes that third argument to the recruiter when nonnull, otherwise it passes `prototype+0x188`. There is no hidden return storage or receiver adjustment for this override. The return type is void. These observations reject both the old two-argument AIPlayer declaration and the earlier description of the third slot as unused.

## Accessed types and BFME differences

The prototype name references are at offsets `0x10` and `0x14`, and the singleton bit is at `0x18`. The existing bank's accessor names are retained. BFME factory calls pass both name references, whereas the Zero Hour twin passes one. The actual factory bodies at `0x000F7F40` and `0x000F7AB0` consume two reference arguments, return a pointer in EAX, and pop eight bytes on every return path.

The loop starts from `prototype+0x130`, reads a maximum count at record offset four and a narrow string at record offset eight, and advances by 12 bytes. Its entry count is at `prototype+0x184`, home coordinate at `0x188` and home-valid byte at `0x194`. This agrees with seven native `{minUnits, maxUnits, AsciiString}` records in the landed `AIPlayerBuildSpecificAITeam.cpp` and the donor declaration. This method does not read `minUnits`; that name is retained from those declarations, not inferred from allocation size. No new STL value or container identity is claimed.

The complete narrow-string copy constructor at `0x00887B60` reads only the source's buffer pointer, writes that pointer to the destination and increments the buffer's reference count. Its only return pops four bytes and returns the receiver in EAX. The complete C-string constructor at `0x00888BC0` initializes the same destination pointer, scans one-byte characters, and takes one pointer argument. The string setter at `0x00887C90` handles self-assignment, releases the old buffer, installs the source pointer and increments its reference count. Its lock-release tail jump and its ordinary return both preserve the one-argument ABI. The target's inlined string reads use a word length at buffer offset four and character data at offset eight. These decoded operations support the canonical `AsciiString` and `StringBase<char>` declarations despite misleading ledger aliases at those RVAs. The source includes `ascii_string.h` rather than redeclaring either type.

Recruitment calls ILT `0x0001A2B2`, which reaches the complete body at `0x000F2A00`. That body consumes a template pointer, a coordinate pointer and a float radius, returns an Object pointer in EAX and pops 12 bytes on both returns. It squares the radius and supplies the coordinate argument to `0x000F10F0`. The complete latter helper reads the coordinate's x and y fields, computes squared planar distance, and writes its candidate pointer and float distance output arguments. Its four returns pop 20 bytes and return an AL boolean. Their complete decoded bodies and checked-callee inventories are retained. The recruiter remains addressed through the bank's existing `j_0001a2b2` wrapper; the unrelated real-name `Team::tryToRecruit` claim elsewhere is not used as an identity proof and no new pin is introduced.

The target transfers an Object through its virtual slot `0x50`. Object vtable VA `0x0109EE58` routes that slot through ILT `0x0002B74C` to the independently matched `Object::setTeam` at `0x001C6F10`. That complete body consumes one Team pointer and pops four bytes. The target reads the Object AI pointer at `0x204` and Team pointer at `0x23C`. Before the move call it adjusts the AI receiver by `0x20`, passes the home coordinate and pushes command source 2. The complete `AICommandInterface::aiMoveToPosition` body at `0x000D86C0` consumes two arguments, copies all three coordinate dwords and pops eight bytes on both return paths. The source uses canonical `Coord3D.h` and `command_source_type.h`. The supplied recruitment position changes recruitment selection; the later movement still uses home.

The inlined queue constructor allocates 48 bytes and writes the complete accessed layout: vptr at zero; link pointers at four, eight, twelve and sixteen; work orders at twenty; priority byte at twenty-four; Team pointer at twenty-eight; next queue pointer at thirty-two; frame at thirty-six; three flags at forty, forty-one and forty-two; and reinforcement ID at forty-four. The padding byte at forty-three is not initialized. Allocation size alone was not used to infer these fields. Its vptr relocation resolves to the existing full TeamInQueue vtable at VA `0x01096940`. The ready-list head is at AI offset eight. Retail checks head equality and both links before inserting, reloads the head through the pointer-to-head helper, and guards the old-head backlink write. The native helper structure reproduces this instruction order.

The independently landed protected TeamInQueue destructor at `0x00160ED0` and its scalar-deleting wrapper at `0x00161260` confirm the work-order pointer at `0x14`, Team ownership at `0x1C`, a scalar delete flag and a single-pointer receiver. The candidate declares this destructor protected. Its class declarations are views of the accessed fields and slots; they do not claim complete class sizes or complete virtual interfaces. The constructor references the existing retail vtable. Its scalar `operator new` call at `0x00881F30` takes one unsigned allocation size using cdecl and returns an EAX pointer.

The Team factory's complete constructor callee at `0x000F7790` installs Team vtable VA `0x01085F88` and stores its prototype argument at receiver offset four. This independently verifies the target's Team prototype reads. That vtable's slot zero routes through ILT `0x00004C6E` to the complete scalar-deleting wrapper at `0x000F7280`. The wrapper takes one flags argument, calls the complete Team destructor at `0x000F4250`, conditionally calls scalar operator delete when bit zero is set, returns the receiver pointer and pops four bytes. The target pushes flag one and makes precisely that virtual call. `team-vtable.txt` and the three complete Team body disassemblies and checked-callee inventories preserve this evidence. These unmodified Team methods contain existing STL storage; this recovery does not infer or claim their container value types.

BFME uses plain scalar allocation instead of the donor's memory-pool allocation and reuses the live outer `teamName` string through `StringBase<char>::set` for the final success or failure message. The donor shadows it with new strings. The typed `GameLogic::getFrame` view reads `GameLogic+0x3C`; retaining that native accessor rather than a raw cast supplies the final scheduling and common-tail shape.

## Exception cleanup and verification limits

The target's frame size is `0x20`. Its handler at `0x00C05900` selects four unwind states with predecessor states `-1, -1, -1, 2`. Their complete cleanup bodies at `0x00C058E0`, `0x00C058E8`, `0x00C058F0` and `0x00C058F8` adjust ECX by `+8`, `-0x24`, `-0x2C` and `-0x28`, respectively, then tail-jump through ILT `0x0000D828` to the AsciiString destructor at `0x0005EE90` and the release-buffer body at `0x00887940`. The new object has the same predecessor graph, cleanup instructions and destructor relocation targets. `build/recruit1699/eh-compare-v14.txt` records the byte and relocation comparisons. The queued TeamInQueue constructor itself has no throwing member construction; its allocation occurs while the outer string remains protected.

`build/recruit1699/control-flow-audit.txt` and `control-flow-supplemental.txt` record every return, outgoing tail jump and indirect call in all complete bodies used here as ABI evidence. Checked-callee inventories were run for the target, those extents and each direct-call ILT thunk. The string setter's external tail jump is the lock-release import. The target's two indirect calls are the independently identified Object transfer and Team scalar deletion. Internal indirect calls inside unmodified helpers are recorded and are not assigned new identities by this conversion.

`build/recruit1699/scoped-gate-v14.txt` records a repository verifier invocation with the corrected row supplied in memory. It changes no ledger and is not a certificate that the old row has landed. `class-gate-v14.txt` passes. `pin-check.txt` passes. `name-regression-api.txt` records no descriptive-name regressions; the current command-line tool expects Git revisions, so its actual text-comparison API was used on the bank and candidate. `declared-unmatched.txt` reports ZERO matched functions for the unlanded scratch source because no ledger row names it. No shared header or tooling changed, and no full gate was required or run.

## Measured compiler experiments

The table below is generated from the retained raw probe files. Differences are non-relocation byte differences, not a similarity judgment. Each result is one probe of that source. Exact candidates were also checked through the scoped verifier and unwind comparison. EH generator trials and their sources remain under `build/shape_search/7851541b1033434897f0e480628cb2fb`; its selected `/EHsc` spelling improved the starting candidate before the plateau stop. Non-EH generator trials under `build/shape_search/c303388004e9442089c0d234db0ef9a6` did not improve the then-current candidate. The two unchanged queue spelling experiments were rejected; no further unchanged register experiment was made.

| Source | Bytes | Differences | Change |
| --- | ---: | ---: | --- |
| `saved-original.cpp` | 1141 | 745 | Unchanged saved bank |
| `v1.cpp` | 1121 | 637 | Canonical strings and corrected BFME operations |
| `v2-ehsc.cpp` | 1107 | 567 | EH generator selected /EHsc |
| `v3-accessor.cpp` | 1107 | 548 | Native string accessors |
| `v4-queue.cpp` | 1126 | 561 | Complete ready-list guard |
| `v5-position.cpp` | 1134 | 581 | Separate position branches |
| `v6-units.cpp` | 1129 | 149 | Native unit record and indexed loop |
| `v7-calls.cpp` | 1129 | 149 | Existing thunk wrappers retained |
| `v8-native-queue.cpp` | 1115 | 90 | Native intrusive-list helpers |
| `v9-member-queue.cpp` | 1115 | 90 | Rejected unchanged queue spelling |
| `v10-base-queue.cpp` | 1115 | 90 | Rejected unchanged base view |
| `v11-membership-only.cpp` | 1129 | 149 | Rejected partial list helper |
| `v12-frame-accessor.cpp` | 1130 | 0 | Typed frame accessor |
| `v13-canonical.cpp` | 1130 | 0 | Canonical coordinate and command declarations |
| `v14-protected-queue.cpp` | 1130 | 0 | Canonical protected queue destructor |

The matching raw file for each source is its `.probe.txt` sibling. The initial PowerShell capture of the saved bank is also retained as `saved-probe.txt`; its repeated subprocess capture is `saved-original.probe.txt`. The saved bank and all trial sources are retained without overwriting earlier candidates.

## Landing refusal

`build/recruit1699/add-match.txt` records the normal `add_match.py` identity and boundary correction attempt. It refused replacement because its current changed-start rule requires the old matched range to be wholly contained in the corrected body. The old range is `[0x001699C2, 0x0016A038)`, while the proven complete body is `[0x001699C0, 0x00169E2A)`. The old row therefore cannot satisfy that rule. No alternative ledger edit or tool change was attempted.

The exact body is banked at its proven start as `targets/game/reverse/attempts/0x001699c0.cpp`, with one partial verdict that explicitly references the assigned `0x001699C2` row. Partial describes the unlanded recovery, not a remaining byte mismatch. Reopening requires an authorized ledger procedure for a start correction that also removes overclaimed adjacent bytes. Further compiler-shape iteration has no remaining mismatch to address. The earlier `0x001699c2.cpp` bank is preserved unchanged.

## Bank verification and retained state

The actual bank was probed again and passed the corrected-extent scoped gate, all unwind comparisons and the class gate. Raw outputs are `build/recruit1699/banked.probe.txt`, `scoped-gate-bank.txt`, `eh-compare-bank.txt` and `class-gate-bank.txt`. `check-csv-final.txt` passes. `declared-unmatched-bank.txt` reports ZERO matched rows because the bank is unlanded; no source whitelist was changed. `final-integrity.txt` verifies that functions.csv, symbols.csv and dir32_addresses.csv are byte-for-byte unchanged, the old bank is unchanged, the new archive exactly reproduces the bank and the attempt log has exactly one appended CRLF verdict. The temporary unlanded game source was removed only after that correspondence check. No Git write was performed. The measured timing and source hash are in `bank-receipt.json` and `handoff-receipt.json` under the same build evidence folder.

The additional `git diff --check` reports trailing whitespace on the new verdict's CRLF ending. `build/recruit1699/crlf-check.txt` verifies that there is no trailing space or tab before that CR byte. The repository's sole writer `re_log.py` produces CRLF and the log's `.gitattributes` exception retains it. The raw warning is in `git-diff-check.txt`; the verdict's line ending was preserved.
