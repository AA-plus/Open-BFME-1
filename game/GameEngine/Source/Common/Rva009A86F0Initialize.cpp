// cl: /O2 /G6 /DNDEBUG /MD
class Bucket
{
public:
	enum BucketMagicEnum
	{
		Bucket_GLUE_NOT_IMPLEMENTED = 0
	};
	static void *operator new(unsigned int size, BucketMagicEnum tag);
};
void bfmeStepJW(void *instance);
struct Rva009A86F0Context {
	unsigned char *m_at00;
	unsigned char *m_at04;
	unsigned char unknown8[0x10c - 0x8];
	unsigned char *m_at10c, *m_at110, *m_at114;
	unsigned char *m_at118, *m_at11c, *m_at120;
	unsigned char unknown124[0x148 - 0x124];
	unsigned char *m_at148;
	unsigned char *m_at14c;
	unsigned char unknown150[0x1f8 - 0x150];
	unsigned m_count;
	unsigned m_count2;
	unsigned char unknown200[0x228 - 0x200];
	unsigned m_bufferSize;
	unsigned char unknown22c[0x6ec - 0x22c];
	unsigned char *m_at6ec, *m_at6f0, *m_at6f4;
	unsigned char *m_at6f8, *m_at6fc, *m_at700;
};
#define VP6_ALIGN32(p) ((unsigned char *)(((unsigned)(p) + 31) & ~31))
// ?Rva009A86F0Initialize@@YAHPAURva009A86F0Context@@@Z
// Ported from Open BFME 2 Code/Libraries/Source/VP6/AllocateFragmentInfo.cpp.
int __cdecl Rva009A86F0Initialize(Rva009A86F0Context *self)
{
	bfmeStepJW(self);
	self->m_at00 = (unsigned char *)Bucket::operator new(0x320, Bucket::Bucket_GLUE_NOT_IMPLEMENTED);
	if (!self->m_at00)
		goto fail;
	self->m_at04 = VP6_ALIGN32(self->m_at00);
	self->m_at118 = (unsigned char *)Bucket::operator new((self->m_count + 10) * 16, Bucket::Bucket_GLUE_NOT_IMPLEMENTED);
	if (!self->m_at118)
		goto fail;
	self->m_at10c = VP6_ALIGN32(self->m_at118);
	self->m_at11c = (unsigned char *)Bucket::operator new(((self->m_count >> 1) + 10) * 16, Bucket::Bucket_GLUE_NOT_IMPLEMENTED);
	if (!self->m_at11c)
		goto fail;
	self->m_at110 = VP6_ALIGN32(self->m_at11c);
	self->m_at120 = (unsigned char *)Bucket::operator new(((self->m_count >> 1) + 10) * 16, Bucket::Bucket_GLUE_NOT_IMPLEMENTED);
	if (!self->m_at120)
		goto fail;
	self->m_at114 = VP6_ALIGN32(self->m_at120);
	self->m_at6f8 = (unsigned char *)Bucket::operator new(self->m_bufferSize + 32, Bucket::Bucket_GLUE_NOT_IMPLEMENTED);
	if (!self->m_at6f8)
		goto fail;
	self->m_at6ec = VP6_ALIGN32(self->m_at6f8);
	self->m_at6fc = (unsigned char *)Bucket::operator new(self->m_bufferSize + 32, Bucket::Bucket_GLUE_NOT_IMPLEMENTED);
	if (!self->m_at6fc)
		goto fail;
	self->m_at6f0 = VP6_ALIGN32(self->m_at6fc);
	self->m_at700 = (unsigned char *)Bucket::operator new(self->m_bufferSize * 4 + 32, Bucket::Bucket_GLUE_NOT_IMPLEMENTED);
	if (!self->m_at700)
		goto fail;
	self->m_at6f4 = VP6_ALIGN32(self->m_at700);
	self->m_at14c = (unsigned char *)Bucket::operator new(self->m_count2 * 4 + 32, Bucket::Bucket_GLUE_NOT_IMPLEMENTED);
	if (!self->m_at14c)
		goto fail;
	self->m_at148 = VP6_ALIGN32(self->m_at14c);
	return 1;
fail:
	bfmeStepJW(self);
	return 0;
}
