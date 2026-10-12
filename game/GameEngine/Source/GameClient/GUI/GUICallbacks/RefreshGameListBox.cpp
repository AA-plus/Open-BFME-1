// cl: /DNDEBUG /MD /EHsc /D_STLP_USE_STATIC_LIB /D_STLP_NO_EXCEPTIONS /Igame/GameEngine/Source/Common/System /Igame/GameEngine/Include /Igame/GameEngine/Include/Precompiled /Igame/Libraries/Source/WWVegas/WWLib

class GameWindow;

void j_0000fd1c(GameWindow *, bool);

class RefreshGameListBoxShim
{
public:
    static void run(GameWindow *window, bool flag);
};

void j_0000fd1c(GameWindow *window, bool flag)
{
    RefreshGameListBoxShim::run(window, flag);
}
