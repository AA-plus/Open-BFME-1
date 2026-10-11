// cl: /DNDEBUG /MD
struct Vp6RawBits { unsigned bits; unsigned value; const unsigned char *next; };
// ?Rva009B4770SkipBits@@YAXPAUVp6RawBits@@H@Z
// Ported from Open BFME 2 Code/Libraries/Source/VP6/Rva001C5070SkipBits.cpp.
static void Rva009B4770SkipBits(Vp6RawBits *state, int bits)
{
	if ((int)(state->bits -= bits) < 0) {
		const unsigned char *next = state->next;
		unsigned value = next[0];
		value = (value << 8) + next[1];
		value = (value << 8) + next[2];
		value = (value << 8) + next[3];
		state->value = value;
		state->next = next + 4;
		state->bits += 32;
	}
}
// ?Rva009B4770Call@@YAXPAUVp6RawBits@@H@Z absent-from-retail
// Ported from Open BFME 2 Code/Libraries/Source/VP6/Rva001C5070SkipBits.cpp.
void Rva009B4770Call(Vp6RawBits *state, int bits) { Rva009B4770SkipBits(state, bits); }
