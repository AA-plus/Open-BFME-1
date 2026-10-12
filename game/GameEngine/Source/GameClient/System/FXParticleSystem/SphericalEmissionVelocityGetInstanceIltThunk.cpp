// RVA 0x000078A1: incremental-link thunk, a single jmp to
// FXParticleSystem::ConcreteModuleClass<SphericalEmissionVelocity tag>::getInstance
// (RVA 0x005E0CB0, matched in SphericalEmissionVelocityConcreteModuleClassGetInstance.cpp).
namespace FXParticleSystem
{
template <int N> class DefaultParticleModule;
template <int N> class DefaultParticleModuleTemplate;
class SphericalEmissionVelocityModule;
class SphericalEmissionVelocityModuleTemplate;

extern const char SPHERICAL_EMISSION_VELOCITY_MODULE_KEY[1];
extern const char SPHERICAL_EMISSION_VELOCITY_MODULE_NAME[1];

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

typedef ModuleTag<4, SPHERICAL_EMISSION_VELOCITY_MODULE_KEY,
	SPHERICAL_EMISSION_VELOCITY_MODULE_NAME,
	SphericalEmissionVelocityModule, SphericalEmissionVelocityModuleTemplate,
	DefaultParticleModule<4>, DefaultParticleModuleTemplate<4> >
	SphericalEmissionVelocityTag;
}

void j_000078a1()
{
	FXParticleSystem::ConcreteModuleClass<FXParticleSystem::SphericalEmissionVelocityTag>::getInstance();
}
