# insertGame ping image load order, RVA 0062DB90

The isolated bank now reproduces all 1,487 retail bytes modulo its 92
relocations. This is banked evidence, not a production conversion.

Retail ends with RET at +5CE and INT3 at +5CF. The call in the native
RefreshGameListBox body at 0062E3DF names insertGame directly, with the room
pointer in ECX, two stack arguments, and ADD ESP,8 at 0062E3EE. The helper
therefore uses a compiler-private convention supplied by a visible static
same-TU body. A public three-stack-argument cdecl declaration is insufficient.
The ILT oracle reports UNTESTABLE because this is a static non-thunk target.
Password, Observer, and ladder text anchors also agree with EA LobbyUtils.

The preferred bank emitted 1,487 bytes with four non-relocation differences:
its height read into EBX at +541 preceded its width read into EDI at +544;
retail orders width then height. The following source order resolves the
scheduling blocker without emitting an instruction for the intrinsic:

```cpp
const Image *image = pingImages[0];
width = image->getImageWidth();
_ReadWriteBarrier();
height = image->getImageHeight();
```

The local pointer is necessary. Without it the barrier makes VC7.1 reload
pingImages[0], emitting 1,493 bytes with 99 differences. A read-barrier trial
emits an out-of-line call and is discarded. Pointer-only, reference-only,
factored size reader, and out-of-class inline accessor definitions preserve
the original four differences. This is an instruction scheduling lever;
rotation_sweep reaches scratch register rotations, not these two independent
callee-saved loads. Existing operand/declaration permutations were reviewed.

The bank retains its previous synthetic keep_insertGame caller strictly as
an isolated compiler experiment. It must never be copied to game/. The real
418-byte RefreshGameListBox bank remains exact modulo 23 relocations, but its
original helper differs, so the two banks are not yet a verified same-TU pair.

Header adoption remains a concrete integration blocker: substituting the
canonical WWLib ascii_string.h and unicode_string.h in the isolated helper
emits 1,449 bytes, 795 differences, 94 relocations, and changed string temporary
lifetimes. The bank declares its own inline-forwarding string wrappers;
production requires native header ownership, and this fleet lane excludes
string-family edits. No header, production source, pin, or ledger was changed.
The current LobbyUtils.cpp census check remains LINKED 0 -> 0 (1,592 authored
bytes), with unresolved populateBuddyGames, a duplicate caller and existing
string/STL COMDAT debt. No LINKED gain is claimed.

The EH metadata independently has seven string cleanup states at FuncInfo
00E2FF8C, cleanup funclets C40450..C40480, routed to the exported narrow/wide
destructors. Scratch probes are under build/a2_0062db90/.
