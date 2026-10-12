// cl: /DNDEBUG /DWIN32 /D_WINDOWS /MD /EHsc

// Carved ret+int3 body: mov eax,ecx / ret. Returns this; identity unknown.
class Rva000FC6E0Self
{
public:
	Rva000FC6E0Self *self();
};

Rva000FC6E0Self *Rva000FC6E0Self::self()
{
	return this;
}
