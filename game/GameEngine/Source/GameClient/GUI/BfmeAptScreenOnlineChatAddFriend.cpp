// cl: /DNDEBUG /DWIN32 /D_WINDOWS /MD /EHsc /Igame/Libraries/Source/WWVegas/WWLib
//
// Retail 0x0052DC00 adds one BuddyInfo name and profile to the OnlineChat
// friends list. The caller at 0x00533EA0 proves the four-argument ABI.

#include "ascii_string.h"
#include "unicode_string.h"

inline UnicodeString::UnicodeString() : m_text(0) {}
inline UnicodeString::UnicodeString(const UnicodeString &other)
{
    ((StringBase<unsigned short> *)this)->StringBase<unsigned short>::StringBase(
        *(const StringBase<unsigned short> *)&other);
}
inline UnicodeString::~UnicodeString()
{
    ((StringBase<unsigned short> *)this)->releaseBuffer();
}

class GameWindow;

int GadgetListBoxAddEntryText( GameWindow *listbox, UnicodeString text,
	int color, int row, int column, bool overwrite );
void GadgetListBoxSetItemData(GameWindow *listbox, void *data, int row, int column);

// Address-derived identity for the retail 0x0052DC00 row-adder body.
int Rva0052DC00AddFriend( GameWindow *listbox, int profileID,
	const AsciiString *name, int color )
{
	UnicodeString displayName;
	displayName.translate( *name );
	int row = GadgetListBoxAddEntryText( listbox, displayName, color, -1, 2,
		true );
	GadgetListBoxSetItemData(listbox, (void *)profileID, row, 0);
	return row;
}
