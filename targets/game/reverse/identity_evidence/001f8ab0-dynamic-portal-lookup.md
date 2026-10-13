# 0x001F8AB0: DynamicPortalBehaviour lookup, not WorkerAIUpdate::getModuleNameKey

A naked lift claimed the 155-byte body at `0x001F8AB0` as
`?getModuleNameKey@WorkerAIUpdate@@UBE?AW4NameKeyType@@XZ`, a const virtual
with no arguments. The body never reads `ecx`. After its SEH frame it loads an
Object pointer from its one stack argument (`[esp+0x14]`) and initialises a
function-static key from the literal `"DynamicPortalBehaviour"`
(VA 0x01090B3C). It then walks the object's NULL-terminated behavior-module
list at +0x1F0, calls each module's vtable +0x10 (getModuleNameKey), and
returns the matching module or NULL with a plain `ret` (cdecl). An earlier
`identity-suspect` verdict recorded the same refutation.

Callers reach it through ILT 0x0002FC7A from Weapon::isGoalPosWithinAttackRange
(0x001E6930), the SiegeDeploy bodies (0x00266xxx) and others, passing an
Object. The body sits beside DynamicPortalBehaviour's own code (0x001F8D10).
No caller or string names the function, so
`DynamicPortalBehaviourRva001F8AB0.cpp` lands it as
`?rva001F8AB0@@YAPAVBehaviorModule@@PAVObject@@@Z`, matching all 155 bytes
modulo relocations.
