// Open-BFME5 conversions.

// Retail ILT00015235 -> matched004675F0, eight dwords and RET20.
class BfmeLevelAN
{
public:
	char *bfmeBuildAN(unsigned int level, int p2, int p3, int p4, int p5,
		int p6, int p7, int p8);
};

// The global at 0x012F19E8 is EA's
// `WindowManager *g_rva012F19E8WindowManager` (defined in
// game/GameEngine/Source/GameClient/GUI/WindowManager.cpp). The level-builder
// calls use the existing matched row's view of the same object.
class WindowManager
{
public:
	bool hideAptWindow(int index);
};
extern WindowManager *g_rva012F19E8WindowManager;

// The global at 0x012B7D80 is EA's `int g_aptPalantirWindow` (defined once in
// game/GameEngine/Source/GameClient/GUI/GUICallbacks/Apt/AptPalantir.cpp). This
// TU pushes its value as the level index in the dispatcher contract.
extern int g_aptPalantirWindow;

extern unsigned char g_aptPalantirClosed;
extern unsigned char g_aptPalantirCloseRequested;

extern "C" __declspec(dllimport) int __cdecl sprintf(char *b, char *f, int a);

void bfmeGo1071A(int a, char b)
{
	char buf[0x10] = "";

	// Retail VA0107C7B4 contains "%d\0".
	sprintf(buf, "%d", a);
	((BfmeLevelAN *)g_rva012F19E8WindowManager)->bfmeBuildAN((unsigned int)g_aptPalantirWindow, (int)(b ? "ShowAlert" : "HideAlert"), 1, (int)buf, 0, 0, 0, 0);
}

void bfmeGo1071B(char a)
{
	if (a) {
		if (!g_aptPalantirClosed) {
			g_aptPalantirCloseRequested = 1;
			g_rva012F19E8WindowManager->hideAptWindow(g_aptPalantirWindow);
			g_aptPalantirClosed = 1;
			g_aptPalantirCloseRequested = 0;
		}
	} else {
		if (!g_aptPalantirClosed && !g_aptPalantirCloseRequested) {
			((BfmeLevelAN *)g_rva012F19E8WindowManager)->bfmeBuildAN((unsigned int)g_aptPalantirWindow, (int)"Close", 0, 0, 0, 0, 0, 0);
			g_aptPalantirCloseRequested = 1;
		}
	}
}
