# DivideInternalFPF at RVA 0x00879F60: linkage and extent audit

Round35 targeted evidence investigation, model=gpt-6-astra. No body, pin,
ledger extent, baseline, or guard changes are proposed by this packet.

## Result

The round34 CLI contradiction tested **RVA 0x00479F60**, not the requested
RVA 0x00879F60. `tools/ilt_oracle.py:main` treats a numeric argument as a VA
when subtracting IMAGE_BASE yields an existing thunk target. Here that condition
is true: RVA 0x00479F60 is the target of slot 31940, window 19915..19919.
The printed contradiction therefore does not contradict DivideInternalFPF.
This is an address-parser ambiguity, not a statistical false rejection.

The unchanged `Oracle.check(name, 0x00879F60)` API returns UNTESTABLE; independently
scanning `retail_ilt()` finds no thunk targeting 0x00879F60. Passing the actual
VA 0x00C79F60 to the existing CLI also returns UNTESTABLE. The production
`ilt_guard.py` calls `oracle.check(name, rva)` directly and does not apply the
CLI address conversion. Nothing in this investigation changes that guard.

Reproduce from the repository root:

```sh
python3 tools/ilt_oracle.py check '?DivideInternalFPF@@YAXPAUInternalFPF@@00@Z' 0x00879F60
python3 tools/ilt_oracle.py check '?DivideInternalFPF@@YAXPAUInternalFPF@@00@Z' 0x00C79F60
python3 - <<'PYCODE'
import sys
sys.path.insert(0, 'tools')
import ilt_oracle as o
name = '?DivideInternalFPF@@YAXPAUInternalFPF@@00@Z'
print(o.oracle().check(name, 0x00879F60))
first, targets = o.retail_ilt()
print([i for i, rva in enumerate(targets) if rva == 0x00879F60])
print(hex(targets[31940]))
PYCODE
```

## Independent identity and calling convention

`game/Libraries/Source/Benchmark/emfloat.cpp` includes sibling `emfloat.c` as
C++ and uses `inputs/vendor/nbench` headers. Both the header declaration and
source definition declare DivideInternalFPF **static void** with three
InternalFPF pointer parameters. The entire DivideInternalFPF definition is
text-identical between the sibling and vendored C files; the complete files
are not identical. `inputs/vendor/nbench/PROVENANCE.md` identifies the compiled
family as nbench-byte 2.1, with 2.2.3 supplying compatible headers; it explains
that emfloat.c itself is identical across those upstream releases.

The matched SetupCPUEmFloatArrays body (RVA 0x0087A300, 170 bytes) calls
0x00879F60 directly at 0x0087A366 and 0x0087A38E. It converts random integers
into two 12-byte stack InternalFPF objects, then divides into successive
12-byte output array elements, exactly the two source calls in emfloat.c.
The matched DoEmFloatIteration body (0x0087A3B0, 236 bytes) calls it directly
at 0x0087A456 in its division switch arm. A raw E8-target scan of retail's
first section finds these three direct call sites; their instruction decodes
confirm they are calls, not incidental data matches.

At both Setup calls EDX is &locFPF1 (x), ECX is &locFPF2 (y), and ESI is
the destination. At the iteration call EDX is abase+i, ECX is bbase+i, ESI
is cbase+i. The target begins `mov edi,edx`, `mov ebx,ecx`; it indexes the
25-way type dispatch with 5*x.type+y.type and writes results through ESI.
It consumes no stack arguments and returns with plain RET. Thus its machine
ABI is a compiler-private same-TU register convention, **not an externally
callable three-stack-argument cdecl function**, despite the familiar COFF
C++ symbol spelling in the bank/pin. Static source linkage and the genuine
caller context explain this convention; no new fastcall/cdecl adapter is
justified. The symbol alone and the oracle are not the identity proof.

The 12-byte representation is independently consistent with type at +0,
sign at +1, signed exponent at +2, and four 16-bit mantissa limbs at +4.
Retail special cases write the vendor NaN exponent 0x7FFF, sign/type bytes,
and leading mantissa 0x4000; its helper calls and quotient loop implement
the vendor division path. These body facts corroborate the caller provenance.

## Complete contribution

Retail returns at +0x2E2, has a NOP at +0x2E3, nine DWORD jump targets at
+0x2E4..+0x307, then 25 selector bytes at +0x308..+0x320. INT3 starts at
+0x321. The dispatch at +0x27 reads the selector table and +0x2E reads the
jump table. All nine targets lie inside the body. The complete contribution
is **801 bytes**, not the generated ledger row's 736 bytes. The tables and
source hashes are preserved in the accompanying JSON. Linear disassembly
of those table bytes as instructions must not be used to infer the boundary.

## Disposition and remaining work

No identity rename/correction is warranted by the alleged oracle conflict,
so no name-correction exemption or snapshot-pair entry is needed. This packet
supersedes only round34's preflight interpretation for this RVA; it does not
retract historical byte measurements or assert a new match.

Prior bank measurements leave the two mantissa-load displacement differences
at +0xFA/+0x104. The static linkage, caller context and 801-byte extent were
already represented in that bank. This investigation supplies no NEW
ABI/layout/lifetime lever, so no byte trial or banking was performed. A future
landing still needs strict verification of the complete contribution in its
real TU. Other round34 high-RVA CLI contradictions require individual address
normalization review; this result does not clear them wholesale.
