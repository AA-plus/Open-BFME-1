# 0x001F0960: why the matrix-copy callee is rva00132200, not setTransformMatrix

The banked attempt for the BezierProjectileBehavior::update body named its
matrix-copy call `Thing::setTransformMatrix`, spelling the callee after the
plain reading of the witnessed body at 0x00132200.

That decorated name cannot be used from this row. `?setTransformMatrix@Thing@@QAEXPBVMatrix3D@@@Z`
is already pinned at 0x00023D49, and that pin's incremental-link thunk chain
follows to the 155-byte body 0x001C16A0 (the shim target recorded as
`?setTransformMatrix@ThingSetTransformMatrixShim@@QAEXPBVMatrix3D@@@Z`,
"Thing::setTransformMatrix incremental-link thunk target through a TU-local
forwarding shim"). Adding a second address (ILT 0x000361CE -> body 0x00132200,
257 bytes) fails the one-name-one-function pin-consistency guard: the two
addresses do not land on byte-equal bodies.

The ledger already records the slot under its address-derived identity:
`?rva00132200@Thing@@QAEXPBVMatrix3D@@@Z` at both 0x000361CE (route pin:
"retail CALL 001E38AA targets ILT 000361CE -> witnessed Thing matrix-copy body
00132200") and 0x00132200 (Thing owner proven by setPosition/setPositionZ and
Drawable loadPostProcess callers). The landed TU therefore declares
`class Thing { void rva00132200(const Matrix3D *mtx); }` and calls it through
that name, keeping the identity floor of docs/naming_evidence.md instead of
reusing a decorated name that already belongs to the shim route.

Verified: ./build.sh reports Functions 1/1 matched with the row
?update@BezierProjectileBehavior@@UAE?AW4UpdateSleepTime@@XZ; the two additive
ILT pins `?calcSleepTime@BezierProjectileBehavior@@ABE?AW4UpdateSleepTime@@XZ`
(0x0002C99E) and `??1Rva0025ED50WideResult@@QAE@XZ` (0x0002C471) are
CONFIRMED by tools/ilt_oracle.py; no pin is added at 0x000361CE.
