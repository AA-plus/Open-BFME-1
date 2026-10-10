// cl: /GX /Igame/Libraries/Source/WWVegas/WWLib
#include "ascii_string.h"

AsciiString GetBasePathFromPath(AsciiString path);
AsciiString GetSoloINIFromMap(AsciiString path);

AsciiString GetSoloINIFromMap(AsciiString path)
{
	AsciiString base = GetBasePathFromPath(path);
	AsciiString out;
	out.format("%s\\solo.ini", base.str());
	return out;
}

AsciiString GetStrFileFromMap(AsciiString path)
{
	AsciiString base = GetBasePathFromPath(path);
	AsciiString out;
	out.format("%s\\map.str", base.str());
	return out;
}
