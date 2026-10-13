# 0x00740440: Rva00740440::rva00740440, not setCameraPathAngles

The 347-byte body at `0x00740440` (`ret 0xC` at +0x134 and +0x158) was a
matched row named `?setCameraPathAngles@Rva00740440@@QAEX_NMH@Z`. That name was
invented, and `python3 tools/ilt_oracle.py check` reports it CONTRADICTED
(p_false 5.87e-04, outside the window of slots 16483-16491) for ILT
`0x00020266`. A 2026-10 verdict in `re_attempts.log` records the refusal.

The only reference is the call at `0x0074103B` inside the unnamed gen dump
`0x00740F60`, so no caller supplies a real name. The body is BFME's form of
Zero Hour's `W3DView::setupWaypointPath` heading loop: it stores per-waypoint
headings computed as `acos(dx / |d|)`, negated when `dy < 0`, less `PI/2`,
then passed through `normAngle`. With `orient` off it fills the angles with
the given value. The class and its member layout stay address-derived. The
method now keeps the address too: `?rva00740440@Rva00740440@@QAEX_NMH@Z`.

`game/GameEngineDevice/Source/W3DDevice/GameClient/Rva00740440CameraPathAngles.cpp`
reproduces all 347 bytes, modulo relocations. It now includes the real
WWMath `vector2.h`/`wwmath.h` (`WWMath::Sqrt` is WWMath's own `fsqrt` inline
assembly) instead of local asm-only copies.
