// cl: /DNDEBUG /MD /EHsc /D_STLP_USE_STATIC_LIB
// stlport
#define _STLP_NO_EXCEPTIONS 1
#include <algorithm>
struct S4SortElem8 { int m_a; int m_b; };
struct S4Cmp009F34B0
{
	bool operator()(const S4SortElem8& left, const S4SortElem8& right) const;
};

// The retail __adjust_heap at 0x009F3190 and its __push_heap tail at
// 0x009F2F00 have their own providers. This instantiation needs only the
// declaration; its partial comparator cannot emit those helper bodies.
namespace _STL
{
template <>
void __adjust_heap<S4SortElem8 *, int, S4SortElem8, S4Cmp009F34B0>(
	S4SortElem8 *, int, int, S4SortElem8, S4Cmp009F34B0);
}

template void _STL::sort_heap<S4SortElem8*, S4Cmp009F34B0>(S4SortElem8*, S4SortElem8*, S4Cmp009F34B0);
