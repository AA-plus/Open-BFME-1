# 0x007626F0 bank identity and binding preflight (2026-10-13)

Round46, model=gpt-6-astra, lane=R, budget=30m. Assessment only;
no source trial, byte measurement, bank replacement, or promotion.

## Boundary and name

The generated ledger body has extent 363 bytes with bounds=high, and
ILT 0x00038393 routes to 0x007626F0. The existing bank proposes
`?allocateShadows@W3DModelDraw@@UAEXXZ`. Its prior outcome cites primary
vtable slot12, but this assessment did not independently re-prove that class
assignment. Neither a bank spelling nor that prior narrative overrides the
current identity check.

Using unchanged `ilt_oracle.oracle().check(symbol, 0x007626F0)` with an explicit
integer RVA returns tier=real, CONTRADICTED, probability
0.00045660909043469187, reason:
`outside every window of the target's slots 45238:27042-27048`.
Calling unchanged `ilt_guard.problems` on the proposed functions row with the
repository baseline returns that same rejection (zero consistent names).
This is an applicable real-name rejection, not an opaque-name exemption or
ambiguous CLI address conversion. No staged hook was deliberately invoked to
repeat it. The bank and production names remain unchanged.

## Independently inspected binding problem

`callees.py 007626F0 363` resolves the call at caller+0x136 through ILT
0x0002B526 to body0x00459880. At caller+0x12F the pushed value is loaded
from receiver+0x24; ECX comes from receiver+0x3C. The bank calls this
`Shadow::applyDrawable(void*)` via a member-pointer union.

The matched 171-byte callee in
`game/GameEngine/Source/Common/BfmeConv2132.cpp` is
`?bfmeSetABK@BfmeColourABK@@QAEXH@Z`. Retail+0x0D masks the incoming value
with 0x00FFFFFF; +0x18 stores it to receiver+0x24. It reads receiver+0x34
flags and receiver+0x2C opacity, then writes receiver+0x28. The alternate
path scales packed RGB channels; ret4 confirms one stack argument.
This independently establishes a packed-color integer argument, not a drawable
pointer. The bank's invented application method and argument field meaning
cannot be carried into a production reconstruction. No replacement identifier
or cast workaround was added.

## Native layout dependency

The caller reserves 0xA4 bytes and its stack descriptor places type at +0x80.
The matched manager0x007B76C0 in
`game/GameEngineDevice/Source/W3DDevice/GameClient/Shadow/W3DShadowManagerAddShadow.cpp`
explicitly models the 128-byte BFME name and type at +0x80.
`inputs/reference/shims/sweep/GameClient/Shadow.h` instead declares a
64-byte name and type at +0x40. Blind adoption is incompatible; adding a
second definition or widening the shared header without dependent verification
is not a small caller repair.

The absolute manager VA0x01306EEC does have a current real data owner:
`?TheW3DShadowManager@@3PAVW3DShadowManager@@A`, in data_rows.csv, backed by
`identity_evidence/00f06eec-TheW3DShadowManager-pointer.md`. Thus that bank
numeric-address access needs no new pin, but resolving it does not resolve the
identity and layout blockers above.

## Disposition

Stop at identity preflight; no register-shape permutations or compilation.
Preserve the score0.75 bank and its older 361/363-byte result without claiming
it as a new measurement. Required future work: resolve the real-name/vtable
conflict independently, establish a coherent BFME shadow declaration with
all dependents verified, and use the proven packed-color callee contract.
No incidental bank renames, pins, shared-header changes, or baseline debt.

Measured assessment time t=1.6min (excluding prior queue screening).
