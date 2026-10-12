// ?init@Rva008824E0Block@@QAEXI@Z
// partial score=0.9904 date=2026-10-13
// Best candidate for ?d_008824e0@@YAXXZ at 0x008824E0 (104 B).
// Identity: an unsigned init for the guard block already landed as
// Rva00882580Block in game/Libraries/Source/memorypool/memorypool_allocator.cpp:
// same fields 00/08, same 0x0BADF00D guard words and 0xDEADC0DE payload fill as
// Rva00882580Block::check/setUsed, same globals. No caller proves the member,
// so keep the address-derived class (or land as Rva00882580Block::init).
// Residue: 1 SIB byte at +0x35. Retail lea eax,[edx+esi+0xc]; ours
// lea eax,[esi+edx+0xc], same two registers. /Oa (the TU's real flags), this
// plain pointer-first spelling, int-first, casts, locals, &str[size] and
// helper forms all leave the byte; docs/shape_levers.md "The two-register lea
// operand order is not a spelling" records four more bodies with the same
// compiler-internal base/index swap.
extern int Rva0130EA00GuardWords;
extern unsigned int g_rva0130EA04;
void memset32(void *ptr, int value, unsigned int bytesToFill);

class Rva008824E0Block
{
public:
	void init(unsigned int used);
private:
	void *m_field00;
	void *m_field04;
	unsigned int m_size08;
};

void Rva008824E0Block::init(unsigned int used)
{
	m_size08 = used;
	unsigned int guardWords = Rva0130EA00GuardWords;
	m_field00 = 0;
	if (guardWords != 0)
	{
		unsigned int guardBytes = guardWords * 4;
		memset32((char *)this - guardBytes, 0x0BADF00D, guardBytes);
		memset32((char *)this + m_size08 + 0x0c, 0x0BADF00D, guardBytes);
	}
	if (g_rva0130EA04 != 0)
	{
		unsigned int size = m_size08;
		memset32((char *)this + 0x0c, 0xDEADC0DE, size);
	}
}
