# 0x007171F0 W3DShaderManager::startRenderToTexture (MASM dump)

Retail 0x007171F0..0x007173AD (445 bytes), carved by the gen-dump bank
`game/gen_asm/d_007039e0.asm` (notes: gen-dump, ghidra=FUN_00b171f0).
tools/ilt_oracle.py CONFIRMS `?startRenderToTexture@W3DShaderManager@@SAXXZ`
at this address, but that mangled name is already pinned to its 5-byte ILT
thunk row at 0x000154E7, so the pinned row keeps the placeholder name
`?Rva007171F0@@YAXXZ` (game/masm_dumps/Rva007171F0RenderToTexture.asm).

Why a MASM dump: the measured C++ reconstruction banked at
`targets/game/reverse/attempts/0x007171f0.cpp` (sha256
90463aa4a7ca0c0b5bf5c3fec9517baaf32b520637033f3a49bf3ff770ad17d3) compiles
445 bytes with 26 relocations and shape 1.000, and its residue is one
register swap over the alpha/dimensions handoff:

  +0x11C retail `mov edx,[12F7FE0h]`  VC7.1 `mov ecx,[12F7FE0h]`
  +0x122 retail `fld [edx+301Ch]`     VC7.1 `fld [ecx+301Ch]`
  +0x128 retail `lea ecx,[esp+4]`     VC7.1 `lea edx,[esp+4]`
  +0x132 retail `push ecx`            VC7.1 `push edx`

Sessions measured local order, helper wrappers, Release_Ref, barriers,
argument staging, dims const/reg/ref, volatile global, named global local,
dimension-store order, alpha-first and a 103-pair rotation sweep; the closest
alternative spellings add frame bytes or 17+ diffs, so VC7.1 cannot be made to
prefer retail's EDX/ECX assignment here. Siblings
`Rva0048FC90TimedTextForward.asm`, `Rva009C3630SpreadWmt.asm`.

The dump body is byte-identical to retail outside its 26 relocation slots
(probe EXACT; `./build.sh` verifies the row live).

Reopen as C++ only with a reconstruction compiled byte-identical (for example
if the alpha global's owner changes the allocation), or with a call-site
argument that pins the mangled name somewhere it is not already pinned.
