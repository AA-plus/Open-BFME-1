// RVA 0x000340FE: incremental-link thunk, a single jmp to the LightningEmission
// ConcreteModuleClass::getInstance at RVA 0x005E1B50 (the ledger's matched body
// whose export_rva is this thunk).  Template spelling follows
// QuadDrawConcreteModuleClassGetInstance.cpp.
namespace FXParticleSystem
{
template <int N> class DefaultParticleModule;
template <int N> class DefaultParticleModuleTemplate;
class LightningEmissionModule;
class LightningEmissionModuleTemplate;

extern const char LIGHTNING_EMISSION_MODULE_KEY[1];
extern const char LIGHTNING_EMISSION_MODULE_NAME[1];

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

typedef ModuleTag<5, LIGHTNING_EMISSION_MODULE_KEY, LIGHTNING_EMISSION_MODULE_NAME,
	LightningEmissionModule, LightningEmissionModuleTemplate,
	DefaultParticleModule<5>, DefaultParticleModuleTemplate<5> > LightningEmissionTag;
}

void j_000340fe()
{
	FXParticleSystem::ConcreteModuleClass<FXParticleSystem::LightningEmissionTag>::getInstance();
}
