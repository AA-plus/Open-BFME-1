# Progress-bar image callback at RVA 00793520

`W3DGadgetProgressBarImageDrawA(GameWindow *, WinInstanceData *)` candidate reproduces
all 203 retail bytes in its existing W3DProgressBar.cpp translation unit.
The old bank's reported 0.995 was historical instruction-shape evidence: a
fresh byte probe actually emitted 204 bytes with 100 masked differences.
The unlanded candidate is exact, and the scoped build verifies all 34 TU rows.

## Identity, extent and ABI

Retail ILT 0001CAA3 jumps directly to 00793520. `ilt_oracle.py check` confirms
`?W3DGadgetProgressBarImageDrawA@@YAXPAVGameWindow@@PAVWinInstanceData@@@Z`
with p_false=1.96e-04. The pre-existing pin is consistent with the same body.
EA's W3DProgressBar.cpp supplies the same callback, five-image null guard,
percentage calculation and repeated center-image drawing algorithm.
The entire body was decoded: its single RET is at +CA, the next byte +CB is
INT3, and every conditional destination stays inside the 203-byte extent.
There are no jump tables, EH records, external tails or owning temporaries.
The first stack argument is the window; the second is unused. The ordinary
cdecl callback returns void and leaves caller cleanup to its caller.

`callees.py 00793520 203` reports exactly three direct calls through the
recorded ILTs: 00046538 -> winGetUserData at 00478C70, 0002F94B ->
winGetScreenPosition at 004781D0, and 00036EBC -> winGetSize at 004782A0.
Complete decoding verifies the pointer return at +2C for user data and the
integer-returning two-output-pointer methods, each RET8, for position and
size. The canonical GameWindow declarations reproduce those actual names
and ABIs. The draw uses the existing manager's virtual slot +F4, with the
Image pointer, four coordinates and its existing -1 default argument.
The shared header and independently resolved scoped gate preserve that call.

## New lever and measured refutation

The documented empty-coordinate-constructor lever was tested against the
preferred bank. `Rva00793520Coord : public ICoord2D` has an empty inline
constructor, no extra members and no new initialization. Using it only for
`size` changes VC7.1's allocation context: retail's
`imul ebx,[esp+14]` at +65 replaces the bank's `mov ecx,[esp+14]; imul ecx,ebx`.
The signed percentage division, guards and one-byte loop alignment then match.
Making both origin and size use that local type also matches, but the narrower
size-only change is retained. The same body remains exact in its home TU.
This is a source-shaping choice, not an invented EA coordinate type identity.

The five enabled-image reads retain independently decoded BFME offsets
+90, +84, +48, +54 and +60. The ZH accessors are four bytes lower. The bank's
existing TU-local image reader avoids changing shared getters or their
33 previously verified rows. No semantic member name is inferred from an
offset: name_oracle has no GameWindow+90 witness.

Raw probes and complete retail/callee decodes are in build/c3_00793520/.
The original bank, size_ctor and both_ctor results are preserved there.
`add_match.py --replace-rva --model gpt-6.1-sol` ran the strict build:
Functions OK 34/34, source claims OK, DIR32 OK, and body guard OK with zero
baselined findings. The only external datum is the existing recorded
TheWindowManager. No new pins, globals, headers, aliases or escape hatches
were introduced; generated files were untouched.

## Hook refusal and retained result

The normal hooked commit refused five descriptive-to-placeholder call
respellings: each GadgetProgressBarGetEnabled... accessor became the
preferred bank's BfmeProgressImage offset reader. This is recorded as
false-reject name_regression. No forwarder, macro, naming correction or
alternative implementation was attempted after the refusal. The production
source, function ledger and tombstone were restored. The proposed TU had
LINKED 0 -> 431 bytes, but the released item contributes zero landed bytes.
The exact size-only candidate is retained as banked evidence, not progress.
