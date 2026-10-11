// ??0Rva00359530StringRecordTable@@QAE@ABV0@@Z
// partial score=0.7068 date=2026-10-11
// cl: /DNDEBUG /DWIN32 /D_WINDOWS /MD /EHsc /D_STLP_USE_STATIC_LIB /Igame/Libraries/Source/WWVegas/WWLib
// stlport
// Address-derived copy constructor of the second string-record table.
#include <vector>
#include "ascii_string.h"

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

void Rva0035D460(Rva00359530Record *dest, const Rva00359530Record *src);
void clearRva00359530Nodes(Rva00359530Record *record);
class BfmeSecondY;
void bfmeUnregisterY(BfmeSecondY *table);

namespace _STL
{
template<> __declspec(noinline) inline allocator<int> vector<int, allocator<int> >::get_allocator() const { return allocator<int>(); }
template<> _Vector_base<int, allocator<int> >::_Vector_base(size_t n, const allocator_type &a);
template<> void vector<Rva00359530Record, allocator<Rva00359530Record> >::reserve(size_type n);
template<> void _Construct(Rva00359530Record *dest, const Rva00359530Record &src);
template<> __declspec(noinline) inline void vector<Rva00359530Record, allocator<Rva00359530Record> >::_M_insert_overflow(pointer position, const Rva00359530Record &src, const __false_type &, size_type n, bool atEnd)
{
    const size_type oldSize = size();
    const size_type length = oldSize + (max)(oldSize, n);
    pointer newStart = _M_end_of_storage.allocate(length);
    pointer newFinish = __uninitialized_copy(_M_start, position, newStart, __false_type());
    if (n == 1)
    {
        _Construct(newFinish, src);
        ++newFinish;
    }
    else
        newFinish = __uninitialized_fill_n(newFinish, n, src, __false_type());
    if (!atEnd)
        newFinish = __uninitialized_copy(position, _M_finish, newFinish, __false_type());
    _M_clear();
    _M_finish = newFinish;
    _M_start = newStart;
    _M_end_of_storage._M_data = newStart + length;
}
template<> inline void vector<Rva00359530Record, allocator<Rva00359530Record> >::push_back(const Rva00359530Record &src)
{
    if (_M_finish != _M_end_of_storage._M_data)
    {
        _Construct(_M_finish, src);
        ++_M_finish;
    }
    else
    {
        __false_type tag;
        _M_insert_overflow(_M_finish, src, tag, 1UL, true);
    }
}
}

class Rva00359530StringRecordTable
{
public:
    Rva00359530StringRecordTable(const Rva00359530StringRecordTable &that);
private:
    _STL::vector<int> m_nameIndexes;
    _STL::vector<Rva00359530Record> m_records;
    int m_freeHead;
    int m_activeTail;
};

// ??0Rva00359530StringRecordTable@@QAE@ABV0@@Z
Rva00359530StringRecordTable::Rva00359530StringRecordTable(const Rva00359530StringRecordTable &that)
    : m_nameIndexes(that.m_nameIndexes), m_freeHead(that.m_freeHead), m_activeTail(that.m_activeTail)
{
    m_records.reserve(that.m_records.size());
    try
    {
        const Rva00359530Record *last = that.m_records.end();
        for (const Rva00359530Record *record = that.m_records.begin(); record != last; ++record)
        {
            Rva00359530Record temp;
            Rva0035D460(&temp, record);
            try
            {
                m_records.push_back(temp);
            }
            catch (...)
            {
                clearRva00359530Nodes(&temp);
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
