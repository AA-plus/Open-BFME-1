// ?_M_reallocate_map@?$deque@VThingRef@@V?$allocator@VThingRef@@@_STL@@@_STL@@IAEXI_N@Z
// partial score=1.0 date=2026-10-12
// cl: /O2 /DNDEBUG /DWIN32 /D_WINDOWS /MD /EHsc /D_STLP_USE_STATIC_LIB
// stlport
// STLport deque<ThingRef>::_M_push_back_aux_v at retail RVA 0x006A7DF0.
// Gen_006AB0B0 and Gen_006AC5D0 both call the shared ILT at 0x0000B61D.

#include <new>
#include <string.h>

extern "C" __declspec(dllimport) long __stdcall InterlockedIncrement(
	long volatile *lpAddend);
extern "C" __declspec(dllimport) long __stdcall InterlockedDecrement(
	long volatile *lpAddend);

void *__cdecl operator new(unsigned int size);

class RefCountedThing
{
public:
	virtual ~RefCountedThing();

	void Release_Ref(void)
	{
		if (InterlockedDecrement(&m_refCount) <= 0)
			delete this;
	}

	long m_refCount;
};

class ThingRef
{
public:
	ThingRef(const ThingRef &other) : m_ptr(other.m_ptr)
	{
		if (m_ptr)
			InterlockedIncrement(&m_ptr->m_refCount);
	}

	~ThingRef()
	{
		if (m_ptr)
			m_ptr->Release_Ref();
	}

private:
	RefCountedThing *m_ptr;
};

namespace _STL
{
	template <bool threads, int instance>
	class __node_alloc
	{
	private:
		enum { _MAX_BYTES = 128 };
		static void *__cdecl _M_allocate(unsigned int bytes);
		static void __cdecl _M_deallocate(void *p, unsigned int bytes);

	public:
		static void *__cdecl allocate(unsigned int bytes)
		{
			return bytes > (unsigned int)_MAX_BYTES ?
				::operator new(bytes) : _M_allocate(bytes);
		}

		static void __cdecl deallocate(void *p, unsigned int bytes)
		{
			if (bytes > (unsigned int)_MAX_BYTES)
				::operator delete(p);
			else
				_M_deallocate(p, bytes);
		}
	};

	template <class T>
	class allocator
	{
	public:
		T *allocate(unsigned int count)
		{
			return count != 0 ?
				(T *)__node_alloc<true, 0>::allocate(count * sizeof(T)) : 0;
		}

		void deallocate(T *p, unsigned int count)
		{
			if (p != 0)
				__node_alloc<true, 0>::deallocate(p, count * sizeof(T));
		}
	};

	template <class T, class Allocator>
	class _STLP_alloc_proxy : public Allocator
	{
	public:
		unsigned int _M_data;
	};

	template <class T>
	struct _DequeIterator
	{
		T *_M_cur;
		T *_M_first;
		T *_M_last;
		T **_M_node;

		void _M_set_node(T **newNode)
		{
			_M_node = newNode;
			_M_first = *newNode;
			_M_last = _M_first + buffer_size();
		}

		static unsigned int buffer_size()
		{
			return sizeof(T) < 128 ? 128 / sizeof(T) : 1;
		}
	};

	template <class T1, class T2>
	inline void _Construct(T1 *destination, const T2 &value)
	{
		new (destination) T1(value);
	}

	template <class T, class Allocator>
	class deque
	{
	protected:
		void _M_push_back_aux_v(const T &value);
		void _M_reallocate_map(unsigned int nodesToAdd, bool addAtFront);

		void _M_reserve_map_at_back(unsigned int nodesToAdd)
		{
			if (nodesToAdd + 1 > _M_map_size._M_data -
				(unsigned int)(_M_finish._M_node - _M_map))
				_M_reallocate_map(nodesToAdd, false);
		}

		_DequeIterator<T> _M_start;
		_DequeIterator<T> _M_finish;
		T **_M_map;
		_STLP_alloc_proxy<T, Allocator> _M_map_size;
	};

	template <class T, class Allocator>
	void deque<T, Allocator>::_M_push_back_aux_v(const T &value)
	{
		T valueCopy = value;
		_M_reserve_map_at_back(1);
		*(_M_finish._M_node + 1) =
			_M_map_size.allocate(_DequeIterator<T>::buffer_size());
		_Construct(_M_finish._M_cur, valueCopy);
		_M_finish._M_set_node(_M_finish._M_node + 1);
		_M_finish._M_cur = _M_finish._M_first;
	}

	inline void *__copy_trivial(const void *first, const void *last,
		void *result)
	{
		return (last == first) ? result :
			((char *)memmove(result, first, (const char *)last - (const char *)first))
			+ ((const char *)last - (const char *)first);
	}

	inline void *__copy_trivial_backward(const void *first, const void *last,
		void *result)
	{
		const int num = (const char *)last - (const char *)first;
		return (num > 0) ? memmove((char *)result - num, first, num) : result;
	}

	template <class T>
	inline const T &_Max(const T &a, const T &b)
	{
		return a < b ? b : a;
	}

	// STLport _deque.c; retail RVA 0x006A10E0, reached through ILT 0x00010785
	// from _M_push_back_aux_v above (0x006A7DF0).
	template <class T, class Allocator>
	void deque<T, Allocator>::_M_reallocate_map(unsigned int nodesToAdd,
		bool addAtFront)
	{
		unsigned int oldNumNodes = _M_finish._M_node - _M_start._M_node + 1;
		unsigned int newNumNodes = oldNumNodes + nodesToAdd;

		T **newStart;
		if (_M_map_size._M_data > 2 * newNumNodes) {
			newStart = _M_map + (_M_map_size._M_data - newNumNodes) / 2
				+ (addAtFront ? nodesToAdd : 0);
			if (newStart < _M_start._M_node)
				__copy_trivial(_M_start._M_node, _M_finish._M_node + 1, newStart);
			else
				__copy_trivial_backward(_M_start._M_node, _M_finish._M_node + 1,
					newStart + oldNumNodes);
		}
		else {
			unsigned int newMapSize = _M_map_size._M_data;
			newMapSize += _Max(_M_map_size._M_data, nodesToAdd) + 2;
			allocator<T *> mapAllocator;
			T **newMap = mapAllocator.allocate(newMapSize);
			newStart = newMap + (newMapSize - newNumNodes) / 2
				+ (addAtFront ? nodesToAdd : 0);
			__copy_trivial(_M_start._M_node, _M_finish._M_node + 1, newStart);
			mapAllocator.deallocate(_M_map, _M_map_size._M_data);
			_M_map = newMap;
			_M_map_size._M_data = newMapSize;
		}

		_M_start._M_set_node(newStart);
		_M_finish._M_set_node(newStart + oldNumNodes - 1);
	}

	template void deque<ThingRef, allocator<ThingRef> >::_M_reallocate_map(
		unsigned int, bool);
	template void deque<ThingRef, allocator<ThingRef> >::_M_push_back_aux_v(
		const ThingRef &);
}
