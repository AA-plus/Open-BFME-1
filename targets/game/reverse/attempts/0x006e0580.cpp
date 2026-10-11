// ?update@RenderObjectParticleUpdateModule@FXParticleSystem@@UAEXPAURva006E0580State@2@@Z
// partial score=0.2276 date=2026-10-11
// cl: /Igame/GameEngine/Source/Common/Thing /Igame/Libraries/Source/WWVegas/WWLib /DNDEBUG /DWIN32 /D_WINDOWS /MD /EHsc /Iinputs/reference/shims/sweep /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/GameEngine/Include /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/GameEngine/Source /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Libraries/Include /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Libraries/Source /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Libraries/Source/Compression /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Libraries/Source/debug /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Libraries/Source/WWVegas /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Libraries/Source/WWVegas/WWLib /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/GameEngineDevice/Include /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Libraries/Source/WWVegas/WW3D2 /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Libraries/Source/WWVegas/WWMath /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Libraries/Source/WWVegas/WWDebug /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Libraries/Source/WWVegas/WWSaveLoad /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Main
// stlport
// The inherited bank names are retained; the matched W3DView caller proves
// an address-derived camera-state receiver and a 0xD8-byte context.

#define __PLACEMENT_VEC_NEW_INLINE
#include "ascii_string.h"
#define ASCIISTRING_H
#include "GameClient/Drawable.h"
#include "GameLogic/Object.h"
#include "GameLogic/ScriptEngine.h"
#include "W3DDevice/GameClient/camerashakesystem.h"
#include "W3DDevice/GameClient/Module/W3DModelDraw.h"
#include "WW3D2/Camera.h"
#include "GameClient/Display.h"
#define ObjectID Rva006E0580ObjectID
#include "GameLogicObjectLookup.h"
#undef ObjectID
extern GameLogic *TheGameLogic;

extern ScriptEngine *TheScriptEngine;

class Gen_00411580 { public: int m(); };

namespace FXParticleSystem {
static __forceinline float maxf(float a, float b) { return a > b ? a : b; }
static __forceinline float minf(float a, float b) { return a < b ? a : b; }

struct Rva006E0580State {
    Matrix3D *transform;             // 00
    float distance;                 // 04
    Vector3 source;                 // 08
    Vector3 target;                 // 14
    Vector3 shakerAngles;           // 20
    float pad2C;
    float groundLevel;              // 30
    union { unsigned char pad34[8]; struct { float angle34; float pitch38; }; };
    float lookAngle;                // 3c
    float pitchAngle;               // 40
    float finalAngle;               // 44
    union { unsigned char pad48[4]; float finalHeight48; };
    Coord3D velocity;               // 4c
    Coord3D position;               // 58
    Vector3 direction;              // 64
    float accelerationX;            // 70
    float accelerationY;            // 74
    bool clampVelocity;             // 78
    unsigned char pad79[3];
    float minVelocityX;
    float minVelocityY;
    float maxVelocityX;
    float maxVelocityY;
    bool clampAngle;                // 8c
    unsigned char pad8D[3];
    Vector3 angleAxis;              // 90
    union { unsigned char pad9C[0x0c]; struct { bool flag9C; unsigned char gap9D[3]; float fxPitchA0; int objectIDA4; }; };
    bool flagA8;
    bool flagA9;
    bool cameraSlaved;              // aa
    unsigned char padAB;
    AsciiString slaveObjectName;    // ac
    AsciiString slaveBoneName;      // b0
    unsigned char padB4[0x1c];
    bool useRealZoom;               // d0
    unsigned char padD1;
    bool finalLookAt;               // d2
    unsigned char padD3;
    int updateMode;                 // d4
};

typedef char ContextMustBe216Bytes[(sizeof(Rva006E0580State) == 0xD8) ? 1 : -1];

class RenderObjectParticleUpdateModule {
public:
    virtual void update(Rva006E0580State *state);
    void adjustTarget(Vector3 *source, Vector3 *target, Rva006E0580State *state);
    unsigned char receiverPad04[0x0c];
    Vector3 previousSource;
    unsigned char receiverPad1C[2];
    bool flag1E;
};



static __forceinline DrawModule **getDrawModules(Drawable *draw)
{
    return (DrawModule **)((Gen_00411580 *)draw)->m();
}

class Rva006E0580MatrixABI : public Matrix3D {
public: void mulVector3(Vector3 &point) const;
};
#define ABI_SLOT(n) virtual void slot##n() = 0;
class Rva006E0580ObjectABI {
public:
    ABI_SLOT(00) ABI_SLOT(01) ABI_SLOT(02) ABI_SLOT(03) ABI_SLOT(04)
    ABI_SLOT(05) ABI_SLOT(06) ABI_SLOT(07) ABI_SLOT(08) ABI_SLOT(09)
    virtual Drawable *getDrawable() const = 0;
};
class Rva006E0580DisplayABI {
public:
    ABI_SLOT(00) ABI_SLOT(01) ABI_SLOT(02) ABI_SLOT(03) ABI_SLOT(04)
    ABI_SLOT(05) ABI_SLOT(06) ABI_SLOT(07) ABI_SLOT(08) ABI_SLOT(09)
    ABI_SLOT(10) ABI_SLOT(11) ABI_SLOT(12) ABI_SLOT(13) ABI_SLOT(14)
    ABI_SLOT(15) ABI_SLOT(16) ABI_SLOT(17) ABI_SLOT(18) ABI_SLOT(19)
    ABI_SLOT(20) ABI_SLOT(21) ABI_SLOT(22) ABI_SLOT(23) ABI_SLOT(24)
    ABI_SLOT(25) ABI_SLOT(26) ABI_SLOT(27) ABI_SLOT(28) ABI_SLOT(29)
    ABI_SLOT(30) ABI_SLOT(31) ABI_SLOT(32) ABI_SLOT(33) ABI_SLOT(34)
    ABI_SLOT(35) ABI_SLOT(36) ABI_SLOT(37) ABI_SLOT(38) ABI_SLOT(39)
    ABI_SLOT(40) ABI_SLOT(41) ABI_SLOT(42) ABI_SLOT(43) ABI_SLOT(44)
    ABI_SLOT(45) ABI_SLOT(46) ABI_SLOT(47) ABI_SLOT(48) ABI_SLOT(49)
    ABI_SLOT(50) ABI_SLOT(51) ABI_SLOT(52) ABI_SLOT(53) ABI_SLOT(54)
    ABI_SLOT(55) ABI_SLOT(56) ABI_SLOT(57) ABI_SLOT(58) ABI_SLOT(59)
    ABI_SLOT(60) ABI_SLOT(61) ABI_SLOT(62) ABI_SLOT(63) ABI_SLOT(64)
    ABI_SLOT(65) ABI_SLOT(66) ABI_SLOT(67) ABI_SLOT(68) ABI_SLOT(69)
    ABI_SLOT(70) ABI_SLOT(71) ABI_SLOT(72) ABI_SLOT(73) ABI_SLOT(74)
    ABI_SLOT(75) ABI_SLOT(76) ABI_SLOT(77)
    virtual bool isLetterBoxed() = 0;
};

class Rva006E0580ScriptABI {
public:
    ABI_SLOT(00) ABI_SLOT(01) ABI_SLOT(02) ABI_SLOT(03) ABI_SLOT(04)
    ABI_SLOT(05) ABI_SLOT(06) ABI_SLOT(07) ABI_SLOT(08) ABI_SLOT(09)
    ABI_SLOT(10) ABI_SLOT(11) ABI_SLOT(12) ABI_SLOT(13) ABI_SLOT(14)
    ABI_SLOT(15) ABI_SLOT(16) ABI_SLOT(17) ABI_SLOT(18) ABI_SLOT(19)
    ABI_SLOT(20) ABI_SLOT(21) ABI_SLOT(22) ABI_SLOT(23) ABI_SLOT(24)
    ABI_SLOT(25) ABI_SLOT(26)
    virtual Object *getUnitNamed(AsciiString name) = 0;
};

class Rva006E0580DrawModuleABI {
public:
    ABI_SLOT(00) ABI_SLOT(01) ABI_SLOT(02) ABI_SLOT(03) ABI_SLOT(04)
    ABI_SLOT(05) ABI_SLOT(06) ABI_SLOT(07) ABI_SLOT(08) ABI_SLOT(09)
    ABI_SLOT(10) ABI_SLOT(11) ABI_SLOT(12) ABI_SLOT(13) ABI_SLOT(14)
    ABI_SLOT(15) ABI_SLOT(16) ABI_SLOT(17) ABI_SLOT(18) ABI_SLOT(19)
    ABI_SLOT(20) ABI_SLOT(21) ABI_SLOT(22) ABI_SLOT(23) ABI_SLOT(24)
    ABI_SLOT(25) ABI_SLOT(26) ABI_SLOT(27) ABI_SLOT(28) ABI_SLOT(29)
    ABI_SLOT(30) ABI_SLOT(31) ABI_SLOT(32) ABI_SLOT(33) ABI_SLOT(34)
    ABI_SLOT(35) ABI_SLOT(36) ABI_SLOT(37) ABI_SLOT(38)
    virtual ObjectDrawInterface *getObjectDrawInterface() = 0;
};
#undef ABI_SLOT

void RenderObjectParticleUpdateModule::update(Rva006E0580State *state)
{
    Vector3 source, target;
    state->velocity.x += state->accelerationX;
    float positionY = state->velocity.y += state->accelerationY;
    Coord3D &pos = state->velocity;
    if (state->updateMode == 2) {
        source.X = pos.x; source.Y = pos.y; source.Z = pos.z;
        if (state->direction.Length2() == 0.0f) {
            target.X = source.X; target.Y = source.Y; target.Z = 0.0f;
        } else { target = state->direction; }
        state->transform->Make_Identity();
        state->transform->Look_At(source, target, state->lookAngle);
        return;
    }
    if (state->clampVelocity) {
        pos.x = maxf(state->minVelocityX, state->velocity.x);
        pos.x = minf(state->maxVelocityX, pos.x);
        pos.y = maxf(state->minVelocityY, positionY);
        pos.y = minf(state->maxVelocityY, pos.y);
    }
    bool useRealZoomCam = state->clampAngle;
    // set position of camera itself
    if (useRealZoomCam) {
        source = state->angleAxis;
        float capped_zoom = state->groundLevel;
        if (capped_zoom > 1.0f) capped_zoom = 1.0f;
        if (capped_zoom < 0.5f) capped_zoom = 0.5f;
        state->pitchAngle = 50.0f * 3.14159265358979323846f / 180.0f * capped_zoom;
    } else {
        source.X = state->angleAxis.X * state->groundLevel;
        source.Y = state->angleAxis.Y * state->groundLevel;
        source.Z = state->angleAxis.Z * state->groundLevel;
        if (state->flag9C) {
            Object *object = TheGameLogic->findObjectByID(state->objectIDA4);
            if (object) source.Z = (object->getPosition()->z + state->angleAxis.Z) * state->groundLevel;
        }
    }
    // camera looking at origin
    target.X = 0; target.Y = 0; target.Z = 0;
    {
    float factor = 1.0 - (state->pad2C / source.Z);
    // construct a matrix to rotate around the up vector by the given angle
    Matrix3D angleTransform(Vector3(0.0f, 0.0f, 1.0f), state->angle34);
    // construct a matrix to rotate around the horizontal vector by the given angle
    Matrix3D pitchTransform(Vector3(1.0f, 0.0f, 0.0f), state->pitch38);
    // rotate camera position (pitch, then angle)
    ((Rva006E0580MatrixABI *)&pitchTransform)->mulVector3(source);
    ((Rva006E0580MatrixABI *)&angleTransform)->mulVector3(source);
    source *= factor;
    }
    // translate to current XY position
    source.X += pos.x;
    source.Y += pos.y;
    target.X += pos.x;
    target.Y += pos.y;
    Object *object = state->flag9C ? TheGameLogic->findObjectByID(state->objectIDA4) : 0;
    if (state->flag9C && (!object || object->isKindOf((KindOfType)12))) {
        Matrix3D angleTransform(Vector3(0.0f, 0.0f, 1.0f), state->angle34);
        Matrix3D pitchTransform(Vector3(1.0f, 0.0f, 0.0f), state->pitch38);
        ((Rva006E0580MatrixABI *)&pitchTransform)->mulVector3(source);
        ((Rva006E0580MatrixABI *)&angleTransform)->mulVector3(source);
        source.X += pos.x;
        source.Y += pos.y;
        source.Z += pos.z;
        target.X += pos.x;
        target.Y += pos.y;
        target.Z += pos.z;
    } else {
        source.Z += state->pad2C;
        target.Z += state->pad2C;
    }
    target.Z += state->finalHeight48;
    // do m_FXPitch adjustment.
    //WST Real height = sourcePos.Z - targetPos.Z;
    //WST height *= m_FXPitch;
    //WST targetPos.Z = sourcePos.Z - height;
    // The following code moves camera down and pitch up when player zooms in.
    // Use scripts to switch to useRealZoomCam
    if (useRealZoomCam) {
        float pitch_adjust = 1.0f;
        if (!((Rva006E0580DisplayABI *)TheDisplay)->isLetterBoxed()) {
            float capped_zoom = state->groundLevel;
            if (capped_zoom > 1.0f) capped_zoom = 1.0f;
            if (capped_zoom < 0.5f) capped_zoom = 0.5f;
            source.Z = source.Z * (0.25f + capped_zoom * 0.75f); // move camera down physically
            pitch_adjust = capped_zoom; // adjust camera to pitch up
        }
        state->fxPitchA0 = 0.25f + pitch_adjust * 0.75f;
        source.X = target.X + ((source.X - target.X) / state->fxPitchA0);
        source.Y = target.Y + ((source.Y - target.Y) / state->fxPitchA0);
    } else {
        if (state->flag9C) {
            if (flag1E) flag1E = false;
            previousSource = source;
            float dx = target.X - source.X;
            float dy = target.Y - source.Y;
            float distance = sqrtf(dx * dx + dy * dy);
            float height = tanf(state->fxPitchA0) * distance;
            target.Z = source.Z - height;
        } else if (state->fxPitchA0 <= 1.0f) {
            float height = source.Z - target.Z;
            height *= state->fxPitchA0;
            target.Z = source.Z - height;
        } else {
            source.X = target.X + ((source.X - target.X) / state->fxPitchA0);
            source.Y = target.Y + ((source.Y - target.Y) / state->fxPitchA0);
        }
    }
    if (state->flagA8) {
        Vector3 delta = state->source - source;
        source = state->source;
        target += delta;
        state->velocity = state->position;
        pos.x += delta.X;
        pos.y += delta.Y;
        state->position = state->velocity;
        if (!state->flagA9) state->flagA8 = false;
    }
    //m_3DCamera->Set_View_Plane(DEG_TO_RADF(50.0f));
    //DEBUG_LOG(("zoom %f, SourceZ %f, posZ %f, groundLevel %f CamOffZ %f\n",
    //           zoom, sourcePos.Z, pos.z, groundLevel,m_cameraOffset.z));
    state->source = source;
    state->target = target;
    state->distance = (state->source - state->target).Length();
    if (!state->useRealZoom) adjustTarget(&source, &target, state);
    if (state->direction.Length2() > 0.0f) target = state->direction;
    // build new camera transform
    state->transform->Make_Identity();
    state->transform->Look_At(source, target, state->lookAngle);
    if (!state->useRealZoom) {
        //WST 11/12/2002 New camera shaker system 
        (*(CameraShakeSystemClass **)&CameraShakerSystem)->Timestep(1.0f / 30.0f);
        (*(CameraShakeSystemClass **)&CameraShakerSystem)->Update_Camera_Shaker(source, &state->shakerAngles);
        state->transform->Rotate_X(state->shakerAngles.X);
        state->transform->Rotate_Y(state->shakerAngles.Y);
        state->transform->Rotate_Z(state->shakerAngles.Z);
    }
    //if (m_shakerAngles.X >= 0.0f)
    //{
    //    DEBUG_LOG(("m_shakerAngles %f, %f, %f\n", m_shakerAngles.X, m_shakerAngles.Y, m_shakerAngles.Z));
    //}
    // (gth) check if the camera is being controlled by an animation
    if (state->cameraSlaved) {
        // find object named m_cameraSlaveObjectName
        Object *obj = ((Rva006E0580ScriptABI *)TheScriptEngine)->getUnitNamed(state->slaveObjectName);
        if (obj != 0) {
            // dig out the drawable
            Drawable *draw = ((Rva006E0580ObjectABI *)obj)->getDrawable();
            if (draw != 0) {
                // dig out the first draw module with an ObjectDrawInterface
                for (DrawModule **dm = getDrawModules(draw); *dm; ++dm) {
                    const ObjectDrawInterface *di = ((Rva006E0580DrawModuleABI *)*dm)->getObjectDrawInterface();
                    if (di != 0) {
                        Matrix3D tm;
                        di->clientOnly_getRenderObjBoneTransform(state->slaveBoneName, &tm);
                        // Ok, slam it into the camera!
                        *state->transform = tm;
                        //--------------------------------------------------------------------
                        // WST 10.22.2002. Update the Listener positions used by audio system
                        //--------------------------------------------------------------------
                        Vector3 position = state->transform->Get_Translation();
                        state->position.x = position.X;
                        state->position.y = position.Y;
                        state->position.z = position.Z;
                        //DEBUG_LOG(("mpos x%f, y%f, z%f\n", m_pos.x, m_pos.y, m_pos.z ));
                        break;
                    }
                }
            } else { state->cameraSlaved = false; }
        } else { state->cameraSlaved = false; }
    }
    state->transform->Rotate_Y(state->finalAngle);
    if (state->useRealZoom && state->finalLookAt) {
        target.X += (source.X - target.X) / (state->fxPitchA0 + 90.0f);
        target.Y += (source.Y - target.Y) / (state->fxPitchA0 + 90.0f);
        state->transform->Look_At(source, target, 0.0f);
        state->source = source;
        state->target = target;
    }
}
} // namespace FXParticleSystem
