// cl: /DNDEBUG /DWIN32 /D_WINDOWS /MD /EHsc /Igame/Libraries/Source/WWVegas/WWLib
// Open-BFME5: setupGameStart, retail 0x004C6F70. The by-value map name is
// copied into GlobalData::m_pendingFile before the shell transition.

#include "ascii_string.h"

class SetupGameStartCampaignManagerView
{
public:
	void setGameDifficulty(int diff) { m_diff = diff; }

private:
	char m_pad[0x18];
	int m_diff;
};

class SetupGameStartGlobalDataView
{
public:
	char m_pad[0xb84];
	AsciiString m_pendingFile;
};

// upstream layout: inputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/GameEngine/Include/GameClient/Shell.h
class Shell
{
public:
	void reverseAnimatewindow();
};

// Native transition handler reached by retail ILT 0x00045C28 -> 0x0048AD80.
class GameWindowTransitionsHandler
{
public:
	void setGroup(AsciiString name, bool immediate);
};
extern GameWindowTransitionsHandler *TheTransitionHandler;

class CampaignManager;
extern CampaignManager *TheCampaignManager;
// Canonical identity of the retail global at 0x012ED5C8, defined once by
// game/GameEngine/Source/Common/GlobalData.cpp as
// ?TheWritableGlobalData@@3PAVGlobalData@@A.  The member read keeps the local
// view and casts at the use.
class GlobalData;
extern GlobalData *TheWritableGlobalData;
extern Shell *TheShell;

void setupGameStart(AsciiString mapName, int diff)
{
	reinterpret_cast<SetupGameStartCampaignManagerView *>(TheCampaignManager)->setGameDifficulty(diff);
	AsciiString *pendingFile =
		&((SetupGameStartGlobalDataView *)TheWritableGlobalData)->m_pendingFile;
	pendingFile->StringBase<char>::set(mapName);
	TheShell->reverseAnimatewindow();
	TheTransitionHandler->setGroup(AsciiString("FadeWholeScreen"), 0);
}
