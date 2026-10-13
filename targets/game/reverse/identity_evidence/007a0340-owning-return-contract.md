# Material texture getter 007A0340: owning-return ABI

Model gpt-6-astra, round37. Investigation only: no source/header/pin changes.
No rendobj.h change or parked-refusal retry. Explicit integer-RVA oracle
checks: existing Gen_007A0340::bfmeGet tier placeholder and the recorded
MaterialInfoClass::Get_Texture handle spelling tier invented both report
CONTRADICTED. Neither is a real-name gate rejection. No name correction or
new semantic identity is claimed here.

## Complete getter contract

Matched Bfme5FiftyOne.cpp supplies36B at007A0340. Raw entry pushes ECX as
one local word; +1 reads the handle-array pointer at this+24. After this
push, +4 reads the explicit index from ESP+0C; +D reads hidden result storage
from ESP+8. +18 writes the selected pointer to result[0]. A nonnull pointer
gets INC WORD PTR [pointer+4] at+1C. EAX remains the result-storage pointer.
POP ECX and RET8 at+20/+21 close the body at+24, followed by padding.
Thus ECX=receiver, stack=[hidden result pointer,index], result is4bytes,
callee pops8. Raw TextureClass* in EAX with RET4 is the wrong ABI.

The getter copy constructor in this matched TU copies one pointer and
increments its low16-bit count. Its default constructor nulls the pointer.
Those operations support an owning result, not a borrowed pointer result.
The provider's local destructor only decrements the word; this destructor
is NOT proven by matching the getter (no destruction occurs in its body).
It must not be propagated as the canonical handle destructor.

## Independent caller and lifetime evidence

Matched WaterRenderObjClamp007A0960.cpp,249B: +40 pushes index, +41 forms a
local address, +45 pushes that address, +46 loads material receiver into
ECX, and +48 calls ILT000366DD ->007A0340. The next instruction inspects
the pointer written in the local. Two further calls at+5F and+90 construct
separate expression temporaries, each cleaned by TextureClass::Release_Ref
(009EB7A0); the named check handle is also cleaned. The raw call/cleanup
sequence corroborates four-byte owning return and distinct EH lifetimes.
Matched MeshClass_Replace_Texture.cpp (0092DE80/194) compares the returned
handle with a const-reference old handle; MaterialRemapperCtor.cpp assigns
both src and dest getter results into owning remap fields.

Existing TextureHandleDestructor.cpp proves the12B BfmeHandleCX destructor
at0005CC00 and recorded retail twins: load pointer; null return; otherwise
tail-call009EB7A0. The texture release body36B first guards low16-bit count,
decrements it, tests zero and flag01000000, and conditionally dispatches
virtual+20. A bare decrement omits release/deletion semantics. Native
texture.h already defines TextureBaseClass::Add_Ref as a WORD increment and
an out-of-line Release_Ref. Generic RefCountClass uses its own contract;
its inline decrement must not replace the texture-specific method.

## Existing type and affected interface surface

BfmeHandleCX is the existing proven one-pointer C++ stand-in used by these
matched bodies. No shared header declaration was found. The current evidence
does not identify an original EA template specialization; do not invent one.
name_oracle MaterialInfoClass+24 has no BFME witness. The raw implementation
proves the slot independently; retain offset-derived labels where needed.

Canonical matinfo.h currently declares BOTH Get_Texture(int) and
Get_Texture(const char*) as raw TextureClass* and nonconst. matinfo.cpp's
integer implementation is explicitly present-unmatched and Add_Refs a raw
return. The name overload inline calls the integer overload and returns NULL
on a missing name. A repair needs owning return propagation through BOTH
paths (null handle on failure), the proven const integer receiver, and each
consumer's full-expression lifetime. Do not assert constness of the name
lookup overload without its independent evidence.

Textures is presently DynamicVectorClass<TextureClass*> in matinfo.h;
matched local material models and copy/getter consumers use handle elements.
Size equality of pointer and handle is insufficient: copy/destruction and
vector instantiations differ. Peek_Texture borrowed-pointer operations and
Replace_Texture mutations must be reviewed separately; no evidence here
changes every texture getter indiscriminately. MeshModel's three-argument
Get_Texture(index,pass,stage) is a separate owning-handle ABI and provider,
not007A0340. MaterialPassClass getters are also separate providers.

## Required repair sequence and limits

Establish one shared definition of the EXISTING BfmeHandleCX stand-in using
native TextureClass Add_Ref/Release_Ref and the witnessed one-pointer layout;
reconcile local definitions, especially the provider-only decrement facade.
Independently verify copy, destructor and assignment byte contracts, then
migrate MaterialInfo's integer and name overloads and owning vector storage,
updating affected expressions with the same temporary lifetimes. Preserve
existing verified provider identity or prepare normal identity correction
snapshots/evidence; do not add a semantic alias or pin.

This is a shared-header/dependent-source change requiring the normal full
gate, not a safe declaration-only patch. Run header_dependents on the actual
staged repair and all mandatory checks; the textual inventory below is NOT
a dependency receipt or a claim that every file directly calls007A0340.
The008FFF40 bank remains untouched. No byte trial or progress is claimed.

## Existing BfmeHandleCX textual consumers

Generated by rg -l BfmeHandleCX game --glob '*.h' --glob '*.cpp'.

- `game/GameEngineDevice/Source/W3DDevice/GameClient/BaseHeightMapRva006C90B0.cpp`
- `game/GameEngineDevice/Source/W3DDevice/GameClient/BaseHeightMapFloorElementInit006F8A60.cpp`
- `game/GameEngineDevice/Source/W3DDevice/GameClient/WorldHeightMapRva0074C690.cpp`
- `game/GameEngineDevice/Source/W3DDevice/GameClient/Water/Rva007AA820WaterDraw.cpp`
- `game/GameEngineDevice/Source/W3DDevice/GameClient/Water/WaterRenderObjVirtualDestructor.cpp`
- `game/GameEngineDevice/Source/W3DDevice/GameClient/Water/WaterRenderObjConstructor.cpp`
- `game/GameEngineDevice/Source/W3DDevice/GameClient/Water/WaterRenderObjClamp007A0960.cpp`
- `game/GameEngineDevice/Source/W3DDevice/GameClient/Water/W3DWater.cpp`
- `game/GameEngineDevice/Source/W3DDevice/GameClient/W3DTreeBufferDestructor.cpp`
- `game/GameEngineDevice/Source/W3DDevice/GameClient/W3DTreeBufferConstructor.cpp`
- `game/GameEngineDevice/Source/W3DDevice/GameClient/W3DTerrainBackgroundRva0072DC30.cpp`
- `game/GameEngineDevice/Source/W3DDevice/GameClient/W3DShrubBufferConstructor.cpp`
- `game/GameEngineDevice/Source/W3DDevice/GameClient/W3DShroudMaterialPassClass_Install_Materials.cpp`
- `game/GameEngineDevice/Source/W3DDevice/GameClient/W3DShaderManagerReleaseResources.cpp`
- `game/GameEngineDevice/Source/W3DDevice/GameClient/W3DShaderManager.cpp`
- `game/GameEngineDevice/Source/W3DDevice/GameClient/W3DRoadBuffer_drawRoads.cpp`
- `game/Libraries/Source/WWVegas/WW3D2/part_emt.cpp`
- `game/GameEngineDevice/Source/W3DDevice/GameClient/W3DMouseConstructor.cpp`
- `game/Libraries/Source/WWVegas/WW3D2/meshmdlio.cpp`
- `game/Libraries/Source/WWVegas/WW3D2/matinfo.cpp`
- `game/Libraries/Source/WWVegas/WW3D2/dxwrapper.cpp`
- `game/Libraries/Source/WWVegas/WW3D2/dx8renderer.cpp`
- `game/GameEngineDevice/Source/W3DDevice/GameClient/TerrainShader2StageSet.cpp`
- `game/GameEngineDevice/Source/W3DDevice/GameClient/ShroudTextureShaderSet.cpp`
- `game/GameEngineDevice/Source/W3DDevice/GameClient/Rva00C6DFB0TextureHandleInit.cpp`
- `game/GameEngineDevice/Source/W3DDevice/GameClient/Rva00C6C4A0MouseTextureArrayInit.cpp`
- `game/GameEngineDevice/Source/W3DDevice/GameClient/Shadow/W3DProjectedShadowUpdateTexture.cpp`
- `game/GameEngineDevice/Source/W3DDevice/GameClient/Shadow/W3DProjectedShadowManagerRva007B14A0.cpp`
- `game/Libraries/Source/WWVegas/WW3D2/TextureHandleGetName.cpp`
- `game/Libraries/Source/WWVegas/WW3D2/TextureHandleDestructor.cpp`
- `game/GameEngineDevice/Source/W3DDevice/GameClient/ScreenCrossFadeFilter_initMethodThunk.cpp`
- `game/GameEngineDevice/Source/W3DDevice/GameClient/ScreenCrossFadeFilterPostRender.cpp`
- `game/Libraries/Source/WWVegas/WW3D2/Rva008FF060WaterMaterialTextureSwap.cpp`
- `game/Libraries/Source/WWVegas/WW3D2/Rva00785FD0RendererInitialize.cpp`
- `game/Libraries/Source/WWVegas/WW3D2/Rva00785FD0RendererConstructor.cpp`
- `game/Libraries/Source/WWVegas/WW3D2/Rva00785FD0RendererApply.cpp`
- `game/Libraries/Source/WWVegas/WW3D2/BfmeHandleCXVectorDeletingDestructor.cpp`
- `game/Libraries/Source/WWVegas/WW3D2/MeshRecolor0092DF50.cpp`
- `game/GameEngine/Source/Common/Bfme5FiftyOne.cpp`
- `game/GameEngine/Source/Common/Bfme5FiftyFive.cpp`
- `game/Libraries/Source/WWVegas/WW3D2/MeshModelReplaceTexture.cpp`
- `game/GameEngine/Source/Common/Bfme5FiftyEight.cpp`
- `game/Libraries/Source/WWVegas/WW3D2/MeshModelMaterialLoading.cpp`
- `game/Libraries/Source/WWVegas/WW3D2/MeshModelMaterialIds.cpp`
- `game/GameEngine/Source/Common/Bfme5MeshMatDescGetTexture.cpp`
- `game/Libraries/Source/WWVegas/WW3D2/MeshModelLegacyMaterials.cpp`
- `game/Libraries/Source/WWVegas/WW3D2/MeshModelInstallMaterials.cpp`
- `game/Libraries/Source/WWVegas/WW3D2/MeshLoadContextLifecycle.cpp`
- `game/Libraries/Source/WWVegas/WW3D2/MeshLoadContextDestructor.cpp`
- `game/GameEngine/Source/Common/Bfme5FiftyTwo.cpp`
- `game/GameEngine/Source/Common/Bfme5FiftyThree.cpp`
- `game/Libraries/Source/WWVegas/WW3D2/MeshLoadContextAddLegacyMaterial.cpp`
- `game/GameEngine/Source/Common/Bfme5FiftySeven.cpp`
- `game/GameEngine/Source/Common/Bfme5ThirtySix.cpp`
- `game/Libraries/Source/WWVegas/WW3D2/MeshClass_Replace_Texture.cpp`
- `game/GameEngine/Source/Common/Bfme5ReadyQueue.cpp`
- `game/GameEngine/Source/Common/Bfme5ThirtyOne.cpp`
- `game/GameEngine/Source/Common/Bfme5ThirtyFive.cpp`
- `game/Libraries/Source/WWVegas/WW3D2/DX8FVFCategoryFindMatchingTextureBFME.cpp`
- `game/GameEngine/Source/Common/Bfme5Thirty.cpp`
- `game/Libraries/Source/WWVegas/WW3D2/DX8FVFCategoryFindMatchingMaterialBFME.cpp`
- `game/Libraries/Source/WWVegas/WW3D2/MaterialRemapperCtor.cpp`
- `game/Libraries/Source/WWVegas/WW3D2/DX8FVFCategoryContainerInsertToTextureCategory.cpp`
- `game/Libraries/Source/WWVegas/WW3D2/MaterialRemapTexture.cpp`
- `game/Libraries/Source/WWVegas/WW3D2/DX8FVFCategoryContainerGenerateTextureCategoriesBFME.cpp`
- `game/Libraries/Source/WWVegas/WW3D2/MaterialRemapMesh.cpp`
- `game/Libraries/Source/WWVegas/WW3D2/DX8FVFCategoryContainerChangePolygonRendererTextureBFME.cpp`
- `game/Libraries/Source/WWVegas/WW3D2/MaterialPassClassInstallMaterials.cpp`
- `game/Libraries/Source/WWVegas/WW3D2/DX8FVFCategoryContainerChangePolygonRendererMaterialBFME.cpp`
- `game/Libraries/Source/WWVegas/WW3D2/MaterialPassClassGetTexture.cpp`
- `game/Libraries/Source/WWVegas/WW3D2/MaterialPassClassDestructor.cpp`
- `game/Libraries/Source/WWVegas/WW3D2/MaterialInfoGetTextureIndex.cpp`
- `game/Libraries/Source/WWVegas/WW3D2/MaterialInfoCopyCtor.cpp`
- `game/Libraries/Source/WWVegas/WW3D2/MaterialInfoClassCtor.cpp`
- `game/Libraries/Source/WWVegas/WW3D2/MaterialCollectorDestructor.cpp`
- `game/GameEngine/Source/Common/Bfme5ThirtyTwo.cpp`
- `game/Libraries/Source/WWVegas/WW3D2/MaterialCollectorClass_ctor_Thunk.cpp`
- `game/Libraries/Source/WWVegas/WW3D2/Load_Texture.cpp`
- `game/GameEngine/Source/Common/Bfme/Rva006D6050Ctor.cpp`
- `game/Libraries/Source/WWVegas/WW3D2/DX8TextureCategoryAddMesh.cpp`
- `game/Libraries/Source/WWVegas/WW3D2/Gen_00945B20.cpp`
- `game/Libraries/Source/WWVegas/WW3D2/DebugStatisticsRecordTextureEnd.cpp`
- `game/GameEngine/Source/Common/BfmeConv1333.cpp`
- `game/GameEngine/Source/Common/BfmeConv1330.cpp`
- `game/GameEngine/Source/Common/BfmeHolderDtorBY.cpp`
- `game/GameEngine/Source/Common/BfmeOwnVVHDestructor.cpp`
- `game/GameEngine/Source/Common/Open2Conv004.cpp`
- `game/GameEngine/Source/Common/S3SingletonForwarders.cpp`
- `game/GameEngine/Source/Common/Rva006FD510MeshMatDescGetTexture.cpp`
- `game/GameEngine/Source/Common/Rva00C6C660CurrentHandleInitializer.cpp`
- `game/GameEngine/Source/Common/Rva00C6C520StaticInit.cpp`
