// cl: /O2 /G6 /DNDEBUG /MD
struct Rva009AD750Context
{
	unsigned char m_pad00[0x24];
	unsigned int *m_tableIndex;
	int *m_variance;
	unsigned char m_pad2c[0x38 - 0x2c];
	int *m_bounding;
};

extern unsigned char g_bfmeClampTable[];

// Ported from Open BFME 2 Code/Libraries/Source/VP6/DeblockVerticalEdges.cpp.
// ?Rva009AD750Filter@@YAXPAURva009AD750Context@@PAE1IIHPBI@Z
void __cdecl Rva009AD750Filter(Rva009AD750Context *ctx,
	unsigned char *source, unsigned char *destination, unsigned int stride,
	unsigned int count, int first, const unsigned int *limits)
{
	unsigned int index;
	int samples[10];
	int sumLeft, sumRight, varianceLeft, varianceRight, rolling;
	int limit, varianceLimit, filter;
	unsigned char *rowInput, *rowOutput;
	for (index = first; index < first + count - 1; ++index) {
		limit = limits[ctx->m_tableIndex[index + 1]];
		rowInput = source + 8 * (index - first + 1);
		varianceLimit = (limit * limit * 3) >> 5;
		rowOutput = destination + 8 * (index - first + 1);
		for (unsigned int row = 0; row < 8; ++row) {
			samples[1] = rowInput[-4];
			samples[2] = rowInput[-3];
			samples[3] = rowInput[-2];
			samples[4] = rowInput[-1];
			samples[5] = rowInput[0];
			samples[6] = rowInput[1];
			samples[7] = rowInput[2];
			samples[8] = rowInput[3];
			sumLeft = sumRight = varianceLeft = varianceRight = 0;
			for (unsigned int k = 1; k <= 4; ++k) {
				sumLeft += samples[k];
				varianceLeft += samples[k] * samples[k];
				sumRight += samples[k + 4];
				varianceRight += samples[k + 4] * samples[k + 4];
			}
			varianceLeft -= ((sumLeft + 1) >> 1) * (sumLeft >> 1);
			varianceRight -= ((sumRight + 1) >> 1) * (sumRight >> 1);
			ctx->m_variance[index] += varianceLeft;
			ctx->m_variance[index + 1] += varianceRight;
			if (varianceLeft < varianceLimit && varianceRight < varianceLimit && samples[5] - samples[4] < limit && samples[4] - samples[5] < limit) {
				int left;
				if (((rowInput[-4] - rowInput[-5]) > 0 ? (rowInput[-4] - rowInput[-5]) : (rowInput[-5] - rowInput[-4])) < limit) left = rowInput[-5];
				else left = rowInput[-4];
				int right;
				if (((rowInput[3] - rowInput[4]) > 0 ? (rowInput[3] - rowInput[4]) : (rowInput[4] - rowInput[3])) < limit) right = rowInput[4];
				else right = rowInput[3];
				rolling = samples[4] + 3*left + samples[3] + samples[2] + 4 + samples[1];
				rowOutput[-4] = (unsigned char)(((rolling+samples[1])*2-samples[4]+samples[5])>>4);
				rolling += samples[5]-left;
				rowOutput[-3] = (unsigned char)(((rolling+samples[2])*2-samples[5]+samples[6])>>4);
				rolling += samples[6]-left;
				rowOutput[-2] = (unsigned char)(((rolling+samples[3])*2-samples[6]+samples[7])>>4);
				rolling += samples[7]-left;
				rowOutput[-1] = (unsigned char)(((rolling+samples[4])*2-samples[7]-samples[1]+left+samples[8])>>4);
				rolling += samples[8]-samples[1];
				rowOutput[0] = (unsigned char)(((rolling+samples[5])*2-samples[8]-samples[2]+right+samples[1])>>4);
				rolling += right-samples[2];
				rowOutput[1] = (unsigned char)(((rolling+samples[6])*2-samples[3]+samples[2])>>4);
				rolling += right-samples[3];
				rowOutput[2] = (unsigned char)(((rolling+samples[7])*2-samples[4]+samples[3])>>4);
				rowOutput[3] = (unsigned char)(((rolling+right+samples[8])*2-samples[5] - samples[4])>>4);
			} else {
				filter = ctx->m_bounding[(samples[3] - samples[6] + 3 * (samples[5] - samples[4]) + 4) >> 3];
				rowOutput[-1] = g_bfmeClampTable[samples[4] + filter + 256];
				rowOutput[0] = g_bfmeClampTable[samples[5] - filter + 256];
			}
			rowInput += stride;
			rowOutput += stride;
		}
	}
}
