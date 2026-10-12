// 0x0036AE00: thiscall getter returning the dword at offset 4; owner unproven.
struct Rva0036AE00
{
    int m_pad0;
    int m_value4;
    int getValue4() const;
};

int Rva0036AE00::getValue4() const
{
    return m_value4;
}
