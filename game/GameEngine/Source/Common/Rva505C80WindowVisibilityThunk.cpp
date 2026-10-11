// upstream layout: inputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/GameEngine/Include/GameClient/GameWindow.h
class GameWindow
{
public:
	int winHide(bool hide);
};

struct BfmeQuickMatchHideOptionsGadgetsBody
{
	void hide(bool doIt);
};

struct Rva505C80WindowVisibilityThunk
{
	void updateVisibility();

	unsigned char unused000[0x264];
	GameWindow *finalWindow;
	unsigned char unused268[0x24];
	GameWindow *firstWindow;
	void *unused290;
	GameWindow *secondWindow;
	void *unused298;
	GameWindow *fourthWindow;
	void *unused2a0;
	GameWindow *thirdWindow;
};

void Rva505C80WindowVisibilityThunk::updateVisibility()
{
	firstWindow->winHide(true);
	secondWindow->winHide(true);
	thirdWindow->winHide(true);
	fourthWindow->winHide(true);
	((BfmeQuickMatchHideOptionsGadgetsBody *)this)->hide(false);
	finalWindow->winHide(false);
}
