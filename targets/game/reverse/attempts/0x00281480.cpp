// ??0AutoFindHealingUpdate@@QAE@PAVThing@@PBVModuleData@@@Z
// partial score=1.0 date=2026-10-11
// cl: /DNDEBUG /MD /EHsc
// BFME-2 AutoFindHealingUpdateCtor.cpp at 2a0f7acb06 confirms trailing +0x20 zero.
// BFME-1 factory 0x00119780 and retail body 0x00281480..0x002814CD establish
// identity and layout; ProneUpdateConstructor.cpp supplies the BFME-1 inline
// three-base shape instead of BFME-2 UpdateModule call and dummy vtables.
class Thing;
class ModuleData;
class Object;

// upstream layout: GameLogic/Module/ObjectModule.h
class ObjectModule
{
public:
	ObjectModule(Thing *, const ModuleData *);
	virtual ~ObjectModule();

protected:
	void *m_moduleData;
	Object *m_object;
};

// upstream layout: GameLogic/Module/UpdateModule.h
class UpdateModuleInterface
{
public:
	virtual void updateInterfaceAnchor();
};

// upstream layout: GameLogic/Module/BehaviorModule.h
class BehaviorModuleInterface
{
public:
	virtual void behaviorInterfaceAnchor();
};

// upstream layout: GameLogic/Module/UpdateModule.h
class UpdateModule : public ObjectModule,
	public BehaviorModuleInterface,
	public UpdateModuleInterface
{
public:
	UpdateModule(Thing *thing, const ModuleData *moduleData)
		: ObjectModule(thing, moduleData),
		  m_nextCallFrameAndPhase(0), m_indexInLogic(-1), m_pad(-1)
	{
	}

private:
	unsigned int m_nextCallFrameAndPhase;
	int m_indexInLogic;
	int m_pad;
};

// upstream layout: GameLogic/Module/AutoFindHealingUpdate.h
class AutoFindHealingUpdate : public UpdateModule
{
public:
	AutoFindHealingUpdate(Thing *, const ModuleData *);

private:
	int m_nextScanFrames;
};

AutoFindHealingUpdate::AutoFindHealingUpdate(Thing *thing, const ModuleData *moduleData)
	: UpdateModule(thing, moduleData)
{
	// Retail writes the trailing field AFTER its own most-derived vftable batch
	// and before the epilogue, which a plain store would sink past the batch;
	// the volatile lvalue is what keeps it in the middle.
	*(volatile int *)&m_nextScanFrames = 0;
}
