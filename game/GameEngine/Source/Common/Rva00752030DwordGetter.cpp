// 0x00752030: thiscall getter returning the dword at offset 4; owner unproven.
struct Rva00752030
{
    int m_pad0;
    int m_value4;
    int getValue4() const;
};

int Rva00752030::getValue4() const
{
    return m_value4;
}
