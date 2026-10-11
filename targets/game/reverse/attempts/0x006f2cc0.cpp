// ?gatherAnimationDebuggingInfo@W3DDisplay@@IAEXXZ
// partial score=0.3659 date=2026-10-11
// ?gatherAnimationDebuggingInfo@W3DDisplay@@IAEXXZ
// cl: /DNDEBUG /MD /EHsc /D_STLP_USE_STATIC_LIB /Igame/Libraries/Source/WWVegas/WWLib
// stlport
#define _STLP_NO_EXCEPTIONS 1
#include <wchar.h>
#include "../../../../game/Libraries/Source/WWVegas/WWLib/ascii_string.h"
#include "../../../../inputs/reference/shims/stringbaseunicode/Common/UnicodeString.h"
#include <vector>
#include <bitset>
#define BFME_GAMELOGIC_LOOKUP_VISIBLE
#include "../../../../game/GameEngine/Source/Common/Thing/GameLogicObjectLookup.h"

inline UnicodeString::~UnicodeString()
{
    ((StringBase<unsigned short> *)this)->clear();
}

class AnimationDebugUnwind
{
public:
    ~AnimationDebugUnwind();
};

class Rva006EFF30
{
public:
    void buildDescription(AsciiString *str, const Rva006EFF30 &other, bool includeSame, int maxPerLine) const;
    unsigned int m_words[10];
};

template <unsigned int N> class BitFlags
{
public:
    void buildDescription(AsciiString *str, int maxPerLine) const;
    _STL::bitset<N> m_bits;
    __forceinline bool operator==(const BitFlags &other) const
    {
        for (unsigned int i = 0; i < (N + 31) / 32; ++i)
            if (m_bits._M_w[i] != other.m_bits._M_w[i])
                return false;
        return true;
    }
};

struct Rva006F2C70Element
{
    AsciiString m_animationName;
    AsciiString m_animationDetails;
    BitFlags<304> m_conditionFlags;
    unsigned int m_firstFrame;
    unsigned int m_lastFrame;
    Rva006F2C70Element()
    {
    }
    Rva006F2C70Element(const Rva006F2C70Element &other);
};

class GameFont;
class FontLibraryBFMERetail
{
public:
    GameFont *getFont(AsciiString *name, float size, unsigned char style);
};
extern FontLibraryBFMERetail *Rva00510DC0FontLibraryGlobal;
class GlobalLanguage;
extern GlobalLanguage *TheGlobalLanguageData;
struct Rva006F2CC0Language
{
    unsigned char m_at00[0xc4];
    AsciiString m_fontName;
    int m_fontSize;
    unsigned char m_fontBold;
};

class Keyboard
{
public:
    bool isCtrl();
    bool isShift();
};
extern Keyboard *TheKeyboard;

class Object;
class Drawable;
class Rva006F2CC0DrawInterface;
class Rva006F2CC0DisplayString
{
public:
    virtual void slot00() = 0;
    virtual void setText(UnicodeString text) = 0;
    virtual void slot08() = 0;
    virtual void slot0c() = 0;
    virtual void slot10() = 0;
    virtual void slot14() = 0;
    virtual void setFont(GameFont *font) = 0;

};

class Rva006F2CC0DisplayStringManager
{
public:
    virtual void slot00() = 0;
    virtual void slot04() = 0;
    virtual void slot08() = 0;
    virtual void slot0c() = 0;
    virtual void slot10() = 0;
    virtual void slot14() = 0;
    virtual void slot18() = 0;
    virtual void slot1c() = 0;
    virtual void slot20() = 0;
    virtual Rva006F2CC0DisplayString *newDisplayString() = 0;

};

extern Rva006F2CC0DisplayStringManager *Rva006F2CC0StringManager;
class Rva006F2CC0Client
{
public:
    virtual void slot00() = 0;
    virtual void slot04() = 0;
    virtual void slot08() = 0;
    virtual void slot0c() = 0;
    virtual void slot10() = 0;
    virtual void slot14() = 0;
    virtual void slot18() = 0;
    virtual void slot1c() = 0;
    virtual void slot20() = 0;
    virtual void slot24() = 0;
    virtual void slot28() = 0;
    virtual Drawable *findDrawableByID(int id) = 0;

};

class Rva006F2CC0InGameUI
{
public:
    virtual void slot00() = 0;
    virtual void slot04() = 0;
    virtual void slot08() = 0;
    virtual void slot0c() = 0;
    virtual void slot10() = 0;
    virtual void slot14() = 0;
    virtual void slot18() = 0;
    virtual void slot1c() = 0;
    virtual void slot20() = 0;
    virtual void slot24() = 0;
    virtual void slot28() = 0;
    virtual void slot2c() = 0;
    virtual void slot30() = 0;
    virtual void slot34() = 0;
    virtual void slot38() = 0;
    virtual void slot3c() = 0;
    virtual void slot40() = 0;
    virtual void slot44() = 0;
    virtual void slot48() = 0;
    virtual void slot4c() = 0;
    virtual void slot50() = 0;
    virtual void slot54() = 0;
    virtual void slot58() = 0;
    virtual void slot5c() = 0;
    virtual void slot60() = 0;
    virtual void slot64() = 0;
    virtual void slot68() = 0;
    virtual void slot6c() = 0;
    virtual void slot70() = 0;
    virtual void slot74() = 0;
    virtual void slot78() = 0;
    virtual void slot7c() = 0;
    virtual void slot80() = 0;
    virtual void slot84() = 0;
    virtual void slot88() = 0;
    virtual void slot8c() = 0;
    virtual void slot90() = 0;
    virtual void slot94() = 0;
    virtual void slot98() = 0;
    virtual void slot9c() = 0;
    virtual void slota0() = 0;
    virtual void slota4() = 0;
    virtual void slota8() = 0;
    virtual void slotac() = 0;
    virtual void slotb0() = 0;
    virtual void slotb4() = 0;
    virtual void slotb8() = 0;
    virtual void slotbc() = 0;
    virtual void slotc0() = 0;
    virtual void slotc4() = 0;
    virtual void slotc8() = 0;
    virtual void slotcc() = 0;
    virtual void slotd0() = 0;
    virtual void slotd4() = 0;
    virtual void slotd8() = 0;
    virtual void slotdc() = 0;
    virtual void slote0() = 0;
    virtual void slote4() = 0;
    virtual void slote8() = 0;
    virtual void slotec() = 0;
    virtual int getSelectionCount() = 0;
    virtual void slotf4() = 0;
    virtual void slotf8() = 0;
    virtual void slotfc() = 0;
    virtual void slot100() = 0;
    virtual Drawable *getFirstSelectedDrawable() = 0;
    virtual void slot108() = 0;
    virtual void slot10c() = 0;
    virtual void slot110() = 0;
    virtual void slot114() = 0;
    virtual void slot118() = 0;
    virtual void slot11c() = 0;
    virtual void slot120() = 0;
    virtual void slot124() = 0;
    virtual void slot128() = 0;
    virtual void slot12c() = 0;
    virtual void slot130() = 0;
    virtual void slot134() = 0;
    virtual void slot138() = 0;
    virtual void slot13c() = 0;
    virtual void slot140() = 0;
    virtual void slot144() = 0;
    virtual void slot148() = 0;
    virtual int getMousedOverDrawableID() = 0;

};

extern Rva006F2CC0Client *Rva006F2CC0GameClient;
extern Rva006F2CC0InGameUI *Rva006F2CC0UI;
class Rva006F2CC0Contain
{
public:
    virtual void slot00() = 0;
    virtual void slot04() = 0;
    virtual void slot08() = 0;
    virtual void slot0c() = 0;
    virtual void slot10() = 0;
    virtual void slot14() = 0;
    virtual void slot18() = 0;
    virtual void slot1c() = 0;
    virtual void slot20() = 0;
    virtual void slot24() = 0;
    virtual void slot28() = 0;
    virtual void slot2c() = 0;
    virtual void slot30() = 0;
    virtual void slot34() = 0;
    virtual void slot38() = 0;
    virtual void slot3c() = 0;
    virtual void slot40() = 0;
    virtual void slot44() = 0;
    virtual void slot48() = 0;
    virtual void slot4c() = 0;
    virtual void slot50() = 0;
    virtual void slot54() = 0;
    virtual void slot58() = 0;
    virtual void slot5c() = 0;
    virtual void slot60() = 0;
    virtual void slot64() = 0;
    virtual void slot68() = 0;
    virtual void slot6c() = 0;
    virtual void slot70() = 0;
    virtual void slot74() = 0;
    virtual void slot78() = 0;
    virtual void slot7c() = 0;
    virtual void slot80() = 0;
    virtual void slot84() = 0;
    virtual void slot88() = 0;
    virtual void slot8c() = 0;
    virtual void slot90() = 0;
    virtual void slot94() = 0;
    virtual void slot98() = 0;
    virtual void slot9c() = 0;
    virtual void slota0() = 0;
    virtual void slota4() = 0;
    virtual void slota8() = 0;
    virtual void slotac() = 0;
    virtual void slotb0() = 0;
    virtual void slotb4() = 0;
    virtual void slotb8() = 0;
    virtual void slotbc() = 0;
    virtual void slotc0() = 0;
    virtual void slotc4() = 0;
    virtual void slotc8() = 0;
    virtual void slotcc() = 0;
    virtual void slotd0() = 0;
    virtual void slotd4() = 0;
    virtual void slotd8() = 0;
    virtual void slotdc() = 0;
    virtual void slote0() = 0;
    virtual void slote4() = 0;
    virtual void slote8() = 0;
    virtual void slotec() = 0;
    virtual void slotf0() = 0;
    virtual Object *getContainedObject() = 0;

};

class Rva000EE6D0StringAccessor
{
public:
    AsciiString getString();
};
class Rva006F2CC0ThingTemplate
{
public:
    Rva006F2CC0ThingTemplate *rva00087A80();
    Rva006F2CC0ThingTemplate *getFinalOverride()
    {
        if (this && m_override)
            return m_override->rva00087A80();
        return this;
    }
    unsigned int m_at00;
    Rva006F2CC0ThingTemplate *m_override;
    unsigned char m_at08[0x18];
    AsciiString m_name;
};

enum WeaponSlotType { PRIMARY, SECONDARY, TERTIARY };
enum WeaponStatus { READY_TO_FIRE, OUT_OF_AMMO, BETWEEN_FIRING_SHOTS, RELOADING_CLIP, PRE_ATTACK, BETWEEN_FIRING_SHOTS_2 };
class Weapon
{
public:
    float getPercentReadyToFire() const;
    WeaponStatus getStatus() const;
private:
    friend class W3DDisplay;
    WeaponStatus bfmeComputeStatus(bool *cacheStatus) const;
public:
    unsigned int m_at00;
    Rva000EE6D0StringAccessor *m_template;
    unsigned char m_at08[0x10];
    unsigned int m_nextShot;
};
class Object
{
public:
    virtual void slot00() = 0;
    virtual void slot04() = 0;
    virtual void slot08() = 0;
    virtual void slot0c() = 0;
    virtual void slot10() = 0;
    virtual void slot14() = 0;
    virtual void slot18() = 0;
    virtual void slot1c() = 0;
    virtual void slot20() = 0;
    virtual void slot24() = 0;
    virtual Drawable *getDrawable() = 0;
    Weapon *getCurrentWeapon(WeaponSlotType *slot);
    void *unidentified_001BFE20() const;
    unsigned char m_at04[0x70];
    int m_id;
};

class Rva006F2CC0DrawModule
{
public:
    virtual void slot00() = 0;
    virtual void slot04() = 0;
    virtual void slot08() = 0;
    virtual void slot0c() = 0;
    virtual void slot10() = 0;
    virtual void slot14() = 0;
    virtual void slot18() = 0;
    virtual void slot1c() = 0;
    virtual void slot20() = 0;
    virtual void slot24() = 0;
    virtual void slot28() = 0;
    virtual void slot2c() = 0;
    virtual void slot30() = 0;
    virtual void slot34() = 0;
    virtual void slot38() = 0;
    virtual void slot3c() = 0;
    virtual void slot40() = 0;
    virtual void slot44() = 0;
    virtual void slot48() = 0;
    virtual void slot4c() = 0;
    virtual void slot50() = 0;
    virtual void slot54() = 0;
    virtual void slot58() = 0;
    virtual void slot5c() = 0;
    virtual void slot60() = 0;
    virtual void slot64() = 0;
    virtual void slot68() = 0;
    virtual void slot6c() = 0;
    virtual void slot70() = 0;
    virtual void slot74() = 0;
    virtual void slot78() = 0;
    virtual void slot7c() = 0;
    virtual void slot80() = 0;
    virtual void slot84() = 0;
    virtual void slot88() = 0;
    virtual void slot8c() = 0;
    virtual void slot90() = 0;
    virtual void slot94() = 0;
    virtual Rva006F2CC0DrawInterface *getDrawInterface() = 0;
    virtual void slot9c() = 0;
    virtual void slota0() = 0;
    virtual void slota4() = 0;
    virtual void slota8() = 0;
    virtual void slotac() = 0;
    virtual void slotb0() = 0;
    virtual void slotb4() = 0;
    virtual void slotb8() = 0;
    virtual void slotbc() = 0;
    virtual void slotc0() = 0;
    virtual void slotc4() = 0;
    virtual void slotc8() = 0;
    virtual void slotcc() = 0;
    virtual void slotd0() = 0;
    virtual void buildSubObjectDescription(AsciiString *str, int perLine) = 0;

};

class Rva006F2CC0DrawInterface
{
public:
    virtual void slot00() = 0;
    virtual void slot04() = 0;
    virtual void slot08() = 0;
    virtual void slot0c() = 0;
    virtual void slot10() = 0;
    virtual void slot14() = 0;
    virtual void slot18() = 0;
    virtual void slot1c() = 0;
    virtual void slot20() = 0;
    virtual int getAnimationCount() = 0;
    virtual AsciiString getAnimationName(int index) = 0;
    virtual void getAnimationDescription(int index, AsciiString *str, AsciiString *details) = 0;
    virtual const char *getModelName() = 0;

};

class Drawable
{
public:
    void **getDrawModules();
    unsigned int m_at00;
    Rva006F2CC0ThingTemplate *m_template;
    unsigned char m_at08[0xf4];
    Object *m_object;
    unsigned char m_at100[0x150];
    BitFlags<304> m_flags;
};
class GlobalData;
extern GlobalData *TheGlobalData;
extern GameLogic *TheGameLogic;
struct Rva006F2CC0Logic
{
    unsigned char m_at00[0x3c];
    unsigned int m_frame;
    unsigned char m_at40[0xcc];
    int m_state;
    unsigned char m_at110[0x90];
    int m_logicDepth;
};
struct Rva006F2CC0GlobalData
{
    unsigned char m_at00[0xa98];
    int m_historyMode;
};
extern const char *Rva006F2CC0HistoryModeNames[];
extern const char *Rva006F2CC0WeaponStatusNames[];
extern const char *const TheWeaponSlotTypeNames[];
class CRCParameterCheck;
extern CRCParameterCheck *TheCRCParameterCheck;
void setFPMode();
extern "C" void __cdecl bfmeRetailCritterDesyncLog(CRCParameterCheck *, const char *, ...);

static inline Rva006F2CC0Logic *logicView() { return (Rva006F2CC0Logic *)TheGameLogic; }
static inline int historyMode() { return ((Rva006F2CC0GlobalData *)TheGlobalData)->m_historyMode; }

class W3DDisplay
{
protected:
    void gatherAnimationDebuggingInfo();
    unsigned char m_at00[0x1c8];
    Rva006F2CC0DisplayString *m_animationDisplayStrings[25];
};

void W3DDisplay::gatherAnimationDebuggingInfo()
{
    static _STL::vector<Rva006F2C70Element> history;
    static int previousID = 0;
    static int previousMode = 0;
    static int lockedID = 0;
    UnicodeString text;
    AsciiString description;
    Rva006F2C70Element current;

    if (m_animationDisplayStrings[0] == 0)
    {
        GameFont *font;
        Rva006F2CC0Language *language = (Rva006F2CC0Language *)TheGlobalLanguageData;
        if (language && *((void **)&language->m_fontName) && *(unsigned short *)((char *)*((void **)&language->m_fontName) + 4) != 0)
            font = Rva00510DC0FontLibraryGlobal->getFont(&language->m_fontName, (float)language->m_fontSize, language->m_fontBold);
        else
        {
            AsciiString name("FixedSys");
            font = Rva00510DC0FontLibraryGlobal->getFont(&name, 8.0f, 0);
        }
        for (int i = 0; i < 25; ++i)
        {
            if (m_animationDisplayStrings[i] == 0)
            {
                m_animationDisplayStrings[i] = Rva006F2CC0StringManager->newDisplayString();
                m_animationDisplayStrings[i]->setFont(font);
            }
        }
    }

    text.format(UnicodeString(L"ANIMATION STATE DEBUGGER: History based on %S changes. (shift+w toggles)"), Rva006F2CC0HistoryModeNames[historyMode()]);
    m_animationDisplayStrings[0]->setText(text);
    Object *object = 0;
    Drawable *drawable;
    if (TheKeyboard->isCtrl() || TheKeyboard->isShift())
    {
        Drawable *hover = Rva006F2CC0GameClient->findDrawableByID(Rva006F2CC0UI->getMousedOverDrawableID());
        if (hover)
        {
            object = hover->m_object;
            lockedID = 0;
            if (!object)
                goto selection;
            if (TheKeyboard->isCtrl())
                lockedID = object->m_id;
        }
    }
    if (lockedID && TheGameLogic->findObjectByID(lockedID))
    {
        object = TheGameLogic->findObjectByID(lockedID);
        if (!object)
            goto noObject;
        drawable = object->getDrawable();
    }
    else
    {
selection:
        lockedID = 0;
        if (Rva006F2CC0UI->getSelectionCount() != 1)
        {
            drawable = Rva006F2CC0GameClient->findDrawableByID(Rva006F2CC0UI->getMousedOverDrawableID());
            if (drawable)
                object = drawable->m_object;
        }
        else
        {
            drawable = Rva006F2CC0UI->getFirstSelectedDrawable();
            object = drawable->m_object;
            if (!object)
                goto noObject;
            Rva006F2CC0Contain *contain = (Rva006F2CC0Contain *)object->unidentified_001BFE20();
            if (contain)
            {
                object = contain->getContainedObject();
                if (!object)
                    goto noObject;
                drawable = object->getDrawable();
            }
        }
    }
    if (!object || !drawable)
        goto noObject;

    if (TheGameLogic->findObjectByID(previousID) != object || previousMode != historyMode())
    {
        previousID = object->m_id;
        history.erase(history.begin(), history.end());
        previousMode = historyMode();
    }
    {
        Rva006F2CC0DrawModule **modules = (Rva006F2CC0DrawModule **)drawable->getDrawModules();
        Rva006F2CC0DrawModule **selectedModule = 0;
        Rva006F2CC0DrawInterface *drawInterface = 0;
        Rva006F2CC0DrawInterface *fallback = 0;
        if (modules)
        {
            for (; *modules; ++modules)
            {
                drawInterface = (*modules)->getDrawInterface();
                if (drawInterface)
                {
                    if (drawInterface->getAnimationCount() > 0)
                        break;
                    fallback = drawInterface;
                }
            }
            selectedModule = modules;
        }
        if (!drawInterface)
            drawInterface = fallback;
        const char *modelName = drawInterface ? drawInterface->getModelName() : 0;
        if (!modelName)
            modelName = "n/a";
        text.format(UnicodeString(L"LOCKED Object: %S (ID:%d) %S"), drawable->m_template->getFinalOverride()->m_name.str(), object->m_id, modelName);
        if (lockedID)
            ((StringBase<unsigned short> *)&text)->concat((const unsigned short *)L" -- release by Shift+mousing over any object", (int)wcslen(L" -- release by Shift+mousing over any object"));
        m_animationDisplayStrings[1]->setText(text);
        WeaponSlotType slot;
        Weapon *weapon = object->getCurrentWeapon(&slot);
        if (weapon)
        {
            unsigned int nextShot = weapon->m_nextShot;
            int percent = (int)(weapon->getPercentReadyToFire() * 100.0f);
            WeaponStatus status;
            if (logicView()->m_state == 1 || logicView()->m_state == 5)
                status = weapon->bfmeComputeStatus(0);
            else
            {
                if (logicView()->m_logicDepth == 0)
                    setFPMode();
                ++logicView()->m_logicDepth;
                if (TheCRCParameterCheck)
                    bfmeRetailCritterDesyncLog(TheCRCParameterCheck, "POTENTIAL DESYNC: Forced into EnterLogic State. (W3DDisplay::gatherAnimationDebuggingInfo)");
                status = weapon->getStatus();
                --logicView()->m_logicDepth;
                if (TheCRCParameterCheck)
                    bfmeRetailCritterDesyncLog(TheCRCParameterCheck, "LeaveLogic() called.");
            }
            text.format(UnicodeString(L"Weapon: %S(%S), NextShot:%d(%d%%), Status:%S"), weapon->m_template->getString().str(), TheWeaponSlotTypeNames[slot], nextShot, percent, Rva006F2CC0WeaponStatusNames[status]);
            m_animationDisplayStrings[2]->setText(text);
        }
        else
        {
            text.format(UnicodeString(L"Weapon: n/a"), drawable->m_template->getFinalOverride()->m_name.str(), object->m_id);
            m_animationDisplayStrings[2]->setText(text);
        }
        current.m_firstFrame = current.m_lastFrame = logicView()->m_frame;
        text.format(UnicodeString(L"CURRENT Frame: %d"), current.m_firstFrame);
        m_animationDisplayStrings[3]->setText(text);
        if (drawInterface && *selectedModule)
        {
            (*selectedModule)->buildSubObjectDescription(&description, 4);
            text.format(UnicodeString(L"SubObject Statii: (%S)"), description.str());
            m_animationDisplayStrings[4]->setText(text);
            int count = drawInterface->getAnimationCount();
            if (count >= 1)
            {
                current.m_animationName = drawInterface->getAnimationName(0);
                drawInterface->getAnimationDescription(0, &description, &current.m_animationDetails);
                if (count >= 2)
                    text.format(UnicodeString(L"Blending From: %S"), description.str());
                else
                    text.format(UnicodeString(L"CURRENT Animation: %S"), description.str());
                m_animationDisplayStrings[6]->setText(text);
                text.format(UnicodeString(L"%S"), current.m_animationDetails.str());
                m_animationDisplayStrings[5]->setText(text);
            }
            else
            {
                text.format(UnicodeString(L"CURRENT Animation: Doesn't have one!"));
                m_animationDisplayStrings[6]->setText(text);
            }
            if (count >= 2)
            {
                current.m_animationName = drawInterface->getAnimationName(1);
                drawInterface->getAnimationDescription(1, &description, &current.m_animationDetails);
                text.format(UnicodeString(L"Blending To: %S"), description.str());
                m_animationDisplayStrings[7]->setText(text);
                text.format(UnicodeString(L"%S"), current.m_animationDetails.str());
                m_animationDisplayStrings[5]->setText(text);
            }
            else
            {
                text.format(UnicodeString(L"No blend in progress"));
                m_animationDisplayStrings[7]->setText(text);
            }
        }
    }
    current.m_conditionFlags = drawable->m_flags;
    current.m_conditionFlags.buildDescription(&description, 4);
    text.format(UnicodeString(L"CURRENT ModelConditionFlags: (%S)"), description.str());
    m_animationDisplayStrings[8]->setText(text);
    if (history.size() == 0)
        history.push_back(current);
    else
    {
        switch (historyMode())
        {
        case 2:
            if (history[history.size() - 1].m_animationDetails.StringBase<char>::compare(current.m_animationDetails) == 0)
                history[history.size() - 1].m_lastFrame = current.m_lastFrame;
            else
                history.push_back(current);
            break;
        case 1:
            {
                if (history[history.size() - 1].m_conditionFlags == current.m_conditionFlags)
                    history[history.size() - 1].m_lastFrame = current.m_lastFrame;
                else
                    history.push_back(current);
            }
            break;
        case 0:
            if (history[history.size() - 1].m_animationName.StringBase<char>::compare(current.m_animationName) == 0)
                history[history.size() - 1].m_lastFrame = current.m_lastFrame;
            else
                history.push_back(current);
            break;
        }
    }
    {
        int size = (int)history.size();
        if (size > 1)
        {
            ((Rva006EFF30 *)&history[size - 1].m_conditionFlags)->buildDescription(&description, *(Rva006EFF30 *)&history[size - 2].m_conditionFlags, false, 4);
            text.format(UnicodeString(L"CURRENT Delta ConditionFlags: %S\n"), description.str());
            m_animationDisplayStrings[9]->setText(text);
            for (int i = 0; i < 5; ++i)
            {
                int index = size - i - 2;
                int previous = size - i - 3;
                if (previous < 0)
                {
                    text.format(UnicodeString(L""));
                    m_animationDisplayStrings[10 + 3 * i]->setText(text);
                    m_animationDisplayStrings[11 + 3 * i]->setText(text);
                    m_animationDisplayStrings[12 + 3 * i]->setText(text);
                }
                else
                {
                    Rva006F2C70Element &old = history[index];
                    if (i == 4)
                    {
                        text.format(UnicodeString(L"OLDEST Frame %d-%d: %S"), old.m_firstFrame, old.m_lastFrame, old.m_animationDetails.str());
                        m_animationDisplayStrings[22]->setText(text);
                        text.format(UnicodeString(L"OLDEST Animation: %S"), old.m_animationName.str());
                        m_animationDisplayStrings[23]->setText(text);
                        old.m_conditionFlags.buildDescription(&description, 4);
                        text.format(UnicodeString(L"OLDEST ModelConditionFlags: (%S)\n"), description.str());
                        m_animationDisplayStrings[24]->setText(text);
                    }
                    else
                    {
                        text.format(UnicodeString(L"OLD Frame %d-%d: %S"), old.m_firstFrame, old.m_lastFrame, old.m_animationDetails.str());
                        m_animationDisplayStrings[10 + 3 * i]->setText(text);
                        text.format(UnicodeString(L"OLD Animation: %S"), old.m_animationName.str());
                        m_animationDisplayStrings[11 + 3 * i]->setText(text);
                        ((Rva006EFF30 *)&old.m_conditionFlags)->buildDescription(&description, *(Rva006EFF30 *)&history[previous].m_conditionFlags, false, 4);
                        text.format(UnicodeString(L"OLD Delta ConditionFlags: (%S)\n"), description.str());
                        m_animationDisplayStrings[12 + 3 * i]->setText(text);
                    }
                }
            }
        }
        else
        {
            text.format(UnicodeString(L"Delta ModelConditions: n/a"));
            m_animationDisplayStrings[9]->setText(text);
        }
    }
    return;

noObject:
    text.format(UnicodeString(L""));
    for (int i = 1; i < 25; ++i)
        m_animationDisplayStrings[i]->setText(text);
    previousID = 0;
    history.erase(history.begin(), history.end());
    previousMode = historyMode();
}
