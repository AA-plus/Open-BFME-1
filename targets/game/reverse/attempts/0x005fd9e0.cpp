// ??0DefaultPhysicsModuleInfo@FXParticleSystem@@QAE@XZ
// partial score=0.8791 date=2026-10-11
// cl: /DNDEBUG /DWIN32 /D_WINDOWS /MD /EHsc /Igame/GameEngine/Source/Common/System

#define SNAPSHOT_CPP
#include "snapshot.h"

inline Snapshot::Snapshot() {}

#include "game_client_random_variable.h"

struct Rva005FD9E0Scalar
{
 Rva005FD9E0Scalar(int value) : at00(value) {}
 int at00;
};

namespace FXParticleSystem
{

class DefaultPhysicsModuleInfo : public Snapshot
{
public:
	DefaultPhysicsModuleInfo();
	virtual ~DefaultPhysicsModuleInfo();
    virtual const char *GetSnapshotName();
    virtual void LoadPostProcess();
    virtual void DoXfer(Xfer &xfer);

private:
	float m_field0;
	float m_field1;
	float m_field2;
	Rva005FD9E0Scalar m_field3;
	GameClientRandomVariable m_var1;
};

// ??0DefaultPhysicsModuleInfo@FXParticleSystem@@QAE@XZ
DefaultPhysicsModuleInfo::DefaultPhysicsModuleInfo()
    : m_field3(0)
{
	m_field0 = 0.0f;
	m_field1 = 0.0f;
	m_field2 = 0.0f;
	m_var1.setRange(0.0f, 0.0f, GameClientRandomVariable::UNIFORM);
}

}
