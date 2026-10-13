# Owned-pointer destructor at 0x008BE6D0

The complete extent is 46 bytes: RET at +0x2d, then INT3 at +0x2e.
Retail calls the existing thiscall reset at 0x008BDD70 with zero, clears
pointee +0x50, calls its vtable slot +8, and frees the four-byte pointer
holder through TheBfmeFree. It does not clear its own pointer afterward.
The surviving regular reset at 0x008BDE20 does clear that pointer.

The matched constructor Gen_008BE660 at 0x008BE660 constructs this same
pointer holder. Matched BfmeThingUEW constructor at 0x008A2CF0 uses that
constructor for its owned member and its unwind cleanup calls the pinned
Gen_008BE660 destructor at 0x008BE6D0. Matched Gen_008AC620 destructor
at 0x008AC620 also calls this address to destroy its member at +0x24.
These constructor and lifetime witnesses establish a destructor, independently
of the old bfmeGo1046E regular-method spelling and the queue's bad wrapper.

Keep the existing address-derived class spelling Gen_008BE660; the EA
class name remains unknown. The inline destructor in Rva008A2CF0OwnerDestructor
was a five-byte tail jump to bfmeGo1046E, not the complete retail body.
Recover the actual body out of line and prevent inlining into its matched
owner. Retire the opaque regular-method ledger claim with add_match's
identity-correction mechanism, retaining its independently verified address
pin for existing callers. BfmeConv1046 still needs its other matched bodies;
its unchanged legacy cleanup definition continues to serve old callers.
