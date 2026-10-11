// cl: /DNDEBUG /MD /EHsc /D_STLP_USE_STATIC_LIB
// stlport

#include <list>
#include <vector>

class Rva00246740
{
public:
	~Rva00246740();

private:
	_STL::vector< _STL::list<int> > m_lists;
};

// Only the destructor is retail's (00246740/206: node deallocation and
// delete); the wrapper's out-of-line destructor instantiates just that.

Rva00246740::~Rva00246740()
{
}
