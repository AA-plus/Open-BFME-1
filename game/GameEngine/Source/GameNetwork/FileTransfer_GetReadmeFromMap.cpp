// cl: /GX /Igame/Libraries/Source/WWVegas/WWLib
#include "ascii_string.h"

AsciiString GetBasePathFromPath(AsciiString path);
AsciiString GetReadmeFromMap(AsciiString path);

AsciiString GetReadmeFromMap(AsciiString path)
{
	AsciiString base = GetBasePathFromPath(path);
	AsciiString out;
	out.format("%s\\readme.txt", base.str());
	return out;
}

AsciiString GetINIFromMap(AsciiString path)
{
	AsciiString base = GetBasePathFromPath(path);
	AsciiString out;
	out.format("%s\\map.ini", base.str());
	return out;
}
