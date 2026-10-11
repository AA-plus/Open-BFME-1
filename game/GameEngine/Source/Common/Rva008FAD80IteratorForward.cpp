struct Gen_t_008fb410_p16pod;
struct Gen_t_008fb410_p16pod_iter_base
{
    Gen_t_008fb410_p16pod *_M_cur;
    Gen_t_008fb410_p16pod *_M_first;
    Gen_t_008fb410_p16pod *_M_last;
    Gen_t_008fb410_p16pod **_M_node;
};
struct Gen_t_008fb410_p16pod_iter : Gen_t_008fb410_p16pod_iter_base
{
    Gen_t_008fb410_p16pod_iter(const Gen_t_008fb410_p16pod_iter &x)
        : Gen_t_008fb410_p16pod_iter_base(x) {}
};

extern "C" {
inline __declspec(noinline) void __cdecl tg_008fa480(Gen_t_008fb410_p16pod_iter first, Gen_t_008fb410_p16pod_iter last, const char &tag)
{
    for (; first._M_cur != last._M_cur;) {
        first._M_cur = reinterpret_cast<Gen_t_008fb410_p16pod *>(reinterpret_cast<char *>(first._M_cur) + 8);
        if (first._M_cur == first._M_last) {
            ++first._M_node;
            first._M_first = *first._M_node;
            first._M_last = reinterpret_cast<Gen_t_008fb410_p16pod *>(reinterpret_cast<char *>(first._M_first) + 128);
            first._M_cur = first._M_first;
        }
    }
}
}

// ?rva008fad80@@YAXPAUGen_t_008fb410_p16pod@@00PAPAU1@0001@Z
void __cdecl rva008fad80(
    Gen_t_008fb410_p16pod *firstCur, Gen_t_008fb410_p16pod *firstFirst,
    Gen_t_008fb410_p16pod *firstLast, Gen_t_008fb410_p16pod **firstNode,
    Gen_t_008fb410_p16pod *lastCur, Gen_t_008fb410_p16pod *lastFirst,
    Gen_t_008fb410_p16pod *lastLast, Gen_t_008fb410_p16pod **lastNode)
{
    const Gen_t_008fb410_p16pod_iter &last = *reinterpret_cast<Gen_t_008fb410_p16pod_iter *>(&lastCur);
    const Gen_t_008fb410_p16pod_iter &first = *reinterpret_cast<Gen_t_008fb410_p16pod_iter *>(&firstCur);
    tg_008fa480(first, last, *reinterpret_cast<const char *>(&lastCur));
}
