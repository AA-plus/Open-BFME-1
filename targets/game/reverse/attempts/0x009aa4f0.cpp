// ?Rva009AA4F0ScalePlanes@@YAPAURva009AA4F0Block@@PAURva009AA4F0Context@@HPAU1@HH@Z
// partial score=0.2871 date=2026-10-13
// ?Rva009AA4F0ScalePlanes@@YAPAURva009AA4F0Block@@PAURva009AA4F0Context@@HPAU1@HH@Z

struct Rva009AA260Context
{
	unsigned char m_pad00[0x58];
	int m_hscale;
	int m_hratio;
	int m_vscale;
	int m_vratio;
};

struct Rva009AA4F0Context
{
	unsigned char m_pad00[0x40];
	unsigned int m_bytes;
	unsigned char m_pad44[0x14];
	int m_hscale;
	int m_hratio;
	int m_vscale;
	int m_vratio;
	unsigned char m_pad68[8];
	unsigned int m_height;
	unsigned int m_width;
	unsigned char *m_source0;
	unsigned char *m_source1;
	unsigned char *m_source2;
	unsigned char m_pad84[0x30];
	unsigned int m_atB4;
};

struct Rva009AA4F0Block
{
	unsigned int m_width;
	unsigned int m_height;
	unsigned int m_at08;
	unsigned int m_at0C;
	unsigned char m_pad10[4];
	unsigned int m_at14;
	unsigned char *m_at18;
	unsigned char *m_at1C;
	unsigned char *m_at20;
};

extern int __cdecl Rva009AA260Scale(
	Rva009AA260Context *, const unsigned char *, int, unsigned int,
	unsigned int, unsigned char *, unsigned int, unsigned int, unsigned int);
extern "C" void * __cdecl memset(void *, int, unsigned int);
#pragma intrinsic(memset)

static int Rva009AA4F0Align(
	unsigned int dimension, int scale, int ratio)
{
	if (ratio == 3)
		return (((int)(dimension + 2) / 3 * scale) * 3) / ratio;
	return (((int)(dimension + 7) / 8 * 8 * scale) / ratio);
}

struct Rva009AA4F0Dimensions { unsigned int height, scaledHeight, width, scaledWidth; };

Rva009AA4F0Block *__cdecl Rva009AA4F0ScalePlanes(
	Rva009AA4F0Context *context, int offset, Rva009AA4F0Block *block,
	int lumaOffset, int chromaOffset)
{
	Rva009AA4F0Dimensions dims;
	int hratio = context->m_hratio;
	dims.height = context->m_height;
	int hscale = context->m_hscale;
	dims.scaledHeight =
		(dims.height * hratio + hscale - 1) / hscale;
	int vscale = context->m_vscale;
	dims.width = context->m_width;
	dims.scaledWidth =
		(dims.width * context->m_vratio + vscale - 1) / vscale;
	int alignedHeight = Rva009AA4F0Align(
		dims.scaledHeight, hscale, hratio);
	int alignedWidth = Rva009AA4F0Align(
		dims.scaledWidth, vscale, context->m_vratio);

	int scaleResult = Rva009AA260Scale(
		(Rva009AA260Context *)context,
		context->m_source0 + offset,
		context->m_bytes + context->m_atB4 * 2,
		dims.scaledHeight, dims.height,
		block->m_at18 + lumaOffset, block->m_at08,
		dims.scaledWidth, dims.width);

	for (int row = 0; row < alignedWidth; ++row)
		memset(block->m_at18 + lumaOffset + dims.height +
			row * block->m_at08,
			0, alignedHeight - dims.height);

	for (int row = dims.width; row < alignedWidth; ++row)
		memset(block->m_at18 + lumaOffset + row * block->m_at08,
			0, alignedHeight);

	if (scaleResult == 0)
		return 0;

	Rva009AA260Scale(
		(Rva009AA260Context *)context,
		context->m_source1 + offset,
		(context->m_bytes >> 1) + context->m_atB4,
		(dims.scaledHeight + 1) >> 1, (dims.scaledWidth + 1) >> 1,
		block->m_at1C + chromaOffset, block->m_at14,
		(dims.height + 1) >> 1, (dims.width + 1) >> 1);
	Rva009AA260Scale(
		(Rva009AA260Context *)context,
		context->m_source2 + offset,
		(context->m_bytes >> 1) + context->m_atB4,
		(dims.scaledHeight + 1) >> 1, (dims.scaledWidth + 1) >> 1,
		block->m_at20 + chromaOffset, block->m_at14,
		(dims.height + 1) >> 1, (dims.width + 1) >> 1);
	return block;
}
