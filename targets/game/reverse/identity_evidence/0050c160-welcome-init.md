# WOL welcome-menu initialization at RVA 0x0050C160

## Result and tested revision

The complete callback is recovered in `game/GameEngine/Source/GameClient/GUI/GUICallbacks/Menus/WOLWelcomeMenuInitTwin.cpp` as `?WOLWelcomeMenuInit@Rva0050C160Twin@@YAXPAVWindowLayout@@PAX@Z`. The scoped gate passes on the working tree based on revision `9e3be919b10ae956e3c8a13995e0d62f2be1d016`. The new address namespace follows the landed update twin and avoids a second strong definition of the plain callback already present in `WOLWelcomeMenu.cpp`. It does not claim another retail identity.

The final object SHA256 is `6ac94df02d57fa206fa23b9428a703b3197d391e8beb789d4d4a2a3b5fa02b10`. Raw final gate output is in build/welcome-init/scoped-gate-final-python.log. The initial `build.cmd` invocation could not find an installed Python through its launcher; build/welcome-init/scoped-gate-final.log retains that output. Running the same build implementation through `python tools/build.py` succeeds.

## Retry hypothesis and measured experiments

There was no saved body. All four explicit earlier records were blocked. Their direct source ports diverged in the prologue, with different string lifetimes and register allocation. The new evidence is the landed neighbouring `WOLWelcomeMenu.cpp`, `WOLWelcomeMenuUpdateTwin.cpp` and `UpdateNumPlayersOnline.cpp`. They supply retail string destructor inlines, include paths, compiler flags and virtual-call declarations. The hypothesis was that those declarations and lifetimes would eliminate the earlier frame mismatch before trying register spellings. An unchanged early prologue divergence would refute that hypothesis.

The first complete body uses the neighbour declarations and inlines both narrow and wide string destruction. It agrees through the prologue and most of the menu initialization. The first differing byte is the stack displacement at +0x5CC in the instruction starting at +0x5C9. Retail later proceeds directly from the MyInfo control to the firewall helper, while the Zero Hour donor also initializes ButtonLadder. The complete decoded target has no ButtonLadder lookup. Removing the donor's two extra ladder statements was the next hypothesis; a remaining size or instruction mismatch would refute it.

| Preserved trial | Emitted size | Masked differing bytes | Raw measurement |
| --- | ---: | ---: | --- |
| build/welcome-init/01-native.cpp | 1970 | 164 | build/welcome-init/probe-01-native.log |
| build/welcome-init/02-no-ladder.cpp | 1867 | 0 | build/welcome-init/probe-02-no-ladder.log |
| Final namespaced source | 1867 | 0 | build/welcome-init/probe-source.log |

The required EH generator was run before changing the body manually. Eight finite alternatives, including exception-mode and declaration changes, retained the first trial's instruction result and did not improve it. Sources and unedited outputs are build/welcome-init/eh-00.cpp through eh-07.cpp and their corresponding .log files. The choices and search receipt are build/welcome-init/eh-choices.json and build/welcome-init/search-eh.log. No unchanged register or x87 experiment was used. The stack displacement was a consequence of the extra native lifetime, so it did not require an artificial frame adjustment.

The donor is the actual Zero Hour `GeneralsMD/Code/GameEngine/Source/GameClient/GUI/GUICallbacks/Menus/WOLWelcomeMenu.cpp`, read directly. All original comments within its initialization body, including commented-out statements, remain verbatim and in their original order. The script and raw assertions are build/welcome-init/verify_notes.py and build/welcome-init/semantic-checks-final.log.

## Extent, identity and callback ABI

The target decodes as 471 instructions covering the full ledger extent. Its sole return is the plain `ret` at RVA 0x0050C8AA. Every direct conditional branch stays inside the body, and there is no outgoing tail jump. The next eight bytes are INT3 padding. These checks supplement the ledger boundary and the complete decode in build/welcome-init/retail.asm. The prescribed checked-callee inventory is build/welcome-init/checked-target.log.

Retail's layout-init registration entry at RVA 0x00EA9A5C contains `{0, 0x01086B28, 0x00425A1D}`. The middle word points to the literal `WOLWelcomeMenuInit`; the final word points to ILT RVA 0x00025A1D, which jumps to the assigned body. The EA `FunctionLexicon.cpp` entry is independently the corresponding member of `winLayoutInitTable`. The exact entry, string and decoded thunk are asserted in build/welcome-init/semantic-checks-final.log and printed in build/welcome-init/callback-refs.log. The identity is therefore more than a donor-name inference.

The complete `WindowLayout::runInit` body at RVA 0x00470690 reads the callback at receiver +0x18. It pushes userData, then the layout receiver, makes the indirect call, and removes eight argument bytes. The target itself has no receiver adjustment or hidden return storage, reads the layout argument and returns without popping arguments. Its canonical declaration is `void __cdecl(WindowLayout *, void *)`. The unused userData argument remains in that declaration. No raw opcode hit was accepted as a caller.

## Virtual calls, argument widths and string ownership

Vtable routes and their complete bodies are retained in build/welcome-init/vtables.log and build/welcome-init/helpers/. Each helper has its full .asm decode and a separate -checked.log inventory. The audit receipts are build/welcome-init/helper-audit.log, build/welcome-init/helper-extra-audit.log and build/welcome-init/helper-cleanup-audit.log. build/welcome-init/helper-extents-final.log lists every return, stack-pop width and outgoing tail route across the decoded helpers; none has an outgoing conditional branch. External tail jumps are followed through their actual destinations rather than treated as complete functions merely because decoding stopped.

| Call used by this body | Independent decoded evidence |
| --- | --- |
| GameSpy group-room Boolean | Constructor RVA 0x00636D90 installs vtable VA 0x011188D0. Slot +0x14 reaches RVA 0x006370A0, which reads exactly one byte at receiver +0x68 into AL and returns without stack arguments. |
| GameSpy local name | The same vtable's slot +0x88 reaches RVA 0x00637450. It copies the string at receiver +0x7C into caller-provided return storage through RVA 0x00887B60, returns that storage pointer in EAX and executes `ret 4`. |
| Text lookup | GameTextManager vtable VA 0x010F39F0, slot +0x28, reaches RVA 0x00437F60. Its three stack words are hidden UnicodeString return storage, a narrow label pointer and an optional Boolean pointer. It writes the existence result as a byte and returns the output pointer in EAX with `ret 12`. |
| Layout visibility | WindowLayout vtable VA 0x010F7514, slot +0x10, reaches RVA 0x00497A00. It reads a Boolean byte from a four-byte argument slot and both return paths pop four bytes. |
| Window lookup and focus | Window-manager vtable VA 0x01126ED0 has lookup at +0xDC and focus at +0xB0, reaching RVA 0x0047C970 and RVA 0x0047CA80. Lookup returns a window pointer and pops its two argument words; focus pops its one window-pointer argument. All return paths were decoded. |
| Firewall detection and deletion | The factory at RVA 0x0066EBC0 returns an object pointer or null and tail-calls the complete constructor at RVA 0x0066E3B0. The constructor installs vtable VA 0x0111A388. Detection at RVA 0x0066FCC0 returns its Boolean in AL. Vtable slot zero reaches the scalar deleting destructor at RVA 0x0066FBB0, which tests flag bit one, destroys members, conditionally calls operator delete and executes `ret 4`. The target supplies flag one. |

The narrow and wide copy helpers at RVA 0x00887B60 and RVA 0x00888400 were decoded completely. Each reads one buffer-pointer word from the source, writes the same word to the destination and updates that buffer's reference count. The narrow C-string constructor at RVA 0x00888BC0 measures byte characters. Its associated release helper at RVA 0x00887940 decrements ownership and clears the pointer; the wide release helper is RVA 0x008881D0. These actual helpers distinguish AsciiString from UnicodeString and prove the four-byte by-value object width.

`UnicodeString::format` at RVA 0x00889190 is a variadic member implemented with a stack receiver and caller cleanup. It consumes a by-value UnicodeString format argument, forwards its wide character buffer and va_list to the complete RVA 0x00888930 body, and releases the owned format argument before a plain return. `GadgetStaticTextSetText` at RVA 0x004BD7A0 consumes a window pointer and a by-value UnicodeString, destroys its copied argument and returns with caller cleanup. The target's argument order and stack cleanup agree with those bodies and the existing declarations.

The remaining direct calls use the already landed canonical declarations. Their exact routes and complete extents are included in the helper audit: NameKeyGenerator::nameToKey, window enablement, the two online-statistics updates, UpdateLocalPlayerStats, the locale accessor, GameSpyOpenOverlay and transition setGroup. The locale accessor calls the complete UserPreferences::getInt body at RVA 0x000A9490, which returns either the 32-bit default or a 32-bit parsed integer and releases its string argument on both return paths. The global references are verified by the scoped DIR32 gate against existing recorded names. This recovery adds no pin, numeric image-address literal in executable source, shared declaration or shared header.

## Exception states and preference payload

The final object's EH map is compared directly with retail in build/welcome-init/eh-compare-final.log. The retained script build/welcome-init/eh_compare.py asserts each state's predecessor, cleanup instruction bytes, receiver displacement and resolved destructor route, including the nested string lifetime in state four.

| States | Predecessor | Cleanup receiver | Actual destructor route |
| --- | --- | --- | --- |
| 0, 1, 2 | -1 | EBP-0x30 | Narrow string destructor RVA 0x0005EE90, tail to releaseBuffer RVA 0x00887940 |
| 3 | -1 | EBP-0x30 | Wide string destructor RVA 0x0005EEA0, tail to releaseBuffer RVA 0x008881D0 |
| 4 | 3 | EBP-0x28 | Narrow string destructor |
| 5, 6, 7 | -1 | EBP+4 | Narrow string destructor in reused argument storage |
| 8 | -1 | EBP-0x2C | Narrow string destructor |
| 9 | -1 | EBP-0x20 | Preferences destructor RVA 0x000AAFC0, tail through ILT RVA 0x0003F25B to base destructor RVA 0x000AAF30 |

The preferences constructor at RVA 0x000AB910 writes the vptr at +0, tree head at +4, node count at +8 and filename buffer at +0x10. Its externally called destructor releases the wide filename at +0x10 and then the tree rooted at +4. The current reference header gives that filename an AsciiString spelling; this callback neither accesses the member nor emits its member cleanup. It uses the same 20-byte object footprint and the independently verified external constructor and destructor. The wide ownership route is retained as evidence rather than inferred from that header.

The actual load route is constructor to ASCII load wrapper RVA 0x000A9230, then the preferences virtual wide-load implementation at RVA 0x000ACD50. That complete implementation calls map operator[] at RVA 0x0007DF70 and assigns an AsciiString to the returned mapped slot. Following its insertion call reaches RVA 0x0007DBC0, then native node insertion at RVA 0x0007D900, placement construction at RVA 0x0007CD50 and the complete value copy at RVA 0x0007CCC0. The value copy reads and writes fields +0 and +4 through two actual narrow string copy calls at RVA 0x00887B60. It touches no third field. Thus the stored value is the two-string key/value pair, not one of the generated ledger names suggesting a larger scalar payload.

The matching ownership path is the tree destructor at RVA 0x00080340, recursive node erase at RVA 0x0007D250 and pair destructor at RVA 0x0007CB30. The last helper releases +4, then +0, through the same narrow release helper. This proves both element ownership and the eight-byte value independently of the node allocation size and existing `_STL` pins. The inspected STLport 4.6 templates in `stl/_map.h`, `stl/_tree.h` and `stl/_pair.h` implement the same default mapped value, placement copy and first/second field construction. The raw route records are build/welcome-init/value-construction-route.log and build/welcome-init/dependency-routes.log. Existing generated helper names were not renamed or used as independent type evidence.

The helper unwind maps are also retained in build/welcome-init/helper-eh.log. Preferences construction first protects the complete base object, then the temporary narrow filename; its nested state cleans the temporary before tail-calling the base destructor. Pair construction and pair destruction protect the first narrow string through the complete cleanup actions at RVA 0x00BF4350 and RVA 0x00BF4310. The tree's exceptional cleanup follows the complete base destructor at RVA 0x0007FE00, which frees the head node. The conditional preferences-base cleanup at RVA 0x00BF75F0 is decoded through both paths, including its tail route to tree destruction. All tail routes are decoded in build/welcome-init/cleanup-routes.log. No conditional branch is accepted as the end of that cleanup action.

## Landing checks and collection

build/welcome-init/add-match.log records successful replacement of the dump row. The final scoped gate passes the function bytes, source claim, string references, constant references, recorded global addresses and body guard. The final EH and semantic checks also pass. Declaration coverage, class ownership and pin consistency outputs are retained under build/welcome-init/. A full gate is not required because this change touches no shared header or shim.

`check_csv.py` has only the source-tracking error: the new source exists but is untracked. The checkout's read-only Git restriction prevents staging. The exact conversion remains in the working tree for the coordinator to stage and run through normal commit hooks. The corresponding raw output is build/welcome-init/check_csv-final.log. There is no remaining byte, extent, callback-identity or ABI blocker for this recovery. All trial sources, raw outputs and the completed source remain local for collection.
