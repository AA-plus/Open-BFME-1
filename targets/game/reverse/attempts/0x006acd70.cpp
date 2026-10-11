// ?adjust@Rva006AE150Entry@@QAEMPAVRva006AE150Argument@@@Z
// partial score=1.0 date=2026-10-11
// cl: /O2 /G7 /arch:SSE /EHsc /MD /D_STLP_USE_STATIC_LIB /Igame/Libraries/Source/WWVegas/WWLib
// stlport
#include <set>
#include "ascii_string.h"

class AudioEventRTS
{
public:
    bool isPositionalAudio() const;
};

class Rva000AF8C0CachedMode
{
public:
    int getMode();
};

class Rva006ACD70Info
{
public:
    virtual void slot00();
    virtual const AsciiString &slot04();
    char m_pad04[0x80];
    int m_type;
    int m_cachedMode;
    void *m_begin;
    void *m_end;
};

class Rva006AE150Argument
{
public:
    char m_pad08[8];
    void *m_value;
    const Rva006ACD70Info *getInfo() const { return static_cast<Rva006ACD70Info *>(m_value); }
};

class Rva006AE150Entry
{
public:
    float adjust(Rva006AE150Argument *argument);
private:
    char m_data[0xA0];
    _STL::set<AsciiString> m_names;
    char m_padAC[0xC8 - 0xAC];
    float m_volumes[6][2][4];
};

// Ported from Open BFME 2 Code/GameEngineDevice/Source/MilesAudioDevice/MilesAudioManager.cpp.
float Rva006AE150Entry::adjust(Rva006AE150Argument *argument)
{
    int positional = reinterpret_cast<AudioEventRTS *>(argument)->isPositionalAudio() || argument->getInfo()->m_type == 3 ? 1 : 0;
    int flags = 0;
    if (m_names.size() == 0 || m_names.find(const_cast<Rva006ACD70Info *>(argument->getInfo())->slot04()) == m_names.end())
        flags = 1;
    Rva006ACD70Info *info = const_cast<Rva006ACD70Info *>(argument->getInfo());
    if (info->m_begin == info->m_end)
        flags |= 2;
    return reinterpret_cast<float *>(reinterpret_cast<char *>(this) + 0xC8)[flags + (positional + reinterpret_cast<Rva000AF8C0CachedMode *>(info)->getMode() * 2) * 4];
}
