// ?d_007dbd40@@YAXXZ
// partial score=0.6222 date=2026-10-11
// cl: /DNDEBUG /MD /Igame

#include "GameEngine/Source/Common/System/d3dx8math.h"
#include "Libraries/Include/Lib/Coord2D.h"

typedef float Real;

struct IDirect3DBaseTexture8;
struct IDirect3DSurface8;
struct Texture;


struct Device;
struct DeviceVtable
{
	char pad0[0xe4];
	long (__stdcall *SetRenderState)(Device *, unsigned long, unsigned);
	char pad1[0x104 - 0xe8];
	long (__stdcall *SetTexture)(Device *, unsigned, void *);
	char pad2[4];
	long (__stdcall *SetTextureStageState)(Device *, unsigned, unsigned,
		unsigned);
	char samplerGap[4];
	long (__stdcall *SetSamplerState)(Device *, unsigned, unsigned, unsigned);
	char pad3[0x14c - 0x118];
	long (__stdcall *DrawPrimitiveUP)(Device *, unsigned, unsigned,
		const void *, unsigned);
	char pad4[0x164 - 0x150];
	long (__stdcall *SetFVF)(Device *, unsigned);
	char pad5[0x170 - 0x168];
	long (__stdcall *SetVertexShader)(Device *, void *);
};

struct Device
{
	DeviceVtable *v;
};

class BfmeTacticalView
{
public:
	virtual void slot00() = 0;
	virtual void slot01() = 0;
	virtual void slot02() = 0;
	virtual void slot03() = 0;
	virtual void slot04() = 0;
	virtual void slot05() = 0;
	virtual void slot06() = 0;
	virtual void slot07() = 0;
	virtual void slot08() = 0;
	virtual void slot09() = 0;
	virtual void slot10() = 0;
	virtual void slot11() = 0;
	virtual void slot12() = 0;
	virtual void slot13() = 0;
	virtual void slot14() = 0;
	virtual int getWidth() = 0;
	virtual void slot16() = 0;
	virtual int getHeight() = 0;
	virtual void slot18() = 0;
	virtual void getOrigin(int *, int *) = 0;
};

// Existing 0x0090DC60 routing declaration; ECX receives a handle address.
// The decoded receiver does not prove the canonical TextureBaseClass layout.
class TextureBaseClass
{
public:
	IDirect3DBaseTexture8 *Peek_D3D_Base_Texture() const;
};

class ShroudTexture
{
public:
	TextureBaseClass *p;
};

class DX8Wrapper
{
public:
	static void Set_Render_Target(IDirect3DSurface8 *, bool);
	static void Set_DX8_Render_State(unsigned long, unsigned);
	static void Apply_Render_State_Changes();
};

void BoxSetTexture(unsigned, TextureBaseClass *&);
unsigned bfmeCurrentCU();
void bfmeHighlightApply(unsigned, void *, unsigned, Texture *,
	IDirect3DSurface8 *, Texture *, IDirect3DSurface8 *);
extern "C" __declspec(dllimport) double BfmeFloorER(double);
// ?fast_float2long_round@@YAJM@Z absent-from-retail
// The native BaseType helper uses the active x87 rounding mode.
__forceinline long fast_float2long_round(float value)
{
    long result;
    __asm {
        fld [value]
        fistp [result]
    }
    return result;
}

extern Device *ScreenDevice;
#define BfmeDeviceGlobal ScreenDevice
class View;
extern View *TheTacticalView;
#define BfmeTacticalViewGlobal ((BfmeTacticalView *)TheTacticalView)
extern bool HighlightRendering;
#define g_bfmeHighlightRendering HighlightRendering

// This inherited layout view represents only the witnessed flag at +0xDBD.
struct GlobalData
{
    char pad[0xdbd];
    bool active;
};
extern GlobalData *TheWritableGlobalData;

extern Real GridFrameScale;
extern const Real g_bfmeDefaultBU;
extern const Real g_bfmeK1266A;
extern const Real g_bfmeK1253;
extern const Real Rva00064680NegativeScale;

enum FilterModes { FM_NULL_MODE = 0 };

class Rva007DCA80
{
public:
	virtual int init();
	virtual int shutdown();
	virtual bool preRender(bool &, int &);
	virtual bool postRender(FilterModes, Coord2D &, bool &, Coord2D *);
	virtual bool setup(int);
	virtual int set(FilterModes);
	virtual void reset();

	unsigned long pixelShader;
	unsigned long vertexShader;
	unsigned pad0[2];
    Real m_14;
    int count;
    bool saved;
    char pad1[3];
    Real offset20, offset24, offset28;
    unsigned size;
    bool valid;
    char pad2[3];
    unsigned snap[3];
	TextureBaseClass *texture[3];
	IDirect3DSurface8 *surface[3];
	ShroudTexture vapor[2];
};

struct FrameTable
{
	int counts[13];
};


// ?postRender@Rva007DCA80@@UAE_NW4FilterModes@@AAUCoord2D@@AA_NPAU3@@Z
bool Rva007DCA80::postRender(FilterModes mode, Coord2D &unused, bool &extra,
	Coord2D *displaySize)
{
	bool saved = this->saved;
	GlobalData *globalData = TheWritableGlobalData;
	globalData->active = saved;
	g_bfmeHighlightRendering = false;
	if (this->valid)
	{
		DX8Wrapper::Set_Render_Target(0, true);
		reset();
		extra = true;
		this->valid = false;
		return true;
	}
	if (!set(mode))
		return false;
	FrameTable frameTable;
	int *frameCounts = frameTable.counts;
	Real frameScale = 80.0f /
		GridFrameScale;
	frameCounts[0] = 15;
	frameCounts[1] = 16;
	frameCounts[2] = 15;
	frameCounts[3] = 17;
	frameCounts[4] = 18;
	frameCounts[5] = 17;
	frameCounts[6] = 20;
	frameCounts[7] = 21;
	frameCounts[8] = 19;
	frameCounts[9] = 20;
	frameCounts[10] = 17;
	frameCounts[11] = 18;
	frameCounts[12] = 16;
	Real frame = *(Real *)0x013073b8 + 0.6f;
	*(Real *)0x013073b8 = frame;
	if (frame >= 13.0f)
		*(Real *)0x013073b8 = 0.0f;
	Real framePosition = (Real)BfmeFloorER(
		(double)*(Real *)0x013073b8);
	int frameIndex = fast_float2long_round(framePosition);
	this->count = (int)((float)frameCounts[frameIndex] * frameScale);
	if (this->count < 3)
		this->count = 3;


    bfmeHighlightApply(*(unsigned *)(bfmeCurrentCU() + 8), snap,
        size, (Texture *)texture[0], surface[1], (Texture *)texture[1], surface[0]);

    Device *device = BfmeDeviceGlobal;
    struct Vertex
    {
        D3DXVECTOR4 p;
        unsigned color;   // diffuse color
        Real u0, v0, u1, v1, u2, v2;
    } v[4];

    if (this->offset24 > 1.0f)
        this->offset24 -= 1.0f;
    if (this->offset20 < -1.0f)
        this->offset20 += 1.0f;
    if (this->offset28 > 1.0f)
        this->offset28 -= 1.0f;
    this->offset24 += 0.03f;
    this->offset20 -= 0.0225f;
    this->offset28 += 0.02f;

    BfmeDeviceGlobal->v->SetTexture(BfmeDeviceGlobal, 0, texture[0]);
    int x0, y0, width, height;
    BfmeTacticalViewGlobal->getOrigin(&x0, &y0);
    width = BfmeTacticalViewGlobal->getWidth();
    height = BfmeTacticalViewGlobal->getHeight();

    BoxSetTexture(1, vapor[1].p);
    device->v->SetSamplerState(device, 1, 1, 1);
    device->v->SetSamplerState(device, 1, 2, 1);
    device->v->SetSamplerState(device, 2, 1, 1);
    device->v->SetSamplerState(device, 2, 2, 1);
    BoxSetTexture(2, vapor[0].p);
    device->v->SetTexture(device, 2,
        ((TextureBaseClass *)&vapor[0])->Peek_D3D_Base_Texture());

    Real radius = 3.0f / frameScale;
    //bottom right
    v[0].p = D3DXVECTOR4(x0 + width - 0.5f, y0 + height - 0.5f, 0.0f, 1.0f);
    v[0].u0 = (Real)(x0 + width) / displaySize->x;
    v[0].v0 = (Real)(y0 + height) / displaySize->y;
    //top right
    v[1].p = D3DXVECTOR4(x0 + width - 0.5f, y0 - 0.5f, 0.0f, 1.0f);
    v[1].u0 = (Real)(x0 + width) / displaySize->x;
    v[1].v0 = (Real)y0 / displaySize->y;
    //bottom left
    v[2].p = D3DXVECTOR4(x0 - 0.5f, y0 + height - 0.5f, 0.0f, 1.0f);
    v[2].u0 = (Real)x0 / displaySize->x;
    v[2].v0 = (Real)(y0 + height) / displaySize->y;
    //top left
    v[3].p = D3DXVECTOR4(x0 - 0.5f, y0 - 0.5f, 0.0f, 1.0f);
    v[3].u0 = (Real)x0 / displaySize->x;
    v[3].v0 = (Real)y0 / displaySize->y;
    v[0].color = 0xffffffff;
    v[1].color = 0xffffffff;
    v[2].color = 0xffffffff;
    v[3].color = 0xffffffff;

    v[0].u1 = 2.0f * radius + this->offset20;
    v[0].v1 = radius + this->offset24;
    v[0].v2 = v[0].v1;
    v[0].u2 = v[0].u1 - this->offset28;
    v[0].u1 += this->offset28;
    v[1].u1 = 2.0f * radius + this->offset20;
    v[1].v1 = this->offset24;
    v[1].v2 = v[1].v1;
    v[1].u2 = v[1].u1 - this->offset28;
    v[1].u1 += this->offset28;
    v[2].u1 = this->offset20;
    v[2].v1 = radius + this->offset24;
    v[2].v2 = v[2].v1;
    v[2].u2 = v[2].u1 - this->offset28;
    v[2].u1 += this->offset28;
    v[3].u1 = this->offset20;
    v[3].v1 = v[1].v1;
    v[3].v2 = v[3].v1;
    v[3].u2 = v[3].u1 - this->offset28;
    v[3].u1 += this->offset28;

	if (*(unsigned char *)0x012bc2c3)
		{
        DX8Wrapper::Set_DX8_Render_State(0x13, 2);
        DX8Wrapper::Set_DX8_Render_State(0x14, 4);
    }
	else
		{
        DX8Wrapper::Set_DX8_Render_State(0x13, 5);
        DX8Wrapper::Set_DX8_Render_State(0x14, 6);
    }
	DX8Wrapper::Set_DX8_Render_State(0x1b, 1);
	DX8Wrapper::Apply_Render_State_Changes();
	device->v->SetRenderState(device, 0x1b, 1);
	device->v->SetVertexShader(device, 0);
	device->v->SetFVF(device, 0x344);
	device->v->SetTextureStageState(device, 0, 1, 3);
	device->v->SetTextureStageState(device, 0, 0xb, 0);
	device->v->SetTextureStageState(device, 0, 2, 1);
	device->v->SetTextureStageState(device, 0, 3, 2);
	device->v->SetTextureStageState(device, 0, 5, 1);
	device->v->SetTextureStageState(device, 0, 6, 2);
	device->v->SetTextureStageState(device, 0, 4, 3);
	device->v->SetTextureStageState(device, 1, 1, 4);
	device->v->SetTextureStageState(device, 1, 0xb, 1);
	device->v->SetTextureStageState(device, 1, 2, 1);
	device->v->SetTextureStageState(device, 1, 3, 2);
	device->v->SetTextureStageState(device, 1, 4, 5);
	device->v->SetTextureStageState(device, 1, 5, 1);
	device->v->SetTextureStageState(device, 1, 6, 2);
	device->v->SetTextureStageState(device, 2, 1, 5);
	device->v->SetTextureStageState(device, 2, 0x18, 0);
	device->v->SetTextureStageState(device, 2, 0xb, 2);
	device->v->SetTextureStageState(device, 2, 2, 1);
	device->v->SetTextureStageState(device, 2, 3, 2);
	device->v->SetTextureStageState(device, 2, 4, 5);
	device->v->SetTextureStageState(device, 2, 5, 1);
	device->v->SetTextureStageState(device, 2, 6, 2);
	device->v->DrawPrimitiveUP(device, 5, 2, v, sizeof(Vertex));
	reset();
	return true;
}
