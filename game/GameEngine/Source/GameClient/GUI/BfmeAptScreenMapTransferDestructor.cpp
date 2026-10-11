// cl: /DNDEBUG /MD /EHsc
//
// ??1BfmeAptScreenMapTransfer@@MAE@XZ at RVA 0x00510310 (7 bytes).
// The scalar-deleting wrapper in BfmeAptScreenMapTransferDeletingDestructor.cpp
// reaches this body through ILT 0x0000118B. The class adds no cleanup; only the
// base vtable 0x010EAD58 (recorded as Inner010EAD58) is restored.

class Inner010EAD58
{
public:
	virtual ~Inner010EAD58() {}
};

class BfmeAptScreenMapTransfer : public Inner010EAD58
{
protected:
	virtual ~BfmeAptScreenMapTransfer();
};

BfmeAptScreenMapTransfer::~BfmeAptScreenMapTransfer()
{
}
