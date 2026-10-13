# 0x0017BA90: the contact-diamond block order is compiler-canonical

Retail 0x0017BA90 (897 B, ret 4) still differs from the bank in exactly one
place: the `gotContact` diamond at +0x192..+0x1ed.

Retail places the false arm first:

    +01b2 je 0x1cc              (weapon == 0 -> later joiner)
    +01be jne 0x1d0             (template m() -> call)
    +01ca jne 0x1d0             (template get() -> call)
    +01cc xor bl, bl            ; gotContact = false
    +01ce jmp 0x1ed
    +01d0 ... contact call ...  ; gotContact = result in bl

The bank places the call first and lets the false arm fall through the merge
(the MSVC canonical then-first linearization). 20 spellings were compiled
against the stashed TU in this session; every one reproduces the bank bytes
exactly (26 non-relocation diffs, shape 0.990, first +0x192):

- if/else, braces, nested duplicated false arms (three depths)
- negated `if (!...) B else A` and its parenthesized variants
- `!c ? false : call` and `c ? call : false` ternaries
- `x = c && call(...)` and `c || false` expressions
- early-guard `goto`/`break` forms
- declaration-order levers (gotContact, targetPos)

MSVC 7.1 canonicalizes all of them; a minimal repro of the same diamond
(build/w2f17/mini/) shows the same A-first layout in isolation, so the
retail block order is not reachable by spelling the condition. Reopen only
with a nonlocal cause (e.g. a source-level statement the surrounding loop
structure gives a different CFG weight), not another condition spelling.
