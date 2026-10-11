// ?update@ProductionUpdate@@UAE?AW4UpdateSleepTime@@XZ
// partial score=0.2356 date=2026-10-11
// cl: /DNDEBUG /MD /EHsc /D_STLP_USE_STATIC_LIB /Iinputs/reference/shims/stringbaseunicode /Igame/Libraries/Source/WWVegas/WWLib /Iinputs/reference/CnC_Generals_Zero_Hour/GeneralsMD/Code/Libraries/Include
// stlport
#define _STLP_NO_EXCEPTIONS 1
#include "string_base.h"
template <> inline const char *StringBase<char>::str() const {
  static const char TheNullChr = 0;
  return m_data ? m_data->data : &TheNullChr;
}
template <>
inline const unsigned short *StringBase<unsigned short>::str() const {
  static const unsigned short TheNullChr = 0;
  return m_data ? m_data->data : &TheNullChr;
}
#include "ascii_string.h"
#include "basetype.h"
#include <bitset>
#include <list>
#include <wchar.h>
#include "Common/UnicodeString.h"
#include <string.h>
inline UnicodeString::~UnicodeString() {
  ((StringBase<wchar_t> *)this)->releaseBuffer();
}
template <> __declspec(noinline) bool StringBase<char>::isEmpty() const {
  return m_data == 0 || m_data->length == 0;
}
// Full native reconstruction of the independently witnessed ProductionUpdate
// secondary UpdateModuleInterface entry; this receiver is primary object+10.
// Scratch reconstruction, not byte-matched game source. Full 4685-byte retail
// boundary, decoded callees and independently native ctor establish ownership.
// Neutral hidden-return helpers below are actual 0029C410/0029C440 targets;
// no pins are supplied for their local spellings. All fields retain addresses
// unless the ProductionUpdate twin and constructor establish their meaning.
class NameKeyGenerator;
extern NameKeyGenerator *TheNameKeyGenerator;
class GameLogic;
extern GameLogic *TheGameLogic;
class AudioManager;
extern AudioManager *TheAudio;
class PlayerList;
extern PlayerList *ThePlayerList;
class ExperienceLevelSystem;
extern ExperienceLevelSystem *TheExperienceLevelSystem;
class ThingFactory;
extern ThingFactory *TheThingFactory;
class ScriptEngine;
extern ScriptEngine *TheScriptEngine;
class GameText;
extern GameText *TheGameText;
class InGameUI;
extern InGameUI *TheInGameUI;
class Radar;
extern Radar *TheRadar;
class Eva;
extern Eva *TheEva;
class FXListStore;
extern FXListStore *TheFXListStore;
class UpgradeCenter;
extern UpgradeCenter *TheUpgradeCenter;
class ControlBar;
extern ControlBar *TheControlBar;

typedef void (*Entry)();
struct Rva0029E330CallOwner {};
struct Rva0029E330ModelConditionView {
  _STL::bitset<320> bits;
};
template <class T, int Offset> __forceinline T &field(void *p) {
  return *(T *)((char *)p + Offset);
}
template <class T, int Offset> __forceinline const T &field(const void *p) {
  return *(const T *)((const char *)p + Offset);
}
template <int Address> __forceinline void *global() {
  return *(void **)Address;
}
__forceinline Entry slot(void *p, int n) { return (*(Entry **)p)[n / 4]; }
template <class R> __forceinline R invoke(void *p, Entry entry) {
  typedef R (Rva0029E330CallOwner::*Method)();
  union {
    Entry raw;
    Method member;
  } f;
  f.raw = entry;
  return (((Rva0029E330CallOwner *)p)->*f.member)();
}
template <class R, class A0>
__forceinline R invoke(void *p, Entry entry, A0 a0) {
  typedef R (Rva0029E330CallOwner::*Method)(A0);
  union {
    Entry raw;
    Method member;
  } f;
  f.raw = entry;
  return (((Rva0029E330CallOwner *)p)->*f.member)(a0);
}
template <class R, class A0, class A1>
__forceinline R invoke(void *p, Entry entry, A0 a0, A1 a1) {
  typedef R (Rva0029E330CallOwner::*Method)(A0, A1);
  union {
    Entry raw;
    Method member;
  } f;
  f.raw = entry;
  return (((Rva0029E330CallOwner *)p)->*f.member)(a0, a1);
}
template <class R, class A0, class A1, class A2>
__forceinline R invoke(void *p, Entry entry, A0 a0, A1 a1, A2 a2) {
  typedef R (Rva0029E330CallOwner::*Method)(A0, A1, A2);
  union {
    Entry raw;
    Method member;
  } f;
  f.raw = entry;
  return (((Rva0029E330CallOwner *)p)->*f.member)(a0, a1, a2);
}
template <class R, class A0, class A1, class A2, class A3>
__forceinline R invoke(void *p, Entry entry, A0 a0, A1 a1, A2 a2, A3 a3) {
  typedef R (Rva0029E330CallOwner::*Method)(A0, A1, A2, A3);
  union {
    Entry raw;
    Method member;
  } f;
  f.raw = entry;
  return (((Rva0029E330CallOwner *)p)->*f.member)(a0, a1, a2, a3);
}
template <class R, class A0, class A1, class A2, class A3, class A4>
__forceinline R invoke(void *p, Entry entry, A0 a0, A1 a1, A2 a2, A3 a3,
                       A4 a4) {
  typedef R (Rva0029E330CallOwner::*Method)(A0, A1, A2, A3, A4);
  union {
    Entry raw;
    Method member;
  } f;
  f.raw = entry;
  return (((Rva0029E330CallOwner *)p)->*f.member)(a0, a1, a2, a3, a4);
}
extern void j_000022bb();
extern void j_00004f1b();
extern void j_000076fd();
extern void j_000077b6();
extern void j_00008337();
extern void j_000084b8();
extern void j_00008b8e();
extern void j_00008e86();
extern void j_000095ed();
extern void j_0000a7a9();
extern void j_0000c752();
extern void j_0000c87e();
extern void j_0000d990();
extern void j_0000da8a();
extern void j_00010096();
extern void j_0001253f();
extern void j_0001362e();
extern void j_00013732();
extern void j_000157f3();
extern void j_0001621b();
extern void j_0001669e();
extern void j_0001697d();
extern void j_00016b67();
extern void j_000196c8();
extern void j_00019a6a();
extern void j_0001a276();
extern void j_0001a97e();
extern void j_0001bfd1();
extern void j_0001c0b2();
extern void j_0001e00b();
extern void j_0001e204();
extern void j_0001f253();
extern void j_0001f753();
extern void j_0001ff91();
extern void j_00020824();
extern void j_0002191d();
extern void j_00022336();
extern void j_00023d4e();
extern void j_00025eeb();
extern void j_000263d2();
extern void j_00026f35();
extern void j_00027fcf();
extern void j_0002852e();
extern void j_00028560();
extern void j_0002abf8();
extern void j_0002ae23();
extern void j_0002b5f3();
extern void j_0002b81e();
extern void j_0002d439();
extern void j_0002f3c4();
extern void j_0002F95A();
extern void j_0002fbb7();
extern void j_00030a1c();
extern void j_0003364a();
extern void j_0003436a();
extern void j_00036953();
extern void j_00037038();
extern void j_0003867c();
extern void j_000399A5();
extern void j_0003a1a7();
extern void j_0003a279();
extern void j_0003aa17();
extern void j_0003ac88();
extern void j_0003acb0();
extern void j_0003add7();
extern void j_0003c06a();
extern void j_0003c772();
extern void j_0003f8d7();
extern void j_00040327();
extern void j_00040863();
extern void j_00043cca();
extern void j_0004494a();
extern void j_0004511a();
extern void j_00046a1f();
extern void j_00047b27();
extern void j_00047ec9();
extern void j_00049fb2();
extern void j_0004a151();
extern void j_0004b01f();

enum ObjectID { INVALID_ID = 0 };
enum UpdateSleepTime { UPDATE_SLEEP_NONE = 1 };
struct AudioEventInfoRef {
  void *value;
};
class AudioEventRTS {
public:
  AudioEventRTS(const AudioEventInfoRef &, ObjectID);
  AudioEventRTS(const AudioEventRTS &);
  virtual ~AudioEventRTS();
  AudioEventRTS &assign(const AudioEventRTS &);
  void setPlayerIndex(int);
  void setObjectID(ObjectID);

private:
  char unknown04[108];
};
struct Rva0029E330Entry {
  virtual void destroy(unsigned);
  int type;
  void *objectTemplate;
  void *upgrade;
  int identifier;
  float percent, rate;
  int frames, quantity, produced, field28, door, field30;
  bool special;
  char pad35[3];
  int field38;
  Rva0029E330Entry *next;
  Rva0029E330Entry *prev;
};
struct Rva0029E330Door {
  unsigned opened, waiting, closed;
  bool hold;
  char pad[3];
};
struct Rva0029E330ListNode {
  Rva0029E330ListNode *next, *prev;
  ObjectID id;
};

struct Rva0029C380Record;
class Rva0029C380 {
public:
  Rva0029C380Record *m0029C380();
};
class Rva000F9780 {
public:
  float method(int index);
};
class Rva0029C440 {
public:
  AsciiString rva0029C440(int index);
};

extern void dup_0029c410();
template <class Method> __forceinline Method value(Entry entry) {
  union {
    Entry raw;
    Method member;
  } binding;
  binding.raw = entry;
  return binding.member;
}
class Rva0029C410Value {
public:
  AsciiString value();
};
class Rva0029C440Value {
public:
  __declspec(noinline) inline AsciiString value(int index) {
    return m_names[index];
  }
private:
  unsigned char m_head[0x38];
  AsciiString m_names[8];
};

class ProductionUpdate {
public:
  virtual UpdateSleepTime update();
};
static const unsigned theOpeningFlags[4] = {21, 25, 29, 33};
static const unsigned theClosingFlags[4] = {22, 26, 30, 34};
static const unsigned theWaitingOpenFlags[4] = {23, 27, 31, 35};
__forceinline void bitSet(unsigned *bits, unsigned bit, bool set = true) {
  if (set)
    bits[bit >> 5] |= 1u << (bit & 31);
  else
    bits[bit >> 5] &= ~(1u << (bit & 31));
}
enum DisabledType { DISABLED_RVA3 = 3 };
class Player;
class Object {
public:
  Player *getControllingPlayer() const;
  void updateUpgradeModules();
  void setDisabledUntil(DisabledType, unsigned);
};
__forceinline void *player(void *obj) {
  return ((Object *)obj)->getControllingPlayer();
}
__forceinline void notify(void *obj) { invoke<void>(obj, j_0002191d); }
__forceinline void setModelBit(void *obj, unsigned offset, unsigned mask,
                               bool set) {
  unsigned &bits = *(unsigned *)((char *)obj + offset);
  if (((bits & mask) != 0) != set) {
    if (set)
      bits |= mask;
    else
      bits &= ~mask;
    notify(obj);
  }
}
__forceinline void removeEntry(void *self, Rva0029E330Entry *e) {
  invoke<void>(self, j_0002f3c4, e);
  e->destroy(1);
}
__forceinline void *finalTemplate(void *obj) {
  void *t = field<void *, 4>(obj);
  if (t && field<void *, 4>(t))
    t = invoke<void *>(field<void *, 4>(t), j_000022bb);
  return t;
}
__forceinline void clearFields(unsigned *p) {
  for (int i = 0; i < 10; ++i)
    p[i] = 0;
}

class Player;
class Upgrade;
class UpgradeTemplate;
enum UpgradeStatusType { UPGRADE_STATUS_RVA2 = 2 };
class Rva0029E330PlayerView {
public:
};
class Player {
public:
  Upgrade *addUpgrade(const UpgradeTemplate *, UpgradeStatusType);
  float getProductionTimeChangePercent(const AsciiString &) const;
};
class ThingTemplate {
public:
  int calcTimeToBuild(const Player *, int) const;
};
enum RadarEventType { RADAR_EVENT_RVA2 = 2 };
class Radar {
public:
  void createEvent(const Coord3D *, RadarEventType, float);
};
class Drawable;
class PickAndPlayInfo;
class GameMessage {
public:
  enum Type { RVA_7DA = 0x7da, RVA_7E2 = 0x7e2 };
};
bool pickAndPlayUnitVoiceResponse(const _STL::list<Drawable *> *,
                                  GameMessage::Type, PickAndPlayInfo *);
class Rva0029E330UI {
public:
  virtual void s00();
  virtual void s04();
  virtual void s08();
  virtual void s0c();
  virtual void s10();
  virtual void s14();
  virtual void s18();
  virtual void s1c();
  virtual void s20();
  virtual void s24();
  virtual void s28();
  virtual void s2c();
  virtual void s30();
  virtual void message(UnicodeString, ...);
};
template <int N> class BitFlags {
public:
  enum BogusInitType { kInit = 0 };
  BitFlags(BogusInitType, int);
  unsigned words[(N + 31) / 32];
};
class Rva0029E330Audio {
public:
  virtual void slot00();
  virtual void slot04();
  virtual void slot08();
  virtual void slot0c();
  virtual void slot10();
  virtual void slot14();
  virtual void slot18();
  virtual void slot1c();
  virtual void slot20();
  virtual void slot24();
  virtual void slot28();
  virtual void slot2c();
  virtual void slot30();
  virtual void slot34();
  virtual void slot38();
  virtual void slot3c();
  virtual void slot40();
  virtual int add(AudioEventRTS *);
  virtual void slot48();
  virtual void remove(int);
  virtual void slot50();
  virtual void slot54();
  virtual void slot58();
  virtual bool valid(AudioEventRTS *);
  virtual void slot60();
  virtual void slot64();
  virtual void slot68();
  virtual void slot6c();
  virtual void slot70();
  virtual void slot74();
  virtual void slot78();
  virtual void slot7c();
  virtual void slot80();
  virtual void slot84();
  virtual void slot88();
  virtual void slot8c();
  virtual void slot90();
  virtual void slot94();
  virtual void slot98();
  virtual void slot9c();
  virtual void slota0();
  virtual void slota4();
  virtual void slota8();
  virtual void slotac();
  virtual bool active(int);
};
class Rva0029E330GameText {
public:
  virtual void slot00();
  virtual void slot04();
  virtual void slot08();
  virtual void slot0c();
  virtual void slot10();
  virtual void slot14();
  virtual void slot18();
  virtual void slot1c();
  virtual void slot20();
  virtual void slot24();
  virtual UnicodeString fetch(const char *, bool *);
};
class Rva0029E330ObjectV {
public:
  virtual void slot00();
  virtual void slot04();
  virtual void slot08();
  virtual void slot0c();
  virtual void slot10();
  virtual void slot14();
  virtual void slot18();
  virtual void slot1c();
  virtual void slot20();
  virtual void slot24();
  virtual void *drawable();
};
class Rva0029E330Exit {
public:
  virtual void slot00();
  virtual int reserve(void *, void *);
  virtual void exit(void *, int);
  virtual void slot0c();
  virtual void slot10();
  virtual void slot14();
  virtual void slot18();
  virtual void slot1c();
  virtual void slot20();
  virtual void slot24();
  virtual bool position(Coord3D *, float *);
  virtual void complete();
};
class Rva0029E330Script {
public:
  virtual void slot00();
  virtual void slot04();
  virtual void slot08();
  virtual void slot0c();
  virtual void slot10();
  virtual void slot14();
  virtual void slot18();
  virtual void slot1c();
  virtual void slot20();
  virtual void slot24();
  virtual void slot28();
  virtual void slot2c();
  virtual void slot30();
  virtual void slot34();
  virtual void slot38();
  virtual void slot3c();
  virtual void slot40();
  virtual void slot44();
  virtual void slot48();
  virtual void slot4c();
  virtual void slot50();
  virtual void slot54();
  virtual void slot58();
  virtual void slot5c();
  virtual void slot60();
  virtual void slot64();
  virtual void slot68();
  virtual void slot6c();
  virtual void slot70();
  virtual void slot74();
  virtual void slot78();
  virtual void slot7c();
  virtual void slot80();
  virtual void slot84();
  virtual void slot88();
  virtual void slot8c();
  virtual void slot90();
  virtual void slot94();
  virtual void notify(int, const AsciiString &, ObjectID);
};
class Rva0029E330Production {
public:
  virtual void slot00();
  virtual void slot04();
  virtual void slot08();
  virtual void slot0c();
  virtual void cancel(void *);
};
class Rva0029E330Contain {
public:
  virtual void slot00();
  virtual void slot04();
  virtual void slot08();
  virtual void slot0c();
  virtual void slot10();
  virtual void slot14();
  virtual void slot18();
  virtual void slot1c();
  virtual void slot20();
  virtual void slot24();
  virtual void slot28();
  virtual void slot2c();
  virtual void slot30();
  virtual void slot34();
  virtual void slot38();
  virtual void slot3c();
  virtual void slot40();
  virtual void slot44();
  virtual void slot48();
  virtual void slot4c();
  virtual void slot50();
  virtual void slot54();
  virtual void slot58();
  virtual void slot5c();
  virtual void slot60();
  virtual int rva64();
  virtual void *rva68();
};
class Rva0029E330Rebuild {
public:
  virtual void slot00();
  virtual void slot04();
  virtual void slot08();
  virtual void slot0c();
  virtual void slot10();
  virtual void slot14();
  virtual void slot18();
  virtual void slot1c();
  virtual void slot20();
  virtual AsciiString name();
  virtual int count();
};
class Rva0029E330Behavior {
public:
  virtual void slot00();
  virtual void slot04();
  virtual void slot08();
  virtual void *create();
};
class Rva0029E330Create {
public:
  virtual void slot00();
  virtual void onComplete();
};
class Rva0029E330AI {
public:
  virtual void slot00();
  virtual void slot04();
  virtual void slot08();
  virtual void slot0c();
  virtual void slot10();
  virtual void slot14();
  virtual void slot18();
  virtual void slot1c();
  virtual void slot20();
  virtual void slot24();
  virtual void slot28();
  virtual void slot2c();
  virtual void slot30();
  virtual void slot34();
  virtual void slot38();
  virtual void slot3c();
  virtual void slot40();
  virtual void slot44();
  virtual void slot48();
  virtual void slot4c();
  virtual void slot50();
  virtual void slot54();
  virtual void slot58();
  virtual void slot5c();
  virtual void slot60();
  virtual void slot64();
  virtual void slot68();
  virtual void slot6c();
  virtual void slot70();
  virtual void slot74();
  virtual void slot78();
  virtual void slot7c();
  virtual void slot80();
  virtual void slot84();
  virtual void slot88();
  virtual void slot8c();
  virtual void slot90();
  virtual void slot94();
  virtual void slot98();
  virtual void slot9c();
  virtual void slota0();
  virtual void slota4();
  virtual void slota8();
  virtual void slotac();
  virtual void slotb0();
  virtual void slotb4();
  virtual void slotb8();
  virtual void slotbc();
  virtual void slotc0();
  virtual void slotc4();
  virtual void slotc8();
  virtual void slotcc();
  virtual void slotd0();
  virtual void slotd4();
  virtual void slotd8();
  virtual void slotdc();
  virtual void slote0();
  virtual void slote4();
  virtual void slote8();
  virtual void slotec();
  virtual void slotf0();
  virtual void slotf4();
  virtual void slotf8();
  virtual void slotfc();
  virtual void slot100();
  virtual void slot104();
  virtual void slot108();
  virtual void slot10c();
  virtual void slot110();
  virtual void slot114();
  virtual void slot118();
  virtual void slot11c();
  virtual void slot120();
  virtual void slot124();
  virtual void slot128();
  virtual void slot12c();
  virtual bool rva130();
};
class Rva0029E330Selected {
public:
  virtual void slot00();
  virtual void slot04();
  virtual void slot08();
  virtual void slot0c();
  virtual void slot10();
  virtual void slot14();
  virtual void slot18();
  virtual void slot1c();
  virtual void slot20();
  virtual void slot24();
  virtual void slot28();
  virtual void slot2c();
  virtual void slot30();
  virtual void slot34();
  virtual void slot38();
  virtual void slot3c();
  virtual void slot40();
  virtual void slot44();
  virtual void slot48();
  virtual void slot4c();
  virtual void slot50();
  virtual void slot54();
  virtual void slot58();
  virtual void slot5c();
  virtual void slot60();
  virtual void slot64();
  virtual void slot68();
  virtual void slot6c();
  virtual void slot70();
  virtual void slot74();
  virtual void slot78();
  virtual void slot7c();
  virtual void slot80();
  virtual void slot84();
  virtual void slot88();
  virtual void slot8c();
  virtual void slot90();
  virtual void slot94();
  virtual void slot98();
  virtual void slot9c();
  virtual void slota0();
  virtual void slota4();
  virtual void slota8();
  virtual void slotac();
  virtual void slotb0();
  virtual void slotb4();
  virtual void slotb8();
  virtual void slotbc();
  virtual void slotc0();
  virtual void slotc4();
  virtual void slotc8();
  virtual void slotcc();
  virtual void slotd0();
  virtual void slotd4();
  virtual void slotd8();
  virtual void slotdc();
  virtual void slote0();
  virtual void slote4();
  virtual void slote8();
  virtual void slotec();
  virtual void slotf0();
  virtual void slotf4();
  virtual void slotf8();
  virtual void slotfc();
  virtual void slot100();
  virtual void *selected();
};
//-------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------
UpdateSleepTime ProductionUpdate::update() {
  /// @todo srj use SLEEPY_UPDATE here
  static int respawnKey =
      invoke<int>((void *)TheNameKeyGenerator, j_0003add7, "RespawnUpdate");
  void *data = field<void *, -12>(this);
  void *us = field<void *, -8>(this);
  unsigned now = field<unsigned, 0x3c>((void *)TheGameLogic);
  void *experience = field<void *, 0x210>(us);
  void *self = (char *)this - 0x10;
  Rva0029E330Entry *production = (Rva0029E330Entry *)((Rva0029C380 *)self)->m0029C380();
  if (player(us)) {
    if (field<bool, 0x3d>(data)) {
      float change = ((Player *)player(us))->getProductionTimeChangePercent(
          field<AsciiString, 0x40>(data));
      if (change < 0.0f)
        setModelBit(us, 0x134, 0x800, true);
      else
        setModelBit(us, 0x134, 0x800, false);
    }
    if (field<void *, 0x44>(data)) {
      float change = ((Player *)player(us))->getProductionTimeChangePercent(
          field<AsciiString, 0x40>(data));
      if (change < 0.0f && !(field<unsigned char, 0x344>(us) & 1) &&
          !(field<unsigned, 0x90>(us) & 4)) {
        if (!((Rva0029E330Audio *)(void *)TheAudio)
                 ->active(field<int, 0xd4>(this))) {
          AudioEventRTS sound(field<AudioEventInfoRef, 0x44>(data),
                              field<ObjectID, 0x74>(us));
          sound.setPlayerIndex(field<int, 0x24>(player(us)));
          field<int, 0xd4>(this) =
              ((Rva0029E330Audio *)(void *)TheAudio)->add(&sound);
        }
      } else {
        ((Rva0029E330Audio *)(void *)TheAudio)
            ->remove(field<int, 0xd4>(this));
        field<int, 0xd4>(this) = 1;
      }
    }
  }
  // update the door behaviors
  if (field<int, 8>(data) > 0)
    invoke<void>(self, j_00037038);
  if (field<unsigned, 0xd0>(this) > 0)
    --field<unsigned, 0xd0>(this);
  //
  // if we're in the construction complete state ... we need to check frame
  // we're in it and get out of it when the time is up
  //
  if (field<unsigned, 0x28>(this) &&
      now - field<unsigned, 0x28>(this) > field<unsigned, 0x18>(data)) {
    // set our frame marker to be out of construction complete state
    field<unsigned, 0x28>(this) = 0;
    // set the flags that show the difference in the model
    field<unsigned, 0x74>(this) |= 0x200;
    field<unsigned, 0x9c>(this) &= ~0x200;
    field<bool, 0xbc>(this) = true;
  }
  // end if
  // end if
  // if we have dirty bits that need to be set and cleared, do it here all at once
  if (field<bool, 0xbc>(this) == true) {
    invoke<void>(us, j_000095ed, (unsigned *)((char *)this + 0x6c),
                 (unsigned *)((char *)this + 0x94));
    // clear the things we just set and turn off our dirty flag
    clearFields((unsigned *)((char *)this + 0x6c));
    clearFields((unsigned *)((char *)this + 0x94));
    field<bool, 0xbc>(this) = false;
  }
  // end if
  // if nothing in the queue get outta here
  if (!production)
    return UPDATE_SLEEP_NONE;
  //
  // if we've become OBJECT_STATUS_SOLD, halt all production ... leave things in the
  // queue because if the sell process completes we get money back for them, for now we
  // will be just frozen in time
  // Actually, there will be nothing in the queue since everything gets cancel/refunded
  // at the start of sell, but we still don't want to do anything here.
  //
  if (field<unsigned, 0x90>(us) & 0x80000)
    return UPDATE_SLEEP_NONE;
  // get the player that is building this thing
  void *owner = player(us);
  // sanity
  if (!owner) {
    // remove from queue list
    // delete the production entry
    removeEntry(self, production);
    return UPDATE_SLEEP_NONE;
  }
  // end if
  //
  // you can disallow types of units on the fly in scripts, so if there is something
  // in the queue that suddenly can't be build then get rid of it
  //
  if (production->type == 1 && !field<int, 0xc8>(this) &&
      !(field<unsigned, 0xc0>(this) > 0)) {
    bool allowed = invoke<bool>(owner, j_0001a276, production->objectTemplate);
    unsigned char available = invoke<unsigned char>(
        (char *)owner + 0x30, j_00022336, production->objectTemplate, 1);
    if ((!allowed || !available) && !production->special) {
      if (!available && owner == field<void *, 0xc>((void *)ThePlayerList))
        invoke<bool>((void *)TheEva, j_0002b5f3, 13, (Coord3D *)0);
      return UPDATE_SLEEP_NONE;
    }
    // end if
  }
  // end if
  if (production->type == 2 && production->upgrade &&
      field<int, 4>(production->upgrade) == 1 &&
      !invoke<bool>(field<void *, -8>(this), j_000077b6, production->upgrade)) {
    ((Rva0029E330Production *)((char *)this + 0x10))
        ->cancel(production->upgrade);
    return UPDATE_SLEEP_NONE;
  }
  // increase the frames we've been under production for
  ++production->frames;
  // how many total logic frames does it take to produce this unit
  int total;
  switch (production->type) {
  case 1:
    total = ((ThingTemplate *)production->objectTemplate)
                ->calcTimeToBuild((Player *)owner, -1);
    break;
  case 2:
    total = invoke<int>(production->upgrade, j_0002fbb7, owner);
    break;
  case 3:
    total =
        invoke<int>((char *)owner + 0x684, j_00030a1c, production->identifier);
    break;
  default:
    total = 1;
    break;
  }
  if (total < 1)
    total = 1;
  {
  float multiplier = 1.0f;
  if (invoke<bool>(field<void *, -8>(this), j_0002abf8, 12, &multiplier))
    total = (int)((float)total / multiplier);
  // figure out our percent complete
  float percent = (float)production->frames / (float)total * 100.0f;
  production->percent = percent;
  production->rate = 100.0f / (float)total;
  // if we've reached 100% or more we're done, tada!
  if (production->type == 3 && ((char *)owner + 0x684)) {
    int object =
        invoke<int>((char *)owner + 0x684, j_0000a7a9,
                       production->objectTemplate, production->identifier);
    if (!(((Rva000F9780 *)((char *)owner + 0x684))->method(object) >= 1.0f) ||
        field<int, 0xd0>(this))
      return UPDATE_SLEEP_NONE;
  } else if (!(percent >= 100.0f))
    return UPDATE_SLEEP_NONE;
  }
  switch (production->type) {
  // handle unit production items
  case 1:
  case 3: {
    bool isRespawn = production->type == 3;
    // create this unit
    //if I've got a ExitModule
    void *exitInterface = invoke<void *>(us, j_00023d4e);
    if (exitInterface) {
      //
      // only exit if the exit interface will let us ... if we can't we'll just keep this
      // unit in the production and keep "overbuilding" it, every frame we will check to see
      // if we can exit and then move onto production of the next one
      //
      int remaining = production->quantity - production->produced;  // this will change midloop, so it can't be the For clause
      for (int item = 0; item < remaining; ++item) {
        int doorIndex = production->door;
        if (doorIndex == -1) {
          doorIndex = ((Rva0029E330Exit *)exitInterface)
                          ->reserve(production->objectTemplate, 0);
          production->door = doorIndex;
        }
        if (doorIndex == -1)
          continue;
        // note, could be DOOR_NONE_NEEDED! so door could be null. (srj)
        Rva0029E330Door *door =
            (doorIndex >= 0 && doorIndex < 4)
                ? (Rva0029E330Door *)((char *)this + 0x2c + doorIndex * 16)
                : 0;
        //
        // if the producing structure has a door opening animation we will set the condition
        // bits to open the door (note that we must also take care to remove any condition
        // that had us previously closing a door)
        //
        if (field<int, 8>(data) > 0 && door) {
          // if the door is closed, open it
          if (!door->opened && !door->waiting && !door->closed) {
            door->opened = now;
            bitSet((unsigned *)((char *)this + 0x94),
                   theOpeningFlags[doorIndex]);
            field<bool, 0xbc>(this) = true;
          // end if
          // if the door is waiting-open, keep it there
          } else if (door->waiting)
            door->waiting = now;
          // end else if
          // if the door is closing, for now, pop it to waiting open
          else if (door->closed) {
            door->waiting = now;
            bitSet((unsigned *)((char *)this + 0x6c),
                   theOpeningFlags[doorIndex]);
            bitSet((unsigned *)((char *)this + 0x6c),
                   theClosingFlags[doorIndex]);
            bitSet((unsigned *)((char *)this + 0x94),
                   theOpeningFlags[doorIndex], false);
            bitSet((unsigned *)((char *)this + 0x94),
                   theClosingFlags[doorIndex], false);
            bitSet((unsigned *)((char *)this + 0x94),
                   theWaitingOpenFlags[doorIndex]);
            field<bool, 0xbc>(this) = true;
          }
          // end else
        }
        // end if, has door animation
        // we now go into the construction complete condition for a while
        if (!field<unsigned, 0x28>(this)) {
          field<unsigned, 0x28>(this) = now;
          field<unsigned, 0x9c>(this) |= 0x200;
          field<bool, 0xbc>(this) = true;
        }
        // end if
        //
        // make a new object, note that for production buildings that have door
        // animations we will not make the object until the door has been totally
        // opened
        //
        if (field<int, 8>(data) != 0 && door && !door->waiting)
          continue;
        void *newObject;
        if (!field<int, 0xc8>(this)) {
          Coord3D position = {0, 0, 0};
          float orientation = 0;
          bool hasPosition = ((Rva0029E330Exit *)exitInterface)
                                 ->position(&position, &orientation);
          _STL::bitset<86> creationFlags;
          if (isRespawn) {
            newObject = invoke<void *>((char *)player(us) + 0x684, j_000076fd,
                                       production->identifier, &position);
            if (!newObject) {
              removeEntry(self, production);
              return UPDATE_SLEEP_NONE;
            }
            int sourceId = field<int, 0x370>(newObject);
            if (sourceId == -1)
              sourceId = field<int, 0x370>(us);
            invoke<void>((void *)TheGameLogic, j_0003a279, newObject, sourceId);
          } else {
            if (production->special)
              creationFlags.set(54);
            newObject = invoke<void *>(
                (void *)TheThingFactory, j_0004494a, production->objectTemplate,
                field<void *, 0x230>(player(us)), &creationFlags, 0u);
            if (!newObject) {
              removeEntry(self, production);
              return UPDATE_SLEEP_NONE;
            }
            invoke<void>(self, j_0001c0b2, newObject);
            if (field<unsigned, 0x34>(data) > 0)
              invoke<void>(newObject, j_0002852e, 0x129,
                           field<int, 0x34>(data));
            field<float, 0x258>(newObject) = (float)production->field28;
            invoke<void>((void *)TheGameLogic, j_0003a279, newObject,
                         field<int, 0x370>(us));
          }
          field<ObjectID, 0xc8>(this) = field<ObjectID, 0x74>(newObject);
          invoke<void>(newObject, j_0000d990, us);
          void *drawable = ((Rva0029E330ObjectV *)newObject)->drawable();
          if (drawable && invoke<int>(newObject, j_0002b81e,
                                      field<int, 0x24>(field<void *, 0xc>(
                                          (void *)ThePlayerList))) >= 3)
            invoke<void>(((Rva0029E330ObjectV *)newObject)->drawable(),
                         j_0000c87e, true);
          if (field<bool, 0x3c>(data) && field<void *, 0x210>(newObject) &&
              field<int, 0x28>(experience) >= 3)
            invoke<void>((void *)TheExperienceLevelSystem, j_0001697d, newObject, 1, false);
          if (experience && !field<bool, 0x30>(data) &&
              invoke<bool>(experience, j_00025eeb)) {
            int value = invoke<int>(production->objectTemplate, j_0000da8a,
                                    (void *)0, -1);
            if (value > 0)
              invoke<void>(experience, j_00010096, (float)value, true, true,
                           true, 0);
          }
          if (hasPosition) {
            void *ai = field<void *, 0x204>(newObject);
            if (ai && ((Rva0029E330AI *)ai)->rva130()) {
              position.z += 500.0f;
              invoke<void>(newObject, j_0001621b, &position, true);
              invoke<void>(newObject, j_000399A5, orientation);
              invoke<void>((char *)ai + 0x20, j_0003436a, &position, 2);
            } else {
              invoke<void>(newObject, j_000399A5, orientation);
              invoke<void>(newObject, j_0001621b, &position, true);
            }
          }
          if (production->field30 != -1) {
            BitFlags<192> mask(BitFlags<192>::kInit, production->field30);
            invoke<void>(newObject, j_00016b67, &mask);
          }
          ((Object *)newObject)->updateUpgradeModules();
          drawable = ((Rva0029E330ObjectV *)newObject)->drawable();
          invoke<void>(drawable, j_0003c772);
          void *newTemplate;
          invoke<void>(drawable, j_0003aa17, true);
          // Now, play the sound associated with the new object's production.
          const AudioEventRTS *creationSound =
              invoke<const AudioEventRTS *>(drawable, j_0001bfd1, 98);
          AudioEventRTS sound = *creationSound;
          sound.setObjectID(field<ObjectID, 0xc8>(this));
          sound.setPlayerIndex(field<int, 0x24>(player(us)));
          ((Rva0029E330Audio *)(void *)TheAudio)->add(&sound);
          // call the onUnitCreated for the player
          invoke<void>(player(us), j_00004f1b, us, newObject);
          // onCreates have been called on newObj, and after that the owner was set,
          // so now is the time to call the game side of CreateModules
          void **modules = field<void **, 0x1f0>(newObject);
          for (; *modules; ++modules) {
            void *b = (char *)*modules + 12;
            void *create = ((Rva0029E330Behavior *)b)->create();
            if (create)
              ((Rva0029E330Create *)create)->onComplete();
          }
          if (production->quantity ==
              production->quantity - production->produced) {
            //Call the voice created for the 1st object -- because it's possible to create multiple objects like redguards!
            _STL::list<Drawable *> selection;
            Drawable *d = (Drawable *)drawable;
            selection.push_back(d);
            pickAndPlayUnitVoiceResponse(&selection, GameMessage::RVA_7DA, 0);
          }
          newTemplate = invoke<void *>(newObject, j_000084b8);
          field<int, 0xc0>(this) =
              (int)(field<float, 0x2f4>(newTemplate) * 5.0f);
          invoke<void>(newObject, j_0002852e, 0xcf, field<int, 0xc0>(this));
          invoke<void>(newObject, j_0002852e, 0x12c, 5);
          ((Object *)newObject)
              ->setDisabledUntil(DISABLED_RVA3, field<unsigned, 0xc0>(this) +
                                                    field<unsigned, 0x3c>(
                                                        (void *)TheGameLogic));
          if (!isRespawn) {
            void *d = ((Rva0029E330ObjectV *)newObject)->drawable();
            if (d) {
              invoke<void>(drawable, j_0001362e, field<int, 0xc0>(this));
              invoke<void>(d, j_0002d439, true);
            }
          }
          AsciiString *begin = field<AsciiString *, 0x2e8>(newTemplate),
                      *end = field<AsciiString *, 0x2ec>(newTemplate);
          if (begin != end) {
            for (AsciiString *p = begin;
                 p != field<AsciiString *, 0x2ec>(newTemplate); ++p) {
              void *t = invoke<void *>((void *)TheThingFactory, j_00028560, p);
              if (!t)
                continue;
              void *extra = invoke<void *>((void *)TheThingFactory, j_0004494a, t,
                                           field<void *, 0x230>(player(us)),
                                           &creationFlags, 0u);
              invoke<void>(self, j_0001c0b2, extra);
              if (((Rva0029E330Exit *)exitInterface)
                      ->position(&position, &orientation)) {
                invoke<void>(extra, j_0003a1a7, &position);
                invoke<void>(extra, j_000399A5, orientation);
              }
              invoke<void>(((Rva0029E330ObjectV *)extra)->drawable(),
                           j_00008337, true);
              setModelBit(extra, 0x128, 0x8000, true);
              invoke<void>(newObject, j_0002852e, 0x12c, 5);
              ObjectID id = field<ObjectID, 0x74>(extra);
              invoke<void>((char *)this + 0xcc, j_0001e00b, &id);
            }
            field<bool, 0xc4>(this) = false;
          }
          void *respawn = invoke<void *>(newObject, j_0002ae23, respawnKey);
          if (isRespawn && respawn) {
            invoke<void>(respawn, j_00049fb2, us);
            field<int, 0xd0>(this) = 20;
            invoke<void>(newObject, j_0003acb0,
                         field<unsigned, 0x3c>((void *)TheGameLogic) + 20);
          }
        } else {
          newObject = invoke<void *>((void *)TheGameLogic, j_0001f253,
                                     field<int, 0xc8>(this));
          if (!newObject) {
            removeEntry(self, production);
            return UPDATE_SLEEP_NONE;
          }
        }
        // end if, door open or no door animation ... make the object
        void *contain = field<void *, 0x1fc>(newObject);
        if (contain) {
          void *rebuild = ((Rva0029E330Contain *)contain)->rva68();
          if (rebuild) {
            void *t;
            {
              AsciiString name = ((Rva0029E330Rebuild *)rebuild)->name();
              t = invoke<void *>((void *)TheThingFactory, j_00028560, &name);
            }
            int quantity = ((Rva0029E330Rebuild *)rebuild)->count();
            if (t) {
              production->objectTemplate = t;
              production->quantity = quantity + 1;
              production->special = true;
              production->field28 = 0;
            }
          }
        }
        if (!field<bool, 0xc4>(this)) {
          float duration = field<float, 0x2f4>(finalTemplate(field<void *, -8>(this)));
          Rva0029E330ListNode *head = field<Rva0029E330ListNode *, 0xcc>(this);
          if (head->next != head)
            for (Rva0029E330ListNode *n = head->next;
                 n != field<Rva0029E330ListNode *, 0xcc>(this); n = n->next) {
              void *extra =
                  invoke<void *>((void *)TheGameLogic, j_0001f253, n->id);
              if (extra) {
                invoke<void>(((Rva0029E330ObjectV *)extra)->drawable(),
                             j_00008337, false);
                void *d = ((Rva0029E330ObjectV *)extra)->drawable();
                invoke<void>(d, j_0003c772);
                int frames = (int)(duration * 30.0f);
                invoke<void>(((Rva0029E330ObjectV *)extra)->drawable(),
                             j_00046a1f, frames);
              }
            }
          field<bool, 0xc4>(this) = true;
        }
        if (field<unsigned, 0xc0>(this)) {
          --field<unsigned, 0xc0>(this);
          return UPDATE_SLEEP_NONE;
        }
        setModelBit(newObject, 0x128, 0x8000, false);
        if (field<unsigned, 0x38>(data) > 0)
          invoke<void>(newObject, j_0002852e, 0x5e, field<int, 0x38>(data));
        if (field<unsigned, 0x128>(newObject) & 0x8000)
          invoke<bool>(newObject, j_0003c06a, 3);
        field<int, 0xc8>(this) = 0;
        // call the exit interface to do the rally point and position stuff
        if (!invoke<void *>(newObject, j_0002ae23, respawnKey))
          ((Rva0029E330Exit *)exitInterface)->exit(newObject, doorIndex);
        //We created one guy, but we may want to do more so we should stay in this node of production.
        // This is last so the voice check can easily check for "first" guy
        ++production->produced;
        // since we successfully exited via this door, we should NOT call unreserveDoorForExit
        // when we toss this production entry. so set it back to an innocuous value.
        production->door = -1;
        if (production->quantity == production->produced) {
          void *producer = invoke<void *>((void *)TheGameLogic, j_0001f253,
                                          field<ObjectID, 0x78>(newObject));
          if (producer && field<void *, 0x1fc>(producer)) {
            void *c = field<void *, 0x1fc>(producer);
            if (((Rva0029E330Contain *)c)->rva64()) {
              _STL::list<Drawable *> selection;
              Drawable *d =
                  (Drawable *)((Rva0029E330ObjectV *)producer)->drawable();
              selection.push_back(d);
              pickAndPlayUnitVoiceResponse(&selection, GameMessage::RVA_7E2, 0);
            }
          }
        }
        // end, if we got a door reservation
      }
      //end of trying to exit all the things we were planning on attempting
      if (production->quantity == production->produced) {
        // remove this production entry so we can go on to the next if we are totally finished
        // delete the production entry
        removeEntry(self, production);
        ((Rva0029E330Exit *)exitInterface)->complete();
      }
      // end if we found an exit interface

    } else
      // there is no exit interface, this is an error
      // remove this item from the production queue
      // delete the production entry
      removeEntry(self, production);
      // end else
    break;
  }
  // end if, production unit
  case 2: {

    void *upgrade = production->upgrade;
    if (experience && !field<bool, 0x30>(data) &&
        invoke<bool>(experience, j_00025eeb)) {
      int value = invoke<int>(upgrade, j_0003f8d7, (void *)0, (void *)0);
      if (value > 0)
        invoke<void>(experience, j_00010096, (float)value, true, true, true, 0);
    }
    // we finished an upgrade, lets add that money spent on it to the scorekeeper
    invoke<void>((char *)owner + 0x348, j_00047ec9,
                 invoke<int>(upgrade, j_0003f8d7, owner, (void *)0));
    // notify the script engine
    ((Rva0029E330Script *)(void *)TheScriptEngine)
        ->notify(field<int, 0x24>(player(us)), field<AsciiString, 8>(upgrade),
                 field<ObjectID, 0x74>(us));
    // print a message to the local player, if it wants one
    if (invoke<bool>(us, j_0001ff91)) {
      UnicodeString msg;
      UnicodeString format = ((Rva0029E330GameText *)(void *)TheGameText)
                                 ->fetch("UPGRADE:UpgradeComplete", 0);
      UnicodeString name =
          ((Rva0029E330GameText *)(void *)TheGameText)
              ->fetch(
                  ((const StringBase<char> &)field<AsciiString, 0x10>(upgrade))
                      .str(),
                  0);
      msg.format(UnicodeString(format.str()), name.str());
      ((Rva0029E330UI *)(void *)TheInGameUI)->message(msg);
      // upgrades are a more rare event, play a nifty radar event thingie
      ((Radar *)(void *)TheRadar)
          ->createEvent((Coord3D *)((char *)us + 0x38), RADAR_EVENT_RVA2, 4.0f);
      //Play the sound for the upgrade, because we just built it!
      AudioEventRTS sound = field<AudioEventRTS, 0x28>(upgrade);
      if (((Rva0029E330Audio *)(void *)TheAudio)->valid(&sound)) {
        //We have a custom upgrade complete sound.
        sound.setObjectID(field<ObjectID, 0x74>(us));
        ((Rva0029E330Audio *)(void *)TheAudio)->add(&sound);
      } else
        //Use a generic EVA event.
        invoke<bool>((void *)TheEva, j_0002b5f3, 6, (Coord3D *)0);
      //Play any available unit specific sound for upgrade.
      sound.assign(field<AudioEventRTS, 0x98>(upgrade));
      sound.setObjectID(field<ObjectID, 0x74>(us));
      ((Rva0029E330Audio *)(void *)TheAudio)->add(&sound);
    }
    // end if
    if (!((const StringBase<char> &)(((Rva0029C410Value *)upgrade)->*value<AsciiString (Rva0029C410Value::*)()>(dup_0029c410))())
             .isEmpty()) {
      void *fx = invoke<void *>(
          (void *)TheFXListStore, j_0001669e,
          ((const StringBase<char> &)(((Rva0029C410Value *)upgrade)->*value<AsciiString (Rva0029C410Value::*)()>(dup_0029c410))())
              .str());
      if (fx) {
        typedef void(__cdecl * F)(void *, void *, void *);
        ((F)j_0001253f)(fx, us, 0);
      }
    }
    // update the upgrade status in the player or give the upgrade to the object
    if (field<int, 4>(upgrade) == 0)
      ((Player *)owner)
          ->addUpgrade((UpgradeTemplate *)upgrade, UPGRADE_STATUS_RVA2);
    else
      invoke<void>(us, j_0001a97e, upgrade);
    //Also mark the UI dirty -- incase object with upgrade cameo is selected.
    void *selected = ((Rva0029E330Selected *)(void *)TheInGameUI)->selected();
    void *selectedObject = selected ? field<void *, 0xfc>(selected) : 0;
    if (selectedObject) {
      void *t = invoke<void *>(selectedObject, j_000084b8);
      for (int i = 0; i < 5; ++i) {
        AsciiString name = ((Rva0029C440Value *)t)->value(i);
        if (invoke<void *>((void *)TheUpgradeCenter, j_0002F95A, &name) ==
            upgrade) {
          //Our selected object has the upgrade
          field<bool, 0x24>((void *)TheControlBar) = true;
          break;
        }
      }
    }
    // remove this production entry so we can go on to the next
    // delete the production entry
    removeEntry(self, production);
    field<int, 0xc8>(this) = 0;
    return UPDATE_SLEEP_NONE;
  }
  // end else, production upgrade
  }
  // end if, production is 100% complete
  return UPDATE_SLEEP_NONE;
}
// end update
