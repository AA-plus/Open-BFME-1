# 0x000D6100: Player::getRva0058B590Value

The 236-byte body at `0x000D6100` (`ret 4` at +0xE9) was the gen dump
`?d_000d6100@@YAXXZ`. Its only caller is the matched `Rva0058B590Value::get`
(`0x0058B590`, `game/GameEngine/Source/Common/Rva0058B590Value.cpp`), which
reaches it through ILT `0x0001D287` with ECX = the player and the data's
`+0x70` key on its unscaled path. `symbols.csv` already pins
`?getRva0058B590Value@Player@@QBEJH@Z` at that thunk.

The body walks the player's `+0x640` list, looks each entry's object id up in
`TheGameLogic`'s `+0xB0` object hash, and skips dead objects (status `+0x118`
bit 3) and other keys. It takes the n-th matching entry's n-th float and then
applies the wrapper's scaled-path tail (`* 0x0107FAC4`, `0x0107533C -`,
`floor`, `fistp`). The real name is not recovered, so the method keeps the
wrapper's address token.

`game/GameEngine/Source/Common/RTS/PlayerGetRva0058B590Value.cpp` reproduces
all 236 bytes, modulo relocations. The banked stash's unused hash-node struct
(`BfmeObjectHashNode::m_object`) was dropped for STLport's own `hash_map`, so
name_regression's `m_object -> m_value` pairing is positional, not a rename.
