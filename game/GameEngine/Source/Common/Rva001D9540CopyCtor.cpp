// Retail 0x001D9540, 67 bytes: ??0Rva001D9540@@QAE@ABV0@@Z, an address-derived
// STLport vector copy constructor.  Inline size(), begin() and end() produce the
// retail register order.  The three out-of-line helpers are still machine dumps;
// the externs below carry the ledger names pinned in symbols.csv, and the pin
// lines keep the exact addresses (0x00044166 -> 0x001D95A0 get_allocator,
// 0x0001D949 -> 0x001D95B0 _Vector_base, 0x00018179 -> 0x00065E30 __copy_trivial).
// cl: /DNDEBUG /MD /EHsc

// not verified this source.
struct Rva001D9540Alloc
{
	char m_pad;

	Rva001D9540Alloc();
	Rva001D9540Alloc(const Rva001D9540Alloc &other);
};

class Rva001D9540
{
public:
	Rva001D9540(const Rva001D9540 &src);

	Rva001D9540Alloc allocatorValue() const;
	void initializeBase(unsigned int count, const Rva001D9540Alloc &alloc);
	unsigned int size() const
	{
		return (unsigned int)(m_end - m_begin);
	}
	void **begin() const { return m_begin; }
	void **end() const { return m_end; }

	void **m_begin;
	void **m_end;
};

extern "C" void *__cdecl __identifier("?__copy_trivial@_STL@@YAPAXPBX0PAX@Z")(const void *first, const void *last, void *dst);

Rva001D9540::Rva001D9540(const Rva001D9540 &src)
{
	initializeBase(src.size(), src.allocatorValue());

	m_end = (void **)__identifier("?__copy_trivial@_STL@@YAPAXPBX0PAX@Z")(src.begin(), src.end(), begin());
}
