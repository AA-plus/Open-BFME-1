# Audio volume table donor audit

The tested revision is 7c702c14c2868de794acffa2568b9fd6a60b6615. The Open BFME 2 donor is `Code/GameEngineDevice/Source/MilesAudioDevice/MilesAudioManager.cpp`, `MilesAudioManager::GlobalVolumeData::rva0005910F`, at game.dat RVA `0x0005910F`. Its owner name remains a donor hypothesis. The BFME 1 source keeps the existing `Rva006AE150Entry::adjust(Rva006AE150Argument *)` caller view.

## Exact candidate and landing blocker

The donor with its `/O1` flags emits 146 bytes with 118 non-relocation differences. Changing to `/O2` emits the complete 153-byte retail body exactly. `/O2` without `/G7` also matches. The candidate-only scoped gate verifies bytes, all three REL32 targets, string references, constants and recorded DIR32 references. It does not certify identity. The source is saved at `targets/game/reverse/attempts/0x006acd70.cpp` with measured score 1.0. No production ledger row or pin was changed.

The required ILT name oracle contradicts the existing `adjust` spelling. All twelve combinations of public, protected or private access, receiver constness and parameter class or struct key are contradicted. The instructions require preserving the exact bank and recording a blocker in this case. Reopening needs an operator resolution of the existing declaration and ILT name conflict. The machine ABI itself is independently decoded.

Raw source trials, checked-callee inventories, complete disassemblies, the candidate gate and all oracle results are under `build/writer12-donor/audio/`. The oracle results are in `ilt-name-variants.log`; the strict candidate gate is `scoped-candidate-gate.log`.

## Boundary, calls and return

The complete target ends with `ret 4` at `+0x96`, followed by INT3 at `+0x99`. Every conditional destination remains within 153 bytes. There are no outgoing tail jumps or exception handlers. ECX is the receiver, the only stack argument is a pointer, and the result is a single-precision table element returned through ST(0).

The complete matched `Rva006AE150Owner::compute` caller at `0x006AE150` pushes its argument pointer at `+0xAC`, computes the entry receiver with a `0x1C4` stride, and calls ILT `0x0001D39F` at `+0xB4`. That thunk jumps directly to `0x006ACD70`. The caller multiplies the ST(0) result into its local float. This proves the existing pointer argument, receiver and float-return ABI independently of the donor.

ILT `0x0000F380` reaches the positional predicate at `0x000B28F0`. Its complete code is 41 bytes; the remaining bytes in its 68-byte ledger extent are switch padding and six table entries. The predicate reads the event-info pointer at event `+8`, info byte `+0x38`, owner type at event `+0x30` and owner ID at `+0x2C`. Its two return paths produce AL booleans without stack arguments. The target tests AL and compares info dword `+0x84` with three.

ILT `0x0002B2BA` reaches the 101-byte code portion of `Rva000AF8C0CachedMode::getMode`. The remaining 23 ledger bytes are padding and its five-entry switch table. All return paths return a cached integer in EAX, without stack cleanup. The body reads or writes info `+0x88`, reads info flags at `+0x38` and kind at `+0x84`. The target's vector-empty test compares info pointers at `+0x8C` and `+0x90`. Their element type is not inferred or declared.

The info virtual call uses slot `+4`, takes no stack arguments and returns a borrowed key address in EAX. The independently identified AudioEventInfo constructor installs vtable `0x010818CC`. Slot one reaches ILT `0x0000D0F8`, then the complete four-byte body at `0x000AF870`, which returns `this + 8`. The name field at that address is passed directly to the AsciiString comparison machinery. No hidden return storage, receiver adjustment or temporary destruction occurs.

## Container value evidence

The target uses the tree at receiver `+0xA0`, tests its count at `+0xA4`, compares the find result with its header and never owns the key. The complete 194-byte helper at `0x0038C0E0`, reached through ILT `0x00003071`, walks node children at `+8` and `+0xC` and compares the key at node `+0x10`. It reads string-buffer lengths as halfwords at buffer `+4`, characters at `+8`, and calls the complete 92-byte StringBase comparison at `0x0005FEB0` for its final comparison. Both return paths use `ret 4` and return a node or header in EAX.

Value identity is supported by actual construction, not node allocation size. The neighbouring matched `insertFill` at `0x006ACE30` passes this same `+0xA0` tree to ILT `0x0001BC02`, which reaches `insert_unique` at `0x000C0430`. Its complete 310-byte body reaches `_M_insert` at `0x000BFCC0` through ILT `0x00032B87`. Both `_M_insert` arms construct node `+0x10` through ILT `0x00007554`, whose complete 66-byte target at `0x000620B0` calls the string copy constructor at `0x00887B60`.

The complete 121-byte string copy constructor reads exactly one source dword, writes exactly one destination dword, and increments the pointed-to buffer's reference count when nonnull. Its other accesses are the established singleton initialization and critical-section calls. It reads or writes no second value field. `_M_insert` performs no additional payload copies after this constructor; its remaining stores are node links and the tree count. This agrees with the corrected set<AsciiString> identity and the STLport 4.6 `_M_create_node`, `_M_insert` and `_M_find` implementations. The prior unsigned-short pair pin is not used as type evidence.

The target has no constructor unwind behavior. The value-construction wrapper's exception map has one state, zero, whose unwind predecessor is minus one. Its complete 17-byte cleanup at `0x00BF27A0` passes the placement destination and source to ILT `0x0002AAA9`. That thunk reaches the complete one-byte return at `0x000607F0`, followed by INT3. This placement-delete cleanup owns no completed value and destroys no second field. The complete helper and all call targets used as type or ABI evidence have retained checked-callee output. Truncated screening decodes remain in the raw folder and are superseded by the complete extents stated here.
