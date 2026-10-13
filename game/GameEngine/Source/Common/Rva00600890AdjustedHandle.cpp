// cl: /DNDEBUG /MD /EHs-c-
// Retail 0x00600890, 46 bytes (ret 4 at +0x2B): the override the adjustor
// thunk at 0x005E7BF0 (AdjustorThunks.cpp, `sub ecx,0xC`) enters, also reached
// through ILT 0x00044D37. The thunk steps back from the secondary base at
// +0x0C, and the body hands that same sub-object to the matched
// Gen_006007A0::bfmeSeed (0x006007A0) after seeding the target with the
// {1,1} pair through its slot 10 -- the shape of the sibling seeders in
// S3SeedPairsHoisted.cpp. The single stack argument is the target that
// bfmeSeed's pinned signature already types as BfmeSeedTarget*.
//
// Owner and method names stay address-derived; the identity is not recovered.

// upstream layout: game/GameEngine/Source/Common/S3SeedPairsHoisted.cpp
struct BfmeSeedPair
{
	unsigned char m_bfmeFirst;
	unsigned char m_bfmeSecond;
};

// upstream layout: game/GameEngine/Source/Common/S3SeedPairsHoisted.cpp
class BfmeSeedTarget
{
public:
	virtual void bfmeSlot0(void);
	virtual void bfmeSlot1(void);
	virtual bool bfmeSlot2(void);
	virtual void bfmeSlot3(void);
	virtual bool bfmeSkip(void);			// slot 4, vtable+0x10
	virtual void bfmeSlot5(void);
	virtual void bfmeSlot6(void);
	virtual void bfmeSlot7(void);
	virtual void bfmeSlot8(void);
	virtual void bfmeTakeAt24(void *item, int size);	// slot 9, vtable+0x24
	virtual void bfmeSeed(BfmeSeedPair *pair);	// slot 10, vtable+0x28
};

class Rva005E7BF0Lead
{
public:
	virtual void handle(BfmeSeedTarget *target);

private:
	char m_fill[0x0C - 4];
};

// The secondary base at +0x0C.
class Gen_006007A0
{
public:
	virtual void handle(BfmeSeedTarget *target);
	void bfmeSeed(BfmeSeedTarget *target);
};

class Rva005E7BF0 : public Rva005E7BF0Lead, public Gen_006007A0
{
public:
	virtual void handle(BfmeSeedTarget *target);
};

void Rva005E7BF0::handle(BfmeSeedTarget *target)
{
	BfmeSeedPair pair;
	pair.m_bfmeFirst = 1;
	pair.m_bfmeSecond = 1;
	target->bfmeSeed(&pair);
	Gen_006007A0::bfmeSeed(target);
}
