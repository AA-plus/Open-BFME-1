#include <afxwin.h>

// Only the fields the recovered handlers read are named; the rest stays unnamed storage.
class CWorldBuilderDoc
{
    unsigned char m_unrecovered_000[0x64];
    bool m_linkCenters;

protected:
    void OnEditLinkCenters();
};

void CWorldBuilderDoc::OnEditLinkCenters()
{
    m_linkCenters = !m_linkCenters;
}
