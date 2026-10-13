// cl: /DNDEBUG /DWIN32 /D_WINDOWS /MD /EHsc /D_STLP_USE_STATIC_LIB /D_STLP_NO_EXCEPTIONS /Igame/Libraries/Source/WWVegas/WWLib /Iinputs/reference/shims/sweep
// stlport

#include <vector>
#include "string_base.h"

extern "C" __declspec(dllimport) int __cdecl _memicmp( const void *left,
	const void *right, unsigned int count );

// upstream layout: inputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/GameEngine/Include/Common/AsciiString.h
class AsciiString
{
public:
	AsciiString( const char *text )
	{
		((StringBase<char> *)this)->StringBase<char>::StringBase( text );
	}

	AsciiString( const AsciiString &that )
	{
		((StringBase<char> *)this)->StringBase<char>::StringBase(
			*(const StringBase<char> *)&that );
	}

	~AsciiString()
	{
		((StringBase<char> *)this)->releaseBuffer();
	}

private:
	struct Header
	{
		int m_refCount;
		unsigned short m_length;
		unsigned short m_capacity;
	};

	Header *m_data;
};

// Retail StringBase<char>::compareNoCase shape (_memicmp over the shared
// prefix, then the length difference), spelled as the explicit specialization
// so this TU emits no AsciiString::compareNoCase COMDAT of its own. Same
// spelling as game/Libraries/Source/WWVegas/WWLib/RvaTreeInsertUniqueNoCase.cpp.
template <>
inline int StringBase<char>::compareNoCase( const StringBase<char> &str ) const
{
	int thatLen = str.m_data ? str.m_data->length : 0;
	const char *thatData = str.m_data ? &str.m_data->data[ 0 ] : (const char *)"";
	int thisLen = m_data ? m_data->length : 0;
	const char *thisData = m_data ? &m_data->data[ 0 ] : (const char *)"";
	int n = thisLen < thatLen ? thisLen : thatLen;
	int c = _memicmp( thisData, thatData, n );
	if( c != 0 )
	{
		return c;
	}
	return thisLen - thatLen;
}

struct FactionVictoryParameters
{
	FactionVictoryParameters( const AsciiString &name ) :
		m_name( name ),
		m_allyDeathScaleFactor( 0.0f ),
		m_enemyKillScaleFactor( 0.0f ),
		m_mapToCellVictoryRatio( 0.0f ),
		m_victoryThreshold( 0.0f ),
		m_majorUnitValue( 0.0f )
	{
	}

	AsciiString m_name;
	float m_allyDeathScaleFactor;
	float m_enemyKillScaleFactor;
	float m_mapToCellVictoryRatio;
	float m_victoryThreshold;
	float m_majorUnitValue;
};

class VictorySystem
{
public:
	virtual void init( void );
	FactionVictoryParameters *_bfme_findOrCreateFactionVictoryParameters(
		const AsciiString &name );

private:
	unsigned int _bfme_findFactionVictoryParametersIndex( const AsciiString &name );

	char m_opaque[0xe8];
	_STL::vector<FactionVictoryParameters> m_factionVictoryParameters;
};

void VictorySystem::init( void )
{
	FactionVictoryParameters parameters( AsciiString( "Default" ) );
	parameters.m_allyDeathScaleFactor = 1.0f;
	parameters.m_enemyKillScaleFactor = 1.0f;
	parameters.m_majorUnitValue = 10.0f;
	parameters.m_victoryThreshold = 500.0f;
	parameters.m_mapToCellVictoryRatio = 1.0f;
	m_factionVictoryParameters.push_back( parameters );
}

FactionVictoryParameters *VictorySystem::_bfme_findOrCreateFactionVictoryParameters(
	const AsciiString &name )
{
	unsigned int index = _bfme_findFactionVictoryParametersIndex( name );
	if( index != 0x7fffffff )
	{
		return &m_factionVictoryParameters[index];
	}

	{
		FactionVictoryParameters parameters( name );
		m_factionVictoryParameters.push_back( parameters );
	}
	return &m_factionVictoryParameters.back();
}

unsigned int VictorySystem::_bfme_findFactionVictoryParametersIndex(
	const AsciiString &name )
{
	bool found = false;
	unsigned int result = 0x7fffffff;
	for( unsigned int index = 0;
		index < m_factionVictoryParameters.size() && !found;
		++index )
	{
		if( ( (const StringBase<char> *)&m_factionVictoryParameters[index].m_name )->compareNoCase( *(const StringBase<char> *)&name ) == 0 )
		{
			result = index;
			found = true;
		}
	}
	return result;
}
