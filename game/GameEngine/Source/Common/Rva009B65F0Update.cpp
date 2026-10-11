// cl: /O2 /G6 /DNDEBUG /MD
struct Rva009B65F0Context {
	unsigned char unknown0[0x150];
	unsigned char br[32];
	unsigned char unknown170[0x704 - 0x170];
	unsigned char MvSignProbs[2];
	unsigned char IsMvShortProb[2];
	unsigned char MvShortProbs[2][7];
	unsigned char unknown716[6];
	unsigned char MvSizeProbs[2][8];
};
int Rva009B4600DecodeBool(void *, int);
int bfmeGoUSC(void *, int);
extern int g_rva01143064[];
#define g_bfmeProbUpdate (*(const unsigned char (*)[2][17])((const unsigned char *)g_rva01143064 + 0x2e4))
#define pbi ((Rva009B65F0Context *)ctx)
// ?Rva009B65F0Update@@YAXPAEE@Z
// Open BFME 2: Code/Libraries/Source/VP6/ConfigureMvEntropyDecoder.cpp.
void Rva009B65F0Update(unsigned char *ctx, unsigned char frameType)
{
	int i;
	unsigned j;
	for (i = 0; i < 2; i++) {
		if (Rva009B4600DecodeBool(pbi->br, g_bfmeProbUpdate[i][0])) {
			pbi->IsMvShortProb[i] = bfmeGoUSC(pbi->br, 7) << 1;
			if (!pbi->IsMvShortProb[i])
				pbi->IsMvShortProb[i] = 1;
		}
		if (Rva009B4600DecodeBool(pbi->br, g_bfmeProbUpdate[i][1])) {
			pbi->MvSignProbs[i] = bfmeGoUSC(pbi->br, 7) << 1;
			if (!pbi->MvSignProbs[i])
				pbi->MvSignProbs[i] = 1;
		}
	}
	for (i = 0; i < 2; i++) {
		int k = 2;
		for (j = 0; j < 7; j++, k++) {
			if (Rva009B4600DecodeBool(pbi->br, g_bfmeProbUpdate[i][k])) {
				pbi->MvShortProbs[i][j] = bfmeGoUSC(pbi->br, 7) << 1;
				if (!pbi->MvShortProbs[i][j])
					pbi->MvShortProbs[i][j] = 1;
			}
		}
	}
	for (i = 0; i < 2; i++) {
		int k = 9;
		for (j = 0; j < 8; j++, k++) {
			if (Rva009B4600DecodeBool(pbi->br, g_bfmeProbUpdate[i][k])) {
				pbi->MvSizeProbs[i][j] = bfmeGoUSC(pbi->br, 7) << 1;
				if (!pbi->MvSizeProbs[i][j])
					pbi->MvSizeProbs[i][j] = 1;
			}
		}
	}
}
#undef pbi
