// ?copyClearMask@AttributeModifierDefinitionStore@@QBE?AV?$BitFlags@$0BEA@@@H@Z
// partial score=0.568 date=2026-10-13
// cl: /DNDEBUG /DWIN32 /MD /EHsc /D_STLP_USE_STATIC_LIB /D_STLP_NO_EXCEPTIONS /I. /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/GameEngine/Include /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Libraries/Include
// stlport
#include "Lib/BaseType.h"
#include "Common/BitFlags.h"
#include <vector>
typedef BitFlags<320> BfmeBlobJD;

class BfmeEntryJD
{
public:
	unsigned char m_bfmeHeadJD[0x44];
	BfmeBlobJD m_bfmeBlobJD;
};

class AttributeModifierDefinitionStore
{
public:
	BitFlags<320> copyClearMask(int index) const;

	unsigned char m_bfmeHeadJD[8];
	std::vector<BfmeEntryJD *> m_definitions;
};

BitFlags<320> AttributeModifierDefinitionStore::copyClearMask(int index) const
{
	BfmeBlobJD zero;

	zero.clear();

	if (index >= 0)
	{
		unsigned int last = m_definitions.size() - 1;

		if ((unsigned int)index <= (unsigned int)last)
		{
			BfmeEntryJD *e = m_definitions[index];

			if (e != 0)
			{
				return e->m_bfmeBlobJD;
			}
		}
	}

	return zero;
}
