# 0x006008D0: Rva005EB1F0's two-argument constructor

The 178-byte body at `0x006008D0` (`ret 8`) was a MASM dump named
`??0Rva006008D0@@QAE@PAXPAVV3HostRva005E7AD0@@@Z`. A C++ reconstruction
matched exactly but could not land, because the vftables it stamps are
recorded only under `Rva005EB1F0`'s names.

## Vftables

The body's final vftables are exactly `Rva005EB1F0`'s. They are also what the
matched copy constructor `??0Rva005EB1F0@@QAE@ABV0@@Z` (`0x005EB1F0`)
stamps:

| Address | Recorded name |
| --- | --- |
| `0x01112D5C` | `??_7Rva005EB1F0@@6BV3Slot0N@@@` |
| `0x01112D58` | `??_7Rva005EB1F0@@6BV3Slot1@@@` |
| `0x01112D90` | `??_7Rva005EB1F0@@6B@` |

## The constructing factory

- Its only caller is the matched factory
  `V3HostRva005E7AD0::create` (`0x005E7AD0`). The factory news `0x44`
  bytes, calls this body through ILT `0x00046E48`, and then stamps
  `0x01112728` / `0x01112724` / `0x01112710`.
- Those three are the vftables of `Rva005EB1C0`.
  `V3CopyCtorForwarders.cpp` declares that class as
  `Rva005EB1C0 : Rva005EB1F0`.

So the factory's inline-constructed class is `Rva005EB1C0`, and its
out-of-line base constructor, this body, belongs to `Rva005EB1F0`.

## The source

The reconstruction uses the hierarchy `V3ChainedCopyCtorsWithSecondBase.cpp`
gives `Rva005EB1F0`:

- the first base chain `Rva005EAB80` -> `Rva005EABB0` -> `V3Slot0N`/`V3Slot1`;
- the 13-dword value block `Rva005EA0D0` at +0xC.

The only intermediate stamp retail keeps at +8 is the shared vftable
`0x0110F9E8`, recorded as `??_7V3Vt0110F9E8@@6B@`. So `V3Slot1` is a
novtable view over that base.

The constructor is renamed `??0Rva005EB1F0@@QAE@PAXPAVV3HostRva005E7AD0@@@Z`,
and the factory's `BASE` follows it. Every name stays address-derived.
