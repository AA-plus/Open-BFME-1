// RVA 0x00015FB9: incremental-link thunk, a single jmp to
// FXParticleSystem::ConcreteModuleClass<DefaultModuleTag<1> >::getInstance
// (RVA 0x005DFD50, the ledger's matched body whose export_rva is this thunk).
namespace FXParticleSystem
{
template <int N> class DefaultModuleTag;

template <class Tag>
class ConcreteModuleClass
{
public:
    static const ConcreteModuleClass &getInstance();
};
}

void j_00015fb9()
{
    FXParticleSystem::ConcreteModuleClass<FXParticleSystem::DefaultModuleTag<1> >::getInstance();
}
