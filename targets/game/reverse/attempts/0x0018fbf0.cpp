// ?bfmeClipSegment6DF730@BfmePolygon6DF1F0@@QBEDPBUBfmeCoord6DF1F0@@0PAU2@H@Z
// partial score=0.898 date=2026-10-13
// cl: /O2 /G6 /DNDEBUG /MD /EHsc- /Igame/Libraries/Source/WWVegas/WWMath
#include "coord3d.h"
#include <math.h>

// The caller and PolygonTrigger neighbor witness this address-derived ABI.
// The shared Coord3D declaration supplies the normalize receiver layout.
struct BfmeCoord6DF1F0 {
    float x, y, z;
    // ?add@BfmeCoord6DF1F0@@QAEXPBU1@@Z absent-from-retail
    void add(const BfmeCoord6DF1F0 *a) { x += a->x; y += a->y; z += a->z; }
    // ?set@BfmeCoord6DF1F0@@QAEXMMM@Z absent-from-retail
    void set(float ax, float ay, float az) { x = ax; y = ay; z = az; }
};
struct ClipPoint0018FBF0 { int x, y, z; };
struct ClipPair0018FBF0 { float x, y; };

extern "C" void __cdecl __identifier("?j_00033b90@@YAXXZ")();
// ?IntersectLine2D0018FBF0@@YA_NPBVCoord2D@@000PAV1@@Z absent-from-retail
static __forceinline bool IntersectLine2D0018FBF0(const Coord2D *a, const Coord2D *b, const Coord2D *c, const Coord2D *d, Coord2D *result)
{
    return ((bool (__cdecl *)(const Coord2D *, const Coord2D *, const Coord2D *, const Coord2D *, Coord2D *))&__identifier("?j_00033b90@@YAXXZ"))(a, b, c, d, result);
}

// The visible helper preserves the caller's native register contract.
// Inline linkage keeps its existing translation unit as the strong owner.
__declspec(noinline) inline void Coord3D::normalize()
{
    float len = (float)sqrt(x*x + y*y + z*z);
    if (len != 0.0f) {
        float scale = 1.0f / len;
        x *= scale; y *= scale; z *= scale;
    }
}

class BfmePolygon6DF1F0 {
    char m_unmodelled00[0x10];
    ClipPoint0018FBF0 *m_points;
    int m_numPoints;
public:
    char bfmeContains6DF1F0(const BfmeCoord6DF1F0 &) const;
    char bfmeClipSegment6DF730(const BfmeCoord6DF1F0 *from,
        const BfmeCoord6DF1F0 *to, BfmeCoord6DF1F0 *clipped, int flags) const;
};

extern "C" void __cdecl __identifier("?j_0000a7db@@YAXXZ")();
// ?bfmeContains6DF1F0@BfmePolygon6DF1F0@@QBEDABUBfmeCoord6DF1F0@@@Z absent-from-retail
inline char BfmePolygon6DF1F0::bfmeContains6DF1F0(const BfmeCoord6DF1F0 &point) const
{
    union { void (__cdecl *symbol)(); char (BfmePolygon6DF1F0::*member)(const BfmeCoord6DF1F0 &) const; } contains;
    contains.symbol = &__identifier("?j_0000a7db@@YAXXZ");
    return (this->*contains.member)(point);
}

// ?bfmeClipSegment6DF730@BfmePolygon6DF1F0@@QBEDPBUBfmeCoord6DF1F0@@0PAU2@H@Z present-unmatched
char BfmePolygon6DF1F0::bfmeClipSegment6DF730(const BfmeCoord6DF1F0 *from,
    const BfmeCoord6DF1F0 *to, BfmeCoord6DF1F0 *clipped, int flags) const
{
    ClipPair0018FBF0 end, start, delta;
    start.x = from->x;
    start.y = from->y;
    end.x = to->x;
    end.y = to->y;
    delta.x = end.x - start.x;
    delta.y = end.y - start.y;
    if (bfmeContains6DF1F0(*to)) { *clipped = *to; return 1; }
    if (!bfmeContains6DF1F0(*from)) { *clipped = *from; return 0; }
    for (int i = 0; i < m_numPoints; ++i) {
        ClipPoint0018FBF0 pt1 = m_points[i];
        ClipPoint0018FBF0 pt2 = (i ? m_points[i-1] : m_points[m_numPoints-1]);
        ClipPair0018FBF0 a = {(float)pt1.x, (float)pt1.y};
        ClipPair0018FBF0 b = {(float)pt2.x, (float)pt2.y};
        ClipPair0018FBF0 intersection;
        if (IntersectLine2D0018FBF0((Coord2D*)&a, (Coord2D*)&b, (Coord2D*)&start, (Coord2D*)&end, (Coord2D*)&intersection)) {
            float side = (from->y - pt1.y)*(pt2.x - pt1.x) - (from->x - pt1.x)*(pt2.y - pt1.y);
            ClipPair0018FBF0 normal = {(float)(pt2.y-pt1.y), (float)(pt1.x-pt2.x)};
            float len = sqrt(normal.x*normal.x + normal.y*normal.y);
            if (len != 0.0f) { normal.x /= len; normal.y /= len; }
            if (side > 0.0f) { normal.x *= -1.0f; normal.y *= -1.0f; }
            normal.x *= 0.1f; normal.y *= 0.1f;
            BfmeCoord6DF1F0 result; result.set(intersection.x, intersection.y, 0.0f);
            BfmeCoord6DF1F0 offset = {normal.x, normal.y, 0.0f}; result.add(&offset);
            if (!bfmeContains6DF1F0(result)) { *clipped = *from; return 0; }
            if ((char)flags) {
                BfmeCoord6DF1F0 slide = {(float)pt2.x, (float)pt2.y, 0.0f}; BfmeCoord6DF1F0 p1 = {(float)pt1.x, (float)pt1.y, 0.0f}; slide.x -= p1.x; slide.y -= p1.y;
                if (delta.x*slide.x + delta.y*slide.y < 0.0f) { slide.x *= -1.0f; slide.y *= -1.0f; slide.z *= -1.0f; }
                BfmeCoord6DF1F0 moved = {result.x-from->x, result.y-from->y, -from->z};
                float remaining = sqrt(delta.x*delta.x + delta.y*delta.y) - sqrt(moved.x*moved.x + moved.y*moved.y + moved.z*moved.z);
                if (remaining > 0.1f) {
                    remaining *= 0.4f;
                    ((Coord3D*)&slide)->normalize();
                    slide.x *= remaining; slide.y *= remaining; slide.z *= remaining;
                    BfmeCoord6DF1F0 next = {result.x + slide.x, result.y + slide.y, slide.z};
                    if (bfmeContains6DF1F0(next)) { result = next; goto success0018FBF0; }
                }
            }
            success0018FBF0: *clipped = result; return 1;
        }
    }
    return 0;
}
