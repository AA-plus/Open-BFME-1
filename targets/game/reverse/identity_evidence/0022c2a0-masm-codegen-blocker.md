# 0x0022C2A0 Gen_0022A170 seeder handoff body (MASM dump)

Retail 0x0022C2A0..0x0022C4CF (559 bytes, `ret 4` at +0x22C followed by INT3
padding at +0x22F), carried by the gen-dump bank `game/gen_asm/d_00226cf0.asm`
(notes: ghidra=FUN_0062c2a0). The body is a thiscall member with one stack
argument that seeds one BfmeSeedTarget through the typed value protocol: the
Gen_0022CD40::bfmeSeed preamble, the checksum/saving dispatch, the
`std::list<Object*>` id sweep, the `std::map<int,int>` value sweep and a
trailing boolValue. The dump body is byte-identical to retail outside its 12
relocation slots (`tools/probe.py` on
`game/masm_dumps/Rva0022C2A0SeedAccept.asm`: EXACT modulo relocation slots,
559/559, 12 relocs).

## Identity

ILT 0x00016027 (`?j_00016027@@YAXXZ`, `game/gen_small/thunks_010.cpp`) is
`e9 74 62 21 00  jmp 0x62C2A0` (VA 0x0062C2A0 = RVA 0x0022C2A0), confirmed by
`tools/dis_retail.py 0x16027`; `targets/game/reverse/symbols.csv` pins the
candidate name `?bfmeAccept@Gen_0022A170@@AAEXPAVBfmeSeedTarget@@@Z` on that
ILT ("Open-BFME5 ILT the seeder at 0x0022A170 accepts through"). The landed
caller `?bfmeSeed@Gen_0022A170@@QAEXPAVBfmeSeedTarget@@@Z` (0x0022A170,
`game/GameEngine/Source/Common/S3SeedPairsSweep.cpp`) seeds the pair, then
takes this body as a member pointer through the union
`__identifier("?d_0022c2a0@@YAXXZ")` and calls it on `this`, so the ILT names
the acceptor method of the same class.

Identity is NOT provable, so the ledger row keeps the placeholder name
`?Rva0022C2A0@@YAXXZ` and asserts nothing:
`tools/ilt_oracle.py check '?bfmeAccept@Gen_0022A170@@AAEXPAVBfmeSeedTarget@@@Z' 0x0022C2A0`
CONTRADICTS that name (p_false 3.26e-04, outside every window of the target's
slots 17210:12089-12093), and it is the only candidate name. A rename stays a
name-lane action backed by ILT/caller evidence; this dump asserts no name.

The retired dump name `?d_0022c2a0@@YAXXZ` stays pinned at 0x0022C2A0 as an
address-only compatibility pin because the caller still takes it by name; the
pin is additive and `tools/pin_consistency.py --symbol` reports it consistent
(owned by `?Rva0022C2A0@@YAXXZ`, extent 559). With the pin,
`python3 tools/build.py game/GameEngine/Source/Common/S3SeedPairsSweep.cpp`
verifies `Functions: OK 49/49 matched`, and the thunk callers
(`b_0022c2a0` pin in `thunks_010.cpp`, `b_003df0c0` in `thunks_035.cpp`,
`b_006bd6e0` in `gthunks_042.cpp`) verify `500/500` each.

## Why a MASM dump

The measured C++ reconstruction banked at
`targets/game/reverse/attempts/0x0022c2a0.cpp` (sha256
286405605257cdc4434e49a73e1136f0df0cec18eb2eff202c2927c7e3202cf4, score
0.9875) compiles to 559 bytes with 12 relocations and shape 1.000; the whole
residue is the stack home of the map-transfer `count` and the loading `id`.
Retail keeps `count` at [esp+14h] and `id` map-load at [esp+1Ch] (the home of
the incoming `target` argument); VC7.1 parks `count` in the
incoming-argument home [esp+24h] and puts `id` at [esp+14h], seven
non-relocation bytes:

  +0x16D  retail `mov [esp+14h],eax`  VC7.1 `mov [esp+24h],eax`
  +0x171  retail `lea eax,[esp+14h]`  VC7.1 `lea eax,[esp+24h]`
  +0x1D7  retail `lea eax,[esp+14h]`  VC7.1 `lea eax,[esp+24h]`
  +0x1DF  retail `mov eax,[esp+14h]`  VC7.1 `mov eax,[esp+24h]`
  +0x1F0  retail `lea ecx,[esp+1Ch]`  VC7.1 `lea ecx,[esp+14h]`
  +0x20A  retail `lea ecx,[esp+1Ch]`  VC7.1 `lea ecx,[esp+14h]`
  +0x21C  retail `mov eax,[esp+14h]`  VC7.1 `mov eax,[esp+24h]`

Every `.cod` `_name$ = N` table read in the sweep assigns the same two homes
(count = argument slot 8 / `id_load` = frame -12, or count frame +4 with `id`
-20 in the function-scope form), so the seven bytes are one allocator decision,
not a scheduling accident.

Formulations measured 2026-10-13 on top of five recorded blocked sessions
(re_attempts.log 46595 gpt-6-sol, 50806 finish1, 51045 gpt-6.1-sol, 54612
gpt-6-astra, 56619 gpt-6-luna):

                 7 diffs / 559 B    A_base, B count-per-branch,
                                    C count-split-id-hoist, D value-first,
                                    L no-wrapper, M value-id-order,
                                    Q8 id-else-scope, Q9 load-id-value
                                    else-scope, Q11, R3 save-arr
                 9 diffs / 559 B    E id-per-branch
                16 diffs / 559 B    F id-function-scope
                18 diffs / 559 B    G count-function-scope, I early, J
                                    before-version
                26 diffs / 559 B    Q1 count-same-block, Q2 id-count
                                    same-block, Q3 id-encloses-all
            485 diffs / 612 B       Q7 loadpair-else-scope
            485 diffs / 607 B       R5 shared-pair
            486 diffs / 606 B       R1, R2, R4, R6 (array/tmp/order)
            489 diffs / 618 B       Q4, Q5, Q6, Q10 (loadpair forms)

The VC7.1 allocator experiments under `build/exp/alloclab*.cpp` show the rule
"the first local gets the dead argument slot, the next takes a frame slot" --
it cannot produce retail's `count`=[esp+14h] + `id`=[esp+1Ch] combination
while the incoming argument home [esp+24h] stays alive for the whole
function. Every declaration, lifetime, scope and aggregate formulation
converges on the same seven bytes or degrades, so the wall is a measured
VC7.1 codegen decision, not an unproven shape.

Reopen as C++ only with a reconstruction compiled byte-identical, or with
independent evidence that stabilises the count/id homes while keeping the
559-byte extent and all 12 relocations.
