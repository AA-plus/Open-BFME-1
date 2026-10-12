// RVA 0x00026058: incremental-link thunk, a single jmp to the SphereEmissionVolume
// ConcreteModuleClass::getInstance at RVA 0x005E1830 (the ledger's matched body
// whose export_rva is this thunk).  Template spelling follows
// QuadDrawConcreteModuleClassGetInstance.cpp.
namespace FXParticleSystem
{
template <int N> class DefaultParticleModule;
template <int N> class DefaultParticleModuleTemplate;
class SphereEmissionVolumeModule;
class SphereEmissionVolumeModuleTemplate;

extern const char SPHERE_EMISSION_VOLUME_MODULE_KEY[1];
extern const char SPHERE_EMISSION_VOLUME_MODULE_NAME[1];

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

typedef ModuleTag<5, SPHERE_EMISSION_VOLUME_MODULE_KEY, SPHERE_EMISSION_VOLUME_MODULE_NAME,
	SphereEmissionVolumeModule, SphereEmissionVolumeModuleTemplate,
	DefaultParticleModule<5>, DefaultParticleModuleTemplate<5> > SphereEmissionVolumeTag;
}

void j_00026058()
{
	FXParticleSystem::ConcreteModuleClass<FXParticleSystem::SphereEmissionVolumeTag>::getInstance();
}
