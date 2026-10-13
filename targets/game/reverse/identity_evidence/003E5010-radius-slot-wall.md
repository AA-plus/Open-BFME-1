# 003E5010 - radius output slot wall (t=~22min, model gpt-5.2-codex)

Body: ?rva003E5010@Pathfinder@@QAEXPAVObject@@PAUCoord3D@@0_N@Z, RVA 0x003E5010.
Extent reconfirmed: retail `ret 0x10` at +0x4EB, INT3 at +0x4EE -> 1262 bytes.

## Best measured source
attempt_history b970c5da (== 7ef27cf2): 1262 bytes, 29 relocs, 307 non-reloc
diffs, shape 0.961, 18 structural diffs, first differing byte +0x3a (lea at
+0x37), 8 misaligned relocation sites, score 0.7567. The served 0.96
author-estimate draft measures 1265 bytes / frame 0x7c / 928 diffs, so the
0.7567 body is the better bank. Bank written to
targets/game/reverse/attempts/0x003e5010.cpp and re-probed there: same numbers.

## The wall: radius/center output slots
`python3 tools/dis_retail.py 0x003E5010 1262`, B = esp after `sub esp,0x74`:
retail passes `lea [esp+0x1c]` (center byte) and `lea [esp+0x28]` (radius int)
to j_000461FF, i.e. center at B+0x10, radius at B+0x18 (8 apart; B+0x14 is a
loop float temp). Ours in the struct spelling: center B+0x30, radius B+0x34
(0x20 too high, 4 apart). Separate `Int radius; Bool center;` locals at the
struct's position instead give center B+0x00, radius B+0x04 (0x10 too low).

## Trials this pass (all inert or worse)
- Four separate-local spellings (radius-first / center-first x declared at the
  old struct position / at function top): all emit byte-identical output,
  342 diffs, first +28. Declaration order and position do not move the slots
  (matches docs/shape_levers.md "A run of locals on the wrong slots").
- Hoisting `Real candidateX=0, candidateY=0; Int cellX=0, cellY=0;` to the top
  and assigning later: initial values are dead-store eliminated, output is
  byte-identical 342 diffs.
- `/FAsc` listing (EBP-relative, B=EBP-0x74) for the separate-locals build:
  _center$=-116 (B+0x00), _radius$=-112 (B+0x04), _fraction$=-108,
  _sourceCellX$=-104, _sourceCellY$=-100, _lastX$=-96, _lastY$=-92 (aliased
  with _maxLayer$/_targetLayer$), _this$=-88, _average$=-64, _targetCell$=-60,
  _state$=-52, _scanner$=-40.
- shape_family_levers.py (sib,register,bool,test,copy,store,loop,branch,
  constant,frame): 12 choices; shape_search.py 13 trials, no improving output.

## Secondary residue
First structural diff at +0x98: retail loads the center byte into bl before
`sete cl`, ours emits `sete cl` first (register scheduling after the
bfmeIsComputerControlled call); it cascades the store order of
state.m_offset00/m_offset04 through +0xb4..+0xbc.

## Sibling lever checked
0x003E49F0 (landed PathfinderRva003E49F0.cpp) needed array->scalar radius to
go exact; this body already uses scalars, so that lever is spent.

## Not repeated (HISTORY #54-58)
Passing the unused Bool arg as the center output (1257B/943 diffs); local
order between radius, cell and center (1265B/928 diffs, frame 0x7c).

blocker=stack-slot/output-pointer-lifetime (secondary: regalloc/scheduling at
+0x98); bank score 0.7567.
