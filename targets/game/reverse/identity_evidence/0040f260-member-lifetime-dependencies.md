# Display constructor: native member lifetime dependencies

Target: `??0Display@@QAE@XZ`, RVA `0040F260`, 508 bytes. Explicit-RVA
`ilt_oracle.oracle().check(symbol, 0x0040F260)` returns CONFIRMED/exact.
Retail RET is `0040F45B` (+1FB). This packet extends round32 research;
it does not rerun its grouped scalar or record-constructor shapes.

## Proven cleanup contract

Constructor handler `00C20462`, FuncInfo `00E10740`, has these four states:

| State | Next | Cleanup RVA | Receiver | Resolved body |
|---|---|---|---|---|
| 0 | -1 | 00C20430 | saved this | 009A1A40 SubsystemInterface destructor |
| 1 | 0 | 00C20438 | this+AC | ILT 0003B304 -> 0005EEA0 UnicodeString destructor |
| 2 | 1 | 00C20446 | this+CC | ILT 0000D828 -> 0005EE90 AsciiString destructor |
| 3 | 2 | 00C20454 | this+EC | same AsciiString destructor |

The independently matched destructor `0040F6D0` (134 bytes) corroborates
all three members without inferring types from adjacency. Its normal body
releases EC at `0040F712`, CC at `0040F722` through char StringBase release
`00887940`, then AC at `0040F732` through unsigned-short StringBase release
`008881D0`. Its handler `00C204D2`, FuncInfo `00E107AC`, repeats the same
four receiver adjustments and cleanup targets (actions 00C204A0/A8/B6/C4).
See `game/GameEngine/Source/Common/Rva0040F6D0Destructor.cpp`: it includes
canonical string headers and declares UnicodeString at AC, AsciiString at
CC and EC, separated by 1C-byte gaps. Its existing BfmeObjEE name is not
changed by this packet.

Canonical `WWLib/unicode_string.h` contains one pointer. `ascii_string.h`
derives from StringBase<char> without added data; `string_base.h` contains
one pointer, zeroes it in its default constructor, and releases it in its
destructor. Thus each of these three member objects is four bytes on the
retail ABI; the 0x20-byte spacing does not mean 0x20-byte string objects.
The matched W3D constructor `Gen006EF850Constructor.cpp` independently
reserves a 0x140-byte (320-byte) Display base.

Constructor stores zero to AC at `0040F31B`, CC at `0040F351`, and EC at
`0040F380`. It writes EH state 3 at `0040F386`; omitted intermediate state
stores are consistent with no intervening throwing calls. State 0 is first
stored at `0040F2AF`, after initial scalar stores, before GetCurrentThreadId.
A faithful source must preserve this lifetime boundary as well as the
three native members. The old raw-byte bank does not express those members.

## Three 24-byte regions: what remains unproved

`0040F2DD..0040F318` initializes six dwords each at 64, 7C, and 94:
LEA EAX,[this+64], two ADD EAX,18 steps, and grouped stores. The exact
112-byte `Display::bfmeStopMovie` at 0040EFF0 clears all eighteen dwords
64..A8, clears C4/C8, and releases the UnicodeString at AC. Its existing
source in `GUI/Shell/Shell_hide.cpp` models an array of eighteen words,
not a native record class. Neither witness gives names, pointee types,
or a constructor signature for a 24-byte element. There is no separate
record cleanup action in either unwind map. This does not prove that the
original source was a POD array or that a synthesized constructor is valid.

Name oracle reports no Display member witness at 64/7C/94/AC/CC/EC.
`game/GameEngine/Include/GameClient/Display.h` retains the smaller Zero Hour
layout (including a cinematic AsciiString and movie AsciiString); it has
neither this UnicodeString member nor the three 24-byte regions. It cannot
be adopted as the BFME layout without independent field convergence.

Required next evidence: a native BFME Display declaration or independently
proven record consumers establishing the six fields and element lifetime;
and the native subobject/declaration boundary explaining the initial
scalar stores before state 0. The string types and unwind actions above
are settled. Do not repeat round32's grouped-scalar/placement-record
wrappers, blindly permute stores, or change the shared header speculatively.

No byte trial, production edit, header edit, pin, or identity rename in this
round. Original bank retained. Raw constructor/destructor/stop-movie decode,
unwind output, and six name-oracle results: `build/worker3-round35/`.
