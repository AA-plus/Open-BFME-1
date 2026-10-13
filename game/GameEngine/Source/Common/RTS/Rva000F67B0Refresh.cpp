// ?refresh@Rva000F72D0FrameCachedValue@@AAEXM@Z
// cl: /DNDEBUG /DWIN32 /MD /EHsc /D_STLP_USE_STATIC_LIB /Igame/Libraries/Include
// stlport
#include <vector>
#include "Lib/Coord3D.h"

class Team
{
public:
	void getEstimateTeamPosition_000EDCD0(Coord3D *outPos) const;
};

class BfmeTeamXQ : public Team
{
public:
	// ?bfmeEstimateXQ@BfmeTeamXQ@@QAEXPAUCoord3D@@@Z absent-from-retail
	__forceinline void bfmeEstimateXQ(Coord3D *outPos)
	{
		getEstimateTeamPosition_000EDCD0(outPos);
	}
};

// The canonical global is accessed through its decoded frame prefix.
class GameLogicFrameSlice
{
public:
	unsigned char m_unmodelled_000[0x3c];
	unsigned int m_frame;
	unsigned int getFrame() const { return m_frame; }
};

class GameLogic;
extern GameLogic *TheGameLogic;

// Only the shared override prefix is needed; no instances are allocated here.
class Overridable
{
public:
	void *m_vtable;
	Overridable *m_nextOverride;
	// recursively ask if there is a next override, and if not, return this.
	const Overridable *getFinalOverride() const
	{
		if (m_nextOverride)
			return m_nextOverride->getFinalOverride();
		return this;
	}
};

// ?getTemplate000F67B0@@YAPBVOverridable@@PBX@Z absent-from-retail
static __forceinline const Overridable *getTemplate000F67B0(const void *node)
{
	const Overridable *m_nextOverride = *(const Overridable *const *)((const char *)node + 4);
	if (!m_nextOverride)
		return 0;
	return m_nextOverride->getFinalOverride();
}

// ?getValue000F67B0@@YAMPBX@Z absent-from-retail
static __forceinline float getValue000F67B0(const void *node)
{
	return *(const float *)((const char *)getTemplate000F67B0(node) + 0x3fc);
}

struct WideResultEntry
{
	void *node;
	unsigned int unused; // Distance bits; this body consumes only the pointer.
};

class WideResultHandle
{
public:
	_STL::vector<WideResultEntry> m_values;
	WideResultEntry *m_cursor;
	int m_refCount;
};

struct BfmeWideResult
{
	WideResultHandle *m_value;
	__forceinline void *next(void *&node)
	{
		if (m_value->m_cursor == m_value->m_values.end())
			return 0;
		WideResultEntry *cursor = m_value->m_cursor;
		node = cursor->node;
		m_value->m_cursor = cursor + 1;
		return node;
	}
	__forceinline ~BfmeWideResult()
	{
		if (--m_value->m_refCount == 0)
			delete m_value;
	}
};

extern "C" const unsigned char bfmeVftPartitionFilter[];
extern "C" const unsigned char bfmeVftRva0025ED50RootFilter[];
extern "C" const unsigned char bfmeVftPartitionFilterRelationship[];
extern "C" const unsigned char bfmeVftPartitionFilterSameMapStatus[];

// The banked filter names retain the witnessed constructor and destructor views.
class PartitionFilter
{
public:
	PartitionFilter *link(PartitionFilter *next);
	volatile unsigned int m_vptr;
	PartitionFilter *m_next;
};

class PartitionFilterA : public PartitionFilter
{
public:
	PartitionFilterA(void *object) { m_next = 0; m_vptr = (unsigned int)bfmeVftPartitionFilterSameMapStatus; m_data = object; }
	~PartitionFilterA() { m_vptr = (unsigned int)bfmeVftPartitionFilter; }
	void *m_data;
};

class PartitionFilterB : public PartitionFilter
{
public:
	PartitionFilterB() { m_next = 0; m_vptr = (unsigned int)bfmeVftRva0025ED50RootFilter; }
	~PartitionFilterB() { m_vptr = (unsigned int)bfmeVftPartitionFilter; }
};

class PartitionFilterC : public PartitionFilter
{
public:
	PartitionFilterC(void *object) { m_next = 0; m_vptr = (unsigned int)bfmeVftPartitionFilterRelationship; m_data = object; m_mode = 1; m_flag = 0; }
	~PartitionFilterC() { m_vptr = (unsigned int)bfmeVftPartitionFilter; }
	void *m_data;
	int m_mode;
	unsigned char m_flag;
};

class BfmeWideForwardC
{
public:
	BfmeWideResult bfmeForwardWideC(int a, float b, int c, int d, int e);
};

class PartitionManager;
extern PartitionManager *ThePartitionManager;

class Rva000F72D0FrameCachedValue : public BfmeTeamXQ
{
public:
	float value(float range);

private:
	void refresh(float range);

	unsigned char m_unmodelled_000[0xc];
	void *m_object;
	unsigned char m_unmodelled_010[0xe4];
	float m_value;
	unsigned int m_frame;
};

// ?refresh@Rva000F72D0FrameCachedValue@@AAEXM@Z
void Rva000F72D0FrameCachedValue::refresh(float range)
{
	Coord3D estimate;
	bfmeEstimateXQ(&estimate);

	void *object = m_object;
	if (object == 0)
		return;

	BfmeWideResult result = ((BfmeWideForwardC *)ThePartitionManager)->bfmeForwardWideC((int)&estimate, range, 0, (int)PartitionFilterC(object).link(PartitionFilterB().link(&PartitionFilterA(object))), 0);

	float newValue = 0.0f;
	void *node;
	while ((node = result.next(node)) != 0)
	{
		newValue += getValue000F67B0(node);
	}

	m_value = newValue;
	m_frame = ((GameLogicFrameSlice *)TheGameLogic)->getFrame() + 25;
}
