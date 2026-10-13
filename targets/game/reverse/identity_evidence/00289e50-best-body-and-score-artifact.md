# 0x00289E50: identity is update(), and its finish lane ranks on an artifact

Identity (wave 13 a6, re-checked): vtable 0x010BCB3C slot 0 -> thunk
?j_0002ab8a@@YAXXZ -> 0x00289E50, and slot 1 is the matched UpdateModule
getDisabledTypesToProcess; UpdateModuleInterface declares update() first, so
0x00289E50 is ?update@BroadcastStealthUpdate@@UAE?AW4UpdateSleepTime@@XZ.
The "class complete destructor 0x00289E50" text on the ??_G deleting-destructor
row is stale and should be retracted by whoever owns that row.

Score artifact: 0x00289E50 has NO functions.csv row (only carved.csv 806B), so
finish_measure.measure() runs probe.py without --size; probe falls back to our
own object length as "retail" and every stash's quality is self-referential
(1 - diffs/our_length). That ranks SMALL bodies higher: the 116-byte September
destructor-looking stash measures 0.4569 (63/116) while a near-miss 785-byte
update() body measures 0.2331 (602/785). re_log therefore still prefers
targets/game/reverse/attempts/0x00289e50.cpp even though it is the refuted
destructor skeleton that compiles to 116 bytes.

Measured honestly against retail 806 (probe --size 806): best body is the wave
13 reconstruction with the extra setStatus(15,true) removed, the decl order
moduleData/object, and an explicit __declspec(noinline) specialization of
_STL::list<int>::remove so the +0x1e3 call to 0x22B6D0 is emitted as a call
(785B, 602 masked diffs, shape 0.890, frame 0xa0 vs 0x98, first structural
+0x3b). Body: build/scratch/be289e50_r.cpp = archived alternative under
targets/game/reverse/attempt_history/0x00289e50/. Residue: this lands in ebp
where retail uses ebx (retail keeps &m_broadcastObjects in ebp) and our EH
state after the wide call is 4, so `mov ebx,4` CSEs with the relationship
flags and `bl` stores the state where retail stores immediate 5.
