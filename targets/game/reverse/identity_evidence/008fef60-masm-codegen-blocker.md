# 0x008FEF60 material texture-slot swap -- MASM landing with a measured codegen blocker

Target: RVA 0x008FEF60..0x008FF054, 244 bytes, name
`?Rva008FEF60Method@@YA_NPAVRenderObjClass@@PAPAVTextureClass@@H@Z`
(address-derived). Source: `game/masm_dumps/Rva008FEF60MaterialTextureSwap.asm`,
converted from the gen-dump row `?d_008fef60@@YAXXZ` in
`game/gen_asm/d_008fa4b0.asm` (notes: gen-dump;ghidra=FUN_00cfef60).

## Identity

Address-derived on purpose: no string or detected caller names the owner, so
the class and the argument list keep the address token. The one non-local
caller is the landed 0x008FF060 water-material body
(`game/Libraries/Source/WWVegas/WW3D2/Rva008FF060WaterMaterialTextureSwap.cpp`),
whose retail call at +0x9F reaches this body with the receiver in ECX, the
`TextureClass**` in EBX and the index on the stack; its row byte-gated the
additive pin in `targets/game/reverse/symbols.csv` (line 13958). The body
matches retail through `RenderObjClass`'s proven vtable slot 0x150
(`Get_Material_Info`), the `BfmeHandleCX` smart-pointer destructor shape and
the landed `Bfme5TextureArray::bfmeSetSlot` store.

## Body and ABI (first-hand)

SEH frame `push -1; push g_Va0105AC08`. Null-checks receiver and source slot,
fetches the material through vtable +0x150, rejects `material->+0x30 <= index`,
then takes `Mesh_Self()` and pulls `Get_Texture(index)`; if the held texture
already equals `*src` it releases one reference (deleting the material when the
count hits zero) and returns false, otherwise it routes the handoff through
the 0x0092C3E0 trampoline, stores the slot via `bfmeSetSlot`, releases the
count and returns true.

## Why this lands as a MASM dump (measured)

The reconstructible C++ body (`targets/game/reverse/attempts/0x008fef60.cpp`,
sha256 4c5cb625bc48126b78a94018bbcf3bcb52a59913b5c5e493033b2aeb3db45922,
embedded at the end of this file) compiles to exactly 244 bytes with 11
relocations and shape 1.000. Its whole residue is ONE non-relocation byte at
+0x7A:

- +0x79 retail: `75 0a` (`jne` from the handle-test at +0x66 reaching +0x85;
  ECX is still live from the +0x66 load)
- +0x79 ours:  `75 06` (the C++ build's ECX reload joins earlier, at +0x81)

The `!!` sequence at +0x91 is inside a relocation slot, not residue.

Measured 2026-09-28..2026-10-13: ~30 formulations -- if/else and inverted
orders, prefix/postfix decrement, named bool result, count local and count
reference, explicit destructor bodies (accessor, early-return), five
`_Read/WriteBarrier` placements around the handle stores -- plus the
/G5 /G6 /G7 /Ob1 /Os /Ot /Oa /Ow /Og /Oy- /Gs /GF flag sweep all leave that
single byte unchanged or worse: a block-merge / register-liveness choice, not
source-spellable. Blocker class: branch-target join tie-break at the handle
test (reload absorbed vs kept-live ECX).

The dump body is byte-identical to retail outside its relocation slots
(`tools/probe.py` on the bank prints `size ours=244 retail=244 relocs=11`,
`diffs 1 non-reloc byte(s); first at +122` and `shape 1.000`; the retail call
at +0x91 in the side-by-side is one of the slots). The 11 slots cover the SEH
frame (`g_Va0105AC08` and the `__except_list` accesses) and the four calls
`?j_000366dd@@YAXXZ`, `?Release_Ref@TextureClass@@QAEXXZ`,
`?invoke@Rva0092C3E0@@QAEXXZ`,
`?bfmeSetSlot@Bfme5TextureArray@@QAEXHPAPAVTextureClass@@@Z`; all scoped
checks pass.

The TU copy under `game/Libraries/Source/WWVegas/WW3D2/` used while measuring
was scratch (never matched) and has been removed; the dump header's reference
to it is historical, the bank below is the authoritative copy.

## Reopen condition

Only with a C++ reconstruction that compiles byte-identical, or a detected
caller/string that names the owner class and proves the private EBX argument
convention.

## Banked C++ (sha256 4c5cb625bc48126b78a94018bbcf3bcb52a59913b5c5e493033b2aeb3db45922)

```cpp
// ?Rva008FEF60Method@@YA_NPAVRenderObjClass@@PAPAVTextureClass@@H@Z
// partial score=0.9959016393442623 date=2026-09-28
// ?Rva008FEF60Method@@YA_NPAVRenderObjClass@@PAPAVTextureClass@@H@Z
// partial: 244 bytes; one differing branch displacement at +0x7A (2026-09-28).
// ?d_008fef60@@YAXXZ
// cl: /DNDEBUG /MD /EHsc
//
// Address-derived method; the retail owner class is unknown, so the owning
// class and the ebx/index arguments keep the address token.  edi (this) is
// used only through RenderObjClass's proven vtable -- slot 0x150 is
// Get_Material_Info(), matched by the RenderObjClass layout in
// Rva008FEB90MaterialUnique.cpp/Rva00739B30RenderObjectUnique.cpp -- so this
// body swaps a MaterialInfoClass's texture at a given index for a caller-
// supplied TextureClass*, skipping the swap when the material's own bound
// field (+0x30) does not clear the index and reusing the neighbouring
// Bfme5TextureArray::bfmeSetSlot shape (Bfme5ReadyQueue.cpp) for the actual
// slot store.  The TextureClass** argument arrives in ebx with no stack
// load and no save/restore in the body -- a private register convention
// (docs/shape_levers.md). The semantic correction from the older stash is
// calling self->Mesh_Self(), not a virtual on MaterialInfoClass.

class MeshClass;
class MaterialInfoClass;

class RefCountClass
{
public:
	virtual void Delete_This();
	int m_ref_count;
};

// Exact copy of the proven RenderObjClass layout (85 virtuals, Get_Material_Info
// at +0x150) from the already-landed Rva008FEB90MaterialUnique.cpp.
class RenderObjClass : public RefCountClass
{
public:
	virtual void _bfme_ro_v1();
	virtual void _bfme_ro_v2();
	virtual int Class_ID() const;
	virtual void _bfme_ro_v4();
	virtual MeshClass *Mesh_Self();
	virtual void _bfme_ro_v6();
	virtual void _bfme_ro_v7();
	virtual void _bfme_ro_v8();
	virtual void _bfme_ro_v9();
	virtual void _bfme_ro_v10();
	virtual void _bfme_ro_v11();
	virtual void _bfme_ro_v12();
	virtual void _bfme_ro_v13();
	virtual void _bfme_ro_v14();
	virtual void _bfme_ro_v15();
	virtual void _bfme_ro_v16();
	virtual void _bfme_ro_v17();
	virtual void _bfme_ro_v18();
	virtual void _bfme_ro_v19();
	virtual void _bfme_ro_v20();
	virtual void _bfme_ro_v21();
	virtual void _bfme_ro_v22();
	virtual void _bfme_ro_v23();
	virtual void _bfme_ro_v24();
	virtual void _bfme_ro_v25();
	virtual void _bfme_ro_v26();
	virtual int Get_Num_Sub_Objects() const;
	virtual void _bfme_ro_v28();
	virtual RenderObjClass *Get_Sub_Object(int index) const;
	virtual void _bfme_ro_v30();
	virtual void _bfme_ro_v31();
	virtual void _bfme_ro_v32();
	virtual void _bfme_ro_v33();
	virtual void _bfme_ro_v34();
	virtual void _bfme_ro_v35();
	virtual void _bfme_ro_v36();
	virtual void _bfme_ro_v37();
	virtual void _bfme_ro_v38();
	virtual void _bfme_ro_v39();
	virtual void _bfme_ro_v40();
	virtual void _bfme_ro_v41();
	virtual void _bfme_ro_v42();
	virtual void _bfme_ro_v43();
	virtual void _bfme_ro_v44();
	virtual void _bfme_ro_v45();
	virtual void _bfme_ro_v46();
	virtual void _bfme_ro_v47();
	virtual void _bfme_ro_v48();
	virtual void _bfme_ro_v49();
	virtual void _bfme_ro_v50();
	virtual void _bfme_ro_v51();
	virtual void _bfme_ro_v52();
	virtual void _bfme_ro_v53();
	virtual void _bfme_ro_v54();
	virtual void _bfme_ro_v55();
	virtual void _bfme_ro_v56();
	virtual void _bfme_ro_v57();
	virtual void _bfme_ro_v58();
	virtual void _bfme_ro_v59();
	virtual void _bfme_ro_v60();
	virtual void _bfme_ro_v61();
	virtual void _bfme_ro_v62();
	virtual void _bfme_ro_v63();
	virtual void _bfme_ro_v64();
	virtual void _bfme_ro_v65();
	virtual void _bfme_ro_v66();
	virtual void _bfme_ro_v67();
	virtual void _bfme_ro_v68();
	virtual void _bfme_ro_v69();
	virtual void _bfme_ro_v70();
	virtual void _bfme_ro_v71();
	virtual void _bfme_ro_v72();
	virtual void _bfme_ro_v73();
	virtual void _bfme_ro_v74();
	virtual void _bfme_ro_v75();
	virtual void _bfme_ro_v76();
	virtual void _bfme_ro_v77();
	virtual void _bfme_ro_v78();
	virtual void _bfme_ro_v79();
	virtual void _bfme_ro_v80();
	virtual void _bfme_ro_v81();
	virtual void _bfme_ro_v82();
	virtual void _bfme_ro_v83();
	virtual MaterialInfoClass *Get_Material_Info() const;
};

class TextureClass
{
public:
	void Release_Ref(void);

	int m_bfme00;
	unsigned short m_bfmeRefCount;
};

// Same BfmeHandleCX-shaped ref-counted smart pointer Bfme5FiftyOne.cpp
// documents for Gen_007A0340::bfmeGet(), but specialised over TextureClass:
// the destructor here calls TextureClass::Release_Ref() (0x009EB7A0) rather
// than decrementing a raw field, so it keeps its own local copy.
class BfmeHandleCX
{
public:
	BfmeHandleCX(void) { m_bfmeThing = 0; }
	~BfmeHandleCX(void)
	{
		if (m_bfmeThing)
			m_bfmeThing->Release_Ref();
	}

	TextureClass *m_bfmeThing;			// +0x00
};

class MaterialInfoClass : public RefCountClass
{
public:
	virtual void _bfme_mi_v1();
	virtual void _bfme_mi_v2();
	virtual void _bfme_mi_v3();
	virtual void _bfme_mi_v4();
	virtual void *_bfme_mi_slot14();

	BfmeHandleCX Get_Texture(int index) const;

	char m_pad_08[0x30 - 8];
	int m_bfme30;
};

// The trampoline this body reaches through RenderObjClass::Mesh_Self() at slot 5:
// same shape as Rva0092C3E0::invoke() in IndirectMemberTailThunks.cpp, but
// THIS call site pushes two stack arguments the plain no-arg invoke() there
// does not model, so it keeps its own address-derived declaration.
class Rva0092C3E0Trampoline
{
public:
	void invoke(BfmeHandleCX *out, TextureClass **src);
};

// Reuses the already-landed Bfme5TextureArray::bfmeSetSlot body (Bfme5ReadyQueue.cpp);
// MaterialInfoClass's own Textures vector is layout-compatible at the offset that call reaches.
class Bfme5TextureArray
{
public:
	void bfmeSetSlot(int i, TextureClass **src);
};

// The TextureClass** argument arrives in ebx with no stack load and no
// save/restore -- a private register convention (docs/shape_levers.md).
// A static function with one TU-local, absent-from-retail caller lets
// MSVC 7.1 choose that convention for the extra parameter.
static bool Rva008FEF60Method(RenderObjClass *self, TextureClass **src, int index)
{
	if (!self)
		return false;
	if (!*src)
		return false;

	MaterialInfoClass *material = self->Get_Material_Info();
	if (!material)
		return false;

	if (material->m_bfme30 <= index)
		return false;

	Rva0092C3E0Trampoline *sink = (Rva0092C3E0Trampoline *)self->Mesh_Self();

	BfmeHandleCX handle = material->Get_Texture(index);
	if (handle.m_bfmeThing == *src)
	{
		if (--material->m_ref_count == 0)
			material->Delete_This();

		return false;
	}

	sink->invoke(&handle, src);

	((Bfme5TextureArray *)material)->bfmeSetSlot(index, src);

	if (--material->m_ref_count == 0)
		material->Delete_This();

	return true;
}

// absent from retail: forces MSVC 7.1's single-call-site register choice
extern "C" bool __fastcall Rva008FEF60Caller(RenderObjClass *self, TextureClass **src, int index)
{
	return Rva008FEF60Method(self, src, index);
}
```
