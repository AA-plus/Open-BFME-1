// cl: /O2 /G6 /DNDEBUG /MD
struct Rva009B4900Reader {
	unsigned remaining; unsigned word; const unsigned char *next;
// ?peek@Rva009B4900Reader@@QAEII@Z absent-from-retail
// Ported from Open BFME 2 Code/Libraries/Source/VP6/Rva001C5200ExtractTokenN.cpp.
	__forceinline unsigned peek(unsigned count)
	{
		unsigned avail = remaining;
		unsigned word = this->word & ((1 << avail) - 1);
		if (avail >= count)
			return word >> (avail - count);
		return (*next | (word << 8)) >> (avail - count + 8);
	}
// ?skip@Rva009B4900Reader@@QAEXH@Z absent-from-retail
// Ported from Open BFME 2 Code/Libraries/Source/VP6/Rva001C5200ExtractTokenN.cpp.
	__forceinline void skip(int count)
	{
		if ((int)(remaining -= count) < 0) {
			unsigned v = 0;
			for (int i = 0; i < 4; i++)
				v = (v << 8) + next[i];
			word = v;
			next += 4;
			remaining += 32;
		}
	}
// ?bit@Rva009B4900Reader@@QAEHXZ absent-from-retail
// Ported from Open BFME 2 Code/Libraries/Source/VP6/Rva001C5200ExtractTokenN.cpp.
	__forceinline int bit()
	{
		if (remaining) { --remaining; return (word >> remaining) & 1; }
		unsigned v = 0;
		v = (v << 8) + next[0];
		v = (v << 8) + next[1];
		v = (v << 8) + next[2];
		v = (v << 8) + next[3];
		word = v;
		next += 4;
		remaining = 31;
		return word >> 31;
	}
};
union Rva009B4900Prefix {
    unsigned short raw;
    struct { unsigned short leaf:1, value:5, unused:6, bits:4; } code;
};
union Rva009B4900Code {
    unsigned raw;
    struct { unsigned leaf:1, value:7, unused:24; } code;
};
struct Rva009B4900Node {
    Rva009B4900Code child[2];
    unsigned unused;
};
// ?Rva009B4900@@YAIPAURva009B4900Reader@@PBTRva009B4900Prefix@@PBURva009B4900Node@@@Z
// Ported from Open BFME 2 Code/Libraries/Source/VP6/Rva001C5200ExtractTokenN.cpp.
static unsigned Rva009B4900(Rva009B4900Reader *reader, const Rva009B4900Prefix *prefix, const Rva009B4900Node *tree)
{
	unsigned index = reader->peek(6);
	reader->skip(prefix[index].code.bits);
	if (prefix[index].code.leaf)
		return prefix[index].code.value;
	Rva009B4900Code edge;
	edge.code.value = prefix[index].code.value;
	do {
		if (reader->bit())
			edge = tree[edge.code.value].child[1];
		else
			edge = tree[edge.code.value].child[0];
	} while (!edge.code.leaf);
	return edge.code.value;
}
// ?Rva009B4900Call@@YAIPAURva009B4900Reader@@PBTRva009B4900Prefix@@PBURva009B4900Node@@@Z absent-from-retail
// Ported from Open BFME 2 Code/Libraries/Source/VP6/Rva001C5200ExtractTokenN.cpp.
unsigned Rva009B4900Call(Rva009B4900Reader *reader, const Rva009B4900Prefix *prefix, const Rva009B4900Node *tree) { return Rva009B4900(reader, prefix, tree); }
