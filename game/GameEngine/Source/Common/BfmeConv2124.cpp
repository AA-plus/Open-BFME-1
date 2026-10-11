// cl: /DNDEBUG /DWIN32 /MD /EHsc /Iinputs/reference/shims/fullfade /Iinputs/reference/shims/sweep /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/GameEngine/Include /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/GameEngine/Source /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Libraries/Include /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Libraries/Source /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/GameEngineDevice/Include /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Main /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Libraries/Source/WWVegas /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Libraries/Source/WWVegas/WWLib /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Libraries/Source/WWVegas/WW3D2 /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Libraries/Source/WWVegas/WWMath /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Libraries/Source/WWVegas/WWDebug /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Libraries/Source/WWVegas/WWSaveLoad
// stlport
#include "PreRTS.h"
#include "GameClient/GameWindowTransitions.h"

class Rva00609850
{
public:
	void go();
};

// Retail loads a writable four-byte timer delta at VA 0x012F8230.
// Both x87 operands at +0x1F and +0x5D prove its width; retail .data is zero.
float g_Va012F8230 = 0.0f;
extern const float g_rva01075350;
extern float g_bfmeDefaultBU;

class BfmeHostAAW
{
public:
	virtual void bfmeSlot0AAW();
	virtual void bfmeSlot1AAW();
	virtual void bfmeSlot2AAW();
	virtual void bfmeSlot3AAW();
	virtual void bfmeStopAAW(int a);
	virtual void bfmeSlot5AAW();
	virtual void bfmeSlot6AAW();
	virtual void bfmeSlot7AAW();
	virtual void bfmeSlot8AAW();
	virtual void bfmeSlot9AAW();
	virtual void bfmeSlot10AAW();
	virtual void bfmeSlot11AAW();
	virtual void bfmeFadeAAW(int a, int b);
	virtual void bfmeSlot13AAW();
	virtual void bfmeSlot14AAW();
	virtual void bfmeSlot15AAW();
	virtual void bfmeSlot16AAW();
	virtual void bfmeSlot17AAW();
	virtual void bfmeDoneAAW();
	virtual void bfmeExpireAAW();

	void bfmeUpdateAAW();

	int m_bfme04AAW;
	unsigned char m_bfmeGapAAW[0x144 - 8];
	float m_bfme144AAW;
};

void BfmeHostAAW::bfmeUpdateAAW()
{
	// ILT 0x0004ACC8 jumps to the authored 13-byte member at 0x00609850.
	reinterpret_cast<Rva00609850 *>(this)->go();

	switch (m_bfme04AAW)
	{
		case 2:
		{
			if (m_bfme144AAW <= g_bfmeDefaultBU)
				m_bfme144AAW = g_Va012F8230 + m_bfme144AAW;

			if (m_bfme144AAW > g_bfmeDefaultBU && TheTransitionHandler->isFinished())
			{
				bfmeFadeAAW(1, 1);
				m_bfme144AAW = 0;
				bfmeStopAAW(0);
				bfmeDoneAAW();
			}

			break;
		}

		case 3:
		{
			float f = m_bfme144AAW - g_Va012F8230;

			m_bfme144AAW = f;

			if (f < g_rva01075350)
			{
				m_bfme144AAW = 0;
				bfmeExpireAAW();
			}

			break;
		}
	}
}
