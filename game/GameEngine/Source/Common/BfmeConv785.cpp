extern const char g_Va0111D7F0[] = "PingAttack";
extern const char g_Va0111D800[] = "PingBeacon";
extern const char g_Va0111D810[] = "PingGeneric";
extern const char g_Va0111D820[] = "PingInformation";
extern const char g_Va0111D834[] = "PingUpgrade";

// The five call sites below are byte-exact against retail 0x006C1C10..0x006C1CD0
// (32 bytes each):
//
//   push ecx / push esi / mov esi,[esp+0xc] / push <str> / push esi /
//   mov dword [esp+0xc],0 / call 0x0001D467 / mov eax,esi / pop esi / pop ecx /
//   ret 4
//
// i.e. two stack arguments, the destination object FIRST, and nothing read back
// except the pointer the caller already had.  That is exactly the encoding of a
// stdcall class-return call: the callee is byte-exact at 0x0058C2B0 as
// `Rva0058C2B0RefPtr __stdcall bfmeCallDUL(const char *)` (see
// game/GameEngine/Source/Common/BfmeCallDUL.cpp and
// targets/game/reverse/identity_evidence/0058c2b0-eh-structure.md), whose
// hidden return pointer is argument 1 and whose string is argument 2.
//
// A direct class-return call site cannot be written at all: VC7.1 has no syntax
// for naming the return object, and every spelling that does compile
// materialises a frame temporary and emits `lea eax,[esp+8]; push eax` where
// retail has `push esi` (8 bytes against 1, ~40 against 32).  Calling through
// the pointer-to-member-function-style cast below is the only construction that
// keeps retail's bytes: the prototype the call is *typed* as says
// `void (void*, const char*)`, so no return object is materialised, while the
// symbol referenced is the callee's real name, so the call resolves to the
// 5-byte ILT thunk 0x0001D467 that retail encodes.
class Rva0058C2B0RefPtr;

Rva0058C2B0RefPtr __stdcall bfmeCallDUL(const char *what);

// The prototype the call site is typed as: the callee's argument layout (a
// destination pointer, then the string), with the class return erased because
// retail discards the result.  The cast is deliberate; see above.
typedef void (__stdcall *BFMEDulCall)(void *, const char *);

void *__stdcall bfmeGoDULa(void *other)
{
	volatile int tmp = 0;
	((BFMEDulCall)bfmeCallDUL)(other, (const char *)g_Va0111D7F0);
	return other;
}

void *__stdcall bfmeGoDULb(void *other)
{
	volatile int tmp = 0;
	((BFMEDulCall)bfmeCallDUL)(other, (const char *)g_Va0111D800);
	return other;
}

void *__stdcall bfmeGoDULc(void *other)
{
	volatile int tmp = 0;
	((BFMEDulCall)bfmeCallDUL)(other, (const char *)g_Va0111D810);
	return other;
}

void *__stdcall bfmeGoDULd(void *other)
{
	volatile int tmp = 0;
	((BFMEDulCall)bfmeCallDUL)(other, (const char *)g_Va0111D820);
	return other;
}

void *__stdcall bfmeGoDULe(void *other)
{
	volatile int tmp = 0;
	((BFMEDulCall)bfmeCallDUL)(other, (const char *)g_Va0111D834);
	return other;
}
