// ??0ScriptList@@QAE@ABV0@@Z
// Retail 0x0035E3B0: 123-byte ScriptList copy constructor. Identity comes from
// the vtable it installs: 0x010E8CA8 is ??_7ScriptList@@6B@ (dir32_addresses.csv),
// and the Snapshot base installs ??_7Snapshot@@6B@ at 0x01073744, whose cleanup
// (EH state 0) is the matched ??1Snapshot@@UAE@XZ at 0x0005C520. The matched caller
// Rva0019F890FillHelper.cpp constructs a 0x4C ScriptList through ILT 0x00020D92
// (target FUN_0075e3b0); the copy-ctor shape follows the Q4NewOwnerFactories
// family, landed at 0x005EC600 as ??0Rva005EC600@@QAE@ABV0@@Z.
// cl: /DNDEBUG /MD /EHsc

extern "C" void _ReadWriteBarrier();
#pragma intrinsic(_ReadWriteBarrier)

class Snapshot
{
public:
	__forceinline Snapshot() { _ReadWriteBarrier(); }
	virtual ~Snapshot();
};

class Rva003525E0Pair
{
public:
	Rva003525E0Pair(const Rva003525E0Pair &other);
	~Rva003525E0Pair();

private:
	void *m_a;
	void *m_b;
};

static Rva003525E0Pair &rva0035E3B0Link(const void *other)
{
	return *(Rva003525E0Pair *)(other ? (const char *)other + 4 : 0);
}

class NestedAt0C
{
public:
	NestedAt0C(const NestedAt0C &other);
	~NestedAt0C();
private:
	unsigned char m_data[0x20];
};

class NestedAt2C
{
public:
	NestedAt2C(const NestedAt2C &other);
private:
	unsigned char m_data[0x20];
};

class ScriptList : public Snapshot, public Rva003525E0Pair
{
public:
	ScriptList(const ScriptList &other);
	virtual ~ScriptList();

private:
	NestedAt0C m_at0C;
	NestedAt2C m_at2C;
};

static NestedAt0C &hostAt0C(const void *other)
{
	return *(NestedAt0C *)((const char *)other + 0xC);
}

static NestedAt2C &hostAt2C(const void *other)
{
	return *(NestedAt2C *)((const char *)other + 0x2C);
}

ScriptList::ScriptList(const ScriptList &other)
	: Rva003525E0Pair(rva0035E3B0Link(&other)),
	  m_at0C(hostAt0C(&other)),
	  m_at2C(hostAt2C(&other))
{
}
