// ?rva0048F8C0@Rva0048FAC0Owner@@QAEXPAURva0048FAC0Line@@@Z
// partial score=0.2294 date=2026-10-12
// cl: /DNDEBUG /DWIN32 /D_WINDOWS /MD /EHsc /D_STLP_USE_STATIC_LIB /Igame/Libraries/Source/WWVegas/WWLib
// stlport
// Body at 0x0048F8C0 (__thiscall, RET 4, 231 bytes): moves a finished text
// line into its owner. The matched Rva0048FAC0Owner::appendWord
// (Rva0048FAC0AppendWord.cpp) calls it on the same owner with the line when a
// word overflows the line's width, so the receiver and argument are that
// owner and line record; no evidence names the method, so it keeps the
// address.
//
// It wraps the line's text in a new 0x14-byte entry (constructor 0x0048F5C0
// via ILT 0x0002FF63, taking the text and the owner's +0x08 context), appends
// the entry to the owner's vector at +0x0C (overflow 0x0048F140 via ILT
// 0x0002B8A0), appends the line's x offset less half its measured width to
// the vector<int> the line points at (+0x08), then clears the text and the
// measured width.

#define _STLP_NO_EXCEPTIONS 1
#include <vector>

#include <wchar.h>
#include "string_base.h"
#include "unicode_string.h"

// A line record (Rva0048FAC0AppendWord.cpp): +0x00 width limit, +0x04 x
// offset, +0x08 offset list, +0x0C display string, +0x10 text, +0x14 width.
struct Rva0048FAC0Line {
	int m_maxWidth;
	int m_x;
	_STL::vector<int> *m_offsets;
	void *m_displayString;
	UnicodeString m_text;
	int m_width;
};

struct Rva0048F5C0Context;

class Rva0048F5C0Entry {
public:
	Rva0048F5C0Entry(const UnicodeString &text, Rva0048F5C0Context *context);
private:
	char m_unmodelled000[0x14];
};

// Retail passes push_back's overflow tag as an uninitialised named object,
// not the vendored header's value-initialised _IsPODType() temporary.
namespace _STL {
template <> void vector<int, allocator<int> >::_M_insert_overflow(
	int *, const int &, const __true_type &, size_t, bool);
template <> __forceinline void vector<int, allocator<int> >::push_back(const int &x) {
	if (_M_finish != _M_end_of_storage._M_data) { _Construct(_M_finish, x); ++_M_finish; }
	else { __true_type tag; _M_insert_overflow(_M_finish, x, tag, 1, true); }
}
template <> void vector<Rva0048F5C0Entry *, allocator<Rva0048F5C0Entry *> >::_M_insert_overflow(
	Rva0048F5C0Entry **, Rva0048F5C0Entry * const &, const __true_type &, size_t, bool);
template <> __forceinline void vector<Rva0048F5C0Entry *, allocator<Rva0048F5C0Entry *> >::push_back(
	Rva0048F5C0Entry * const &x) {
	if (_M_finish != _M_end_of_storage._M_data) { _Construct(_M_finish, x); ++_M_finish; }
	else { __true_type tag; _M_insert_overflow(_M_finish, x, tag, 1, true); }
}
}

class Rva0048FAC0Owner {
public:
	void rva0048F8C0(Rva0048FAC0Line *line);
private:
	char m_unmodelled000[0x08];
	Rva0048F5C0Context *m_context;					// +0x08
	_STL::vector<Rva0048F5C0Entry *> m_entries;			// +0x0C
};

void Rva0048FAC0Owner::rva0048F8C0(Rva0048FAC0Line *line)
{
	Rva0048FAC0Line *l = line;
	m_entries.push_back(new Rva0048F5C0Entry(l->m_text, m_context));
	l->m_offsets->push_back(l->m_x - l->m_width / 2);
	((StringBase<unsigned short> *)&l->m_text)->clear();
	l->m_width = 0;
}
