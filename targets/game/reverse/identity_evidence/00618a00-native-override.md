# Native override access at 00618A00

The opaque Rva00618A00Object::rva00618a00(char) entry preserves the address:
the bank's BfmeStateHJ name has no independent semantic identity evidence.
Retail uses incoming ECX as receiver, reads the low byte of one stack argument,
and ends with RET 4 at 00618A6D. The next byte is INT3 at 00618A70, fixing
the full extent to 112 bytes.

The receiver accesses data pointer +4, holder pointer +C, flag +10, and floats
+14/+18. The native layout is witnessed independently by matched neighboring
Rva00618980.cpp and Rva00618A90Update.cpp. A nonzero +18 and zero argument
clear +18/+14 and restore the data's +10 color. Otherwise a clear +10 flag
and nonzero argument set +18 to 1 and clear +14.

ILT 000022BB targets matched const Overridable::getFinalOverride at 00087A80:
its next-override chain at +4 returns the final receiver. Canonical OVERRIDE
and Overridable headers supply this exact null/next-override path. ILT 0002C9DA
targets matched Rva007397E0(void *, float, float, float) at 007397E0: its
material-tree walk forwards the floats to VertexMaterialClass::Set_Emissive.
The caller passes holder+8 and three copies of the resolved data+10 float.
The old bank's four-pointer prototype is therefore incorrect.

The original bank probes at 112 bytes with two nonrelocation differences:
owner+8 is loaded/pushed in ECX instead of EDX. Replacing the manual override
walk, volatile receiver, dead volatile home, and pointer-shaped color with
native OVERRIDE and ordinary float state/call expressions matches all 112
bytes modulo the three relocation slots. No assembly, new pins, shared header
changes, or scheduling barriers are used. The data/holder view type spellings
come from the already matched neighbor; they assert no new semantic identity.
