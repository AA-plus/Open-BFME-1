// cl: /DNDEBUG /DWIN32 /D_WINDOWS /MD /EHsc

// Carved ret+int3 body: mov eax,[esp+4] / ret. Returns its cdecl argument; identity unknown.
int Rva006309C0ReturnArg( int value )
{
	return value;
}
