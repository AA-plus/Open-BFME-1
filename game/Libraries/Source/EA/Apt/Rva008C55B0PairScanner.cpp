// cl: /O2 /DNDEBUG /MD /EHsc

inline void *operator new(unsigned int, void *place) { return place; }

struct Rva008CF3C0Block
{
	unsigned short m_ref;
};

// The shared empty EA string block at 0x012D5298 is defined once, with its
// proven type, in game/GameEngine/Source/Common/Data/Rva012D5298.cpp; this
// file names it through a local view.
class EAStringC
{
public:
	class StringDataC;
};

extern EAStringC::StringDataC g_rva012D5298Empty;

static inline Rva008CF3C0Block *rva012D5298Block()
{
	return (Rva008CF3C0Block *)&g_rva012D5298Empty;
}

struct Rva008CF3C0Pool
{
	void *m_unused;
	void(__cdecl *free)(void *);
};

struct BfmeStringPool3AF0;
extern BfmeStringPool3AF0 *g_rva01337A30AllocPair;

class Rva008CF3C0String
{
public:
	Rva008CF3C0String()
	{
		m_block = rva012D5298Block();
		++rva012D5298Block()->m_ref;
	}

	~Rva008CF3C0String()
	{
		Rva008CF3C0Block *block = m_block;
		if (--block->m_ref == 0)
			(*(Rva008CF3C0Pool **)&g_rva01337A30AllocPair)->free(block);
	}

	Rva008CF3C0Block *m_block;
};

class BfmeBufVKG
{
public:
	BfmeBufVKG *bfmeAppendVKG(const char *source, unsigned int limit);
};

class Rva008CF3C0State
{
public:
	char *parse(char *cursor, Rva008CF3C0String *name, Rva008CF3C0String *value);
};

class Rva8CD130String;
namespace Rva008C54A0 { void method(Rva8CD130String *); }

// Open BFME 2: Code/Libraries/Source/Apt/AptActionInterpreterConstantHandlers.cpp.
char *Rva008CF3C0State::parse(char *cursor, Rva008CF3C0String *name, Rva008CF3C0String *value)
{
    char *p = cursor, *eq = 0;
    {
        Rva008CF3C0Block *nameBlock = name->m_block;
        if (--nameBlock->m_ref == 0) (*(Rva008CF3C0Pool **)&g_rva01337A30AllocPair)->free(nameBlock);
        name->m_block = rva012D5298Block();
        ++rva012D5298Block()->m_ref;
    }
    {
        Rva008CF3C0Block *valueBlock = value->m_block;
        if (--valueBlock->m_ref == 0) (*(Rva008CF3C0Pool **)&g_rva01337A30AllocPair)->free(valueBlock);
        value->m_block = rva012D5298Block();
        ++rva012D5298Block()->m_ref;
    }
    for (; p && *p && *p != '&'; ++p)
        if (*p == '=') eq = p;
    if (eq)
    {
        ((BfmeBufVKG *)name)->bfmeAppendVKG(cursor, (unsigned)(eq - cursor));
        Rva008C54A0::method((Rva8CD130String *)name);
        ++eq;
        ((BfmeBufVKG *)value)->bfmeAppendVKG(eq, (unsigned)(p - eq));
        Rva008C54A0::method((Rva8CD130String *)value);
        if (*p == '&') ++p;
    }
    else p = 0;
    return p;
}
