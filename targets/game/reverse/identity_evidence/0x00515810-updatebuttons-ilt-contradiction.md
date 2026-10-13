# 0x00515810 calls the 0x00006F4B ILT thunk, whose `updateButtons` spelling is contradicted

The landed body `?Rva00515810@AptInGameChat@@QAEXXZ` (1166 bytes,
game/GameEngine/Source/GameClient/GUI/GUICallbacks/Apt/BfmeAptScreenInGameChatRefreshFriendsList.cpp)
refreshes the in-game chat friends list and calls the AptInGameChat
button-refresh helper through retail's shard-1 ILT thunk 0x00006F4B
(`jmp 0x005147F0`; the 473-byte body at 0x005147F0 is already the matched
`?d_005147f0@@YAXXZ` row).

- The bank pinned the call as `?updateButtons@AptInGameChat@@QAEXXZ` at
  0x00006F4B so the relocation resolved (targets/game/reverse/attempts/0x00515810.cpp).
- `python3 tools/ilt_oracle.py check updateButtons 0x00006F4B` reports
  `CONTRADICTED  p_false=3.26e-03  (outside every window of the target's slots 4878:5263-5287)`;
  `?updateButtons@AptInGameChat@@QAEXXZ` and its access-decorated spellings
  report `CONTRADICTED  p_false=1.63e-03` for the same slots, so the
  descriptive name is unproven.
- The pin and the landed private method therefore spell the address-derived
  placeholder `?Rva00006F4BUpdateButtons@AptInGameChat@@QAEXXZ` (withdrawal
  recorded in targets/game/reverse/name_corrections.json), leaving the call
  target resolution unchanged while the native name stays unclaimed
  (docs/naming_evidence.md identity floor).

Byte-verification is unaffected: the landed 1166-byte body still probes
EXACT 1166/1166 against retail through the renamed pin.
