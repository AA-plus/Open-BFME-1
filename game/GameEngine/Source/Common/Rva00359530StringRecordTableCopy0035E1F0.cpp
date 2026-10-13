// ??0Rva00359530StringRecordTable@@QAE@ABV0@@Z
// cl: /DNDEBUG /DWIN32 /D_WINDOWS /MD /EHsc /D_STLP_USE_STATIC_LIB /Igame/Libraries/Source/WWVegas/WWLib
// stlport
#define _Vector_base Rva001F9330VectorBase
#include <vector>
#undef _Vector_base
#include "ascii_string.h"

class Gen_00359B50 { public: void bfmeReserve(unsigned int); };
class Open2Rec3550F0;
void Open2Construct3550F0(Open2Rec3550F0*, const Open2Rec3550F0&);
namespace _STL {
struct Rva0035B130Element;
template<> void vector<Rva0035B130Element>::_M_insert_overflow(Rva0035B130Element*, const Rva0035B130Element&, const __false_type&, unsigned int, bool);
}
struct BfmeRecordOverflowAccess : _STL::vector<_STL::Rva0035B130Element> {
    typedef void (_STL::vector<_STL::Rva0035B130Element>::*NativeInsert)(_STL::Rva0035B130Element*, const _STL::Rva0035B130Element&, const _STL::__false_type&, unsigned int, bool);
    static __forceinline NativeInsert insert() { return &_STL::vector<_STL::Rva0035B130Element>::_M_insert_overflow; }
};

class BfmeNodeY;
struct Rva00359530Record
{
    int m_previous;
    int m_next;
    AsciiString m_name;
    unsigned char m_released;
    unsigned short m_references;
    BfmeNodeY *m_nodes;
    Rva00359530Record() : m_nodes(0) {}
};

struct Gen0035AA50
{
    int m_previous;
    int m_next;
    AsciiString m_name;
    unsigned char m_released;
    unsigned short m_references;
    BfmeNodeY *m_nodes;
    Gen0035AA50() : m_nodes(0) {}
};

struct Gen00351980
{
    int m_previous;
    int m_next;
    AsciiString m_name;
    unsigned char m_released;
    unsigned short m_references;
    BfmeNodeY *m_nodes;
    Gen00351980() : m_nodes(0) {}
};

void Rva0035D460(Rva00359530Record *dest, const Rva00359530Record *src);
void clearRva00359530Nodes(Rva00359530Record *record);
class BfmeSecondY;
void bfmeUnregisterY(BfmeSecondY *table);

namespace _STL
{
template<class Type> void _Construct(Type *dest, const Type &src);
template<> vector<Gen0035AA50>::~vector();

template<> __forceinline void _Construct<Rva00359530Record>(Rva00359530Record *dest, const Rva00359530Record &src) {
    Open2Construct3550F0(reinterpret_cast<Open2Rec3550F0*>(dest), reinterpret_cast<const Open2Rec3550F0&>(src));
}
struct Rva0035B130Element
{
    int m_previous;
    int m_next;
    AsciiString m_name;
    unsigned char m_released;
    unsigned short m_references;
    BfmeNodeY *m_nodes;
    Rva0035B130Element() : m_nodes(0) {}
};
template<> void _Construct<Rva0035B130Element>(Rva0035B130Element *dest, const Rva0035B130Element &src);
template<> void vector<Rva0035B130Element>::_M_clear();
// ??$__uninitialized_copy@URva0035B130Element@_STL@@@_STL@@YAPAURva0035B130Element@0@PAU10@00@Z absent-from-retail
template<class Type> static __forceinline Type *__uninitialized_copy(Type *first, Type *last, Type *result)
{
    if (first != last)
    {
        do
        {
            _Construct(result, *first);
            ++first;
            ++result;
        }
        while (first != last);
    }
    return result;
}
// ??$__uninitialized_fill_n@URva0035B130Element@_STL@@@_STL@@YAPAURva0035B130Element@0@PAU10@IABU10@@Z absent-from-retail
template<class Type> static __forceinline Type *__uninitialized_fill_n(Type *result, unsigned int count, const Type &value)
{
    for (; count > 0; --count)
    {
        _Construct(result, value);
        ++result;
    }
    return result;
}
template<> __declspec(noinline) inline void vector<Rva0035B130Element>::_M_insert_overflow(pointer position, const Rva0035B130Element &src, const __false_type &, size_type n, bool atEnd)
{
    unsigned int oldSize = (unsigned int)(_M_finish - _M_start);
    const unsigned int &growth = oldSize < n ? n : oldSize;
    unsigned int length = growth + oldSize;
    pointer newStart = _M_end_of_storage.allocate(length);
    pointer newFinish = __uninitialized_copy(_M_start, position, newStart);
    if (n == 1)
    {
        _Construct(newFinish, src);
        ++newFinish;
    }
    else
        newFinish = __uninitialized_fill_n(newFinish, n, src);
    if (!atEnd)
        newFinish = __uninitialized_copy(position, _M_finish, newFinish);
    _M_clear();
    _M_finish = newFinish;
    _M_start = newStart;
    _M_end_of_storage._M_data = newStart + length;
}
template<> inline void vector<Gen0035AA50>::push_back(const Gen0035AA50 &src)
{
    if (_M_finish != _M_end_of_storage._M_data)
    {
        Open2Construct3550F0(reinterpret_cast<Open2Rec3550F0*>(_M_finish), reinterpret_cast<const Open2Rec3550F0&>(src));
        ++_M_finish;
    }
    else
    {
        __false_type tag;
        typedef void (vector<Gen0035AA50>::*Insert)(Gen0035AA50*, const Gen0035AA50&, const __false_type&, size_type, bool);
        typedef void (vector<Rva0035B130Element>::*NativeInsert)(Rva0035B130Element*, const Rva0035B130Element&, const __false_type&, size_type, bool);
        (this->*reinterpret_cast<Insert>(BfmeRecordOverflowAccess::insert()))(_M_finish, src, tag, 1UL, true);
    }
}
}

class Rva00359530StringRecordTable
{
public:
    Rva00359530StringRecordTable(const Rva00359530StringRecordTable &that);
private:
    _STL::vector<int> m_nameIndexes;
    _STL::vector<Gen0035AA50> m_records;
    int m_freeHead;
    int m_activeTail;
};

// ??0Rva00359530StringRecordTable@@QAE@ABV0@@Z
Rva00359530StringRecordTable::Rva00359530StringRecordTable(const Rva00359530StringRecordTable &that)
    : m_nameIndexes(that.m_nameIndexes), m_freeHead(that.m_freeHead), m_activeTail(that.m_activeTail)
{
    reinterpret_cast<Gen_00359B50*>(&m_records)->bfmeReserve(that.m_records.size());
    try
    {
        const Rva00359530Record *last = reinterpret_cast<const Rva00359530Record*>(that.m_records.end());
        for (const Rva00359530Record *record = reinterpret_cast<const Rva00359530Record*>(that.m_records.begin()); record != last; ++record)
        {
            Gen00351980 temp;
            Rva0035D460(reinterpret_cast<Rva00359530Record*>(&temp), record);
            try
            {
                m_records.push_back(reinterpret_cast<const Gen0035AA50&>(temp));
            }
            catch (...)
            {
                clearRva00359530Nodes(reinterpret_cast<Rva00359530Record*>(&temp));
                throw;
            }
        }
    }
    catch (...)
    {
        bfmeUnregisterY((BfmeSecondY *)&m_records);
        throw;
    }
}
