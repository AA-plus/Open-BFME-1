// ?Rva003ACD80@@YAPAURva003ACD80Record@@PAU1@00ABUrandom_access_iterator_tag@_STL@@PAH@Z
// cl: /DNDEBUG /MD /EHsc /D_STLP_USE_STATIC_LIB /D_STLP_NO_EXCEPTIONS
// stlport
#include "../../../Libraries/Include/Lib/Coord3D.h"
#include <algorithm>

// Preserve the bank offsets while using the shared coordinate declaration.
struct Rva003ACD80Point
{
    union
    {
        Coord3D m_coord;
        struct { float m_at00, m_at04, m_at08; };
    };
};

struct Rva003ACD80Record
{
    virtual ~Rva003ACD80Record();
    virtual void slot00();
    unsigned int m_at04;
    Rva003ACD80Point m_at08;
    float m_at14;
    unsigned int m_at18;
    bool m_at1c;
};

// Evidence: targets/game/reverse/identity_evidence/003acd80-forward-copy.md
Rva003ACD80Record *Rva003ACD80(Rva003ACD80Record *first,
    Rva003ACD80Record *last, Rva003ACD80Record *result,
    const _STL::random_access_iterator_tag &tag, int *distance)
{
    for (int n = last - first; n > 0; --n)
    {
        *result = *first;
        ++first;
        ++result;
    }
    return result;
}
