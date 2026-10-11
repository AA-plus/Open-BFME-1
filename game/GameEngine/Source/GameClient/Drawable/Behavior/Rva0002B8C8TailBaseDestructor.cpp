// cl: /DNDEBUG /MD /EHsc
//
// ??1Rva0002B8C8TailBase@@UAE@XZ at RVA 0x00113E60 (7 bytes).
// The ModelCondition/Random/Upgrade sound-selector client behavior destructors
// reach it through ILT 0x0002B8C8. The class adds no cleanup; only the base
// vtable 0x01073744 (recorded as Inner01073744) is restored.

class Inner01073744
{
public:
	virtual ~Inner01073744() {}
};

class Rva0002B8C8TailBase : public Inner01073744
{
public:
	virtual ~Rva0002B8C8TailBase();
};

Rva0002B8C8TailBase::~Rva0002B8C8TailBase()
{
}
