// cl: /DNDEBUG /MD /EHsc /Igame/Libraries/Source/WWVegas/WWLib
#include "ascii_string.h"

void j_00033910(void);
void j_0001981c(void);

class User003AD440
{
};

class BfmeElem12Flat
{
public:
    // ?bfmeByte@BfmeElem12Flat@@QBEEXZ absent-from-retail
    unsigned char bfmeByte(void) const { return m_bfmeByte; }

    char m_bfmeHead[0x04];
    AsciiString m_bfmeName;
    unsigned char m_bfmeByte;
    char m_bfmeTail[0x03];
};

class BfmeElem12FlatVector
{
public:
    // ?bfmeSize@BfmeElem12FlatVector@@QBEIXZ absent-from-retail
    unsigned int bfmeSize(void) const
    {
        return (unsigned int)(((char *)m_bfmeEnd - (char *)m_bfmeBegin) / 12);
    }

    char *m_bfmeBegin;
    char *m_bfmeEnd;
};

class Glo012F1024Item
{
public:
    void j_0000d1d4(void);

    char m_bfmeHead[0x54];
    BfmeElem12FlatVector m_bfmeFlat;
};

class BfmeGlobal_012f1028
{
public:
    // ?m@BfmeGlobal_012f1028@@QAEXABVAsciiString@@E@Z absent-from-retail
    __forceinline void m(const AsciiString &value, unsigned char flag)
    {
        union
        {
            void (*raw)(void);
            void (BfmeGlobal_012f1028::*typed)(const AsciiString &, unsigned char);
        } call;
        call.raw = &j_0001981c;
        (this->*call.typed)(value, flag);
    }
};

class Glo012F1028Type;
extern Glo012F1028Type *Glo012F1028;

// ?j_0000d1d4@Glo012F1024Item@@QAEXXZ
void Glo012F1024Item::j_0000d1d4(void)
{
    union
    {
        void (*raw)(void);
        AsciiString (User003AD440::*GetName)(void);
    } getter;
    getter.raw = &j_00033910;
    Glo012F1024Item *owner = this;
    for (unsigned int index = 0; index < owner->m_bfmeFlat.bfmeSize(); ++index)
    {
        char *begin = owner->m_bfmeFlat.m_bfmeBegin;
        BfmeElem12Flat *element = (BfmeElem12Flat *)(begin + index * 12);
        ((BfmeGlobal_012f1028 *)Glo012F1028)->m((((User003AD440 *)element)->*getter.GetName)(), element->bfmeByte());
    }
}
