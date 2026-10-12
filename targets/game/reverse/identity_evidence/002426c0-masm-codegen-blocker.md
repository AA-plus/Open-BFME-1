# 0x002426C0 member-upgrades run body -- MASM landing with a measured codegen blocker

Target: RVA 0x002426C0..0x002426FE, 610 bytes, name `?Rva002426C0@@YAXXZ`
(address-derived placeholder). Identity is not provable: `tools/callers_of.py
0x002426C0` reports no named caller reaching the body directly; the reachable
routes are themselves unnamed -- the matched gen thunk `?j_00043bd5@@YAXXZ`
at RVA 0x00043BD5 (`gen-thunk;gap;target=0x002426C0`) and the ILT window slot
54672 -> 0x002426C0 in `ilt_windows.tsv` -- and no string or relocation names
it, so the name stays address-derived. The gen-dump row `?d_002426c0@@YAXXZ` in
`game/gen_asm/d_0023c310.asm` is the source of the body.
Source: `game/masm_dumps/Rva002426C0MemberUpgradesRun.asm`.

## Body and ABI (first-hand)

- Extent proof: `ret 8` at +0x25F, INT3 padding to +0x262; the dump carries
  exactly the 610 retail bytes. ABI from decode: __thiscall member -- ECX is
  the owning upgrades object whose member list lives at this-0xAC -- with two
  stack arguments (const 192-bit bitset reference at [esp+0x38] and const
  AsciiString *name at [esp+0x3C]), SEH frame `push -1; push g_Va0100DE28`.
- The body scans the 192-bit mask, resolves each set bit through TheUpgradeCenter
  (0x012EF188) via ILT 0x00027174 into a stack vector (growth through ILT
  0x00004F8E), walks the member list at this-0xAC calling the sibling predicate
  at 0x00242630 through ILT 0x00019579, applies the affected/give pair through
  ILT 0x000077B6 / 0x0001A97E, repeats the walk for the set<unsigned> at
  this+0x30 resolving ids through the singleton at 0x012F0898's inlined
  hash_map find, and destroys the vector through ??3 / _M_deallocate.
- Retail HIGHLOW sites in the body: 0x2426C3 -> g_Va0100DE28, 0x242720 ->
  0x012EF188 (?TheUpgradeCenter@@3PAVBfmeThingND@@A in dir32_addresses.csv),
  0x242818 -> 0x012F0898 (?Clock00200420@@3PAUFrame00200420@@A in
  symbols.csv); all call targets match landed rows/pins.

## Why this lands as a MASM dump (measured)

- The reconstructible C++ body (`targets/game/reverse/attempts/0x002426c0.cpp`,
  banked earlier at score 0.9950819672131147) compiles to exactly 610 bytes
  with 18 relocations and shape 1.000; its whole residue is three
  non-relocation bytes at +0x121, +0x125, +0x129 -- the loop back-edge
  reloads `this` into EAX and the list iterator into ECX in retail:

  0117 8b 4c 24 14       mov ecx,[esp+0x14]
  011b 8b 11             mov edx,[ecx]
  011d 89 54 24 14       mov [esp+0x14],edx
  0121 8b 44 24 10       mov eax,[esp+0x10]      <-- retail; ours: mov ecx,[esp+0x10]
  0125 8b 4c 24 14       mov ecx,[esp+0x14]      <-- retail; ours: mov eax,[esp+0x14]
  0129 3b 88 54 ff ff ff cmp ecx,[eax-0xac]      <-- retail; ours: cmp eax,[ecx-0xac]

  while VC7.1 emits the mirror (this->ECX, iterator->EAX) with the cmp
  operands following.
- The same expression compiles to retail's pairing in the loop-entry check at
  +0xB1 of the same function, so the difference is allocator state, not
  spelling: ~45 source variants measured on 2026-10-12 all land on the
  identical three bytes -- while/for(;;)/for(cond)/do-while topologies, direct
  member spelling, _M_node compares, base-class casts, pointer/arrow accessor
  forms, inlined helper evaluation-order swaps, by-value and by-reference
  helpers, comma and parenthesized forms, iterator operator++/operator!=
  calls, const accessor views, a dummy-prefixed TU context, and /Ob1 and
  allocator flag sweeps (40 experiments in the reuse cache;
  `tools/alloc_residue.py` confirms eax->ecx stackload +0121, ecx->eax
  stackload +0125, loop=1).
- The dump body is byte-identical to retail outside its relocation slots
  (`tools/probe.py game/masm_dumps/Rva002426C0MemberUpgradesRun.asm
  '?Rva002426C0@@YAXXZ' 0x002426C0 --size 610` prints `result EXACT (modulo
  relocation slots)`; the 14-vs-18 relocation-count delta is only the SEH
  `__except_list` sites that the gen dump encodes as raw zeros, exactly as in
  the landed 0x006A6080 and 0x0048FC90 dumps).

Reopen as C++ only with a reconstruction compiled byte-identical, or a
detected caller resolving the ABI.
