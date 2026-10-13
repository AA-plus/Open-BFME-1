# 0x006B24D0 MilesAudioManager per-category audio update -- MASM landing with a measured codegen blocker

Target: RVA 0x006B24D0..0x006B24EC, 1,772 bytes, name
`?rva006B24D0@MilesAudioManager@@QAEXABVAsciiString@@MH@Z` (address-derived;
the class is proven, the member name is not). Source:
`game/masm_dumps/Rva006B24D0MilesAudioManagerStreamPan.asm`.

## Identity (why the class, not the name)

- Three matched callers reach the body through one ILT, `0x00023D21`:
  `Rva006B4310Owner::update006B4310` (row `?update006B4310@Rva006B4310Owner@@QAEXABVAsciiString@@MH@Z`,
  0x006B4310, "mutex guarded entry update then 0x006B24D0 follow-up via ILTs"),
  `Rva006B43E0Owner::update006B43E0`, and `Rva006B44A0Owner::clear006B44A0`;
  all three pass `(const AsciiString&, float, int)`, so the ABI is proven:
  __thiscall, `ret 0xC` at +0x6E9, INT3 padding from +0x6EC (extent proof).
- The receiver layout is the BFME MilesAudioManager: mutex +0x95C, playing
  lists at +0x9C8/+0x9CC/+0x9D0, handle table +0xB44, settings +0xC (landed
  neighbours MilesAudioManagerStopChain.cpp / MilesAudioManagerStopAudio.cpp /
  MilesAudioManagerUpdateFadeVolume006B1A00.cpp); the EA source file for the
  retail run is GameEngineDevice/Source/MilesAudioDevice/MilesAudioManager.cpp
  (brief evidence block). No pin names the member, so the name stays
  address-derived.
- Zero Hour's `adjustVolumeOfPlayingAudio(name, volume)` is the nearest
  relative but this body takes a category, never branches on the float, and
  walks two per-category queues plus a per-category event vector, so no ZH
  name is claimed.

## Body (first-hand)

- Walks a refcounted-handle list (InterlockedIncrement/Decrement with release
  through the vtable slot at +8, `?j_000220c5@@YAXXZ` predicate, `?j_00001eb5@@YAXXZ`
  follow-ups), queries stream volume/pan (`g_Va013596D4` = _AIL_stream_volume_pan
  IAT, `g_Va013596A0`, `g_Va01359624`), clamps the fade against
  `?BfmeSubdualCapERD@@3MB` (0x01075334) / `?BfmeBoundaryZero3D@@3MB` (0x01075350),
  and re-sets sample volume via `__imp___AIL_set_sample_volume_pan@12` /
  `__imp__AIL_set_3D_sample_volume@8`. SEH frame `push -1; push g_Va01048DB8`.
- All HIGHLOW sites in the dump are symbolic; no literal image address is
  authored in the source (the body text is the dump_apply-rewritten gen-dump
  body of `?d_006b24d0@@YAXXZ` in `game/gen_asm/d_006b0a60.asm`, verbatim).

## Why this lands as a MASM dump (measured wall)

- The reconstructible C++ body (`targets/game/reverse/attempts/0x006b24d0.cpp`,
  bank score 0.9977) compiles to exactly 1,772 bytes with 50 relocations; its
  whole residue is four non-relocation register bytes in the stream-pan call
  setup:

    +0x428  retail: mov edx,[ebx+8]     ours: mov eax,[ebx+8]
    +0x42D  retail: lea ecx,[esp+0x1c]  ours: lea edx,[esp+0x1c]
    +0x431  retail: push ecx            ours: push edx
    +0x438  retail: push edx            ours: push eax

  i.e. retail keeps the sample handle in EDX and the pan-temporary address in
  ECX; VC7.1 emits the mirror. Invariant across const/reference handle
  declarations, a second-call local, direct member spellings (1771 B/625
  diffs or flat), the shape_family_levers register family (no applicable
  source-level lever), and prior 54-toggle and 1,439-pair sweeps -- 206
  recorded verdicts for this RVA. Every other byte of the extent reproduces
  exactly.
- Landing: `python3 tools/add_match.py "?rva006B24D0@MilesAudioManager@@QAEXABVAsciiString@@MH@Z"
  0x006B24D0 1772 game/masm_dumps/Rva006B24D0MilesAudioManagerStreamPan.asm
  --replace-rva 0x006B24D0` verified OK (the tool byte-checks and would have
  restored the scaffold row on failure).
- The dump body is byte-identical to retail outside its relocation slots.
