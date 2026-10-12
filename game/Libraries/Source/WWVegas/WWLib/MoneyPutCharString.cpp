// cl: /O2 /MD /D_STLP_USE_STATIC_LIB /EHsc
// stlport
// STLport 4.5.3 money_put<char, ostreambuf_iterator<char> >::do_put(
// ostreambuf_iterator, bool, ios_base&, char, const string&), retail
// 0x008379C0 (2708 bytes).  The canonical inline body lives in
// stl/_monetary.c under _STLP_EXPOSE_STREAM_IMPLEMENTATION; this is the
// narrow string overload of the same facet whose long-double overload is
// landed in MoneyPutCharLongDouble.cpp at 0x00836050.
//
// Identity: RTTI type descriptor 0x012C7508 names money_put<char,
// ostreambuf_iterator<char> >; vtable 0x0112E96C slot 0 is the matched
// scalar-deleting destructor 0x00832330, slot 1 is this body, slot 2 is the
// matched long-double do_put 0x00836050.  The body is byte-identical to
// retail outside its relocation slots.
//
// BFME's locale release is inline at the end of this body.  STLport's public
// header leaves _Locale_impl opaque, so complete its three-slot ABI here.
#include "stlport_prefix.h"

#include <string>
#define private public
#include <stl/_monetary.h>
#undef private

class Rva008384E0SlotForward { public: void* forward(void*); };
class Rva00838500SlotForward { public: void* forward(void*); };
class Rva00838520SlotForward { public: void* forward(void*); };
class Rva00838540SlotForward { public: void* forward(void*); };
class Rva00838460SlotForward { public: void* forward(void*); };
class Rva00838480SlotForward { public: void* forward(void*); };
class Rva008384A0SlotForward { public: void* forward(void*); };
class Rva008384C0SlotForward { public: void* forward(void*); };

_STLP_BEGIN_NAMESPACE

extern locale::id g_Va012C7440;
extern locale::id g_Va012C743C;




class _Locale_impl
{
public:
	virtual void _bfme_slot0(void) = 0;
	virtual void _bfme_incr(void) = 0;
	virtual void _bfme_decr(void) = 0;
};

__forceinline locale::~locale() _STLP_NOTHROW
{
	_M_impl->_bfme_decr();
}

typedef ostreambuf_iterator<char, char_traits<char> > BfmeNarrowPutIterator;

template <> __forceinline BfmeNarrowPutIterator& BfmeNarrowPutIterator::operator=(char c) {
  _M_ok = _M_ok && !traits_type::eq_int_type(
      _M_buf->sputc(c), traits_type::eof());
  return *this;
}
template <> inline BfmeNarrowPutIterator __copy(
    const char* first, const char* last, BfmeNarrowPutIterator result,
    const random_access_iterator_tag&, int*) {
  for (int n = last - first; n > 0; --n) {
    *result = *first;
    ++first;
    ++result;
  }
  return result;
}

#pragma inline_depth(0)
template <> __forceinline BfmeNarrowPutIterator fill_n(BfmeNarrowPutIterator first, unsigned int n, const char& value) {
  for (; n > 0; --n) first = value;
  return first;
}
#pragma inline_depth(255)
template <> __forceinline BfmeNarrowPutIterator copy(const char* first, const char* last, BfmeNarrowPutIterator result) {
  random_access_iterator_tag tag;
  return __copy(first, last, result, tag, (ptrdiff_t*)0);
}

#pragma inline_depth(0)
__forceinline void __money_write_point(BfmeNarrowPutIterator& out, const char& value) {
  out = value;
}
#pragma inline_depth(255)

struct _MoneySignPolicy : random_access_iterator_tag { bool negative; };
typedef char _MoneySignPolicyIsOneByte[(sizeof(_MoneySignPolicy) == 1) ? 1 : -1];
#pragma inline_depth(0)
__forceinline BfmeNarrowPutIterator __money_copy_symbol(
    const char* first, const char* last, BfmeNarrowPutIterator out,
    const _MoneySignPolicy& policy) {
  for (int n = last - first; n > 0; --n) {
    out = *first;
    ++first;
  }
  return out;
}
#pragma inline_depth(255)

#pragma inline_depth(0)
template <> template <> __forceinline basic_string<char>::basic_string(
    const char* first, const char* last, const allocator<char>& a)
    : _String_base<char, allocator<char> >(a) {
  _M_range_initialize(first, last, forward_iterator_tag());
}
#pragma inline_depth(255)
// Ported from Open BFME 2 Code/Libraries/Source/WWVegas/WWLib/stlport_narrow_money_put_string.cpp.
template <> inline BfmeNarrowPutIterator money_put<char, BfmeNarrowPutIterator>::do_put(
    BfmeNarrowPutIterator __s, bool __intl, ios_base& __str,
    char_type __fill, const string_type& __digits) const
{
  typedef char _CharT;
  typedef BfmeNarrowPutIterator _OutputIter;
  typedef ctype<_CharT>             _Ctype;
  typedef moneypunct<_CharT, false> _Punct;
  typedef moneypunct<_CharT, true>  _Punct_intl;

  locale __loc = __str.getloc();
  const _Ctype&      __c_type      = use_facet<_Ctype>(__loc) ;
  const _Punct&      __punct      = *static_cast<const _Punct*>(__loc._M_use_facet(g_Va012C7440)) ;
  const _Punct_intl& __punct_intl = *static_cast<const _Punct_intl*>(__loc._M_use_facet(g_Va012C743C)) ;

  char_type __minus = __c_type.widen('-');
  char_type __plus  = __c_type.widen('+');
  char_type __space = __c_type.widen(' ');
  char_type __zero  = __c_type.widen('0');
  char_type __point = __intl ? __c_type.widen(__punct_intl.decimal_point())
			     : __c_type.widen(__punct.decimal_point());

  char_type __sep = __intl ? __punct_intl.thousands_sep()
			   : __punct     .thousands_sep();

  string __grouping = __intl ? ((*reinterpret_cast<const Rva00838460SlotForward*>(&__punct_intl)).*reinterpret_cast<string_type (Rva00838460SlotForward::*)() const>(&Rva00838460SlotForward::forward))()
		             : ((*reinterpret_cast<const Rva008384E0SlotForward*>(&__punct)).*reinterpret_cast<string_type (Rva008384E0SlotForward::*)() const>(&Rva008384E0SlotForward::forward))();

  int __frac_digits      = __intl ? __punct_intl.frac_digits()
                                  : __punct.frac_digits();

  string_type __curr_sym = __intl ? ((*reinterpret_cast<const Rva00838480SlotForward*>(&__punct_intl)).*reinterpret_cast<string_type (Rva00838480SlotForward::*)() const>(&Rva00838480SlotForward::forward))()
                                  : ((*reinterpret_cast<const Rva00838500SlotForward*>(&__punct)).*reinterpret_cast<string_type (Rva00838500SlotForward::*)() const>(&Rva00838500SlotForward::forward))();

  if (__digits.size() == 0)
    return __s;

  string_type::const_iterator __digits_first = __digits.begin();
  string_type::const_iterator __digits_last  = __digits.end();

  _MoneySignPolicy __sign_policy;
  __sign_policy.negative = *__digits_first == __minus;
  if (__sign_policy.negative)
    ++__digits_first;

  string_type __sign = __intl ?
			 __sign_policy.negative ? ((*reinterpret_cast<const Rva008384C0SlotForward*>(&__punct_intl)).*reinterpret_cast<string_type (Rva008384C0SlotForward::*)() const>(&Rva008384C0SlotForward::forward))()
				       : ((*reinterpret_cast<const Rva008384A0SlotForward*>(&__punct_intl)).*reinterpret_cast<string_type (Rva008384A0SlotForward::*)() const>(&Rva008384A0SlotForward::forward))()
			      :
			 __sign_policy.negative ? ((*reinterpret_cast<const Rva00838540SlotForward*>(&__punct)).*reinterpret_cast<string_type (Rva00838540SlotForward::*)() const>(&Rva00838540SlotForward::forward))()
				       : ((*reinterpret_cast<const Rva00838520SlotForward*>(&__punct)).*reinterpret_cast<string_type (Rva00838520SlotForward::*)() const>(&Rva00838520SlotForward::forward))();
  string_type::const_iterator __cp = __digits_first;
  while (__cp != __digits_last && __c_type.is(ctype_base::digit, *__cp))
    ++__cp;
  if (__cp == __digits_first)
    return __s;
  __digits_last = __cp;

  string_type __new_digits(__digits_first, __digits_last);

  if (__grouping.size() != 0) {
    if (__grouping.size() == 1)
      __grouping.push_back(__grouping[0]);
    __grouping[0] += __frac_digits;
    _CharT* __data_ptr = __CONST_CAST(_CharT*,__new_digits.data());
    _CharT* __data_end = __data_ptr + __new_digits.size();

    ptrdiff_t __value_length = __insert_grouping(__data_ptr,
	  				         __data_end,
					         __grouping,
					         __sep,
					         __plus, __minus, 0);
    __digits_first = __new_digits.begin();
    __digits_last  = __digits_first + __value_length;
  }

  size_t __width        = __str.width();

#if defined(_STLP_DEBUG) && (defined(__HP_aCC) || (__HP_aCC <= 1))
  size_t __value_length = operator -(__digits_last, __digits_first);
#else
  size_t __value_length = __digits_last - __digits_first;
#endif

  size_t __length       = __value_length;

  __length += __sign.size();
  if (__frac_digits != 0)
    ++__length;

  bool __generate_curr = (__str.flags() & ios_base::showbase) !=0;
  if (__generate_curr)
    __length += __curr_sym.size();

  __declspec(align(8)) money_base::pattern __format =
    __intl ? (__sign_policy.negative ? __punct_intl.neg_format()
                            : __punct_intl.pos_format())
           : (__sign_policy.negative ? __punct.neg_format()
                            : __punct.pos_format());
  {
    for (int __i = 0; __i < 4; ++__i)
      if (__format.field[__i] == (char) money_base::space)
        ++__length;
  }

  size_t __fill_amt = __length < __width ? __width - __length : 0;

  ios_base::fmtflags __fill_pos = __str.flags() & ios_base::adjustfield;

  if (__fill_amt != 0 &&
      !(__fill_pos & (ios_base::left | ios_base::internal)))
    __s = fill_n(__s, __fill_amt, __fill);

  for (int __i = 0; __i < 4; ++__i) {
    char __ffield = __format.field[__i];
    if (__ffield == money_base::none) {
      if (__fill_amt != 0 && __fill_pos == ios_base::internal)
        __s = fill_n(__s, __fill_amt, __fill);
    }
    else if (__ffield == money_base::space) {
      *__s++ = __space;
      if (__fill_amt != 0 && __fill_pos == ios_base::internal)
        __s = fill_n(__s, __fill_amt, __fill);
    }
    else if (__ffield == money_base::symbol) {
      if (__generate_curr)
        __s = __money_copy_symbol(static_cast<const string_type&>(__curr_sym).begin(), static_cast<const string_type&>(__curr_sym).end(), __s, __sign_policy);
    }
    else if (__ffield == money_base::sign) {
      if (__sign.size() != 0)
        *__s++ = __sign[0];
    }
    else if (__ffield == money_base::value) {
      if (__frac_digits == 0)
        __s = copy(__digits_first, __digits_last, __s);
      else {
        if ((int)__value_length <= __frac_digits) {
          __money_write_point(__s,__point);
          __s = copy(__digits_first, __digits_last, __s);
          __s =  fill_n(__s, __frac_digits - __value_length, __zero);
        }
        else {
          __s = copy(__digits_first, __digits_last - __frac_digits, __s);
          if (__frac_digits != 0) {
            __money_write_point(__s,__point);
            __s = copy(__digits_last - __frac_digits, __digits_last, __s);
          }
        }
      }
    }
  } 

  if (__sign.size() > 1) {
    const char* __cp = __sign.begin() + 1;
    __s = __money_copy_symbol(__cp, __sign.end(), __s, __sign_policy);
  }
  if (!(__fill_pos & (ios_base::right | ios_base::internal)))
    __s = fill_n(__s, __fill_amt, __fill);

  return __s;
}

struct bfmeNarrowMoneyPutEmitter : money_put<char, BfmeNarrowPutIterator>
{
	static void emit(const bfmeNarrowMoneyPutEmitter *p, BfmeNarrowPutIterator a, bool b, ios_base &s,
		char f, const string &d);
};
#pragma inline_depth(0)

// ?emit@bfmeNarrowMoneyPutEmitter@@SAXPBV1@V?$ostreambuf_iterator@DV?$char_traits@D@_STL@@@_STL@@@_STL@@_NAAVios_base@2@DABV?$basic_string@DV?$char_traits@D@_STL@@V?$allocator@D@2@@2@@Z absent-from-retail
void bfmeNarrowMoneyPutEmitter::emit(const bfmeNarrowMoneyPutEmitter *p, BfmeNarrowPutIterator a, bool b, ios_base &s,
	char f, const string &d)
{
	p->money_put<char, BfmeNarrowPutIterator>::do_put(a, b, s, f, d);
}
#pragma inline_depth()

}
