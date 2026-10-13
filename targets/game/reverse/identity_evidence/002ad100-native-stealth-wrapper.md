# RVA 002AD100: native StealthUpdate wrapper

The retail entry starts at 002AD100 after INT3 padding. Both paths return;
the last RET is at 002AD138 and padding begins at 002AD139, proving 57 bytes.
`dis_retail.py 0x002AD100 57` and `callees.py` independently decode the complete body.

The entry retains incoming ECX in ESI, loads its Object pointer from +8,
and calls the existing relation resolver through ILT 00035995 (001CB0C0).
Both arms restore ECX from the unchanged ESI and call ILT 0001B04A, the
independently matched 693-byte `StealthUpdate::allowedToStealthAt002ACD90`.
The same receiver and its Object+8 field establish the StealthUpdate view.
The two arguments are canonical Object/Thing cached-position fields at +38.
The result from the proven boolean callee is returned unchanged. The method
keeps its address-derived name; no original lexical wrapper name is claimed.
The const declaration matches its read-only receiver use and the const callee.

The old bank uses invented field/receiver types and a void callee. It emits
52 bytes with 29 differences. The native boolean wrapper, canonical Object
layout, and existing typed callee emit all 57 bytes with three aligned calls.
Declaration-only and visible-callee probes are both exact: visibility is not
required. Replacing the local coordinate view with the canonical Coord3D
header and reading m_cachedPos directly preserves all bytes. The existing
693-byte callee remains independently exact with 36 relocations.

No new symbol pin, address literal, assembly, barrier, or shared-header edit
is needed. Probe evidence is in build/worker4-round2/{native,visible,canonical,
canonical-helper}.log. The strict scoped build passed both rows (57 and 693 bytes), one string
literal, eight DIR32 references, and both body guards without baseline debt.
