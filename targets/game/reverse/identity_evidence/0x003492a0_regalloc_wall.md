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
