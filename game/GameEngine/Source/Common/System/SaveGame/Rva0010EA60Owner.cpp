// ?rva0010EA60@Rva0010EA60Owner@@QAEXPAXI@Z
// Retail 0010EA60: list nodes at owner+48/+4C; matched caller 0010F100.
// Preserve retail post-deallocation value read; no semantic owner claimed.
// cl: /DNDEBUG /MD /EHsc
// stlport
#define _STLP_USE_STATIC_LIB 1
#include <list>
#include <utility>
class Rva0010EA60Owner
{
public:
    void rva0010EA60(void *unused, unsigned key);
    unsigned char m_prefix[0x48];
    std::list<void *> m_48;
    std::list<std::pair<void *, unsigned> > m_4c;
};
void Rva0010EA60Owner::rva0010EA60(void *, unsigned key)
{
    typedef std::list<std::pair<void *, unsigned> > Entries;
    Entries::iterator it = m_4c.begin();
    while (it != m_4c.end())
    {
        Entries::reference entry = *it;
        if (entry.second >= key)
        {
            it = m_4c.erase(it);
            m_48.remove(entry.first);
        }
        else
            ++it;
    }
}
