# 0x006B66A0 split-BFME audio-event dispatch -- MASM landing with a measured codegen blocker

Target: RVA 0x006B66A0..0x006B688F, 495 bytes, name
`?rva006B66A0@Rva006B66A0AudioOwner@@QAE_NPAVRva006B66A0AudioHolder@@HH@Z`
(address-derived). Source: `game/masm_dumps/Rva006B66A0AudioEventDispatch.asm`,
converted from the gen-dump scaffold row `?d_006b66a0@@YAXXZ` in
`game/gen_small/dumps_000.cpp` (notes: gen-dump;ghidra=FUN_00ab66a0).

## Identity (not provable)

The 0x006B9500 Miles request path reaches this body through its owner recorder,
and the retail callers prove the __thiscall member ABI (ECX owner, holder
pointer + two ints, `ret 0x10`) and the split BFME record layout, but no string
or detected caller names the record, so the name stays address-derived.

## Body and ABI (first-hand)

SEH frame `push -1; push g_Va01049118`. It copies the source event into the
record, refcounts the shared holder through the imported Interlocked twins,
advances the slow elapsed-scale float (`?g_bfmeElapsedScale` + `?g_Va0112E8B0`),
routes `soundType() == 2` to the file-handle allocator
(`_STL::__new_alloc::allocate`) and stamps the record flags.

## Why this lands as a MASM dump (measured)

The reconstructible C++ body (`targets/game/reverse/attempts/0x006b66a0.cpp`)
compiles to exactly 495 bytes with 25 relocations and shape 1.000 (probe:
`EXACT (modulo relocation slots)`); its whole residue is one dead-register
reuse choice at +0x106 +0x109 for the store
`record->m_event.m_pointer->m_flag47 = 0;`:

- retail: `8b 6d 00` (mov ebp,[ebp]) / `c6 45 47 00` (mov byte [ebp+47],0)
- ours: `8b 4d 00` (mov ecx,[ebp]) / `c6 41 47 00` (mov byte [ecx+47],0)

EBP (= `&record->m_event` loaded from [ebp]) is dead after the store in both;
VC7.1 picks the other dead register. ~60 spellings measured
2026-09-24..2026-10-13 (expression and accessor variants, get(), [0], casts,
reference and register locals, setEvent, statement swaps, /Ob2, no-Ob1, /EHsc,
/Gs, and the /Oa /Ow /Ob2 /Os /Ot flag sweep) all land on exactly these two
bytes or worse; fresh 2026-10-13 variants score 2 (volatile store, identical),
360 (char-pointer local) and 373 (pointer-plus-offset local) diffs.
Blocker class: allocator dead-register reuse tie-break (EBP vs ECX), not
source-spellable.

The dump body is byte-identical to retail outside its relocation slots
(`tools/probe.py` prints `result   EXACT (modulo relocation slots)`); the
21-vs-25 relocation-count delta is only the four SEH `__except_list` sites that
the gen dump encodes as raw zeros, exactly as in the landed 0x0048FC90 and
0x006A6080 dumps. The 21 dump relocations are the 13 calls (all `?j_*` thunks
and `_STL::__new_alloc::allocate`, resolved through
`targets/game/reverse/symbols.csv`) and 8 DIR32 data sites (ehhandler push as
`g_Va01049118`, `?g_bfmeElapsedScale` x4, `?g_Va0112E8B0`,
`__imp__InterlockedIncrement@4`, `__imp__InterlockedDecrement@4`); all scoped
checks pass (`verify_dir32_addresses` / `verify_string_refs` /
`verify_constant_refs` / `body_guard.verify`).

## Reopen condition

Only with a C++ reconstruction that compiles byte-identical, or a detected
caller/string resolving the record name and ABI.
