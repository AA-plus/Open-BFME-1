// Open-BFME5 conversions.

extern "C" void *__cdecl memset(void *d, int c, unsigned int n);

extern "C" __declspec(dllimport) int __cdecl isspace(int c);
extern "C" {
int g_Va0134CC58[0x100] = { 0 };
char g_Va0134D058 = 0;
}

void bfmeInit1182(void)
{
	int i;
	int (__cdecl *fn)(int c);

	if (g_Va0134D058)
		return;

	memset(g_Va0134CC58, 0, 0x100);
	fn = isspace;
	g_Va0134D058 = 1;

	for (i = 0; i < 0x100; i++)
		if (fn(i))
			g_Va0134CC58[i] = 2;

	g_Va0134CC58[10] = 1;
	g_Va0134CC58[13] = 1;
	g_Va0134CC58[59] = 3;
}
