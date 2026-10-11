// cl: /DNDEBUG /MD /EHsc
// BFME stores only the string, address, and next pointer in EnumeratedIP; the
// released Zero Hour declaration adds a MemoryPoolObject word not present in
// the retail BFME layout.

#include "../../../Libraries/Source/WWVegas/WWLib/ascii_string.h"

// upstream layout: inputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/GameEngine/Include/GameNetwork/IPEnumeration.h
class EnumeratedIP
{
public:
	EnumeratedIP();

private:
	AsciiString m_IPstring;
	unsigned int m_IP;
	EnumeratedIP *m_next;
};

EnumeratedIP::EnumeratedIP()
{
	m_IPstring.StringBase<char>::set("", 0);
	m_next = 0;
	m_IP = 0;
}
