// cl: /DNDEBUG /MD /EHsc /D_STLP_USE_STATIC_LIB /D_STLP_NO_EXCEPTIONS
// Open-BFME5: WeaponTemplate::parseScatterTarget, retail 0x001EA7F0 size 110.
// Focused TU: Weapon.cpp keeps the ZH layout (scatter vector after the
// scalars). BFME stores m_scatterTargets at +0x34. The 8-byte Coord2D
// construct and reallocating insert are at 0x001E21F0 / 0x001E9020,
// reached through their ILTs. The construction helper's identity still needs
// recovery; overflow calls use the existing width-proven ledger types. The overflow
// dispatch tag is aliased onto the instance argument, the same stack-slot
// trick the member push_back family uses on its value parameter.

#include "../../../../Libraries/Include/Lib/Coord2D.h"

struct LinearTarget
{
	float x;
	float y;
	unsigned int t;
};

// Existing overflow-provider types; retail proves their payload widths.
struct Rva001E9020Element { unsigned char m_data[8]; };
struct Gen_t_001ea7a0_p12cd { int a[3]; };

class INI
{
public:
	static void parseCoord2D(INI *, void *, void *, const void *);
	const char *getNextSubToken(const char *expected);
	static float scanReal(const char *token);
	static unsigned int scanUnsignedInt(const char *token);
};

namespace _STL
{
struct __false_type
{
};

template <class Type>
class allocator
{
};

void __cdecl BfmeCoord2DConstruct(Coord2D *destination, const Coord2D &value);
void __cdecl BfmeLinearTargetConstruct(LinearTarget *destination, const LinearTarget &value);

template <class Type, class Allocator>
class vector
{
public:
	Type *_M_start;
	Type *_M_finish;
	Type *_M_end_of_storage;

protected:
	void _M_insert_overflow(Type *position, const Type &value,
		const __false_type &, unsigned int fillLength, bool atEnd);
};

template <class Type, class Allocator>
class public_vector : public vector<Type, Allocator>
{
public:
	using vector<Type, Allocator>::_M_insert_overflow;
};
}

class WeaponTemplate
{
	static void parseScatterTarget(INI *ini, void *instance, void *store, const void *userData);
	static void parseLinearTarget(INI *ini, void *instance, void *store, const void *userData);

	unsigned char m_pad_00[0x34];
	_STL::public_vector<Coord2D, _STL::allocator<Coord2D> > m_scatterTargets;
	_STL::public_vector<LinearTarget, _STL::allocator<LinearTarget> > m_linearTargets;
};

// ?parseScatterTarget@WeaponTemplate@@CAXPAVINI@@PAX1PBX@Z
void WeaponTemplate::parseScatterTarget(INI *ini, void *instance, void *store, const void *userData)
{
	Coord2D target;
	target.x = 0;
	target.y = 0;
	INI::parseCoord2D(ini, 0, &target, 0);

	WeaponTemplate *self = (WeaponTemplate *)instance;
	_STL::public_vector<Coord2D, _STL::allocator<Coord2D> > &items = self->m_scatterTargets;
	if (items._M_finish != items._M_end_of_storage)
	{
		_STL::BfmeCoord2DConstruct(items._M_finish, target);
		++items._M_finish;
	}
	else
	{
		reinterpret_cast<_STL::public_vector<Rva001E9020Element,
			_STL::allocator<Rva001E9020Element> > *>(&items)->_M_insert_overflow(
			reinterpret_cast<Rva001E9020Element *>(items._M_finish),
			reinterpret_cast<const Rva001E9020Element &>(target),
			reinterpret_cast<const _STL::__false_type &>(instance), 1, true);
	}
}

// ?parseLinearTarget@WeaponTemplate@@CAXPAVINI@@PAX1PBX@Z
void WeaponTemplate::parseLinearTarget(INI *ini, void *instance, void *store, const void *userData)
{
	LinearTarget rec;
	rec.x = INI::scanReal(ini->getNextSubToken("X"));
	rec.y = INI::scanReal(ini->getNextSubToken("Y"));
	unsigned int t = INI::scanUnsignedInt(ini->getNextSubToken("T"));

	WeaponTemplate *self = (WeaponTemplate *)instance;
	_STL::public_vector<LinearTarget, _STL::allocator<LinearTarget> > &items = self->m_linearTargets;
	LinearTarget *end = items._M_end_of_storage;
	rec.t = t;
	if (items._M_finish != end)
	{
		_STL::BfmeLinearTargetConstruct(items._M_finish, rec);
		++items._M_finish;
	}
	else
	{
		reinterpret_cast<_STL::public_vector<Gen_t_001ea7a0_p12cd,
			_STL::allocator<Gen_t_001ea7a0_p12cd> > *>(&items)->_M_insert_overflow(
			reinterpret_cast<Gen_t_001ea7a0_p12cd *>(items._M_finish),
			reinterpret_cast<const Gen_t_001ea7a0_p12cd &>(rec),
			reinterpret_cast<const _STL::__false_type &>(instance), 1, true);
	}
}
