// ?helper@BfmeFixup2580@@QAEXPAXPAVBfmeFixupChunk2580@@0@Z
// partial score=0.2152 date=2026-10-13
// Reconstruction of retail 0x008A2130; not a match.
// RET 0xC at +0x417, alignment +0x41A..41B, ten-entry jump table
// +0x41C..443 gives the full1092-byte extent. Linear decoding of table
// bytes produces the probe boundary warning; those bytes are data.
// Existing wrapper008A2580 proves thiscall owner and three arguments.
// Dispatch branches and string/handle cleanup restored from retail;
// names and callback globals retained from existing matched declarations.
// Register allocation, scheduling and typed record layouts remain open.
typedef unsigned int Word;
class BfmeFixupChunk2580 { public: char pad[0x1c]; int relative; };
class BfmeFixup2580 {
public:
    char pad0[0xc]; int count; Word *objects; char pad1[0xc];
    int otherCount; Word *other; int mapCount; Word *map; int flag;
    void helper(void *base, BfmeFixupChunk2580 *chunk, void *context);
};
// cl: /DNDEBUG /MD /EHsc
extern void (*g_bfmeSlot17VB)();
extern void (*g_bfmeSlot21VB)();
extern void (*g_bfmeSlot24VB)();
class Rva008D32B0 { public: void relocate(unsigned, int, void *); };
extern "C" void __cdecl __identifier("?j_008cc560@@YAXXZ")(void *, void *, BfmeFixupChunk2580 *, int *);
class Rva00894D80Accessor { public: static unsigned increment(unsigned *); };
class Rva00894D90Accessor { public: static unsigned decrement(unsigned *); };
void bfmeDropA(void *);
class RefHandle008958D0 {
public:
    unsigned *m_value;
    RefHandle008958D0(const RefHandle008958D0 &r):m_value(r.m_value) { if(m_value) Rva00894D80Accessor::increment(m_value); }
    ~RefHandle008958D0() { if(m_value && Rva00894D90Accessor::decrement(m_value)==0) bfmeDropA(m_value); }
    RefHandle008958D0 &operator=(const RefHandle008958D0 &r) {
        if(this!=&r) {
            if(m_value && Rva00894D90Accessor::decrement(m_value)==0) bfmeDropA(m_value);
            m_value=r.m_value;
            if(m_value) Rva00894D80Accessor::increment(m_value);
        }
        return *this;
    }
};
struct BfmeStringPool3AF0;
extern BfmeStringPool3AF0 *g_rva01337A30AllocPair;
struct Rva008A2130Release { void *m_00; void (__cdecl *free)(void *); };
class BfmeStrVKI {
public:
    unsigned short *m_data;
    BfmeStrVKI(const char *p) { bfmeSetVKI(p); }
    void __declspec(nothrow) bfmeSetVKI(const char *);
    ~BfmeStrVKI() { unsigned short *p=m_data; if(--*p==0) (*(Rva008A2130Release **)&g_rva01337A30AllocPair)->free(p); }
};
class Rva00893030Manager { public: RefHandle008958D0 rva00895A00(BfmeStrVKI *); };
extern Rva00893030Manager *g_rva00893030Manager;

static void fixPointer(Word &value, Word base)
{
    if (value) value += base;
}
void BfmeFixup2580::helper(void *baseArg, BfmeFixupChunk2580 *chunk, void *context)
{
    Word base = reinterpret_cast<Word>(baseArg);
    fixPointer(reinterpret_cast<Word &>(objects), base);
    fixPointer(reinterpret_cast<Word &>(map), base);
    for (int i = 0; i < mapCount; ++i)
        fixPointer(map[i * 2], base);
    for (int i = 0; i < count; ++i) {
        fixPointer(objects[i], base);
        if (!reinterpret_cast<Word *>(objects[i])) continue;
        reinterpret_cast<Word *>(objects[i])[1] = objects[0];
        switch (reinterpret_cast<Word *>(objects[i])[0]) {
        case 1:
            reinterpret_cast<Word *>(objects[i])[6] = reinterpret_cast<Word (__cdecl *)(void *,int)>(g_bfmeSlot24VB)(context,i);
            break;
        case 2: fixPointer(reinterpret_cast<Word *>(objects[i])[13], base); fixPointer(reinterpret_cast<Word *>(objects[i])[14], base); break;
        case 3: fixPointer(reinterpret_cast<Word *>(objects[i])[2], base); fixPointer(reinterpret_cast<Word *>(objects[i])[4], base); break;
        case 4:
            fixPointer(reinterpret_cast<Word *>(objects[i])[9], base);
            fixPointer(reinterpret_cast<Word *>(objects[i])[10], base);
            fixPointer(reinterpret_cast<Word *>(objects[i])[12], base);
            fixPointer(reinterpret_cast<Word *>(objects[i])[14], base);
            for(int j=0;j<(int)reinterpret_cast<Word *>(objects[i])[13];++j) {
                fixPointer(reinterpret_cast<Word *>(reinterpret_cast<Word *>(objects[i])[14])[2*j+1],base);
                __identifier("?j_008cc560@@YAXXZ")((void *)reinterpret_cast<Word *>(reinterpret_cast<Word *>(objects[i])[14])[2*j+1],baseArg,chunk,&flag);
            }
            fixPointer(reinterpret_cast<Word *>(objects[i])[15],base);
            break;
        case 5: case 9:
            reinterpret_cast<Rva008D32B0 *>(reinterpret_cast<Word *>(objects[i])+2)->relocate(base,(int)chunk,&flag);
            break;
        case 6: {
            Word value=0;
            for(int j=0;j<mapCount;++j) if(map[2*j+1]==(Word)i) value=map[2*j];
            reinterpret_cast<Word *>(objects[i])[2]=reinterpret_cast<Word (__cdecl *)(void *,int,Word)>(g_bfmeSlot17VB)(context,i,value);
            break;
        }
        case 7:
            reinterpret_cast<Word *>(objects[i])[2]=reinterpret_cast<Word (__cdecl *)(void *,int)>(g_bfmeSlot21VB)(context,i);
            break;
        case 10:
            fixPointer(reinterpret_cast<Word *>(objects[i])[13], base);
            for(int j=0;j<(int)reinterpret_cast<Word *>(objects[i])[12];++j) {
                fixPointer(reinterpret_cast<Word *>(reinterpret_cast<Word *>(objects[i])[13])[14*j+13],base);
            }
            break;
        }
    }
    fixPointer(reinterpret_cast<Word &>(other), base);
    for (int i = 0; i < otherCount; ++i) {
        fixPointer(other[4*i], base);
        fixPointer(other[4*i+1], base);
        *reinterpret_cast<RefHandle008958D0 *>(other+4*i+3) =
            g_rva00893030Manager->rva00895A00(&BfmeStrVKI(reinterpret_cast<const char *>(other[4*i])));
    }

}
