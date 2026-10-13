# 0x00766AA0 mesh-geometry forward body (MASM dump)

Retail 0x00766AA0, 3386 bytes: the body's `ret 0x10` sits at +0xD37
(VA 0x007677D7) and INT3 padding starts at VA 0x007677DA, fixing the extent.
Carried by the gen-dump row
`?d_00766aa0@@YAXXZ,matched,gen-dump;ghidra=FUN_00b66aa0` in
`game/gen_asm/d_0075fb90.asm`. The extent is fixed by the row and by the
landed callers; the C++ bank compiles to exactly 3386 bytes.

Identity is address-derived. The two landed callers
(`?forwardString@Rva00769B60Interface@@...` at 0x00769B60 and
`?forwardString@Rva00769C30Interface@@...` at 0x00769C30, both
"StringForwarder" TUs) call this receiver through ILT 0x00012C92; symbols.csv
already pins the spelling
`?forward00769C30@Rva00766AA0Owner@@QAE_NPAURva00766AA0Buffer@@VAsciiString@@PAPAX2@Z`
(Rva00766AA0Owner = address-derived class token). ABI proven by the callers
and by the body: ECX receiver, nullable output record at arg1, by-value
AsciiString arg2 cleaned by two
`?releaseBuffer@?$StringBase@D@@AAEXXZ` sites, two pointer outputs arg3/arg4,
bool in AL, `ret 0x10`.

Behavior (see 00766aa0-geometry-recovery.md for the full recovery): vtable
slot 0xB8 root, `RenderObjClass::Get_Sub_Object_By_Name` with the narrowed
string, sub-object slot +0x14, CLASSID_MESH check, Z-extrema scan of the
ShareBuffer vertices with two-percent end bands (globals 0x0107C6EC and
0x0107533C), averaged extremity widths, optional cached-matrix translation
path (BfmeCalc919G), matched AttachmentTransform adjust, four rounded
transformed corners through world[0][*]/world[1][*]/world[2][*] dot products,
`__ftol2` rounding, and the two-polygon perpendicular fallback.

Why a MASM dump: the measured C++ bank
`targets/game/reverse/attempts/0x00766aa0.cpp`
(sha256 b16bac99e0a38184fe191a7f7c5c515ad29670fc01ca6e39ceb7458ff587d78e,
author score 0.9758) compiles to exactly 3386 bytes with 36 relocations
(144 bytes) and normalized shape 1.000. Its whole residue is 82
non-relocation bytes:

* 28 bytes at +0x15C..+0x1F8, the matrix-copy scratch-register rotation:
  retail uses ECX for the first `mov ecx,[eax+0xc]` and then alternates
  EDX/ECX through the 12-word copy, while VC7.1 starts one round-robin step
  earlier with EAX and then alternates ECX/EDX (same instructions, same
  slots, one rotation step behind from the `cached` matrix copy through
  `lea ecx,[esp+0x9c]`/`push ecx`).
* 54 x87 bytes from +0x828 to +0xC09 (clusters +0x828..+0x834,
  +0x8DA..+0x91A, +0x936..+0x94A, +0x98F..+0x9A5, +0xA44..+0xA5A,
  +0xAF9..+0xB0F, +0xBFD..+0xC09): the four corner dot products and the
  fallback band dot products use identical products on identical stack
  slots in a different x87 evaluation order. At +0x8DA retail sums the
  z-term first: `fld [esp+0x30]; fmul [esp+0x74]`, then y
  (`fld [esp+0x2c]; fmul [esp+0x70]`), then x
  (`fld [esp+0x28]; fmul [esp+0x6c]`), i.e. ((z*m2 + y*m1) + x*m0) + w;
  VC7.1 emits x*m0, z*m2, y*m1. The two-factor Length2 sums at +0xBFD are
  the same reversed pair.

Shapes measured before banking (8 recorded verdicts on this address plus this
session): full TU re-spellings of the matrix copy (assignment vs construction,
translation getter by value/reference/local, aliased vs distinct
Transform_Vector outputs), 14 head spellings of the edge-broadcast/bounds
prologue, accessor inlining (size()/begin(), ShareBuffer Get_Count), matrix
member reload vs cached local, twelve reversed statement-chain corner dot
products, mulVector3/returning-vector helpers, the 128-combination EH lever
sweep via eh_levers.py, and this session's probe plus
tools/rotation_sweep.py (38 toggles over call arguments, member-call
receivers, initialisers and single-use locals: none moved a byte) and the
/G7 /Ob1 /Oi /Op flag checks. The residue is compiler-internal in both
classes: an allocator round-robin phase and x87 operand scheduling.

The dump (`game/masm_dumps/Rva00766AA0GeometryForward.asm`) is the verbatim
symbolic lift of the gen-dump body under the pinned name; it is byte-identical
to retail outside its relocation slots.
