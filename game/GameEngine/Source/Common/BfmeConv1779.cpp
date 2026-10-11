class BfmeAiDataDC
{
public:
	unsigned char m_bfmeHeadDC[0xc4];
	float m_bfmeScaleDC;
};

class AI
{
public:
	unsigned char m_bfmeHeadDC[0x14];
	BfmeAiDataDC *m_bfmeDataDC;
};

extern AI *TheAI;
// 1.15f in .rdata at VA 0x01096490 (four bytes between two strings).
float g_bfmeFactorDC = 1.15f;

// 0x001E1770: byte accessor at this+0x4ED.
class Rva001E1770ByteField
{
public:
	unsigned char get(void) const;
};

class BfmeHolderDC
{
public:
	unsigned char m_bfmeHeadDC[4];
	Rva001E1770ByteField *m_bfmeSubDC;
};

class BfmeSrcDC;

// 0x001BE270 via ILT 0x9C41.
class AssistedTargetingObjectShim
{
public:
	void *find(int flag);
};

float __cdecl bfmeScaleDC(BfmeSrcDC *source)
{
	float value = TheAI->m_bfmeDataDC->m_bfmeScaleDC;

	AssistedTargetingObjectShim *shim = reinterpret_cast<AssistedTargetingObjectShim *>(source);
	if (shim->find(0) != 0 && static_cast<BfmeHolderDC *>(shim->find(0))->m_bfmeSubDC->get())
		return *(volatile float *)&value * g_bfmeFactorDC;

	return value;
}
