// cl: /DNDEBUG /MD /EHsc /Igame/Libraries/Source/WWVegas/WWLib
#include "ascii_string.h"

extern const char g_Rva0107301CEmptyString[];

int __cdecl Rva0046F910(int rank, AsciiString *side);

void *__cdecl bfmeLookupDL(void *ctx, int side)
{
	const char *name;

	switch (side)
	{
	case 0:
		name = "Rohan";
		break;

	case 1:
		name = "Gondor";
		break;

	case 2:
		name = "Mordor";
		break;

	case 3:
		name = "Isengard";
		break;

	default:
		name = g_Rva0107301CEmptyString;
		break;
	}

	{
		AsciiString text(name);

		return (void *)Rva0046F910((int)ctx, &text);
	}
}
