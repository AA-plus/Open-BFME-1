// ?update@Rva006E8310TransitionState@@QAEXXZ
// partial score=0.7459 date=2026-10-13
// ?d_006e8310@@YAXXZ
// Scratch extern data names are UNBOUND; no new retail bindings are claimed.
// Three RGB aggregate lifetimes and interpolation operands follow retail disassembly.
// ?update@Rva006E8310TransitionState@@QAEXXZ
// cl: /DNDEBUG /MD /EHsc

typedef float Real;

struct Rva006E8310Rgb
{
	Real red;
	Real green;
	Real blue;
};

struct Rva006E8310TerrainLighting
{
	Rva006E8310Rgb ambient;
	Rva006E8310Rgb diffuse;
	Rva006E8310Rgb lightPos;
};

class Rva006E8310GlobalDataLayout
{
public:
	unsigned char pad000[0x218];
	int timeOfDay;
	unsigned char pad21c[0x224 - 0x21c];
	Rva006E8310TerrainLighting terrain[18];
	Rva006E8310TerrainLighting objects[18];
	Rva006E8310TerrainLighting active[18];
	unsigned char pad9bc[0x9e0 - 0x9bc];
	Rva006E8310Rgb current[3];
};

class Rva006E8310GameClient
{
public:
	virtual void slot00(); virtual void slot01(); virtual void slot02();
	virtual void slot03(); virtual void slot04(); virtual void slot05();
	virtual void slot06(); virtual void slot07(); virtual void slot08();
	virtual void slot09(); virtual void slot0a(); virtual void slot0b();
	virtual void slot0c(); virtual void slot0d(); virtual void slot0e();
	virtual void slot0f(); virtual void slot10(); virtual void slot11();
	virtual void slot12(); virtual void slot13(); virtual void slot14();
	virtual void slot15(); virtual void slot16(); virtual void slot17();
	virtual void slot18(); virtual void slot19();
	virtual int getFrame();
};

class Rva006E8310Display
{
public:
	virtual void slot00(); virtual void slot01(); virtual void slot02();
	virtual void slot03(); virtual void slot04(); virtual void slot05();
	virtual void slot06(); virtual void slot07(); virtual void slot08();
	virtual void slot09(); virtual void slot0a(); virtual void slot0b();
	virtual void slot0c(); virtual void slot0d(); virtual void slot0e();
	virtual void slot0f(); virtual void slot10(); virtual void slot11();
	virtual void slot12(); virtual void slot13(); virtual void slot14();
	virtual void slot15(); virtual void slot16(); virtual void slot17();
	virtual void slot18(); virtual void slot19(); virtual void slot1a();
	virtual void slot1b(); virtual void slot1c(); virtual void slot1d();
	virtual void slot1e(); virtual void slot1f(); virtual void slot20();
	virtual void slot21(); virtual void slot22(); virtual void slot23();
	virtual void slot24(); virtual void slot25(); virtual void slot26();
	virtual void slot27();
	virtual void setLighting(int channel, Real red, Real green, Real blue);
	virtual void setObjectLighting(int channel, Real red, Real green, Real blue);
};

class Rva006C8E00Dispatch
{
public:
	void invoke(int value);
};

class Rva006E8310TransitionState
{
public:
	void update();

	int mode;
	int startFrame;
	Real duration;
	Real red;
	Real green;
	Real blue;
};

extern Rva006E8310GameClient *TheGameClient;
extern Rva006E8310Display *TheDisplay;
extern Rva006E8310GlobalDataLayout *Rva006E8310GlobalDataPtr;
extern Rva006C8E00Dispatch *TheTerrainRenderObject;
extern const Real Rva006E8310Zero;
extern const Real g_bfmeDefaultBU;
extern const Real Rva006E8310Uint32Scale;
extern const Real Rva006E8310FrameScale;

static Rva006E8310TerrainLighting *lightingAt(unsigned char *base,
	int timeOfDay, unsigned int offset)
{
	return reinterpret_cast<Rva006E8310TerrainLighting *>(
		base + offset + static_cast<unsigned int>(timeOfDay) * 0x6c);
}

void Rva006E8310TransitionState::update()
{
	if (duration != Rva006E8310Zero)
	{

	unsigned int elapsed = TheGameClient->getFrame() - startFrame;
	Real fraction = static_cast<Real>(elapsed);
	fraction *= Rva006E8310FrameScale;
	fraction /= duration;
	if (fraction >= g_bfmeDefaultBU)
	{
		duration = Rva006E8310Zero;
		return;
	}

	Real from = g_bfmeDefaultBU - fraction;
	Real to = fraction;
	if (mode == 1)
	{
		Real swap = from;
		from = to;
		to = swap;
	}

	unsigned char *global = reinterpret_cast<unsigned char *>(Rva006E8310GlobalDataPtr);
	int timeOfDay = *reinterpret_cast<int *>(global + 0x218);
	Rva006E8310TerrainLighting *terrain = lightingAt(global, timeOfDay, 0x224);
	Rva006E8310TerrainLighting *objects = lightingAt(global, timeOfDay, 0x4ac);
	Rva006E8310TerrainLighting *active = lightingAt(global, timeOfDay, 0x734);

	Rva006E8310Rgb *current = reinterpret_cast<Rva006E8310Rgb *>(global + 0x9e0);
	for (int i = 0; i < 3; ++i)
	{
		const Rva006E8310TerrainLighting &a = terrain[i];
		const Rva006E8310TerrainLighting &b = objects[i];
		const Rva006E8310TerrainLighting &c = active[i];
		Rva006E8310Rgb color = { from * a.diffuse.red + to * red,
            from * a.diffuse.green + to * green, from * a.diffuse.blue + to * blue };
        Rva006E8310Rgb objectColor = { from * b.diffuse.red + to * red,
            from * b.diffuse.green + to * green, from * b.diffuse.blue + to * blue };
        Rva006E8310Rgb activeColor = { from * c.diffuse.red + to * red,
            from * c.diffuse.green + to * green, from * c.diffuse.blue + to * blue };
        TheDisplay->setLighting(i, objectColor.red, objectColor.green, objectColor.blue);
        TheDisplay->setObjectLighting(i, activeColor.red, activeColor.green, activeColor.blue);
        Rva006E8310GlobalDataPtr->current[i] = color;
	}

	if (TheTerrainRenderObject != 0)
		TheTerrainRenderObject->invoke(timeOfDay);
	}
}
