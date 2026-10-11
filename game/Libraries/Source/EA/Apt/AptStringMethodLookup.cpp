// cl: /O2 /Ob1 /DNDEBUG /DWIN32 /D_WINDOWS /MD /EHs-c-
#include <string.h>

struct R4Word
{
	const char *name;
	int value;
};

int bfmeSkipVE(const unsigned char *text, int length);

// Each NUL-terminated key and its table pointers are verified against retail.
extern const char g_Va011367C0[] = "split";
extern const char g_Va011367B8[] = "charAt";
extern const char g_Va011367B0[] = "concat";
extern const char g_Va011367A8[] = "indexOf";
extern const char g_Va0113679C[] = "substring";
extern const char g_Va01136790[] = "charCodeAt";
extern const char g_Va01136784[] = "lastIndexOf";
extern const char g_Va0113677C[] = "slice";
extern const char g_Va01136774[] = "length";
extern const char g_Va0113676C[] = "substr";
extern const char g_Va01136760[] = "toLowerCase";
extern const char g_Va01136754[] = "toUpperCase";
extern const char g_Va01136744[] = "fromCharCode";

extern const R4Word g_Va012D5518[] =
{
	{ g_Va011367C0, 9 },
	{ g_Va011367B8, 2 },
	{ g_Va011367B0, 4 },
	{ g_Va011367A8, 6 },
	{ g_Va0113679C, 11 },
	{ g_Va01136790, 3 },
	{ g_Va01136784, 7 },
	{ g_Va0113677C, 8 },
	{ g_Va01136774, 1 },
	{ g_Va0113676C, 10 },
	{ g_Va01136760, 12 },
	{ g_Va01136754, 13 },
	{ g_Va01136744, 5 },
};

// Key range0..22; collision descriptors occupy existing slots12/13 and18/19.
extern const signed char g_Va012D5580[] =
{
	-1, -1, -1, -1, -1, 0, -26, 3, -1, 4, 5, 6,
	-12, -2, -1, 7, 8, -1, -3, -2, 9, -32, 12
};

const R4Word *Rva008A9710(const char *str, unsigned int len)
{
	if (len <= 12 && len >= 5)
	{
		register int key = bfmeSkipVE((const unsigned char *)str, (int)len);
		if (key <= 0x16 && key >= 0)
		{
			register int index = g_Va012D5580[key];
			if (index >= 0)
			{
				register const char *s = g_Va012D5518[index].name;
				if (*str == *s && !strcmp(str + 1, s + 1))
					return &g_Va012D5518[index];
			}
			else if (index < -13)
			{
				register int offset = -1 - 13 - index;
				register const R4Word *wordptr = (g_Va012D5518 + 13) + g_Va012D5580[offset];
				register const R4Word *wordendptr = wordptr - g_Va012D5580[offset + 1];
				while (wordptr < wordendptr)
				{
					register const char *s = wordptr->name;
					if (*str == *s && !strcmp(str + 1, s + 1))
						return wordptr;
					wordptr++;
				}
			}
		}
	}
	return 0;
}
