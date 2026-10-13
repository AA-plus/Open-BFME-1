// ?d_00899af0@@YAXXZ
// partial score=0.5152 date=2026-10-13
// cl: /O2 /DNDEBUG /DWIN32 /D_WINDOWS /MD /Igame/GameEngine/Source/Common
#include "BfmeRva008C6BC0Reset.cpp"
class Gen0089C880 { public: void handle(); };
extern void (__cdecl *TheBfmeFree)(void *, unsigned int);
class BfmeChildA { public: ~BfmeChildA(); static void operator delete(void *p, unsigned int n) { TheBfmeFree(p,n); } private: char m_bytes[16]; };
struct Rva008AE770Stack;
extern Rva008AE770Stack Rva008AE770TheStack;
extern void *g_Rva01337A28Index;
extern int g_bfmeB1038;
extern int g_bfmeRegisterClass1015;
struct Rva00899AF0View { virtual void slot00(); virtual void slot04(); virtual void slot08(); };
class Rva89A2C0Derived; extern Rva89A2C0Derived *g_Va013379B4;
class BfmeThingVDW; extern BfmeThingVDW *g_Va013379FC;
class Rva89A540Derived; extern Rva89A540Derived *g_Va013379AC;
struct Rva00899C20Registry; extern Rva00899C20Registry *g_Va013387D8;
struct BfmeMap1024; extern BfmeMap1024 *g_bfmeMap1024;
class Rva89AA20Derived; extern Rva89AA20Derived *g_Va01337A00;
class Rva008A9B00; extern Rva008A9B00 *g_Va013379F0;
class BfmeA1029;
extern BfmeA1029 *g_Va013379EC;
extern BfmeA1029 *g_Va013379C4;
extern BfmeA1029 *g_Va013379C8;
extern BfmeA1029 *g_Va013379F8;
extern BfmeA1029 *g_Va013379B8;
extern BfmeA1029 *g_Va013379B0;
extern BfmeA1029 *g_Va01337A2C;
void d_00899af0() {
 ((Gen_008C6BC0 *)&Rva008AE770TheStack)->bfmeReset();
 if (g_Rva01337A28Index) {
  Gen0089C880 *p = (Gen0089C880 *)g_Rva01337A28Index;
  p->handle();
  delete (BfmeChildA *)p;
  g_Rva01337A28Index=0;
 }
 ((Rva00899AF0View *)g_Va013379B4)->slot08();
 ((Rva00899AF0View *)g_Va013379FC)->slot08();
 ((Rva00899AF0View *)g_Va013379AC)->slot08();
 ((Rva00899AF0View *)g_Va013387D8)->slot08();
 ((Rva00899AF0View *)g_bfmeMap1024)->slot08();
 ((Rva00899AF0View *)g_Va01337A00)->slot08();
 ((Rva00899AF0View *)g_Va013379F0)->slot08();
 TheBfmeFree((void *)g_bfmeB1038,0x3c0);
 ((Rva00899AF0View *)g_Va013379EC)->slot08(); g_Va013379EC=0;
 ((Rva00899AF0View *)g_Va013379C4)->slot08(); g_Va013379C4=0;
 ((Rva00899AF0View *)g_Va013379C8)->slot08(); g_Va013379C8=0;
 ((Rva00899AF0View *)g_Va013379F8)->slot08(); g_Va013379F8=0;
 ((Rva00899AF0View *)g_Va013379B8)->slot08(); g_Va013379B8=0;
 ((Rva00899AF0View *)g_Va013379B0)->slot08(); g_Va013379B0=0;
 ((Rva00899AF0View *)g_Va01337A2C)->slot08(); g_Va01337A2C=0;
 ((Rva00899AF0View *)g_bfmeRegisterClass1015)->slot08(); g_bfmeRegisterClass1015=0;
}
