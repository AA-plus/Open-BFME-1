// ?Rva009C0A30Vp6AddNoise@@YAXPAEIIHH@Z
// partial score=1.0 date=2026-10-11
// cl: /O2 /G6 /Z7 /MD
#include <stdlib.h>
#include <string.h>
#include <emmintrin.h>

double __cdecl bfmeGaussPdf(double sigma, double mu, double value);

// ?Rva009C0A30Vp6AddNoise@@YAXPAEIIHH@Z
// Ported from Open BFME 2 Code/Libraries/Source/VP6/PlaneAddNoiseWmt.cpp.
void __cdecl Rva009C0A30Vp6AddNoise(unsigned char *start, unsigned width, unsigned height, int pitch, int noiseLevel)
{
	unsigned noiseIndex;
	double sigma;
	double value;
	int next;
	signed char charDist[300];
	unsigned char noise[2048];
	__declspec(align(16)) unsigned char clampBoth[16];
	__declspec(align(16)) unsigned char clampLow[16];
	__declspec(align(16)) unsigned char clampHigh[16];
	unsigned char *row;
	unsigned rows;

	_mm_empty();
	sigma = 1 + 0.012698412698412698 * (63 - noiseLevel);
	next = 0;
	for (value = -32; value < 32; value++) {
		int amount = (int)(256 * bfmeGaussPdf(sigma, 0, value) + 0.5);
		if (amount) {
			int j;
			for (j = 0; j < amount; j++)
				charDist[next + j] = (signed char)(int)value;
			next += j;
		}
	}
	for (; next < 256; next++)
		charDist[next] = 0;
	for (noiseIndex = 0; noiseIndex < 2048; noiseIndex++)
		noise[noiseIndex] = charDist[rand() & 0xff];
	signed char first = charDist[0];
	signed char negFirst = -first;
	for (noiseIndex = 0; noiseIndex < 16; noiseIndex++)
		clampBoth[noiseIndex] = first * -2;
	for (noiseIndex = 0; noiseIndex < 16; noiseIndex++)
		clampHigh[noiseIndex] = negFirst;
	for (noiseIndex = 0; noiseIndex < 16; noiseIndex++)
		clampLow[noiseIndex] = negFirst;
	if (height > 0) {
		for (row = start, rows = height; rows; rows--) {
			unsigned char *src = row;
			unsigned char *noisePtr = &noise[rand() & 0xff];
			__asm {
				mov ecx, width
				mov esi, src
				mov edi, noisePtr
				xor eax, eax
			again:
				movdqu xmm1, [esi+eax]
				psubusb xmm1, xmmword ptr clampLow
				paddusb xmm1, xmmword ptr clampBoth
				psubusb xmm1, xmmword ptr clampHigh
				movdqu xmm2, [edi+eax]
				paddb xmm1, xmm2
				movdqu [esi+eax], xmm1
				add eax, 16
				cmp eax, ecx
				jl again
			}
			row += pitch;
		}
	}
}
