# 004C15D0 owning-value transfer: remaining witness

Round43 gpt-6-astra, read-only ABI investigation. The accepted coherent family bank remains unchanged at 678 bytes / three differences. No compile or expression trial was justified.

## What retail establishes

* The complete assignment004C1510 is 96 bytes, with RET4 at +43 and +5D. ECX is the destination handle address; one incoming stack word is the owned pointee. It deletes the destination's previous pointee through virtual slot0 with argument1, installs the incoming word, and returns the destination address in EAX. There is no reference-count increment or reference-count release instruction.
* Assignment FuncInfo RVA00E19450 has one state. Cleanup00C29060 computes the incoming argument address `[ebp+4]` and jumps via ILT000224D0 to00499F30. That complete13-byte destructor loads the pointer, null-checks it, and invokes deleting-destructor slot0. Thus the callee owns a nontrivial by-value argument during deletion of the old pointee; a bare-pointer assignment declaration would lose required exception behavior.
* Show004C15D0 calls clone via virtual slot1 at +1FD, with hidden return storage at `[esp+20]`. EAX returns the address of that result. At +200 it loads the owned pointer into ECX; +203 puts the newly reserved argument address in EDX; +205 clears the clone-result word; +20B stores the pointer into the argument. Assignment is called at +21B through ILT00048F63. Afterward the source temporary is still destroyed conditionally, normally observing zero. The bank emits the same operations and boundaries but swaps ECX/EDX in those three instructions.
* Show FuncInfo RVA00E19480 distinguishes the by-value argument cleanup00C2908B from the allocation cleanup00C29080. This is not evidence for an extra missing destructor state.
* Clone004C1AE0 is101 bytes ending RET4 at+62. It allocates16 bytes, copies three fields at4/8/C, installs vtableVA010FD964, stores its resulting pointer through the hidden result pointer, and returns that result pointer in EAX. Its FuncInfo RVA00E194A8 uses cleanup00C290B0: test return-object flag mask0x1 at `[ebp-10]`, clear it, load hidden result pointer from `[ebp+4]`, and jump to the same00499F30 destructor. This establishes return-object cleanup, not a unique C++ return type.

Full decodes and EH output are archived in the adjacent JSON. Existing source notes associating VA010FD964 with PartitionFilterPossibleToAttack are not used as identity evidence: the matched UI adapter caller explicitly rejects those inherited labels. The actual table's slot1 is VA0044526E, the ILT route to004C1AE0.

## Independent callers do not supply the missing type

A complete `.text` E8-target scan for004C1510 or its ILT00048F63 finds only call RVA004C17EB (show+21B). `callers_of.py 0x004C1510` reports no directly reaching named caller. This scan does not exclude arbitrary indirect calls, but supplies no second consuming-assignment source witness.

The matched `ControlBarRva004C1B60.cpp` constructs a stack UI adapter and passes its address to show. `BfmeConv1941.cpp` supplies another message adapter; `Rva003BF540_applyOwner.cpp` constructs a text/id adapter for show. They prove the receiver and adapter interface use, not clone's exact return-handle type or assignment conversion. The matched `ControlBarRva004C1510Handle.cpp` independently reproduces assignment with a consuming by-value object, but no matched caller spells that object conversion. Its address-derived model must not be promoted into a guessed retail class identity.

Actual-RVA oracle API checks record show tier=invented and assignment tier=placeholder. Both diagnostic verdicts are CONTRADICTED and neither claims a retail spelling under the existing real-name guard. No names or guards were changed.

## Missing witness and disposition

What remains missing is a native declaration or independently matched transfer caller establishing whether clone returns the same owning specialization, a distinct converting specialization, or another proxy with the observed cleanup/lifetime rules. The machine contract alone does not select among those source constructions. The prior history already tested same-type elision, distinct converting return handles, pointer conversion, const-copy and multiple constructor shapes; this investigation adds no reason to repeat them. Clone itself remains unmatched: prior direct temporary return loses25 bytes of return-cleanup machinery, while named-result forms add unwanted copies.

Retain the0.9956 four-body bank and round41 ownership transaction. Investigate a genuinely new native handle declaration or matched clone-family return implementation before another caller trial. No source, pin, local-data owner, baseline, identity or verifier change is warranted by the evidence gathered here.
