// cl: /O2 /G6 /Ob1 /DNDEBUG /MD

struct Vp6RawBits {
	unsigned bits; unsigned value; const unsigned char *next;
	// ?peek@Vp6RawBits@@QAEII@Z absent-from-retail
	// Ported from Open BFME 2 Code/Libraries/Source/VP6/HuffTokens.cpp.
	__forceinline unsigned peek(unsigned count)
	{
		unsigned avail = bits;
		unsigned word = value & ((1 << avail) - 1);
		if (avail >= count)
			return word >> (avail - count);
		return (*next | (word << 8)) >> (avail - count + 8);
	}
	// ?skip@Vp6RawBits@@QAEXH@Z absent-from-retail
	// Ported from Open BFME 2 Code/Libraries/Source/VP6/HuffTokens.cpp.
	__forceinline void skip(int count)
	{
		if ((int)(bits -= count) < 0) {
			unsigned v = 0;
			for (int i = 0; i < 4; i++)
				v = (v << 8) + next[i];
			value = v;
			next += 4;
			bits += 32;
		}
	}
	// ?bit@Vp6RawBits@@QAEHXZ absent-from-retail
	// Ported from Open BFME 2 Code/Libraries/Source/VP6/HuffTokens.cpp.
	__forceinline int bit()
	{
		if (bits) { --bits; return (value >> bits) & 1; }
		unsigned v = 0;
		v = (v << 8) + next[0];
		v = (v << 8) + next[1];
		v = (v << 8) + next[2];
		v = (v << 8) + next[3];
		value = v;
		next += 4;
		bits = 31;
		return value >> 31;
	}
};
struct Rva009B4A10Quick { unsigned short leaf : 1; unsigned short value : 5; unsigned short unused : 6; unsigned short length : 4; };
struct Rva009B4A10Edge { unsigned leaf : 1; unsigned value : 7; unsigned unused : 24; };
struct Rva009B4A10Node { Rva009B4A10Edge left; Rva009B4A10Edge right; unsigned probability; };

struct Rva009B4A10Context
{
	unsigned char m_pad000[0x190];
	Vp6RawBits m_bits;
	unsigned char m_pad19c[0x57c - 0x19c];
	unsigned char m_scanOrder[64];
	unsigned char m_pad5bc[0x5fc - 0x5bc];
	unsigned char m_eobOffsets[64];
	unsigned char m_pad63c[0xa20 - 0x63c];
	Rva009B4A10Node m_dcTree[2][12];
	unsigned char m_padb40[0x1a70 - 0xb40];
	Rva009B4A10Node m_acTree[3][2][6][12];
	unsigned char m_pad2eb0[0x2fac - 0x2eb0];
	Rva009B4A10Node m_zeroTree[2][14];
	Rva009B4A10Quick m_dcLookup[2][64];
	Rva009B4A10Quick m_acLookup[3][2][6][64];
	Rva009B4A10Quick m_zeroLookup[2][64];
	unsigned char m_pad44fc[0x4524 - 0x44fc];
	int m_dcRun[2];
	int m_acRun[2];
};

extern const unsigned g_Va01142BE0[33] = {
	0, 1, 3, 7, 15, 31, 63, 127,
	255, 511, 1023, 2047, 4095, 8191, 16383, 32767,
	65535, 131071, 262143, 524287, 1048575, 2097151, 4194303, 8388607,
	16777215, 33554431, 67108863, 134217727, 268435455, 536870911, 1073741823, 2147483647,
	-1,
};
extern const int g_Va011429E8[12] = {
	0, 1, 2, 3, 4, 5, 7, 11,
	19, 35, 67, 0,
};
extern const int g_Va01142A18[65] = {
	-1, 0, 1, 1, 1, 2, 2, 2,
	2, 2, 2, 3, 3, 3, 3, 3,
	3, 3, 3, 3, 3, 3, 3, 3,
	3, 3, 3, 3, 3, 3, 3, 3,
	3, 3, 3, 3, 3, 3, 3, 3,
	3, 3, 3, 3, 3, 3, 3, 3,
	3, 3, 3, 3, 3, 3, 3, 3,
	3, 3, 3, 3, 3, 3, 3, 3,
	3,
};

// ?Rva009B46E0ReadBits@@YAIPAUVp6RawBits@@H@Z
// Ported from Open BFME 2 Code/Libraries/Source/VP6/HuffTokens.cpp.
static unsigned Rva009B46E0ReadBits(Vp6RawBits *state, int bits)
{
	unsigned result = 0;
	state->value &= g_Va01142BE0[state->bits];
	bits -= state->bits;
	if (bits > 0) {
		result = state->value << bits;
		unsigned value = 0;
		for (int i = 0; i < 4; i++)
			value = (value << 8) + state->next[i];
		state->value = value;
		state->next += 4;
		bits -= 32;
	}
	state->bits = -bits;
	return result | (state->value >> state->bits);
}

// ?Rva009B47B0ReadBit@@YAHPAUVp6RawBits@@@Z
// Ported from Open BFME 2 Code/Libraries/Source/VP6/HuffTokens.cpp.
static int Rva009B47B0ReadBit(Vp6RawBits *state)
{
	if (state->bits) { --state->bits; return (state->value >> state->bits) & 1; }
	const unsigned char *next = state->next;
	unsigned value = next[0];
	value = (value << 8) + next[1];
	value = (value << 8) + next[2];
	value = (value << 8) + next[3];
	state->value = value;
	state->next = next + 4;
	state->bits = 31;
	return state->value >> 31;
}

// ?Rva009B4A10Token@@YAIPBURva009B4A10Quick@@PAUVp6RawBits@@PBURva009B4A10Node@@@Z absent-from-retail
// Ported from Open BFME 2 Code/Libraries/Source/VP6/HuffTokens.cpp.
static __forceinline unsigned Rva009B4A10Token(const Rva009B4A10Quick *table, Vp6RawBits *reader, const Rva009B4A10Node *nodes)
{
	unsigned index = reader->peek(6);
	reader->skip(table[index].length);
	if (table[index].leaf)
		return table[index].value;
	Rva009B4A10Edge edge;
	edge.value = table[index].value;
	do {
		if (reader->bit())
			edge = nodes[edge.value].right;
		else
			edge = nodes[edge.value].left;
	} while (!edge.leaf);
	return edge.value;
}

// ?Rva009B4A10@@YAEPAEPAFH@Z
// Ported from Open BFME 2 Code/Libraries/Source/VP6/HuffTokens.cpp.
unsigned char Rva009B4A10(unsigned char *ctx, short *coeffs, int plane)
{
	Rva009B4A10Context *pbi = (Rva009B4A10Context *)ctx;
	Vp6RawBits *br = &pbi->m_bits;
	int pos = 1;
	int prec;
	int token;
	unsigned zero;
	int value, sign, run, band, table, extra;

	if (pbi->m_dcRun[plane] > 0) {
		pbi->m_dcRun[plane]--;
		prec = 0;
	} else {
		token = Rva009B4A10Token(pbi->m_dcLookup[plane], br, pbi->m_dcTree[plane]);
		value = g_Va011429E8[token];
		if (token == 11)
			goto done;
		if (token == 0) {
			run = Rva009B46E0ReadBits(br, 2) + 1;
			if (run == 3)
				run = Rva009B46E0ReadBits(br, 2) + 3;
			else if (run == 4) {
				if (Rva009B47B0ReadBit(br))
					run = Rva009B46E0ReadBits(br, 6) + 11;
				else
					run = Rva009B46E0ReadBits(br, 2) + 7;
			}
			pbi->m_dcRun[plane] = run - 1;
			prec = 0;
		} else {
			if (token > 4) {
				extra = token - 4;
				if (token > 9)
					extra = 11;
				value += Rva009B46E0ReadBits(br, extra);
			}
			sign = Rva009B47B0ReadBit(br);
			coeffs[0] = (short)((value ^ -sign) + sign);
			prec = (value > 1) + 1;
		}
	}

	if (pbi->m_acRun[plane] > 0) {
		pbi->m_acRun[plane]--;
		goto done;
	}

	do {
		band = g_Va01142A18[pos];
		token = Rva009B4A10Token(pbi->m_acLookup[prec][plane][band], br, pbi->m_acTree[prec][plane][band]);
		value = g_Va011429E8[token];
		if (token == 0) {
			table = pos >= 6;
			zero = Rva009B4A10Token(pbi->m_zeroLookup[table], br, pbi->m_zeroTree[table]);
			if (zero < 8)
				pos += zero;
			else
				pos += Rva009B46E0ReadBits(br, 6) + 8;
			prec = 0;
			pos++;
		} else if (token == 11) {
			if (pos == 1) {
				run = Rva009B46E0ReadBits(br, 2) + 1;
				if (run == 3)
					run = Rva009B46E0ReadBits(br, 2) + 3;
				else if (run == 4) {
					if (Rva009B47B0ReadBit(br))
						run = Rva009B46E0ReadBits(br, 6) + 11;
					else
						run = Rva009B46E0ReadBits(br, 2) + 7;
				}
				pbi->m_acRun[plane] = run - 1;
			}
			goto done;
		} else {
			if (token <= 4)
				sign = br->bit();
			else {
				extra = token - 4;
				if (token > 9)
					extra = 11;
				value += Rva009B46E0ReadBits(br, extra);
				sign = Rva009B47B0ReadBit(br);
			}
			coeffs[pbi->m_scanOrder[pos]] = (short)((value ^ -sign) + sign);
			prec = (value > 1) + 1;
			pos++;
		}
	} while (pos < 64);
done:
	return pbi->m_eobOffsets[pos - 1];
}
