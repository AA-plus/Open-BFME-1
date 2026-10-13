# Constructor-anchored renderer slots 125 and126

Round39 follows the concrete renderer-interface dependency identified in
008fff40-native-integration.md. This is read-only contract evidence, not a
new caller probe or a rename transaction. No source, pin, bank or header is
changed. Explicit-RVA oracle.check for the existing00978F50 name is UNTESTABLE;
actual constructor/vtable/body evidence below supplies the useful witness.

## Independently read retail tables

The matched RenderObjClass constructor009204B0 stores VA0113BD88 at+19.
The matched MeshClass constructor0092C270 stores VA0113C390 at+2F.
The matched HLodClass constructor0097CD30 stores VA0113EBE8 at+35.
Reading those actual table words gives:

| Constructor-installed table | slot150 | slot1F4 (125) | slot1F8 (126) |
|---|---|---|---|
| RenderObj VA0113BD88 | RVA00049F08 | RVA00048AC2 | RVA00013B74 |
| Mesh VA0113C390 | RVA0092CF50 | RVA0092DE80 | RVA0092DF50 |
| HLOD VA0113EBE8 | RVA00049F08 | RVA00978F50 | RVA00978FB0 |

These are RVA values, including ILT entries; they are not names inferred from
statistical ordering. JSON captures the raw values and exact source hashes.

## Complete forwarding bodies

00978F50 is86B, ending RET8 at+53. It caches child count from virtual6C,
fetches children through virtual74, pushes its two original stack words and
calls each child's virtual1F4. It then decrements the child's dword reference
at+4 and conditionally calls slot0. The existing address-qualified
visitSubObjects body implements this exact forwarding pattern. No external
direct callees or new pins are needed to describe it.

00978FB0 is67B, ending RET4 at+40. It performs the same traversal with one
32-bit argument and calls child virtual1F8 at+26. Its existing source labels
this Delete_Decal and calls the shared header's Delete_Decal method. That
spelling is not independent semantic evidence: the body only forwards a word.

The actual Mesh override at0092DE80 is the independently matched194B
handle-reference texture replacement, ending RET8 at+BF. Its existing donor
packet0092de80-bfme2-donor.md documents ownership, model+C8, material+24/+30,
and the mismatch with the canonical raw-pointer declaration. The actual Mesh
override at0092DF50 is the independently matched1218B packed-color application,
ending RET4 at+4BF. The existing identity packet0x0092df50-mesh-recolor.md proves
RGB extraction and texture/material recoloring and explicitly declines to
invent the original BFME spelling.

Thus HLOD slot125 forwards texture-handle replacement inputs and slot126
forwards the packed color consumed by the Mesh override. The already matched
008FFF40 bank calls precisely these slots. This supplies concrete implementations
for the slots that round38 could only identify by offsets.

## Why a header-only adjustment is not a scoped repair

Current rendobj.h declares Create_Decal(generator,bool) and Delete_Decal(uint32)
in this region. Existing code such as Rva00978FB0CompositeDeleteDecal.cpp compiles
through those names while implementing the witnessed slot126 forwarding.
There is also an existing Create_Decal pin at0092DE80 despite that body's matched
handle-reference identity. No name or pin is changed by this packet, and no
false semantic name is proposed for new production code.

An unchanged header_dependents API read of HEAD reaches193 ledger source TUs
from rendobj.h. The complete list is in the adjacent JSON. It is a planning
inventory, not a gate result; the mandatory gate must compute its own staged
snapshot if a future change occurs. A local duplicate RenderObjClass would
hide this interface conflict rather than resolve it and is not proposed.

The next bounded transaction is a formal identity/interface correction with
exact original snapshots: reconcile the slot125/126 base declarations and Mesh/
HLOD overrides, audit the conflicting decal bindings and real decal slots, and
verify all193 dependents under the required shared-header gate. The original
BFME method names remain unproved; address-qualified identities should be
retained where permitted by the repository correction workflow. A complete
snapshot/correction transaction is deliberately not claimed by this evidence
packet. The material owning-return ABI and private008FF0F0 implementation remain
separate prerequisites to promoting008FFF40.

Full retail decodes for all three constructors and four overrides are preserved
under build/worker2-round39/. No byte-shape experiment or prior refusal retry
was performed, and no verified byte progress is claimed.
