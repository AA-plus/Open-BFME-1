// cl: /MD /EHsc

struct BfmeHdrVKI
{
	unsigned short m_refCount;
	unsigned short m_length;
	unsigned short m_capacity;
	unsigned short m_flags;
	char m_data[1];
};

struct BfmeStringPoolVKI
{
	void *m_unused;
	void (__cdecl *free)(void *);
};

extern BfmeStringPoolVKI *g_bfmeStringPool1284;

class BfmeStrVKI
{
public:
	BfmeStrVKI(const char *text)
	{
		bfmeSetVKI(text);
	}
	void __declspec(nothrow) bfmeSetVKI(const char *text);
	~BfmeStrVKI()
	{
		BfmeHdrVKI *data = m_data;
		if (--data->m_refCount == 0)
			g_bfmeStringPool1284->free(data);
	}

	BfmeHdrVKI *m_data;
};

class BfmeDropObjectA;

class RefHandle008958D0
{
public:
	RefHandle008958D0();
 RefHandle008958D0(BfmeDropObjectA *p);
	RefHandle008958D0(const RefHandle008958D0 &other);
	~RefHandle008958D0();

	BfmeDropObjectA *m_bfmeAEVB;
};

struct BfmeStringDataEVB
{
	unsigned short m_refCount;
	unsigned short m_length;
	unsigned short m_capacity;
	unsigned short m_flags;
	char m_data[1];
};

extern void *(__cdecl *Rva008C5D70Alloc)(unsigned int bytes);
extern void (*TheBfmeFree)(void *value, unsigned int bytes);

class BfmeDropObjectA
{
public:
	~BfmeDropObjectA();
    __forceinline int increaseCount() { return ++m_refCount; }
    __forceinline int decreaseCount() { return --m_refCount; }
 void *operator new(unsigned int n) { return Rva008C5D70Alloc(n); }
 BfmeDropObjectA(BfmeStrVKI *name) { m_refCount=0; m_string=reinterpret_cast<BfmeStringDataEVB *>(name->m_data); ++m_string->m_refCount; m_kind=1; m_argument=0; m_object=0; m_buffer=0; }

	void operator delete(void *value, unsigned int bytes)
	{
		TheBfmeFree(value, bytes);
	}

	int m_refCount;
	BfmeStringDataEVB *m_string;
	int m_kind;
	void *m_argument;
	void *m_object;
	void *m_buffer;
};


// ??1RefHandle008958D0@@QAE@XZ absent-from-retail
__forceinline RefHandle008958D0::~RefHandle008958D0()
{
	BfmeDropObjectA *p=m_bfmeAEVB;
 if(p && p->decreaseCount() == 0) { p->~BfmeDropObjectA(); TheBfmeFree(p,24); }
}

// ??0RefHandle008958D0@@QAE@XZ absent-from-retail
__forceinline RefHandle008958D0::RefHandle008958D0()
	: m_bfmeAEVB(0)
{
}

// ??0RefHandle008958D0@@QAE@ABV0@@Z absent-from-retail
__forceinline RefHandle008958D0::RefHandle008958D0(const RefHandle008958D0 &other)
	: m_bfmeAEVB(other.m_bfmeAEVB)
{
	if (m_bfmeAEVB != 0)
		m_bfmeAEVB->increaseCount();
}

struct BfmeDropNodeEVB
{
    BfmeDropNodeEVB(BfmeDropObjectA *p):m_object(p),m_next(0) {}
    void *operator new(unsigned n) { return Rva008C5D70Alloc(n); }
	BfmeDropObjectA *m_object;
	BfmeDropNodeEVB *m_next;
};

class Rva00893030Manager
{
public:
	__declspec(noinline) RefHandle008958D0 find008958D0(BfmeStrVKI *name);
	RefHandle008958D0 rva00895A00(BfmeStrVKI *name);

	BfmeDropNodeEVB *m_head;
};


// ??0RefHandle008958D0@@QAEPAVBfmeDropObjectA@@@Z absent-from-retail
inline RefHandle008958D0::RefHandle008958D0(BfmeDropObjectA *p) : m_bfmeAEVB(p) { if(p) p->increaseCount(); }
// ?rva00895A00@Rva00893030Manager@@QAE?AVRefHandle008958D0@@PAVBfmeStrVKI@@@Z
// Open BFME 2 donor: Code/GameEngine/Source/Common/Bfme5ThirtyFour.cpp.
RefHandle008958D0 Rva00893030Manager::rva00895A00(BfmeStrVKI *name)
{
    RefHandle008958D0 found = find008958D0(name);
    BfmeDropObjectA *p = found.m_bfmeAEVB;
    if (p)
        return RefHandle008958D0(p);
    RefHandle008958D0 made(new BfmeDropObjectA(name));
    BfmeDropNodeEVB *node = new BfmeDropNodeEVB(made.m_bfmeAEVB);
    node->m_next = m_head;
    m_head = node;
    return made;
}

extern "C" int memcmp(const void *, const void *, unsigned);
#pragma intrinsic(memcmp)
inline RefHandle008958D0 Rva00893030Manager::find008958D0(BfmeStrVKI *key)
{
    BfmeDropNodeEVB *n = m_head;
    if (n) {
        BfmeStringDataEVB *k = (BfmeStringDataEVB *)key->m_data;
        int len = k->m_length;
        do {
            BfmeStringDataEVB *const &string = n->m_object->m_string;
            if (len == string->m_length) {
                if (k == string || memcmp(k->m_data, string->m_data, len) == 0)
                    return RefHandle008958D0(n->m_object);
            }
            n = n->m_next;
        } while (n);
    }
    return RefHandle008958D0();
}
