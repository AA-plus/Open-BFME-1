// cl: /O2

// The exact constructor at 0x006D68A0 identifies this 30-byte scalar-deleting destructor.
// The default constructor is declared, not defined: its retail body (0x006D68A0,
// RefCountClass base) lives in TileData.cpp. The inline int overload only makes this
// TU emit the vtable and its scalar-deleting destructor.
class TileData
{
public:
	TileData();
	TileData(int) {}
	virtual ~TileData();
};

void forceTileDataDeletingDestructor()
{
	TileData value(0);
}
