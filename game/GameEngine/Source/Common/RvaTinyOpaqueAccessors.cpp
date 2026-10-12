// cl: /O2 /DNDEBUG /DWIN32 /D_WINDOWS /MD

class Rva000B55D0
{
public:
	int bit(void);

	char m_pad[0x98];
	unsigned int m_bits;
};

// ?bit@Rva000B55D0@@QAEHXZ
int Rva000B55D0::bit(void)
{
	return (m_bits >> 4) & 1;
}

class Rva000B55E0
{
public:
	int bit(void);

	char m_pad[0x98];
	unsigned int m_bits;
};

// ?bit@Rva000B55E0@@QAEHXZ
int Rva000B55E0::bit(void)
{
	return (m_bits >> 5) & 1;
}

class Rva000B55F0
{
public:
	int bit(void);

	char m_pad[0x98];
	unsigned int m_bits;
};

// ?bit@Rva000B55F0@@QAEHXZ
int Rva000B55F0::bit(void)
{
	return (m_bits >> 6) & 1;
}

class Rva000B5600
{
public:
	int bit(void);

	char m_pad[0x98];
	unsigned int m_bits;
};

// ?bit@Rva000B5600@@QAEHXZ
int Rva000B5600::bit(void)
{
	return (m_bits >> 7) & 1;
}

class Rva000B6500
{
public:
	Rva000B6500 *get(void);
};

// ?get@Rva000B6500@@QAEPAV1@XZ
Rva000B6500 *Rva000B6500::get(void)
{
	return this;
}

class Rva000B9240
{
public:
	Rva000B9240 *get(void);
};

// ?get@Rva000B9240@@QAEPAV1@XZ
Rva000B9240 *Rva000B9240::get(void)
{
	return this;
}

class Rva000BE6D0
{
public:
	char *get(void);

	char m_pad[8];
};

// ?get@Rva000BE6D0@@QAEPADXZ
char *Rva000BE6D0::get(void)
{
	return m_pad + 8;
}

struct FieldParse;

class MapMetaDataReader
{
public:
	static const FieldParse m_mapFieldParseTable[];
};

class Rva000BE730
{
public:
	void *get(void);
};

// ?get@Rva000BE730@@QAEPAXXZ
void *Rva000BE730::get(void)
{
	return (void *)MapMetaDataReader::m_mapFieldParseTable;
}

class Rva000BE850
{
public:
	char *get(void);

	char *m_value;
};

// ?get@Rva000BE850@@QAEPADXZ
char *Rva000BE850::get(void)
{
	return m_value + 16;
}

class Rva000BE870
{
public:
	char *get(void);

	char *m_value;
};

// ?get@Rva000BE870@@QAEPADXZ
char *Rva000BE870::get(void)
{
	return m_value + 16;
}

class Rva000BE9C0
{
public:
	int get(void);

	char m_pad[4];
	int m_value;
};

// ?get@Rva000BE9C0@@QAEHXZ
int Rva000BE9C0::get(void)
{
	return m_value;
}

class Rva000BE9F0
{
public:
	int get(void);

	char m_pad[4];
	int m_value;
};

// ?get@Rva000BE9F0@@QAEHXZ
int Rva000BE9F0::get(void)
{
	return m_value;
}

class Rva000BEB10
{
public:
	int get(void);

	char m_pad[4];
	int m_value;
};

// ?get@Rva000BEB10@@QAEHXZ
int Rva000BEB10::get(void)
{
	return m_value;
}

class Rva000BEC00
{
public:
	Rva000BEC00 *get(void);
};

// ?get@Rva000BEC00@@QAEPAV1@XZ
Rva000BEC00 *Rva000BEC00::get(void)
{
	return this;
}

class Rva000BEC10
{
public:
	Rva000BEC10 *get(void);
};

// ?get@Rva000BEC10@@QAEPAV1@XZ
Rva000BEC10 *Rva000BEC10::get(void)
{
	return this;
}

class Rva000C2D20
{
public:
	unsigned char get(void);

	char m_pad[8];
	unsigned char m_value;
};

// ?get@Rva000C2D20@@QAEEXZ
unsigned char Rva000C2D20::get(void)
{
	return m_value;
}

class Rva000C3620
{
public:
	int get(void);

	int m_value;
};

// ?get@Rva000C3620@@QAEHXZ
int Rva000C3620::get(void)
{
	return m_value;
}

class Rva000C3BA0
{
public:
	int get(void);
};

// ?get@Rva000C3BA0@@QAEHXZ
int Rva000C3BA0::get(void)
{
	return -1;
}

class Rva000C3C60
{
public:
	int get(void);

	char m_pad[0x2c];
	int m_value;
};

// ?get@Rva000C3C60@@QAEHXZ
int Rva000C3C60::get(void)
{
	return m_value;
}

class Rva000C3C80
{
public:
	int get(void);

	char m_pad[0xc];
	int m_value;
};

// ?get@Rva000C3C80@@QAEHXZ
int Rva000C3C80::get(void)
{
	return m_value;
}

class Rva000C3CC0
{
public:
	int get(void);

	char m_pad[0x18];
	int m_value;
};

// ?get@Rva000C3CC0@@QAEHXZ
int Rva000C3CC0::get(void)
{
	return m_value;
}

class Rva000C3CD0
{
public:
	int get(void);

	char m_pad[0x34];
	int m_value;
};

// ?get@Rva000C3CD0@@QAEHXZ
int Rva000C3CD0::get(void)
{
	return m_value;
}

class Rva000C3E90
{
public:
	int get(void);

	char m_pad[4];
	int m_value;
};

// ?get@Rva000C3E90@@QAEHXZ
int Rva000C3E90::get(void)
{
	return m_value;
}

class Rva000C4410
{
public:
	int get(void);

	char m_pad[4];
	int m_value;
};

// ?get@Rva000C4410@@QAEHXZ
int Rva000C4410::get(void)
{
	return m_value;
}

class Rva000CA680
{
public:
	char *get(void);

	char *m_value;
};

// ?get@Rva000CA680@@QAEPADXZ
char *Rva000CA680::get(void)
{
	return m_value + 8;
}

class Rva000B9290
{
public:
	int get(void);

	int m_pad0;
	int m_value;
};

// ?get@Rva000B9290@@QAEHXZ
int Rva000B9290::get(void)
{
	return m_value;
}

// ?Rva00338400ReturnFirstArg@@YAHH@Z
int Rva00338400ReturnFirstArg(int value)
{
	return value;
}

// ?Rva0036C540ReturnFirstArg@@YAHH@Z
int Rva0036C540ReturnFirstArg(int value)
{
	return value;
}

// ?Rva0043C690ReturnFirstArg@@YAHH@Z
int Rva0043C690ReturnFirstArg(int value)
{
	return value;
}

// ?Rva0043C730ReturnFirstArg@@YAHH@Z
int Rva0043C730ReturnFirstArg(int value)
{
	return value;
}

// ?Rva004AFBF0ReturnFirstArg@@YAHH@Z
int Rva004AFBF0ReturnFirstArg(int value)
{
	return value;
}

// ?Rva0052D200ReturnFirstArg@@YAHH@Z
int Rva0052D200ReturnFirstArg(int value)
{
	return value;
}

// ?Rva00630A00ReturnFirstArg@@YAHH@Z
int Rva00630A00ReturnFirstArg(int value)
{
	return value;
}

// ?Rva006432F0ReturnFirstArg@@YAHH@Z
int Rva006432F0ReturnFirstArg(int value)
{
	return value;
}

// ?Rva00663E90ReturnFirstArg@@YAHH@Z
int Rva00663E90ReturnFirstArg(int value)
{
	return value;
}

class Rva00069870
{
public:
	int get(void);

	int m_pad0;
	int m_value;
};

// ?get@Rva00069870@@QAEHXZ
int Rva00069870::get(void)
{
	return m_value;
}

class Rva000E69A0
{
public:
	int get(void);

	int m_pad0;
	int m_value;
};

// ?get@Rva000E69A0@@QAEHXZ
int Rva000E69A0::get(void)
{
	return m_value;
}

class Rva001223C0
{
public:
	int get(void);

	int m_pad0;
	int m_value;
};

// ?get@Rva001223C0@@QAEHXZ
int Rva001223C0::get(void)
{
	return m_value;
}

class Rva0018B3B0
{
public:
	int get(void);

	int m_pad0;
	int m_value;
};

// ?get@Rva0018B3B0@@QAEHXZ
int Rva0018B3B0::get(void)
{
	return m_value;
}

class Rva001A4210
{
public:
	int get(void);

	int m_pad0;
	int m_value;
};

// ?get@Rva001A4210@@QAEHXZ
int Rva001A4210::get(void)
{
	return m_value;
}

class Rva001D5FA0
{
public:
	int get(void);

	int m_pad0;
	int m_value;
};

// ?get@Rva001D5FA0@@QAEHXZ
int Rva001D5FA0::get(void)
{
	return m_value;
}

class Rva001DE480
{
public:
	int get(void);

	int m_pad0;
	int m_value;
};

// ?get@Rva001DE480@@QAEHXZ
int Rva001DE480::get(void)
{
	return m_value;
}

class Rva001F86F0
{
public:
	int get(void);

	int m_pad0;
	int m_value;
};

// ?get@Rva001F86F0@@QAEHXZ
int Rva001F86F0::get(void)
{
	return m_value;
}

class Rva00232710
{
public:
	int get(void);

	int m_pad0;
	int m_value;
};

// ?get@Rva00232710@@QAEHXZ
int Rva00232710::get(void)
{
	return m_value;
}

class Rva00232A10
{
public:
	int get(void);

	int m_pad0;
	int m_value;
};

// ?get@Rva00232A10@@QAEHXZ
int Rva00232A10::get(void)
{
	return m_value;
}

class Rva00232B40
{
public:
	int get(void);

	int m_pad0;
	int m_value;
};

// ?get@Rva00232B40@@QAEHXZ
int Rva00232B40::get(void)
{
	return m_value;
}

class Rva002629B0
{
public:
	int get(void);

	int m_pad0;
	int m_value;
};

// ?get@Rva002629B0@@QAEHXZ
int Rva002629B0::get(void)
{
	return m_value;
}

class Rva0028F070
{
public:
	int get(void);

	int m_pad0;
	int m_value;
};

// ?get@Rva0028F070@@QAEHXZ
int Rva0028F070::get(void)
{
	return m_value;
}

class Rva0029C100
{
public:
	int get(void);

	int m_pad0;
	int m_value;
};

// ?get@Rva0029C100@@QAEHXZ
int Rva0029C100::get(void)
{
	return m_value;
}

class Rva002AF0E0
{
public:
	int get(void);

	int m_pad0;
	int m_value;
};

// ?get@Rva002AF0E0@@QAEHXZ
int Rva002AF0E0::get(void)
{
	return m_value;
}

class Rva002DF850
{
public:
	int get(void);

	int m_pad0;
	int m_value;
};

// ?get@Rva002DF850@@QAEHXZ
int Rva002DF850::get(void)
{
	return m_value;
}

class Rva002E2C40
{
public:
	int get(void);

	int m_pad0;
	int m_value;
};

// ?get@Rva002E2C40@@QAEHXZ
int Rva002E2C40::get(void)
{
	return m_value;
}

class Rva00336590
{
public:
	int get(void);

	int m_pad0;
	int m_value;
};

// ?get@Rva00336590@@QAEHXZ
int Rva00336590::get(void)
{
	return m_value;
}

class Rva00360B10
{
public:
	int get(void);

	int m_pad0;
	int m_value;
};

// ?get@Rva00360B10@@QAEHXZ
int Rva00360B10::get(void)
{
	return m_value;
}

class Rva0036BEB0
{
public:
	int get(void);

	int m_pad0;
	int m_value;
};

// ?get@Rva0036BEB0@@QAEHXZ
int Rva0036BEB0::get(void)
{
	return m_value;
}

class Rva00383D70
{
public:
	int get(void);

	int m_pad0;
	int m_value;
};

// ?get@Rva00383D70@@QAEHXZ
int Rva00383D70::get(void)
{
	return m_value;
}
