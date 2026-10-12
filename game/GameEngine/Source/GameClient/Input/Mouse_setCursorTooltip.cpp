// cl: /O2 /DNDEBUG /DWIN32 /D_WINDOWS /MD /EHsc /Igame/Libraries/Source/WWVegas/WWLib
// readable body of ?setCursorTooltip@Mouse@@: game/GameEngine/Source/GameClient/Input/Mouse.cpp
// Identity: ILT 0x000346E9 -> 0x005A56F0 (symbols.csv pin) and the
// MapTransferLoadScreen::update call TheMouse->setCursorTooltip(TheEmptyString,
// -1, NULL, 1.0f). BFME keeps the tooltip in a Mouse string at +0x1100 instead
// of re-wrapping a display string, and ignores the width argument.

#include "string_base.h"

class UnicodeString : public StringBase<unsigned short>
{
public:
	UnicodeString(const UnicodeString &other) : StringBase<unsigned short>(other) {}
	~UnicodeString() {}
	UnicodeString &operator=(const UnicodeString &other) { set(other); return *this; }
};

struct RGBColor
{
	float red, green, blue;
};

struct RGBAColorInt
{
	unsigned int red, green, blue, alpha;
};

#define REAL_TO_INT(x) ((int)(x))

class Mouse
{
public:
	void setCursorTooltip(UnicodeString tooltip, int delay, const RGBColor *color, float width);

private:
	char m_pad0[0x1090];
	RGBAColorInt m_tooltipColorText;
	char m_pad1[0x10C0 - 0x10A0];
	RGBAColorInt m_tooltipColorBackground;
	char m_pad2[0x10E4 - 0x10D0];
	unsigned char m_useTooltipAltTextColor;
	unsigned char m_useTooltipAltBackColor;
	unsigned char m_adjustTooltipAltColor;
	char m_pad3[0x1100 - 0x10E7];
	UnicodeString m_tooltipString;
	char m_pad4[0x4DD0 - 0x1104];
	int m_tooltipDelay;
	char m_pad5[0x4DE0 - 0x4DD4];
	RGBAColorInt m_tooltipTextColor;
	RGBAColorInt m_tooltipBackColor;
};

void Mouse::setCursorTooltip(UnicodeString tooltip, int delay, const RGBColor *color, float width)
{
	m_tooltipDelay = delay;
	m_tooltipString = tooltip;

	if (color)
	{
		if (m_useTooltipAltTextColor)
		{
			if (m_adjustTooltipAltColor)
			{
				m_tooltipTextColor.red   = REAL_TO_INT((color->red + 1.0f)   * 255.0f / 2.0f);
				m_tooltipTextColor.green = REAL_TO_INT((color->green + 1.0f) * 255.0f / 2.0f);
				m_tooltipTextColor.blue  = REAL_TO_INT((color->blue + 1.0f)  * 255.0f / 2.0f);
			}
			else
			{
				m_tooltipTextColor.red   = REAL_TO_INT(color->red   * 255.0f);
				m_tooltipTextColor.green = REAL_TO_INT(color->green * 255.0f);
				m_tooltipTextColor.blue  = REAL_TO_INT(color->blue  * 255.0f);
			}
			m_tooltipTextColor.alpha = m_tooltipColorText.alpha;
		}
		if (m_useTooltipAltBackColor)
		{
			if (m_adjustTooltipAltColor)
			{
				m_tooltipBackColor.red   = REAL_TO_INT(color->red   * 255.0f * 0.5f);
				m_tooltipBackColor.green = REAL_TO_INT(color->green * 255.0f * 0.5f);
				m_tooltipBackColor.blue  = REAL_TO_INT(color->blue  * 255.0f * 0.5f);
			}
			else
			{
				m_tooltipBackColor.red   = REAL_TO_INT(color->red   * 255.0f);
				m_tooltipBackColor.green = REAL_TO_INT(color->green * 255.0f);
				m_tooltipBackColor.blue  = REAL_TO_INT(color->blue  * 255.0f);
			}
			m_tooltipBackColor.alpha = m_tooltipColorBackground.alpha;
		}
	}
	else
	{
		m_tooltipTextColor = m_tooltipColorText;
		m_tooltipBackColor = m_tooltipColorBackground;
	}
}
