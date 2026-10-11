// cl: /O2 /G6 /DNDEBUG /MD

// ?Rva009A9980@@YAXPBEHIIPAEHII@Z
// Ported from Open BFME 2 Code/Libraries/Source/VP6/Scale1D.cpp.
void __cdecl Rva009A9980(const unsigned char *source, int sourcePitch, unsigned step, unsigned sourceCount, unsigned char *destination, int destinationPitch, unsigned ratio, unsigned outputCount)
{
	unsigned denominator = ratio;
	unsigned half = denominator >> 1;
	unsigned leftWeight = denominator;
	unsigned phase = 0;
	unsigned char left = source[0];
	unsigned char right = source[sourcePitch];
	unsigned output;
	for (output = 0; output < destinationPitch * outputCount; output += destinationPitch) {
		destination[output] = (left * leftWeight + right * phase + half) / denominator;
		phase += step;
		while (phase > denominator) {
			source += sourcePitch;
			left = source[0];
			right = source[sourcePitch];
			phase -= denominator;
		}
		leftWeight = denominator - phase;
	}
}

// ?Rva009A9A20@@YAXPBEHIIPAEHII@Z
// Ported from Open BFME 2 Code/Libraries/Source/VP6/Scale1D.cpp.
void __cdecl Rva009A9A20(const unsigned char *source, int sourcePitch, unsigned step, unsigned sourceCount, unsigned char *destination, int destinationPitch, unsigned ratio, unsigned outputCount)
{
	unsigned output, sourceOffset;
	unsigned sourceStep = sourcePitch * 2;
	destination[0] = source[0];
	for (output = destinationPitch, sourceOffset = sourceStep; output < destinationPitch * outputCount; output += destinationPitch, sourceOffset += sourceStep)
		destination[output] = (unsigned)(3 * source[sourceOffset - sourceStep] + 10 * source[sourceOffset] + 3 * source[sourceOffset + sourceStep] + 8) >> 4;
}
