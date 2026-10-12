// RVA 0x0075D420: thiscall getter returning the dword at this+4.
// Owning class unproven; the address-derived name keeps the identity honest.
struct Rva0075D420
{
    int field0;
    int field4;
    int getField4();
};

int Rva0075D420::getField4()
{
    return field4;
}

// RVA 0x00293180: same this+4 getter shape; owner unproven.
struct Rva00293180
{
    int field0;
    int field4;
    int getField4();
};

int Rva00293180::getField4()
{
    return field4;
}

// RVA 0x000C9DF0: same this+4 getter shape; owner unproven.
struct Rva000C9DF0
{
    int field0;
    int field4;
    int getField4();
};

int Rva000C9DF0::getField4()
{
    return field4;
}
