// stlport
// Open-BFME5: STLport deque<PSRequest> destruction helper.

#include <deque>

// upstream layout: inputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/GameEngine/Include/GameNetwork/GameSpy/PersistentStorageThread.h
class PSRequest
{
public:
	~PSRequest();

private:
	unsigned char m_data[0x210];
};

// Emit only the owned destroy-range helper; whole-container instantiation
// also emits unrelated copying, growth and map operations.
template void _STL::__destroy_aux<_STL::deque<PSRequest>::iterator>(
	_STL::deque<PSRequest>::iterator, _STL::deque<PSRequest>::iterator,
	const _STL::__false_type &);
