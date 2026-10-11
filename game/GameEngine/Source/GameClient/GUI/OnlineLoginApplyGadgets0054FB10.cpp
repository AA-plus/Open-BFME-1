// cl: /DNDEBUG /DWIN32 /D_WINDOWS /MD /EHsc /Igame/Libraries/Source/WWVegas/WWLib
// Retail 0x0054FB10, 887 bytes. The matched OnlineLoginSyncGadgets caller
// proves the receiver; the exact original method name is not recovered. This
// body returns the login-enabled flag (AL), although the older caller's
// _bfme_applyLoginGadgets declaration discards that result.
// Fields 0x34/0x74/0x78/0x7C/0x95 agree with the matched OnlineLogin siblings;
// retail directly witnesses flags 0x9D and 0x9E. The name oracle has no aligned
// BfmeAptScreenOnlineLogin layout, so unknown members retain their offsets.
// OptionPreferences is 0x14 bytes: vptr + preference-map storage + m_filename
// at 0x10 (UserPreferences layout witness). EH cleanup places it at EBP-0x20.
// The short length reads intentionally sign-extend, unlike the loop bound.
// Keep the compare objects in their own scope, and each UI window in a distinct
// local: these lifetimes reproduce the frame reuse and call-site registers.
// Disable the CRT inline iswalnum wrapper: retail calls the import directly.
#define _WCTYPE_INLINE_DEFINED
#include "ascii_string.h"
#include "unicode_string.h"
template<class T> inline T StringBase<T>::getCharAt(int i) const { if(m_data) return m_data->data[i]; return 0; }
inline UnicodeString::~UnicodeString() { ((StringBase<unsigned short>*)this)->releaseBuffer(); }
#undef iswalnum
extern "C" __declspec(dllimport) int __cdecl iswalnum(unsigned short);
int Rva0054E760(int,int);
int Rva0054E860(int,int);
int Rva0054E8E0(int,int);
int Rva0054E960(int,int);
int Rva0054E5E0(int,int);
int Rva0054E7E0(int,int);
int Rva0054E660(int,int);
int Rva0054E6E0(int,int);
int Rva0054E9E0(int,int);
struct StringHeader0054FB10 { int field00; short field04; short field06; };
inline short shortLength0054FB10(const void *s) { StringHeader0054FB10 *p=*(StringHeader0054FB10*const*)s; if(p) return p->field04; return 0; }
class Gen_0054F1A0 { public: unsigned field00,field04; Gen_0054F1A0() {} bool bfmeDiffers(const Gen_0054F1A0&) const; };
class OptionPreferences { public: OptionPreferences(); virtual ~OptionPreferences(); bool hasGotOnline(); private: char field04[16]; };
class WindowManager;
// ILT 0x00015235 reaches the native eight-word dispatcher at 0x004675F0.
class BfmeLevelAN {
public:
 char *bfmeBuildAN(unsigned int level, int p2, int p3, int p4,
                   int p5, int p6, int p7, int p8);
};
extern WindowManager *g_rva012F19E8WindowManager;
struct LoginContext0054FB10 { char field00[0x250]; void *field250; };
class BfmeAptScreenOnlineLogin {
public:
 bool applyLoginGadgets0054FB10();
 bool _bfme_loginGadgetsState();
 UnicodeString bfmeGetTextAt74() const;
 UnicodeString bfmeGetTextAt78() const;
 UnicodeString bfmeGetTextAt7C() const;
 char field00[0x34]; LoginContext0054FB10 *field34;
 char field38[0x74-0x38]; void *field74,*field78,*field7c;
 char field80[0x95-0x80]; bool field95;
 char field96[7]; bool field9d,field9e;
};
bool BfmeAptScreenOnlineLogin::applyLoginGadgets0054FB10() {
 if(field95) return false;
 if(field74 && field78 && field7c) {
 int count=0;
  bool old9d=field9d;
  bool old9e=field9e;
  field9d=false;
  field9e=!_bfme_loginGadgetsState();
  AsciiString text(bfmeGetTextAt74());
  bool differs;
  {
   Gen_0054F1A0 a,b;
   int len=shortLength0054FB10(&text);
   a.field04=Rva0054E760(len,len);
   b.field04=0x858a1a56;
   differs=a.bfmeDiffers(b);
  }
  if(differs) {
   UnicodeString text78=bfmeGetTextAt78();
   unsigned index=0x342c2be0;
   for(;;) {
    unsigned len78=text78.getLength();
    if(Rva0054E5E0(index,Rva0054E860(len78,len78))==0x342c2be0) break;
    if(iswalnum(text78.getCharAt(Rva0054E9E0(index,index)))) ++count;
    index=Rva0054E7E0(index,0x352d2ff1);
   }
   unsigned encodedCount=Rva0054E8E0(count,count);
   if(Rva0054E660(encodedCount,0x88772dde)!=0xaa37acc2) {
    UnicodeString text7c=bfmeGetTextAt7C();
    int len7c=shortLength0054FB10(&text7c);
    unsigned encodedLen=Rva0054E960(len7c,len7c);
    if(Rva0054E6E0(encodedLen,0x88772dde)!=0xaa37acc2) field9d=true;
   }
  }
  if(old9d!=field9d) {
   const char* s=field9d?"EnableButtonLogin":"DisableButtonLogin";
   void *w=field34->field250;
   reinterpret_cast<BfmeLevelAN *>(g_rva012F19E8WindowManager)->bfmeBuildAN(reinterpret_cast<unsigned int>(w),reinterpret_cast<int>("CallChild"),1,reinterpret_cast<int>(s),0,0,0,0);
   const char *s2=field9d?"EnableButtonDeleteNickname":"DisableButtonDeleteNickname";
   void *w2=field34->field250;
   reinterpret_cast<BfmeLevelAN *>(g_rva012F19E8WindowManager)->bfmeBuildAN(reinterpret_cast<unsigned int>(w2),reinterpret_cast<int>("CallChild"),1,reinterpret_cast<int>(s2),0,0,0,0);
  }
  if(old9e!=field9e) {
   if(field9e) {
    OptionPreferences prefs;
    if(prefs.hasGotOnline()) { void *w=field34->field250; reinterpret_cast<BfmeLevelAN *>(g_rva012F19E8WindowManager)->bfmeBuildAN(reinterpret_cast<unsigned int>(w),reinterpret_cast<int>("CallChild"),1,reinterpret_cast<int>("EnableButtonRegister"),0,0,0,0); }
    else { void *w=field34->field250; reinterpret_cast<BfmeLevelAN *>(g_rva012F19E8WindowManager)->bfmeBuildAN(reinterpret_cast<unsigned int>(w),reinterpret_cast<int>("CallChild"),1,reinterpret_cast<int>("GlowButtonRegister"),0,0,0,0); }
   } else {
    void *w=field34->field250;
    reinterpret_cast<BfmeLevelAN *>(g_rva012F19E8WindowManager)->bfmeBuildAN(reinterpret_cast<unsigned int>(w),reinterpret_cast<int>("CallChild"),1,reinterpret_cast<int>("DisableButtonRegister"),0,0,0,0);
    field9d=true;
   }
  }
  void *w=field34->field250;
  reinterpret_cast<BfmeLevelAN *>(g_rva012F19E8WindowManager)->bfmeBuildAN(reinterpret_cast<unsigned int>(w),reinterpret_cast<int>("CallChild"),1,reinterpret_cast<int>("EnableButtonServiceTerms"),0,0,0,0);
  return field9d;
 }
 return false;
}
