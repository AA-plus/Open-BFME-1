# W3DRadarResetSurface clear donor audit

The tested revision is 7c702c14c2868de794acffa2568b9fd6a60b6615. The donor is Open BFME 2 `Code/Libraries/Source/WWVegas/WW3D2/SurfaceByteSize.cpp`, function `W3DRadarResetSurface::clear`, at game.dat RVA `0x00116780`. It is a near twin, not a byte-identical donor.

## Boundary and ABI

The complete BFME 1 decode covers `0x008FC830` through `0x008FCA2B`. The null branch reaches the shared epilogue. Every conditional destination remains inside that extent. The sole return is `ret 4` at `+0x1F9`, followed by INT3 at `+0x1FC`. ECX supplies the one-pointer receiver. The argument occupies one stack dword, but the body reads its low byte. No exception handler or owned container appears.

The matched `W3DRadar::reset` body at `0x006C1890` calls this target at `+0x42` and `+0x73`. The matched `clearShroud` body at `0x006C19B0` calls it at `+0x31`. Each call passes zero after obtaining a value surface and places the returned surface address in ECX. Their authored sources use the existing `W3DRadarResetSurface::clear(unsigned int)` declaration. These callers establish the repository identity independently of the donor. The ILT oracle reports this library-region target as UNTESTABLE, not contradicted.

`Get_Description` at `0x008FC5C0` was decoded through its complete 155-byte body. It writes Format, Height and Width at descriptor offsets zero, eight and four. The 50-byte code portion of the pixel-size helper at `0x008FC4F0` reads Format through ECX, returns an unsigned EAX size, and has no stack arguments. Its switch-table extent is separately owned by the existing 105-byte ledger row. The complete 33-byte debug helper at `0x008896A0` reads its cdecl integer argument and forwards the return address and kind to debug slot `+0x5C`. Checked-callee output is retained for all these code extents.

COM LockRect uses slot `+0x34` with the surface pointer and three arguments on the stack. UnlockRect uses slot `+0x38` with its surface pointer. The caller relies on callee stack cleanup and consumes HRESULT in EAX. The shared error sequence uses debug slots `+0x60`, `+0x6C`, `+0x38`, zero and `+0x4C`, with the existing recorded global at VA `0x01336E5C`. These declarations agree with the landed surface neighbours. No new pin or data record is proposed.

## Measured experiment

The original bank emits 508 bytes with 142 non-relocation differences, first at `+0x96`, and four displaced relocation sites. It remains unchanged. The donor's typed eight-byte block and 16-bit opaque temporary reproduce the raw AL-to-DL color mask when compiled with the donor flags, but introduce other differences.

The whole adapted donor emits 577 bytes with 260 differences. BFME 1 flags emit 584 bytes with 256 differences. A shared countdown and unlock emit 501 bytes with 250 differences. Removing `/G7` emits 511 bytes with 250 differences and reproduces most instruction structure, but widens `or dl,0xff` at `+0xF2` and pops EBP before the final error path. Providing the real static pixel-size helper leaves both measurements unchanged. The bool-bank hybrid with donor block emits 523 bytes with 323 differences. Signed-byte and all-one short opaque alternatives emit 497 bytes with 423 differences. Enclosing the signed-byte form in the null guard is unchanged.

The cross-port hypothesis is refuted as a direct completion: none of these independently measured shapes improves the original bank's byte differences. Reopening requires evidence for a native expression or lifetime that retains the raw-byte color mask, byte-width opaque operation and final EBP lifetime together. Repeating only the existing register and copy-loop spellings does not supply that evidence.

All trial sources, complete decoded bodies and unedited probe logs are retained under `build/writer12-donor/clear/`. The best donor structure is `donor-counter-g6.cpp`; the preferred byte reconstruction remains `targets/game/reverse/attempts/0x008fc830.cpp`. No exact recovery is claimed.
