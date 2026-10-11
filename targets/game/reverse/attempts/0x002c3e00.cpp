// ?rva002C3E00@Rva002C3FE0Owner@@QAEXPAUCoord3D@@PA_N_N@Z
// partial score=0.9817 date=2026-10-11
// cl: /Igame /DNDEBUG /MD /EHsc /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Libraries/Include /Igame/Libraries/Source/WWVegas/WWMath /Igame/Libraries/Source/WWVegas/WWLib
#include "Lib/BaseType.h"
#include "matrix3d.h"
struct Rva002C3E00Data { char field00[0x74]; float field74,field78,field7C; };
struct Rva002C3E00Loco { char field00[4]; Rva002C3E00Data *field04; };
#define BFME_HAVE_COORD3D 1
#include "GameEngine/Source/GameLogic/Object/object.h"
typedef Object Rva002C3E00Object;
struct Rva002C3E00Context { char field00[0x10]; Rva002C3E00Object *field10; };
class Rva002C3FE0Owner { char field00[0x1c]; Rva002C3E00Context *field1C;
public: void rva002C3E00(Coord3D *,bool *,bool); bool method(const Coord3D *,float); };
void Rva002C3FE0Owner::rva002C3E00(Coord3D *out,bool *shortened,bool doubled) {
 Rva002C3E00Object *object=field1C->field10;
 Coord3D candidate;
 Coord3D last; last.x=object->m_cachedPos.x; last.y=object->m_cachedPos.y; last.z=object->m_cachedPos.z;
 float achieved=0.0f;
 if(object->m_ai) {
  const Rva002C3E00Data *data=((Rva002C3E00Loco *)object->m_ai)->field04;
  float height=object->m_cachedPos.z;
  Vector3 position=object->m_transform.Get_X_Vector();
  Coord3D direction; direction.x=position.X; direction.y=position.Y; direction.z=position.Z;
  float limit=data->field74;
  float step=data->field78;
  float slope=data->field7C;
  if(doubled)limit+=limit;
  for(float distance=step;distance<=limit;distance+=step) {
   Vector3 scaled(distance*direction.x,distance*direction.y,distance*direction.z);
   Coord3D delta; delta.x=scaled.X;delta.y=scaled.Y;delta.z=scaled.Z;
   Coord3D position; position.x=object->m_cachedPos.x; position.y=object->m_cachedPos.y; position.z=object->m_cachedPos.z; candidate.x=position.x; candidate.y=position.y; candidate.z=position.z;
   candidate.add(&delta);
   if(!method(&candidate,distance*slope+height))break;
   achieved=distance;
   last=candidate;
  }
  if(achieved<limit*0.5f)*shortened=true;else *shortened=false;
 }
 out->x=last.x;out->y=last.y;out->z=last.z;
}
