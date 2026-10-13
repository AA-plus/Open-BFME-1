// ?rva0029B350@PhysicsBehavior@@QAEX_N@Z
// cl: /DNDEBUG /MD /Igame/Libraries/Source/WWVegas/WWMath /Igame/Libraries/Source/WWVegas/WWDebug /Igame/Libraries/Source/WWVegas/WWLib /Igame/Libraries/Include/Lib
// stlport

#define _STLP_NO_EXCEPTIONS 1
#include <vector>
#define _OPERATOR_NEW_DEFINED_
#include "vector2.h"
#include "Coord3D.h"

struct Rva0029AB10Coord3D
{
    float x, y, z;

    void set(const Rva0029AB10Coord3D *a)
    {
        x = a->x;
        y = a->y;
        z = a->z;
    }

    float length2D() const { return (float)sqrt(x * x + y * y); }

    void sub(const Rva0029AB10Coord3D *a)
    {
        x -= a->x;
        y -= a->y;
        z -= a->z;
    }
};

class Object
{
public:
    char pad00[0x38];
    Rva0029AB10Coord3D position;
};

enum UpdateSleepTime { UPDATE_SLEEP_NONE = 1 };

class UpdateModule
{
protected:
    void setWakeFrame(Object *, UpdateSleepTime);
};

class TerrainLogic;
extern TerrainLogic *TheTerrainLogic;

// The register-only table argument preserves EDX for the proven thiscall slot.
// The const receiver, three stack arguments and ST0 result follow TerrainLogic.h.
struct Rva0029B350TerrainVtable
{
    void *slots[6];
    float (__fastcall *height)(const TerrainLogic *, Rva0029B350TerrainVtable *, float, float, Coord3D *);
};

class PhysicsBehavior : public UpdateModule
{
public:
    void rva0029B350(bool);
    void rva0029B120(bool);
    void rva0029AB10(const Rva0029AB10Coord3D *, float, unsigned int);

    char pad00[8];
    Object *object;
    char pad0c[0x14];
    _STL::vector<Rva0029AB10Coord3D> points;
    Rva0029AB10Coord3D at2c, at38;
    float at44, at48;
    int at4c, at50, at54;
    char pad58[6];
    bool at5e;
};

// Retail passes the last argument as float product bits to the existing uint slot.
typedef void (PhysicsBehavior::*Rva0029AB10FloatWhen)(const Rva0029AB10Coord3D *, float, float);

// Evidence: targets/game/reverse/identity_evidence/0029b350-terrain-dispatch.md.
void PhysicsBehavior::rva0029B350(bool skipWake)
{
    Object *obj = object;
    if (!skipWake)
        setWakeFrame(obj, UPDATE_SLEEP_NONE);

    ++at54;
    int count = points.size();
    if (count < 2)
    {
        rva0029B120(skipWake);
        return;
    }

    Vector2 direction(points[count - 1].x - points[count - 2].x, points[count - 1].y - points[count - 2].y);
    direction.Normalize();
    Rva0029AB10Coord3D delta;
    delta.set(&at38);
    delta.sub(&at2c);

    {
        TerrainLogic *terrain = TheTerrainLogic;
        Rva0029B350TerrainVtable *table = *(Rva0029B350TerrainVtable **)terrain;
        Rva0029AB10Coord3D pos;
        pos.x = obj->position.x + direction.X * (delta.length2D() * 0.5f);
        pos.y = obj->position.y + direction.Y * (delta.length2D() * 0.5f);
        pos.z = table->height(terrain, table, pos.x, pos.y, 0);
        (this->*(Rva0029AB10FloatWhen)&PhysicsBehavior::rva0029AB10)(&pos, at48 * 0.35f, at44 * 0.85f);
    }

    at5e = true;
}
