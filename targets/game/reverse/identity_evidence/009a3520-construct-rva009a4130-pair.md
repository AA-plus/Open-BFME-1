# 009A3520 is _Construct for the 0x009A4130 tree's pair value

Retail was linked without identical-COMDAT folding, so each STLport
`_Construct` instantiation is its own body; the 23-byte two-dword placement
copy has many byte twins (00072390, 000723B0, 0008F6D0, ...). Identity follows
the callers.

- `tools/callers_of.py 0x009A3520`: callers are 009A4130 (the matched
  `_Rb_tree<Rva009A4130Target *const, pair<...>>::_M_insert`, whose node
  creation calls 009A3520 for its 8-byte value) and 009A3930
  (`Rva009A3930Create`). No ScriptActions code calls it.
- The retired row `tg_009a3520` (ScriptActions.cpp) carried
  `_Construct<pair<ObjectID,ObjectID>>` only as a byte-identical template
  alias; it has no caller at this address. 009A3520 has no ILT thunk (not a
  command-line game object), consistent with the library-region tree code
  around 009A4130 rather than ScriptActions.
- Key and mapped types stay address-derived; only the caller relation is
  asserted.
