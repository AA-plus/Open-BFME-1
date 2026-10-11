// ?Rva009B3180FilterVert@@YAXPAXPAEHPBH@Z
// partial score=1.0 date=2026-10-11
// cl: /O2 /G6 /DNDEBUG /MD
extern unsigned char g_bfmeClampTable[];

// Ported from Open BFME 2 Code/Libraries/Source/VP6/FilterHorizSimple2.cpp.
// ?Rva009B3180FilterVert@@YAXPAXPAEHPBH@Z
void Rva009B3180FilterVert(void *, unsigned char *ptr, int pitch, const int *bounding)
{
	int i, step, left, right, amount, half;
	for (i = 0; i < 8; i++) {
		step = ptr[2] - ptr[1];
		if (step != 0) {
			left = ptr[1] - ptr[0];
			right = ptr[3] - ptr[2];
			amount = bounding[(step * 2 - left + right + 4) >> 3];
			ptr[1] = g_bfmeClampTable[ptr[1] + amount + 256];
			ptr[2] = g_bfmeClampTable[ptr[2] - amount + 256];
			half = ((right | left) == 0) * (amount >> 1);
			ptr[0] = g_bfmeClampTable[ptr[0] + half + 256];
			ptr[3] = g_bfmeClampTable[ptr[3] - half + 256];
			ptr += pitch;
		}
	}
}
