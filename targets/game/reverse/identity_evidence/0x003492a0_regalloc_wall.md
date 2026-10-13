# 0x003492A0 ScriptEngine::~ScriptEngine - 7-byte allocator wall at +0x6E

Bank: targets/game/reverse/attempts/0x003492a0.cpp (928B/928B, 69 relocs, 7
non-relocation bytes at +0x6E..+0x7A, shape 0.996).

Retail                        ours (all attempted source forms)
  mov ecx,[0x12f0754]           mov edi,[0x12f0754]
  cmp ecx,ebx                   cmp edi,ebx
  mov edi,ecx                   je  +0x16
  je  +0x14                     mov ecx,edi
  mov dword ptr [ecx],0x010E75C0 (vft)   mov dword ptr [edi],<vft>
  call 0x00020BA3 (clear)       call
  push edi / call ??3           push edi / call ??3

The two sequences are identical modulo which register (ECX vs EDI) holds the
delete operand temp and where the 2-byte copy sits.

New evidence this session (2026-10-13, model gpt-5.2-codex):

1. Fresh probe of the preferred bank reproduces 928B/133 relocs/7 diffs.
2. Bare `delete g;` (no local, no if) and `if (g) delete g;` both switch the
   expansion to the A1 `mov eax,[g]` short-load form: 929B and 577 diffs.
3. Declaring the local before the holder block (assignment after) keeps the
   same 7-byte tie. Extra scope braces and `*const` keep it too.
4. A fully manual expansion mirroring the target instructions
   (`object->m_vtable = vft; object->clear(); ::operator delete(object);`)
   compiles to the SAME 7-byte tie: the allocator still homes the operand in
   EDI and inserts `mov ecx,edi` after `je`.
5. Micro-TU oracle (tools/experiment_store.compile_cached, /O2 /EHsc) over
   class models - polymorphic non-virtual dtor, virtual dtor, plain node with
   inline dtor - and over forms local+if / bare / if(global) / explicit dtor +
   ::operator delete / static helper param / reference helper param: every
   model homes the operand in a callee-saved register (ESI or EDI) and copies
   to ECX inside the block. No source form produced the retail ECX-home shape.
6. The vftable stored is 0x010E75C0, the vftable of Rva0033C070TailDtor
   (game/GameEngine/Source/Common/VptrTailJumpDestructors.cpp) whose 11-byte
   dtor tail-jumps into 0x0033AFF0. The global is g_rva00339a80Node at
   0x012F0754 (see Rva00339A80ParticleSystemSinkStart.cpp).

Conclusion: the residual is a codegen-level register-allocation tie-break, not
a source-shape difference; 22+ prior verdicts and these new forms all hold the
same 7 bytes. Landing also needs the member destructor and vftable pins the
earlier verdicts listed.

Wave15 finition (2026-10-13, model gpt-5.2-codex). Bank re-verified live:
928/928B, 69 relocs, 7 non-reloc bytes at +0x6E..+0x7A, shape 0.996.

7. Thirteen fresh variants this wave, all inert at the same 7 bytes:
   w15f v01 flat+qualified dtor+::operator delete, v02 two-level
   (Rva00020BA3TailBase) empty derived dtor+qualified call, v04 two-level with
   clear, v06 virtual dtor declared out-of-line but defined inline later,
   v07 qualified dtor without scope, v08 unqualified operator delete; w15g m1
   W3DMouse-style owner-struct member with local+if, m4 test-on-global with
   qualified dtor inside. Two forms got much worse: v03/v05 (plain delete on
   the two-level virtual-dtor class) fall to 911B with a vtable deleting-dtor
   call, and m2/m3/m5 (bare delete on global/member) fall to 929B with the A1
   `mov eax,[g]` short load and two copies (T1/T2 result reproduced).
8. NEW landed datum on the same idiom: ??1W3DMouse@@UAE@XZ (0xB0129A,
   game/GameEngineDevice/Source/W3DDevice/GameClient/W3DMouseConstructor.cpp)
   deletes `g_rva012F9808Object.m_handle` and DOES get the retail shape -
   `mov ecx,[0x12f9858]; test ecx,ecx; mov edi,ecx (8b f9); je; call dtor;
   push edi; call ??3` - but its MouseThreadHandle dtor is OUT-OF-LINE, so no
   vptr store appears. The same is true of the other two retail instances of
   `3b cb` + `8b f9`/`8b f1` copy-before-branch: 0x7BDF0B (W3DVolumetricShadow
   global delete, ESI copy) and 0x4605AA/0x4605E7 (two global deletes in
   d_000600f0, ESI copies). All four are out-of-line-dtor deletes.
9. Micro-TU oracle (build/experiments/w15g/micro_outline.cpp, bank flags):
   `delete g; g=0;` with an OUT-OF-LINE dtor compiles in OUR compiler to the
   exact retail shape `8b 0d <g> 85 c9 8b f1 74` (ECX home, copy-early);
   local+if gives ESI-home + late copy; `delete g` with the inlined polymorphic
   dtor (our required store-vptr+clear expansion) gives the A1 EAX-home form.
   So the ECX home is reachable exactly when the dtor call is out-of-line, and
   the vptr store the retail block proves requires the inlined dtor is
   incompatible with it. The whole-.text regex for the target shape
   (`8b 0d ?? ?? ?? ?? 3b cb 8b f9 74`) still hits only this function.

Blocker stands, now mechanism-level: regalloc/object-home-register - the
inlined-dtor delete expansion homes the operand in EDI in this compiler under
every spelling tried (35+ verdicts); retail's ECX home is a tie-break we cannot
reach without dropping the inlined dtor the block's vptr store requires.
