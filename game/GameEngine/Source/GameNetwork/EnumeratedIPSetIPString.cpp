// cl: /DNDEBUG /MD /EHsc
// EnumeratedIP::setIPstring, RVA 00624C10, 72 bytes. Both callers are in
// IPEnumeration::getAddresses at 00624C80: 00624D56 sets the loopback text,
// followed by IP 0100007F at +4 and next pointer at +8; 00624E18 assigns a
// formatted address before storing its numeric address at +4. The released
// IPEnumeration source names this accessor. It is not LANPlayer::setName.
#include "../../../Libraries/Source/WWVegas/WWLib/ascii_string.h"
class EnumeratedIP {
public:
    void setIPstring(AsciiString name);
private:
    AsciiString m_IPstring;
    unsigned m_IP;
    EnumeratedIP *m_next;
};
void EnumeratedIP::setIPstring(AsciiString name)
{
    m_IPstring = name;
}
