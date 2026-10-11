// ?Rva009B3F40Vp6Reconstruct@@YAXPAXPAF1E@Z
// cl: /O2 /G6 /Z7 /MD
#include <stdlib.h>
extern unsigned char g_Rva01142608[8];
// VP6 zigzag scan order (retail VA 0x012D8258, 256 .data bytes; the next
// independent table starts at 0x012D8358).
extern "C" int g_Va012D8258[64] = {
	0, 1, 8, 16, 9, 2, 3, 10,
	17, 24, 32, 25, 18, 11, 4, 5,
	12, 19, 26, 33, 40, 48, 41, 34,
	27, 20, 13, 6, 7, 14, 21, 28,
	35, 42, 49, 56, 57, 50, 43, 36,
	29, 22, 15, 23, 30, 37, 44, 51,
	58, 59, 52, 45, 38, 31, 39, 46,
	53, 60, 61, 54, 47, 55, 62, 63,
};

struct Rva009A6780State {
    int index, at0004;
    short at0008[8], at0018[8], at0028[8];
    unsigned char pad0038[0x158];
    int at0190[2][64], at0390[2][64], at0590[2][64], at0790[2][64];
};

struct Rva009B3F40TableView {
    unsigned char pad0[0x190];
    int at0190[64], pad100[64], at0390[64], pad300[64];
    int at0590[64], pad500[64], at0790[64];
};

// ?Rva009B3F40Vp6Reconstruct@@YAXPAXPAF1E@Z
// Ported from Open BFME 2 Code/Libraries/Source/VP6/QuantizeWmt.cpp.
void Rva009B3F40Vp6Reconstruct(void *context, short *source, short *destination, unsigned char selector)
{
	Rva009A6780State *state = static_cast<Rva009A6780State *>(context);
	__declspec(align(16)) unsigned short frame[64];
	int plane = g_Rva01142608[selector];
	Rva009B3F40TableView *bank = (Rva009B3F40TableView *)((char *)state + plane * 256);
	int multiplier = ((int *)((char *)state + 0x190))[plane * 64];
	int run;
	unsigned i;
	short *dst;

	{
		short *offsetPointer = state->at0008;
		short *reciprocal = state->at0018;
		run = 0;
		__asm {
			mov esi, source
			xor ecx, ecx
			mov edi, offsetPointer
			movdqu xmm2, [edi]
			mov edi, reciprocal
			movdqu xmm3, [edi]
			lea edi, frame
			mov eax, destination
			pxor xmm7, xmm7
		again:
			movdqa xmm0, [esi+ecx]
			movdqa xmm1, xmm0
			psraw xmm1, 15
			pxor xmm0, xmm1
			psubw xmm0, xmm1
			paddw xmm0, xmm2
			pmulhuw xmm0, xmm3
			pxor xmm0, xmm1
			psubw xmm0, xmm1
			movdqa [edi+ecx], xmm0
			movdqa [eax+ecx], xmm7
			add ecx, 16
			cmp ecx, 128
			jl again
		}
	}
	{
		int dc = source[0];
		if (dc >= bank->at0590[0])
			destination[0] = (short)(((dc + bank->at0390[0]) * multiplier) >> 16);
		else if (dc <= -bank->at0590[0])
			destination[0] = (short)(((dc - bank->at0390[0]) * multiplier + 0xFFFF) >> 16);
		else
			run = 1;
	}
	dst = destination + 3;
	for (i = 4; i < 256; i += 12, dst += 3) {
		int k, c, mag;
		k = *(int *)((char *)g_Va012D8258 + i);
		c = frame[k];
		if (c == 0) run++;
		else {
			mag = abs(source[k]);
			if (mag < bank->at0790[run] + bank->at0590[k]) run++;
			else { run = 0; dst[-2] = (short)c; }
		}
		k = *(int *)((char *)g_Va012D8258 + i + 4);
		c = frame[k];
		if (c == 0) run++;
		else {
			mag = abs(source[k]);
			if (mag < bank->at0790[run] + bank->at0590[k]) run++;
			else { run = 0; dst[-1] = (short)c; }
		}
		k = *(int *)((char *)g_Va012D8258 + i + 8);
		c = frame[k];
		if (c == 0) run++;
		else {
			mag = abs(source[k]);
			if (mag < bank->at0790[run] + bank->at0590[k]) run++;
			else { run = 0; dst[0] = (short)c; }
		}
	}
}
