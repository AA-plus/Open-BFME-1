// t=1.75min model=gpt-6-astra lane=R budget=30m
// ?bfmeRunFDB@BfmeThingFDB@@QAEXPAX@Z
// Retail RET4 at +0x234; INT3 at +0x237. Matched BfmeThingFDB::bfmeGoFDB
// calls this body through ILT 0x00048F36.
// Retail clears bits304..319 after complementing the ten-word mask.
// cl: /DNDEBUG /MD /EHs-c-

template <int N> class BitFlags;

// Retain the independently corrected two-reference callee ABI at 0x001C7720.
#define OBJECT_TU_MEMBERS void clearAndSetModelConditionFlags(const BitFlags<320> &, const BitFlags<320> &);
#include "../../object.h"

class BfmeA1165
{
public:
	BfmeA1165(int tag, unsigned int bitIndex1, unsigned int bitIndex2,
		unsigned int bitIndex3, unsigned int bitIndex4, unsigned int bitIndex5,
		unsigned int bitIndex6, unsigned int bitIndex7, unsigned int bitIndex8,
		unsigned int bitIndex9, unsigned int bitIndex10, unsigned int bitIndex11,
		unsigned int bitIndex12, unsigned int bitIndex13, unsigned int bitIndex14,
		unsigned int bitIndex15);
	unsigned int words[10];
};

// stlport
#define _STLP_NO_EXCEPTIONS 1
#include <bitset>
struct BfmeMask320
{
    _STL::bitset<304> bits;
    void andWith(const BfmeMask320& other) { bits &= other.bits; }
    void flip() { bits.flip(); }
};

class BfmeThingFDB
{
public:
	void bfmeRunFDB(void *it);
};

void BfmeThingFDB::bfmeRunFDB(void *it)
{
	if (!it)
		return;

	static BfmeA1165 filter(0, 0x3e, 0xc1, 0xc2, 0x3f,
		0x12f, 0xc3, 0xbf, 0xee, 0xa0, 0x40, 0xbe, 0x119, 0x25,
		0xe4, 0xe5);

	BfmeMask320 filterCopy = *(BfmeMask320 *)&filter;
	Object *source = *(Object **)((char *)this + 8);
	BfmeMask320 sourceFlags = *(BfmeMask320 *)&source->m_modelConditionFlags;
	filterCopy.andWith(sourceFlags);
	BfmeMask320 clearFlags = sourceFlags;
	clearFlags.flip();
	clearFlags.andWith(*(const BfmeMask320 *)&filter);
	((Object *)it)->clearAndSetModelConditionFlags(
		(const BitFlags<320> &)clearFlags,
		(const BitFlags<320> &)filterCopy);
}
