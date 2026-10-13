# RVA003DAC80 native contract preflight (2026-10-13)

Round44 selected this body from list_naked_candidates.py game --shard 0/5.
Eligibility-backed brief serves170B at003DAC80 with supplied bank/brief
bounds003DAC80..003DAD2A (170B). The entry is
thiscall with one Coord3D pointer argument. Prior trials leave a24-byte local
frame versus retail16 and fail to reuse the incoming argument home. No prior
shape or flag sweep was repeated.

New evidence: the second callee now has a matched969B native definition in
PathfinderIterateCircular1.cpp, iterateCircular1Ground003D9F00. Its signature
is (const ICoord2D*, Int, ICoord2D*, void*), and its GroundSearch003D9F00
context reads a Pathfinder pointer. The caller passes its context address
through ILT000135E3. The first call through000171E8 reaches independently
matched worldToCell003D7EC0. This justified replacing the bank's alternate-name
helper with the existing native member and testing canonical coordinate/terrain
declarations before any visibility or lifetime trial. The semantic public
method spelling remains unproven; the original opaque bank identity is retained.
Explicit-RVA oracle preflight: tier=placeholder, verdict=CONTRADICTED,
p=0.0006522987006209884, slot26687 window17093-17102. This is not a real-name
guard rejection under the documented tier policy.

Both scratch probe commands used BUILD_POOL=1 and the unchanged probe.py
with symbol ?adjust003DAC80@Rva003DAC80@@QAE_NPAUCoord3D@@@Z and size170.
The first compilation failed because TerrainLogic's GameMemory inclusion
requires Lib/BaseType.h. Adding its existing reference include directory
resolved that path, but the next compilation failed on duplicate PreRTS/
BaseType/coord definitions and another missing Common/Errors.h. Per the
coordinator's repeated unresolved infrastructure rule, no further retries
were performed. This is compilation failure, not a byte or identity verdict.

No measurement, bank update, production modification, new pin, alias or
header repair is claimed. The stronger0.85 bank is untouched. The prospective
home file is PathfinderIterateCircular1.cpp; integrating the native declarations
requires a coherent existing include environment before the proposed context
lifetime test can be measured. No claim of queue exhaustion is made.

## Scratch source at stop

```cpp
// cl: /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Libraries/Include /DNDEBUG /MD /EHsc /Igame/GameEngine/Include/Precompiled /Igame/Libraries/Source/WWVegas/WWMath
// ?adjust003DAC80@Rva003DAC80@@QAE_NPAUCoord3D@@@Z
// partial score=0.85 date=2026-09-16
// Scratch-only complete reconstruction probe for retail 0x003DAC80 (170 bytes).
// The owner and method remain address-derived.  Retail's entry is thiscall with
// one stack argument: a Coord3D pointer updated in place.
//
// The 0x003D9F00 helper is deliberately declared with the ABI witnessed at
// this callsite.  Its direct retail route here is ILT 0x000135E3; the similarly
// named route at 0x0004ACBE reaches a different body and is not used.

#include "coord.h"
#include "GameLogic/TerrainLogic.h"

extern TerrainLogic *TheTerrainLogic;
extern float Rva00C75334One;

class Pathfinder
{
public:
	Bool worldToCell( const Coord3D *pos, ICoord2D *cell );

	// Four stack arguments, as seen at 0x003DAC80:
	//   const ICoord2D &, Int scanLimit, ICoord2D *result,
	//   Pathfinder *const *context
	Bool iterateCircular1Ground003D9F00(const ICoord2D *,Int,ICoord2D *,void *);
};

class Rva003DAC80 : public Pathfinder
{
public:
	Bool adjust003DAC80( Coord3D *posInOut );
};

Bool Rva003DAC80::adjust003DAC80( Coord3D *posInOut )
{
	ICoord2D localCell;
	ICoord2D selectedCell;
	Pathfinder *context;
	if (worldToCell( posInOut, &localCell ))
		return false;
	context = this;
	if (!iterateCircular1Ground003D9F00( &localCell, 0x190, &selectedCell, &context ))
		return false;

	Int x = selectedCell.x * 10;
	float worldX = (float)x + Rva00C75334One;
	posInOut->x = worldX;

	Int y = selectedCell.y * 10;
	float worldY = (float)y + Rva00C75334One;
	posInOut->y = worldY;
	posInOut->z = TheTerrainLogic->getLayerHeight( worldX, worldY,
		(PathfindLayerEnum)1, 0, true );
	return true;
}

```

## Final compile diagnostic

```text
0088:fixme:seh:WerSetFlags (2) stub
0088:fixme:heap:RtlSetHeapInformation HEAP_INFORMATION_CLASS 1 not implemented!
00b8:fixme:ntdll:NtQuerySystemInformation info_class SYSTEM_PERFORMANCE_INFORMATION
00b8:fixme:seh:WerSetFlags (2) stub
00b8:fixme:heap:RtlSetHeapInformation HEAP_INFORMATION_CLASS 1 not implemented!
compile failed: build/worker1-round44/native.cpp
cl : Command line warning D4025 : overriding '/EHc-' with '/EHc'
native.cpp
inputs\reference\CnC_Generals_Zero_Hour\GeneralsMD\Code\Libraries\Include\Lib\BaseType.h(147) : error C2995: 'NUM sqr(NUM)' : template function has already been defined
        game\GameEngine\Include\Precompiled\PreRTS.h(29) : see declaration of 'sqr'
inputs\reference\CnC_Generals_Zero_Hour\GeneralsMD\Code\Libraries\Include\Lib\BaseType.h(155) : error C2995: 'NUM clamp(NUM,NUM,NUM)' : template function has already been defined
        game\GameEngine\Include\Precompiled\PreRTS.h(35) : see declaration of 'clamp'
inputs\reference\CnC_Generals_Zero_Hour\GeneralsMD\Code\Libraries\Include\Lib\BaseType.h(163) : error C2995: 'int sign(NUM)' : template function has already been defined
        game\GameEngine\Include\Precompiled\PreRTS.h(38) : see declaration of 'sign'
inputs\reference\CnC_Generals_Zero_Hour\GeneralsMD\Code\Libraries\Include\Lib\BaseType.h(183) : error C2084: function 'long fast_float2long_round(float)' already has a body
        game\GameEngine\Include\Precompiled\PreRTS.h(56) : see previous definition of 'fast_float2long_round'
inputs\reference\CnC_Generals_Zero_Hour\GeneralsMD\Code\Libraries\Include\Lib\BaseType.h(197) : error C2084: function 'float fast_float_trunc(float)' already has a body
        game\GameEngine\Include\Precompiled\PreRTS.h(70) : see previous definition of 'fast_float_trunc'
inputs\reference\CnC_Generals_Zero_Hour\GeneralsMD\Code\Libraries\Include\Lib\BaseType.h(214) : error C2084: function 'float fast_float_floor(float)' already has a body
        game\GameEngine\Include\Precompiled\PreRTS.h(87) : see previous definition of 'fast_float_floor'
inputs\reference\CnC_Generals_Zero_Hour\GeneralsMD\Code\Libraries\Include\Lib\BaseType.h(218) : error C3861: 'fast_float_trunc': identifier not found, even with argument-dependent lookup
inputs\reference\CnC_Generals_Zero_Hour\GeneralsMD\Code\Libraries\Include\Lib\BaseType.h(223) : error C2084: function 'float fast_float_ceil(float)' already has a body
        game\GameEngine\Include\Precompiled\PreRTS.h(96) : see previous definition of 'fast_float_ceil'
inputs\reference\CnC_Generals_Zero_Hour\GeneralsMD\Code\Libraries\Include\Lib\BaseType.h(227) : error C3861: 'fast_float_trunc': identifier not found, even with argument-dependent lookup
inputs\reference\CnC_Generals_Zero_Hour\GeneralsMD\Code\Libraries\Include\Lib\BaseType.h(272) : error C2011: 'Coord2D' : 'struct' type redefinition
        game\Libraries\Source\WWVegas\WWMath\coord.h(9) : see declaration of 'Coord2D'
inputs\reference\CnC_Generals_Zero_Hour\GeneralsMD\Code\Libraries\Include\Lib\BaseType.h(292) : error C2084: function 'Real Coord2D::toAngle(void) const' already has a body
        game\Libraries\Source\WWVegas\WWMath\coord.h(24) : see previous definition of 'toAngle'
inputs\reference\CnC_Generals_Zero_Hour\GeneralsMD\Code\Libraries\Include\Lib\BaseType.h(308) : error C2011: 'ICoord2D' : 'struct' type redefinition
        game\Libraries\Source\WWVegas\WWMath\coord.h(46) : see declaration of 'ICoord2D'
inputs\reference\CnC_Generals_Zero_Hour\GeneralsMD\Code\Libraries\Include\Lib\BaseType.h(315) : error C2011: 'Region2D' : 'struct' type redefinition
        game\Libraries\Source\WWVegas\WWMath\coord.h(54) : see declaration of 'Region2D'
inputs\reference\CnC_Generals_Zero_Hour\GeneralsMD\Code\Libraries\Include\Lib\BaseType.h(323) : error C2011: 'IRegion2D' : 'struct' type redefinition
        game\Libraries\Source\WWVegas\WWMath\coord.h(63) : see declaration of 'IRegion2D'
inputs\reference\CnC_Generals_Zero_Hour\GeneralsMD\Code\Libraries\Include\Lib\BaseType.h(332) : error C2011: 'Coord3D' : 'struct' type redefinition
        game\Libraries\Source\WWVegas\WWMath\coord.h(73) : see declaration of 'Coord3D'
inputs\reference\CnC_Generals_Zero_Hour\GeneralsMD\Code\Libraries\Include\Lib\BaseType.h(415) : error C2011: 'ICoord3D' : 'struct' type redefinition
        game\Libraries\Source\WWVegas\WWMath\coord.h(157) : see declaration of 'ICoord3D'
inputs\reference\CnC_Generals_Zero_Hour\GeneralsMD\Code\Libraries\Include\Lib\BaseType.h(429) : error C2011: 'Region3D' : 'struct' type redefinition
        game\Libraries\Source\WWVegas\WWMath\coord.h(172) : see declaration of 'Region3D'
inputs\reference\CnC_Generals_Zero_Hour\GeneralsMD\Code\Libraries\Include\Lib\BaseType.h(451) : error C2011: 'IRegion3D' : 'struct' type redefinition
        game\Libraries\Source\WWVegas\WWMath\coord.h(195) : see declaration of 'IRegion3D'
X:\Projects\Open-BFME-1\.codex\worktrees\finish-astra-1\inputs\reference\shims\sweep\Common\Debug.h(157) : warning C4005: 'DEBUG_LOG' : macro redefinition
        game\GameEngine\Include\Precompiled\PreRTS.h(23) : see previous definition of 'DEBUG_LOG'
X:\Projects\Open-BFME-1\.codex\worktrees\finish-astra-1\inputs\reference\shims\sweep\Common\Debug.h(158) : warning C4005: 'DEBUG_ASSERTLOG' : macro redefinition
        game\GameEngine\Include\Precompiled\PreRTS.h(24) : see previous definition of 'DEBUG_ASSERTLOG'
X:\Projects\Open-BFME-1\.codex\worktrees\finish-astra-1\inputs\reference\shims\sweep\Common\Debug.h(192) : warning C4005: 'DEBUG_CRASH' : macro redefinition
        game\GameEngine\Include\Precompiled\PreRTS.h(21) : see previous definition of 'DEBUG_CRASH'
X:\Projects\Open-BFME-1\.codex\worktrees\finish-astra-1\inputs\reference\shims\sweep\Common\Debug.h(193) : warning C4005: 'DEBUG_ASSERTCRASH' : macro redefinition
        game\GameEngine\Include\Precompiled\PreRTS.h(22) : see previous definition of 'DEBUG_ASSERTCRASH'
X:\Projects\Open-BFME-1\.codex\worktrees\finish-astra-1\inputs\reference\shims\sweep\Common\Debug.h(204) : warning C4005: 'RELEASE_CRASH' : macro redefinition
        game\GameEngine\Include\Precompiled\PreRTS.h(25) : see previous definition of 'RELEASE_CRASH'
X:\Projects\Open-BFME-1\.codex\worktrees\finish-astra-1\inputs\reference\shims\sweep\Common\GameMemory.h(75) : fatal error C1083: Cannot open include file: 'Common/Errors.h': No such file or directory

```
