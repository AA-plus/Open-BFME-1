// ?format_0046CF80@Rva0046CF80Owner@@QAEPADPBD@Z
// partial score=0.8486 date=2026-10-11
// cl: /DNDEBUG /DWIN32 /D_WINDOWS /MD /EHsc /Iinputs/reference/shims/stringinline /D_STLP_USE_STATIC_LIB
// stlport
//
// WindowManager stores each player-color callback with the argument that the
// callback receives. The callback map starts at WindowManager+0x1C.

#include "StringInline.h"
#include <exception>
#include <hash_map>

class FunctorWrapperHead
{
public:
	virtual ~FunctorWrapperHead();

	int m_refCount;
};

class Rva0050F920FunctorHolder
{
public:
	Rva0050F920FunctorHolder( const Rva0050F920FunctorHolder &other )
		: m_ptr( other.m_ptr )
	{
		if( m_ptr )
			++m_ptr->m_refCount;
	}

	~Rva0050F920FunctorHolder()
	{
		FunctorWrapperHead *p = m_ptr;
		if( p && ( p->m_refCount = p->m_refCount - 1 ) <= 0 )
			delete p;
	}

	FunctorWrapperHead *m_ptr;
};

struct Rva0046C2A0Mapped
{
	Rva0046C2A0Mapped() : m_ptr( 0 ), m_value( 0 ) {}

	Rva0046C2A0Mapped( const Rva0046C2A0Mapped &other )
		: m_ptr( other.m_ptr ), m_value( other.m_value )
	{
		if( m_ptr )
			++m_ptr->m_refCount;
	}

	~Rva0046C2A0Mapped()
	{
		FunctorWrapperHead *p = m_ptr;
		if( p && ( p->m_refCount = p->m_refCount - 1 ) <= 0 )
			delete p;
	}

	FunctorWrapperHead *m_ptr;
	void *m_value;
};

namespace rts
{
	template <class T> struct hash;
	template <class T> struct equal_to;

	template <> struct hash<AsciiString>
	{
		unsigned int operator()( AsciiString value ) const;
	};

	template <> struct equal_to<AsciiString>
	{
		int operator()( const AsciiString &left, const AsciiString &right ) const;
	};
}

typedef std::hash_map<AsciiString, Rva0046C2A0Mapped,
	rts::hash<AsciiString>, rts::equal_to<AsciiString> > Rva0046C2A0Map;

class WindowManager
{
public:
	void bindShownWithArg( const AsciiString &name, void *argument,
		Rva0050F920FunctorHolder callback );

private:
	unsigned char m_pad[0x1C];
	Rva0046C2A0Map m_callbacks;
};

// ?bindShownWithArg@WindowManager@@QAEXABVAsciiString@@PAXVRva0050F920FunctorHolder@@@Z
void WindowManager::bindShownWithArg( const AsciiString &name, void *argument,
	Rva0050F920FunctorHolder callback )
{
	if( callback.m_ptr == 0 )
		return;

	Rva0046C2A0Mapped *slot = &m_callbacks[name];
	Rva0050F920FunctorHolder previous(
		*reinterpret_cast<Rva0050F920FunctorHolder *>( slot ) );
	if( previous.m_ptr != 0 )
		return;
	if( slot != reinterpret_cast<Rva0046C2A0Mapped *>( &callback ) )
	{
		if( callback.m_ptr )
			++callback.m_ptr->m_refCount;
		FunctorWrapperHead *old = slot->m_ptr;
		if( old && ( old->m_refCount = old->m_refCount - 1 ) <= 0 )
			delete old;
		slot->m_ptr = callback.m_ptr;
	}
	slot->m_value = argument;
}


class BFMERetailAsciiString
{
public:
    BFMERetailAsciiString(const char *text);
    ~BFMERetailAsciiString() { releaseBuffer(); }
private:
    void releaseBuffer();
    void *m_data;
};
class FunctorNotSet : public std::exception
{
public:
    FunctorNotSet() : std::exception() {}
};
class Rva0046CF80Callback
{
public:
    virtual ~Rva0046CF80Callback();
    virtual void invoke(void *value, char *buffer, int flags);
};
typedef _STL::pair<const AsciiString, Rva0046C2A0Mapped> Rva0046CF80Pair;
typedef _STL::_Hashtable_node<Rva0046CF80Pair> Rva0046CF80Node;
extern const char *__cdecl bfmeSkipLevelPrefix(const char *text);
struct BFMERetailKey
{
    BFMERetailKey(const char *t) : s(t) {}
    operator const AsciiString &() const { return reinterpret_cast<const AsciiString &>(s); }
    BFMERetailAsciiString s;
};
struct Rva0046CF80Slot
{
    void operator()(void *value, char *buffer, int flags) const
    {
        if (m_callback == 0)
            throw FunctorNotSet();
        m_callback->invoke(value, buffer, flags);
    }
    Rva0046CF80Callback *m_callback;
};
class Rva0046CF80Owner
{
public:
    char *format_0046CF80(const char *name);
private:
    unsigned char m_pad[0x1C];
    Rva0046C2A0Map m_callbacks;
};
char *Rva0046CF80Owner::format_0046CF80(const char *name)
{
    char *result = new char[255];
    result[0] = 0;
    Rva0046C2A0Map::const_iterator it;
    const Rva0046C2A0Map *map;
    {
        BFMERetailAsciiString key(name);
        map = &m_callbacks;
        it._M_cur = map->find(reinterpret_cast<const AsciiString &>(key))._M_cur;
    }
    if (it._M_cur == 0) {
        BFMERetailAsciiString key(bfmeSkipLevelPrefix(name));
        it = map->find(reinterpret_cast<const AsciiString &>(key));
    }
    if (it._M_cur != 0)
        reinterpret_cast<const Rva0046CF80Slot &>(it._M_cur->_M_val.second.m_ptr)(it._M_cur->_M_val.second.m_value, result, 0);
    return result;
}
