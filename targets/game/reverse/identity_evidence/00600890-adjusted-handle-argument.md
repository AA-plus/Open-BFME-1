# 0x00600890: Rva005E7BF0::handle takes the seed target

The 46-byte body at `0x00600890` (`ret 4` at +0x2B, int3 from +0x2E) was
landed as a MASM dump under `?handle@Rva005E7BF0@@UAEXXZ`. That spelling has
no argument, and it was the only reason the body stayed assembly: the
`void handle()` that `AdjustorThunks.cpp` declares for the whole thunk family
cannot produce `ret 4`.

## What the body does

- It reads one stack argument and stores the two-byte `{1, 1}` pair in its
  frame.
- It calls slot 10 (`+0x28`) of the argument with the pair's address. That is
  the same seeding shape as the matched seeders in `S3SeedPairsHoisted.cpp`,
  whose target class is `BfmeSeedTarget`.
- It then calls the matched `?bfmeSeed@Gen_006007A0@@QAEXPAVBfmeSeedTarget@@@Z`
  (`0x006007A0`, through ILT `0x0000BA19`) on `this+0x0C` with the same
  argument.

## Why it is this override

The adjustor thunk at `0x005E7BF0` subtracts 12 and jumps here, so `+0x0C` is
the secondary base whose slot the override serves.

## The signature

The argument's type is the one `bfmeSeed`'s pinned signature already gives
it, so the override is `?handle@Rva005E7BF0@@UAEXPAVBfmeSeedTarget@@@Z`. Its
adjustor thunk becomes `?handle@Rva005E7BF0@@WM@AEXPAVBfmeSeedTarget@@@Z`,
and both still match exactly. The class and method names stay
address-derived; no real identity is claimed.
