// cl: /Igame/Libraries/Source/WWVegas/WWLib
// readable body of ??0Rva0035D2B0Node@@QAE@XZ: the constructor the ScriptEngine
// table's addNode (0x0035D2B0) calls through ILT 0x0004213B (thunk target
// FUN_00754c10).  Retail stores a 4-byte link at +0, then an embedded Script
// subobject at +4: its vtable is the pinned ??_7Script@@6B@ (0x010E858C) and its
// member pattern (name/comment/conditionComment, delay, seven booleans
// 1110111, three pointers, nextScript, warning byte, trailing four dwords)
// matches ScriptCtor.cpp exactly, shifted by four bytes.  The inlined
// Script::Script() is what reproduces retail's late `mov dl,1` scheduling; a
// flat re-spelling of the stores hoists it and leaves twenty byte differences.
// Script's out-of-line copy is owned by ScriptCtor.cpp, so the definition here
// stays `inline` (same instruction/relocation result, one weak COMDAT).

#include "ascii_string.h"

class Xfer;

// upstream layout: inputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/GameEngine/Include/Common/Snapshot.h
class Snapshot
{
public:
	Snapshot() {}
	virtual ~Snapshot();

protected:
	virtual void crc( Xfer *xfer ) = 0;
	virtual void xfer( Xfer *xfer ) = 0;
	virtual void loadPostProcess() = 0;
};

// upstream layout: inputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/GameEngine/Include/GameLogic/Scripts.h
class Script : public Snapshot
{
public:
	Script();
	virtual ~Script();
	virtual void crc( Xfer *xfer );
	virtual void xfer( Xfer *xfer );
	virtual void loadPostProcess();

private:
	AsciiString m_scriptName;
	AsciiString m_comment;
	AsciiString m_conditionComment;
	int m_delayEvaluationSeconds;
	bool m_isActive;
	bool m_isOneShot;
	bool m_easy;
	bool m_isSubroutine;
	bool m_normal;
	bool m_hard;
	bool m_bfmeFlag;
	void *m_condition;
	void *m_action;
	void *m_actionFalse;
	Script *m_nextScript;
	bool m_hasWarnings;
	AsciiString m_conditionTeamName;
	float m_conditionTime;
	float m_curTime;
	int m_conditionExecutedCount;
};

inline Script::Script() :
	m_delayEvaluationSeconds( 0 ),
	m_isActive( true ),
	m_isOneShot( true ),
	m_easy( true ),
	m_isSubroutine( false ),
	m_normal( true ),
	m_hard( true ),
	m_bfmeFlag( true ),
	m_condition( 0 ),
	m_action( 0 ),
	m_actionFalse( 0 ),
	m_nextScript( 0 ),
	m_hasWarnings( false ),
	m_conditionTime( 0.0f ),
	m_curTime( 0.0f ),
	m_conditionExecutedCount( 0 )
{
}

// The table node: a link the table's addNode chains onto record->m_nodes in
// front of a Script payload.  Identity beyond the call site is unproven, so the
// class keeps its address-derived name.
class Rva0035D2B0Node
{
public:
	Rva0035D2B0Node();

private:
	void *m_link;
	Script m_script;
};

Rva0035D2B0Node::Rva0035D2B0Node() :
	m_link( 0 )
{
}
