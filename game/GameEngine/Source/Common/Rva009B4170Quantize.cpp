// ?Rva009B4170@@YAXPAXPAF1E@Z
// cl: /O2 /G6 /Z7 /MD
#include <stdlib.h>
extern unsigned char g_Rva01142608[8];
extern "C" int g_Va012D8258[];

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

// ?Rva009B4170@@YAXPAXPAF1E@Z
// Ported from Open BFME 2 Code/Libraries/Source/VP6/QuantizeMmx.cpp.
void Rva009B4170(void *rawState, short *input, short *output, unsigned char selector)
{
	Rva009A6780State *state = static_cast<Rva009A6780State *>(rawState);
	__declspec(align(16)) unsigned short work[64];
	int plane = g_Rva01142608[selector];
	Rva009B3F40TableView *table = (Rva009B3F40TableView *)((char *)state + plane * 256);
	int reciprocal = ((int *)((char *)state + 0x190))[plane * 64];
	int run;
	unsigned i;
	short *dst;

	{
		short *state8 = state->at0008;
		short *state18 = state->at0018;
		run = 0;
		__asm {
			mov esi, input
			xor ecx, ecx
			mov edi, state8
			movq mm2, [edi]
			mov edi, state18
			movq mm3, [edi]
			lea edi, work
			mov eax, output
			pxor mm7, mm7
		again:
			movq mm0, [esi+ecx]
			movq mm1, mm0
			psraw mm1, 15
			pxor mm0, mm1
			psubw mm0, mm1
			paddw mm0, mm2
			pmulhuw mm0, mm3
			pxor mm0, mm1
			psubw mm0, mm1
			movq [edi+ecx], mm0
			movq [eax+ecx], mm7
			add ecx, 8
			cmp ecx, 128
			jl again
		}
	}
	{
		int dc = input[0];
		if (dc >= table->at0590[0])
			output[0] = (short)(((dc + table->at0390[0]) * reciprocal) >> 16);
		else if (dc <= -table->at0590[0])
			output[0] = (short)(((dc - table->at0390[0]) * reciprocal + 0xFFFF) >> 16);
		else
			run = 1;
	}
	dst = output + 3;
	for (i = 4; i < 256; i += 12, dst += 3) {
		int k, c, mag;
		k = *(int *)((char *)g_Va012D8258 + i);
		c = work[k];
		if (c == 0) run++;
		else {
			mag = abs(input[k]);
			if (mag < table->at0790[run] + table->at0590[k]) run++;
			else { run = 0; dst[-2] = (short)c; }
		}
		k = *(int *)((char *)g_Va012D8258 + i + 4);
		c = work[k];
		if (c == 0) run++;
		else {
			mag = abs(input[k]);
			if (mag < table->at0790[run] + table->at0590[k]) run++;
			else { run = 0; dst[-1] = (short)c; }
		}
		k = *(int *)((char *)g_Va012D8258 + i + 8);
		c = work[k];
		if (c == 0) run++;
		else {
			mag = abs(input[k]);
			if (mag < table->at0790[run] + table->at0590[k]) run++;
			else { run = 0; dst[0] = (short)c; }
		}
	}
}
