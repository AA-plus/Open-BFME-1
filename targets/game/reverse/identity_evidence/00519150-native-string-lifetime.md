# 00519150 native string lifetime test

Round 36, gpt-6-astra, lane R, budget 30m, t=1.4min active body work.

The existing address-qualified bank symbol is
`?rva00519150@BfmeAptScreenLanLobby@@QAEHXZ`. The unchanged oracle API,
called with integer RVA `0x00519150`, reports tier `placeholder` and
`CONTRADICTED` (p=0.001174137661117779, slot 52750 outside 31045–31062).
This diagnostic is outside the production guard's real-name rejection scope;
no symbol was renamed. Existing vtable 0x01105A78 slot 5 provenance is retained.

Retail RET is at RVA 0x0051949B; ten switch entries occupy 0x0051949C–0x005194C3,
followed by INT3 at 0x005194C4. The complete extent is 884 bytes.
`callees.py 0x00519150 884` confirms the wide StringBase constructor call at
0x00888DE0. `eh_info.py` resolves handler 0x00C2F510 and FuncInfo 0x00E1F4DC:
both cleanup actions (0x00C2F500 and 0x00C2F508) load the saved temporary
pointer from `[ebp-0x1c]` and jump through ILT 0x0003B304 to 0x0005EEA0.
That destructor is a JMP to wide releaseBuffer at 0x008881D0.

The bank locally models StringBase and UnicodeString. The new structural
experiment adopts existing `Common/UnicodeString.h` from the stringbaseunicode
shim and canonical `string_base.h`; its inline destructor calls the authentic
wide releaseBuffer. This tests whether native temporary lifetime and destructor
visibility change reuse of address-taken selection/game slots. It preserves all
other declarations, names, statements and optimization flags. No shared file is
modified. A missing stddef.h prerequisite was fixed only in scratch before the
successful compile.

Both fresh probes emit 884 bytes with 62 relocations and 13 masked differing
bytes. Raw disassembly first diverges at +0x173: retail LEA EAX,[ESP+0xC],
candidate LEA EAX,[ESP+0x10]. Subsequent +0x183/+0x18C/+0x193/+0x19B/+0x1BD
selection/game homes retain the same swaps. Both probes also report ten
relocation-site alignment diagnostics, so the masked metric is not a strict
verification result. Native string adoption does not improve the result.
The reported `first at +374` summary is not substituted for the actual first
instruction divergence shown in the probe's evidence section.

Commands (each probe used BUILD_POOL=1):

```
python3 tools/probe.py build/worker3-round36/base.cpp '?rva00519150@BfmeAptScreenLanLobby@@QAEHXZ' 0x00519150 --size 884
python3 tools/probe.py build/worker3-round36/native.cpp '?rva00519150@BfmeAptScreenLanLobby@@QAEHXZ' 0x00519150 --size 884
```

Local raw evidence: build/worker3-round36/base.log, native-fixed.log,
preflight.json, callees.txt, eh.txt, and retail-0005eea0.txt. The canonical bank
is unchanged. No production reconstruction, pin or baseline was modified.
Blocker: stack-slot/native-string-lifetime-inert. A next attempt needs independent
home-TU or local-lifetime evidence beyond the documented scope permutations;
repeating scalar declaration order or native string adoption is unsupported.
