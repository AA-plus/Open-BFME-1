// Two more: another counted handle and a search that hands back the element
// before the match.

class BfmeThingCX
{
public:
	int m_bfmeHead;						// +0x00
	unsigned short m_bfmeRefs;				// +0x04
};

class BfmeHandleCX
{
public:
	BfmeHandleCX(void)
	{
		m_bfmeThing = 0;
	}

	BfmeHandleCX(const BfmeHandleCX &other)
	{
		BfmeThingCX *thing = other.m_bfmeThing;

		m_bfmeThing = thing;

		if (thing)
			++thing->m_bfmeRefs;
	}

	~BfmeHandleCX(void);

	BfmeThingCX *m_bfmeThing;				// +0x00
};

class MeshLoadContextClass
{
	friend class MeshModelClass;
	BfmeHandleCX Peek_Texture(int index);

private:
	char m_bfmeHead[0xF8];					// +0x00
	BfmeHandleCX *m_bfmeSlots;				// +0xF8
};

// ?Peek_Texture@MeshLoadContextClass@@AAE?AVBfmeHandleCX@@H@Z
BfmeHandleCX MeshLoadContextClass::Peek_Texture(int index)
{
	return m_bfmeSlots[index];
}

class BfmeItemED
{
public:
	char m_bfmeBody[0xBC];					// 188 bytes
};

class Gen_0075F1A0
{
public:
	BfmeItemED *bfmeFindPrevious(BfmeItemED *item) const;

private:
	int m_bfmeHead[9];					// +0x00
	BfmeItemED *m_bfmeStart;				// +0x24
	BfmeItemED *m_bfmeFinish;				// +0x28
};

// ?bfmeFindPrevious@Gen_0075F1A0@@QBEPAVBfmeItemED@@PAV2@@Z
BfmeItemED *Gen_0075F1A0::bfmeFindPrevious(BfmeItemED *item) const
{
	BfmeItemED *entry = m_bfmeStart;
	BfmeItemED *finish = m_bfmeFinish;

	BfmeItemED *previous = 0;

	while (entry != finish)
	{
		if (entry == item)
			return previous;

		previous = entry;

		++entry;
	}

	return 0;
}
