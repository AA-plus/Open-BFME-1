// ?method@Rva002A1A80@@QAEPBVImage@@XZ
// partial score=0.2479 date=2026-10-13
// cl: /DNDEBUG /MD /EHsc /Igame/Libraries/Source/WWVegas/WWLib
#include "ascii_string.h"
template <> inline bool StringBase<char>::isEmpty() const { return !m_data || !m_data->length; }
class Image;
class ImageCollection { public: const Image *findImageByName(const AsciiString &); };
extern ImageCollection *TheMappedImageCollection;
extern void j_000022bb();
extern void j_0000c117();
struct Rva002A1A80Template {
 void *m_00;
 Rva002A1A80Template *m_04;
 const Rva002A1A80Template *final() const {
  if(m_04) {
   typedef const Rva002A1A80Template *(Rva002A1A80Template::*Fn)() const;
   union {void (*raw)(); Fn member;} call;
   call.raw=j_000022bb;
   return (m_04->*call.member)();
  }
  return this;
 }
};
struct Rva002A1A80Object { void *m_00; Rva002A1A80Template *m_04; };
struct Rva002A1A80Data { char m_00[0xac]; AsciiString m_ac; };
class Rva002A1A80 {
public:
 const Image *method();
 void *m_00;
 Rva002A1A80Data *m_04;
 Rva002A1A80Object *m_08;
 char m_0c[0x18];
 const Image *m_24;
};
const Image *Rva002A1A80::method() {
 if(!m_24) {
  Rva002A1A80Object *object=m_08;
  if(!m_04->m_ac.isEmpty()) {
   m_24=TheMappedImageCollection->findImageByName(m_04->m_ac);
   if(m_24) return m_24;
   object=m_08;
  }
  {
   const Rva002A1A80Template *value=object->m_04;
   if(value) value=value->final();
   typedef const Image *(__cdecl *Fn)(const Rva002A1A80Template *,const Rva002A1A80Object *);
   union {void (*raw)(); Fn typed;} call;
   call.raw=j_0000c117;
   m_24=call.typed(value,object);
  }
 }
 return m_24;
}
