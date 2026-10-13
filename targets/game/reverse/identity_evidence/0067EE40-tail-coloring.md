# 0067EE40 tail-coloring session (agentloop5/w5c)

Identity is unchanged and was not re-litigated: the ILT oracle binds
?ConstructNetCommandMsgFromRawData@NetPacket@@SAPAVNetCommandRef@@PAEG@Z to
RVA 0x0067EE40, retail RET +0x3AB / INT3 +0x3AC prove 940 bytes, and the
banked source reproduces the entire body byte-for-byte through +0x35A.

State as found: targets/game/reverse/attempts/0x0067ee40.cpp emits 940 bytes
with 19 non-relocation diffs, all inside +0x35B..+0x36F. Its tail is
`offset = payloadOffset; msg = NULL; ref->setRelay(relay); msg->detach();`
which clears the message before detach, so it is semantically wrong and must
not land. Retail's tail is
`mov ecx,esi (receiver=msg) / eh store / mov ebx,eax / mov [eax+0xC],dl /
call detach / mov esi,[esp+0x14] (offset=payloadOffset) / xor cl,cl`.

New measurements this session (all through tools/probe.py, size 940):

| variant (tail source order) | bytes | non-reloc diffs |
| --- | ---: | ---: |
| bank: O; N; S; D | 940 | 19 (wrong receiver) |
| v1: S; D; N; O (retail order) | 946 | 725 |
| v3: O; S; D (correct receiver) | 944 | 186 |
| E1: function-scope payloadOffset, retail order | 946 | 740 |
| E2: E1 with function-scope msg | 946 | 740 |
| E3: function-scope payloadOffset, O;S;D | 947 | 718 |
| E5/E6: readers take `offset` directly (offset address-taken), retail order | 981 | 717 |

O = `offset = payloadOffset;` S = `ref->setRelay(relay);` D = `msg->detach();`
N = `msg = NULL;`

Conclusions this session adds to the record:

- The `[esp+0x14]` slot is NOT `offset`'s address-taken home: passing `offset`
  to the readers directly (E5/E6) grows the body to 981 and leaves retail's
  shared ESI unclaimed, so the payloadOffset copy is the right structure.
- Declaring payloadOffset at function scope (E1/E3) does not change the wall.
- The two bank/v1 exchanges are coupled through the allocator, not the
  scheduler: with O before D (`offset` live across the detach call) MSVC keeps
  retail's ESI=offset coloring and only the emitted order/receiver differ;
  with O after D (`offset` dead across every call) the whole coloring rotates
  (offset takes EAX, tag byte moves to CL, dataLength temp to ECX, notDone to
  DL). `msg` keeps ESI in the v1 coloring, so the receiver `mov ecx,esi` and
  the post-call reload both exist there - only the register file differs.
- With both `offset` (O before D) and `msg` live across the detach call (v3),
  five values contend for four callee-saved registers and MSVC rotates the
  whole prologue and spills `ref` to [esp+0x24].

Next lever not yet tried: a spelling that keeps `offset` alive across the
detach call for the coloring while its reload still emits after the call, e.g.
a read of `offset` after `msg->detach();` that folds into the loop compare, or
repairing the register roles of the v1 tail (receiver `mov ecx,esi` and the
post-call reload are already correct there) with a source change that moves
`msg`/`notDone`/`dataLength` off EAX/EDX/ECX without disturbing EDI=data and
ESI=msg. Do not retry tail permutations, the leading NULL, function-scope
payloadOffset/msg, or address-taken `offset`.

t=50min model=gpt-5.2-codex
