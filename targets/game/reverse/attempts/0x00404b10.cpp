// ?d_00404b10@@YAXXZ
// partial score=0.1013 date=2026-10-11
// cl: /DNDEBUG /MD /EHsc /D_STLP_USE_STATIC_LIB
// stlport
#include <map>
typedef unsigned short zoneStorageType;

struct BfmeZoneRegion
{
	int loX;
	int loY;
	int hiX;
	int hiY;
};

struct BfmeZoneCell
{
	void *info;
	unsigned int unused4;
	unsigned short rva008;
	zoneStorageType zone;
	union { unsigned int flags; struct {
        unsigned type:3, unused03:3, layer06:6, layer12:6, unused18:2,
            flag20:1, flag21:1, field22:2;
    }; };
    int getType() const { return (int)type; }
    int getLayer() const { return (int)layer06; }
    int getConnectLayer() const { return (int)layer12; }
    int getProfileLayer() const { return (int)field22; }
    bool flag20Set() const { return (bool)flag20; }
    bool flag21Set() const { return (bool)flag21; }
};

struct BfmeZoneLayer
{
	unsigned char opaque[0x30];
	zoneStorageType zone;
	unsigned char tail[0x12];
};

void bfmeResolveZones(int sourceZone, int targetZone,
	zoneStorageType *zoneEquivalency, zoneStorageType *zoneListHeads,
	zoneStorageType *zoneListNext, int sizeOfZones);

// Selects grid or stored-pair traversal. Its semantic name is unproved.
extern bool g_rva012B4D2CUseZonePairs;

struct Rva00404B10CellProperties
{
    unsigned short type;
    unsigned short padding;
    int layer;
    int connectLayer;
    bool flag20;
    bool flag21;
    unsigned short profileLayer;
};
struct Rva00404B10ZoneEdge : public _STL::_Rb_tree_node_base
{
    unsigned int zonePair;
    Rva00404B10CellProperties source;
    Rva00404B10CellProperties target;
};
class PathfindZoneManager
{
public:
	void bfmeBuildProfileZones(BfmeZoneCell **map, BfmeZoneLayer *layers,
		const BfmeZoneRegion &bounds, int startPercent, int endPercent);

private:
	unsigned char m_beforeMaxZone[0x23298];
	unsigned int m_maxZone;
	zoneStorageType *m_zoneEquivalency[12][6];
	zoneStorageType *m_zoneListHeads[12][6];
	zoneStorageType *m_zoneListNext[12][6];
	_STL::_Rb_tree_node_base *m_incrementalObjects;
	unsigned int m_pairCount;
	unsigned int m_compare;
	Rva00404B10ZoneEdge *m_currentIncrementalObject;
};


static bool sameProfileCell(const BfmeZoneCell &a, const BfmeZoneCell &b,
    int layer, bool flag20, bool flag21)
{
    bool same = true;
    if (layer > 0 && (a.getProfileLayer() > layer) !=
        (b.getProfileLayer() > layer)) same = false;
    if (flag20 && (a.flag20Set() != b.flag20Set())) same = false;
    if (flag21 && (a.flag21Set() != b.flag21Set())) same = false;
    return same;
}

static int substituteZero(const BfmeZoneCell &cell, int replacement)
{
	int type = cell.getType();
    int result = replacement;
    if(type != 0) result = type;
    return result;
}

static bool substituteZero(const BfmeZoneCell &a,
    const BfmeZoneCell &b, int replacement)
{
    int sourceType = a.getType();
    int targetType = b.getType();
    if (sourceType == 0) sourceType = replacement;
    if (targetType == 0) targetType = replacement;
    return sourceType == targetType && a.getLayer() == b.getLayer();
}

void PathfindZoneManager::bfmeBuildProfileZones(BfmeZoneCell **map,
	BfmeZoneLayer *layers, const BfmeZoneRegion &bounds,
	int startPercent, int endPercent)
{
	if (startPercent == 0)
	{
		for (int table = 0; table < 6; ++table)
		{
			for (int profile = 0; profile < 12; ++profile)
			{
				for (unsigned int zone = 0; zone < m_maxZone; ++zone)
				{
					m_zoneEquivalency[profile][table][zone] =
						(zoneStorageType)zone;
					m_zoneListHeads[profile][table][zone] =
						(zoneStorageType)zone;
					m_zoneListNext[profile][table][zone] = 0xffff;
				}
			}
		}
		m_currentIncrementalObject =
			(Rva00404B10ZoneEdge *)m_incrementalObjects->_M_left;
	}

	int firstObject = m_pairCount * (unsigned int)startPercent / 100;
	int lastObject = m_pairCount * (unsigned int)endPercent / 100;
	int width = bounds.hiY - bounds.loY + 1;
	int firstY = bounds.loY + width * startPercent / 100;
	int lastY = bounds.loY + width * endPercent / 100;

	for (int profile = 0; profile < 12; ++profile)
	{
		int layer = profile % 3;
		unsigned int profileFlags = profile / 3;
		bool flag20 = (profileFlags & 1) != 0;
		bool flag21 = ((profileFlags >> 1) & 1) != 0;

        if (g_rva012B4D2CUseZonePairs)
        {

            for (int y = firstY; y < lastY; ++y)
                for (int x = bounds.loX; x <= bounds.hiX; ++x)
                {
                    BfmeZoneCell &cell = map[x][y];
                    int connectLayer = cell.getConnectLayer();
                    if (connectLayer >= 2 && connectLayer <= 15 && cell.getType() == 0)
                        bfmeResolveZones(cell.zone, layers[connectLayer].zone,
                            m_zoneEquivalency[profile][0], m_zoneListHeads[profile][0],
                            m_zoneListNext[profile][0], m_maxZone);
                }
            Rva00404B10ZoneEdge *edge = m_currentIncrementalObject;
            for (int index = firstObject; index < lastObject; ++index)
            {
                unsigned int zonePair = edge->zonePair;
                unsigned short sourceZone = (unsigned short)(zonePair >> 16);
                unsigned short targetZone = (unsigned short)zonePair;
                if ((layer <= 0 || ((int)edge->source.profileLayer > layer) ==
                                   ((int)edge->target.profileLayer > layer)) &&
                    (!flag20 || edge->source.flag20 == edge->target.flag20) &&
                    (!flag21 || edge->source.flag21 == edge->target.flag21))
                {
                    {
                    int sourceType = 1;
                    if (edge->source.type != 0) sourceType = edge->source.type;
                    int targetType;
                    if (edge->target.type == 0) targetType = 1;
                    else targetType = edge->target.type;
                    if (sourceType == targetType &&
                        edge->source.layer == edge->target.layer)
                        bfmeResolveZones(sourceZone,targetZone,m_zoneEquivalency[profile][2],
                            m_zoneListHeads[profile][2],m_zoneListNext[profile][2],m_maxZone);
                    }
                    {
                    int sourceType = 3;
                    if (edge->source.type != 0) sourceType = edge->source.type;
                    int targetType;
                    if (edge->target.type == 0) targetType = 3;
                    else targetType = edge->target.type;
                    if (sourceType == targetType &&
                        edge->source.layer == edge->target.layer)
                        bfmeResolveZones(sourceZone,targetZone,m_zoneEquivalency[profile][3],
                            m_zoneListHeads[profile][3],m_zoneListNext[profile][3],m_maxZone);
                    }
                    {
                    int sourceType = 2;
                    if (edge->source.type != 0) sourceType = edge->source.type;
                    int targetType;
                    if (edge->target.type == 0) targetType = 2;
                    else targetType = edge->target.type;
                    if (sourceType == targetType &&
                        edge->source.layer == edge->target.layer)
                        bfmeResolveZones(sourceZone,targetZone,m_zoneEquivalency[profile][1],
                            m_zoneListHeads[profile][1],m_zoneListNext[profile][1],m_maxZone);
                    }
                    {
                    int sourceType = 4;
                    if (edge->source.type != 0) sourceType = edge->source.type;
                    int targetType;
                    if (edge->target.type == 0) targetType = 4;
                    else targetType = edge->target.type;
                    if (sourceType == targetType &&
                        edge->source.layer == edge->target.layer)
                        bfmeResolveZones(sourceZone,targetZone,m_zoneEquivalency[profile][4],
                            m_zoneListHeads[profile][4],m_zoneListNext[profile][4],m_maxZone);
                    }
                    if ((edge->source.type == 2) == (edge->target.type == 2))
                        bfmeResolveZones(sourceZone,targetZone,m_zoneEquivalency[profile][5],
                            m_zoneListHeads[profile][5],m_zoneListNext[profile][5],m_maxZone);
                    if (edge->source.type == edge->target.type &&
                        (edge->source.layer == edge->target.layer ||
                         edge->source.layer == edge->target.connectLayer ||
                         edge->source.connectLayer == edge->target.layer ||
                         (edge->source.connectLayer == 16 && edge->target.connectLayer == 16)))
                        bfmeResolveZones(sourceZone,targetZone,m_zoneEquivalency[profile][0],
                            m_zoneListHeads[profile][0],m_zoneListNext[profile][0],m_maxZone);
                }
                edge = (Rva00404B10ZoneEdge *)_STL::_Rb_global<bool>::_M_increment(edge);
            }
            if (profile == 11) m_currentIncrementalObject = edge;
        }
        else
        {

			for (int y = firstY; y < lastY; ++y)
			{
				for (int x = bounds.loX; x <= bounds.hiX; ++x)
				{
					BfmeZoneCell &cell = map[x][y];
					int connectLayer = cell.getConnectLayer();
					if (connectLayer >= 2 && connectLayer <= 15 &&
						cell.getType() == 0)
					{
						bfmeResolveZones(cell.zone, layers[connectLayer].zone,
							m_zoneEquivalency[profile][0],
							m_zoneListHeads[profile][0],
							m_zoneListNext[profile][0], m_maxZone);
					}

					int cellZone = cell.zone;
					if (x <= bounds.loX)
						goto check_left_cell;
					{
					int otherZone = map[x - 1][y].zone;
					if (cellZone == otherZone ||
						!sameProfileCell(cell, map[x - 1][y], layer,
							flag20, flag21))
						goto check_left_cell;

					if (substituteZero(cell, map[x - 1][y], 1))
						bfmeResolveZones(cellZone, otherZone,
							m_zoneEquivalency[profile][2],
							m_zoneListHeads[profile][2],
							m_zoneListNext[profile][2], m_maxZone);

					if (substituteZero(cell, map[x - 1][y], 3))
						bfmeResolveZones(cellZone, otherZone,
							m_zoneEquivalency[profile][3],
							m_zoneListHeads[profile][3],
							m_zoneListNext[profile][3], m_maxZone);

					if (substituteZero(cell, map[x - 1][y], 2))
						bfmeResolveZones(cellZone, otherZone,
							m_zoneEquivalency[profile][1],
							m_zoneListHeads[profile][1],
							m_zoneListNext[profile][1], m_maxZone);

					if (substituteZero(cell, map[x - 1][y], 4))
						bfmeResolveZones(cellZone, otherZone,
							m_zoneEquivalency[profile][4],
							m_zoneListHeads[profile][4],
							m_zoneListNext[profile][4], m_maxZone);

					if ((cell.getType() == 2) == (map[x - 1][y].getType() == 2))
						bfmeResolveZones(cellZone, otherZone,
							m_zoneEquivalency[profile][5],
							m_zoneListHeads[profile][5],
							m_zoneListNext[profile][5], m_maxZone);

					if (cell.getType() == map[x - 1][y].getType() &&
                        (cell.getLayer() == map[x - 1][y].getLayer() ||
                         cell.getLayer() == map[x - 1][y].getConnectLayer() ||
                         (cell.getConnectLayer()) == map[x - 1][y].getLayer() ||
                         ((cell.getConnectLayer()) == 16 && map[x - 1][y].getConnectLayer() == 16)))
						bfmeResolveZones(cellZone, otherZone,
							m_zoneEquivalency[profile][0],
							m_zoneListHeads[profile][0],
							m_zoneListNext[profile][0], m_maxZone);
					}

				check_left_cell:
					if (y <= bounds.loY)
						continue;
					int leftZone = map[x][y - 1].zone;
					if (cellZone == leftZone ||
						!sameProfileCell(cell, map[x][y - 1], layer,
							flag20, flag21))
						continue;

					if (substituteZero(cell, map[x][y - 1], 1))
						bfmeResolveZones(cellZone, leftZone,
							m_zoneEquivalency[profile][2],
							m_zoneListHeads[profile][2],
							m_zoneListNext[profile][2], m_maxZone);
					if (substituteZero(cell, map[x][y - 1], 3))
						bfmeResolveZones(cellZone, leftZone,
							m_zoneEquivalency[profile][3],
							m_zoneListHeads[profile][3],
							m_zoneListNext[profile][3], m_maxZone);
					if (substituteZero(cell, map[x][y - 1], 2))
						bfmeResolveZones(cellZone, leftZone,
							m_zoneEquivalency[profile][1],
							m_zoneListHeads[profile][1],
							m_zoneListNext[profile][1], m_maxZone);
					if (substituteZero(cell, map[x][y - 1], 4))
						bfmeResolveZones(cellZone, leftZone,
							m_zoneEquivalency[profile][4],
							m_zoneListHeads[profile][4],
							m_zoneListNext[profile][4], m_maxZone);
					if ((cell.getType() == 2) == (map[x][y - 1].getType() == 2))
						bfmeResolveZones(cellZone, leftZone,
							m_zoneEquivalency[profile][5],
							m_zoneListHeads[profile][5],
							m_zoneListNext[profile][5], m_maxZone);

					if (cell.getType() == map[x][y - 1].getType() &&
                        (cell.getLayer() == map[x][y - 1].getLayer() ||
                         cell.getLayer() == map[x][y - 1].getConnectLayer() ||
                         (cell.getConnectLayer()) == map[x][y - 1].getLayer() ||
                         ((cell.getConnectLayer()) == 16 && map[x][y - 1].getConnectLayer() == 16)))
						bfmeResolveZones(cellZone, leftZone,
							m_zoneEquivalency[profile][0],
							m_zoneListHeads[profile][0],
							m_zoneListNext[profile][0], m_maxZone);
				}
			}
		        }
	}
}
