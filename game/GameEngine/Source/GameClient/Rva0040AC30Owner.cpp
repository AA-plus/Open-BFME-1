// Acquire the two decoded referents through an address-derived ABI view.
// cl: /DNDEBUG /DWIN32 /D_WINDOWS /MD /EHsc /D_STLP_USE_STATIC_LIB /Igame/Libraries/Source/WWVegas/WW3D2 /Igame/Libraries/Source/WWVegas/WWLib /Igame/Libraries/Source/WWVegas/WWMath /Igame/Libraries/Source/WWVegas/WWDebug /Iinputs/reference/shims/sweep
// stlport

#define _OPERATOR_NEW_DEFINED_
#include <map>

#include "matpass.h"

extern int g_bfme5MatPassCount;

class Bfme5MaterialPass : public MaterialPassClass
{
public:
	Bfme5MaterialPass(int a, int b);
	virtual ~Bfme5MaterialPass();

	int m_bfme38;
	int m_bfme3c;
	int m_bfme40;
	int m_bfme44;
};

struct Rva0040AAD0Value
{
	Bfme5MaterialPass *m_body;

	// ??0Rva0040AAD0Value@@QAE@PAVBfme5MaterialPass@@@Z absent-from-retail
	Rva0040AAD0Value(Bfme5MaterialPass *material) : m_body(material) {}
};

typedef _STL::pair<const unsigned int, Rva0040AAD0Value> Rva0040AC30Pair;

typedef _STL::_Rb_tree<unsigned int,
	Rva0040AC30Pair,
	_STL::_Select1st<Rva0040AC30Pair>,
	_STL::less<unsigned int>,
	_STL::allocator<Rva0040AC30Pair> > Rva0040AC30Tree;

template <>
Rva0040AC30Tree::iterator Rva0040AC30Tree::_M_insert(
	_STL::_Rb_tree_node_base *, _STL::_Rb_tree_node_base *,
	const Rva0040AC30Pair &, _STL::_Rb_tree_node_base *);

class Gen_00C6FF10Target;
extern Gen_00C6FF10Target TheBfmeObject_00C6FF10;
#define g_rva012F10DCTree (*reinterpret_cast<Rva0040AC30Tree *>(&TheBfmeObject_00C6FF10))

class Rva0040AC30Owner
{
public:
	Bfme5MaterialPass *method(int a1, int a2);

private:
	int m_prefix;
	Bfme5MaterialPass *m_firstReferent;	// +0x04 (fresh, non-tree)
	Bfme5MaterialPass *m_secondReferent;	// +0x08 (tree get-or-create)
	int m_flag;				// +0x0C
};

// ?method@Rva0040AC30Owner@@QAEPAVBfme5MaterialPass@@HH@Z
Bfme5MaterialPass *Rva0040AC30Owner::method(int a1, int a2)
{
	Rva0040AC30Tree::iterator it = g_rva012F10DCTree.find(reinterpret_cast<const unsigned int &>(a1));
	if (it == g_rva012F10DCTree.end())
	{
		Bfme5MaterialPass *material = new Bfme5MaterialPass(a1, a2);
		m_secondReferent = material;
		g_rva012F10DCTree.insert_unique(Rva0040AC30Pair(static_cast<unsigned int>(a1), material));
		Bfme5MaterialPass *second = m_secondReferent;
		second->m_bfme40 = 1;
	}
	else
	{
		m_secondReferent = it->second.m_body;
		++*(int *)((char *)m_secondReferent + 4);
	}
	Bfme5MaterialPass *first = new Bfme5MaterialPass(a1, a2);
	m_firstReferent = first;
	first->m_bfme40 = 0;
	m_flag = 0;
	return first;
}

typedef char Rva0040AC30MaterialSize[sizeof(MaterialPassClass) == 0x38 ? 1 : -1];
typedef char Rva0040AC30ReferentSize[sizeof(Bfme5MaterialPass) == 0x48 ? 1 : -1];
typedef char Rva0040AC30ValueSize[sizeof(Rva0040AAD0Value) == 4 ? 1 : -1];
typedef char Rva0040AC30PairSize[sizeof(Rva0040AC30Pair) == 8 ? 1 : -1];
typedef char Rva0040AC30OwnerSize[sizeof(Rva0040AC30Owner) == 0x10 ? 1 : -1];
