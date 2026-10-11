// cl: /O2 /DNDEBUG /MD

typedef float Real;
enum ObjectShroudStatus
{
    OBJECTSHROUD_INVALID,
    OBJECTSHROUD_CLEAR,
    OBJECTSHROUD_PARTIAL_CLEAR,
    OBJECTSHROUD_FOGGED,
    OBJECTSHROUD_SHROUDED
};

class Object
{
public:
    ObjectShroudStatus getShroudedStatus(int playerIndex) const;
};

class Drawable
{
public:
    void drawIconUI();
};

class Gen_00410BA0
{
public:
    int isDrawableEffectivelyHidden() const;
};

class Rva0073AD70
{
public:
    void method();
};

struct BFMEDrawableAIChain
{
    char m_padding[0xFC];
    Object *m_object;
};

struct Rva0073AED0Player
{
    char m_pad00[0x24];
    int m_playerIndex;
};

struct Rva0073AED0PlayerList
{
    char m_pad00[0x0C];
    Rva0073AED0Player *m_local;
};

class Rva0073AED0View
{
public:
#define V(n) virtual void slot##n();
    V(0) V(1) V(2) V(3) V(4) V(5) V(6) V(7) V(8) V(9)
    V(10) V(11) V(12) V(13) V(14) V(15) V(16) V(17) V(18) V(19)
    V(20) V(21) V(22) V(23) V(24) V(25) V(26) V(27) V(28) V(29)
    V(30) V(31) V(32) V(33) V(34) V(35) V(36) V(37) V(38) V(39)
    V(40) V(41) V(42) V(43) V(44) V(45) V(46) V(47) V(48) V(49)
    V(50) V(51) V(52) V(53) V(54) V(55) V(56) V(57) V(58) V(59)
    V(60) V(61) V(62) V(63) V(64) V(65) V(66) V(67) V(68) V(69)
    V(70) V(71) V(72) V(73) V(74) V(75) V(76) V(77) V(78) V(79)
    V(80) V(81) V(82) V(83) V(84) V(85) V(86) V(87) V(88) V(89)
    V(90) V(91) V(92) V(93) V(94) V(95) V(96) V(97) V(98) V(99)
    V(100) V(101) V(102) V(103) V(104) V(105) V(106)
#undef V
    virtual Real getPitch();
};

struct Rva0073AED0GlobalData
{
    char m_pad00[0xA81];
    bool m_showTerrainNormals;
};

struct Rva0073AED0GameClient
{
    char m_pad00[0xC0];
    unsigned int m_renderedObjectCount;
};

class View;
class PlayerList;
struct GlobalData;
class GameClient;
extern View *TheTacticalView;
extern PlayerList *ThePlayerList;
extern GlobalData *TheWritableGlobalData;
extern GameClient *TheGameClient;

// ?drawablePostDraw@@YAXPAVDrawable@@PAX@Z
// Ported from Open BFME 2 Code/GameEngineDevice/Source/W3DDevice/GameClient/W3DViewDrawablePostDraw.cpp.
void drawablePostDraw(Drawable *draw, void *userData)
{
    Real pitch = reinterpret_cast<Rva0073AED0View *>(TheTacticalView)->getPitch();
    if (static_cast<unsigned char>(reinterpret_cast<Gen_00410BA0 *>(draw)->isDrawableEffectivelyHidden()) || pitch < 0.0f)
        return;
    Object *obj = reinterpret_cast<BFMEDrawableAIChain *>(draw)->m_object;
    int localPlayerIndex = ThePlayerList ? reinterpret_cast<Rva0073AED0PlayerList *>(ThePlayerList)->m_local->m_playerIndex : 0;
    ObjectShroudStatus ss = !obj ? OBJECTSHROUD_CLEAR : obj->getShroudedStatus(localPlayerIndex);
    if (ss > OBJECTSHROUD_PARTIAL_CLEAR)
        return;
    draw->drawIconUI();
    if (reinterpret_cast<Rva0073AED0GlobalData *>(TheWritableGlobalData)->m_showTerrainNormals)
        reinterpret_cast<Rva0073AD70 *>(draw)->method();
    ++reinterpret_cast<Rva0073AED0GameClient *>(TheGameClient)->m_renderedObjectCount;
}
