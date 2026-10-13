# 002C4EA0: repair command and copied object-list contract

This is new dependency evidence, not a byte-matched reconstruction. The fallback
picker serves this body; the previous records stopped at an anonymous owner.
The239-byte extent ends with RET8 at+0xEC. No named direct caller was found.
The existing address-derived dump name remains unchanged. Explicit integer-RVA
oracle result and tier are preserved in build/worker5-round41/preflight.json;
opaque-name diagnostics do not establish or reject semantics.

## Independently resolved behavior

- Receiver+8 supplies an Object pointer. The first two stack arguments are a
  target Object pointer and command-source enum. Call+0x30 routes through
  ILT000338D4 to matched ActionManager::canRepairObject at000C5230, consuming
  those three arguments. The global is TheActionManager, not a partition manager.
- Call+0x40 uses the source Object as receiver and reaches001BFE20 via0000D3B9.
  Its existing ObjectTeamAndPlayer.cpp body reads Object+0x1FC and calls that
  module's slot+0x68, returning the horde-contain interface. This resolves the
  old anonymous-module interpretation without guessing this function's owner.
- That returned interface's slot+0xEC supplies the list copied below. Slot+0xA0
  is called with each qualifying Object. These slots must be witnessed on the
  actual horde interface; the ordinary contain interface's contained-list slot
  in ObjectTeamAndPlayer.cpp is+0x104 and must not be substituted.
- Each node's+8 payload is an Object pointer. The object/template override path
  at+0x79..+0x8C resolves through existing Overridable::getFinalOverride at00087A80.
  The target tests bit0x4000 of the resolved template word+0xC8.
- Object+0x204 is its AIUpdateInterface. Receiver adjustment+0x20 then the call
  at+0xAE through00029C08 reaches matched AICommandInterface::aiRepair at00153D10.
  Its arguments are the original target Object and literal command source2.
  The original target's ObjectID at+0x74 is stored to wrapper receiver+0x348.
  The semantic name/owner of that receiver field remains unproven.

## List lifetime and the concrete binding dependency

Call+0x5F through000385F5 reaches001CB160, a111-byte list copy constructor.
It allocates a12-byte sentinel, writes self-links at+0/+4 and its address to
receiver+0, loads the source list sentinel through its reference argument,
and calls insertion001C53B0 via00004FFC. RET4 at+0x6C completes the constructor.

Insertion001C53B0 is66 bytes (RET16 at+0x3F followed by padding). Every iteration
allocates12 bytes, copies exactly the source node's payload dword at+8 into
new node+8, and links next/previous words. It does not copy or retain a pointee.
Thus this caller snapshots list nodes containing borrowed Object pointers;
it does not own or deep-copy Objects. The caller's unwind state becomes0 after
construction and returns to-1 before the list base destructor at000CEBD0 via
0000E68D. The destructive virtual operation during traversal explains why a
separate copied list must survive the loop.

The current constructor ledger is list<Gen_t_001cb160_p4cd>, a generated class
with declared constructor/copy/destructor, while insertion001C53B0 is named as
list<Drawable*> and the destructor is an authentic duplicate list<int> base.
Their byte-level contracts are compatible with four-byte payloads but do not
prove those conflicting source-level element identities. Reusing them as an
Object-list implementation by a function-pointer cast or adding alias pins
would hide the dependency. No such source or pin was introduced.

Next work: establish the exact horde interface+0xEC list declaration and+0xA0
operation from its vtable implementations and native owner header. Then reconcile
the001CB160/001C53B0 template identities with their other consumers and preserve
required original snapshots before correction. Use native list<Object*> copy
lifetime and canonical Object/AICommandInterface declarations for this239-byte
caller. The remaining receiver+0x348 field may retain an address-qualified
name; no guessed HordeAIUpdate method name is necessary. This is a coordinated
callee/interface dependency, not a reason to repeat anonymous-owner screening.
