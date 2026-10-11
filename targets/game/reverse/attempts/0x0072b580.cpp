// ?fillVBRecursive@W3DTerrainBackground@@IAEXPAGPAUVertexFormatXYZDUV2@@HHH0AAH@Z
// partial score=0.5192 date=2026-10-11
// cl: /DNDEBUG /DWIN32 /D_WINDOWS /MD /EHs-c- /Igame/Libraries/Source/WWVegas/WWMath /Igame/Libraries/Source/WWVegas/WWLib
// ?fillVBRecursive@W3DTerrainBackground@@IAEXPAGPAUVertexFormatXYZDUV2@@HHH0AAH@Z
// The inherited opaque vb argument carries the intersection record buffer.
#include <vector3.h>

typedef unsigned short UnsignedShort;
struct ICoord2D { int x, y; };
struct VertexFormatXYZDUV2;
class Rva00729300BitPlane { public: bool test(int, int) const; };
class Rva00729370BitPlane { public: bool test(int, int) const; };
class Rva0074CDD0 { public: bool test(int, int); };
class Rva007497A0 { public: void setBit(int, int, bool); };
class Rva006BE030LookupWord { public: UnsignedShort lookup(int, int); };
class Rva00729570Terrain { public: bool advanceRight(ICoord2D &, int, int, int, int); };
class Rva00729D30Terrain
{
public:
    void rva0072B1C0(int, int, int, int, int, bool *, bool *, bool *, bool *, int, int);
};
class WorldHeightMap
{
public:
    UnsignedShort getHeight(int x, int y)
    {
        int index = m_width * y + x;
        if (index < 0 || index >= m_dataSize || m_data == 0) return 0;
        return m_data[index];
    }
    bool getFlipState(int x, int y) { return ((Rva00729300BitPlane *)this)->test(x, y); }
    int getXExtent() const { return m_width; }
    int getYExtent() const { return m_height; }
    unsigned char m_opaque00[8];
    int m_width, m_height, m_borderSize;
    unsigned char m_opaque14[12];
    int m_dataSize;
    UnsignedShort *m_data;
};
class W3DTerrainBackground
{
protected:
    void fillVBRecursive(UnsignedShort *ib, VertexFormatXYZDUV2 *vb, int xOffset, int yOffset,
        int width, UnsignedShort *ndx, int &curIndex);
    bool advanceLeft(ICoord2D &, int, int, int, int);
    bool advanceRight(ICoord2D &point, int xOffset, int yOffset, int width, int height)
    { return ((Rva00729570Terrain *)this)->advanceRight(point, xOffset, yOffset, width, height); }
public:
    void getTriangleIntersection(float *, int, int, int, int, const Vector3 *, const Vector3 *, const Vector3 *);
private:
    unsigned char m_opaque00[0x40];
    int m_xOrigin, m_yOrigin, m_width;
    WorldHeightMap *m_map;
    unsigned char m_opaque50[0x28];
    int current;
};

//=============================================================================
// W3DTerrainBackground::fillVBRecursive
//=============================================================================
/** Fills in vertex & index buffers.
*/
void W3DTerrainBackground::fillVBRecursive(UnsignedShort *ib, VertexFormatXYZDUV2 *vb,
    int xOffset, int yOffset, int width, UnsignedShort *ndx, int &curIndex)
{
    int *curIndexP = &curIndex;
    int minX, minY, localMaxX, localMaxY;
    int bottomLeftNdx, topRightNdx;
    bool match;
    for (;;) {
        int limitX = m_map->getXExtent() - 1;
        int limitY = m_map->getYExtent() - 1;
        minX = m_xOrigin + xOffset;
        int worldY = m_yOrigin + yOffset;
        volatile int localMinY = worldY;
        minY = worldY;
        match = true;
        localMaxX = xOffset + width;
        if (m_xOrigin + localMaxX > limitX) localMaxX = limitX - m_xOrigin;
        localMaxY = yOffset + width;
        if (m_yOrigin + localMaxY > limitY) localMaxY = limitY - m_yOrigin;
        bottomLeftNdx = ndx[xOffset + yOffset * (m_width + 1)];
        topRightNdx = ndx[localMaxX + localMaxY * (m_width + 1)];
        if (width > 1)
            match = !((Rva00729300BitPlane *)m_map)->test(m_xOrigin + width / 2 + xOffset, m_yOrigin + width / 2 + yOffset);
        if (match) {
            if (m_xOrigin + xOffset >= limitX || localMinY >= limitY) return;
        }
        if (width == current) goto special;
        if (match) goto terminal;
        bool flag0, flag1, flag2, flag3;
        int halfWidth = width / 2;
        ((Rva00729D30Terrain *)this)->rva0072B1C0((int)ib, (int)vb, xOffset, yOffset, width,
            &flag0, &flag1, &flag2, &flag3, (int)ndx, (int)curIndexP);
        if (flag2) fillVBRecursive(ib, vb, xOffset, yOffset, halfWidth, ndx, *curIndexP);
        if (flag0) fillVBRecursive(ib, vb, xOffset, yOffset + halfWidth, halfWidth, ndx, *curIndexP);
        if (flag3) fillVBRecursive(ib, vb, xOffset + halfWidth, yOffset, halfWidth, ndx, *curIndexP);
        if (!flag1) return;
        width = halfWidth;
        yOffset += halfWidth;
        xOffset += halfWidth;
    }
special:
    {
        if (!((Rva00729370BitPlane *)m_map)->test(minX, minY)) return;
        match = ((Rva0074CDD0 *)m_map)->test(minX, minY);
        ((Rva007497A0 *)m_map)->setBit(minX, minY, match);
        if (!match) {
            int bottomRightNdx = ndx[localMaxX + yOffset * (m_width + 1)];
            int topLeftNdx = ndx[xOffset + localMaxY * (m_width + 1)];
            if (ib) ib[*curIndexP] = (UnsignedShort)bottomLeftNdx;
            ++*curIndexP;
            if (ib) ib[*curIndexP] = (UnsignedShort)topRightNdx;
            ++*curIndexP;
            if (ib) ib[*curIndexP] = (UnsignedShort)topLeftNdx;
            ++*curIndexP;
            if (ib) ib[*curIndexP] = (UnsignedShort)bottomLeftNdx;
            ++*curIndexP;
            if (ib) ib[*curIndexP] = (UnsignedShort)bottomRightNdx;
            ++*curIndexP;
            if (ib) ib[*curIndexP] = (UnsignedShort)topRightNdx;
            ++*curIndexP;
            if (vb) {
                Vector3 first, second, third;
                float minScaledX = (float)minX * 10.0f;
                first.X = minScaledX - (float)m_map->m_borderSize * 10.0f;
                float minScaledY = (float)minY * 10.0f;
                first.Y = minScaledY - (float)m_map->m_borderSize * 10.0f;
                first.Z = (float)((Rva006BE030LookupWord *)m_map)->lookup(minX, minY) * 0.0390625f;
                float maxScaledX = (float)(minX + width) * 10.0f;
                second.X = maxScaledX - (float)m_map->m_borderSize * 10.0f;
                float maxScaledY = (float)(minY + width) * 10.0f;
                second.Y = maxScaledY - (float)m_map->m_borderSize * 10.0f;
                second.Z = (float)((Rva006BE030LookupWord *)m_map)->lookup(minX + width, minY + width) * 0.0390625f;
                third.X = minScaledX - (float)m_map->m_borderSize * 10.0f;
                third.Y = maxScaledY - (float)m_map->m_borderSize * 10.0f;
                third.Z = (float)((Rva006BE030LookupWord *)m_map)->lookup(minX, minY + width) * 0.0390625f;
                getTriangleIntersection((float *)vb, xOffset, yOffset, width, width, &first, &second, &third);
                second.X = maxScaledX - (float)m_map->m_borderSize * 10.0f;
                second.Y = minScaledY - (float)m_map->m_borderSize * 10.0f;
                second.Z = (float)((Rva006BE030LookupWord *)m_map)->lookup(minX + width, minY) * 0.0390625f;
                third.X = maxScaledX - (float)m_map->m_borderSize * 10.0f;
                third.Y = maxScaledY - (float)m_map->m_borderSize * 10.0f;
                third.Z = (float)((Rva006BE030LookupWord *)m_map)->lookup(minX + width, minY + width) * 0.0390625f;
                getTriangleIntersection((float *)vb, xOffset, yOffset, width, width, &first, &second, &third);
            }
            return;
        }
    }
terminal:
    if (!((Rva00729370BitPlane *)m_map)->test(minX, minY)) return;
    UnsignedShort prevNdxLeft;
    UnsignedShort prevNdxRight;
    ICoord2D left;
    left.x = xOffset;
    left.y = yOffset;
    ICoord2D right;
    right.x = xOffset;
    right.y = yOffset;
    advanceLeft(left, xOffset, yOffset, width, width);
    advanceRight(right, xOffset, yOffset, width, width);
    if (ib) ib[*curIndexP] = (UnsignedShort)bottomLeftNdx;
    ++*curIndexP;
    prevNdxRight = ndx[right.x + right.y * (m_width + 1)];
    if (ib) ib[*curIndexP] = prevNdxRight;
    ++*curIndexP;
    prevNdxLeft = ndx[left.x + left.y * (m_width + 1)];
    if (ib) ib[*curIndexP] = prevNdxLeft;
    ++*curIndexP;
    if (vb) {
        Vector3 first, second, third;
        first.X = (float)minX * 10.0f - (float)m_map->m_borderSize * 10.0f;
        first.Y = (float)minY * 10.0f - (float)m_map->m_borderSize * 10.0f;
        first.Z = (float)((Rva006BE030LookupWord *)m_map)->lookup(minX, minY) * 0.0390625f;
        second.X = (float)(m_xOrigin + right.x) * 10.0f - (float)m_map->m_borderSize * 10.0f;
        second.Y = (float)(m_yOrigin + right.y) * 10.0f - (float)m_map->m_borderSize * 10.0f;
        second.Z = (float)((Rva006BE030LookupWord *)m_map)->lookup(m_xOrigin + right.x, m_yOrigin + right.y) * 0.0390625f;
        third.X = (float)(m_xOrigin + left.x) * 10.0f - (float)m_map->m_borderSize * 10.0f;
        third.Y = (float)(m_yOrigin + left.y) * 10.0f - (float)m_map->m_borderSize * 10.0f;
        third.Z = (float)((Rva006BE030LookupWord *)m_map)->lookup(m_xOrigin + left.x, m_yOrigin + left.y) * 0.0390625f;
        getTriangleIntersection((float *)vb, xOffset, yOffset, width, width, &first, &second, &third);
    }
    bool didLeft = true;
    bool didRight = true;
    while (didLeft || didRight) {
        ICoord2D oldLeft = left;
        didLeft = advanceLeft(left, xOffset, yOffset, width, width);
        if (didLeft) {
            if (ib) ib[*curIndexP] = prevNdxLeft;
            ++*curIndexP;
            if (ib) ib[*curIndexP] = prevNdxRight;
            ++*curIndexP;
            prevNdxLeft = ndx[left.x + left.y * (m_width + 1)];
            if (ib) ib[*curIndexP] = prevNdxLeft;
            ++*curIndexP;
            if (vb) {
                Vector3 first, second, third;
                first.X = (float)(m_xOrigin + oldLeft.x) * 10.0f - (float)m_map->m_borderSize * 10.0f;
                first.Y = (float)(m_yOrigin + oldLeft.y) * 10.0f - (float)m_map->m_borderSize * 10.0f;
                first.Z = (float)m_map->getHeight(m_xOrigin + oldLeft.x, m_yOrigin + oldLeft.y) * 0.0390625f;
                second.X = (float)(m_xOrigin + right.x) * 10.0f - (float)m_map->m_borderSize * 10.0f;
                second.Y = (float)(m_yOrigin + right.y) * 10.0f - (float)m_map->m_borderSize * 10.0f;
                second.Z = (float)m_map->getHeight(m_xOrigin + right.x, m_yOrigin + right.y) * 0.0390625f;
                third.X = (float)(m_xOrigin + left.x) * 10.0f - (float)m_map->m_borderSize * 10.0f;
                third.Y = (float)(m_yOrigin + left.y) * 10.0f - (float)m_map->m_borderSize * 10.0f;
                third.Z = (float)m_map->getHeight(m_xOrigin + left.x, m_yOrigin + left.y) * 0.0390625f;
                getTriangleIntersection((float *)vb, xOffset, yOffset, width, width, &first, &second, &third);
            }
        }
        ICoord2D oldRight = right;
        didRight = advanceRight(right, xOffset, yOffset, width, width);
        if (didRight) {
            if (ib) ib[*curIndexP] = prevNdxLeft;
            ++*curIndexP;
            if (ib) ib[*curIndexP] = prevNdxRight;
            ++*curIndexP;
            prevNdxRight = ndx[right.x + right.y * (m_width + 1)];
            if (ib) ib[*curIndexP] = prevNdxRight;
            ++*curIndexP;
            if (vb) {
                Vector3 first, second, third;
                first.X = (float)(m_xOrigin + left.x) * 10.0f - (float)m_map->m_borderSize * 10.0f;
                first.Y = (float)(m_yOrigin + left.y) * 10.0f - (float)m_map->m_borderSize * 10.0f;
                first.Z = (float)m_map->getHeight(m_xOrigin + left.x, m_yOrigin + left.y) * 0.0390625f;
                second.X = (float)(m_xOrigin + oldRight.x) * 10.0f - (float)m_map->m_borderSize * 10.0f;
                second.Y = (float)(m_yOrigin + oldRight.y) * 10.0f - (float)m_map->m_borderSize * 10.0f;
                second.Z = (float)m_map->getHeight(m_xOrigin + oldRight.x, m_yOrigin + oldRight.y) * 0.0390625f;
                third.X = (float)(m_xOrigin + right.x) * 10.0f - (float)m_map->m_borderSize * 10.0f;
                third.Y = (float)(m_yOrigin + right.y) * 10.0f - (float)m_map->m_borderSize * 10.0f;
                third.Z = (float)m_map->getHeight(m_xOrigin + right.x, m_yOrigin + right.y) * 0.0390625f;
                getTriangleIntersection((float *)vb, xOffset, yOffset, width, width, &first, &second, &third);
            }
        }
    }
    if (ib) ib[*curIndexP] = prevNdxLeft;
    ++*curIndexP;
    if (ib) ib[*curIndexP] = prevNdxRight;
    ++*curIndexP;
    if (ib) ib[*curIndexP] = (UnsignedShort)topRightNdx;
    ++*curIndexP;
    if (vb) {
        Vector3 first, second, third;
        first.X = (float)(m_xOrigin + left.x) * 10.0f - (float)m_map->m_borderSize * 10.0f;
        first.Y = (float)(m_yOrigin + left.y) * 10.0f - (float)m_map->m_borderSize * 10.0f;
        first.Z = (float)((Rva006BE030LookupWord *)m_map)->lookup(m_xOrigin + left.x, m_yOrigin + left.y) * 0.0390625f;
        second.X = (float)(m_xOrigin + right.x) * 10.0f - (float)m_map->m_borderSize * 10.0f;
        second.Y = (float)(m_yOrigin + right.y) * 10.0f - (float)m_map->m_borderSize * 10.0f;
        second.Z = (float)((Rva006BE030LookupWord *)m_map)->lookup(m_xOrigin + right.x, m_yOrigin + right.y) * 0.0390625f;
        third.X = (float)(minX + width) * 10.0f - (float)m_map->m_borderSize * 10.0f;
        third.Y = (float)(minY + width) * 10.0f - (float)m_map->m_borderSize * 10.0f;
        third.Z = (float)((Rva006BE030LookupWord *)m_map)->lookup(minX + width, minY + width) * 0.0390625f;
        getTriangleIntersection((float *)vb, xOffset, yOffset, width, width, &first, &second, &third);
    }
}
