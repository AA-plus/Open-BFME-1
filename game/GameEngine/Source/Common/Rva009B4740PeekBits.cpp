// cl: /DNDEBUG /MD
struct Vp6RawBits { unsigned bits; unsigned value; const unsigned char *next; };
// ?Rva009B4740PeekBits@@YAIPAUVp6RawBits@@I@Z
// Ported from Open BFME 2 Code/Libraries/Source/VP6/Rva001C5040PeekBits.cpp.
static unsigned Rva009B4740PeekBits(Vp6RawBits *state, unsigned bits)
{
	unsigned avail = state->bits;
	unsigned word = state->value & ((1 << avail) - 1);
	if (avail >= bits)
		return word >> (avail - bits);
	return (*state->next | (word << 8)) >> (avail - bits + 8);
}
// ?Rva009B4740Call@@YAIPAUVp6RawBits@@I@Z absent-from-retail
// Ported from Open BFME 2 Code/Libraries/Source/VP6/Rva001C5040PeekBits.cpp.
unsigned Rva009B4740Call(Vp6RawBits *state, unsigned bits) { return Rva009B4740PeekBits(state, bits); }
