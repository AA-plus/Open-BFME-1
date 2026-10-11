// cl: /O2 /G6 /DNDEBUG /MD

struct Rva009AF200Context
{
	int m_mode;
	unsigned char m_pad04[8];
	int m_tableIndex;
	unsigned char m_pad10[0x28 - 0x10];
	void *m_scratch;
	unsigned char m_pad2C[0x38 - 0x2C];
	int *m_bounding;
	unsigned char m_pad3C[0x78 - 0x3C];
	unsigned char *m_planeY;
	unsigned char *m_planeU;
	unsigned char *m_planeV;
	unsigned m_extra84;
	unsigned m_extra88;
	unsigned m_scratchCount;
	unsigned m_width;
	unsigned m_height;
	unsigned m_strideY;
	unsigned m_strideUV;
};

typedef void (__cdecl *Rva009AEEE0Operation)(Rva009AF200Context *, unsigned char *,
	unsigned char *, unsigned int, unsigned int, int, const unsigned int *);

struct Rva009ACC80Context;
void __cdecl Rva009ACC80Filter(Rva009ACC80Context *, unsigned char *, unsigned char *,
	unsigned int, unsigned int, int, const unsigned int *);
void __cdecl Rva009AD750(Rva009AF200Context *, unsigned char *, unsigned char *, unsigned int, unsigned int, int, const unsigned int *);

extern Rva009AEEE0Operation g_rva01356E88;
extern Rva009AEEE0Operation g_rva01356E94;
extern const unsigned int *g_rva01356AA0;
extern const unsigned int *g_rva01356A98;
extern const void *g_rva01356A88;

// ?copyPlane009AEEE0@@YAXPAURva009AF200Context@@HHH@Z
// Ported from Open BFME 2 Code/Libraries/Source/VP6/DeblockPlane.cpp.
void copyPlane009AEEE0(Rva009AF200Context *ctx, int x, int y, int plane)
{
	Rva009AEEE0Operation operation;
	Rva009AEEE0Operation finalOperation;
	const unsigned int *callback = 0;
	unsigned int stride;
	unsigned int across;
	unsigned int down;
	int sourceOffset;
	unsigned char *source;
	unsigned char *destination;
	unsigned int row;
	unsigned int column;

	if (ctx->m_mode >= 2) {
		operation = g_rva01356E94;
		finalOperation = (Rva009AEEE0Operation)Rva009AD750;
	} else {
		operation = g_rva01356E88;
		finalOperation = (Rva009AEEE0Operation)Rva009ACC80Filter;
	}

	switch (plane) {
	case 0:
		stride = ctx->m_strideY;
		across = ctx->m_width;
		down = ctx->m_height;
		sourceOffset = 0;
		source = ctx->m_planeY + x;
		destination = ctx->m_planeY + y;
		break;
	case 1:
		stride = ctx->m_strideUV;
		across = ctx->m_width >> 1;
		down = ctx->m_height >> 1;
		sourceOffset = ctx->m_extra84;
		source = ctx->m_planeU + x;
		destination = ctx->m_planeU + y;
		break;
	default:
		stride = ctx->m_strideUV;
		across = ctx->m_width >> 1;
		down = ctx->m_height >> 1;
		sourceOffset = ctx->m_extra84 + ctx->m_extra88;
		source = ctx->m_planeV + x;
		destination = ctx->m_planeV + y;
		break;
	}

	if (ctx->m_mode >= 2) {
		switch ((unsigned int)plane) {
		case 0:
			callback = g_rva01356AA0;
			break;
		case 1:
		case 2:
			callback = g_rva01356A98;
			break;
		}
	} else {
		callback = (const unsigned int *)g_rva01356A88;
	}

	for (row = 0; row < 4; row++)
		for (column = 0; column < stride; column++)
			destination[row * stride + column] = source[row * stride + column];

	for (row = 1; row < down; row++) {
		source += stride * 8;
		destination += stride * 8;
		operation(ctx, source, destination, stride, across, sourceOffset, callback);
		sourceOffset += across;
	}

	for (row = 4; row < 8; row++)
		for (column = 0; column < stride; column++)
			destination[row * stride + column] = source[row * stride + column];

	finalOperation(ctx, source, destination, stride, across, sourceOffset, callback);
}
