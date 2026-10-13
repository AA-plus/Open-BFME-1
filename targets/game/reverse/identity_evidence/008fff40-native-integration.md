# 008FFF40 native integration dependency assessment

Round38 assesses integration, not another caller byte trial. The preferred bank
is the independently measured masked-exact 889-byte version; it is unchanged.
No production promotion, binding, header change or new pin is proposed here.
The earlier `008fff40-visible-helper-retry.md` remains evidence of the unresolved
strict check, not authorization to rerun that refused snapshot.

## Owner and reusable source

An explicit-RVA `ilt_oracle.oracle().check` returns UNTESTABLE, not identity
proof. Reading retail VA 01139068 gives the first four vtable words
00CFEC20, 00CFE870, 00CFE880, 00CFFF40. Thus slot3 independently points to
RVA008FFF40. The matched constructors at009002C0 and00900E40 and destructor
00900FF0 establish the existing address-qualified owner; they do not establish
an original semantic class or original source filename. The factory009004A0
is a matched caller of the constructor. Keep the opaque owner identity.

The constructor and destructor sources agree on two StringClass words at14/18,
five twelve-byte containers at1C/28/34/40/4C, a twelve-byte container at58 and
an owned renderer pointer at70. They are separate TUs with incompatible local
base declarations, not a canonical shared owner header ready to include.
The bank's integer interpretation of the58 elements comes from their use as
indices; the constructor's inherited pointer-element spelling is not proof of
pointer semantics. The matched008FFB80 copy constructor provides the strongest
reusable native source: STLport `_Vector_base<string, allocator<string>>`, with
actual string construction and character-buffer ownership. Do not regress it
to the constructor's flat three-pointer facade.

## Direct dependency graph and binding state

| Edge | Independent contract / existing implementation | Integration consequence |
|---|---|---|
| caller ->008FF290 | Create_Render_Obj, existing named binding | Ordinary pointer return; retain binding |
| caller ->008FEB90 | matched recursive material uniqueness140B | Existing source available |
| caller ->008FFB80 and007556A0 | copy and destruction of12B narrow-string elements | Native copy source available; preserve cleanup lifetimes |
| caller ->008FF060 | renderer ESI, filename/index caller-cleaned stack words; matched144B TU | External cdecl declaration alone cannot express private ESI routing |
| caller ->008FF0F0 | renderer EAX, first vector ECX, second vector/index stack;181B | Only generated body in ledger; no Rva008FF0F0Method binding in symbols.csv |
| caller ->008FF6A0 | four cdecl words, recursive281B body, RET+118 | Existing pin takes two **const STLport string references**; bank declares pointers and therefore a different decorated symbol |
|008FF060 ->008FEF60 | ECX renderer, EBX handle address, stack index | Existing244B MASM implementation and pin; C++ visibility body retains known branch residue |
|008FEF60 ->007A0340 | owned hidden-return handle, RET8 | Typed pin exists; canonical MaterialInfoClass header still declares raw TextureClass* getter |
|008FEF60 ->0092C3E0 ->0094F300 | member+C8 forwarding thunk, two handle references | Matched334B MeshModel replacement exists; current thunk ledger declaration is zero-argument |
|caller ->0090E910 /009EB7A0 | owning texture lookup / reference release | Existing bindings; owning temporaries must retain EH states |

The corrected pointer/reference declaration for008FF6A0 is a concrete future
integration step using an existing binding, not permission to rename a body or
invent another binding. It does not resolve the private008FF0F0 call.

## Complete helper observations and native renderer blocker

The complete181B008FF0F0 decode begins `mov esi,eax`, checks the vector through
ECX, reads the second vector from the stack and calls renderer slot18 for its
name. It calls008FF060 with ESI retained and two pushed words, and uses slot7C
for subobject lookup. Final return is+ B4. Prior complete helper measurement
is181B with five scheduling differences, not exact. No new independent lifetime
or layout witness was found that changes that result; merely repeating helper
visibility would not establish an implementation.

The complete281B008FF6A0 decode performs string/texture ownership cleanup,
forwards all four parameters in its recursive call at+E6 and returns at+118.
Its existing typed pin is usable only with the reference signature it records.

The current shared rendobj.h has no replaceTexture declaration corresponding
to the bank's virtual slot1F4 and no declared slot126 counterpart. The earlier
native renderer experiment produced offsets208/20C where retail calls1F4/1F8.
Do not repair that by redeclaring RenderObjClass or padding a guessed interface.
Canonical matinfo.h lines102-103 declare raw-pointer Get_Texture overloads;
the witnessed007A0340 handle-return ABI cannot be substituted into those
signatures without auditing their consumers. The matched008FF060 TU itself
still redeclares RenderObjClass and MaterialInfoClass locally, so copying that
TU does not solve the canonical-header obligation.

## Disposition and concrete follow-up

Dependencies spread beyond a tightly scoped same-TU integration: canonical
renderer virtual-slot reconciliation, material owning-return interface,
private008FF0F0 implementation and its binding, and typed thunk forwarding.
No new caller probe was run, no prior strict refusal retried, and no progress
is claimed from an unchanged masked-exact bank.

Next packet should first recover the concrete renderer vtable implementations
at1F4/1F8 and their independent matched callers, then reconcile those slots with
the shared renderer declaration and enumerate every dependent TU before a full
gate. Separately,008FF0F0 needs an exact native private-ABI implementation; the
missing witness is its original caller/helper compilation context, not its
already established stack/register inputs. These are concrete follow-ups, so
this assessment is dependency_evidence rather than queue exhaustion.

Raw complete decodes are preserved under build/worker2-round38/{caller,helper,
permesh}.txt. The adjacent JSON records exact source and baseline hashes plus
the independently read vtable words. All canonical source and bank files remain
unchanged. This packet supersedes no earlier byte or identity verdict.
