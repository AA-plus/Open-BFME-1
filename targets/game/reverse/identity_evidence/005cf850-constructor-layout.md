# ParticleSystem constructor at RVA 0x005CF850

The complete C++ candidate passes the strict scoped constructor byte gate, but remains banked as a partial because its private FX declarations conflict with the existing shared header. The assembly ledger row remains unchanged. Landing requires a separately authorized reconciliation of the shared declarations and verification of the resulting vtable and link behavior.

## Tested revision and hypothesis

The tested revision is `924c8d8d9ce6cde2faf82447550a1fc59ad99fbc`, using `gpt-6.1-sol`. All raw output and trial sources are retained in `build/particle-005cf850/`; compiler experiments and finite searches also retain their receipts under `build/experiments/` and `build/shape_search/`. The saved pre-dispatch body is retained as `trial-00-bank.cpp` and agrees exactly with its immutable pre-dispatch archive, as checked in `final-validation.log`.

The retry hypothesis was that the earlier structural drift came from incomplete member copies, missing nontrivial member and temporary lifetimes, an incorrectly modeled slave call, and missing inline manager insertion. The current matched factory, destructor, slave-creation helper, handle helpers and module-cleanup chain supply independently checkable evidence for these operations. A complete decoded helper touching different fields, a different hidden-return ABI, or measured shapes no better than the original bank would refute this hypothesis. The strict constructor comparison supports it. No new pin was added.

The Zero Hour twin and owning declaration were read in `inputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/GameEngine/Source/GameClient/System/ParticleSys.cpp` and its `Include/GameClient/ParticleSys.h`. BFME adds tracking handles, template-driven module construction and a manager list. The Zero Hour pointer members and manager links cannot be transplanted directly.

## Boundary, identity and ABI

`retail.txt` decodes the entire assigned extent. The last return is `ret 0xC` at +0x58F, ending at +0x592. All conditional branches remain inside this extent; there is no outgoing tail jump. `callees.log` is the unedited `checked_callees.py` result for the complete constructor.

The complete factory at RVA 0x005C33E0 allocates the object, supplies a template pointer, a dword ID and a dword stack slot carrying the boolean, and calls the constructor through its ILT. The constructor uses ECX as its receiver and returns that receiver in EAX. `caller-factory.txt` and `caller-null.txt` retain both complete callers. The installed vtable and the matched destructor independently identify global `ParticleSystem`.

The factory allocation, base constructor stores and compiler layout agree on the receiver layout. `helper-005c1dd0-decode.log` and its checked-callee log retain the complete base constructor. `helper-0005eee0-decode.log` retains its complete destructor, which releases the three base strings at +0x78, +0x68 and +0x10. Canonical `AsciiString`, `GameClientRandomVariable` and native `Matrix3D` declarations are used in the candidate.

The random helper returns its value in ST(0). The complete CRT conversion helper consumes ST(0) and returns the integer in EDX:EAX; the constructor stores its low dword. Their complete decoded bodies and checked-callee output are retained. The frame call has no stack argument and reads a dword result from EAX through virtual slot +0x68. The module-provider call separately passes the address of a tracking handle through virtual slot +0x08 and uses the dword pointer result. Concrete provider identities remain unknown; `ParticleTemplateSlotView` retains the original bank's descriptive name.

## Container payload and cleanup

The intrusive handle has owner, previous and next fields at offsets 0, 4 and 8. This follows from every read and write in the complete pointer constructor at RVA 0x005C2110, copy helper at RVA 0x005C2170, assignment at RVA 0x005C21D0, detach at RVA 0x001DA3F0 and destructor at RVA 0x001DA440. Their decoded bodies and checked-callee output are retained. The copy helper's actual extent ends at its last `ret 4`; the initial wider dump's following padding is not treated as code.

The complete slave helper at RVA 0x005CB220 writes this same three-field handle into caller-provided hidden return storage and returns the storage address. It cleans two stack arguments with `ret 8`. It is a direct call through ILT 0x0003A373, distinct from the module-provider virtual call. The original bank conflated these operations.

The manager insertion at constructor +0x503 allocates a node, then constructs the value at node +8. Its complete inline construction reads the source owner, writes all three value fields and joins the owner's tracking chain. The final splice uses the two node links and increments the manager counter. The payload is consequently an intrusive three-field handle; allocation size is not used as independent payload evidence. Native STLport `stl/_list.h` supplies `push_back`, `insert` and `_M_create_node`; `stl/_construct.h` performs placement copy construction; `stl/_alloc.h` supplies the allocation threshold. The allocator's complete retail body and checked callees are retained as `helper-0082e540-*.log`.

The member at +0x1B0 owns eight individual polymorphic pointers followed by a pointer vector. The complete destructor chain is RVA 0x005CDFF0, 0x005CDB10, 0x005CD660, 0x005CC980, 0x005CBD40, 0x005CB030, 0x005C9E30, 0x005C91C0 and terminal 0x005C6A40. Each intermediate destructor adjusts its second base by +4 with a null guard, destroys that base, and virtually deletes the first base's pointer with flag 1. The terminal destructor reads begin, end and capacity, walks four-byte pointer elements, virtually deletes them, and deallocates the vector storage. Both terminal return paths and all intermediate branches were inspected. The final candidate represents this chain with the existing address-derived class names and a native pointer vector. `helper-<address>-decode.log` and `helper-<address>-callees.log` retain every extent.

`eh-retail.log` retains the retail unwind map. `eh-map-26.log` checks every emitted predecessor and receiver adjustment against it and follows emitted destructor wrappers to independently decoded retail routes. The nine states cover the base, member string, two member handles, owned module chain, slave result, temporary current-system handle, module-construction handle and manager-insertion handle. Wrappers for `TrackingPtr` only tail-jump to the handle destructor. This verifies cleanup routing and ownership, without asserting that all emitted cleanup bytes or metadata addresses equal retail.

`name-oracle.log` records the current witnesses. Its +0x1A0 lifetime-counter witness conflicts with the complete matched destructor: `helper-005ce090-decode.log` loads that field into ECX, calls a detach helper and clears it. The existing destructor source independently uses the Zero Hour name `m_controlParticle`, which this bank retains. No shared witness or correction registry was changed.

The retail vtable order is destructor, load-postprocess, address-derived literal-name getter, `DoXfer`, update and create-particle. Direct ILT decoding establishes this order; it is different from a Zero Hour crc/xfer ordering. The final candidate corrects the destructor's protected access and uses the existing declared ABI for `DoXfer` and create-particle. The literal-name getter remains address-derived. Its final owner declaration and external binding are unresolved integration work, not an inferred real method name.

## Measurements and rejected shapes

The original bank is structurally incomplete. Typed triple copies and handle lifetimes substantially improved it. Native matrices and typed flags recovered the constructor's early store schedule. Canonical string assignment then reduced the remaining disagreement to the EH epilogue. Replacing hand-written node insertion with native STLport `push_back` removed that disagreement. Explicit module ownership and corrected vtable declarations preserved the strict constructor equality.

The finite EH searches and non-EH family search are retained in `eh-search.log`, `eh-single.log`, `family-search.log` and their corresponding `build/shape_search/` directories. Arbitrary `throw()` on the null-system helper was rejected because its complete body can allocate and construct. Copy visibility, explicit node insertion, body order and member-initializer experiments are retained individually; their raw probe results decide whether they improved the body. The incomplete canonical-header trial is retained as `trial-24-canonical-fx-header.cpp` with unedited compiler output in `probe-24.log`.

## Remaining blocker and reopening condition

The shared `game/GameEngine/Source/GameClient/System/FXParticleSystem/fx_particle_system.h` defines a four-byte `TrackingPtr` and a minimal `ParticleSystemInfo`. The independently decoded receiver and return storage require the larger layouts used by the bank. The full candidate compiled against that header fails on handle conversion, boolean conversion and construction, as retained in `probe-24.log`. Shared-header edits are prohibited in this assignment. The class registry gate does not register these FX types, so its pass does not resolve this explicit policy and ABI conflict.

Reopen for shared declaration reconciliation, the address-derived literal-name virtual binding, and a linked/scoped gate followed by any required full gate. There is no remaining mismatch in the constructor's strict scoped comparison. No assembly row was replaced, no source was landed, and no full gate or linked build was claimed.

## Final bank validation

The preferred bank is `targets/game/reverse/attempts/0x005cf850.cpp`. Its own probe and strict scoped gate pass, including recorded DIR32 addresses, constant references and DIR32 consistency; raw output is in `build/particle-005cf850/probe-bank.log` and `gate-bank.log`. `eh-bank.log` verifies its complete unwind routing. `check_csv-final.log`, `pin-check.log`, `class-bank.log` and `name-bank.log` retain the passing ledger, pin, registered-class and descriptive-name checks. The class pass only covers registered classes and does not clear the shared FX declaration blocker. The sole verdict row was written by `re_log.py`; `bank.log` and `run-receipt.json` retain its receipt. The banking tool preserves the old bank's exact bytes and the new measured bank in immutable history records.

## Measured trial table

The table below is generated from the retained probe output and measurement receipts. The score describes constructor byte similarity, not completion of declaration integration.

| Trial | Emitted bytes | Differing non-relocation bytes | First differing byte | Score |
| --- | ---: | ---: | --- | ---: |
| 02 | 1361 | 288 | +0xAF | 0.7525 |
| 09 | 1425 | 356 | +0xAF | 0.7496 |
| 13 | 1424 | 349 | +0xAF | 0.7539 |
| 18 | 1424 | 328 | +0xAF | 0.7686 |
| 19 | 1424 | 301 | +0x32F | 0.7875 |
| 21 | 1426 | 4 | +0x584 | 0.9972 |
| 23 | 1426 | 0 | None | 1.0000 |
| 26 | 1426 | 0 | None | 1.0000 |
| 27 | 1426 | 0 | None | 1.0000 |
