// stlport
// Open-BFME5: STLport deque<PSResponse> destruction helper.

#include <deque>

// upstream layout: inputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/GameEngine/Include/GameNetwork/GameSpy/PersistentStorageThread.h
class PSResponse
{
public:
	~PSResponse();

private:
	unsigned char m_data[0x1f0];
};

// Emit only the owned destroy-range helper; whole-container instantiation
// also emits unrelated copying, growth and map operations.
template void _STL::__destroy_aux<_STL::deque<PSResponse>::iterator>(
	_STL::deque<PSResponse>::iterator, _STL::deque<PSResponse>::iterator,
	const _STL::__false_type &);
