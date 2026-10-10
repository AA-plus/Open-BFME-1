// cl: /DNDEBUG /MD /EHsc

// The element destructor is retail's ??1BfmeElemBW@@QAE@XZ (0x004463AD), the
// out-of-line copy BfmeElemDeleteBW.cpp defines; only the name differs.
struct BfmeElemBW
{
    ~BfmeElemBW(void);

private:
    unsigned m_value;
};

class BfmeElemCU;
void *Rva008939C0(BfmeElemCU *source, int oldCount, int newCount);

class Gen_t_00894a10_p12cd
{
public:
    ~Gen_t_00894a10_p12cd(void);

private:
    unsigned m_pad0;
    unsigned m_pad4;
    BfmeElemBW *m_data;
    BfmeElemBW m_inline[2];
};

Gen_t_00894a10_p12cd::~Gen_t_00894a10_p12cd(void)
{
    if (m_data != m_inline)
        Rva008939C0((BfmeElemCU *)m_data, 0, 0);
}
