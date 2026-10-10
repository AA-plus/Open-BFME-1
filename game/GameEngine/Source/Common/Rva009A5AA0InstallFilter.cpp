// ?Rva009A5AA0InstallFilter@@YAXPAX00H@Z
// Retail RVA 0x009A5AA0, 193 bytes.  Rva009A4D00Init (0x009A4D00) calls it
// directly as cdecl with three table pointers (all its 64-entry int table
// 0x0134C6D8) and the tier constant 7.  The body builds the saturating clamp
// table read by the loop filters, publishes the three table pointers, copies
// the 64-entry source table, picks the tier's pair of tables and runs the CPU
// dispatch installer.

// Retail passes the tier on the stack although the installer's landed body
// (0x009B0D60) never reads an argument, so the call goes through a typed cast
// of its ledger name.
extern void __cdecl bfmeInstallCpuDispatchTable(void);
typedef void (__cdecl *Rva009A5AA0TierInstaller)(int);

extern unsigned char g_bfmeClampTable[];	// retail 0x01356EE0; zero point at +256
const void *g_rva01356A88 = 0;
int g_rva01356940[64];
extern int *g_bfmeFilterLimit;			// retail 0x01356A7C
// VA 0x01356A9C is a zero-filled 4-byte pointer: this retail body stores
// int-table addresses, and RVA 0x009C2170 loads it for indexed dword reads.
int *g_rva01356A9C = 0;
// VA 0x01356AA0 / 0x01356A98: zero-filled 4-byte table pointers this body
// publishes; RVA 0x009AF200/0x009AF320 pass them to copyPlane009AF0D0.
const unsigned int *g_rva01356AA0 = 0;
const unsigned int *g_rva01356A98 = 0;

// Retail .data tables (byte-equal initialisers; DIR32-referenced by this body).
int g_Va012D7858[64] = {30, 25, 20, 20, 15, 15, 14, 14, 13, 13, 12, 12, 11, 11, 10, 10, 9, 9, 8, 8, 7, 7, 7, 7, 6, 6, 6, 6, 5, 5, 5, 5, 4, 4, 4, 4, 3, 3, 3, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1};
int g_Va012D7958[64] = {15, 15, 15, 15, 10, 10, 10, 10, 10, 10, 10, 10, 10, 9, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 7, 7, 7, 7, 7, 7, 7, 6, 6, 6, 6, 5, 5, 5, 5, 5, 4, 4, 4, 4, 4, 4, 3, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2, 1, 1, 1, 0, 0, 0};
int g_Va012D7A58[64] = {15, 15, 15, 15, 10, 10, 10, 10, 10, 10, 10, 10, 10, 9, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 7, 7, 7, 7, 7, 7, 7, 6, 6, 6, 6, 5, 5, 5, 5, 5, 4, 4, 4, 4, 4, 4, 3, 3, 3, 3, 3, 3, 2, 2, 2, 2, 2, 1, 1, 1, 0, 0, 0};
unsigned short g_Va012D7C58[128] = {30, 0, 25, 0, 20, 0, 20, 0, 15, 0, 15, 0, 14, 0, 14, 0, 13, 0, 13, 0, 12, 0, 12, 0, 11, 0, 11, 0, 10, 0, 10, 0, 9, 0, 9, 0, 8, 0, 8, 0, 7, 0, 7, 0, 7, 0, 7, 0, 6, 0, 6, 0, 6, 0, 6, 0, 5, 0, 5, 0, 5, 0, 5, 0, 4, 0, 4, 0, 4, 0, 4, 0, 3, 0, 3, 0, 3, 0, 3, 0, 2, 0, 2, 0, 2, 0, 2, 0, 2, 0, 2, 0, 2, 0, 2, 0, 2, 0, 2, 0, 2, 0, 2, 0, 2, 0, 2, 0, 2, 0, 2, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0};
unsigned short g_Va012D7D58[128] = {14, 0, 14, 0, 13, 0, 13, 0, 12, 0, 12, 0, 10, 0, 10, 0, 10, 0, 10, 0, 8, 0, 8, 0, 8, 0, 8, 0, 8, 0, 8, 0, 8, 0, 8, 0, 8, 0, 8, 0, 8, 0, 8, 0, 8, 0, 8, 0, 8, 0, 8, 0, 8, 0, 8, 0, 8, 0, 8, 0, 8, 0, 8, 0, 8, 0, 8, 0, 8, 0, 8, 0, 7, 0, 7, 0, 7, 0, 7, 0, 7, 0, 7, 0, 6, 0, 6, 0, 6, 0, 6, 0, 6, 0, 6, 0, 5, 0, 5, 0, 5, 0, 5, 0, 4, 0, 4, 0, 4, 0, 4, 0, 4, 0, 4, 0, 4, 0, 3, 0, 3, 0, 3, 0, 3, 0, 2, 0};
unsigned short g_Va012D7E58[128] = {14, 0, 14, 0, 13, 0, 13, 0, 12, 0, 12, 0, 10, 0, 10, 0, 10, 0, 10, 0, 8, 0, 8, 0, 8, 0, 8, 0, 8, 0, 8, 0, 8, 0, 8, 0, 8, 0, 8, 0, 8, 0, 8, 0, 8, 0, 8, 0, 8, 0, 8, 0, 8, 0, 8, 0, 8, 0, 8, 0, 8, 0, 8, 0, 8, 0, 8, 0, 8, 0, 8, 0, 7, 0, 7, 0, 7, 0, 7, 0, 7, 0, 7, 0, 6, 0, 6, 0, 6, 0, 6, 0, 6, 0, 6, 0, 5, 0, 5, 0, 5, 0, 5, 0, 4, 0, 4, 0, 4, 0, 4, 0, 4, 0, 4, 0, 4, 0, 3, 0, 3, 0, 3, 0, 3, 0, 2, 0};

void __cdecl Rva009A5AA0InstallFilter(void *firstTable, void *secondTable, void *sourceTable, int tier)
{
	unsigned char *clamp = g_bfmeClampTable + 256;
	int i;
	for (i = -256; i < 512; ++i)
	{
		int value;
		if (i < 0)
			value = 0;
		else
		{
			value = i;
			if (value > 255)
				value = 255;
		}
		clamp[i] = (unsigned char)value;
	}

	g_rva01356AA0 = (const unsigned int *)firstTable;
	g_rva01356A98 = (const unsigned int *)secondTable;
	g_rva01356A88 = sourceTable;
	for (i = 0; i < 64; ++i)
		g_rva01356940[i] = ((const int *)sourceTable)[i];

	if ((unsigned)tier >= 6)
	{
		g_bfmeFilterLimit = (int *)g_Va012D7E58;
		g_rva01356A9C = g_Va012D7A58;
	}
	else if ((unsigned)tier >= 5)
	{
		g_bfmeFilterLimit = (int *)g_Va012D7D58;
		g_rva01356A9C = g_Va012D7958;
	}
	else
	{
		g_bfmeFilterLimit = (int *)g_Va012D7C58;
		g_rva01356A9C = g_Va012D7858;
	}
	((Rva009A5AA0TierInstaller)bfmeInstallCpuDispatchTable)(tier);
}
