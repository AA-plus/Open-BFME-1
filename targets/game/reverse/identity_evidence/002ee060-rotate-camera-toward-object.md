# 0x002EE060: six-argument camera-rotate script action, name unproven

The 118-byte body at `0x002EE060` was claimed as
`?doRotateCameraTowardObject@ScriptActions@@IAEXABVAsciiString@@MMMM@Z` by a
naked `__emit` lift (`ScriptActions_doRotateCameraTowardObject_Thunk.cpp`).
That decoration declares five stack arguments (20 bytes), but the body
returns with `ret 0x18` (24 bytes). An earlier verdict in `re_attempts.log`
recorded the same arity proof.

## Body

    +0000  mov ecx, [TheScriptEngine]      ; getUnitNamed(unitName), vtable +0x68
    +000e  call [eax+0x68]
    +0017  mov eax, [esp+0x1c]             ; sixth argument, copied as a dword
    +001b  fld [esp+0x18] / fmul 1000.0    ; easeOut*1000 -> Real
    +0037  fld [esp+0x28] / fmul 1000.0    ; easeIn*1000  -> Real
    +0044  fld [esp+0x24] / fmul / __ftol2 ; holdSec*1000 -> Int
    +0053  fld [esp+0x20] / fmul / __ftol2 ; sec*1000     -> Int
    +0063  push [esi+0x74]                 ; unit->getID()
    +006a  call [ebx+0xcc]                 ; TheTacticalView vtable slot 51

This is Zero Hour's `ScriptActions::doRotateCameraTowardObject`
(`TheTacticalView->rotateCameraTowardObject(unit->getID(), sec*1000,
holdSec*1000, easeIn*1000, easeOut*1000)`) plus one extra argument passed
through to the view.

## Name

`python3 tools/ilt_oracle.py check NAME 0x002EE060` contradicts every
six-argument spelling of `doRotateCameraTowardObject` tried. That covers
`H`, `I`, `J`, `K`, `M`, `N`, `_N`, `D`, `E`, `F`, `G`, pointer, enum and
string tails; `IAE`, `AAE` and `QAE` access; static (`SG`/`KG`/`CG`),
global `__stdcall` and `IAG` forms; and `MMHH`/`HHMM` parameter orders. The
EA name of this body is therefore unproven. The landed source
`ScriptActionsRva002EE060.cpp` keeps the address
(`?rva002EE060@ScriptActions@@IAEXABVAsciiString@@MMMMH@Z`) and reproduces all
118 bytes, modulo relocations.
