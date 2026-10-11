// ?Rva009C80C0@@YAXPBF0PAF@Z
// partial score=1.0 date=2026-10-11
// cl: /O2 /G6 /Z7 /MD
// Ported from Open BFME 2 Code/Libraries/Source/VP6/Idct1Wmt.cpp.
void __cdecl Rva009C80C0(const short *input, const short *table, short *output)
{
	__asm {
		mov eax, input
		mov edx, 15
		movd xmm2, edx
		mov ecx, table
		mov edx, output
		movq xmm0, qword ptr [eax]
		movq xmm1, qword ptr [ecx]
		pmullw xmm0, xmm1
		paddw xmm0, xmm2
		psraw xmm0, 5
		punpcklwd xmm0, xmm0
		punpckldq xmm0, xmm0
		punpcklqdq xmm0, xmm0
		movdqa xmm1, xmm0
		movdqa [edx], xmm0
		movdqa [edx+10h], xmm1
		movdqa [edx+20h], xmm0
		movdqa [edx+30h], xmm1
		movdqa [edx+40h], xmm0
		movdqa [edx+50h], xmm1
		movdqa [edx+60h], xmm0
		movdqa [edx+70h], xmm1
	}
}
