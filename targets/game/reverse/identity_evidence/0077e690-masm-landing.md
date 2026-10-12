# RVA 0x0077E690 — W3DTankDraw::doDrawModule — MASM dump landing

Identity: the matched constructor at RVA 0x0077F050 installs vtable VA 0x01125AB0
whose slot 9 is ILT RVA 0x00010A9B; the ILT jump reaches this body. `tools/ilt_oracle.py
check '?doDrawModule@W3DTankDraw@@UAEXPBVMatrix3D@@@Z' 0x00010A9B` returns
CONFIRMED p_false=5.22e-04 (exact). The body consumes the thiscall receiver in ECX
and returns with a single `ret 4` at +0x311; the 788-byte extent ends there
(+0x314), matching the ledger size.

Codegen blocker: VC7.1 /O2 C++ reaches 782/788 at best. The two particle-handle
copies keep the X and Z values in EBX/EBP opposite to the source form; six bytes
differ at +0x14E +0x153 +0x165 +0x16A +0x19E +0x1A3 after 40+ spellings, including
the BFME2 donor port (771B), the donor compile flags /O1 /G7 /arch:SSE (771B), the
intrinsic form, volatile handle variants and a generated register-lifetime search.
Every other instruction in the extent reproduces exactly; removing either the Y
write or the tread-counter increment does not reproduce retail. Details:
0077e690-bfme2-donor.md and 0077e690-finishing-abi.md, banked source
targets/game/reverse/attempts/0x0077e690.cpp.

Landing: game/masm_dumps/Rva0077E690TankDrawDoDraw.asm is the symbolic lift of the
gen-dump body verbatim, with the scaffold's EXTERN header reduced to the symbols
this body uses. Twelve HIGHLOW sites are symbolic: two ?FadeTacticalView dwords,
two ?TheBfmeGlobal_012f076c dwords, one ?g_bfmeADL, two ?g_bfmeScaleBK, three
?BfmeSubdualCapERD and two __real@3727c5ac; fourteen calls route through the
?j_ ILT thunks. `tools/probe.py` reports EXACT (modulo relocation slots), size
788/788, matching the replaced gen-dump row ?d_0077e690@@YAXXZ at 0x0077E690.
The pre-existing symbols.csv pin ?b_0077e690@@YAXXZ at the same address stays; the
gthunks_017 shim j_00010a9b continues to resolve through it.
