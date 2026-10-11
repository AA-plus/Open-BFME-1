// ?d_007d9aa0@@YAXXZ
// partial score=0.4222 date=2026-10-11
// cl: /DNDEBUG /MD /EHsc /DWIN32 /D_WINDOWS /Igame/Libraries/Include /Igame/Libraries/Source/WWVegas/WWLib /Igame/Libraries/Source/WWVegas/WWMath /Igame/Libraries/Source/WWVegas/WWSaveLoad /Igame/Libraries/Source/WWVegas/WW3D2 /Iinputs/reference/shims/sweep /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/GameEngine/Include /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/GameEngine/Source /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Libraries/Include /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Libraries/Source /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Libraries/Source/Compression /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Libraries/Source/debug /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Libraries/Source/WWVegas /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/GameEngineDevice/Include /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Libraries/Source/WWVegas/WW3D2 /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Libraries/Source/WWVegas/WWMath /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Libraries/Source/WWVegas/WWDebug /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Libraries/Source/WWVegas/WWSaveLoad /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Main
#include "dx8wrapper.h"
#include "Lib/Coord2D.h"

enum FilterModes { FM_NULL_MODE=0 };

struct Device;
struct DeviceVtable {
 char p0[0xe4]; long (__stdcall *SetRenderState)(Device*,unsigned long,unsigned);
 char p1[0x104-0xe8]; long (__stdcall *SetTexture)(Device*,unsigned,IDirect3DBaseTexture8*);
 char p2[4]; long (__stdcall *SetTextureStageState)(Device*,unsigned,unsigned,unsigned);
 char p3[4]; long (__stdcall *SetSamplerState)(Device*,unsigned,unsigned,unsigned);
 char p4[0x14c-0x118]; long (__stdcall *DrawPrimitiveUP)(Device*,unsigned,unsigned,const void*,unsigned);
 char p5[0x164-0x150]; long (__stdcall *SetVertexShader)(Device*,unsigned);
 char p6[8]; long (__stdcall *SetNativeShader)(Device*,unsigned);
 char p6b[0x1ac-0x174]; long (__stdcall *SetPixelShader)(Device*,unsigned);
 char p7[4]; long (__stdcall *SetPixelShaderConstantF)(Device*,unsigned,const float*,unsigned);
};
struct Device { DeviceVtable*v; };
extern Device *ScreenDevice;
extern bool ScreenSnapshot;
extern unsigned ScreenRenderStates[];
extern unsigned ScreenTextureStageStates[][32];
extern unsigned ScreenStateChanges, ScreenTextureStageStateChanges, number_of_DX8_calls;


class Rva012F1600Interface {
public:
 virtual void s00();virtual void s01();virtual void s02();virtual void s03();
 virtual void s04();virtual void s05();virtual void s06();virtual void s07();
 virtual void s08();virtual void s09();virtual void s10();virtual void s11();
 virtual void s12();virtual void s13();virtual void s14();virtual int width();
 virtual void s16();virtual int height();virtual void s18();virtual void origin(int*,int*);
};
class View; extern View *TheTacticalView;
static __forceinline Rva012F1600Interface *tacticalView() { return (Rva012F1600Interface *)TheTacticalView; }
struct GridValueRva007D9AA0 {float X,Y,Z;};
struct GridGlobals {
 float m_00, m_04;
 GridValueRva007D9AA0 m_08, m_14;
 float m_20, m_24;
 char pad28[0x24];
 float m_4C, m_50, scale; int count, count1;
};
GridGlobals *GridScaleRva007D95B0();
extern float GridFrameScale;
class BoxDynamicVBAccessClass {
 void *m_bfmeSlot;
 unsigned m_bfmeType,m_bfmeFVF,m_bfmeStart;
 unsigned short m_bfmeCount,m_bfmePad;
 void *m_bfme0014;
public:
 BoxDynamicVBAccessClass(unsigned,unsigned,unsigned short,unsigned);
 ~BoxDynamicVBAccessClass();
};
class ScreenGridRva007D95B0 {
 char pad[0x20];float scrollX,scrollY,spread;
public:
 void update(DynamicIBAccessClass*,int,BoxDynamicVBAccessClass*,int,int,int,float,float,float,float,Coord2D*);
};
struct Texture;
void bfmeHighlightApply(unsigned,void*,unsigned,Texture*,IDirect3DSurface8*,Texture*,IDirect3DSurface8*);

static __forceinline void setRenderState(unsigned long state,unsigned value) {
 if(ScreenRenderStates[state]==value)return;
 if(ScreenSnapshot) { StringClass s(0,true);DX8Wrapper::Get_DX8_Render_State_Value_Name(s,(D3DRENDERSTATETYPE)state,value); }
 ScreenRenderStates[state]=value;
 ScreenDevice->v->SetRenderState(ScreenDevice,state,value);
 ++number_of_DX8_calls;++ScreenStateChanges;
}
static __forceinline void setStageState(unsigned state,unsigned value) {
 if(ScreenTextureStageStates[0][state]==value)return;
 if(ScreenSnapshot) { StringClass s(0,true);DX8Wrapper::Get_DX8_Texture_Stage_State_Value_Name(s,(D3DTEXTURESTAGESTATETYPE)state,value); }
 ScreenTextureStageStates[0][state]=value;
 ScreenDevice->v->SetTextureStageState(ScreenDevice,0,state,value);
 ++number_of_DX8_calls;++ScreenTextureStageStateChanges;
}
struct PositionRva007D9AA0 { float X,Y,Z,W; PositionRva007D9AA0(){} PositionRva007D9AA0(float x,float y,float z,float w):X(x),Y(y),Z(z),W(w){} };
struct VertexRva007D9AA0 {
 PositionRva007D9AA0 position;unsigned color;float u0,v0,u1,v1,u2,v2;
};
class ScreenMotionBlurFilter {
public:
 virtual int init();virtual int shutdown();virtual bool preRender(bool&,int&);
 virtual bool postRender(FilterModes,Coord2D&,bool&,Coord2D*);virtual bool setup(int);
protected:
 virtual int set(FilterModes);virtual void reset();
 unsigned m_04,m_08,m_0C;
 TextureBaseClass *m_10,*m_14;
 unsigned m_18,m_1C;
 float scrollX,scrollY,spread;
 unsigned m_2C,m_30,m_34;
 unsigned m_38,m_3C,m_40;Texture *m_44,*m_48;IDirect3DSurface8 *m_4C,*m_50;
};

// ?postRender@ScreenMotionBlurFilter@@UAE_NW4FilterModes@@AAUCoord2D@@AA_NPAU3@@Z
bool ScreenMotionBlurFilter::postRender(FilterModes mode,Coord2D &scrollDelta,bool &doExtraRender,Coord2D *dims) {
 DX8Wrapper::Set_Render_Target(0,true);
 if(!set(mode))return false;
 doExtraRender=false;
 Device *device=ScreenDevice;
 static bool useHighlight=GridScaleRva007D95B0()->count>1;
 if(useHighlight)bfmeHighlightApply(0x3f4ccccd,&m_2C,256,(Texture*)m_18,m_4C,m_44,m_50);
 if(GridScaleRva007D95B0()->count1>1)bfmeHighlightApply(0x3f800000,&m_38,256,(Texture*)m_18,m_4C,m_44,(IDirect3DSurface8*)m_1C);
 int left,top;
 tacticalView()->origin(&left,&top);
 int width=tacticalView()->width();
 int height=tacticalView()->height();
 if(scrollY>1.0f)scrollY-=1.0f;
 if(scrollX<-1.0f)scrollX+=1.0f;
 if(spread>1.0f)spread-=1.0f;
 scrollY+=GridScaleRva007D95B0()->m_4C*0.03f;
 scrollX-=GridScaleRva007D95B0()->m_4C*0.0225f;
 spread+=(float)(GridScaleRva007D95B0()->m_50*0.005);
 float scale=GridFrameScale*0.0125f;
 if(scale>6.0f)scale=6.0f;else if(scale<0.6f)scale=0.6f;
 float amplitude=scale*GridScaleRva007D95B0()->scale;
 VertexRva007D9AA0 vertices[4];
 vertices[0].position=PositionRva007D9AA0((float)(width+left)-0.5f,(float)(height+top)-0.5f,0,1);
 vertices[0].u0=(float)(width+left)/dims->x;vertices[0].v0=(float)(height+top)/dims->y;
 vertices[1].position=PositionRva007D9AA0((float)(width+left)-0.5f,(float)top-0.5f,0,1);
 vertices[1].u0=(float)(width+left)/dims->x;vertices[1].v0=(float)top/dims->y;
 vertices[2].position=PositionRva007D9AA0((float)left-0.5f,(float)(height+top)-0.5f,0,1);
 vertices[2].u0=(float)left/dims->x;vertices[2].v0=(float)(height+top)/dims->y;
 vertices[3].position=PositionRva007D9AA0((float)left-0.5f,(float)top-0.5f,0,1);
 vertices[3].u0=(float)left/dims->x;vertices[3].v0=(float)top/dims->y;
 vertices[0].color=vertices[1].color=vertices[2].color=vertices[3].color=0x64ffffff;
 vertices[0].u1=amplitude*2+scrollX;vertices[0].v1=amplitude+scrollY;
 vertices[0].u1+=spread;vertices[0].v2=vertices[0].v1+spread;vertices[0].u2=vertices[0].u1-spread;vertices[0].u1+=spread;
 vertices[1].u1=amplitude*2+scrollX;vertices[1].v1=scrollY;
 vertices[1].u1+=spread;vertices[1].v2=vertices[1].v1+spread;vertices[1].u2=vertices[1].u1-spread;vertices[1].u1+=spread;
 vertices[2].u1=scrollX;vertices[2].v1=amplitude+scrollY;
 vertices[2].u1+=spread;vertices[2].v2=vertices[2].v1+spread;vertices[2].u2=vertices[2].u1-spread;vertices[2].u1+=spread;
 vertices[3].u1=scrollX;vertices[3].v1=scrollY;
 vertices[3].u1+=spread;vertices[3].v2=vertices[3].v1+spread;vertices[3].u2=vertices[3].u1-spread;vertices[3].u1+=spread;
 device->v->SetVertexShader(device,0x344);
 float opacity;
 {
 Vector4 constants1,constants2;
 {
 Vector4 constants(0.3f,0.59f,0.11f,1.0f);
 device->v->SetPixelShaderConstantF(device,0,&constants.X,1);
 }
 {
 GridValueRva007D9AA0 value=GridScaleRva007D95B0()->m_14;
 constants1.Set(value.X,value.Y,value.Z,1.0f);
 device->v->SetPixelShaderConstantF(device,1,&constants1.X,1);
 }
 {
 GridValueRva007D9AA0 value=GridScaleRva007D95B0()->m_08;
 constants2.Set(value.X,value.Y,value.Z,1.0f);
 device->v->SetPixelShaderConstantF(device,2,&constants2.X,1);
 }
 {
 float f=GridScaleRva007D95B0()->m_20;
 Vector4 constants(f,f,f,f);
 device->v->SetPixelShaderConstantF(device,3,&constants.X,1);
 f=GridScaleRva007D95B0()->m_00/(scale*80.0f);constants.Set(f,f,f,1.0f);
 device->v->SetPixelShaderConstantF(device,4,&constants.X,1);
 opacity=GridScaleRva007D95B0()->m_04;constants.Set(opacity,opacity,opacity,opacity);
 device->v->SetPixelShaderConstantF(device,5,&constants.X,1);
 f=GridScaleRva007D95B0()->m_24;constants.Set(f,f,f,f);
 device->v->SetPixelShaderConstantF(device,6,&constants.X,1);
 constants.Set(0.55f,0.45f,0.5f,0.5f);
 device->v->SetPixelShaderConstantF(device,7,&constants.X,1);
 }
 }
 setRenderState(27,1);DX8Wrapper::Apply_Render_State_Changes();
 device->v->SetTexture(device,0,(IDirect3DBaseTexture8*)m_18);
 device->v->SetTexture(device,1,0);
 setStageState(2,2);setStageState(3,1);setStageState(1,2);
 setStageState(5,2);setStageState(6,1);setStageState(4,2);setStageState(11,1);
 device->v->SetPixelShader(device,m_0C);
 device->v->SetNativeShader(device,0);
 device->v->SetVertexShader(device,0x344);
 device->v->DrawPrimitiveUP(device,5,2,vertices,44);
 DynamicIBAccessClass ib(2,606);
 BoxDynamicVBAccessClass vb(2,14,202,0);
 ((ScreenGridRva007D95B0*)this)->update(&ib,606,&vb,202,10,10,(float)left,(float)top,(float)width,(float)height,dims);
 DX8Wrapper::Set_Index_Buffer(ib,0);
 DX8Wrapper::Set_Vertex_Buffer((const DynamicVBAccessClass&)vb);
 DX8Wrapper::Apply_Render_State_Changes();
 if(useHighlight) { device->v->SetTexture(device,3,(IDirect3DBaseTexture8*)m_48);device->v->SetTexture(device,4,(IDirect3DBaseTexture8*)m_48); }
 else { device->v->SetTexture(device,3,(IDirect3DBaseTexture8*)m_18);device->v->SetTexture(device,4,(IDirect3DBaseTexture8*)m_18); }
 device->v->SetTexture(device,1,((const TextureBaseClass*)&m_10)->Peek_D3D_Base_Texture());
 device->v->SetTexture(device,2,((const TextureBaseClass*)&m_14)->Peek_D3D_Base_Texture());
 device->v->SetSamplerState(device,0,1,3);device->v->SetSamplerState(device,0,2,3);
 device->v->SetSamplerState(device,1,1,1);device->v->SetSamplerState(device,1,2,1);
 device->v->SetSamplerState(device,2,1,1);device->v->SetSamplerState(device,2,2,1);
 device->v->SetSamplerState(device,3,1,3);device->v->SetSamplerState(device,3,2,3);
 device->v->SetSamplerState(device,4,1,3);device->v->SetSamplerState(device,4,2,3);
 device->v->SetRenderState(device,27,1);
 setRenderState(19,3);setRenderState(20,4);
 device->v->SetPixelShader(device,m_08);
 DX8Wrapper::Set_Render_Target(0,true);
 if(opacity>0) {
  device->v->SetVertexShader(device,0x444);
  if(WW3D::Is_Sorting_Enabled())DX8Wrapper::Draw_Triangles(0,200,0,202);
  else { device->v->DrawPrimitiveUP(device,5,2,vertices,44); }
 }
 reset();return true;
}
