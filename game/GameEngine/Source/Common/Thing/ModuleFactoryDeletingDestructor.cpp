// cl: /DNDEBUG /MD /EHsc
//
// ModuleFactory's scalar-deleting destructor at retail RVA 0x001295C0
// (30 bytes): it runs ModuleFactory::~ModuleFactory (0x00128FA0, through ILT
// 0x000248E8; ModuleFactoryDestructor.cpp) and frees the object when bit 0 of
// the flag is set. ilt_oracle CONFIRMS ??_GModuleFactory@@UAEPAXI@Z here.

class ModuleFactory
{
public:
	virtual ~ModuleFactory();

protected:
	// Protected stand-in constructor so the forcer can install the vftable;
	// its unreferenced IAE COMDAT never clashes with the real public
	// constructor (0x00128E30).
	ModuleFactory() {}
	friend void Force_ModuleFactory_Deleting_Destructor();
};

void Force_ModuleFactory_Deleting_Destructor()
{
	ModuleFactory value;
}
