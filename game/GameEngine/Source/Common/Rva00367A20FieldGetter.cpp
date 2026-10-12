// cl: /DNDEBUG /DWIN32 /D_WINDOWS /MD /EHsc

// Carved ret+int3 body: mov eax,[ecx+4] / ret. Identity unknown; address-derived name.
class Rva00367A20FieldDword
{
public:
	int get() const;
};

int Rva00367A20FieldDword::get() const
{
	return *(const int *)((const char *)this + 0x4);
}
