# d_00734CB0: retail inlined-math term trees vs MSVC 7.1 slot reallocation (bank 0.9589)

RVA `0x00734CB0`, ledger 3285 bytes, body
`?loadTreesInVertexAndIndexBuffers@W3DTreeBuffer@@IAEXPAV?$RefMultiListIterator@VRenderObjClass@@@@@Z`
(ret 4 at +0xCD2). Bank in `targets/game/reverse/attempts/0x00734cb0.cpp` measures
3285/3285B, 36 aligned relocations, 135 non-relocation diffs, first at +0x1AF, score 0.9589.

## Retail term trees (new this pass)

`postMul` row windows decode to a rotated term tree, rows computed in order Y,Z,W,X:

* col Y/Z/W: `((a[r][2]*b[2][c] + a[r][0]*b[0][c]) + a[r][1]*b[1][c])`
* col X:     `((a[r][2]*b[2][0] + a[r][1]*b[1][0]) + a[r][0]*b[0][0])`
* `a[r][1]` is register-resident (last `fmul` uses an x87 stack copy, `fld st(n)`).

Assignment order `a[r][0]=tmpX; a[r][1]=tmpY; a[r][2]=tmpZ; a[r][3]+=tmpW;` with
tmpY,tmpZ,tmpW,tmpX evaluated in that order.

## Measurements (all 3285B unless noted; probe/diff_region tools)

| variant | spelling | result |
| --- | --- | --- |
| bank | `transform.postMul(rotation)` (WWMath matrix3d.h body) | 135 diffs |
| p3 | TU-local `__forceinline` helper with retail tree | 975 diffs; row0 window +0x4A9..+0x548 matches retail instruction-for-instruction (`build/a7wg/sig.py`), but prologue slots shift +4 from +0x31 on |
| p4 | macro at call site with the same tree | 940 diffs, same +4 slot shift |
| v5/v11 | inline at call site with `float tmpX...` temps (block / no block) | 3301B, 1984 diffs |
| v9 | p3 helper defined but unused | 135 diffs (neutral) |
| v10 | p3 with temps declared Y,Z,W,X order | 975 diffs (identical) |
| v12 | helper taking `Matrix3D *self` | does not compile (`Matrix3D::Row` is protected) |

Slot fingerprints (`build/a7wg/slots.py`): the bank's `[esp+N]` set equals retail's
exactly (68/68 slots, all first-use offsets identical); p3's set has 67 slots, missing
0x10/0x20 with the low range shifted +4 and the Matrix3D `transform` local moving
0x24 -> 0x28.

## Conclusion

The rotated term tree is reproducible in isolation, but in MSVC 7.1 the scalar slot
allocation is coupled to the inlined body's evaluation order: any spelling that emits
the retail tree reallocates the whole low frame (+4) and cannot be re-anchored from
source (frame size stays 0x144; declaration order, helper vs macro vs inline, and
unused-helper presence are all neutral). Remaining residue also includes three
light-product `fld lightScale`/`fmul diffuse` order clusters (+0x1AF..+0x206) and two
SIB/operand-order bytes (+0x7AA, +0xA41) not source-controllable. Bank retained.
