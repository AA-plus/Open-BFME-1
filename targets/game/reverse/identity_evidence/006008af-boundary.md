# The assigned ParticleSystem extent is not a function

At revision `0e870b1d394ea3d4aea6c73defabb6b0f154dcb1`, the row named `?generateParticleInfo@ParticleSystem@@IAEPBVParticleInfo@@HH@Z` claims 1257 bytes starting at RVA `0x006008AF`. Decoded instructions refute that entry and extent. The row remains unchanged because correcting a landed identity and splitting its extent require a separate coordinated audit.

## Boundary and ABI evidence

The enclosing body starts at `0x00600890`. It saves ECX, ESI and EDI, reads one stack argument into ESI, preserves its receiver in EDI, initializes two version bytes and makes a virtual call at slot `0x28`. The assigned entry is its instruction at `+0x1F`, after that call. Its remaining instructions push ESI, set ECX to EDI plus `0x0C`, call ILT `0x0000BA19`, restore the three saved registers and execute `ret 4`. Those restores require the preceding prologue. Entering the fragment as the claimed two-int thiscall function would neither initialize EDI nor return through the incoming return address.

Complete linear decodes and a review of every branch and return establish the following partition. Each listed body's conditional branches stay on instruction boundaries inside its extent. None has an outgoing tail jump.

| Start RVA | Complete size | Return instruction | End RVA |
|---|---:|---|---|
| `0x00600890` | 46 bytes | `+0x2B: ret 4` | `0x006008BE` |
| `0x006008D0` | 178 bytes | `+0xAF: ret 8` | `0x00600982` |
| `0x006009B0` | 440 bytes | `+0x1B5: ret 4` | `0x00600B68` |
| `0x00600BE0` | 440 bytes | `+0x1B5: ret 8` | `0x00600D98` |

The gaps before the latter three entries contain only INT3 instructions: `0x006008BE..0x006008D0`, `0x00600982..0x006009B0` and `0x00600B68..0x00600BE0`. The claimed interval therefore contains one function's suffix, padding and three independent bodies. Instruction alignment at the final endpoint cannot make that interval one function.

The initial ILT routes `0x00044D37` to `0x00600890`, `0x00046E48` to `0x006008D0`, `0x00049184` to `0x006009B0` and `0x0000FB50` to `0x00600BE0`. Actual calls through those thunks were validated on instruction boundaries in complete decoded callers. In particular, the matched factory at `0x005E7AD0` pushes its receiver and a stack argument before calling `0x00046E48`; the matched factory at `0x005E7940` passes its receiver minus `0x14` to `0x00049184`; and the matched constructor at `0x005E78A0` passes both incoming arguments to `0x0000FB50`. These agree with the recipients' stack cleanup and constructor vtable stores. Their owner identities remain address-derived. No raw E8 or E9 candidate in the baseline's text section reaches `0x006008AF`. That negative scan alone is not proof about indirect calls; the positive prologue, stack and padding evidence establishes the boundary error.

The two EH prologues belong to different complete bodies. `eh_info.py` finds three unwind states for `0x006009B0`: cleanup of the receiver through `0x005E9B90`, its member at `+8` through `0x005EA180`, and its local handle through `0x001DA440`. The body at `0x00600BE0` has one unwind state that cleans its receiver through `0x005E4E40`. These observations do not certify the unidentified constructors' declarations or cleanup semantics. No constructor recovery is claimed.

The cleanup recipients were decoded completely. The first two only reset vtable words. The third clears the intrusive node's links. The `0x005E4E40` recipient resets vtable words at receiver offsets `0x18`, `0x14` and zero, then adjusts ECX by four and tail-jumps through `0x00013994` to the already decoded unlink helper. Both of its conditional paths perform that same tail transfer. No element destructor or STL payload type is inferred from these bodies.

## New evidence and measured experiments

The previous attempt had no saved C++ body and described `0x005D0530` as a generated dump. The current ledger instead points there to `game/GameEngine/Source/GameClient/System/ParticleSystem_generateParticleInfo_BFME.cpp`. Its body was read alongside Zero Hour's `GeneralsMD/Code/GameEngine/Source/GameClient/System/ParticleSys.cpp` and the owning declaration in `ParticleSys.h`. BFME uses a heap ParticleInfo, returns position and velocity by value and stamps additional module values into the result. The position-before-velocity order, transform and inter-frame adjustment, lifetime, accumulated-size clamp and emitter-position sequence remain recognizable from Zero Hour.

The complete matched `ParticleSystem::DoXfer` body at `0x005D0D70` pushes `1` and `0`, restores its own receiver into ECX and calls `0x00019F6A` at `0x005D0FDE`. That thunk jumps to `0x005D0530`. The recipient reads both arguments, returns its ParticleInfo pointer in EAX and ends with `ret 8`. The caller later releases that result through virtual slot zero. This supplies caller and source identity evidence independently of the donor's filename. It does not prove every module's payload type or indirect-call identity, and no new recovery at that address is claimed.

Complete decodes of the actual position helper at `0x005C36C0` and velocity helper at `0x005C3630` confirm hidden return storage. Their zero-result paths write all three dwords at output offsets zero, four and eight, return that output address in EAX and clean twelve or eight stack bytes respectively. Their nonzero paths forward the same output storage and return it after the call. The particle body supplies that storage and copies all three fields into its result. The complete 77-byte constructor at `0x005CEFC0` also performs the same vtable and field initialization that the particle body inlines. These are ABI and field-access observations, not an inference from allocation size or a callee name.

Two complete C++ snapshots were compiled with the repository's MSVC 7.1 toolchain. The first is an unedited snapshot of the landed BFME source; the second changes only the generated method's return qualification to `const ParticleInfo *`, matching the assigned assembly symbol. Each probe explicitly used the assigned size. These are identity and boundary experiments, not register or x87 spelling trials.

| Experiment | Retail extent | Compiled size | Probe result |
|---|---|---:|---|
| Landed source snapshot | `0x006008AF`, 1257 bytes | 844 bytes | 763 overlapping non-relocation differences, first at `+0`; 413 additional bytes missing; 14 relocation sites do not align |
| Const-return snapshot | `0x006008AF`, 1257 bytes | 844 bytes | Same differences, missing bytes and relocation drift |
| Same const-return snapshot, positive control | `0x005D0530`, 844 bytes | 844 bytes | Exact modulo relocation operands |

The first mismatch is `push esi` in the assigned fragment versus `sub esp, 0x18` in the complete C++ entry. Changing return qualification does not change that shape. The mismatching interval cannot be ranked as a partial reconstruction of a complete function, so no partial bank or recovery score is asserted. Both snapshots and unedited probe outputs are retained under `build/particle-006008af/` for collection. The first wrapper failed while displaying already-saved output; its subprocess receipt records a successful compiler and probe exit.

## Checks and reopening condition

`tools/check_csv.py` passed before investigation. The existing assembly passed the scoped byte gate, including its recorded DIR32 operands and body guard. That pass certifies the existing dump's bytes, not its name or boundary. `checked_callees.py` decoded the assigned extent, all four enclosing bodies, all seven direct helper bodies from the assignment, the existing particle body and the relevant complete callers. No source, pin, ledger extent, shared header or baseline was changed. A full gate is unnecessary for an evidence note and attempt record.

The optional source-claim check refused the scratch snapshot because no ledger row points to that scratch path. The optional name-regression invocation with two filenames could not run because this checkout's tool treats its arguments as Git revisions. Neither result certifies a proposed source landing; there is no source landing in this change.

The baseline SHA-256 was independently measured as `1fbdc0ced8f283732c094c4f0804ce8dc1e3e3675b720bcab066c94fed964e75`, matching its manifest. Raw evidence is retained in `build/particle-006008af/`: `assigned-disassembly.log`, `assigned-callees.log`, per-RVA complete disassembly and callee logs, `structure.log`, `callers-with-thunks-validated.log`, complete caller logs, both EH logs, `probe-01-assigned.log`, `probe-02-const-assigned.log`, `probe-03-positive-control.log` and `gate-assigned-assembly.log`.

Reopening requires authorization to audit and retire or partition the stale assembly row, then separately assign a proven complete body. A decoded independent entry at `0x006008AF` with compatible callers, a balanced prologue and epilogue, and control flow explaining the intervening returns and padding would refute this finding. No such evidence was found. Newly landed callee pins and layouts cannot repair this extent.
