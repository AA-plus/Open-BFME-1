// cl: /O2 /Ob0 /MD /DNDEBUG /Igame/Libraries/Source/WWVegas/WWLib /Igame/Libraries/Source/WWVegas/WWMath
#include "simplevec.h"
#include "vector3.h"
#include "vector4.h"
#include "seglinerenderer.h"

// Keep Add in its retail provider (part_buf.cpp, RVA 00701FB0). This TU's
// /Ob0 copies of Add and its Grow dependency are not the retail bodies.
template<> bool SimpleDynVecClass<Vector3>::Add(const Vector3 &, int);

// BFME's RenderObjClass base places PointLocations at +0xd4, unlike Zero Hour.
class StreakLineClass
{
	unsigned char m_beforePoints[0xd4];
	SimpleDynVecClass<Vector3> PointLocations;
	SimpleDynVecClass<Vector4> PointColors;
	SimpleDynVecClass<float> PointWidths;
	SegLineRendererClass LineRenderer;

public:
	void Add_Point(const Vector3 &location);
	void Set_Freeze_Random(int enabled);
	void Set_Disable_Sorting(int enabled);
	void Set_End_Caps(int enabled);
};

void StreakLineClass::Add_Point(const Vector3 &location)
{
	PointLocations.Add(location);
}


void StreakLineClass::Set_Freeze_Random(int enabled)
{
	unsigned &bits = *reinterpret_cast<unsigned *>(reinterpret_cast<char *>(&LineRenderer) + 0x44);
	if (enabled) bits |= 2;
	else bits &= ~2u;
}

void StreakLineClass::Set_Disable_Sorting(int enabled)
{
	unsigned &bits = *reinterpret_cast<unsigned *>(reinterpret_cast<char *>(&LineRenderer) + 0x44);
	if (enabled) bits |= 4;
	else bits &= ~4u;
}

void StreakLineClass::Set_End_Caps(int enabled)
{
	unsigned &bits = *reinterpret_cast<unsigned *>(reinterpret_cast<char *>(&LineRenderer) + 0x44);
	if (enabled) bits |= 8;
	else bits &= ~8u;
}
