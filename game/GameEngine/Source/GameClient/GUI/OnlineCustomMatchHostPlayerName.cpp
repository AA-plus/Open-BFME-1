// cl: /DNDEBUG /DWIN32 /D_WINDOWS /MD /EHsc
//
// Retail 0x00538F90, 115 bytes. TheGameSpyInfo getCurrentStagingRoom (+0xC4)
// then getSlot(0)->getName() into the out UnicodeString. this is unused;
// the EH frame only constructs the getName temporary on the hit path.

#include "../../../../Libraries/Source/WWVegas/WWLib/unicode_string.h"

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
inline UnicodeString &UnicodeString::operator=(const UnicodeString &other)
{
    ((StringBase<unsigned short> *)this)->set(*(const StringBase<unsigned short> *)&other);
    return *this;
}

class GameSlot
{
public:
	UnicodeString getName() const;
};

class GameInfo
{
public:
	GameSlot *getSlot( int index );
};

// ILT0001EC18 calls the existing GameInfo base method at0061E8B0.
class GameSpyStagingRoom : public GameInfo
{
};

#define GAMESPY_SLOT( n ) virtual void gamespySlot##n() = 0
class GameSpyInfo
{
public:
	GAMESPY_SLOT( 0 ); GAMESPY_SLOT( 1 ); GAMESPY_SLOT( 2 ); GAMESPY_SLOT( 3 );
	GAMESPY_SLOT( 4 ); GAMESPY_SLOT( 5 ); GAMESPY_SLOT( 6 ); GAMESPY_SLOT( 7 );
	GAMESPY_SLOT( 8 ); GAMESPY_SLOT( 9 ); GAMESPY_SLOT( 10 ); GAMESPY_SLOT( 11 );
	GAMESPY_SLOT( 12 ); GAMESPY_SLOT( 13 ); GAMESPY_SLOT( 14 ); GAMESPY_SLOT( 15 );
	GAMESPY_SLOT( 16 ); GAMESPY_SLOT( 17 ); GAMESPY_SLOT( 18 ); GAMESPY_SLOT( 19 );
	GAMESPY_SLOT( 20 ); GAMESPY_SLOT( 21 ); GAMESPY_SLOT( 22 ); GAMESPY_SLOT( 23 );
	GAMESPY_SLOT( 24 ); GAMESPY_SLOT( 25 ); GAMESPY_SLOT( 26 ); GAMESPY_SLOT( 27 );
	GAMESPY_SLOT( 28 ); GAMESPY_SLOT( 29 ); GAMESPY_SLOT( 30 ); GAMESPY_SLOT( 31 );
	GAMESPY_SLOT( 32 ); GAMESPY_SLOT( 33 ); GAMESPY_SLOT( 34 ); GAMESPY_SLOT( 35 );
	GAMESPY_SLOT( 36 ); GAMESPY_SLOT( 37 ); GAMESPY_SLOT( 38 ); GAMESPY_SLOT( 39 );
	GAMESPY_SLOT( 40 ); GAMESPY_SLOT( 41 ); GAMESPY_SLOT( 42 ); GAMESPY_SLOT( 43 );
	GAMESPY_SLOT( 44 ); GAMESPY_SLOT( 45 ); GAMESPY_SLOT( 46 ); GAMESPY_SLOT( 47 );
	GAMESPY_SLOT( 48 );
	virtual GameSpyStagingRoom *getCurrentStagingRoom() = 0;
};
#undef GAMESPY_SLOT

class GameSpyInfoInterface;
extern GameSpyInfoInterface *TheGameSpyInfo;

class BfmeAptScreenOnlineCustomMatch
{
public:
	void getHostPlayerName( UnicodeString &dest );
};

void BfmeAptScreenOnlineCustomMatch::getHostPlayerName( UnicodeString &dest )
{
	if( TheGameSpyInfo )
	{
		GameSpyStagingRoom *room = reinterpret_cast<GameSpyInfo *>(TheGameSpyInfo)->getCurrentStagingRoom();
		if( room )
			dest = room->getSlot( 0 )->getName();
	}
}
