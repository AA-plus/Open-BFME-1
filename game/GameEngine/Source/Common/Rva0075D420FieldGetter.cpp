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
