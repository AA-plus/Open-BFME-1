# 0x00730E20: Gen_00730e20::forward takes the scan value and a float

The 48-byte body at `0x00730E20` (`ret 0x10` at +0x2D) is reached only through
ILT `0x000212DD`, which is stored in a vtable at file offset `0x00D2137C`. It
loads the owner pointer at `this+0x10` and, when the pointer is set, calls
`0x006CB1E0` through ILT `0x00019C7C`. That callee is the matched
`?scan@Rva006CB1E0Owner@@QAEXURva006CB1E0Value@@M@Z`, which takes a 12-byte
`Rva006CB1E0Value` by value and a `float`.

The old row spelled the arguments as a private `Gen_00730e20_Value` and an
`unsigned` tail (`...UGen_00730e20_Value@@I@Z`). Retail does no conversion
between its four incoming dwords and the outgoing ones, so the argument types
are the callee's own: `?forward@Gen_00730e20@@QAEXURva006CB1E0Value@@M@Z`.
Both class names stay address-derived.

The previous source was an inline `__asm` block. Plain C++ reproduces all 48
bytes once the value type has a user-declared copy constructor, which yields
retail's EDX field-by-field staging after the float push.
