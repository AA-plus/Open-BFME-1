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
