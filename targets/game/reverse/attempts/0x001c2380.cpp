// ?rva001c2380Distance@Object@@QBEMPBUCoord3D@@PBV1@0@Z
// partial score=0.9821 date=2026-10-11
// cl: /O2 /Ob2 /G6 /Igame/Libraries/Source/WWVegas/WWLib /Igame/Libraries/Source/WWVegas/WWMath /Igame/Libraries/Source/WWVegas/WWDebug

#include "../../../../game/Libraries/Source/WWVegas/WWMath/matrix3d.h"

typedef int Int;
typedef float Real;

extern "C" double __cdecl sqrt(double value);
extern "C" double __cdecl fabs(double value);
#pragma intrinsic(sqrt)
#pragma intrinsic(fabs)

extern const Real BfmeZeroRange;

#include "../../../../game/Libraries/Include/Lib/Coord3D.h"

struct Direction2
{
	Real x;
	Real y;
};

struct BfmeGeometryPiece
{
	Int m_type;
	Real m_height;
	Real m_majorRadius;
	Real m_minorRadius;
	Coord3D m_localCenter;
	unsigned char m_pad01c[4];
	bool m_active;
	unsigned char m_pad021[3];

	void transformCenter(Coord3D *position, Real angle) const;
};

class BfmeGeometryInfo
{
public:
	const BfmeGeometryPiece *pieceAt(Int index) const;

private:
	unsigned char m_pad000[0x10];
	Real m_boundingCircleRadius;
	unsigned char m_pad014[0x2c - 0x14];
	BfmeGeometryPiece *m_begin;
	BfmeGeometryPiece *m_end;

	friend class Object;
};

class Object
{
public:
	Real rva001c2380Distance(const Coord3D *position,
		const Object *other, const Coord3D *otherPosition) const;

private:
	unsigned char m_pad000[0x08];
	Matrix3D m_transform;
	Coord3D m_position;
	Real m_orientation;
	unsigned char m_pad048[0xac - 0x48];
	BfmeGeometryInfo m_geometry;
};

// ?rva001c2380Distance@Object@@QBEMPBUCoord3D@@PBV1@0@Z present-unmatched
Real Object::rva001c2380Distance(const Coord3D *position,
	const Object *other, const Coord3D *otherPosition) const
{
	const BfmeGeometryInfo *geometry = &m_geometry;
	Real closestDistance = 9999999.0f;
	bool found = false;

	for (Int i = 0; i < geometry->m_end - geometry->m_begin; ++i)
	{
		const BfmeGeometryPiece *piece = geometry->pieceAt(i);
		if (!piece->m_active)
			continue;

		Real distanceSquared;
		Real radius;
		Coord3D center;
		center.x = position->x;
		center.y = position->y;
		center.z = position->z;
		piece->transformCenter(&center, m_orientation);

		Vector3 delta;
		delta.X = otherPosition->x - center.x;
		delta.Y = otherPosition->y - center.y;
		delta.Z = 0.0f;
		Vector3 direction(delta);
		Real projectedX = (Real)fabs(Vector3::Dot_Product(
			m_transform.Get_X_Vector(),
			delta));
		Real projectedY = (Real)fabs(Vector3::Dot_Product(
			m_transform.Get_Y_Vector(),
			delta));

		if (projectedX < piece->m_majorRadius &&
			projectedY < piece->m_minorRadius)
		{
			return BfmeZeroRange;
		}
		else if (projectedX < piece->m_majorRadius)
		{
			radius = piece->m_minorRadius;
			distanceSquared = projectedY * projectedY;
		}
		else if (projectedY < piece->m_minorRadius)
		{
			radius = piece->m_majorRadius;
			distanceSquared = projectedX * projectedX;
		}
		else
		{
			Real directionLengthSquared = delta.Length2();
			if (directionLengthSquared != BfmeZeroRange)
			{
				Real inverseDistance = WWMath::Inv_Sqrt(directionLengthSquared);
				direction *= inverseDistance;
			}

			Real majorRadius = piece->m_majorRadius;
			Vector3 majorAxis = m_transform.Get_X_Vector() * majorRadius;
			Real minorRadius = piece->m_minorRadius;
			Vector3 minorAxis = m_transform.Get_Y_Vector() * minorRadius;
			Real majorProjection =
				(Real)fabs(Vector3::Dot_Product(majorAxis,
					direction));
			Real minorProjection =
				(Real)fabs(Vector3::Dot_Product(minorAxis,
					direction));
			radius = majorProjection + minorProjection;
			distanceSquared = delta.X * delta.X + delta.Y * delta.Y;
		}

		Real distance = (Real)sqrt(distanceSquared);
		distance -= radius + other->m_geometry.m_boundingCircleRadius;
		if (found)
		{
			if (distance < closestDistance)
				closestDistance = distance;
		}
		else
		{
			closestDistance = distance;
			found = true;
		}
	}

	if (closestDistance <= 0.0f)
		return 0.0f;
	return closestDistance * closestDistance;
}
