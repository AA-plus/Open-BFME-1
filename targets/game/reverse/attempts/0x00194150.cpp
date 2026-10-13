// ?getIndexedRecord@Rva00194150Table@@QBE_NHHAAVBuildListInfo@@H@Z
// partial score=0.1824 date=2026-10-13
// cl: /DNDEBUG /MD /EHsc /D_STLP_USE_STATIC_LIB /Iinputs/reference/shims/stringbaseascii /Iinputs/reference/shims/buildlistinfo /Iinputs/reference/shims/moduledata /Iinputs/reference/shims/sweep /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/GameEngine/Include /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/GameEngine/Source /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Libraries/Include /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Libraries/Source /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Libraries/Source/WWVegas /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Libraries/Source/WWVegas/WWLib /Igame/Libraries/Source/WWVegas/WWLib
// stlport
#include "PreRTS.h"
#include "GameLogic/SidesList.h"
#include <vector>
typedef char CheckBuildListSize[sizeof(BuildListInfo)==0x8C?1:-1];
struct Rva00194150Entry
{
	int m_key;
	std::vector<BuildListInfo> m_range0;
	std::vector<BuildListInfo> m_range1;
};

class Rva00194150Table
{
public:
	bool getIndexedRecord(int key, int index, BuildListInfo &dest, int side) const;

private:
	unsigned char m_prefix[0x66C];
	Rva00194150Entry m_entries[32];
};

bool Rva00194150Table::getIndexedRecord(int key, int index, BuildListInfo &dest, int side) const
{
	const int mode = side;
	if (mode != 0 && mode != 1)
		return false;

	const Rva00194150Entry *entry = m_entries;
	const int lookupKey = key;
	int i = 0;
	do
	{
		if (entry->m_key == lookupKey)
			goto found;
		++i;
		++entry;
	} while (i < 32);
	return false;

found:
	const std::vector<BuildListInfo> *range;
	if (mode == 0)
		range = &m_entries[i].m_range0;
	else if (mode == 1)
		range = &m_entries[i].m_range1;
	else
		return true;
	if (index >= (int)range->size())
		return false;
	dest = (*range)[index];
	return true;
}
