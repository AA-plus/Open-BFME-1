// cl: /O2 /G6 /DNDEBUG /MD
struct Rva009B0100Context
{
	int m_pad00;
	unsigned char m_pad04[8];
	int m_mode;
	int m_baseOffset;
	int m_arg4;
	unsigned char *m_flags;
	int m_flagStride;
	int m_flagMask;
	unsigned char m_pad24[0x78 - 0x24];
	unsigned char *m_planeY;
	unsigned char *m_planeU;
	unsigned char *m_planeV;
	unsigned int m_extra84;
	unsigned int m_extra88;
	unsigned int m_pad8C;
	unsigned int m_width;
	unsigned int m_height;
	unsigned int m_strideY;
	unsigned int m_strideUV;

	// ?IsCoded@Rva009B0100Context@@QBE_NH@Z absent-from-retail
	bool IsCoded(int index) const
	{
		return (m_flags[index * m_flagStride] & m_flagMask) != 0;
	}
};

struct Rva009AF530Context;
typedef int *(__cdecl *Rva009B0100Setup)(Rva009AF530Context *, int);
typedef void (__cdecl *Rva009B0100Filter)(void *, unsigned char *, int, void *);

extern Rva009B0100Setup g_rva01356e68SetupBounding;
Rva009B0100Filter g_rva01356E9C;		// retail .bss callback slot 0x01356E9C
Rva009B0100Filter g_rva01356EBC;		// retail .bss callback slot 0x01356EBC
// retail .data 0x012D7B58..0x012D7C58 (g_Va012D7C58 follows)
extern const int g_rva012D7B58[64] = {
	30, 25, 20, 20, 15, 15, 14, 14,
	13, 13, 12, 12, 11, 11, 10, 10,
	9, 9, 8, 8, 7, 7, 7, 7,
	6, 6, 6, 6, 5, 5, 5, 5,
	4, 4, 4, 4, 3, 3, 3, 3,
	2, 2, 2, 2, 2, 2, 2, 2,
	0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0,
};

#define CODED(i) ctx->IsCoded(i)
#define FILTER_H(x) g_rva01356E9C(ctx, (x), stride, work)
#define FILTER_V(x) g_rva01356EBC(ctx, (x), stride, work)

// _Rva009B0100Vp6BlockFilter
// Open BFME 2: Code/Libraries/Source/VP6/LoopFilter.cpp
extern "C" void __cdecl Rva009B0100Vp6BlockFilter(Rva009B0100Context *ctx, int mode,
	int baseOffset, int arg4, unsigned char *flags,
	int flagStride, int flagMask)
{
	int frag = 0;
	unsigned char *pixel = 0;
	int start = 0;
	int lineFragments = 0;
	unsigned int stride = 0;
	int across = ctx->m_width;
	int down = ctx->m_height;
	unsigned int rowStep;
	int plane;
	int n;
	int m;
	int limit;
	void *work;

	ctx->m_mode = mode;
	ctx->m_baseOffset = baseOffset;
	ctx->m_arg4 = arg4;
	ctx->m_flags = flags;
	ctx->m_flagStride = flagStride;
	ctx->m_flagMask = flagMask;

	limit = g_rva012D7B58[mode];
	if (limit == 0)
		return;
	work = g_rva01356e68SetupBounding((Rva009AF530Context *)ctx, limit);

	for (plane = 0; plane < 3; plane++) {
		switch (plane) {
		case 0:
			start = 0;
			across = ctx->m_width;
			down = ctx->m_height;
			stride = ctx->m_strideY;
			lineFragments = ctx->m_width;
			pixel = ctx->m_baseOffset + ctx->m_planeY;
			break;
		case 1:
			start = ctx->m_extra84;
			across = ctx->m_width >> 1;
			down = ctx->m_height >> 1;
			stride = ctx->m_strideUV;
			lineFragments = ctx->m_width >> 1;
			pixel = ctx->m_baseOffset + ctx->m_planeU;
			break;
		case 2:
			start = ctx->m_extra84 + ctx->m_extra88;
			across = ctx->m_width >> 1;
			down = ctx->m_height >> 1;
			stride = ctx->m_strideUV;
			lineFragments = ctx->m_width >> 1;
			pixel = ctx->m_baseOffset + ctx->m_planeV;
			break;
		}

		rowStep = 8 * stride;
		frag = start;
		if (CODED(frag)) {
			if (!CODED(frag + 1))
				FILTER_H(pixel + 6);
			if (!CODED(frag + lineFragments))
				FILTER_V(pixel + rowStep);
		}
		frag++;
		for (n = 1; n < across - 1; n++, frag++) {
			if (CODED(frag)) {
				FILTER_H(pixel + 8 * n - 2);
				if (!CODED(frag + 1))
					FILTER_H(pixel + 8 * n + 6);
				if (!CODED(frag + lineFragments))
					FILTER_V(pixel + 8 * n + rowStep);
			}
		}
		if (CODED(frag)) {
			FILTER_H(pixel + 8 * n - 2);
			if (!CODED(frag + lineFragments))
				FILTER_V(pixel + 8 * n + rowStep);
		}
		frag++;
		pixel += rowStep;

		for (m = 1; m < down - 1; m++) {
			if (CODED(frag)) {
				FILTER_V(pixel);
				if (!CODED(frag + 1))
					FILTER_H(pixel + 6);
				if (!CODED(frag + lineFragments))
					FILTER_V(pixel + rowStep);
			}
			frag++;
			for (n = 1; n < across - 1; n++, frag++) {
				if (CODED(frag)) {
					FILTER_H(pixel + 8 * n - 2);
					FILTER_V(pixel + 8 * n);
					if (!CODED(frag + 1))
						FILTER_H(pixel + 8 * n + 6);
					if (!CODED(frag + lineFragments))
						FILTER_V(pixel + 8 * n + rowStep);
				}
			}
			if (CODED(frag)) {
				FILTER_H(pixel + 8 * n - 2);
				FILTER_V(pixel + 8 * n);
				if (!CODED(frag + lineFragments))
					FILTER_V(pixel + 8 * n + rowStep);
			}
			frag++;
			pixel += rowStep;
		}
	}

	if (CODED(frag)) {
		FILTER_V(pixel);
		if (!CODED(frag + 1))
			FILTER_H(pixel + 6);
	}
	frag++;
	for (n = 1; n < across - 1; n++, frag++) {
		if (CODED(frag)) {
			FILTER_H(pixel + 8 * n - 2);
			FILTER_V(pixel + 8 * n);
			if (!CODED(frag + 1))
				FILTER_H(pixel + 8 * n + 6);
		}
	}
	if (CODED(frag)) {
		FILTER_H(pixel + 8 * n - 2);
		FILTER_V(pixel + 8 * n);
	}
}


#undef CODED
#undef FILTER_H
#undef FILTER_V

struct Rva009B0730Context
{
	unsigned char pad00[12];
	int field0C;
	int field10;
	int field14;
	unsigned char *field18;
	int field1C;
	int field20;
	unsigned char pad24[0x78 - 0x24];
	unsigned char *field78;
	unsigned char *field7C;
	unsigned char *field80;
	unsigned int field84;
	unsigned int field88;
	unsigned int field8C;
	unsigned int field90;
	unsigned int field94;
	unsigned int field98;
	unsigned int field9C;

	// ?IsCoded@Rva009B0730Context@@QBE_NH@Z absent-from-retail
	bool IsCoded(int index) const
	{
		return (field18[index * field1C] & field20) != 0;
	}
};

struct Rva009AF530Context;
typedef int *(__cdecl *Setup009B0730)(Rva009AF530Context *, int);
typedef void (__cdecl *Filter009B0730)(void *, unsigned char *, int, void *);

extern Setup009B0730 g_rva01356e68SetupBounding;
extern Filter009B0730 g_rva01356E9C;
extern Filter009B0730 g_rva01356EBC;
extern const int g_rva012D7B58[64];

#define CODED(i) ctx->IsCoded(i)
#define FILTER_H(x) g_rva01356E9C(ctx, (x), stride, work)
#define FILTER_V(x) g_rva01356EBC(ctx, (x), stride, work)

// _Rva009B0730
// Open BFME 2: Code/Libraries/Source/VP6/LoopFilter.cpp
extern "C" void __cdecl Rva009B0730(Rva009B0730Context *ctx, int mode,
	int offset, int field14, unsigned char *flags,
	int flagStride, int mask)
{
	int frag = 0;
	unsigned char *pixel = 0;
	int start = 0;
	int lineFragments = 0;
	unsigned int stride = 0;
	int down = ctx->field94;
	int across = ctx->field90;
	unsigned int rowStep;
	int plane;
	int n;
	int m;
	int limit;
	void *work;

	ctx->field0C = mode;
	ctx->field10 = offset;
	ctx->field14 = field14;
	ctx->field18 = flags;
	ctx->field1C = flagStride;
	ctx->field20 = mask;

	limit = g_rva012D7B58[mode];
	if (limit == 0)
		return;
	work = g_rva01356e68SetupBounding((Rva009AF530Context *)ctx, limit);

	for (plane = 0; plane < 3; plane++) {
		switch (plane) {
		case 0:
			start = 0;
			across = ctx->field90;
			down = ctx->field94;
			stride = ctx->field98;
			lineFragments = ctx->field90;
			pixel = ctx->field10 + ctx->field78;
			break;
		case 1:
			start = ctx->field84;
			across = ctx->field90 >> 1;
			down = ctx->field94 >> 1;
			stride = ctx->field9C;
			lineFragments = ctx->field90 >> 1;
			pixel = ctx->field10 + ctx->field7C;
			break;
		case 2:
			start = ctx->field84 + ctx->field88;
			across = ctx->field90 >> 1;
			down = ctx->field94 >> 1;
			stride = ctx->field9C;
			lineFragments = ctx->field90 >> 1;
			pixel = ctx->field10 + ctx->field80;
			break;
		}

		rowStep = 8 * stride;
		frag = start;
		if (CODED(frag)) {
			if (!CODED(frag + 1))
				FILTER_H(pixel + 6);
			if (!CODED(frag + lineFragments))
				FILTER_V(pixel + rowStep);
		}
		frag++;
		for (n = 1; n < across - 1; n++, frag++) {
			if (CODED(frag)) {
				FILTER_H(pixel + 8 * n - 2);
				if (!CODED(frag + 1))
					FILTER_H(pixel + 8 * n + 6);
				if (!CODED(frag + lineFragments))
					FILTER_V(pixel + 8 * n + rowStep);
			}
		}
		if (CODED(frag)) {
			FILTER_H(pixel + 8 * n - 2);
			if (!CODED(frag + lineFragments))
				FILTER_V(pixel + 8 * n + rowStep);
		}
		frag++;
		pixel += rowStep;

		for (m = 1; m < down - 1; m++) {
			if (CODED(frag)) {
				FILTER_V(pixel);
				if (!CODED(frag + 1))
					FILTER_H(pixel + 6);
				if (!CODED(frag + lineFragments))
					FILTER_V(pixel + rowStep);
			}
			frag++;
			for (n = 1; n < across - 1; n++, frag++) {
				if (CODED(frag)) {
					FILTER_H(pixel + 8 * n - 2);
					FILTER_V(pixel + 8 * n);
					if (!CODED(frag + 1))
						FILTER_H(pixel + 8 * n + 6);
					if (!CODED(frag + lineFragments))
						FILTER_V(pixel + 8 * n + rowStep);
				}
			}
			if (CODED(frag)) {
				FILTER_H(pixel + 8 * n - 2);
				FILTER_V(pixel + 8 * n);
				if (!CODED(frag + lineFragments))
					FILTER_V(pixel + 8 * n + rowStep);
			}
			frag++;
			pixel += rowStep;
		}

		if (CODED(frag)) {
			FILTER_V(pixel);
			if (!CODED(frag + 1))
				FILTER_H(pixel + 6);
		}
		frag++;
		for (n = 1; n < across - 1; n++, frag++) {
			if (CODED(frag)) {
				FILTER_H(pixel + 8 * n - 2);
				FILTER_V(pixel + 8 * n);
				if (!CODED(frag + 1))
					FILTER_H(pixel + 8 * n + 6);
			}
		}
		if (CODED(frag)) {
			FILTER_H(pixel + 8 * n - 2);
			FILTER_V(pixel + 8 * n);
		}
	}
}

#undef CODED
#undef FILTER_H
#undef FILTER_V
