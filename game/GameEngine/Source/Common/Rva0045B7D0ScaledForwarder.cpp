// cl: /DNDEBUG /MD /EHsc
// Open-BFME: clean C++ reconstruction of retail 0x0045B7D0 (25 bytes).
// The body scales its float argument by the pinned global at 0x01075954 and
// forwards it through the owning object's virtual slot at byte offset 0x214.
// The retail call shape and the matching BFME virtual slot establish this
// address-derived owner while the binary exposes no stable public class name.

// Shared float at VA 0x01075954: retail .rdata holds 35 fa 8e 3c.
// The fmul dword below and the other matched callers prove its four-byte
// size. No EA symbol is proven, so the canonical name retains the address.
extern const float g_01075954 = 0.01745329238474369049072265625f;

class Rva0045B7D0Base
{
public:
	virtual void slot000(void);
	virtual void slot001(void);
	virtual void slot002(void);
	virtual void slot003(void);
	virtual void slot004(void);
	virtual void slot005(void);
	virtual void slot006(void);
	virtual void slot007(void);
	virtual void slot008(void);
	virtual void slot009(void);
	virtual void slot010(void);
	virtual void slot011(void);
	virtual void slot012(void);
	virtual void slot013(void);
	virtual void slot014(void);
	virtual void slot015(void);
	virtual void slot016(void);
	virtual void slot017(void);
	virtual void slot018(void);
	virtual void slot019(void);
	virtual void slot020(void);
	virtual void slot021(void);
	virtual void slot022(void);
	virtual void slot023(void);
	virtual void slot024(void);
	virtual void slot025(void);
	virtual void slot026(void);
	virtual void slot027(void);
	virtual void slot028(void);
	virtual void slot029(void);
	virtual void slot030(void);
	virtual void slot031(void);
	virtual void slot032(void);
	virtual void slot033(void);
	virtual void slot034(void);
	virtual void slot035(void);
	virtual void slot036(void);
	virtual void slot037(void);
	virtual void slot038(void);
	virtual void slot039(void);
	virtual void slot040(void);
	virtual void slot041(void);
	virtual void slot042(void);
	virtual void slot043(void);
	virtual void slot044(void);
	virtual void slot045(void);
	virtual void slot046(void);
	virtual void slot047(void);
	virtual void slot048(void);
	virtual void slot049(void);
	virtual void slot050(void);
	virtual void slot051(void);
	virtual void slot052(void);
	virtual void slot053(void);
	virtual void slot054(void);
	virtual void slot055(void);
	virtual void slot056(void);
	virtual void slot057(void);
	virtual void slot058(void);
	virtual void slot059(void);
	virtual void slot060(void);
	virtual void slot061(void);
	virtual void slot062(void);
	virtual void slot063(void);
	virtual void slot064(void);
	virtual void slot065(void);
	virtual void slot066(void);
	virtual void slot067(void);
	virtual void slot068(void);
	virtual void slot069(void);
	virtual void slot070(void);
	virtual void slot071(void);
	virtual void slot072(void);
	virtual void slot073(void);
	virtual void slot074(void);
	virtual void slot075(void);
	virtual void slot076(void);
	virtual void slot077(void);
	virtual void slot078(void);
	virtual void slot079(void);
	virtual void slot080(void);
	virtual void slot081(void);
	virtual void slot082(void);
	virtual void slot083(void);
	virtual void slot084(void);
	virtual void slot085(void);
	virtual void slot086(void);
	virtual void slot087(void);
	virtual void slot088(void);
	virtual void slot089(void);
	virtual void slot090(void);
	virtual void slot091(void);
	virtual void slot092(void);
	virtual void slot093(void);
	virtual void slot094(void);
	virtual void slot095(void);
	virtual void slot096(void);
	virtual void slot097(void);
	virtual void slot098(void);
	virtual void slot099(void);
	virtual void slot100(void);
	virtual void slot101(void);
	virtual void slot102(void);
	virtual void slot103(void);
	virtual void slot104(void);
	virtual void slot105(void);
	virtual void slot106(void);
	virtual void slot107(void);
	virtual void slot108(void);
	virtual void slot109(void);
	virtual void slot110(void);
	virtual void slot111(void);
	virtual void slot112(void);
	virtual void slot113(void);
	virtual void slot114(void);
	virtual void slot115(void);
	virtual void slot116(void);
	virtual void slot117(void);
	virtual void slot118(void);
	virtual void slot119(void);
	virtual void slot120(void);
	virtual void slot121(void);
	virtual void slot122(void);
	virtual void slot123(void);
	virtual void slot124(void);
	virtual void slot125(void);
	virtual void slot126(void);
	virtual void slot127(void);
	virtual void slot128(void);
	virtual void slot129(void);
	virtual void slot130(void);
	virtual void slot131(void);
	virtual void slot132(void);
	virtual void slot133(float value);	// +0x214

	void bfmeGoB7D0(float value);
};

void Rva0045B7D0Base::bfmeGoB7D0(float value)
{
	slot133(value * g_01075954);
}
