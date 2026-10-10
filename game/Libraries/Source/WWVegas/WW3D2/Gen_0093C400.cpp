// Clean reconstruction of the two-stage guarded release at retail RVA
// 0x0093C400. The owning type remains unknown. Retail's PE import directory
// identifies the IAT cells at 013590FC/013590C8/013590C4 as the GDI routines
// SelectObject/DeleteObject/DeleteDC, respectively.

#include <windows.h>

class Gen_0093C400
{
public:
	void process();

private:
	unsigned char m_pad[4];
	void *m_first;
	void *m_second;
	unsigned char m_gap[4];
	void *m_third;
};

void Gen_0093C400::process()
{
	if (m_second != 0) {
		SelectObject((HDC)m_third, (HGDIOBJ)m_first);
		DeleteObject((HGDIOBJ)m_second);
		m_second = 0;
	}
	if (m_third != 0) {
		DeleteDC((HDC)m_third);
		m_third = 0;
	}
}
