// cl: /O2 /DNDEBUG /DWIN32 /D_WINDOWS /MD /EHsc /Igame/Libraries/Source/WWVegas/WWLib
// The Lua callback prefixes a temporary retail string with the Lua argument.

#include <string.h>
#include "ascii_string.h"

struct lua_State;

extern "C" const char *lua_tostring(lua_State *state, int index);

// ?Rva002E33B0LuaStringSuffix@@YAHPAUlua_State@@@Z
int Rva002E33B0LuaStringSuffix(lua_State *state)
{
	const char *text = lua_tostring(state, 1);
	AsciiString message("LUA Alert: ");
	if (text)
		message.StringBase<char>::concat(text, (int)strlen(text));
	return 0;
}
