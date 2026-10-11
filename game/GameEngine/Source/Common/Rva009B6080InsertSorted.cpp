// cl: /O2 /G6 /DNDEBUG /MD
struct Rva009B6080Record { int next; int weight; unsigned char at08[4]; };
// ?Rva009B6080InsertSorted@@YAXPAURva009B6080Record@@HPAH@Z
// Open BFME 2: Code/Libraries/Source/VP6/Rva001C6980InsertSorted.cpp.
static void Rva009B6080InsertSorted(Rva009B6080Record *list, int index, int *head)
{
	int prev = *head;
	int cur = *head;
	while (cur != -1) {
		if (list[index].weight <= list[cur].weight)
			break;
		prev = cur;
		cur = list[cur].next;
	}
	if (cur == *head) {
		*head = index;
		list[index].next = cur;
	} else {
		list[prev].next = index;
		list[index].next = cur;
	}
}
// ?Rva009B6080Integration@@YAXPAURva009B6080Record@@HPAH@Z absent-from-retail
// Open BFME 2: Code/Libraries/Source/VP6/Rva001C6980InsertSorted.cpp.
void Rva009B6080Integration(Rva009B6080Record *list, int index, int *head) { Rva009B6080InsertSorted(list, index, head); }
