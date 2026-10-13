// ?step006E0080@Rva006E0080Owner@@QAEXPAUCoord3D@@0PAURva006E0080Context@@@Z
// partial score=0.9412 date=2026-10-13
// cl: /DNDEBUG /MD /EHsc /Igame/Libraries/Source/WWVegas/WWDebug /Igame/Libraries/Source/WWVegas/WWMath /Igame/Libraries/Source/WWVegas/WWLib
// stlport

typedef int Int;
typedef float Real;
typedef bool Bool;

#define TRUE true
#define FALSE false

#include "../../../../game/Libraries/Source/WWVegas/WWLib/ascii_string.h"

// upstream layout: inputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Libraries/Include/Lib/BaseType.h
#include "../../../../game/Libraries/Include/Lib/Coord3D.h"
#include <new>
#define _OPERATOR_NEW_DEFINED_
#include "../../../../game/Libraries/Source/WWVegas/WWMath/vector3.h"
// ?copy006E0080@@YAXPAUCoord3D@@PBU1@@Z absent-from-retail
static inline void copy006E0080(Coord3D *out, const Coord3D *in) { out->x = in->x; out->y = in->y; out->z = in->z; }

// upstream layout: inputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Libraries/Include/Lib/BaseType.h
// ?copy006E0080@@YAXPAVVector3@@PBUCoord3D@@@Z absent-from-retail
static inline void copy006E0080(Vector3 *out, const Coord3D *in) { out->X = in->x; out->Y = in->y; out->Z = in->z; }

struct ICoord2D
{
	Int x, y;
};

// upstream layout: inputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/GameEngine/Include/Common/Thing.h
class Object
{
public:
	const Coord3D *getPosition() const { return &m_cachedPos; }

private:
	char m_unmodelled_00[0x38];
	Coord3D m_cachedPos;								///< Thing+0x38
};

#define BFME_GAMELOGIC_LOOKUP_VISIBLE
#include "../../../../game/GameEngine/Source/Common/Thing/GameLogicObjectLookup.h"

extern GameLogic *TheGameLogic;

class View
{
public:
#define BFME_VIEW_SLOT( n ) virtual void slot##n() = 0;
	BFME_VIEW_SLOT( 00 ) BFME_VIEW_SLOT( 01 ) BFME_VIEW_SLOT( 02 ) BFME_VIEW_SLOT( 03 )
	BFME_VIEW_SLOT( 04 ) BFME_VIEW_SLOT( 05 ) BFME_VIEW_SLOT( 06 ) BFME_VIEW_SLOT( 07 )
	BFME_VIEW_SLOT( 08 ) BFME_VIEW_SLOT( 09 ) BFME_VIEW_SLOT( 10 ) BFME_VIEW_SLOT( 11 )
	BFME_VIEW_SLOT( 12 ) BFME_VIEW_SLOT( 13 ) BFME_VIEW_SLOT( 14 ) BFME_VIEW_SLOT( 15 )
	BFME_VIEW_SLOT( 16 ) BFME_VIEW_SLOT( 17 ) BFME_VIEW_SLOT( 18 ) BFME_VIEW_SLOT( 19 )
	BFME_VIEW_SLOT( 20 ) BFME_VIEW_SLOT( 21 ) BFME_VIEW_SLOT( 22 ) BFME_VIEW_SLOT( 23 )
	BFME_VIEW_SLOT( 24 ) BFME_VIEW_SLOT( 25 ) BFME_VIEW_SLOT( 26 ) BFME_VIEW_SLOT( 27 )
	BFME_VIEW_SLOT( 28 ) BFME_VIEW_SLOT( 29 ) BFME_VIEW_SLOT( 30 ) BFME_VIEW_SLOT( 31 )
	BFME_VIEW_SLOT( 32 ) BFME_VIEW_SLOT( 33 ) BFME_VIEW_SLOT( 34 ) BFME_VIEW_SLOT( 35 )
	BFME_VIEW_SLOT( 36 ) BFME_VIEW_SLOT( 37 ) BFME_VIEW_SLOT( 38 ) BFME_VIEW_SLOT( 39 )
	BFME_VIEW_SLOT( 40 ) BFME_VIEW_SLOT( 41 ) BFME_VIEW_SLOT( 42 ) BFME_VIEW_SLOT( 43 )
	BFME_VIEW_SLOT( 44 ) BFME_VIEW_SLOT( 45 ) BFME_VIEW_SLOT( 46 ) BFME_VIEW_SLOT( 47 )
	BFME_VIEW_SLOT( 48 ) BFME_VIEW_SLOT( 49 ) BFME_VIEW_SLOT( 50 ) BFME_VIEW_SLOT( 51 )
	BFME_VIEW_SLOT( 52 ) BFME_VIEW_SLOT( 53 ) BFME_VIEW_SLOT( 54 ) BFME_VIEW_SLOT( 55 )
	BFME_VIEW_SLOT( 56 ) BFME_VIEW_SLOT( 57 ) BFME_VIEW_SLOT( 58 ) BFME_VIEW_SLOT( 59 )
	BFME_VIEW_SLOT( 60 ) BFME_VIEW_SLOT( 61 ) BFME_VIEW_SLOT( 62 ) BFME_VIEW_SLOT( 63 )
	BFME_VIEW_SLOT( 64 ) BFME_VIEW_SLOT( 65 ) BFME_VIEW_SLOT( 66 ) BFME_VIEW_SLOT( 67 )
	BFME_VIEW_SLOT( 68 ) BFME_VIEW_SLOT( 69 ) BFME_VIEW_SLOT( 70 ) BFME_VIEW_SLOT( 71 )
	BFME_VIEW_SLOT( 72 ) BFME_VIEW_SLOT( 73 ) BFME_VIEW_SLOT( 74 ) BFME_VIEW_SLOT( 75 )
	BFME_VIEW_SLOT( 76 ) BFME_VIEW_SLOT( 77 ) BFME_VIEW_SLOT( 78 ) BFME_VIEW_SLOT( 79 )
	BFME_VIEW_SLOT( 80 ) BFME_VIEW_SLOT( 81 ) BFME_VIEW_SLOT( 82 ) BFME_VIEW_SLOT( 83 )
	BFME_VIEW_SLOT( 84 ) BFME_VIEW_SLOT( 85 ) BFME_VIEW_SLOT( 86 ) BFME_VIEW_SLOT( 87 )
	BFME_VIEW_SLOT( 88 )
#undef BFME_VIEW_SLOT
	virtual Bool screenToTerrain( const ICoord2D *pixel, Coord3D *world, Bool clamp ) = 0;	///< +0x164
};

extern View *TheTacticalView;

// ABI and scheduling evidence: targets/game/reverse/identity_evidence/0x006e0080-lookup-visibility.md
// The context record the caller passes; only the fields read here are modelled.
struct Rva006E0080Context
{
	char m_unmodelled_00[0x9C];
	Bool m_flag9C;										///< +0x9C
	char m_unmodelled_9D[0x07];
	Int m_objectIDA4;									///< +0xA4
	char m_unmodelled_A8[0x0C];
	Int m_fieldB4;										///< +0xB4
	Int m_fieldB8;										///< +0xB8
	Int m_widthBC;										///< +0xBC
	Int m_heightC0;										///< +0xC0
};

class Rva006E0080Owner
{
public:
	void step006E0080( Coord3D *pos, Coord3D *target, Rva006E0080Context *context );

private:
	char m_unmodelled_00[0x2C];
	Int m_state2C;										///< +0x2C
	Coord3D m_target30;									///< +0x30
	Coord3D m_pos3C;									///< +0x3C
};

static AsciiString s_mode012F8044;						///< retail [0x012F8044]
static Real s_blend012F8030;							///< retail [0x012F8030]
static Real s_blend012F8034;							///< retail [0x012F8034]
static Real s_blend012F8038;							///< retail [0x012F8038]
static Real s_blend012F803C;							///< retail [0x012F803C]
static Real s_limit012BA8B0 = 0.5f;						///< retail [0x012BA8B0]
static Real s_step012BA8B4 = 0.05f;						///< retail [0x012BA8B4]
static Real s_limit012BA8B8 = 0.4f;						///< retail [0x012BA8B8]
static Real s_step012BA8BC = 0.03f;						///< retail [0x012BA8BC]

// ?step006E0080@Rva006E0080Owner@@QAEXPAUCoord3D@@0PAURva006E0080Context@@@Z
void Rva006E0080Owner::step006E0080( Coord3D *pos, Coord3D *target, Rva006E0080Context *context )
{
	// Native empty constructors reproduce the guarded twelve-byte storage; original static types are unproven.
	static Vector3 s_savedPos012F8020;					///< retail [0x012F8020]
	static Vector3 s_unused;

	Int requested = -1;
	if( s_mode012F8044.compare( "Target" ) == 0 )
		requested = 2;
	else if( s_mode012F8044.compare( "Zoom" ) == 0 )
		requested = 3;

	if( TheGameLogic->findObjectByID( context->m_objectIDA4 ) == 0 )
	{
		s_blend012F803C = 0;
		s_blend012F8038 = 0;
		s_blend012F8034 = 0;
		s_blend012F8030 = 0;
		m_state2C = 0;
	}

	if( !context->m_flag9C )
	{
		copy006E0080(&m_target30, target);
		copy006E0080(&m_pos3C, pos);
	}

	switch( m_state2C )
	{
		case 0:
			if( !context->m_flag9C )
				break;
			m_state2C = 3;
			if( requested == 3 )
			{
				copy006E0080(&s_savedPos012F8020, &m_pos3C);
				context->m_fieldB4 = 0x10;
				context->m_fieldB8 = 2;
			}
			break;

		case 1:
			if( context->m_flag9C )
				break;
			m_state2C = 4;
			break;

		case 2:
		{
			s_blend012F803C += s_blend012F8038;
			if( s_blend012F8038 < s_limit012BA8B8 )
				s_blend012F8038 = s_step012BA8BC + s_blend012F8038;

			Object *obj = TheGameLogic->findObjectByID( context->m_objectIDA4 );
			Coord3D objPos;
			objPos.x = obj->getPosition()->x;
			objPos.y = obj->getPosition()->y;
			objPos.z = obj->getPosition()->z;
			target->x = (objPos.x - m_target30.x) * s_blend012F803C + m_target30.x;
			target->y = (objPos.y - m_target30.y) * s_blend012F803C + m_target30.y;
			target->z = (objPos.z - m_target30.z) * s_blend012F803C + m_target30.z;
			copy006E0080(pos, &m_pos3C);

			if( s_blend012F803C >= 1.0f )
			{
				m_state2C = 3;
				copy006E0080(&s_savedPos012F8020, &m_pos3C);
				s_blend012F803C = 0;
				s_blend012F8038 = 0;
				if( requested == m_state2C )
				{
					context->m_fieldB4 = 0x10;
					context->m_fieldB8 = 2;
				}
			}
			break;
		}

		case 3:
		{
			s_blend012F8034 += s_blend012F8030;
			if( s_blend012F8030 < s_limit012BA8B0 )
				s_blend012F8030 = s_step012BA8B4 + s_blend012F8030;
			if( s_blend012F8034 < 0.9f )
			{
				Object *obj = TheGameLogic->findObjectByID( context->m_objectIDA4 );
				Coord3D objPos;
				objPos.x = obj->getPosition()->x;
				objPos.y = obj->getPosition()->y;
				objPos.z = obj->getPosition()->z;
				ICoord2D center;
				center.x = context->m_widthBC / 2;
				center.y = context->m_heightC0 / 2;
				Coord3D world;
				TheTacticalView->screenToTerrain( &center, &world, FALSE );

				target->x = (objPos.x - m_target30.x) * s_blend012F8034 + m_target30.x;
				target->y = (objPos.y - m_target30.y) * s_blend012F8034 + m_target30.y;
				target->z = (objPos.z - m_target30.z) * s_blend012F8034 + m_target30.z;
				pos->x = (m_target30.x - s_savedPos012F8020.X) * s_blend012F8034 + s_savedPos012F8020.X;
				pos->y = (m_target30.y - s_savedPos012F8020.Y) * s_blend012F8034 + s_savedPos012F8020.Y;
				pos->z = (m_target30.z - s_savedPos012F8020.Z) * s_blend012F8034 + s_savedPos012F8020.Z;
			}
			else
			{
				m_state2C = 1;
				context->m_fieldB4 = 0;
				context->m_fieldB8 = 0;
				s_blend012F8034 = 0;
				s_blend012F8030 = 0;
			}
			break;
		}

		case 4:
			m_state2C = 0;
			break;
	}
}
