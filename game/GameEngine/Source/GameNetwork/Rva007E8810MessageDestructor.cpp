// cl: /O2 /GX-
// The matched FESL dispatchers call this complete destructor at 0x007E86C0.
// Retail stores the base vtable at VA 0x01129358 and returns at +6; INT3
// padding starts at +7. The scalar-deleting destructor at 0x007E87C0 uses
// the same table, which its existing compiler-generated symbol owns.
// Keep this definition outside the callers: visible dead stores let VC7.1
// remove their cleanup calls, even with a noinline destructor declaration.
extern "C" const char __identifier("??_7Rva007E87C0Deleting@@6B@")[];

class Rva007E8810Message
{
public:
    ~Rva007E8810Message();
    void *m_vtable;
};

Rva007E8810Message::~Rva007E8810Message()
{
    m_vtable = (void *)__identifier("??_7Rva007E87C0Deleting@@6B@");
}
