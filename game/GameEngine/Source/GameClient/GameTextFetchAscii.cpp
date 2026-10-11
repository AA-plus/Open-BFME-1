// cl: /DNDEBUG /DWIN32 /D_WINDOWS /MD /EHsc
// GameTextManager::fetch(AsciiString, bool*) at RVA 0x00436F90.
// The constructor at 0x00438350 installs vtable 0x010F39F0: +0x24 routes
// through ILT 0x000449AE to this overload, which forwards to char-fetch +0x28.
// MSVC orders the overload slots in reverse declaration order below.
//
// Retail's private StringBase payload starts after an eight-byte header and
// its nontrivial by-value string lifetime requires the real base destructor.
// The previous 47-byte claim cut inside the old source's wrong add eax,4;
// the complete function is 114 bytes through ret12 at RVA 0x00436FFF.
// This isolated ABI view leaves the other GameText.cpp bodies unchanged.

#include "../../../Libraries/Source/WWVegas/WWLib/ascii_string.h"
#include "../../../Libraries/Source/WWVegas/WWLib/unicode_string.h"

inline UnicodeString::UnicodeString(const UnicodeString &that)
{
    ((StringBase<unsigned short> *)this)->StringBase<unsigned short>::StringBase(
        *(const StringBase<unsigned short> *)&that);
}
inline UnicodeString::~UnicodeString()
{
    ((StringBase<unsigned short> *)this)->releaseBuffer();
}

class GameTextManager {
public:
 virtual ~GameTextManager();
 virtual void slot04(); virtual void slot08(); virtual void slot0c();
 virtual void slot10(); virtual void slot14(); virtual void slot18(); virtual void slot1c(); virtual void slot20();
 virtual UnicodeString fetch(const char *label, bool *exists);
 virtual UnicodeString fetch(AsciiString label, bool *exists);
};
UnicodeString GameTextManager::fetch(AsciiString label,bool *exists) { return fetch(label.StringBase<char>::str(),exists); }
