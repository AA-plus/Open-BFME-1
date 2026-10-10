// cl: /DNDEBUG /MD /EHsc /Igame/Libraries/Source/WWVegas/WWLib

#include "ascii_string.h"

class Image;

// retail: the global is a plain ImageCollection* (dir32 0x012F6924); the
// collection class is named ImageCollection, not MappedImageCollection.
class ImageCollection
{
public:
	const Image *findImageByName( const AsciiString &name );
};

extern ImageCollection *TheMappedImageCollection;

extern "C" __declspec( dllimport ) int __cdecl sprintf(
	char *buffer, const char *format, ... );

int __cdecl Rva0046F910( int rank, AsciiString *side )
{
	char imageNameBuffer[ 256 ];
	int image;

	sprintf( imageNameBuffer, "AptRankIcon%s%d", side->StringBase<char>::str(), rank );
	{
		AsciiString imageName( imageNameBuffer );
		image = (int)TheMappedImageCollection->findImageByName( imageName );
	}
	if ( image != 0 )
		return image;

	sprintf( imageNameBuffer, "AptRankIcon%d", rank );
	{
		AsciiString fallbackImageName( imageNameBuffer );
		return (int)TheMappedImageCollection->findImageByName( fallbackImageName );
	}
}
