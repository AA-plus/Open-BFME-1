# BfmeB1236::bfmeApply1236 callee-saved character/source swap (final bank)

RVA `0x008AD8F0`, 603 bytes, `?bfmeApply1236@BfmeB1236@@QAEXPAX@Z`. Ghidra layout request plus retail `ret 4` at +0x258 followed by INT3 prove the 603-byte extent. Callers `bfmeGo1236`/`bfmeTransform1236` supply the repository identity.

The bank in `targets/game/reverse/attempts/0x008ad8f0.cpp` reproduces 603/603 bytes, 12 relocations, 10 non-relocation differences, first at +0x07, normalized instruction shape 1.000. Residue: retail keeps the character (`this`) in EBP and the binding source in EBX; the bank keeps the character in EBX and the source in EBP. Differing instruction starts: +0x06, +0x08, +0x0B, +0x98, +0x9B, +0xEF, +0x1CD, +0x1D5, +0x1EE, +0x1F2. Everything else, including the inline binding-layout pipeline order, is already exact.

This session's fresh probes (no local, `this` local, `this->m_binding50`, `(*binding).` spellings) all rebuilt the same ten differences. Together with the logged history (accessor layers, parameter order, reference/const params, extra inline levels, nested-if control flow, switch, struct copies of the source pair and rect, BFME2 donor bitfield spelling at 0x006E1260, one extra hot character read, two hot reads which moved the character to EDI, and the register family of shape_family_levers offering no choices), the swap is a register-weight balance no natural spelling reaches. Blocker: regalloc/callee-saved-character-source-swap.

Reopen only with independently witnessed source context that changes the relative live-range weight of the character and source pointers; do not repeat the recorded accessor, parameter-order, helper-visibility, copy or bitfield experiments.
