# RVA 0010EA60: native list erase return

Round48, model=gpt-6-astra, lane=R, budget=30m.

The 122-byte body ends at 0010EADA after RET8 at 0010EAD3 and a final
loop backedge at 0010EAD8. Matched callback forwarder 0010F100 reaches it
through ILT 00036917 with ECX receiver and two stack words. The first word
is unused; the second is compared unsigned against the primary node key.
The source keeps the existing opaque bank name; no semantic owner is claimed.
Actual-integer-RVA API preflight reports tier=placeholder and CONTRADICTED,
which is diagnostic only under the unchanged production tier policy.

The full 85-byte allocator at 0082E5F0 and its existing matched source prove
both calls free native STLport nodes, with sizes 16 and 12. Owner +4C is a
list of pointer/unsigned pairs; owner +48 is a list of pointers. Retail
retains the removed element's value reference after deallocation and uses
it to remove matching values from the second list. That witnessed behavior
is preserved rather than silently changing the algorithm.

The preferred native-list bank emitted 123/122 bytes with 84 differences.
Its allocator calls were imports, while retail calls the allocator directly.
The existing STLport `_STLP_USE_STATIC_LIB` configuration restores those
calls without adding pins: 121/122 bytes and 84 differences.

Retail loads the next iterator before unlinking, calls the allocator, then
assigns that saved iterator as the current cursor. Using the native return
of `list::erase`, with the pair reference bound before the key guard,
reproduces this schedule. This is a source lifetime/iterator correction,
not a register permutation or allocator wrapper. The final probe is exact
at 122 bytes with two relocations. All existing descriptive identifiers
were retained; no header, verifier, baseline or symbol-pin changes.

`add_match.py --replace-rva 0x0010EA60 --model gpt-6-astra` ran the strict
scoped build, which passed Functions 1/1, calls and relocation verification,
string/constant checks, DIR32 checks, and body guard. It replaced the dump
row and removed the old bank. The converted outcome was recorded once.

Raw evidence is build/worker3-round48/{base,static,erase_result}.{cpp,log},
retail.txt,measurements.json,add-match.log. The new source lives beside its
matched SaveGame callback forwarder, using an address-qualified filename.
