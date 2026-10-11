# Retry of the camera restore body at RVA 0x0073D6D0

The tested revision is `21818a0064b47525ab98799e08aea4648da87852`. This retry recovered no source bytes. The existing bank `targets/game/reverse/attempts/0x0073d6d0.cpp` is retained byte for byte, including its descriptive names and line endings. Its SHA-256 is `d0954183296a546c660e8a1143816697586c948f22ce17bc4acefb6bb52761e0`.

## Outcome and reopening condition

The retained body emits 306 bytes. The probe reports 12 masked differences and two displaced relocation sites. Resolving every external address independently leaves 20 differences at every offset from `+0x3A` through `+0x4D`, giving an independently equal fraction of 286/306 (0.9346405229). The masked diagnostic fraction is 294/306 (0.9607843137). `build/0073d6d0-retry/scoped-bank-gate.log` retains the unedited scoped gate output and the independent relocation mapping. The normal function comparison fails 1/1. The three float-constant references pass.

Reopen with evidence for a different restore access structure or with a complete caller that establishes the target return contract and unused argument. A CPU switch, a simple visible setter, a combined restore expression, a chained desired-height assignment, or more explicit padding-field types did not improve this bank. The scalar setter experiment does not establish an angle identity.

## New hypotheses and refutation

The neighbouring landed View constructor, W3DView constructor and camera methods supply a base layout and float field context to check against the saved reconstruction. The new scheduling hypotheses were that a visible canonical scalar setter, the CPU scheduling context, a shared snapshot assignment, or fully typed intervening base fields would allow the compiler to preload the next scalar before the previous store. Their refutation condition was an unchanged or worse first-divergence region at the proven retail extent. The table below records the measured refutations; every listed source and unedited probe log is preserved under `build/0073d6d0-retry/`.

| Experiment | Emitted bytes | Masked differences | First byte difference | Raw output |
|---|---:|---:|---|---|
| Original bank | 306 | 12 | +0x3A | `00-baseline-probe.log` |
| Pentium Pro scheduling (/G6) | 306 | 12 | +0x3A | `01-cpu-g6-probe.log` |
| Pentium 4 scheduling (/G7) | 305 | 226 | +0xF | `02-cpu-g7-probe.log` |
| Visible scalar setter (discarded as a native angle identity) | 306 | 12 | +0x3A | `03-visible-angle-probe.log` |
| Combined restore expression | 306 | 12 | +0x3A | `04-restore-expression-probe.log` |
| One snapshot expression assigned to desired height and zoom | 309 | 214 | +0x18 | `06-shared-height-probe.log` |
| Explicit types for the otherwise padded View fields | 306 | 12 | +0x3A | `07-typed-base-probe.log` |

The complete ten-byte `View::setAngle` body at RVA `0x000C8EF0` writes receiver offset `+0x28`, and the complete pitch setter at `0x0045B570` writes `+0x2C` with a clamp. Neither is a native setter for the disputed `+0x3C` store. Trial 03 is therefore only an equivalent opaque scalar-store wrapper experiment and is discarded as semantic evidence. This corrects the initial setter hypothesis rather than renaming an existing bank member. `decoded-setters.log` and the corresponding `checked-*.log` files retain the instruction evidence. The reference `View.h` and landed `ViewConstructorBfme.cpp` suggest minimum height at `+0x3C`, zoom at `+0x40`, desired height at `+0x50`, and FOV at `+0x6C`; the bank keeps its inherited field names.

## Boundary, indirect targets and ABI

The target is a complete 306-byte body with a single `ret 4` at RVA `0x0073D7FF`, ending at `0x0073D802`. Every conditional branch and local jump stays in that extent. It has no direct calls, EH registration, cleanup path or external tail jump. `decoded-bodies.log` contains the complete target and each evidence helper; `checked-0073d6d0.log` contains the checked inventory. Container and constructor ownership checks are not applicable to the target.

The constructor-installed primary table at VA `0x011217A0` reaches this target at slot 150 through the complete ILT at RVA `0x00003102`. Its outgoing owner calls are slot 103 (reset at `0x0073F960`, 72 bytes, no stack argument) and slot 117 (setter at `0x0045BF90`, 13 bytes, full dword argument, `ret 4`, receiver field `+0x88`). The embedded table installed by `0x006DF550` routes slots 1, 2 and 3 to the complete float getters at `0x006DF5A0`, `0x006DF5B0` and `0x006DF5C0`. They read `+0x08`, `+0x0C` and `+0x10` respectively, return in ST0 and consume no stack arguments. The target receiver passed to those getters is exactly `this+0x24B8`. `vtable-routes.log` preserves these decoded routes.

Terrain slot 6 routes through the complete 59-byte `0x006BE250` forwarder. Its no-render-object path returns a float with `ret 12`, and its nonnull render-object path tail-jumps through render slot `+0x248`. The installed BaseHeightMap table routes that slot to the complete 957-byte `0x006CBB50` body. All three return paths consume 12 bytes and return in ST0; the first two arguments are read as floats and the optional normal consists of three float writes. The complete target, forwarder and terminal helper agree with the bank argument order and receiver handling. The current named terminal helper is independently checked; its ledger identity alone is not relied on.

The complete 530-byte snapshot writer at `0x00743CE0` writes all six snapshot addresses consumed by the target. The complete 977-byte owner constructor confirms the base offsets and the embedded object location. The owner constructor has EH machinery, but this retry writes no constructor or cleanup code and makes no new constructor ownership claim. The bank has no allocation, container or owning member operation.

The target does not read its incoming stack word, and no hidden return storage is observed. The original unsigned argument and void return remain unproven. Raw screens found no direct E8 call to the entry or observed ILT and no direct virtual call using displacement `+0x258`. These negative screens are not proof that no caller exists: computed dispatch, aliases and other forms remain possible. `direct-callers.log` and `slot150-callers-summary.log` preserve the results. The address-derived identity is retained; the unresolved return contract blocks exact acceptance independently of the byte mismatch.

## Checks and preservation

`check-csv.log` and `pin-consistency.log` pass. `class-bank.log` exits zero. `bank-preservation.log` verifies identical source hashes and no identifier regression through `name_regression.regressions`. An earlier invocation of the name-regression command used file paths where this revision expects Git revisions and failed before checking anything (`name-regression.log`); no passing command-line verdict is claimed. No bank-to-source conversion took place.

All trials, complete decoded bodies, raw outputs and independent byte files remain under `build/0073d6d0-retry/`. Unmeasured trial drafts are not results. Exactly one blocked verdict is recorded for this retry; the better existing partial remains banked. No game source, ledger, pin, shared header, baseline, policy or tool is changed. A full gate is not required for this evidence-only handoff.
