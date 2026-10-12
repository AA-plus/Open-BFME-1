# 0x008C7500 Apt string-equality handler -- MASM landing with a measured codegen blocker

Target: RVA 0x008C7500..0x008C7EF0, 752 bytes, name `?Rva008C7500@@YAXXZ`
(address-derived; the re_attempts log's `?_FunctionRva008C7500@AptActionInterpreter
@@SAXPAV1@PAULocalContextT@1@@Z` is a hypothesis from the banked draft, not
evidence, so the row keeps the placeholder). Source:
`game/masm_dumps/Rva008C7500AptStringCompare.asm`, derived from the gen-dump
row `?d_008c7500@@YAXXZ` in `game/gen_asm/d_0083fdf0.asm` lines 153-236 (that
block stays in place, as with the other masm_dumps conversions).

## Body and ABI (first-hand)

- SEH frame `push -1; push g_Va01059DD0`; `sub esp,0xC`, saves ebx/ebp;
  epilogue `add esp,0x18; ret` at +0x2EF, and +0x2F0 is the next body's SEH
  prologue, matching the int3-carved 752-byte extent in the ledger row.
- The interpreter arrives as the first stack argument (`mov ebp,[esp+0x24]`):
  `m_stackTop` at +0, `m_stackCapacity` at +4, `m_stack` at +8. The body pops
  `m_stack[top-1]` and `m_stack[top-2]` (AptValue pointers).
- Gate `AptGetSwfVersion()` (0x00892370) `== 7`; undefined-bit counts
  (`flags >> 15` on each operand) feed a `switch (count)`: case 1 stores the
  fallback DB at 0x00892ED0's table area and case 2 a pooled boolean true.
- Inlined boolean factory (twice): pop the free-list head
  `?Rva008D2A30Head` (next at +8), pool push-back through `?g_bfme1211`
  (count at +4, items at +8), else `?Rva008C5D70Alloc(12)`, stamp
  `flags = (flags & 0xf0008005) | 0x40008005`, vtables `??_7AptValue@@6B@`
  (0x01135D68) then `??_7Rva008995E0Value@@6B@` (0x011360A8), value byte at
  +8; the final store uses `?bfmeTheCBC@@3HA` (0x013379BC) as the fallback
  pointer.
- Under `result == 0`: two 8-byte Apt strings default construct from the
  shared empty block `?Rva012D5298Empty@@3URva00893410Block@@A` (refcount word
  at +0, inc/dec via `?Rva00892ED0ReleaseTable` when it hits zero), filled by
  the two virtual `getName` calls (0x008985C0), then the inlined string
  equality: length word at data+2, pointer compare, `repe cmpsb` over the
  bodies.
- Tail: pop `m_stackTop -= 2`, then for each of the two operands release
  through virtual slot 4 when `flags >> 30 & 1`, else nothing.

## Why this lands as a MASM dump (measured)

- The reconstructible C++ body (`targets/game/reverse/attempts/0x008c7500.cpp`)
  compiles with `tools/probe.py` to exactly 752 bytes with 23 relocations and
  shape 1.000; its whole residue is eight non-relocation bytes at
  +0x181..+0x19C -- a pure register rotation in the four loads of the inlined
  equality: retail loads top-data into EAX, under-data into EDX, lengths into
  ECX and ESI; the bank loads EDX, ESI, ECX, EAX. Every later byte in the
  752 is identical.
- Waves measured in `targets/game/reverse/re_attempts.log`: 32 finite
  shape-family variants (line 37149); 30 operator== spellings plus call-site
  and identity-inline rotation grids (~170 combinations via shape_search) and
  a 90-variant flag sweep with best /O2 (line 38105); 26 throw()/EH and
  shape-family trials (line 40328); reversing the string locals worsens to 12
  bytes (line 42048); reversing the equality operands worsens to 10 bytes
  (line 50803); explicit data-pointer locals keep 8, right-length-first gives
  10, narrow ushort locals 760B/319 diffs, split equality guards 760B/304
  diffs (line 54611).
- Fresh today on 2026-10-13 (this session, `build/v8c7500/`): swapping the two
  getName calls worsens to 12 bytes; getName returning the output pointer, an
  int return, a reference parameter, reference aliases before the compare, an
  explicit `operator==` call, data-pointer locals inside operator==, and a
  free `operator==` all leave the identical 8 bytes at +0x181..+0x19C.
  Eight register-selection bytes at one site after 300+ measured formulations
  is the same class of wall as 0x0048FC90, 0x006A6080 and 0x002A5500.
- The bank also carries raw vtable literals (0x01135D68, 0x011360A8) that
  add_match's link-debt guard refuses; the dump references the canonical
  `dir32_addresses.csv` names instead.

## Relocations in the dump

26 sites, in order: +0x003 dd g_Va01059DD0; +0x03A call AptGetSwfVersion;
+0x080 dd Rva008D2A30Head; +0x08D dd Rva008D2A30Head; +0x093 dd g_bfme1211;
+0x0C7 dd Rva008C5D70Alloc; +0x0E3 dd ??_7AptValue@@6B@; +0x0EC dd
g_bfme1211; +0x105 dd ??_7Rva008995E0Value@@6B@; +0x11B dd
??_7Rva008995E0Value@@6B@; +0x12F dd bfmeTheCBC; +0x141 +0x146 +0x160 dd
Rva012D5298Empty; +0x170 and +0x17C call getName; +0x1B2 dd Rva008D2A30Head;
+0x1C4 dd g_bfme1211; +0x1CA dd Rva008D2A30Head; +0x1F5 dd Rva008C5D70Alloc;
+0x211 dd ??_7AptValue@@6B@; +0x21A dd g_bfme1211; +0x233 dd
??_7Rva008995E0Value@@6B@; +0x246 dd ??_7Rva008995E0Value@@6B@; +0x267 dd
Rva00892ED0ReleaseTable; +0x289 dd Rva00892ED0ReleaseTable. The dump body is
byte-identical to retail outside these 26 sites; verified by masking 5 bytes
per call and 4 bytes per dd (0 mismatching bytes over the 752).
