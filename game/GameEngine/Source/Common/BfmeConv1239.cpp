// Open-BFME5 conversions.

class BfmeE1239
{
public:
	virtual void bfmeV1239A();
	virtual void bfmeV1239B();
	unsigned m_bfme04;
};

class BfmeA1239
{
public:
	int m_bfme00;
	int m_bfme04;
	BfmeE1239 **m_bfme08;
};

// Retail calls the numeric coercion and factory bodies owned by the Apt TUs:
// 00898300, 008983D0, 008A11E0 and 008A4CD0. No Apt header exists in game/.
class AptValue
{
public:
	int toInteger() const;
	float toNumber();
};

class AptInteger
{
public:
	static AptInteger *Create(int value);
};

extern AptValue *g_bfmeFallbackDB;

unsigned int AptGetSwfVersion(void);
AptValue *Rva008A4EA0MakeFloat(float value);

void bfmeGo1239(BfmeA1239 *a)
{
	BfmeE1239 *e;
	BfmeE1239 *v;

	e = a->m_bfme08[a->m_bfme00 - 1];

	v = 0;
	if (AptGetSwfVersion() == 7 && ((unsigned char)(~(e->m_bfme04 >> 15)) & 1))
		v = (BfmeE1239 *)g_bfmeFallbackDB;

	if (!v) {
		if ((e->m_bfme04 & 0x3f) == 7 && !((unsigned char)(~(e->m_bfme04 >> 15)) & 1))
			v = (BfmeE1239 *)AptInteger::Create(((AptValue *)e)->toInteger() + 1);
		else
			// VA 01075334 holds the four-byte 1.0f operand, independently
			// verified by data_rows.csv and AptValue::toNumber.
			v = (BfmeE1239 *)Rva008A4EA0MakeFloat(((AptValue *)e)->toNumber() + 1.0f);
	}

	e = a->m_bfme08[a->m_bfme00 - 1];
	if (!((unsigned char)(e->m_bfme04 >> 30) & 1))
		e->bfmeV1239B();
	--a->m_bfme00;
	a->m_bfme08[a->m_bfme00] = v;
	++a->m_bfme00;
	if (!((unsigned char)(v->m_bfme04 >> 30) & 1))
		v->bfmeV1239A();
}
