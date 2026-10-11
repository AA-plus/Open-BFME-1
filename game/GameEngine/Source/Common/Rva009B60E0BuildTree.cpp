// cl: /O2 /G6 /DNDEBUG /MD
struct Vp6PackedChild { unsigned leaf : 1; unsigned index : 7; };
struct Vp6BuildOutput { Vp6PackedChild left; Vp6PackedChild right; unsigned char probability; };
struct Vp6BuildEntry { int next; int weight; Vp6PackedChild child; };
struct Rva009B60E0Sort {
	// ?Insert@Rva009B60E0Sort@@SAXPAUVp6BuildEntry@@HPAH@Z absent-from-retail
	// Open BFME 2: Code/Libraries/Source/VP6/BuildHuffTree.cpp.
	static void Insert(Vp6BuildEntry *entries, int index, int *head)
	{
		int cursor = *head;
		int previous = *head;
		while (cursor != -1) {
			if (entries[index].weight <= entries[cursor].weight)
				break;
			previous = cursor;
			cursor = entries[cursor].next;
		}
		if (cursor == *head) {
			*head = index;
			entries[index].next = cursor;
		} else {
			entries[previous].next = index;
			entries[index].next = cursor;
		}
	}
};
// ?Rva009B60E0BuildTree@@YAXPAI0H@Z
// Open BFME 2: Code/Libraries/Source/VP6/BuildHuffTree.cpp.
void Rva009B60E0BuildTree(unsigned *nodeArray, unsigned *frequencies, int count)
{
	Vp6BuildEntry entries[64];
	Vp6BuildOutput *out = (Vp6BuildOutput *)nodeArray;
	int head = 0;
	int root = count - 1;
	int i;
	int next;
	for (i = 0; i < count; i++) {
		entries[i].child.index = i;
		entries[i].child.leaf = 1;
		if (frequencies[i] == 0)
			frequencies[i] = 1;
		entries[i].weight = frequencies[i];
		entries[i].next = -1;
	}
	next = count;
	for (i = 1; i < count; i++)
		Rva009B60E0Sort::Insert(entries, i, &head);
	while (entries[head].next != -1) {
		int second = entries[head].next;
		int sum = entries[head].weight + entries[second].weight;
		root--;
		out[root].left = entries[head].child;
		out[root].right = entries[second].child;
		out[root].probability = (unsigned char)((entries[head].weight << 8) / sum);
		entries[next].weight = sum;
		entries[next].next = -1;
		entries[next].child.index = root;
		entries[next].child.leaf = 0;
		head = entries[second].next;
		Rva009B60E0Sort::Insert(entries, next, &head);
		next++;
	}
}
