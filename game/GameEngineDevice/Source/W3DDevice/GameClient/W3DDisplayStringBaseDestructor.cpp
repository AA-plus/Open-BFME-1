// cl: /DNDEBUG /MD /EHsc /Igame/Libraries/Source/WWVegas/WWLib

// Open-BFME5: W3DDisplayStringBase's destructor, retail 0x004100B0, 93 bytes.
// The body carried only a machine byte-dump row; the symbols.csv pin names it.
//
// The class's own vtable goes down and no base vtable comes back, so it has no
// polymorphic base -- it introduces the table itself. Then two things happen to
// the UnicodeString at +0x04: the destructor body clears it, and after the word
// at +0x08 is zeroed the member's own destructor runs. Both land on the same
// body, which the ledger carries under clear, releaseBuffer and the destructor
// alike; the unwind slot is what separates them, standing at 0 while the member
// is still alive and dropping to -1 for its destruction.

#include "unicode_string.h"

inline UnicodeString::~UnicodeString()
{
	((StringBase<unsigned short> *)this)->releaseBuffer();
}

class W3DDisplayStringBase
{
public:
	virtual ~W3DDisplayStringBase();

private:
	UnicodeString m_bfmeText;				// +0x04
	int m_bfme08;						// +0x08
};

// ??1W3DDisplayStringBase@@UAE@XZ
W3DDisplayStringBase::~W3DDisplayStringBase()
{
	reinterpret_cast<StringBase<unsigned short> &>(m_bfmeText).clear();

	m_bfme08 = 0;
}
