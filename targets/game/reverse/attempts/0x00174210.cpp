// ?update@AICowerState@@UAE?AW4StateReturnType@@XZ
// partial score=0.9371 date=2026-10-11
// cl: /DNDEBUG /DWIN32 /D_WINDOWS /MD /EHsc /D_STLP_USE_STATIC_LIB /D_STLP_NO_EXCEPTIONS
// stlport

#include <list>

typedef bool Bool;
typedef int Int;
typedef unsigned int UnsignedInt;
typedef unsigned int ObjectID;

enum StateReturnType
{
    STATE_CONTINUE = 0,
    STATE_SUCCESS = -1,
    STATE_FAILURE = -2
};

enum KindOfType
{
    KINDOF_CANNOT_COWER = 0x7A
};

class Drawable;
class Object;

class StateMachine
{
public:
    Object *getGoalObject();

    unsigned char m_padding[ 0x10 ];
    Object *m_owner;
};


class Gen_0026FD20
{
public:
    Bool bfmeReady() const;
};


class Object
{
public:
    virtual void slot00();
    virtual void slot04();
    virtual void slot08();
    virtual void slot0C();
    virtual void slot10();
    virtual void slot14();
    virtual void slot18();
    virtual void slot1C();
    virtual void slot20();
    virtual void slot24();
    virtual Drawable *getDrawable();

    Bool isKindOf( KindOfType kind ) const;
    Bool bfmeGetRecentDamageSource( ObjectID *sourceID, UnsignedInt frames ) const;
    Bool bfmeDamageSourceCanCauseCower( Int sourceID ) const;

    unsigned char m_padding[ 0x200 ];
    Gen_0026FD20 *m_ai;
};


typedef _STL::list<Drawable *> DrawableList;

class PickAndPlayInfo;

class GameMessage
{
public:
    enum Type
    {
        MSG_COWER = 0x7DB
    };
};

void pickAndPlayUnitVoiceResponse( const DrawableList *list, GameMessage::Type messageType,
    PickAndPlayInfo *info );


class AICowerState
{
public:
    virtual void slot00();
    virtual void slot04();
    virtual void slot08();
    virtual void slot0C();
    virtual void slot10();
    virtual void slot14();
    virtual StateReturnType update();
    virtual void slot1C();
    virtual void slot20();
    virtual void slot24();
    virtual void slot28();
    virtual void slot2C();
    virtual void slot30();
    virtual void slot34();
    virtual void slot38();
    virtual void slot3C();
    virtual void slot40();
    virtual Bool slot44();

    unsigned char m_padding[ 0x18 ];
    StateMachine *m_machine;
};

StateReturnType AICowerState::update()
{
    Object *goal = m_machine->getGoalObject();
    if ( goal == 0 )
        return STATE_SUCCESS;

    if ( ((unsigned char *)goal)[ 0x344 ] & 1 &&
        !goal->isKindOf( KINDOF_CANNOT_COWER ) )
        return STATE_SUCCESS;

    Object *owner = m_machine->m_owner;
    if ( owner == 0 )
        return STATE_FAILURE;

    Bool canCauseCower = false;
    if ( !slot44() )
        return STATE_CONTINUE;

    ObjectID sourceID;
    if ( owner->bfmeGetRecentDamageSource( &sourceID, 4 ) )
        canCauseCower = owner->bfmeDamageSourceCanCauseCower( sourceID );

    Gen_0026FD20 *ai = owner->m_ai;
    if ( ai == 0 )
        return STATE_FAILURE;

    if ( canCauseCower && !ai->bfmeReady() ) {
    DrawableList drawables;
    Drawable *drawable = owner->getDrawable();
    drawables.push_back( drawable );
    pickAndPlayUnitVoiceResponse( &drawables, GameMessage::MSG_COWER, 0 );
    return STATE_SUCCESS;
    }
    return STATE_CONTINUE;
}
