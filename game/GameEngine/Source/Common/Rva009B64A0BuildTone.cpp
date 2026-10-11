// cl: /O2 /Ob0 /DNDEBUG /DWIN32 /D_WINDOWS /MD

struct Rva009B64A0Coef
{
	int m_scale;
	int m_bias;
};

Rva009B64A0Coef g_bfmeToneCoef[15] = {{122, 133}, {133, 51}, {142, -16}, {0, 1}, {0, 1}, {0, 1}, {78, 171}, {169, 71}, {221, -30}, {139, 117}, {214, 44}, {246, -3}, {168, 79}, {210, 38}, {203, 17}};		// retail 0x011432D0
void (__cdecl *g_bfmeToneReady)();			// retail 0x01356B48

#define BFME_TONE(dstIndex, srcIndex, tap)						\
	{															\
		int v = ((src[srcIndex] * g_bfmeToneCoef[tap * 3 + j].m_scale	\
				+ 0x80) >> 8) + g_bfmeToneCoef[tap * 3 + j].m_bias;	\
		if (v > 255)											\
			v = 255;											\
		else if (v < 1)											\
			v = 1;												\
		dst[dstIndex] = (unsigned char)v;						\
	}

void Rva009B64A0BuildTone(unsigned char *ctx)
{
	g_bfmeToneReady();

	unsigned char *dst = ctx + 0x543;
	unsigned char *src = ctx + 0x3A1;
	int row;

	for (row = 2; row != 0; --row) {
		unsigned j;
		for (j = 0; j < 3; ++j) {
			BFME_TONE(-1, -1, 0)
			BFME_TONE(0, 0, 1)
			BFME_TONE(1, 1, 2)
			BFME_TONE(2, 2, 3)
			BFME_TONE(3, 3, 4)
			dst += 5;
		}
		src += 11;
	}
}
