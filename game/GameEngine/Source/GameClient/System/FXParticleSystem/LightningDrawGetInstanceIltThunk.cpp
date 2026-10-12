// RVA 0x0003E130: incremental-link thunk, a single jmp to
// FXParticleSystem::ConcreteModuleClass<LightningDraw tag>::getInstance
// (RVA 0x005DF510, matched in LightningDrawConcreteModuleClassGetInstance.cpp).
namespace FXParticleSystem
{
template <int N> class DefaultParticleModule;
template <int N> class DefaultParticleModuleTemplate;
class LightningDrawModule;
class LightningDrawModuleTemplate;

extern const char LIGHTNING_DRAW_MODULE_KEY[1];
extern const char LIGHTNING_DRAW_MODULE_NAME[1];

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

typedef ModuleTag<6, LIGHTNING_DRAW_MODULE_KEY,
	LIGHTNING_DRAW_MODULE_NAME,
	LightningDrawModule, LightningDrawModuleTemplate,
	DefaultParticleModule<6>, DefaultParticleModuleTemplate<6> >
	LightningDrawTag;
}

void j_0003e130()
{
	FXParticleSystem::ConcreteModuleClass<FXParticleSystem::LightningDrawTag>::getInstance();
}
