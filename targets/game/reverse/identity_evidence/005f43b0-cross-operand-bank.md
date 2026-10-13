# 0x005F43B0 bank: x87 cross-product operand picks

Result: partial bank retained at 2220B / 58 relocs / 29 non-reloc differing bytes.
Best measured score 0.98694 (shape 0.974, 7 structural, first diff +0x2A1).
Candidate name ?draw@LightningDraw005F43B0@@QAEHPAX0PAH@Z remains address-derived:
the LightningDrawModule primary vtable 01112FD0 slot +0x10 is installed by the
landed ctor 0x005F4E90, but no independent spelling proof exists.

Boundary: retail ret 12 at +0x88A with the seven-entry switch table ending at
+0x8AC proves the 2220-byte extent; the probe's boundary warning is the decoy
tail, size not adjusted.

Identity/behavior: tooltip-free render path; builds 512 point stamps, widths,
RGB and byte records from ParticleSystemZA particles, then (changed path)
normalizes along = positions[n-1]-positions[0], builds an orthonormal frame
with two Vector3::Cross_Product calls into field8C8/field8D4 and evaluates the
chained X sum a*field8C8.X + b*field8D4.X + c*field8BC.X plus the Y/Z pairs
into field480 offsets. All callees resolve through landed or thunk symbols.

This run: confirmed the residual 29 bytes are four x87 fld/fmul operand picks
inside the two inlined Vector3::Cross_Product calls. Retail emits fld of the
first-argument component then fmul of the second for every product except
a.X*b.Z; ours canonicalizes three other products the other way. Tested and
rejected this run: TU-local helper with all subtrahend multiplicand orders
swapped (y01) compiles to byte-identical output, confirming MSVC canonicalizes
the commutative product and source factor order is not a lever. Earlier runs
already exhausted indexed-vector/component/parenthesized/reference helper
forms and pointer/reference call-site locals (best 31 diffs).

Blocker family: codegen-order (x87 commutative operand selection). The picks
are compiler-internal given the matched prefix and suffix; a reopening needs a
new source-shape hypothesis that changes the two inline expansion trees
without moving any of the 2191 already-matching bytes.

t=35min model=gpt-5.2-codex
