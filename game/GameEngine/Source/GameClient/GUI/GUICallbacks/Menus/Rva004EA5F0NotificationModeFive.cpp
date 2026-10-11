// cl: /DNDEBUG /MD /EHsc
// Retail 0x004EA5F0 formats the buddy notification for non-five game modes.

template <typename T> struct StringInlineData
{
	int m_refCount;
	unsigned short m_length;
	unsigned short m_padding;
	T m_text[1];
};


#include "../../../../../../Libraries/Source/WWVegas/WWLib/ascii_string.h"
#include "../../../../../../Libraries/Source/WWVegas/WWLib/unicode_string.h"

inline UnicodeString::UnicodeString(const UnicodeString &other)
{
    ((StringBase<unsigned short> *)this)->StringBase<unsigned short>::StringBase(
        *(const StringBase<unsigned short> *)&other);
}
inline UnicodeString::~UnicodeString()
{
    ((StringBase<unsigned short> *)this)->releaseBuffer();
}

class GameTextInterface
{
public:
	virtual void slot00() = 0;
	virtual void slot04() = 0;
	virtual void slot08() = 0;
	virtual void slot0C() = 0;
	virtual void slot10() = 0;
	virtual void slot14() = 0;
	virtual void slot18() = 0;
	virtual void slot1C() = 0;
	virtual void slot20() = 0;
	virtual void slot24() = 0;
	virtual UnicodeString fetch( const char *label, bool *exists = 0 ) = 0;
};

class BfmeAptChatFriendLogIn
{
public:
	void showFriendLogIn( const UnicodeString &text );
};

extern "C" __declspec(dllimport) unsigned long __stdcall timeGetTime( void );

extern GameTextInterface *TheGameText;
#define TheGameText004EA5F0 (TheGameText)
class BfmeAptScreenOnlineShell;
extern BfmeAptScreenOnlineShell *g_obj12F4ACC;
unsigned int g_Va012F423C = 0;
extern bool lastNotificationWasStatus;
extern int numOnlineInNotification;
extern unsigned char g_Va012F4248;

void bfme_notificationModeFive( AsciiString nick, UnicodeString message )
{
	if ( reinterpret_cast<BfmeAptChatFriendLogIn *volatile &>(g_obj12F4ACC) )
	{
		if ( lastNotificationWasStatus && numOnlineInNotification > 1 )
			((StringBase<unsigned short> *)&message)->set(
                *(const StringBase<unsigned short> *)&TheGameText004EA5F0->fetch( "Buddy:MultipleOnlineNotification" ));

		if ( *(const StringInlineData<char> **)&nick && (*(const StringInlineData<char> **)&nick)->m_length != 0 )
			message.format( message, nick.str() );

		unsigned long now = timeGetTime();
		BfmeAptChatFriendLogIn *onlineShell = reinterpret_cast<BfmeAptChatFriendLogIn *volatile &>(g_obj12F4ACC);
		UnicodeString *messagePtr = &message;
		g_Va012F423C = now + 3000;
		g_Va012F4248 = 1;
		onlineShell->showFriendLogIn( *messagePtr );
	}
}
