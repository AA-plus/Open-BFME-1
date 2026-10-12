// 0x003CBE10: thiscall getter returning the dword at offset 4; owner unproven.
struct Rva003CBE10
{
    int m_pad0;
    int m_value4;
    int getValue4() const;
};

int Rva003CBE10::getValue4() const
{
    return m_value4;
}
