// stlport
// Open-BFME5: STLport deque<PeerResponse> destruction helper.

#include <deque>

// upstream layout: inputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/GameEngine/Include/GameNetwork/GameSpy/PeerThread.h
class PeerResponse
{
public:
	~PeerResponse();

private:
	unsigned char m_data[0x330];
};

// Emit only the owned destroy-range helper; whole-container instantiation
// also emits unrelated copying, growth and map operations.
template void _STL::__destroy_aux<_STL::deque<PeerResponse>::iterator>(
	_STL::deque<PeerResponse>::iterator, _STL::deque<PeerResponse>::iterator,
	const _STL::__false_type &);
