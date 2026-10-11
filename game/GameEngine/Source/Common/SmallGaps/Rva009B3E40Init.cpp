// ?initBlocksRva009B3E40@@YAXPAX@Z
// retail .data 0x012D8358, 64 entries (indices i..i+3, i<0x40); the
// 0x012D8458 block table follows.
int g_Rva009B3E40Arr0[64] = {
	0, 1, 5, 6, 14, 15, 27, 28,
	2, 4, 7, 13, 16, 26, 29, 42,
	3, 8, 12, 17, 25, 30, 41, 43,
	9, 11, 18, 24, 31, 40, 44, 53,
	10, 19, 23, 32, 39, 45, 52, 54,
	20, 22, 33, 38, 46, 51, 55, 60,
	21, 34, 37, 47, 50, 56, 59, 61,
	35, 36, 48, 49, 57, 58, 62, 63,
};
// retail .data 0x012D8458, 64 offsets indexed by g_Rva009B3E40Arr0 values (0..63).
void* g_Rva009B3E40Blocks[64] = {
	(void *)0, (void *)8, (void *)1, (void *)2, (void *)9, (void *)16, (void *)24, (void *)17,
	(void *)10, (void *)3, (void *)32, (void *)11, (void *)18, (void *)25, (void *)4, (void *)12,
	(void *)5, (void *)26, (void *)19, (void *)40, (void *)33, (void *)34, (void *)41, (void *)48,
	(void *)27, (void *)6, (void *)13, (void *)20, (void *)28, (void *)21, (void *)14, (void *)7,
	(void *)56, (void *)49, (void *)42, (void *)35, (void *)43, (void *)50, (void *)57, (void *)36,
	(void *)15, (void *)22, (void *)29, (void *)30, (void *)23, (void *)44, (void *)37, (void *)58,
	(void *)51, (void *)59, (void *)38, (void *)45, (void *)52, (void *)31, (void *)60, (void *)53,
	(void *)46, (void *)39, (void *)47, (void *)54, (void *)61, (void *)62, (void *)55, (void *)63,
};

void initBlocksRva009B3E40(void* self)
{
	*(void***)((char*)self + 0x13c) = g_Rva009B3E40Blocks;

	for (int i = 0; i < 0x40; i += 4) {
		*((char*)g_Rva009B3E40Blocks[g_Rva009B3E40Arr0[i]] + (unsigned)self + 0x140) = (char)(i + 0);
		*((char*)g_Rva009B3E40Blocks[g_Rva009B3E40Arr0[i + 1]] + (unsigned)self + 0x140) = (char)(i + 1);
		*((char*)g_Rva009B3E40Blocks[g_Rva009B3E40Arr0[i + 2]] + (unsigned)self + 0x140) = (char)(i + 2);
		*((char*)g_Rva009B3E40Blocks[g_Rva009B3E40Arr0[i + 3]] + (unsigned)self + 0x140) = (char)(i + 3);
	}
}
