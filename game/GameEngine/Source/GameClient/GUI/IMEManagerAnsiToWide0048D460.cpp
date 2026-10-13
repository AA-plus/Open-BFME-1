// ?rva0048D460AnsiToWide@@YGXPBDPAVUnicodeString@@@Z
// cl: /O2 /DNDEBUG /MD /EHsc
#include <string.h>
#include "../../../../Libraries/Source/WWVegas/WWLib/unicode_string.h"

void *__cdecl operator new[](unsigned int size);
void __cdecl operator delete[](void *memory);
extern "C" __declspec(dllimport) int __stdcall MultiByteToWideChar(unsigned int codePage, unsigned int flags, const char *source, int sourceLength, unsigned short *target, int targetLength);

//============================================================================
// IMEManager::convertToUnicode
//============================================================================

void __stdcall rva0048D460AnsiToWide(const char *source, UnicodeString *target)
{
    int length = MultiByteToWideChar(0, 0, source, strlen(source), 0, 0);

    ((StringBase<unsigned short> *)target)->clear();

    if (length <= 0)
    {
        return;
    }

    unsigned short *buffer = new unsigned short[length + 1];

    if (buffer)
    {
        int written = MultiByteToWideChar(0, 0, source, strlen(source), buffer, length);

        if (written <= 0)
        {
            ((StringBase<unsigned short> *)target)->clear();
        }
        else
        {
            buffer[written] = 0;
            *target = buffer;
        }

        delete[] buffer;
    }
}
