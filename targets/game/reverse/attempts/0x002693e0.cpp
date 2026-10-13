// ??0SpecialPowerModule@@QAE@PAVThing@@PBVModuleData@@@Z
// partial score=0.946 date=2026-10-13
// cl: /DNDEBUG /MD /EHsc /Igame/Libraries/Source/WWVegas/WWLib
// readable body of ??0SpecialPowerModule@@QAE@PAVThing@@PBVModuleData@@@Z: inputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/GameEngine/Source/GameLogic/Object/SpecialPower/SpecialPowerModule.cpp
//
// SpecialPowerModule::SpecialPowerModule, retail 0x002693E0, 426 bytes (ret 8).
// Every concrete special power's constructor (CashHack, Darkness, Defector,
// ElvenWood, Stop, ...) calls it through ILT 0x00011E50, where symbols.csv pins
// this name and ilt_oracle CONFIRMS it. It stamps SpecialPowerModule's three
// vftables over BehaviorModule's (ObjectModule at +0, BehaviorModuleInterface
// at +0xC) and the SpecialPowerModuleInterface at +0x10, whose own out-of-line
// constructor is the address-named Rva00267FC0 (0x00267FC0).
//
// The body is Zero Hour's, with two BFME differences: pauseCountdown is
// inlined, and a module-data flag at +0x20D makes the power available from
// the current frame.

#include "ascii_string.h"

typedef unsigned int UnsignedInt;
typedef int Int;
typedef bool Bool;
typedef float Real;
typedef int ObjectID;

enum KindOfType
{
	KINDOF_STRUCTURE = 7
};

class Thing;
class ModuleData;
class Player;

// upstream layout: inputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/GameEngine/Include/Common/Overridable.h
// Overridable::friend_getFinalOverride is defined recursively and inline in the
// header; retail unrolls the walk twice and calls the out-of-line non-const copy
// (ILT 0x00048C61) for the rest, as SpecialPowerTemplate_isShortcutPower_Thunk.cpp
// documents. MSVC does not expand a recursive inline unless inline_recursion
// is on, so the depth is pinned.
#pragma inline_recursion(on)
#pragma inline_depth(3)

// upstream layout: inputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/GameEngine/Include/Common/Overridable.h
class Overridable
{
public:
	virtual ~Overridable();

	Overridable *friend_getFinalOverride(void)
	{
		if (m_nextOverride)
			return m_nextOverride->friend_getFinalOverride();
		return this;
	}

protected:
	Overridable *m_nextOverride;		// +0x04
};

// upstream layout: inputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/GameEngine/Include/Common/SpecialPower.h
class SpecialPowerTemplate : public Overridable
{
public:
	Bool isSharedNSync(void) const
	{
		const SpecialPowerTemplate *self = (const SpecialPowerTemplate *)
			const_cast<SpecialPowerTemplate *>(this)->friend_getFinalOverride();
		return self->m_sharedNSync;
	}

	Bool hasPublicTimer(void) const
	{
		const SpecialPowerTemplate *self = (const SpecialPowerTemplate *)
			const_cast<SpecialPowerTemplate *>(this)->friend_getFinalOverride();
		return self->m_hasPublicTimer;
	}

private:
	char m_pad[0x114 - 8];

public:
	Bool m_hasPublicTimer;		// +0x114
	Bool m_sharedNSync;		// +0x115
};

// upstream layout: inputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/GameEngine/Include/GameLogic/Module/SpecialPowerModule.h
class SpecialPowerModuleData
{
public:
	char m_pad[8];
	SpecialPowerTemplate *m_specialPowerTemplate;	// +0x08
	unsigned char m_initiateSound;
	Bool m_startsPaused;				// +0x0D
	char m_pad0E[0x20d - 0x0e];
	Bool m_unreconstructed20D;			// +0x20D, BFME
};

// upstream layout: inputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/GameEngine/Include/GameLogic/GameLogic.h
class GameLogic
{
public:
	UnsignedInt getFrame(void) const { return m_frame; }

private:
	char m_pad[0x3c];
	UnsignedInt m_frame;
};

extern GameLogic *TheGameLogic;

class Player
{
public:
	Int getPlayerIndex(void) const
	{
		return *(const Int *)((const char *)this + 0x24);
	}
};

// upstream layout: inputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/GameEngine/Include/Common/Thing.h
class Thing
{
public:
	Bool isKindOf(KindOfType t) const;
};

// upstream layout: inputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/GameEngine/Include/GameLogic/Object.h
class Object : public Thing
{
public:
	Player *getControllingPlayer(void) const;
	ObjectID getID(void) const { return m_id; }

	// Zero Hour tests OBJECT_STATUS_UNDER_CONSTRUCTION here; BFME reads bit 2
	// of the status byte at +0x90.
	Bool testStatus090Bit2(void) const { return (m_status090 & 4) != 0; }

private:
	char m_pad000[0x74];
	ObjectID m_id;				// +0x74
	char m_pad078[0x90 - 0x78];
	unsigned char m_status090;		// +0x90
};

// upstream layout: inputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/GameEngine/Include/GameClient/InGameUI.h
class InGameUI
{
public:
	virtual void slot00(void); virtual void slot01(void); virtual void slot02(void); virtual void slot03(void);
	virtual void slot04(void); virtual void slot05(void); virtual void slot06(void); virtual void slot07(void);
	virtual void slot08(void); virtual void slot09(void); virtual void slot0a(void); virtual void slot0b(void);
	virtual void slot0c(void); virtual void slot0d(void); virtual void slot0e(void); virtual void slot0f(void);
	virtual void slot10(void); virtual void slot11(void); virtual void slot12(void); virtual void slot13(void);
	virtual void slot14(void); virtual void slot15(void); virtual void slot16(void); virtual void slot17(void);
	virtual void slot18(void); virtual void slot19(void); virtual void slot1a(void); virtual void slot1b(void);
	virtual void slot1c(void); virtual void slot1d(void); virtual void slot1e(void); virtual void slot1f(void);
	virtual void slot20(void);
	virtual void addSuperweapon(Int playerIndex, const AsciiString &powerName, ObjectID id,
		const SpecialPowerTemplate *powerTemplate);	// +0x84
};

extern InGameUI *TheInGameUI;

// upstream layout: inputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/GameEngine/Include/Common/Module.h
class Module
{
public:
	virtual ~Module();

protected:
	const ModuleData *m_moduleData;		// +0x04
};

class ObjectModule : public Module
{
public:
	ObjectModule(Thing *thing, const ModuleData *moduleData);
	virtual ~ObjectModule();

protected:
	Object *m_object;			// +0x08
};

// upstream layout: inputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/GameEngine/Include/GameLogic/Module/BehaviorModule.h
class BehaviorModuleInterface
{
public:
	virtual void behaviorInterfaceSlot00(void);
};

class BehaviorModule : public ObjectModule, public BehaviorModuleInterface
{
public:
	BehaviorModule(Thing *thing, const ModuleData *moduleData) : ObjectModule(thing, moduleData) {}
};

// SpecialPowerModuleInterface; its own constructor is ??0Rva00267FC0@@QAE@XZ.
// upstream layout: inputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/GameEngine/Include/GameLogic/Module/SpecialPowerModule.h
class Rva00267FC0
{
public:
	virtual void slot00(void) const;
	virtual void slot01(void) const;
	virtual Real getPercentReady(void) const = 0;			// +0x08
	virtual void slot03(void) const;
	virtual void slot04(void) const;
	virtual AsciiString getPowerName(void) const = 0;		// +0x14
	virtual const SpecialPowerTemplate *getSpecialPowerTemplate(void) const = 0;
	virtual void slot07(void);
	virtual void slot08(void);
	virtual void slot09(void);
	virtual void pauseCountdown(Bool pause) = 0;			// +0x28
	virtual void slot11(void);
	virtual void slot12(void);
	virtual void slot13(void);
	virtual void slot14(void);
	virtual void slot15(void);
	virtual void startPowerRecharge(void) = 0;			// +0x40
};

class SpecialPowerModule : public BehaviorModule, public Rva00267FC0
{
public:
	SpecialPowerModule(Thing *thing, const ModuleData *moduleData);

	virtual Real getPercentReady(void) const;
	virtual AsciiString getPowerName(void) const;
	virtual const SpecialPowerTemplate *getSpecialPowerTemplate(void) const
	{
		return getSpecialPowerModuleData()->m_specialPowerTemplate;
	}
	virtual void pauseCountdown(Bool pause)
	{
		if (pause)
		{
			if (m_pausedCount == 0)
			{
				m_pausedOnFrame = TheGameLogic->getFrame();
				m_pausedPercent = getPercentReady();
			}
			++m_pausedCount;
		}
	}
	virtual void startPowerRecharge(void);

protected:
	const SpecialPowerModuleData *getSpecialPowerModuleData(void) const
	{
		return (const SpecialPowerModuleData *)m_moduleData;
	}
	Object *getObject(void) const { return m_object; }

	UnsignedInt m_availableOnFrame;		// +0x14
	Int m_pausedCount;			// +0x18
	UnsignedInt m_pausedOnFrame;		// +0x1C
	Real m_pausedPercent;			// +0x20
	Bool m_unreconstructed24;		// +0x24, BFME
	Int m_unreconstructed28;		// +0x28, BFME
};

SpecialPowerModule::SpecialPowerModule( Thing *thing, const ModuleData *moduleData )
									: BehaviorModule( thing, moduleData )
{

	m_availableOnFrame = 0;
	m_pausedCount = 0;
	m_pausedOnFrame = 0;
	m_pausedPercent = 0.0f;
	m_unreconstructed24 = false;
	m_unreconstructed28 = 0;

	// if we're pre-built, start counting down
	if( !getObject()->testStatus090Bit2() )
	{
		if ( getSpecialPowerTemplate()->isSharedNSync() == false )
			startPowerRecharge();
	}

	// Some Special powers need to be activated by an Upgrade, so prevent the timer from going until then
	const SpecialPowerModuleData *md = (const SpecialPowerModuleData *)moduleData;
	if( md->m_startsPaused )
		pauseCountdown( true );

	if( md->m_unreconstructed20D )
		m_availableOnFrame = TheGameLogic->getFrame();

	// add this weapon to the UI if it has a public timer for all to see
	if( m_pausedCount == 0 &&
			getSpecialPowerTemplate()->isSharedNSync() == true &&
			getSpecialPowerTemplate()->hasPublicTimer() == true &&
			getObject()->getControllingPlayer() &&
			getObject()->isKindOf( KINDOF_STRUCTURE ) )
	{
		TheInGameUI->addSuperweapon( getObject()->getControllingPlayer()->getPlayerIndex(), 
																 getPowerName(), 
																 getObject()->getID(), 
																 getSpecialPowerModuleData()->m_specialPowerTemplate );
	}

}
