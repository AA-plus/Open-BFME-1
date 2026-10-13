// ?bfmeMarkAB@BfmeOwnAB@@QAEXPAXABVBfmeRoomAB@@@Z
// partial score=0.8421 date=2026-10-13
// cl: /DNDEBUG /MD /O2 /EHsc /Igame/Libraries/Source/WWVegas/WWLib
// ?bfmeMarkAB@BfmeOwnAB@@QAEXPAXABVBfmeRoomAB@@@Z (identity unknown)
// Native one-word string payload: matched Rva006F9900Find.cpp accepts
// AsciiString by value and destroys it; inline copy/dtor forwards to StringBase.

#include "ascii_string.h"
class BfmeRoomAB
{
public:
	BfmeRoomAB(const BfmeRoomAB &other) : m_bfmeHandleAB(other.m_bfmeHandleAB) {}
	~BfmeRoomAB() {}

	AsciiString m_bfmeHandleAB;
};

class ClientRoot4120
{
public:
	virtual void bfmeCrSlot00AB(void);
	virtual void bfmeCrSlot01AB(void);
	virtual void bfmeCrSlot02AB(void);
	virtual void bfmeCrSlot03AB(void);
	virtual void bfmeCrSlot04AB(void);
	virtual void bfmeCrSlot05AB(void);
	virtual void bfmeCrSlot06AB(void);
	virtual void bfmeCrSlot07AB(void);
	virtual void bfmeCrSlot08AB(void);
	virtual void bfmeCrSlot09AB(void);
	virtual void bfmeCrSlot10AB(void);
	virtual int bfmeCheckAB(void *first);
};

extern ClientRoot4120 *TheGameClient;

class BfmeNodeAB
{
public:
	unsigned char m_bfmeHeadAB[0x95];
	char m_bfmeMarkAB;
};

class BfmeOwnAB
{
public:
	void bfmeMarkAB(void *first, const BfmeRoomAB &room);
	BfmeNodeAB *bfmeFindAB(void *first, BfmeRoomAB room);

	unsigned char m_bfmeHeadAB[0x28];
	char m_bfmeFlagAB;
};

void BfmeOwnAB::bfmeMarkAB(void *first, const BfmeRoomAB &room)
{
	ClientRoot4120 *client = TheGameClient;

	if (client == 0)
		return;

	void *target = first;
	BfmeNodeAB *node;

	if (client->bfmeCheckAB(target) && m_bfmeFlagAB
		&& (node = bfmeFindAB(target, room)) != 0)
		node->m_bfmeMarkAB = 1;
}
