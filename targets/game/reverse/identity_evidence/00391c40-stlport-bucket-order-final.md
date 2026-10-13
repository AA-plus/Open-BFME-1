# GameLogic::xfer STLport bucket-load-order residue (final bank)

RVA `0x00391C40`, 2323 bytes, `?xfer@GameLogic@@MAEXPAVXfer@@@Z`. Identity: Snapshot vtable `0x010EB560` slot 3 plus ILT `0x000464BB` prove GameLogic::xfer; retail `ret 4` at +0x910 then INT3 confirms the 2323-byte extent.

The compile-ready bank in `targets/game/reverse/attempts/0x00391c40.cpp` reproduces 2323/2323 bytes, 79 relocations, 10 non-relocation differences at +0x736..+0x740, normalized shape 0.999. Residue: the inlined STLport `_Ht_iterator::operator++`/`_M_bkt_num_key` slow path. Retail emits `mov ebp,[ebx+8]; mov eax,[ebx+4]; mov ecx,[esp+0x30]; sub ebp,eax` (bucket end, bucket begin, key load hoisted before the subtract). Ours emits `mov ecx,[ebx+4]; mov ebp,[ebx+8]; sub ebp,ecx; mov ecx,[esp+0x30]` (begin picked into ECX, key load sunk after the subtract). The two choices are coupled: whichever register gets the bucket begin also determines the key-load schedule.

New this session: `rotation_sweep.py --pairs --top 6 --jobs 10` over the restored body tested 620 call-argument copy/const-materialisation toggles (plus 101 non-compiling variants). Every toggle, including all 294+ second-order pair combinations, stayed at the base 10 differing bytes with size 2323/2323. Combined with the earlier 35 single toggles, 26 shape_search trials, and ~20 hand spellings (comma-decl, ctor-form, postincrement while-form, end-capture, assign-init, ptr-deref, const-map, named key, ternary, declaration swaps, direct table spelling) logged in re_attempts.log, no source-level lever reaches this allocator pick. Blocker: regalloc/STLport-bucket-order; the pick is compiler-internal for every expression shape tried.

Reopen only with a new STLport hashtable bucket-num spelling or a compiler-visible difference in the surrounding inlined operator++ structure; do not repeat the recorded accessor/declaration/per-element-type variants.

## Addendum 2026-10-13 (a2 wave-f)

One further narrow spelling, not among the recorded variants: bind the insertion slot before
the conditional store -

```
Rva00391C40Button *&slot=at020.index(name,j_00008170);
slot=0;
if(!value.isEmpty())slot=g_Rva00391C40Control->find(value);
```

Probe result: 2335/2323 bytes, 578 non-relocation diffs, first at +0x340, shape 0.962
(19 structural). The reference binding perturbs the EH-visible temporaries and the whole
insertion path, strictly worse than the bank. Confirms the earlier finding: the residue is
the coupled register pick (`begin->eax` + hoisted key load in retail vs `begin->ecx` + sunk
key load in ours) inside the inlined STLport bucket-num slow path, and no expression shape
tried (35 single toggles, 26 shape_search trials, ~20 hand spellings, 620 rotation pairs,
this slot-ref binding) reaches it. Bank unchanged at 0.9957; blocker
`regalloc/STLport-bucket-order`.
