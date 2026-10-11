// cl: /O2 /G6 /DNDEBUG /MD
#include <stdarg.h>
#include <stdio.h>
#include <string.h>

struct Rva009B4390Rect
{
	int left;
	int top;
	int right;
	int bottom;
};

extern "C" {
__declspec(dllimport) void *__stdcall CreateCompatibleDC(void *);
__declspec(dllimport) void *__stdcall CreateBitmap(int, int, unsigned int, unsigned int, const void *);
__declspec(dllimport) void *__stdcall SelectObject(void *, void *);
__declspec(dllimport) void *__stdcall CreateFontA(int, int, int, int, int, unsigned long, unsigned long, unsigned long, unsigned long, unsigned long, unsigned long, unsigned long, unsigned long, const char *);
__declspec(dllimport) unsigned long __stdcall SetTextColor(void *, unsigned long);
__declspec(dllimport) unsigned long __stdcall SetBkColor(void *, unsigned long);
__declspec(dllimport) int __stdcall SetBkMode(void *, int);
__declspec(dllimport) int __stdcall BitBlt(void *, int, int, int, int, void *, int, int, unsigned long);
__declspec(dllimport) int __stdcall ExtTextOutA(void *, int, int, unsigned int, const Rva009B4390Rect *, const char *, unsigned int, const int *);
__declspec(dllimport) unsigned long __stdcall GetPixel(void *, int, int);
__declspec(dllimport) int __stdcall DeleteObject(void *);
__declspec(dllimport) int __stdcall DeleteDC(void *);
}


// ?Rva009B4390CodecCall@@YAHPAXHPBDZZ
// Ported from Open BFME 2 Code/Libraries/Source/VP6/vp6_xprintf.cpp.
int __cdecl Rva009B4390CodecCall(void *context, int offset, const char *format, ...)
{
	int stride = *(int *)((char *)context + 0x1b8);
	char buffer[256] = "";
	unsigned char *output = *(unsigned char **)((char *)context + 0x25c) + offset;
	int result = 0;
	va_list args;
	Rva009B4390Rect rect;
	void *dc;
	void *bitmap;
	void *oldBitmap;
	void *font;
	void *selected;
	int x, y;
	va_start(args, format);
	_vsnprintf(buffer, sizeof(buffer), format, args);
	va_end(args);
	rect.left = 0;
	rect.top = 0;
	rect.right = strlen(buffer) * 8;
	rect.bottom = 8;
	dc = CreateCompatibleDC(0);
	if (dc == 0)
		goto done;
	bitmap = CreateBitmap(rect.right, rect.bottom, 1, 1, 0);
	if (bitmap == 0)
		goto done;
	oldBitmap = SelectObject(dc, bitmap);
	if (oldBitmap == 0)
		goto freeBitmap;
	font = CreateFontA(8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0x22, "");
	if (font == 0)
		goto restoreBitmap;
	selected = SelectObject(dc, bitmap);
	if (selected == 0)
		goto restoreBitmap;
	SelectObject(dc, font);
	SetTextColor(dc, 1);
	SetBkColor(dc, 0);
	SetBkMode(dc, 1);
	if (!BitBlt(dc, rect.left, rect.top, rect.right, rect.bottom, dc, rect.left, rect.top, 0x42))
		goto restoreBitmap;
	if (!ExtTextOutA(dc, 0, 0, 4, &rect, buffer, strlen(buffer), 0))
		goto restoreBitmap;
	for (y = rect.top; y < rect.bottom; y++) {
		for (x = rect.left; x < rect.right; x++) {
			if (GetPixel(dc, x, rect.bottom - y - 1))
				output[x] = 255;
		}
		output += stride;
	}
	result = strlen(buffer);
restoreBitmap:
	SelectObject(dc, oldBitmap);
freeBitmap:
	DeleteObject(bitmap);
done:
	if (font) {
		if (selected)
			SelectObject(dc, selected);
		DeleteObject(font);
	}
	if (dc)
		DeleteDC(dc);
	return result;
}
