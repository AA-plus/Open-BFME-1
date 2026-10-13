# 006B1FC0 node payload reload (2026-10-13)

Fresh shard0/5 fallback assessment. Complete retail extent258B, final RET4
at+0xFF. Matched MilesAudioManagerStopChain.cpp calls this address through
ILT000280F6. Existing bank address-qualified identity retained; explicit
integer-RVA oracle reports tier=placeholder, CONTRADICTED window mismatch.
This is not a real-name guard rejection and does not prove any retail name.

Retail+0x56 reads node+8, then reads playing payload+0x14. After the effective
volume call at+0x66, retail+0x71 reloads node+8 before reading payload+0x28.
The bank instead caches the payload before the call. This gave a supported
memory-lifetime/reload trial independent of the earlier volatile-volume and
register-order attempts. Actual callees were inspected in
Rva006AE150ScaledValue.cpp (202B thiscall float result, two arguments) and
AudioEventRTSClassification.cpp (isPositionalAudio bool). No new declaration,
identity, pin, or source-provider mapping was introduced.

Only the findLowestPrioritySound loop changes in scratch:
`playingAudio->m_volume` becomes `(*it)->m_volume`. All existing identifiers
remain. Full-bank original probe:257B/202 nonrelocation differences, frame0xC.
Reload probe:225B/174 differences, frame8 versus retail0x14; first difference
+2. A version with the unrelated sibling removed and the full bank context
produce the same reload bytes. Thus this is not an improvement established by
the lower raw difference count alone.

Normal re_log --stash measurement reports submitted0.3256 but measured0.0698.
It remeasures the existing bank at0.2093 and keeps its stronger source,
replacing only the old estimated0.88 header score with0.2093. The losing
candidate is retained by the tool in immutable attempt_history JSON
681ef8131ed3c32c4b4cde6e1d422688603e28e9a224cd9ed2739a9659195a9d.json.
Do not interpret the recalibration as new matched bytes. Production, shared
headers, symbols and baselines remain untouched. No strict production gate
was invoked. Claim released. No reason to repeat this reload trial.

The single outcome used t=1.2min for the trial phase; elapsed wall time measured
immediately before stash submission was1.7min. The final measured duration
including capture is recorded below; no duplicate outcome was appended.

t=2.8min model=gpt-6-astra lane=R budget=30m blocker=regalloc/node-payload-reload-frame.
