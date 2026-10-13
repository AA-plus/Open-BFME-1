# 0x005B5590 BfmeOwnVVD per-frame scroll/camera update -- MASM landing with a measured codegen blocker

Target: RVA 0x005B5590..0x005B5C8E, 1,791 bytes, name
`?rva005B5590@BfmeOwnVVD@@QAEXXZ` (address-derived; the class is proven, the
member name is not). Source: `game/masm_dumps/Rva005B5590BfmeOwnVVDFrameUpdate.asm`.

## Identity

- The class is BfmeOwnVVD: constructor 0x005B5470, singleton 0x012F4C84
  (`?g_bfmeSingletonVVD@@3PAVLookAtTranslator@@A`, typed pin: doDisableInput
  tail-calls resetModes on the BfmeOwnVVD singleton), vftable 0x0110DE48
  (`??_7BfmeOwnVVD@@6B@`), and the sibling stopScrolling-style body at
  0x005B52B0.
- The body is the per-frame update called once per client frame from the
  matched `ClientUpdate004329D0::update` (0x004329D0) through ILT 0x0000B7A3;
  the symbols.csv candidate pin `?rva005B5590@Calls004329D0@@QAEXXZ` records
  the same ABI ("thiscall no stack arguments; ECX read; ret; caller 004329D0
  via 0000B7A3; evidence=004329D0-client-update.md"). __thiscall, no stack
  arguments; the body ends `ret` (0xC3) and probe measures 1791/1791.
- The body is Zero Hour's LookAtTranslator MSG_FRAME_TICK case (LookAtXlat.cpp)
  moved into its own member: the forced-stop test, the RMB / key / screen-edge
  scroll switch on m_148, the setScrollAmount + scrollBy pair, and the
  MSG_SET_REPLAY_CAMERA (0x446) ViewLocation message; BFME adds an edge-scroll
  ramp (m_14c, GlobalData +0xB6C/+0xB70), a scroll hook at 0x012F7048, anchor
  resets from scrollBy's edge flags, rotate keys (m_154..m_157) and key-release
  polling. No symbol names the member, so the name keeps the address token.

## Why this lands as a MASM dump (measured wall)

- The reconstructible C++ body (`targets/game/reverse/attempts/0x005b5590.cpp`,
  bank score 0.9978) compiles to exactly 1,791 bytes with 80 relocations; its
  whole residue is four non-relocation bytes at +0x299 and +0x29C: retail
  loads m_anchorX ([esi+4]) into EDX before m_currentPos.x ([esi+0x14]) into
  EAX, while VC7.1 emits the reverse order with identical instruction shape
  and register mapping -- pure emission order, not spelling.
- Invariant across int-delta locals, the factor-right spelling, anchor first
  as a local, both locals, dx-before-gd, `/Ob1`, and `/Oi-`; the y-first
  spelling (1789 B / 821 diffs) and the direct-global form without the `gd`
  local (1790 B / 803 diffs) are worse. The Zero Hour twin
  (`inputs/reference/.../LookAtXlat.cpp`) confirms the expression shape, and
  the probe residues have reproduced unchanged across sessions.
- Landing: `python3 tools/add_match.py "?rva005B5590@BfmeOwnVVD@@QAEXXZ"
  0x005B5590 1791 game/masm_dumps/Rva005B5590BfmeOwnVVDFrameUpdate.asm
  --replace-rva 0x005B5590` verified OK (the tool byte-checks and would have
  restored the scaffold row on failure).
- The dump body is byte-identical to retail outside its relocation slots (the
  body text is the dump_apply-rewritten gen-dump body of `?d_005b5590@@YAXXZ`
  in `game/gen_asm/d_005b3e30.asm`, verbatim; all 27 reloc sites symbolic, no
  literal image address authored).
