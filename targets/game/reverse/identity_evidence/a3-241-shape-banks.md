# A3 lane 241: two improved diagnostic banks

These are banked attempts, not matched ledger claims. No production source,
symbol pin, shared header, data row or function-ledger row changed. Measurements
used MSVC 7.1 through `tools/probe.py`, with explicit complete retail extents.

## AICowerState::update, RVA 0x00174210

The constructor's table at VA 0x010991D0 identifies virtual slot 6. The ILT
oracle confirms `?update@AICowerState@@UAE?AW4StateReturnType@@XZ`. Complete
decoding ends at RET 0x0017435D, establishing 334 bytes.

The original bank emits 334 bytes with 115 non-relocation differences, measured
quality 0.6557. Expressing the voice-response path as
`if (canCauseCower && !ai->bfmeReady()) { ...; return STATE_SUCCESS; }`
followed by one `return STATE_CONTINUE` removes the duplicated return tail.
It emits 334 bytes with 21 differences, quality 0.9371 and normalized shape
0.991. The slot-44 guard at 0x0017428B jumps to 0x0017434A, whose epilogue
zeros EAX. The retained bank therefore also corrects that early return from
STATE_SUCCESS to STATE_CONTINUE.

The remaining normalized difference is the placement of `xor bl,bl`: the
compiler places it before slot 44; retail places it at 0x0017429A before the
recent-damage-source call. Delayed initialization and reusing the virtual-call
result emit 349 bytes with 170 differences. An empty flag constructor is
unchanged. A typed fastcall virtual dispatch worsens the build. Eight scratch
rotation toggles do not improve the retained result.

All nine old `/alternatename` pragmas were removed from the bank. The source
still requires callee/type reconciliation before promotion: the retail list
constructor, destructor and push-back targets currently have `list<int>` or
ShellMenuSchemeImage identities, while this caller uses DrawableList. Its
`isKindOf` declaration and the return types of the readiness and voice helpers
also need canonical integration. No aliases or replacement pins were added.
The existing AIStates.cpp census preview remains LINKED 0 -> 0.

Raw trials are under `build/a3_cower/`. The retained source is
`targets/game/reverse/attempts/0x00174210.cpp`.

## WoundArrowUpdate::update, RVA 0x0026E1F0

The independent identity, secondary receiver, callee-route and complete-boundary
evidence is in `0026e1f0-update-reconstruction.md` and
`0026e1f0-woundarrowupdate-update.md`. The ILT oracle confirms the native update
name. The last RET is at +0x135, followed by INT3, establishing 310 bytes.

| Trial | Bytes | Non-relocation differences | Quality |
|---|---:|---:|---:|
| Original bank | 310 | 42 | 0.8645 |
| Copy m_targetID into an int local before lookup | 310 | 14 | 0.9548 |
| Separate unitX=dx*inverse and unitY=dy*inverse locals | 310 | 28 | 0.9097 |
| Combine those two levers | 310 | 0 | 1.0000 |

The ID copy fixes the EDI/EBX receiver/AI mirror, register-save placement and
the later coordinate-pointer scratch register. The product locals put both
register multiplications before the module-data multiplier, as retail does.
The combined source has eight aligned relocation fields. Explicit receiver
aliasing is unchanged; volatile multiplier reads and sequential writes to the
position fields regress.

This exact diagnostic result has not passed a production gate. The existing
private `SpecialAbilityUpdate::onExit(bool,bool)` pin routes through ILT F975
to RVA 0x002A8540, but the ILT oracle reports CONTRADICTED, p_false=5.87e-04,
outside target slot 11952's windows 9215-9223. Integration stopped at that
refusal. No alternate callee name, forwarding declaration or pin was tried.
The existing WoundArrowUpdate.cpp preview is LINKED 0 -> 0, with four unresolved
base anchor methods. The exact bank adds no claimed LINKED or matched bytes.

Raw trials are under `build/a3_woundarrow/`. The retained source is
`targets/game/reverse/attempts/0x0026e1f0.cpp`.

Model: gpt-6.1-sol via Codex CLI. Date: 2026-10-11.
