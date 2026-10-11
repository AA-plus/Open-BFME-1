// Retail 0x0026FA80: a thiscall predicate over this->[+0x08] (the "engaged"
// object) and one stack int. Five guarded checks run in sequence -- a shared
// query, a four-slot acceptance test, two derived byte flags fetched off the
// query result, a per-player field, and two direct flags on the engaged
// object itself -- and the function returns TRUE (blocked) the moment any
// one of them fails; only when every guard passes does it return FALSE
// (allowed). The owning class and the engaged object's real identity were
// not recovered across two prior passes, so every name below is
// address-derived. The existing matched callee rows at each ILT target
// provide the typed declarations used below (9C41 -> 1BE270,
// 2E85C -> 1E8930, 28F74 -> 1E1770, CCD4 -> 1E1780).

class AssistedTargetingObjectShim
{
public:
	void *find(int value);
};

class Object;

class Weapon
{
public:
	bool isWithinAttackRange(const Object *source, const Object *target, int mode) const;
};

class Rva001E1770ByteField
{
public:
	unsigned char get() const;
};

class Rva001E1780ByteField
{
public:
	unsigned char get() const;
};

class Player;

class Object
{
public:
	Player *getControllingPlayer(void) const;
};

// The object returned by bfmeAskCLE: only the +0x04 pointer used by the
// next two guards is witnessed.
class Rva0026FA80Query
{
public:
	unsigned char m_unmodelled_000[4];
	void *m_sub;
};

// The far tail of the engaged object: only the two witnessed flags and the
// pointer between them are named, everything else is unmodelled gap.
class Rva0026FA80Extra
{
public:
	unsigned char m_unmodelled_000[0x32f];
	unsigned char m_flag32f;
};

class Rva0026FA80Engaged
{
public:
	unsigned char m_unmodelled_000[0x1f5];
	unsigned char m_flag1f5;
	unsigned char m_unmodelled_1f6[0x204 - 0x1f6];
	Rva0026FA80Extra *m_extra;
};

class Rva0026FA80
{
public:
	bool evaluate(int value);

private:
	unsigned char m_unmodelled_000[8];
	Rva0026FA80Engaged *m_engaged;
};

bool Rva0026FA80::evaluate(int value)
{
	void *x;
	Rva0026FA80Query *query;
	Player *player;

	x = reinterpret_cast<AssistedTargetingObjectShim *>(m_engaged)->find(0);
	if (x)
	{
		if (!reinterpret_cast<Weapon *>(x)->isWithinAttackRange(
				reinterpret_cast<const Object *>(m_engaged), reinterpret_cast<const Object *>(value), 0))
		{
			query = reinterpret_cast<Rva0026FA80Query *>(x);

			if (!reinterpret_cast<Rva001E1770ByteField *>(query->m_sub)->get())
			{
				if (!reinterpret_cast<Rva001E1780ByteField *>(query->m_sub)->get())
				{
					player = reinterpret_cast<Object *>(m_engaged)->getControllingPlayer();

					if (!*reinterpret_cast<int *>(reinterpret_cast<char *>(player) + 0x2c))
					{
						if (m_engaged->m_extra)
						{
							if (!m_engaged->m_extra->m_flag32f)
							{
								if (!m_engaged->m_flag1f5)
									return false;
							}
						}
					}
				}
			}
		}
	}

	return true;
}
