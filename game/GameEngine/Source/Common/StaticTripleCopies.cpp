// cl: /O2 /MD

struct RvaTriple
{
    unsigned first;
    unsigned second;
    unsigned third;
};

// The first six 12-byte views belong to these existing 96-byte data rows.
extern int g_bfmeTableSrcBQ[24]; // VA012B5040
extern int g_bfmeTableDstBQ[24]; // VA012B50A0

extern RvaTriple bfmeRva012B5134Source;
extern RvaTriple bfmeRva012B5140FirstCopy;
extern RvaTriple bfmeRva012B5128SecondCopy;
extern RvaTriple bfmeRva012B518CSource;
extern RvaTriple bfmeRva012B5198FirstCopy;
extern RvaTriple bfmeRva012B5180SecondCopy;

void bfmeRva00C6B500CopyTripleTwice()
{
    unsigned first = g_bfmeTableSrcBQ[13];
    unsigned second = g_bfmeTableSrcBQ[14];
    unsigned third = g_bfmeTableSrcBQ[15];
    g_bfmeTableSrcBQ[16] = first;
    g_bfmeTableSrcBQ[17] = second;
    g_bfmeTableSrcBQ[18] = third;
    g_bfmeTableSrcBQ[10] = first;
    g_bfmeTableSrcBQ[11] = second;
    g_bfmeTableSrcBQ[12] = third;
}

void bfmeRva00C6B550CopyTripleTwice()
{
    unsigned first = g_bfmeTableDstBQ[13];
    unsigned second = g_bfmeTableDstBQ[14];
    unsigned third = g_bfmeTableDstBQ[15];
    g_bfmeTableDstBQ[16] = first;
    g_bfmeTableDstBQ[17] = second;
    g_bfmeTableDstBQ[18] = third;
    g_bfmeTableDstBQ[10] = first;
    g_bfmeTableDstBQ[11] = second;
    g_bfmeTableDstBQ[12] = third;
}

void bfmeRva00C6B5A0CopyTripleTwice()
{
    unsigned first = bfmeRva012B5134Source.first;
    unsigned second = bfmeRva012B5134Source.second;
    unsigned third = bfmeRva012B5134Source.third;
    bfmeRva012B5140FirstCopy.first = first;
    bfmeRva012B5140FirstCopy.second = second;
    bfmeRva012B5140FirstCopy.third = third;
    bfmeRva012B5128SecondCopy.first = first;
    bfmeRva012B5128SecondCopy.second = second;
    bfmeRva012B5128SecondCopy.third = third;
}

void bfmeRva00C6B5F0CopyTripleTwice()
{
    unsigned first = bfmeRva012B518CSource.first;
    unsigned second = bfmeRva012B518CSource.second;
    unsigned third = bfmeRva012B518CSource.third;
    bfmeRva012B5198FirstCopy.first = first;
    bfmeRva012B5198FirstCopy.second = second;
    bfmeRva012B5198FirstCopy.third = third;
    bfmeRva012B5180SecondCopy.first = first;
    bfmeRva012B5180SecondCopy.second = second;
    bfmeRva012B5180SecondCopy.third = third;
}
