# AIGroup::groupScatter phase storage

C3, gpt-6.1-sol, 2026-10-11. Bank improvement only; no production claim.

Retail starts at 0x00155490. RET 4 occupies offsets 0x20A..0x20C, followed
by INT3, giving 525 bytes. The generated ledger row's 509-byte extent ends
inside the epilogue. The matched GameLogic scatter dispatcher through ILT
0x00038EE2 and the EA AIGroup twin supply the identity. The ILT oracle confirms
the native decorated name.

The preferred bank freshly emits 525 bytes with 41 masked differences and
19 aligned relocation sites. Its frame is 0x2C rather than retail's 0x24.
An explicit union reusing the unused minimum-bounds output for the later
destination coordinate emits 525 bytes with 34 differences, starting at
0xC1, and the correct 0x24-byte frame. The destination is fully assigned
before use. The matched getMinMaxAndCenter implementation writes eight-byte
Coord2D bounds and a twelve-byte Coord3D center and retains none of their
addresses. Bounds output is never read by this caller.

Over the complete 525-byte body, the masked byte score improves from
484/525 (0.9219) to 491/525 (0.9352). re_log's mandatory measurement uses the
existing 509-byte ledger extent, adding a size penalty: it preserves the
improved bank at measured score 0.8703. This score is reported without an
override. The existing ledger extent was not changed.

Max/destination sharing gives 36 differences. Moving its declaration leaves
36; moving min outside its block gives 48. Combining both storage unions,
either separately or inside one frame object, gives 70 differences and a
0x28-byte frame. Explicit trivial lifetime ends do not change those results.
The remaining complete-body residue is coordinate stack placement and the
second loop's load/store allocation.

Raw output: build/c3_00155490/{bank,min_dest_union,phase_union,frame_union,
separate_unions,phase_end,separate_end,frame_end}.log; complete disassembly
is retail.log. The unchanged native AIGroup.cpp links 1,288 -> 1,288 bytes.
No game source, header, ledger, pin or generated file was edited.
