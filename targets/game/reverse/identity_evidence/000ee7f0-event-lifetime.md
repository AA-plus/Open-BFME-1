# 000EE7F0: event lifetime and caller contract

Retail has 279 bytes, ending in RET4 at +114. The dump name remains opaque.
Actual-integer-RVA oracle API: tier=placeholder, CONTRADICTED
(p_false=0.000391379220372593). This is not a real-name rejection and does not
establish a semantic name. No identity rename is proposed here.

## New evidence correcting the older attempt notes

- +26 adds 0x12C to the pointer loaded from this+4. +2B saves it at
  [ESP+4]. +38/+39/+48 subsequently push EBP/ESI/EDI, so the same saved
  pointer is [ESP+10] at +C8. It is neither an uninitialized third object
  nor a constructor output. The conditional check uses its +84 string.
- +75 constructs the local at [ESP+14] through ILT00019CF9 to000EDBB0.
  The matched DelayedLuaEventListConstructor.cpp establishes a vptr followed
  by three 24-byte BfmeDelayedLuaEvent objects, total76 bytes.
- +9D..+B3 calls the EH **vector destructor iterator**009F6D76, not array-new.
  Its arguments are local+4, stride24, count3, destructor ILT00041362
  (target000ED4A0). The subsequent base vtable01073744 store matches the
  independently decoded destructor000EDC40 (+1D..+41, RET+4C).
- The local exists only on the exhausted-list branch. Finding an alive object
  (Object+344 bit0 clear) with AI pointer Object+204 non-null branches from
  +61 straight to +C8, skipping construction and destruction entirely.
  The base-vtable store is cleanup of the event local, not construction of
  the receiver or proof of its class.
- +7E reads the incoming stack argument at [ESP+70]. The wrapper002E7650
  receives event7, this Object argument, and the local event-list address.
  The existing matched BfmeConv939.cpp signature supplies this contract.
- The direct caller001CEFC0 at +442 loads ECX from Object+23C, guards null,
  pushes ESI (the Object) at +44C, then calls ILT00030AA3 at +44D.
  This independently confirms a member call with one Object pointer and RET4.
  Its current ledger name InactiveBody destructor is not adopted as semantic
  evidence for this caller's actual owner.

## Native evidence and remaining integration dependency

TeamMemberQueries.cpp establishes Team head+0C and uses the existing
ObjectDlinkPmf.h implementation of the exact member-pointer triple
{ILT00001140, -100, 0}. The target's +3A..+73 list walk uses that triple.
Reference Team.cpp notifyTeamOfObjectDeath has the corresponding template
script check, but declares **zero arguments** and omits the BFME Lua event7
branch. Object.cpp likewise calls the zero-argument reference overload.
Therefore the reference method name/signature is not sufficient evidence to
repoint this retail body under that overload. name_oracle reports no witness
for Team+4; retain the address-qualified identity pending consolidation.

There are also two different existing event-list definitions:
DelayedLuaEventListConstructor.cpp models an empty nonvirtual base with an
out-of-line destructor, while GameLogicSendObjectCreated.cpp models a virtual
base destructor and novtable derived list with inline cleanup. The latter
explicitly documents the same000EDC40 cleanup sequence, but wholesale inclusion
also imports its private Object definition. It cannot simply be combined with
ObjectDlinkPmf.h without reconciling those type owners.

Actionable next step: establish a shared, independently verified event-list
constructor/destructor view and a Team member declaration accepting Object*,
then reuse the canonical Object PMF iterator and prove ScriptEngine's +3C
three-argument script call. Claim affected consumers and pay dependent/full
header gates if that repair is undertaken. Do not add a pin, guessed overload,
raw vtable adapter, or reinterpret the destructor iterator as allocation.

This round performs no byte trial or production edit. It resolves the prior
stack/lifetime ambiguities and identifies the precise native type/ABI work
required before a coherent source trial. t=5min model=gpt-6-astra lane=R
budget=30m blocker=callee/native-event-and-team-ABI
