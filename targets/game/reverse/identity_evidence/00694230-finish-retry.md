# Loader finish retry at RVA 0x00694230

## Result and retained candidates

The retry is based on revision `13617ada5219e1dcc58774bb8ba9abc8f28fdf47` and uses model `gpt-6.1-sol`. There is no exact source recovery. The existing bank at `targets/game/reverse/attempts/0x00694230.cpp` reproduces its recorded 654-byte extent and 101 masked differences. Its first difference is at `+0x19`. The original bank remains unchanged because no tested candidate improves that measurement. The trial with corrected native STL helper definitions is retained at `build/audio-00694230-r7/trial30.cpp`; it has the same main-body measurement and substantially better helper evidence. These are working-tree experiments, not a new matched revision.

The running receipt is `build/verdict.txt`. Every trial source, unedited probe output, object, emitted body, relocation inventory and mismatch-offset list is retained in `build/audio-00694230-r7/`. The probe log for a source `trialNN.cpp` is `trialNN-probe.log` in that directory. The original bank's first reproduction is also retained as `build/audio-00694230-r7/probe00.log`. No assembly was added to a candidate, no shared header was changed, and no pin was added.

## Hypotheses and refutation

The initial hypothesis was that native guard lifetime, callee visibility or record access structure could correct the bank's EBX/EBP exchange without changing its independently decoded operations. It would be refuted by agreement on the complete ABI and continued identical residue after the corresponding native source forms were compiled. The guard delegate experiment changes those registers but also changes the ordinary cleanup and epilogues, so it is worse overall. The other native forms preserve the residue. This does not prove that every possible C++ spelling is exhausted or that assembly is necessary.

A later hypothesis came from reading the actual landed tree donor rather than its ledger description. The bank omits both that donor's `less<AsciiString>` specialization and `_BFME_RETAIL_TREE_INSERT_LAYOUT` definition, and its `private` to `public` macro changes the nested inserter's mangling. Correcting these details should reproduce the actual helpers; a failed strict helper comparison would refute that hypothesis. Trial30 reproduces all four relevant STL helpers strictly, but leaves the loader unchanged. This is a useful dependency correction for reopening, not new loader progress.

## Boundary, calling convention and identity

The complete target decodes from RVA `0x00694230` to `0x006944BE`. Its three returns are at `0x00694371`, `0x00694424` and `0x006944BB`, each with `ret 4`. The following bytes are INT3 padding. Every direct branch destination is an instruction start inside the body, and there is no outgoing tail jump. The complete 315-byte caller at `0x00694570` ends with its return at `0x006946AA` and INT3 padding. Its call at `0x0069466D` reaches the target through ILT `0x0000FDCB`, after pushing the selected record from ESI and placing the owner in ECX. It does not consume a result. These observations agree with the bank's one-pointer thiscall declaration.

The receiver accesses are the container at `+0x2C`, accounting total at `+0x38`, limit at `+0x3C`, stop byte at `+0x44` and mutex handle at `+0x48`. The accounting comparison is unsigned. The record begins with the narrow string storage and is also passed as receiver to the flag reset and setter. The setter's complete 102-byte body copies nine dwords into record `+0x08`, stores the buffer argument at `+0x2C`, size at `+0x30` and the low compression byte at `+0x40`, and returns with `ret 16`. Its reset helper writes only record `+0x41` and `+0x42` and has a plain return.

The EA ledger associates the target with `AudioFileCache::readAudioFile` and `GameEngineDevice/Source/MilesAudioDevice/MilesAudioCache.cpp`. The Zero Hour `AudioFileCache::openFile` body was read in `GeneralsMD/Code/GameEngineDevice/Source/MilesAudioDevice/MilesAudioManager.cpp`. It supports the WAV flow and diagnostics, but its cache and locking flow differ. The existing `Gen0002857EOwner`, `Gen0002857E` and method vocabulary is retained. This retry does not assert a corrected retail class identity.

Complete decoded bodies are in `build/audio-00694230-r7/decoded.log`. The checked target inventory is `build/audio-00694230-r7/checked-target.log`, and each reviewed helper or caller has its own `checked-XXXXXXXX.log` in that directory. Return paths, following padding and indirect branch destinations are retained in `build/audio-00694230-r7/boundary-audit.log`.

## Container payload and native helper definitions

The actual tree inserter is reached through ILT `0x0001BC02` at RVA `0x000C0430`. Its two insertion routes reach the complete 183-byte `_M_insert` at `0x000BFCC0` through ILT `0x00032B87`. Both allocation paths call ILT `0x00007554`, which resolves to the complete 66-byte construction helper at `0x000620B0`. That helper calls the complete 121-byte string copy constructor at `0x00887B60`. The copy constructor reads only the source pointer at offset zero, writes only the destination pointer at offset zero, and increments the pointed-to buffer's reference count when non-null. Its critical-section paths were decoded too. Neither complete constructor copies a second value field. The complete comparator at `0x0005FEB0` and the tree walk read a halfword length at buffer `+0x04` and character bytes at `+0x08`.

This chain establishes a single narrow string value independently of the node allocation size, donor's template name or the misleading `ModelConditionInfo` ledger name on the construction helper. The construction unwind map has one state whose cleanup passes the placement-new destination and allocation argument to a one-byte return through ILT `0x0002AAA9` at RVA `0x000607F0`. Its raw map is retained in `build/audio-00694230-r7/eh-construction.log`.

The second failure path reaches the 40-byte set wrapper through ILT `0x00030EA9` at RVA `0x00453DB0`. It uses hidden result storage, returns an iterator pointer at result offset zero and one boolean at offset four, and uses `ret 8`. It forwards the unchanged receiver to the tree inserter. That decoded receiver behavior justifies trial30's offset-zero tree view without exposing private STL declarations.

The original bank's locally emitted tree inserter is only 170 bytes instead of retail's 310 bytes. Its locally emitted `_M_insert` is 185 bytes instead of 183, and the former calls the latter under a public mangling that has no canonical binding. The bank's set wrapper and construction helper do match their retail extents. Trial30 uses the landed donor's comparator specialization and layout define, removes the access macro, and retains an offset-zero tree view for the direct insertion. Its tree inserter, set wrapper, `_M_insert` and construction helper all pass strict byte and relocation comparison at their retail extents. No duplicate strong definition was introduced: these remain template or inline definitions.

The full emitted helper instructions and strict results are retained in `build/audio-00694230-r7/stl-helpers.log`. This local helper mismatch is an additional collection issue in the original bank, even though its main-body probe is close. Matching a caller's masked call operand did not certify the emitted helper.

## Exception cleanup and ownership

The target has one unwind state, state zero to minus one. Its action at `0x00C472B0` adjusts ECX to `[ebp-0x38]` and jumps through ILT `0x0001E961` to the complete 25-byte helper at `0x006915E0`. That helper reads the handle at object offset zero and the ownership byte at offset four, calls the ReleaseMutex import only when owned, clears the byte, and returns. The target unwind map has no string or buffer deallocator.

The bank's generated action has the same adjustment and predecessor, but relocates to `??1Rva006915E0@@QAE@XZ`. The ledger binds the retail helper under `?release@Rva006915E0@@QAEXXZ`. Both local bodies reproduce the helper's 25 bytes and ReleaseMutex import, but byte equality alone does not establish a second retail identity. This cleanup symbol binding remains unresolved for collection. No alias pin was introduced. The raw target map is `build/audio-00694230-r7/eh-target.log`, and object maps and cleanup-body comparisons are in `build/audio-00694230-r7/object-eh.log`.

The decompression branch deletes the original buffer, substitutes the output pointer and recomputes WAV information. The unsupported-format path releases the mutex before reporting and deletes the buffer afterward. The missing-file path releases before reporting. The success path transfers the decoded buffer metadata through the setter before releasing the guard. A timeout repeats the wait loop without setting ownership. The stop path leaves the buffer alone, as retail does.

## Indirect and imported ABI checks

The File size slot is `+0x2C`, and read-entire-and-close is `+0x34`. The MemoryReadFile, LocalFile, RAMFile and Win32LocalFile tables were read directly; their relevant methods were completely decoded. They take no explicit arguments and return the size or buffer in EAX. The signed size declaration agrees with the canonical File header and the complete base size method. The FileSystem opener takes filename and access dwords, returns the File pointer in EAX, and uses `ret 8`. Access is `0x41` here.

Debug's table at VA `0x01133058` supplies slots `+0x60`, `+0x6C`, `+0x38` and `+0x4C` at RVAs `0x008896E0`, `0x0088BA10`, `0x0088C020` and `0x0088BB60`. Report start returns AL with no explicit argument. Stream opening takes a pointer and a line dword, returns its receiver in EAX and uses `ret 8`. String insertion returns its receiver and uses `ret 4`. Finish reads a full argument dword, compares it with 2, returns AL on its ordinary path and uses `ret 4`. The canonical bool-mode spelling would convert the target's argument 2 to 1, so the bank's opaque int-mode view follows the decoded ABI.

Finish has 1188 bytes of code followed by a 28-byte jump table. Every table destination and both SEH destinations were checked against the complete code's instruction starts. The ordinary return and SEH filter return are distinct; the final handler path calls the imported `_exit`. The tables and destinations are in `build/audio-00694230-r7/boundary-audit.log`. Complete virtual-helper instructions are in `build/audio-00694230-r7/virtual-decoded.log`, and the table inventory is in `build/audio-00694230-r7/debug-vtable.log`.

The PE import inventory identifies WaitForSingleObject, ReleaseMutex, `_AIL_WAV_info@8` and `_AIL_decompress_ADPCM@12`. Decoded argument setup agrees with their stdcall cleanup widths. The ADPCM call receives the packet pointer and addresses of a pointer output and a dword size output. The setter independently establishes the packet's nine-dword width. Only the first packet dword is interpreted by this loader; the remaining fields remain opaque.

## Located residue and checks

Every masked mismatch offset is retained and associated with the containing retail and emitted instructions in `build/audio-00694230-r7/residue.log`; the authoritative offset list and relocations are in `build/audio-00694230-r7/trial00-diffs.json`. Before `+0x80`, loading the record into EBX instead of EBP changes save/load scheduling and makes its first indirect load one byte shorter. This shifts four early relocation sites and changes loop alignment padding. After `+0x80`, the fifteen differing operand bytes are at `+0x099`, `+0x0B3`, `+0x0B9`, `+0x106`, `+0x145`, `+0x14D`, `+0x177`, `+0x1A4`, `+0x1B5`, `+0x1BD`, `+0x1CA`, `+0x1F8`, `+0x1FE`, `+0x247` and `+0x270`. Each exchanges EBX and EBP for the record pointer or the wait, buffer and size values.

The baseline and trial30 scoped byte gates fail the main body. Raw output is retained in `build/audio-00694230-r7/trial00-scoped-gate.log` and `build/audio-00694230-r7/trial30-scoped-gate.log`. Their first FileSystem call-target complaint is a consequence of the shifted operand, not independent evidence against the actual decoded opener. The visible reset, setter and FileSystem copies pass strict comparison at their complete extents; those raw results are in `build/audio-00694230-r7/visible-helper-checks.log`.

The candidate passes the class gate, and direct source comparison with the name-regression tool reports no descriptive-name regressions. This revision's name-regression CLI expects Git revisions rather than the source paths shown in the worker brief; that failed invocation is retained, and the tool's `regressions` source-comparison API was used without Git writes. Raw results are `build/audio-00694230-r7/class-gate.log`, `build/audio-00694230-r7/name-regression.log` and `build/audio-00694230-r7/name-regression-api.log`. The final CSV check passes; its raw output is `build/audio-00694230-r7/check-csv-final.log`. Trial30's unchanged unwind state and destructor binding are retained in `build/audio-00694230-r7/object-eh-trial30.log`.

No full gate is required for this evidence-only result because no game source, ledger row, header or pin is changed. The original bank was not replaced at an equal score. Reopening should start from trial30's verified STL definitions and retain its correct type and route evidence. A new native lifetime or compiler-shape hypothesis must address the remaining initial register choice; repeating the native accessors, visible helpers, guard declarations, timeout parameter, detached wait loop or tested format branches is unsupported. Cleanup symbol binding must also be resolved independently before any exact collection claim.

## Experiment measurements

Each numbered source has one recorded probe in this table (n=1). The original bank was also reproduced separately before the numbered runner and through the scoped gate. Differences here count missing or extra candidate bytes as wrong; this makes shorter or longer trials comparable to the complete retail extent. Each strict helper comparison is also a single object comparison (n=1).

| Trial | Hypothesis | Emitted bytes | Differing or absent bytes |
|---|---|---:|---:|
| trial00 | Original bank reproduction | 654 | 101 |
| trial01 | In-class reference accessor | 654 | 101 |
| trial02 | Inline destructor with noinline release delegate | 630 | 275 |
| trial03 | Scalar declarations before file-open initializer | 654 | 101 |
| trial04 | Forced-inline destructor alone | 654 | 101 |
| trial06 | Boolean guard ownership field | 654 | 101 |
| trial07 | Neighboring /Ob1 inline flag | 654 | 101 |
| trial09 | Complete visible noinline reset helper | 654 | 101 |
| trial10 | Visible setter with missing MSS declarations | Compile failure | Not measured |
| trial11 | Complete visible noinline setter and native packet | 654 | 101 |
| trial12 | Nothrow native guard declarations | 654 | 101 |
| trial15 | Explicit timeout parameter on acquire | 654 | 101 |
| trial18 | Detached wait loop | 687 | 515 |
| trial19 | Nested successful-wait branch | 687 | 515 |
| trial20 | Guarded destructor delegate and explicit success release | 654 | 101 |
| trial22 | Nullable guard constructor | 654 | 101 |
| trial24 | Direct canonical base string accessor | 654 | 101 |
| trial26 | Complete visible noinline FileSystem opener | 654 | 101 |
| trial27 | WAV-format switch | 660 | 336 |
| trial28 | Early unsupported-format guard | 662 | 340 |
| trial29 | Negative-polarity nested format guards | 662 | 339 |
| trial30 | Native comparator, layout define and private STL declarations | 654 | 101 |
