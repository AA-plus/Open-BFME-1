// cl: /O2 /G6 /DNDEBUG /MD
struct Rva009B5420State {
	unsigned char unknown0[0x3c];
	int nearestInter, nearInter, nearestInterIndex;
	int nearestGolden, nearGolden, nearestGoldenIndex;
	unsigned char unknown54[0x230 - 0x54];
	unsigned mbCols;
	unsigned char unknown234[0x6a8 - 0x234];
	int neighbourOffset[12];
	unsigned char unknown6d8[0x6f0 - 0x6d8];
	signed char *predictionMode;
	int *motionVector;
};
extern unsigned char g_bfmeVp6SelectorMap[40];
// ?Rva009B5420@@YAXPAXIIEPAH@Z
// Ported from Open BFME 2 Code/Libraries/Source/VP6/FindNearestandNextNearest.cpp.
void __cdecl Rva009B5420(void *ctx, unsigned row, unsigned col, unsigned char frame, int *type)
{
	Rva009B5420State *pbi = (Rva009B5420State *)ctx;
	int i;
	int base = row * pbi->mbCols + col;
	int nearest = 0;
	int nearVector = 0;
	int nearestType = 1;
	int nearestIndex;
	for (i = 0; i < 12; i++) {
		int offset = base + pbi->neighbourOffset[i];
		if (((const int *)g_bfmeVp6SelectorMap)[pbi->predictionMode[offset]] == frame) {
			int mv = pbi->motionVector[offset];
			if (mv != 0) {
				nearest = mv;
				nearestType = 2;
				break;
			}
		}
	}
	nearestIndex = i;
	for (i++; i < 12; i++) {
		int offset = base + pbi->neighbourOffset[i];
		if (((const int *)g_bfmeVp6SelectorMap)[pbi->predictionMode[offset]] == frame) {
			int mv = pbi->motionVector[offset];
			if (mv != nearest && mv != 0) {
				nearVector = mv;
				nearestType = 0;
				break;
			}
		}
	}
	if (frame == 1) {
		*type = nearestType;
		pbi->nearestInterIndex = nearestIndex;
		pbi->nearestInter = nearest;
		pbi->nearInter = nearVector;
	} else {
		pbi->nearestGoldenIndex = nearestIndex;
		pbi->nearestGolden = nearest;
		pbi->nearGolden = nearVector;
	}
}
