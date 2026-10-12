// RVA 0x000101A9: incremental-link thunk, a single jmp to
// ConcreteModuleClass<PointEmissionVolumeModuleTag>::getInstance at RVA
// 0x005E1370 (the ledger's matched body whose export_rva is this thunk).
namespace FXParticleSystem
{
struct PointEmissionVolumeModuleTag;

template <class Tag>
class ConcreteModuleClass
{
public:
	static const ConcreteModuleClass &getInstance();
};
}

void j_000101a9()
{
	FXParticleSystem::ConcreteModuleClass<FXParticleSystem::PointEmissionVolumeModuleTag>::getInstance();
}
