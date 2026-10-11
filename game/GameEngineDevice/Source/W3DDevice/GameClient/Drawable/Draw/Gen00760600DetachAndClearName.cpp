// candidate for retail 0x00760600 (69B), currently ?d_00760600@@YAXXZ
// cl: /DNDEBUG /MD /EHsc /O2
// W3DModelDraw-family DrawModule instance method. thiscall, 1 stack arg (ret 4).
// Guards on a member vtable-object pointer at +0x28; when present calls that
// member's own virtual slot 0x14 (vtbl offset 0x50), then forwards
// (param1, member+0x18) through a still-unidentified base helper at retail
// 0x0075BBA0 with an adjusted this (this-0x0C). Always clears an AsciiString
// member at +0x8C to the empty literal at 0x0107301C.

#include "../../../../../../Libraries/Source/WWVegas/WWLib/ascii_string.h"

class BfmeDrawVTableThing060600
{
public:
    virtual void d00(); virtual void d01(); virtual void d02(); virtual void d03();
    virtual void d04(); virtual void d05(); virtual void d06(); virtual void d07();
    virtual void d08(); virtual void d09(); virtual void d10(); virtual void d11();
    virtual void d12(); virtual void d13(); virtual void d14(); virtual void d15();
    virtual void d16(); virtual void d17(); virtual void d18(); virtual void d19();
    virtual void slot20();
};

extern const char g_Rva0107301CEmptyString[];

class Matrix3D;

class W3DModelDraw
{
public:
    void rva0075BBA0(int param1, const Matrix3D *transform);
};

class Gen_00760600
{
public:
    void m(int param1);
private:
    unsigned char m_unreconstructed_00[0x28];
    BfmeDrawVTableThing060600 *m_vtableThing; // +0x28
    unsigned char m_unreconstructed_2c[0x78 - 0x2c];
    unsigned char m_flag78;                   // +0x78
    unsigned char m_unreconstructed_79[3];
    int m_unreconstructed_7c;                 // +0x7c
    unsigned char m_unreconstructed_80[0x8c - 0x80];
    AsciiString m_name;                       // +0x8c
};

void Gen_00760600::m(int param1)
{
    BfmeDrawVTableThing060600 *vt = m_vtableThing;
    if (vt) {
        vt->slot20();
        void *ptr2 = (unsigned char *)vt + 0x18;
        void *base = (unsigned char *)this - 0x0C;
        ((W3DModelDraw *)base)->rva0075BBA0(param1, (const Matrix3D *)ptr2);
    }
    m_flag78 = 1;
    m_unreconstructed_7c = 0;
    m_name.StringBase<char>::set(g_Rva0107301CEmptyString, 0);
}
