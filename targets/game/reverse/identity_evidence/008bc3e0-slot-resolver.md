# RVA 0x008BC3E0 — BfmeSlotDispatcher1281::bfmeResolve1281 — MASM dump landing

Identity is address-derived and pre-dates this landing: symbols.csv line 79542 pins
`?bfmeResolve1281@BfmeSlotDispatcher1281@@QAEXHHPAPAXPA_N@Z` at 0x008BC3E0 with the
note "address-derived resolver callee; argument shape decoded from the 0x008BCCC0
retail call site". game/Libraries/Source/Apt/AptInput.cpp declares the member at
line 495 (`void bfmeResolve1281(int group, int slot, void **result, bool *handled)`)
and calls it at line 553 from the matched sibling `bfmeRouteEncoded1281`
(0x008BCCC0). Sibling members `bfmeDispatchSlots1281` (0x008BC360) and
`bfmeRouteEncoded1281` are matched rows from that same file. This dump completes the
existing declaration; it adds no new identity and no ILT exists for a non-virtual
member, so the ilt_oracle gate does not apply.

Decode: thiscall receiver in ECX (first use `mov eax,[ecx+0x126C]` at +0x28), RET
0x10 at +0x2FC, and INT3 padding through 767 bytes. The extent carries an SEH frame
with handler 0x01059278, two jump tables (0x00CBC6E0 and 0x00CBC6F4) and twenty
HIGHLOW sites (the four literal strings 0x013384CC 0x0133848C 0x013384A8 0x013384B4,
g_bfmeDefaultString1284 at 0x012D5298, the 0x01338748/0x01338750 hub pair, 0x01136DBC,
0x013377D8 and the EH handler).

Codegen blocker: the complete C++ reconstruction (bank
targets/game/reverse/attempts/0x008bc3e0.cpp) compiles to 803 bytes with the global
receiver scheduled through a pushed temporary; retail loads the global receiver into
ECX directly (scheduling differences at +0x1EC and +0x1F1). About forty variants
score 0.997 or below and none reaches the 767-byte schedule; re_attempts rows
38787 38872 55193 56563 56788 record the measurements. The landed body is the
verbatim gen-dump lift, HIGHLOW sites kept as literal retail bytes exactly as the
gen_asm scaffold carries them. `tools/probe.py` reports EXACT (modulo relocation
slots), size 767/767.
