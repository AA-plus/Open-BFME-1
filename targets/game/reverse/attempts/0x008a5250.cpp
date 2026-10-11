// ?aptKeyMatches@@YAPAVAptValue@@PAXH@Z
// partial score=0.9846 date=2026-10-11
// ?aptKeyMatches@@YAPAVAptValue@@PAXH@Z
// cl: /O2 /Ob2 /DNDEBUG /MD /EHsc
class AptValue { public: int toInteger() const; };
extern AptValue** g_bfmeArr1233;
extern int g_bfmeCount1233;
extern unsigned int Rva008A5250LastKey;
extern const int Rva008A5250KeyTable[0x14];
extern "C" int __cdecl toupper(int);
#define Rva008A5250KeyChar(code) toupper(code)
class AptBoolean {public:static AptBoolean *Create(bool);};
#define Rva008A53D0MakeBool(value) reinterpret_cast<AptValue *>(AptBoolean::Create(value))
// Open BFME 2 donor: Code/Libraries/Source/Apt/AptObject/AptKeyLookup.cpp.
AptValue *aptKeyMatches(void *,int) {
 AptValue *v=g_bfmeArr1233[g_bfmeCount1233-1];
 unsigned int key=Rva008A5250LastKey;
 if((key&3)==1) {
  int code=key>>17;
  if(code>=32&&code<=126) { int c=Rva008A5250KeyChar(code); return Rva008A53D0MakeBool(c==v->toInteger()); }
  else if(code<20)code=Rva008A5250KeyTable[code];
  return Rva008A53D0MakeBool(code==v->toInteger());
 }
 return Rva008A53D0MakeBool(false);
}
