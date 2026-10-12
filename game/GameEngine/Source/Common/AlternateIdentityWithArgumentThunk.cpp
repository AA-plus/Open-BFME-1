struct AlternateIdentityWithArgumentThunk
{
    AlternateIdentityWithArgumentThunk *identity(int unused);
};

AlternateIdentityWithArgumentThunk *AlternateIdentityWithArgumentThunk::identity(int)
{
    return this;
}

// 0x00338310: cdecl body returning its first stack argument; identity unproven.
void *Rva00338310ReturnFirstArg(void *value)
{
    return value;
}

// RVA 0x0036C610: cdecl identity, returns its only stack argument.
void *Rva0036C610ReturnArgument(void *value)
{
    return value;
}

// 0x00233270: cdecl body returning its first stack argument; identity unproven.
void *Rva00233270ReturnFirstArg(void *value)
{
    return value;
}
