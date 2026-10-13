// ?d_001b3b70@@YAXXZ
// partial score=0.5946 date=2026-10-13
// ?rva001B3B70@GhostObject@@UAEXPAVXfer@@@Z (table ??_7GhostObject@@6B@ slot 3; ILT window rejects ?xfer@GhostObject)
// cl: /DNDEBUG /MD /EHsc

typedef int ObjectID;
#define NULL 0
#define INVALID_ID 0

struct XferVersion
{
	unsigned char m_version;
	unsigned char m_currentVersion;
};

struct XferException
{
	void *text;
	int tag;
};

extern "C" XferException *__cdecl bfmeFormatText(
	XferException *result, int tag, const char *format, ...);
__declspec(noreturn) void __stdcall _CxxThrowException(void *object, void *throwInfo);
extern int g_guardTargetTypeThrowInfo;

class Xfer
{
public:
	virtual void slot00();
	virtual bool isLoading();
	virtual void slot08();
	virtual void slot0c();
	virtual bool isLightCRC();
	virtual void slot14();
	virtual void slot18();
	virtual void slot1c();
	virtual void slot20();
	virtual void slot24();
	virtual void xferVersion(XferVersion *version);
	virtual void slot2c();
	virtual void slot30();
	virtual void slot34();
	virtual void slot38();
	virtual void slot3c();
	virtual void slot40();
	virtual void slot44();
	virtual void slot48();
	virtual void slot4c();
	virtual void slot50();
	virtual void slot54();
	virtual void slot58();
	virtual void slot5c();
	virtual void slot60(void *value);
	virtual void slot64();
	virtual void slot68();
	virtual void slot6c(void *value);
};

class MidVirtualSlot90Receiver;
Xfer &Rva0010C3C0(MidVirtualSlot90Receiver *receiver, void *value);

class Object
{
public:
	ObjectID getID() const { return m_id; }
private:
	unsigned char m_pad[0x74];
	ObjectID m_id;
};

class GameLogic
{
public:
	Object *findObjectByID(ObjectID id);
};
extern GameLogic *TheGameLogic;

class GhostObject
{
public:
	virtual ~GhostObject();
	virtual void slot04();
	virtual void slot08();
	virtual void rva001B3B70(Xfer *xfer);

private:
	unsigned char m_pad04[8];
	Object *m_parentObject;
	unsigned char m_field10[0xc];
	unsigned char m_field1c[4];
};

void GhostObject::rva001B3B70(Xfer *xfer)
{
	if (xfer->isLightCRC())
		return;

	union { XferVersion version; XferException error; } local;
	local.version.m_version = 1;
	local.version.m_currentVersion = 1;
	xfer->xferVersion(&local.version);

	ObjectID parentObjectID = INVALID_ID;
	if (m_parentObject)
		parentObjectID = m_parentObject->getID();
	Rva0010C3C0((MidVirtualSlot90Receiver *)xfer, &parentObjectID);
	if (xfer->isLoading())
	{
		ObjectID id = parentObjectID;
		m_parentObject = TheGameLogic->findObjectByID(id);
		if (id != INVALID_ID && m_parentObject == NULL)
		{
			bfmeFormatText(&local.error, 5, 0);
			_CxxThrowException(&local.error, &g_guardTargetTypeThrowInfo);
		}
	}

	xfer->slot6c(m_field1c);
	xfer->slot60(m_field10);
}
