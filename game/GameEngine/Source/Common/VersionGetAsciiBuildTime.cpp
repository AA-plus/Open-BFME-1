// cl: /DNDEBUG /MD /EHsc /Igame/Libraries/Source/WWVegas/WWLib
// readable body of ?getAsciiBuildTime@Version@@QAE?AVAsciiString@@XZ: game/GameEngine/Source/Common/version.cpp
//
// Retail 0x000AEFA0, 171 bytes. ZH body: format("%s %s", m_buildDate.str(),
// m_buildTime.str()) into a local and return by value.

#include "ascii_string.h"

// upstream layout: inputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/GameEngine/Include/Common/version.h
class Version
{
public:
	AsciiString getAsciiBuildTime();

private:
	int m_major;
	int m_minor;
	int m_buildNum;
	int m_localBuildNum;
	AsciiString m_buildLocation;
	AsciiString m_buildUser;
	AsciiString m_buildTime;
	AsciiString m_buildDate;
};

// ?getAsciiBuildTime@Version@@QAE?AVAsciiString@@XZ
AsciiString Version::getAsciiBuildTime()
{
	AsciiString timeStr;
	timeStr.format("%s %s", m_buildDate.str(), m_buildTime.str());
	return timeStr;
}
