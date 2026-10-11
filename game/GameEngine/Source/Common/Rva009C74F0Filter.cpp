// cl: /O2 /G6 /MD
#include <emmintrin.h>

extern const unsigned char g_012D8C10[];

#define BILINEAR_BANK(phase) (g_012D8C10 + (phase) * 32)
#define BICUBIC_BANK(phase) (g_012D8C10 + 0x100 + (phase) * 64)

void __cdecl rva009C6F20BinkSse(const void *, void *, int, int, int, int, const void *);
void __cdecl rva009C6FC0BinkSse(const void *, void *, int, int, int, int, const void *);
void __cdecl rva009C7490BinkSse(const unsigned char *, unsigned char *, int, const void *, const void *);
void __cdecl rva009C72C0BinkSse(const void *, void *, int, int, int, int, const void *);
void __cdecl rva009C7320BinkSse(const void *, void *, int, int, int, int, const void *);
void __cdecl rva009C7200BinkSse(const void *, void *, int, const void *, const void *);

// ?rva009c74f0@@YAXPBE0PAFHHHH@Z
// Ported from Open BFME 2 Code/Libraries/Source/VP6/FilterBlockWmt.cpp.
void __cdecl rva009c74f0(const unsigned char *p1, const unsigned char *p2, short *p3, int p4, int p5, int p6, int p7)
{
	unsigned char block[256];
	int diff = p2 - p1;
	if (diff < 0) {
		const unsigned char *t = p1;
		p1 = p2;
		p2 = t;
		diff = p2 - p1;
	}
	if (diff == 0)
		return;
	if (p7) {
		if (diff == 1)
			rva009C6F20BinkSse(p1, block, p4, 1, 8, 8, BICUBIC_BANK(p5));
		else if (diff == p4)
			rva009C6FC0BinkSse(p1, block, p4, p4, 8, 8, BICUBIC_BANK(p6));
		else if (diff == p4 - 1)
			rva009C7490BinkSse(p1 - 1, block, p4, BICUBIC_BANK(p5), BICUBIC_BANK(p6));
		else if (diff == p4 + 1)
			rva009C7490BinkSse(p1, block, p4, BICUBIC_BANK(p5), BICUBIC_BANK(p6));
		{
			int srcStride = 8;
			const unsigned char *src = block;
			__asm {
				mov edi, p3
				mov esi, src
				mov ecx, 8
				mov eax, 16
				pxor xmm0, xmm0
			LunpackLoop:
				movdqu xmm3, [esi]
				punpcklbw xmm3, xmm0
				movdqu [edi], xmm3
				add esi, srcStride
				add edi, eax
				dec ecx
				jne LunpackLoop
			}
		}
		return;
	}
	if (diff == 1)
		rva009C72C0BinkSse(p1, p3, p4, 1, 8, 16, BILINEAR_BANK(p5));
	else if (diff == p4)
		rva009C7320BinkSse(p1, p3, p4, p4, 8, 16, BILINEAR_BANK(p6));
	else if (diff == p4 - 1)
		rva009C7200BinkSse(p1 - 1, p3, p4, BILINEAR_BANK(p5), BILINEAR_BANK(p6));
	else if (diff == p4 + 1)
		rva009C7200BinkSse(p1, p3, p4, BILINEAR_BANK(p5), BILINEAR_BANK(p6));
}
