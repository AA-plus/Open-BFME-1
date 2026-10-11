// cl: /DNDEBUG /MD /EHsc
//
// Complete destructor of AIFollowPathState, an AIInternalMoveToState subclass
// that adds no cleanup of its own (no vptr store, hence novtable): the retail
// body at 0x00185630 (ILT 0x00014768; called by the scalar wrapper at
// 0x00185600) is a 5-byte tail jump through ILT 0x0004AAF7 to
// ??1AIInternalMoveToState@@UAE@XZ (0x00172430).

class AIInternalMoveToState
{
public:
	virtual ~AIInternalMoveToState();
};

class __declspec(novtable) AIFollowPathState : public AIInternalMoveToState
{
public:
	virtual ~AIFollowPathState();
};

AIFollowPathState::~AIFollowPathState()
{
}
