// cl: -GX-
// stlport

#include <vector>

struct Elem00147180
{
	virtual ~Elem00147180();

	char m_body[ 0x5C - 4 ];

	Elem00147180();
	Elem00147180( const Elem00147180 & );
	Elem00147180 &operator=( const Elem00147180 & );
};

// Emit only the range erase owned by this translation unit.
template Elem00147180 *_STL::vector<Elem00147180>::erase(
	Elem00147180 *, Elem00147180 *);
