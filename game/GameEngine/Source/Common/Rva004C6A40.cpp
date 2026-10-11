// The callback globals are address-derived; the second call passes two stack slots.
extern int g_012F3934;
extern int g_012F3930;

void j_00042a50(void);
void j_0002fcb1(void);

void dup_004c6a40()
{
	j_00042a50();
	__asm
	{
		mov eax, dword ptr [g_012F3934]
		mov ecx, dword ptr [g_012F3930]
		push eax
		push ecx
		call j_0002fcb1
		add esp, 8
	}
}
