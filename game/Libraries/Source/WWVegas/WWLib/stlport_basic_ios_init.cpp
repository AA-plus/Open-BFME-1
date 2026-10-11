// cl: /EHsc /MD /D_STLP_USE_STATIC_LIB
// stlport

// The retail basic_ios<char>::init uses the generic ctype<char>::widen
// virtual, rather than STLport's optional char widening specialization.

#define _STLP_NO_METHOD_SPECIALIZATION
#include <istream>
#include <ostream>

// The existing retail imbue provider owns the locale/cache update at RVA 0x0053F690.
template <>
_STL::locale
_STL::basic_ios<char, _STL::char_traits<char> >::imbue(const _STL::locale &);

// Only this initializer is owned here. Complete stream-class instantiations
// also emit unrelated constructors, destructors and formatted I/O methods.
template void
_STL::basic_ios<char, _STL::char_traits<char> >::init(
    _STL::basic_streambuf<char, _STL::char_traits<char> > *);
