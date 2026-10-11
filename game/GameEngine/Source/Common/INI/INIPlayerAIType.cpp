// cl: /DNDEBUG /MD /EHsc /D_STLP_USE_STATIC_LIB /Igame/Libraries/Source/WWVegas/WWLib
// stlport

// FILE: INIPlayerAIType.cpp //////////////////////////////////////////////////
//
// The PlayerAIType block, BFME-only, named by the INI block table in .data.
// Two bodies live here. parsePlayerAIType is the seventeen-byte INI hook that
// hands the INI straight to the subsystem; parseBlock is the member that hook
// reaches through the ILT thunk at 0x0003EBD5.
//
// PlayerAITypeSet is a real name - game_engine_subsystems.h already carries the
// class and its initSubsystem<PlayerAITypeSet> registration, and the singleton
// this body loads is 0x012ED740.
//
// parseBlock is 0x000DEEC0, 578 bytes. Its only caller is parsePlayerAIType
// below; see targets/game/reverse/identity_evidence/012ed740-pointer-global.md.
// The record layout follows the decoded LibraryMap constructor (0x000DE860),
// its copy, and PlayerAITypeSet::find (0x000DE1B0): BfmePlayerAITypeSet is a
// second view of the same receiver, with its vector of records at +0x08.
//
// The record is spelled BfmeLibraryMap here, not LibraryMap. Retail links this
// 16-byte record against instantiations that already carry other real names at
// the same ILT thunks, so no ILT slot names a LibraryMap copy constructor,
// reserve, destructor or _M_insert_overflow; tools/ilt_guard.py refuses a new
// real name there. Bfme* is this tree's honest stand-in tier. The record is
// retail's LibraryMap (constructor 0x000DE860, static parse 0x000DE770), and
// the spelling only renames the template arguments of the shared STLport
// instantiations, never their bodies.
//
// The grow path calls the already-matched BfmeVecERE::bfmeResizeERE at
// 0x000DEDD0 through a 16-byte stand-in element; BfmeItemERE here is that size
// view, not a claim about the class BfmeConv1950.cpp defines.
//
// Rva000DEEC0AtCapacity is absent from retail: it is the inline spelling that
// reproduces the target's guard, kept under an address-derived name because no
// evidence gives it a retail identity.
//
///////////////////////////////////////////////////////////////////////////////

#define _STLP_NO_EXCEPTIONS 1

#include <vector>

#include "ascii_string.h"

class INI;

class BfmeLibraryMap
{
public:
	BfmeLibraryMap() {}
	BfmeLibraryMap(INI *ini);
	BfmeLibraryMap(const BfmeLibraryMap &other);

	void swap(BfmeLibraryMap &other)
	{
		m_name.swap(other.m_name);
		m_libraryMaps.swap(other.m_libraryMaps);
	}

	AsciiString m_name;
	std::vector<AsciiString> m_libraryMaps;
};

struct BfmeItemERE
{
	BfmeItemERE() {}
	AsciiString m_bfmeNameERE;
	std::vector<AsciiString> m_bfmeSubERE;
};

class BfmeVecERE
{
public:
	void bfmeResizeERE(unsigned int count, BfmeItemERE value);
};

class PlayerAITypeSet
{
public:
	int find(AsciiString *name);
};

class BfmePlayerAITypeSet
{
public:
	void parseBlock(INI *ini);

	void *m_at00;
	AsciiString m_at04;
	std::vector<BfmeLibraryMap> m_types;
};

extern PlayerAITypeSet *ThePlayerAITypeSet;		// 0x012ED740

// ?Rva000DEEC0AtCapacity@@YA_NII@Z absent-from-retail
static inline bool Rva000DEEC0AtCapacity(unsigned int size, unsigned int capacity)
{
	return size >= capacity;
}

// ?parseBlock@BfmePlayerAITypeSet@@QAEXPAVINI@@@Z
void BfmePlayerAITypeSet::parseBlock(INI *ini)
{
	BfmeLibraryMap parsed(ini);
	int index = ((PlayerAITypeSet *)this)->find(&parsed.m_name);
	if (index == -1)
	{
		if (Rva000DEEC0AtCapacity(m_types.size(), m_types.capacity()))
		{
			std::vector<BfmeLibraryMap> grown;
			grown.reserve(m_types.size() + m_types.size() / 2 + 8);
			unsigned int oldSize = m_types.size();
			((BfmeVecERE *)&grown)->bfmeResizeERE(oldSize, BfmeItemERE());
			std::vector<BfmeLibraryMap>::iterator destination = grown.begin();
			std::vector<BfmeLibraryMap>::iterator end = m_types.end();
			for (std::vector<BfmeLibraryMap>::iterator source = m_types.begin(); source != end;
				++source, ++destination)
				destination->swap(*source);
			m_types.swap(grown);
		}
		index = m_types.size();
		m_types.push_back(BfmeLibraryMap());
	}
	m_types[index].swap(parsed);
}

// ?parsePlayerAIType@@YAXPAVINI@@@Z
void parsePlayerAIType(INI *ini)
{
	((BfmePlayerAITypeSet *)ThePlayerAITypeSet)->parseBlock(ini);
}