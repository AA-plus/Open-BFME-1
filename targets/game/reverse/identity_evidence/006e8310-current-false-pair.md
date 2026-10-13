# 006E8310 exact-snapshot false pairing

This documents a token-alignment false positive, not a retail identity correction.
No meaning or retail spelling for Rva006E8310GlobalDataLayout is claimed.
The scratch extern declarations remain unbound.

Source before and after: `targets/game/reverse/attempts/0x006e8310.cpp`.
Before SHA-256 (exact UTF-8 bytes, including line endings): `f70354a9072e6aaca25459c6e6b31afba59ef45845ee790231b51077a508505a`.
After SHA-256 (exact UTF-8 bytes, including line endings): `db37d69ef29a2c211c772c065042bcc378991818f64fc605f8f4c62c8ff55efd`.

Both snapshots contain these unchanged declarations:

```cpp
Rva006E8310Rgb current[3];
Rva006E8310Rgb *current = reinterpret_cast<Rva006E8310Rgb *>(global + 0x9e0);
```

The member is at before line 32 / after line 35, and the local pointer at
before line 138 / after line 139. Thus neither `current` identifier was
renamed or removed. The global pointer name `Rva006E8310GlobalDataPtr` also
already existed in the before snapshot (macro at line 92 and use at line 132).
Its after declaration at line 95 replaces the absolute-address macro with an
explicitly unbound extern, retaining the same identifier.

The old loop stores `current->red`, `current->green`, `current->blue`, then
increments the local pointer (before lines 157-160). The new loop copies the
RGB aggregate through the reloaded global:

```cpp
Rva006E8310GlobalDataPtr->current[i] = color;
```

This is after line 153. Both names remain present in this expression/source;
there is no `current` to `Rva006E8310GlobalDataPtr` semantic rename. The check
paired tokens from the removed component stores with the existing global
pointer in the aggregate assignment. The correction covers only this exact
path/name pair and these two snapshots, as permitted by docs/naming_evidence.md.
The original refusal and staged patch remain in build/worker4-round45.

Round 46 independently checked HEAD and staged bytes after explicit coordinator
review authorization. No source shape, verifier, baseline, or prior outcome was
changed by this correction.
