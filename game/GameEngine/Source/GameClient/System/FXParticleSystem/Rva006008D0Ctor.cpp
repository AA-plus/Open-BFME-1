// cl: /DNDEBUG /MD /GX- /O2 /Ob2
// Retail 0x006008D0, 178 bytes (ret 8 at +0xAF): Rva005EB1F0's two-argument
// constructor. The factory V3HostRva005E7AD0::create (0x005E7AD0,
// V3NewInlineCtorFactories.cpp) news 0x44 bytes, calls this through ILT
// 0x00046E48, and stamps the vftables of Rva005EB1C0, which
// V3CopyCtorForwarders.cpp derives from Rva005EB1F0. The three vftables this
// body stamps last (0x01112D5C, 0x01112D58, 0x01112D90) are the ones
// Rva005EB1F0's matched copy constructor (0x005EB1F0,
// V3ChainedCopyCtorsWithSecondBase.cpp) stamps.
//
// The class is that file's hierarchy: the first base chain
// Rva005EAB80 -> Rva005EABB0 carries the owner pointer at +4 and the interface
// vptr at +8, and the thirteen-dword value block whose copy constructor is
// 0x005EA0D0 sits at +0xC. The value block is default-constructed, then
// assigned from the source's block of the same class at +0x08. The interface
// at +8 is stamped once with the shared vftable 0x0110F9E8 before the derived
// stamps, so its own constructor does not stamp: it is a novtable view over
// that shared base. The same is the shape of the matched Rva005FFAC0
// (0x005FFAC0).
//
// Identity not recovered; names are address-derived.

// upstream layout: game/GameEngine/Source/Common/V3ChainedCopyCtorsWithSecondBase.cpp
class V3Slot0N
{
public:
	V3Slot0N( void *owner ) : m_a( owner ) {}
	virtual void s0();

	void *m_a;
};

class V3Vt0110F9E8
{
public:
	virtual void s0();
};

class __declspec( novtable ) V3Slot1 : public V3Vt0110F9E8
{
};

class Rva005EABB0 : public V3Slot0N, public V3Slot1
{
public:
	Rva005EABB0( void *owner ) : V3Slot0N( owner ) {}
};

class Rva005EAB80 : public Rva005EABB0
{
public:
	Rva005EAB80( void *owner ) : Rva005EABB0( owner ) {}
};

// The thirteen-dword value block whose copy constructor is 0x005EA0D0.
class Rva005EA0D0
{
public:
	Rva005EA0D0()
		: m_trailingValue( 1 )
	{
		m_scale[ 0 ] = 1.0f;
		m_scale[ 1 ] = 1.0f;
		m_scale[ 2 ] = 1.0f;
		for ( int i = 0; i < 9; ++i )
			m_values[ i ] = 0;
	}
	Rva005EA0D0( const Rva005EA0D0 &other );
	virtual ~Rva005EA0D0();

protected:
	float m_scale[ 3 ];
	unsigned int m_values[ 9 ];
	unsigned int m_trailingValue;
};

class V3HostRva005E7AD0
{
public:
	char m_pad00[ 0x08 ];
	Rva005EA0D0 m_block;			// +0x08
};

class Rva005EB1F0 : public Rva005EAB80, public Rva005EA0D0
{
public:
	Rva005EB1F0( void *owner, V3HostRva005E7AD0 *source );
};

Rva005EB1F0::Rva005EB1F0( void *owner, V3HostRva005E7AD0 *source )
	: Rva005EAB80( owner )
{
	Rva005EA0D0::operator=( source->m_block );
}
