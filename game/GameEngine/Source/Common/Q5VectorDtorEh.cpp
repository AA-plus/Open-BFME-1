// cl: /EHsc
// stlport

#include <vector>

// ILT 0x00036A9D reaches this ledger-owned, zero-argument thiscall member.
class Rva003CC890
{
public:
	void release();
};

// Address-derived 60-byte element. Its cleanup invokes the member encoded
// by the retail vector destructor at 0x003D1380, preserving ECX and RET0.
struct Gen003D1380Elem
{
	char m_body[ 0x3C ];

	Gen003D1380Elem();
	Gen003D1380Elem( const Gen003D1380Elem & );
	__forceinline ~Gen003D1380Elem()
	{
		((Rva003CC890 *)this)->release();
	}
	Gen003D1380Elem &operator=( const Gen003D1380Elem & );
};

// Emit only the destructor owned by this translation unit.
template _STL::vector<Gen003D1380Elem>::~vector();
