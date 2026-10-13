# 0x008B2F50 ?lookup@PropertyLookup008B2F50 — this=EBX/object=EDI allocator tie (banked partial 2396B, score 0.9858)

Target: `?lookup@PropertyLookup008B2F50@@QAEPAURva00899560Value@@PAVNativeProperties008B3C40@@PAUString008B3C40@@@Z`
RVA 0x008B2F50, size 2396. Row: gen-dump, switch-carved (functions.csv). Ownership: vtable
0x011369F0 slot 10, installed by matched constructor 0x008B2EF0; caller is the matched derived
dispatcher 0x008B3C40.

## Boundary proof (unchanged, raw)

16 RET 8 paths, last `ret 8` at +0x918; NOP at +0x91B; 16 DWORD switch entries at
+0x91C..+0x95B; INT3 padding at +0x95C. Probe's end-of-function warning is only the
switch-table/INT3 cut, not a size error. All 18 unwind predecessor states and cleanup shapes
agree with the 2396-byte extent.

## Fresh reproduction (2026-10-13, this session)

`python3 tools/probe.py targets/game/reverse/attempts/0x008b2f50.cpp "<mangled>" 0x008B2F50`

- size ours=2396 retail=2396; relocs=133; 34 non-reloc differing bytes, first at +0x22
  (first differing byte +0x23).
- First difference: retail `mov ebx,ecx` vs ours `mov edi,ecx` at +0x22.
- `--shape` 0.956; the only structural deltas are the masked jump-table reloc and the same
  receiver-register swap at +0x22D/+0x7B5 (`mov eax,edi` vs `mov eax,ebx`).

The entire residue is one role assignment: retail keeps `this` in EBX and the constructed
object in EDI; ours keeps `this` in EDI and the object in EBX. Every other instruction has an
identical shape with EDI/EBX exchanged (witnesses +0xEA, +0xF7, +0xFB, +0x1D2, +0x22D, +0x7B5).

## Variants tried (all hold 34 diffs, or regress)

This session (build/w6c/): Y2 ternary return spelling -> 2380B/1341 diffs (bad);
Y3 hoisting `Rva008D5750Object *object` out of case 2 -> byte-identical 34 diffs.

Prior sessions (24 verdicts, 29 log rows): EH lever sweep plateaued after 13 trials; four
generated loop-header combinations identical; case-local receiver forms and broad respellings
regressed or retained; 150 source / 90 flag / 42 rotation / 21 callee-EH trials; separate
integer local, redundant conditional and comma expression all keep 34; reference receiver
worsens to 685; visible noinline constructor trial identical. The Open BFME 2 donor twin
`Code/Libraries/Source/Apt/AptObject/Rva006F1360XmlLookup.cpp` (game.dat 0x006F1600) ports
completely and still emits the same 34 differences.

## Verdict

blocker=regalloc/this-ebx-vs-edi. This is a register-allocation tie-break in MSVC 7.1 that
survives every source-level receiver spelling, callee-EH shape, constructor hierarchy and the
matched donor port. Bank preserved: `targets/game/reverse/attempts/0x008b2f50.cpp` (2396B,
0.9858). Reopen only with a new allocator model explaining the EBX/EDI role choice.
