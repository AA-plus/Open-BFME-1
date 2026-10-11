// ?renderShoreLines@BaseHeightMapRenderObjClass@@IAEXPAVCameraClass@@@Z
// partial score=0.9215 date=2026-10-11
// cl: /DNDEBUG /DWIN32 /D_WINDOWS /MD /EHsc /Iinputs/reference/shims/sweep /Igame/Libraries/Source/WWVegas/WW3D2 /Igame/Libraries/Source/WWVegas/WWLib /Iinputs/reference/shims/bfmeheightmap /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/GameEngine/Include /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/GameEngine/Source /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Libraries/Include /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Libraries/Source /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Libraries/Source/Compression /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/GameEngineDevice/Include /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Main /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Libraries/Source/WWVegas /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Libraries/Source/WWVegas/WWLib /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Libraries/Source/WWVegas/WW3D2 /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Libraries/Source/WWVegas/WWMath /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Libraries/Source/WWVegas/WWDebug /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Libraries/Source/WWVegas/WWSaveLoad
// stlport
#define Matrix4x4 Matrix4
#define __PLACEMENT_VEC_NEW_INLINE
#define _STLP_USE_STATIC_LIB

#include <windows.h>
#include <d3dx8core.h>
#include "dx8wrapper.h"
#include "Common/GlobalData.h"
#include "GameClient/Water.h"
#include "W3DDevice/GameClient/BaseHeightMap.h"

#define DEFAULT_MAX_BATCH_SHORELINE_TILES 512

class BoxDynamicVBAccessClass
{
	const FVFInfoClass &m_fvfInfo;
	unsigned m_type;
	unsigned m_fvf;
	unsigned m_start;
	unsigned short m_vertexCount;
	unsigned short m_vertexBufferOffset;
	class BoxVertexBufferClass *m_vertexBuffer;

public:
	BoxDynamicVBAccessClass(unsigned type, unsigned fvf, unsigned short vertexCount, unsigned start);
	~BoxDynamicVBAccessClass();

	class WriteLockClass
	{
		BoxDynamicVBAccessClass *m_dynamicVBAccess;
		VertexFormatXYZNDUV2 *m_vertices;

	public:
		__declspec(noinline) WriteLockClass(BoxDynamicVBAccessClass *vbAccess);
		__declspec(noinline) ~WriteLockClass();
		VertexFormatXYZNDUV2 *Get_Formatted_Vertex_Array() { return m_vertices; }
	};
};

void __cdecl BoxSetTexture(unsigned stage, TextureBaseClass *&texture);
void __cdecl BaseHeightMapScorchSetZBias(Int bias);
int __cdecl Rva00903060Get();
class Gen_0074B410 { public: bool bfmeBitA(int x, int y) const; };
typedef HRESULT (__stdcall *Rva006CCE70SetStageCall)(IDirect3DDevice8 *, DWORD, DWORD, DWORD);
struct Rva006CCE70DeviceTable {
    void *m_unmodeled[0x10c / 4];
    Rva006CCE70SetStageCall m_stage;
};
class ShorelineStateAdapter006CCE70 : public DX8Wrapper {
public:
    static __forceinline void setShoreWorldAndColor() {
        unsigned changed = (*reinterpret_cast<volatile unsigned *>(&render_state_changed) & ~(1u << 18)) | 1u;
        unsigned previous = *reinterpret_cast<volatile unsigned *>(&RenderStates[D3DRS_COLORWRITEENABLE]);
        volatile float *world = reinterpret_cast<volatile float *>(&render_state.world);
        world[0] = 1.0f;
        world[1] = 0.0f;
        world[2] = 0.0f;
        world[3] = 0.0f;
        world[4] = 0.0f;
        world[5] = 1.0f;
        world[6] = 0.0f;
        world[7] = 0.0f;
        world[8] = 0.0f;
        world[9] = 0.0f;
        world[10] = 1.0f;
        world[11] = 0.0f;
        world[12] = 0.0f;
        world[13] = 0.0f;
        world[14] = 0.0f;
        world[15] = 1.0f;
        *reinterpret_cast<volatile unsigned *>(&render_state_changed) = changed;
        if (previous == D3DCOLORWRITEENABLE_ALPHA) return;
#ifdef MESH_RENDER_SNAPSHOT_ENABLED
        if (WW3D::Is_Snapshot_Activated()) {
            StringClass value_name(0, true);
            Get_DX8_Render_State_Value_Name(value_name, D3DRS_COLORWRITEENABLE, D3DCOLORWRITEENABLE_ALPHA);
        }
#endif
        RenderStates[D3DRS_COLORWRITEENABLE] = D3DCOLORWRITEENABLE_ALPHA;
        D3DDevice->SetRenderState(D3DRS_COLORWRITEENABLE, D3DCOLORWRITEENABLE_ALPHA);
        number_of_DX8_calls++;
        DX8_RECORD_RENDER_STATE_CHANGE();
    }
    static __forceinline void setShoreStage() {
        if (TextureStageStates[0][D3DTSS_TEXCOORDINDEX] == 0) return;
#ifdef MESH_RENDER_SNAPSHOT_ENABLED
        if (WW3D::Is_Snapshot_Activated()) {
            StringClass value_name(0, true);
            Get_DX8_Texture_Stage_State_Value_Name(value_name, D3DTSS_TEXCOORDINDEX, 0);
        }
#endif
        TextureStageStates[0][D3DTSS_TEXCOORDINDEX] = 0;
        (*reinterpret_cast<Rva006CCE70DeviceTable **>(D3DDevice))->m_stage(D3DDevice, 0, D3DTSS_TEXCOORDINDEX, 0);
        number_of_DX8_calls++;
        DX8_RECORD_TEXTURE_STAGE_STATE_CHANGE();
    }
};
class Rva006CCE70QuadReceiver {};
typedef void (Rva006CCE70QuadReceiver::*Rva006D2390QuadCall)(IRegion2D *);
struct Rva006CCE70Vtable {
    void *m_unmodeled[0x238 / 4];
    Rva006D2390QuadCall m_quad;
};
struct ShorelineTile006C76B0 { Int m_xy; Real t0, t1, t2, t3; };

#define getQuickFlipState(map, x, y) ((map)->bfmeBitA((x), (y)))

void BaseHeightMapRenderObjClass::renderShoreLines(CameraClass *pCamera)
{
	char *heightMap = reinterpret_cast<char *>(this);
	if (!*reinterpret_cast<const Bool *>(reinterpret_cast<const char *>(TheGlobalData) + 0x8c) ||
		*reinterpret_cast<Real *>(heightMap + 0x3018) == 0.0f ||
		*reinterpret_cast<Int *>(heightMap + 0x30c4) == 0) {
		return;
	}

	if (Rva00903060Get() != 21) {
		return;
	}

	Int vertexCount = 0;
	Int indexCount = 0;
	WorldHeightMap *map = *reinterpret_cast<WorldHeightMap **>(heightMap + 0x2ff4);
	Int width = *reinterpret_cast<Int *>(reinterpret_cast<char *>(map) + 8);
	Int border = *reinterpret_cast<Int *>(reinterpret_cast<char *>(map) + 0x10);
	IRegion2D quad;
	Rva006CCE70Vtable *vtable = *reinterpret_cast<Rva006CCE70Vtable **>(this);
	(reinterpret_cast<Rva006CCE70QuadReceiver *>(this)->*vtable->m_quad)(&quad);
	Int drawEdgeX = static_cast<Int>(static_cast<Real>(quad.hi.x));
	Int drawEdgeY = static_cast<Int>(static_cast<Real>(quad.hi.y));
	Int drawStartX = static_cast<Int>(static_cast<Real>(quad.lo.x));
	Int drawStartY = static_cast<Int>(static_cast<Real>(quad.lo.y));
	UnsignedShort *samples = *reinterpret_cast<UnsignedShort **>(reinterpret_cast<char *>(*reinterpret_cast<WorldHeightMap **>(heightMap + 0x2ff4)) + 0x24);
	Int j = 0;

	ShaderClass unlitShader = ShaderClass::_PresetOpaque2DShader;
	unlitShader.Set_Depth_Compare(ShaderClass::PASS_LEQUAL);
	DX8Wrapper::Set_Shader(unlitShader);
	VertexMaterialClass *vmat = VertexMaterialClass::Get_Preset(VertexMaterialClass::PRELIT_DIFFUSE);
	DX8Wrapper::Set_Material(vmat);
	REF_PTR_RELEASE(vmat);
	TextureBaseClass *&destAlphaTexture =
		*reinterpret_cast<TextureBaseClass **>(heightMap + 0x3090);
	BoxSetTexture(0, destAlphaTexture);
	ShorelineStateAdapter006CCE70::setShoreWorldAndColor();
	BaseHeightMapScorchSetZBias(1);
	ShorelineStateAdapter006CCE70::setShoreStage();

	while (j != *reinterpret_cast<Int *>(heightMap + 0x30c4)) {
		{
			BoxDynamicVBAccessClass vb_access(BUFFER_TYPE_DYNAMIC_DX8, 5,
			DEFAULT_MAX_BATCH_SHORELINE_TILES * 4, 0);
			DynamicIBAccessClass ib_access(BUFFER_TYPE_DYNAMIC_DX8,
			DEFAULT_MAX_BATCH_SHORELINE_TILES * 6);

			{
				BoxDynamicVBAccessClass::WriteLockClass lock(&vb_access);
				VertexFormatXYZNDUV2 *vb = lock.Get_Formatted_Vertex_Array();
				DynamicIBAccessClass::WriteLockClass lockib(&ib_access);
				UnsignedShort *ib = lockib.Get_Index_Array();
				if (!ib || !vb) {
					DX8Wrapper::Set_DX8_Render_State(D3DRS_COLORWRITEENABLE,
					D3DCOLORWRITEENABLE_BLUE | D3DCOLORWRITEENABLE_GREEN | D3DCOLORWRITEENABLE_RED);
					return;
				}

				for (; j < *reinterpret_cast<Int *>(heightMap + 0x30c4); ++j) {
					if (vertexCount >= DEFAULT_MAX_BATCH_SHORELINE_TILES * 4) {
						break;
					}

					ShorelineTile006C76B0 *shoreInfo =
					&(*reinterpret_cast<ShorelineTile006C76B0 **>(heightMap + 0x30c0))[j];
					Int x = shoreInfo->m_xy & 0xffff;
					Int y = shoreInfo->m_xy >> 16;

					if (x >= drawStartX && x < drawEdgeX && y >= drawStartY && y < drawEdgeY) {
						Int ndx = y * width + x;
						Real terrainZ0 = samples[ndx] * 0.0390625f;
						Real terrainZ1 = samples[ndx + 1] * 0.0390625f;
						Real terrainZ2 = samples[ndx + width + 1] * 0.0390625f;
						Real terrainZ3 = samples[ndx + width] * 0.0390625f;
						vb->x = (x - border) * 10.0f;
						vb->y = (y - border) * 10.0f;
						vb->z = terrainZ0;
						vb->u1 = shoreInfo->t0;
						vb->v1 = 0;
						++vb;

						vb->x = (x - border + 1) * 10.0f;
						vb->y = (y - border) * 10.0f;
						vb->z = terrainZ1;
						vb->u1 = shoreInfo->t1;
						vb->v1 = 0;
						++vb;

						vb->x = (x - border + 1) * 10.0f;
						vb->y = (y - border + 1) * 10.0f;
						vb->z = terrainZ2;
						vb->u1 = shoreInfo->t2;
						vb->v1 = 0;
						++vb;

						vb->x = (x - border) * 10.0f;
						vb->y = (y - border + 1) * 10.0f;
						vb->z = terrainZ3;
						vb->u1 = shoreInfo->t3;
						vb->v1 = 0;
						++vb;

						if (getQuickFlipState(reinterpret_cast<const Gen_0074B410 *>(*reinterpret_cast<WorldHeightMap **>(heightMap + 0x2ff4)), x, y)) {
							ib[0] = 1 + vertexCount;
							ib[1] = 3 + vertexCount;
							ib[2] = vertexCount;
							ib[3] = 1 + vertexCount;
							ib[4] = 2 + vertexCount;
							ib[5] = 3 + vertexCount;
						} else {
							ib[0] = vertexCount;
							ib[1] = 2 + vertexCount;
							ib[2] = 3 + vertexCount;
							ib[3] = vertexCount;
							ib[4] = 1 + vertexCount;
							ib[5] = 2 + vertexCount;
						}
						ib += 6;
						vertexCount += 4;
						indexCount += 6;
					}
				}
				DX8Wrapper::Set_Index_Buffer(ib_access, 0);
				DX8Wrapper::Set_Vertex_Buffer(*reinterpret_cast<const DynamicVBAccessClass *>(&vb_access));
			}
		}
		if (indexCount > 0 && vertexCount > 0) {
			DX8Wrapper::Draw_Triangles(0, indexCount / 3, 0, vertexCount);
		}

		vertexCount = 0;
		indexCount = 0;
	}
	DX8Wrapper::Set_DX8_Render_State(D3DRS_COLORWRITEENABLE,
		D3DCOLORWRITEENABLE_BLUE | D3DCOLORWRITEENABLE_GREEN | D3DCOLORWRITEENABLE_RED);
	BaseHeightMapScorchSetZBias(0);
	ShaderClass::Invalidate();
}
