#include <afxwin.h>

// Only the fields the recovered handlers read are named; the rest stays unnamed storage.
class WbView3d
{
    unsigned char m_unrecovered_000[0x224];
    bool m_showWireframe;

protected:
    void OnUpdateViewShowwireframe(CCmdUI *pCmdUI);
};

void WbView3d::OnUpdateViewShowwireframe(CCmdUI *pCmdUI)
{
    pCmdUI->SetCheck(m_showWireframe ? 1 : 0);
}
