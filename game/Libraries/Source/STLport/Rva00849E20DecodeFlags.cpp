// cl: /GX- /MD /D_STLP_USE_STATIC_LIB
// ?rva00849E20DecodeFlags@@YAII@Z

// The CRT access mode in the low two bits must be 0, 1 or 2.
// Open BFME 2 Code/Libraries/Source/WWVegas/WWLib/stlport_filebuf_open.cpp.
unsigned int rva00849E20DecodeFlags(unsigned int p)
{
    unsigned int result;
    switch (p & 3) {
    case 0: result = 8; break;
    case 1: result = 16; break;
    case 2: result = 24; break;
    }
    if (p & 8) result |= 1;
    if (p & 0x8000) result |= 4;
    return result;
}
