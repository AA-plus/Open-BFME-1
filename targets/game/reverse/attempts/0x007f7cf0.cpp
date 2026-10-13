// ?rva007F7CF0@Rva007F7CF0Owner@@QAEXPAXPAUBfmeThingVFD@@@Z
// partial score=0.012 date=2026-10-13
// Retail007F7CF0 ends ret8 at+A4, INT3+A7. Bank ABI corrected from
// (task,resource) to (resource,task): entry task load is original ESP+8.
// Slot4/8 getters take writable output storage and return its readable pointer;
// retail saves the first EAX across the second call and dereferences both.
// Existing identifier spellings retained; no semantic identity inferred.
// Literal at VA0112B7E0 is probe err %d\n, not a numeric address operand.
// Callee getter uses pinned pointer return; bfmeGoVFD takes struct pointer.
// Vtable0112B7F0 slot0 and ctor7F7FA0/dtor7F8090 establish receiver family.
// Still not exact: local frame and allocation of getter/result slots differ.
// cl: /DNDEBUG /DWIN32 /D_WINDOWS /MD /EHs-c-

struct Rva007EB810Diag;
Rva007EB810Diag *Rva007EB810Get( void );

struct Rva007F7CF0Registry
{
	void **m_vtable;
};
typedef void ( __cdecl *Rva007F7CF0RegFn2 )( void *, int, const char *, void * );

class Rva007F7CF0Handle
{
public:
	Rva007F7CF0Handle() {}
	Rva007F7CF0Handle( const Rva007F7CF0Handle & );
	int m_id;
};

struct BfmeThingVFD
{
public:
	virtual void slot00();
	virtual Rva007F7CF0Handle *getA(Rva007F7CF0Handle *);
	virtual Rva007F7CF0Handle *getB(Rva007F7CF0Handle *);
	void *m_04;
	int m_state;
};

void __stdcall bfmeGoVFD( BfmeThingVFD * );

class Rva007F7CF0Sibling
{
public:
	virtual void s00(); virtual void s01(); virtual void s02(); virtual void s03();
	virtual void s04(); virtual void s05(); virtual void s06(); virtual void s07();
	virtual void s08(); virtual void s09(); virtual void s0a(); virtual void s0b();
	virtual void s0c(); virtual void s0d(); virtual void s0e(); virtual void s0f();
	virtual void s10(); virtual void s11(); virtual void s12(); virtual void s13();
	virtual void s14(); virtual void s15(); virtual void s16();
	virtual void s17( int, int );
};

class Rva007F7CF0M14
{
public:
	virtual void t00(); virtual void t01(); virtual void t02(); virtual void t03();
	virtual void t04(); virtual void t05(); virtual void t06(); virtual void t07();
	virtual void t08(); virtual void t09(); virtual void t0a();
	virtual void t0b( BfmeThingVFD *, void * );
};

class Rva007F7CF0Owner
{
public:
	void rva007F7CF0( void *resource, BfmeThingVFD *task );

	void *m_00; // vtable install (not stored/used here)
	void *m_04;
	void *m_08;
	void *m_0c;
	void *m_10;
	Rva007F7CF0M14 *m_14;
};

void Rva007F7CF0Owner::rva007F7CF0( void *resource, BfmeThingVFD *task )
{
	if( !task || task->m_state != 4 )
		return;

	if( resource )
	{
		Rva007F7CF0Registry *reg = (Rva007F7CF0Registry *)Rva007EB810Get();
		Rva007F7CF0RegFn2 fn2 = (Rva007F7CF0RegFn2)reg->m_vtable[ 2 ];
		fn2( reg, 0, "probe err %d\n", resource );
		Rva007F7CF0Handle a, b;
		Rva007F7CF0Handle *ap = task->getA(&a);
		Rva007F7CF0Handle *bp = task->getB(&b);
		Rva007F7CF0Sibling *sibling = (Rva007F7CF0Sibling *)( (char *)this - 8 );
		sibling->s17( bp->m_id, ap->m_id );
		task->m_state = 0;
		m_14->t0b( task, resource );
		bfmeGoVFD( task );
	}
	else
	{
		task->m_state = 5;
		m_14->t0b( task, 0 );
	}
}
