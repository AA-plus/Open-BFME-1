# RVA 000D6100: native containers and numeric return contract

The accepted round47 bank measures 236/236 bytes, with zero masked differences
and five relocation sites. This is an exact caller candidate, not a promotion.
The retail RET4 begins at +0xE9 and ends at RVA000D61EC; INT3 follows.

## Independent identity and ABI

Matched Rva0058B590Value::get (0058B590, 81B), in
`game/GameEngine/Source/Common/Rva0058B590Value.cpp`, supplies Player in ECX,
one integer stack argument, and calls the existing Player address-derived
getRva0058B590Value binding via ILT0001D287. The original bank symbol is
unchanged. Actual-RVA oracle API says tier=placeholder, CONTRADICTED; that
statistical diagnostic does not reject opaque spellings under ilt_guard.
The only outgoing call is MSVCR71.dll floor through IAT VA013593B8, with an
8-byte double argument and x87 return.

## New structural evidence

* Retail +003A..0076 matches the canonical STLport hash_map lookup, including
  the bucket-base reload after unsigned division, the node chain and the
  second end/null test. The bank's manual hash walk erased those operations.
  The existing GameLogicObjectLookup.h independently places the hash object at
  +0xB0, its bucket vector at +0xB4/+0xB8, and its mapped Object pointer at
  node+8. Using that native hash representation recovers the retail saved
  register allocation from +0x0F onward.
* Record +4/+8/+C is the vector begin/end/capacity triple; +0x10 is ObjectID.
  Native vector::size and indexing recover the second begin load at +0x9E.
  Retail JAE +0x9C proves unsigned indexing. INC +0xA6 executes for each
  matching key even when the vector has no corresponding value. The old bank
  incremented only on a successful vector read.
* Retail rounds floor's double return to a 4-byte local at +0xD2, then reloads
  and FISTPs it. The matched 0058B590 caller already owns the exact
  rva0058B590FloatToLong helper implementing that compiler-specific operation.
  The bank includes that existing TU; it introduces no new inline-asm helper.
  Updating result for both the multiply and subtraction lets its old x87 value
  die at the witnessed instructions, removing redundant FLD/FSTP operations.

Measured steps: original210B/148 differences; semantic corrections209B/148;
native hash222B/66; native vector229B/20; existing helper240B/29; explicit
result lifetime236B/0. Normal re_log capture independently accepted score1.0.
Scratch logs and all source stages are under build/worker2-round47.

## Concrete promotion prerequisite

The body still uses the inherited BfmeObject/BfmeGameLogic slices. The canonical
singleton is data_rows `?TheGameLogic@@3PAVGameLogic@@A` at VA012F0898,
owned by GameLogic/System/GameLogic.cpp. The bank's differently typed
TheBfmeGameLogic is not that definition. The private canonical hash layout
must be accessible in the real Player compilation context without adding a
parallel declaration or a pin. Its Object status read at +0x118 must survive
canonical Object adoption. The zero and half constants already have data-row
owners g_rva01075350 and g_rva0107533C; old bank spellings are not proof of
those bindings. The scale read is VA0107FAC4. The existing Player wrapper
is the witnessed helper context; merging into it also requires preserving
its matched81B caller. No production edit, strict-gate verdict, or link-credit
claim was made in this round. Next work should integrate these concrete
canonical dependencies, preserving the accepted complete bank.
