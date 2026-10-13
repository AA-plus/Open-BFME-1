// ?getRva0058B590Value@Player@@QBEJH@Z
// partial score=1.0 date=2026-10-13
#include "../../../../game/GameEngine/Source/Common/Rva0058B590Value.cpp"
#include <hash_map>
#include <vector>
// ?getRva0058B590Value@Player@@QBEJH@Z
// partial score=0.64 date=2026-09-09
// cl: /DNDEBUG /DRELEASE_DEBUG_LOGGING /DWIN32 /D_WINDOWS /MD /EHsc /DZH_EMIT_POOL_GLUE /Iinputs/reference/shims/sweep /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/GameEngine/Include /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/GameEngine/Source /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Libraries/Include /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Libraries/Source /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Libraries/Source/Compression /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/GameEngineDevice/Include /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Main /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Libraries/Source/WWVegas /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Libraries/Source/WWVegas/WWLib /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Libraries/Source/WWVegas/WW3D2 /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Libraries/Source/WWVegas/WWDebug /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Libraries/Source/WWVegas/WWSaveLoad
// stlport

#ifndef NULL
#define NULL 0
#endif

extern "C" __declspec(dllimport) double __cdecl floor(double);

typedef unsigned int UnsignedInt;
typedef int Int;
typedef float Real;

extern float BfmeZeroRange;
extern float g_bfmeScaleBC;
extern float g_bfmeK1253;

struct BfmeObject;

struct BfmeObjectHashNode
{
	BfmeObjectHashNode *m_next;
	UnsignedInt m_id;
	BfmeObject *m_object;
};

struct BfmeGameLogic
{
 unsigned char m_pad00[0xb0];
 _STL::hash_map<int, BfmeObject*, _STL::hash<int>, _STL::equal_to<int> > m_objectHash;
};

extern BfmeGameLogic *TheBfmeGameLogic;

struct BfmeObject
{
	unsigned char m_pad00[0x118];
	unsigned char m_status;
};

struct BfmePlayerValue
{
	Int *m_key;
	_STL::vector<Real> m_valuesBegin;
	UnsignedInt m_objectID;
};

struct BfmePlayerValueNode
{
	BfmePlayerValueNode *m_next;
	BfmePlayerValueNode *m_prev;
	BfmePlayerValue *m_value;
};


long Player::getRva0058B590Value(int value) const
{
	Real result = BfmeZeroRange;
	UnsignedInt valueIndex = 0;
	BfmePlayerValueNode *anchor = *(BfmePlayerValueNode **)((const unsigned char *)this + 0x640);
	BfmePlayerValueNode *node = anchor->m_next;

	if (node != anchor)
	{
		while (node != anchor)
		{
			BfmePlayerValue *entry = node->m_value;
			if (entry->m_objectID != 0)
			{
                _STL::hash_map<int, BfmeObject*, _STL::hash<int>, _STL::equal_to<int> >::iterator found = TheBfmeGameLogic->m_objectHash.find(entry->m_objectID);
                if (found != TheBfmeGameLogic->m_objectHash.end())
                {
                    BfmeObject *object = found->second;
					if (object != NULL && (object->m_status & 8) == 0)
					{
						if (*entry->m_key == value)
						{
							UnsignedInt count = entry->m_valuesBegin.size();
							if (valueIndex < count)
								result = entry->m_valuesBegin[valueIndex];
							++valueIndex;
						}
					}
				}
			}
			node = node->m_next;
		}
	}

	result *= g_bfmeScaleBC;
	result = g_bfmeK1253 - result;
	return rva0058B590FloatToLong((float)floor((double)result));
}
