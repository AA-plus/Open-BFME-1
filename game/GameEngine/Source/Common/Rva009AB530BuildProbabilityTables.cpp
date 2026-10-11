// cl: /O2 /G6 /DNDEBUG /MD
struct Rva009B4800State;
struct Rva009AAFE0Context;
struct Rva009AB530Context {
	unsigned char unknown0[0x150];
	unsigned char br[32];
	unsigned char unknown170[0x3a0 - 0x170];
	unsigned char DcProbs[2][11];
	unsigned char AcProbs[2][3][6][11];
	unsigned char unknown542[0x560 - 0x542];
	unsigned char ZeroRunProbs[2][14];
	unsigned char unknown57c[0x63c - 0x57c];
	unsigned char ScanBands[64];
};
int Rva009B4800DecodeBool(Rva009B4800State *, int);
int bfmeGoUSC(void *, int);
void Rva009AAFE0BuildTable(Rva009AAFE0Context *, const unsigned char *);
void Rva009B64A0BuildTone(unsigned char *);
struct Rva009AB530ProbUpdate {
	// ?Read@Rva009AB530ProbUpdate@@SAEPAX@Z absent-from-retail
	// Open BFME 2: Code/Libraries/Source/VP6/ConfigureEntropyDecoder.cpp.
	static unsigned char Read(void *br)
	{
		unsigned char v = (unsigned char)(bfmeGoUSC(br, 7) << 1);
		return v + (v == 0);
	}
};
extern "C" void *memset(void *, int, unsigned);
extern "C" void *memcpy(void *, const void *, unsigned);
#pragma intrinsic(memset, memcpy)
extern int g_rva01143064[];
#define g_011430B0 (*(const unsigned char (*)[2][11])((const unsigned char *)g_rva01143064 + 0x4c))
#define g_011430C8 (*(const unsigned char (*)[64])((const unsigned char *)g_rva01143064 + 0x64))
#define g_01143108 (*(const unsigned char (*)[2][14])((const unsigned char *)g_rva01143064 + 0xa4))
#define g_01143124 (*(const unsigned char (*)[2][14])((const unsigned char *)g_rva01143064 + 0xc0))
#define g_01143140 (*(const unsigned char (*)[3][2][6][11])((const unsigned char *)g_rva01143064 + 0xdc))
// ?Rva009AB530BuildProbabilityTables@@YAXPAE_N@Z
// Open BFME 2: Code/Libraries/Source/VP6/ConfigureEntropyDecoder.cpp.
void Rva009AB530BuildProbabilityTables(unsigned char *ctx, bool reuse)
{
	Rva009AB530Context *pbi = (Rva009AB530Context *)ctx;
	unsigned char previous[11];
	unsigned i, j, k;
	int prec;
	unsigned plane;
	memset(previous, 128, sizeof previous);
	for (i = 0; i < 2; i++) {
		for (j = 0; j < 11; j++) {
			if (Rva009B4800DecodeBool((Rva009B4800State *)pbi->br, g_011430B0[i][j])) {
				unsigned char v = Rva009AB530ProbUpdate::Read(pbi->br);
				previous[j] = v;
				pbi->DcProbs[i][j] = v;
			} else if (reuse == 0) {
				pbi->DcProbs[i][j] = previous[j];
			}
		}
	}
	if (reuse == 0)
		memcpy(pbi->ZeroRunProbs, g_01143124, sizeof pbi->ZeroRunProbs);
	if (Rva009B4800DecodeBool((Rva009B4800State *)pbi->br, 128)) {
		for (i = 1; i < 64; i++) {
			if (Rva009B4800DecodeBool((Rva009B4800State *)pbi->br, g_011430C8[i]))
				pbi->ScanBands[i] = (unsigned char)bfmeGoUSC(pbi->br, 4);
		}
		Rva009AAFE0BuildTable((Rva009AAFE0Context *)pbi, pbi->ScanBands);
	}
	for (i = 0; i < 2; i++) {
		for (j = 0; j < 14; j++) {
			if (Rva009B4800DecodeBool((Rva009B4800State *)pbi->br, g_01143108[i][j])) {
				unsigned char v = Rva009AB530ProbUpdate::Read(pbi->br);
				pbi->ZeroRunProbs[i][j] = v;
			}
		}
	}
	for (prec = 0; prec < 3; prec++) {
		for (plane = 0; plane < 2; plane++) {
			for (j = 0; j < 6; j++) {
				for (k = 0; k < 11; k++) {
					if (Rva009B4800DecodeBool((Rva009B4800State *)pbi->br, g_01143140[prec][plane][j][k])) {
						unsigned char v = Rva009AB530ProbUpdate::Read(pbi->br);
						previous[k] = v;
						pbi->AcProbs[plane][prec][j][k] = v;
					} else if (reuse == 0) {
						pbi->AcProbs[plane][prec][j][k] = previous[k];
					}
				}
			}
		}
	}
	(Rva009B64A0BuildTone)((unsigned char *)pbi);
}
