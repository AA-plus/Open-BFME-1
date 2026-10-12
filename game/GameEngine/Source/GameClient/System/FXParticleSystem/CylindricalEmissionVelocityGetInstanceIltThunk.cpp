// RVA 0x0003D875: incremental-link thunk, a single jmp to the CylindricalEmissionVelocity
// ConcreteModuleClass::getInstance at RVA 0x005E1010 (the ledger's matched body
// whose export_rva is this thunk).  Template spelling follows
// QuadDrawConcreteModuleClassGetInstance.cpp.
namespace FXParticleSystem
{
template <int N> class DefaultParticleModule;
template <int N> class DefaultParticleModuleTemplate;
class CylindricalEmissionVelocityModule;
class CylindricalEmissionVelocityModuleTemplate;

extern const char CYLINDRICAL_EMISSION_VELOCITY_MODULE_KEY[1];
extern const char CYLINDRICAL_EMISSION_VELOCITY_MODULE_NAME[1];

template <int Category, const char (&Key)[1], const char (&Name)[1],
	class Module, class ModuleTemplate, class ParticleModule,
	class ParticleModuleTemplate>
class ModuleTag;

template <class Tag>
class ConcreteModuleClass
{
public:
	static const ConcreteModuleClass &getInstance();
};

typedef ModuleTag<4, CYLINDRICAL_EMISSION_VELOCITY_MODULE_KEY, CYLINDRICAL_EMISSION_VELOCITY_MODULE_NAME,
	CylindricalEmissionVelocityModule, CylindricalEmissionVelocityModuleTemplate,
	DefaultParticleModule<4>, DefaultParticleModuleTemplate<4> > CylindricalEmissionVelocityTag;
}

void j_0003d875()
{
	FXParticleSystem::ConcreteModuleClass<FXParticleSystem::CylindricalEmissionVelocityTag>::getInstance();
}
