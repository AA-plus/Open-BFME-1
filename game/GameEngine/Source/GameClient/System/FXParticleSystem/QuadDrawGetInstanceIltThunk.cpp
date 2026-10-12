// RVA 0x00015CBC: incremental-link thunk, a single jmp to the QuadDraw
// ConcreteModuleClass::getInstance at RVA 0x005DF120 (the ledger's matched
// body whose export_rva is this thunk).  Template spelling copied from
// QuadDrawConcreteModuleClassGetInstance.cpp.
namespace FXParticleSystem
{
template <int N> class DefaultParticleModule;
template <int N> class DefaultParticleModuleTemplate;
class QuadDrawModule;
class QuadDrawModuleTemplate;

extern const char QUAD_DRAW_MODULE_KEY[1];
extern const char QUAD_DRAW_MODULE_NAME[1];

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

typedef ModuleTag<6, QUAD_DRAW_MODULE_KEY, QUAD_DRAW_MODULE_NAME,
	QuadDrawModule, QuadDrawModuleTemplate,
	DefaultParticleModule<6>, DefaultParticleModuleTemplate<6> > QuadDrawTag;
}

void j_00015cbc()
{
	FXParticleSystem::ConcreteModuleClass<FXParticleSystem::QuadDrawTag>::getInstance();
}
