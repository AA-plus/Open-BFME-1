# 00795140 frame packing: seventh string temp + coordinate rotation

Identity unchanged and strong: matched dispatcher 0x00795EE0 and the symbol pin
prove ?W3DGadgetPushButtonImageDrawOne. RET at +0xAC8 and INT3 at +0xAC9 prove
2761 bytes. Static order in retail matches the bank verbatim (strings resolved
from the image): Cameo_push, Cameo_hilited, RadialPush, RadialOver, RadialBorder,
RadialClockOverlay1, RadialClockOverlay2.

Fresh repro 2026-10-13 of targets/game/reverse/attempts/0x00795140.cpp:
2761/2761 B, 133 relocs aligned, 127 non-reloc diff bytes, first at +0x24C
(probe prints +588), shape 0.997, 4 structural diffs. Bank score 0.954.

## Measured frame (MSVC 7.1 /FAsc listing, EBP-relative)

Ours (bank):
- _image$ = -64; $T1715..$T1720 = -60 (six AsciiString temps merge);
  $T1721 = -56 (seventh temp alone). -60 also hosts _clockColor$ and
  _colorMultiplier$.
- coords: _end$ = -36, _start$ = -28, _size$ = -20 (8-byte each).
- clock Reals and drawText temps occupy -52..-36.

Retail (from the paired operand diffs):
- all seven string temps at -60 (EBP-0x3C; retail FuncInfo's seven cleanup
  actions all use EBP-0x3C);
- coords: _start$ = -36, _size$ = -28, _end$ = -20;
- clock/coordinate-band slots sit 8 bytes lower than ours.

## Experiments this session (frame-table measured)

-FAsc listing does not change codegen: plain and /FAsc objects are
byte-identical (2745 vs 2745 verified on the c11 variant below).

No frame change (still $T1721 = -56, coords -28/-20/-36):
- halfX = halfX * (46.0f/48.0f) value form
- separate scaledX/scaledY named Reals passed to both bfmeRunD calls
- comma declarations Real halfX = a, halfY = b;
- function-scope Real halfX, halfY, centerX, centerY hoisted to the top
- ZH decl order ICoord2D size, start, end
- Int (instead of Color) colorMultiplier
- nested { } block around the clock Reals
- explicit left/top/right/bottom Reals (moved end to -52 but not to retail)

## Decisive discovery

Replacing the in-place scalings with duplicated value expressions:

    Real halfX = size.x * 0.5f * (46.0f / 48.0f);
    Real halfY = size.y * 0.5f * (46.0f / 48.0f);
    Real centerX = start.x + size.x * 0.5f;
    Real centerY = start.y + size.y * 0.5f;

moves _start$/_size$/_end$ onto retail slots (-36/-28/-20), BUT the two
size.*0.5f products are CSE'd into Reals temporaries whose lifetime changes the
x87 materialisation: 2745 bytes (16 short), 775 diffs, 44 relocation-layout
drifts, shape 0.983. $T1721 STAYS alone at -56 in that build, so the temp
merge and the coordinate rotation are two independent allocator effects.

## Reading for the next worker

- The coordinate rotation is fixable from the clock block's object shape; the
  missing ingredient is a value expression that materialises the extra object
  WITHOUT duplicating size.x*0.5f (centerX must keep using the live halfX).
- The lone seventh temp survives every re-spelling of the statics tried across
  sessions (order, explicit AsciiString, extra 8th static swaps which temp is
  lone). Look for the allocator's overlap rule instead: docs/shape_levers.md
  "A run of locals on the wrong slots: retail had one more object".
- The bisect from the previous session still holds: removing the pData block
  puts the coords on retail slots; removing only the clock writes does not.
