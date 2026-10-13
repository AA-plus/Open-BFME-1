# 00194150 native range selection

Round38, gpt-6-astra. Existing opaque bank identity retained; no name claim.
The actual-RVA oracle API reports tier=placeholder, CONTRADICTED. This tier
is outside real-name rejection and is not evidence for a semantic method name.

Retail starts with a saved ESI and validates the fourth stack argument, uses
ECX as the table receiver, and returns with RET16 at +0x91. INT3 starts at
+0x94, establishing 148 bytes. It searches 32 records at +0x66C, stride0x1C,
then selects the three-pointer range at +0x670 or +0x67C. Pointer subtraction
and multiplication establish 140-byte elements. ILT0000D4CC targets the matched
277-byte BuildListInfo assignment at001927A0. That callee copies string fields
+4,+8,+0x30 and scalar fields through+0x88, returns its receiver, and pops4.

The canonical buildlistinfo/GameLogic/SidesList.h type passes a sizeof==0x8C
assertion. The new scratch source includes that header via its owning TU's
include setup and uses native STLport vector members instead of the bank's
separate begin/end selection. No shared declarations were changed.

The preferred bank reprobes129B with124 nonrelocation differences, first+0.
Native container selection emits143B with111 differences, first+25, shape0.897.
A named begin iterator and explicit end-minus-begin give exactly the same
instructions. Retail saves EBX before the loop, selects the container in ESI,
and keeps begin in EBX; compiler selects the container in EAX and reuses ESI
for begin. It also reverses the initial counter-zero/address setup. The missing
save/restore and extra register move account for the five-byte deficit.

No production promotion or strict-match claim. Normal re_log measurement
archives this measured improvement and decides preferred-bank retention.
Scratch logs: build/worker3-round38/{base,native,range,range-all}.log;
callee decode: assignment.asm; API and ledger snapshot: preflight.json.
No pins, identifier changes, baseline changes, or generated-source edits.
