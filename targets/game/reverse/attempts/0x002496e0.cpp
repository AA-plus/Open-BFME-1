// ?method@Rva002496E0@@QAEXPAVObject@@H@Z
// partial score=0.2056 date=2026-10-13
// cl: /DNDEBUG /MD /EHsc
// stlport
#include <list>
class Object;
namespace _STL {
template <> list<Object *>::list(const list<Object *> &);
template <> _List_base<Object *, allocator<Object *> >::~_List_base();
}
typedef _STL::list<Object *> Rva002496E0List;
class Rva002496E0Deep { public:
 virtual void slot00();
 virtual void slot01();
 virtual void slot02();
 virtual void slot03();
 virtual void slot04();
 virtual void slot05();
 virtual void slot06();
 virtual void slot07();
 virtual void slot08();
 virtual void slot09();
 virtual void slot0A();
 virtual void slot0B();
 virtual void slot0C();
 virtual void slot0D();
 virtual void slot0E();
 virtual void slot0F();
 virtual void slot10();
 virtual void slot11();
 virtual void slot12();
 virtual void slot13();
 virtual void slot14();
 virtual void slot15();
 virtual void slot16();
 virtual void slot17();
 virtual void slot18();
 virtual void slot19();
 virtual void slot1A();
 virtual void slot1B();
 virtual void slot1C();
 virtual void slot1D();
 virtual void slot1E();
 virtual void slot1F();
 virtual void slot20();
 virtual void slot21();
 virtual void slot22();
 virtual void slot23();
 virtual void slot24();
 virtual void slot25();
 virtual void slot26();
 virtual void slot27();
 virtual void slotA0(Object *);
 virtual void slot29();
 virtual void slot2A();
 virtual void slot2B();
 virtual void slot2C();
 virtual void slot2D();
 virtual void slot2E();
 virtual void slot2F();
 virtual void slot30();
 virtual void slot31();
 virtual void slot32();
 virtual void slot33();
 virtual void slot34();
 virtual void slot35();
 virtual void slot36();
 virtual void slot37();
 virtual void slot38();
 virtual void slot39();
 virtual void slot3A();
 virtual const Rva002496E0List &slotEC();
};
class Rva002496E0Interface { public:
 virtual void slot00();
 virtual void slot01();
 virtual void slot02();
 virtual void slot03();
 virtual void slot04();
 virtual void slot05();
 virtual void slot06();
 virtual void slot07();
 virtual void slot08();
 virtual void slot09();
 virtual void slot0A();
 virtual void slot0B();
 virtual void slot0C();
 virtual void slot0D();
 virtual void slot0E();
 virtual void slot0F();
 virtual void slot10();
 virtual void slot11();
 virtual void slot12();
 virtual void slot13();
 virtual void slot14();
 virtual void slot15();
 virtual void slot16();
 virtual void slot17();
 virtual void slot18();
 virtual void slot19();
 virtual Rva002496E0Deep *slot68();
};
struct Rva002496E0ObjectView {
 char m_00[0x1fc];
 Rva002496E0Interface *m_1fc;
 char m_200[0x168];
 unsigned char m_368;
};
extern void j_0004910c();
class Rva002496E0 { public:
 void method(Object *,int);
 void forward(Object *object,int door) {
  typedef void (Rva002496E0::*Fn)(Object *,int);
  union {void (*raw)();Fn member;} call;
  call.raw=j_0004910c;
  (this->*call.member)(object,door);
 }
};
void Rva002496E0::method(Object *object,int door) {
 Rva002496E0Interface *iface=((Rva002496E0ObjectView*)object)->m_1fc;
 if(iface) {
  Rva002496E0Deep *deep=iface->slot68();
  if(deep) {
   Rva002496E0List items(deep->slotEC());
   Rva002496E0List::iterator first=items.begin();
   Rva002496E0List::iterator i=first;
   while(i!=items.end() && ((Rva002496E0ObjectView*)*i)->m_368) ++i;
   if(i!=items.end()) {
    Object *selected=*i;
    deep->slotA0(selected);
    forward(selected,door);
   } else
   if(first!=items.end()) {
    Object *selected=*first;
    deep->slotA0(selected);
    forward(selected,door);
   } else forward(object,door);
   return;
  }
 }
 forward(object,door);
}
