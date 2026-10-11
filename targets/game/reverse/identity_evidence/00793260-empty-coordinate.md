# Exact progress-bar draw bank at RVA 00793260

The existing identity audit in 00793260-native-declaration-retry.md proves
the 553-byte boundary, FunctionLexicon VA 012BA520 entry, native callback
ABI, four GameWindow callees, BFME color offsets and manager virtual slots.
ilt_oracle.py independently confirms the exact callback name with
p_false=3.26e-4. No identity, callee pin or virtual contract changes here.

The served bank emitted 552 bytes with 350 overlapping nonrelocation
differences and one missing byte. Its measured byte equality was 0.3653.
Retail keeps progress in EBX; the bank uses EBP and spills progress before
winGetScreenPosition. The 00793520 and 00796480 coordinate-construction
levers supplied a new hypothesis for this native local lifetime.

| Trial | Bytes | Overlap differences | Result |
|---|---:|---:|---|
| Original bank | 552 | 350 | Progress spill at +20 |
| Empty construction on size | 549 | 375 | Progress EBX and first divergence +3F |
| Empty construction on all coordinates | 549 | 374 | Same color-merge residue |
| Empty construction on start, or start/end | 552 | 350 | Original result |
| Size construction plus native enabled-color order | 553 | 1 | LEA SIB at +BF |
| All coordinate construction plus native enabled-color order | 553 | 0 | Exact outside ten relocations |
| Same recovery in canonical complete home TU | 553 | 0 | Exact outside ten relocations |

The bank had swapped the enabled branch's barBorder and barColor assignments
to improve its POD-coordinate shape. With the empty constructor this old
workaround is harmful. Restoring native barColor before barBorder fixes the
color-merge stores and complete instruction layout. Size construction alone
then leaves only the operand order of LEA EDI,[ECX+EDX] at +BD; constructing
all four coordinate locals removes that final SIB difference.

The exact canonical bank uses an address-qualified local template derived
from ICoord2D with an empty default constructor. It adds no fields, stores,
destructor or escaping object. Used fields are assigned before reads. This
is a reconstruction choice rather than a claim about an EA type identity.
The native named GadgetProgressBar color getters are retained. Only their
inline reads use a window+4 view to reach the independently witnessed BFME
draw-data offsets; real window calls retain their original receiver.

This is an exact bank, not production progress. W3DProgressBar.cpp's only
census link blocker is the unverified W3DGadgetProgressBarImageDrawA body,
whose getter replacement was refused by name_regression in b3eadf6f16.
The fleet refusal rule forbids retrying that item. Production source and
the function ledger remain unchanged, with LINKED 0 -> 0. The recovery is
saved through re_log.py at attempts/0x00793260.cpp for later legal integration.

Raw sources and probes are under build/c8_plainprogress/ in the C8 worktree.
home.log records the canonical exact probe. No generated source, reference
header, pin, baseline, alias or verifier rule was changed.
