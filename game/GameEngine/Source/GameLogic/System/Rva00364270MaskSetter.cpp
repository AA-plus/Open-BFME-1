// ?setFields@Rva00364270Owner@@QAEXURva00364270Data@@@Z
// cl: /O2 /Ob2 /G6
//
// Address-derived at retail RVA 0x00364270. No caller, vtable entry, string
// or data-pointer xref names an owner (adjacent 0x00364210 is also
// anonymous), so the class/method keep the address token. The body copies a
// ten-dword-by-value argument block into this+0x50 with `rep movsd`, then
// masks each of those ten dwords in place against a lazily-initialized
// static mask table at retail 0x012F07A4..0x012F07C8 (mask[6] defaults to
// 0x20000, the rest zero); the guard byte/bit at 0x012F07D4 is MSVC's own
// local-static-object init guard for that table.

// stlport
#define _STLP_NO_EXCEPTIONS 1
#include <bitset>

struct Rva00364270Data
{
	_STL::bitset<320> w;
};

struct Rva00364270Masks
{
	Rva00364270Masks()
	{
		w.set(209);
	}

	_STL::bitset<320> w;
};

class Rva00364270Owner
{
public:
	void setFields(Rva00364270Data data);

private:
	unsigned char m_pad[0x50];
	Rva00364270Data m_fields;			// +0x50
};

void Rva00364270Owner::setFields(Rva00364270Data data)
{
	static Rva00364270Masks s_masks;

	m_fields = data;

	m_fields.w &= s_masks.w;
}
