.386
.model flat
; MASM dump carrying a measured VC7.1 codegen blocker. Identity is proven but
; not pinnable here: tools/ilt_oracle.py reports CONFIRMED for
; ?startRenderToTexture@W3DShaderManager@@SAXXZ at 0x007171F0, and that
; mangled name is already pinned to its 5-byte ILT thunk row at 0x000154E7,
; so this row keeps the placeholder name.
; The reconstructible C++ body (targets/game/reverse/attempts/0x007171f0.cpp)
; compiles to 445 bytes with 26 relocations and shape 1.000; the residue is
; one register swap over the alpha/dimensions handoff: retail keeps the alpha
; global (0x012F7FE0) in EDX and the dimension temp address in ECX
; (mov edx,[12F7FE0h]; fld [edx+301Ch]; lea ecx,[esp+4]; push ecx), while
; VC7.1 emits mov ecx / fld [ecx+301Ch] / lea edx / push edx over four
; non-relocation bytes at +0x11C, +0x122, +0x128, +0x132.
; Sessions measured: local order, helper wrappers, Release_Ref, barriers,
; argument staging, dims const/reg/ref, volatile global, named global local,
; dimension-store order, alpha-first, 103-pair rotation sweep -- none flip
; it; the closest alternative spellings add frame bytes or 17+ diffs.
; Evidence: targets/game/reverse/identity_evidence/007171f0-masm-codegen-blocker.md
EXTERN ?g_00722110@@3EA:BYTE
EXTERN ?HighlightPixelSupport@@3IA:BYTE
EXTERN ?m_oldDepthSurface@W3DShaderManager@@1PAUIDirect3DSurface8@@A:BYTE
EXTERN ?D3DDevice@DX8Wrapper@@0PAUBfmeDevice@@A:BYTE
EXTERN ?Set_Render_Target@DX8Wrapper@@SAXPAUIDirect3DSurface8@@_N@Z:NEAR
EXTERN ?GenFallback0012ED5C8@@3PAVGenFallback@@A:BYTE
EXTERN ?m_currentFilter@W3DShaderManager@@1HA:BYTE
EXTERN ?TheBfmeGlobal_012f7fe0@@3PAVBfmeGlobal_012f7fe0@@A:BYTE
EXTERN ?j_0001321e@@YAXXZ:NEAR
EXTERN ?_PresetOpaqueSolidShader@ShaderClass@@2V1@A:BYTE
EXTERN ?j_000173c3@@YAXXZ:NEAR
EXTERN ?Get_Preset@VertexMaterialClass@@SAPAV1@W4PresetType@1@@Z:NEAR
EXTERN ?Rva01340EC4Material@@3PAVVertexMaterialClass@@A:BYTE
EXTERN ?Rva0133F49CChanged@@3IA:BYTE
EXTERN ?g_bfmeAlphaScale1293@@3MA:BYTE
EXTERN __ftol2:NEAR
EXTERN ?j_000196a0@@YAXXZ:NEAR
EXTERN ?Clear@DX8Wrapper@@SAX_N00ABVVector3@@MMI@Z:NEAR
_TEXT SEGMENT
; retail VA 0x00B171F0 size 445
public ?Rva007171F0@@YAXXZ
?Rva007171F0@@YAXXZ PROC
    db 0A0h
    dd ?g_00722110@@3EA
    db 083h, 0ECh, 014h, 084h, 0C0h, 00Fh, 085h, 0A9h, 001h, 000h, 000h, 0A1h
    dd ?HighlightPixelSupport@@3IA
    db 085h, 0C0h, 00Fh, 084h, 09Ch, 001h, 000h, 000h, 0A1h
    dd ?m_oldDepthSurface@W3DShaderManager@@1PAUIDirect3DSurface8@@A
    db 085h, 0C0h, 00Fh, 084h, 08Fh, 001h, 000h, 000h, 0A1h
    dd ?D3DDevice@DX8Wrapper@@0PAUBfmeDevice@@A
    db 085h, 0C0h, 074h, 00Eh, 08Bh, 008h, 050h, 0FFh, 051h, 00Ch, 085h, 0C0h, 00Fh, 085h, 078h, 001h
    db 000h, 000h, 08Bh, 015h
    dd ?HighlightPixelSupport@@3IA
    db 06Ah, 001h, 052h
    call ?Set_Render_Target@DX8Wrapper@@SAXPAUIDirect3DSurface8@@_N@Z
    db 0A1h
    dd ?GenFallback0012ED5C8@@3PAVGenFallback@@A
    db 0C6h, 005h
    dd ?g_00722110@@3EA
    db 001h, 08Ah, 088h, 08Ch, 000h, 000h, 000h, 083h, 0C4h, 008h, 084h, 0C9h, 00Fh, 084h, 000h, 001h
    db 000h, 000h, 0A1h
    dd ?m_currentFilter@W3DShaderManager@@1HA
    db 083h, 0F8h, 002h, 074h, 029h, 083h, 0F8h, 003h, 074h, 024h, 08Bh, 00Dh
    dd ?TheBfmeGlobal_012f7fe0@@3PAVBfmeGlobal_012f7fe0@@A
    db 08Bh, 091h, 01Ch, 030h, 000h, 000h, 06Ah, 000h, 068h, 000h, 000h, 080h, 03Fh, 08Bh, 0C2h, 050h
    db 08Dh, 04Ch, 024h, 014h, 089h, 054h, 024h, 00Ch, 051h, 0E9h, 0F4h, 000h, 000h, 000h, 056h, 06Ah
    db 008h, 068h, 0A8h, 000h, 000h, 000h
    call ?j_0001321e@@YAXXZ
    db 08Bh, 015h
    dd ?_PresetOpaqueSolidShader@ShaderClass@@2V1@A
    db 083h, 0E2h, 0F7h, 08Dh, 044h, 024h, 00Ch, 083h, 0CAh, 007h, 050h, 089h, 054h, 024h, 010h
    call ?j_000173c3@@YAXXZ
    db 06Ah, 000h
    call ?Get_Preset@VertexMaterialClass@@SAPAV1@W4PresetType@1@@Z
    db 08Bh, 0F0h, 083h, 0C4h, 010h, 085h, 0F6h, 074h, 003h, 0FFh, 046h, 004h, 0A1h
    dd ?Rva01340EC4Material@@3PAVVertexMaterialClass@@A
    db 085h, 0C0h, 074h, 013h, 08Bh, 050h, 004h, 08Bh, 0C8h, 083h, 0C0h, 004h, 04Ah, 085h, 0D2h, 089h
    db 010h, 075h, 004h, 08Bh, 011h, 0FFh, 012h, 08Bh, 00Dh
    dd ?Rva0133F49CChanged@@3IA
    db 081h, 0C9h, 000h, 040h, 000h, 000h, 085h, 0F6h, 089h, 035h
    dd ?Rva01340EC4Material@@3PAVVertexMaterialClass@@A
    db 089h, 00Dh
    dd ?Rva0133F49CChanged@@3IA
    db 074h, 00Bh, 0FFh, 04Eh, 004h, 075h, 006h, 08Bh, 006h, 08Bh, 0CEh, 0FFh, 010h, 08Bh, 015h
    dd ?TheBfmeGlobal_012f7fe0@@3PAVBfmeGlobal_012f7fe0@@A
    db 0D9h, 082h, 01Ch, 030h, 000h, 000h, 08Dh, 04Ch, 024h, 004h, 0D8h, 00Dh
    dd ?g_bfmeAlphaScale1293@@3MA
    db 051h, 0C7h, 044h, 024h, 008h, 000h, 000h, 080h, 03Fh, 0C7h, 044h, 024h, 00Ch, 000h, 000h, 080h
    db 03Fh, 06Ah, 000h
    call __ftol2
    db 0C1h, 0E0h, 018h, 00Dh, 0FFh, 0FFh, 0FFh, 000h, 050h
    call ?j_000196a0@@YAXXZ
    db 06Ah, 007h, 068h, 0A8h, 000h, 000h, 000h
    call ?j_0001321e@@YAXXZ
    db 083h, 0C4h, 014h, 05Eh, 083h, 0C4h, 014h, 0C3h, 083h, 03Dh
    dd ?m_currentFilter@W3DShaderManager@@1HA
    db 004h, 075h, 044h, 0A1h
    dd ?TheBfmeGlobal_012f7fe0@@3PAVBfmeGlobal_012f7fe0@@A
    db 08Bh, 088h, 01Ch, 030h, 000h, 000h, 06Ah, 000h, 068h, 000h, 000h, 080h, 03Fh, 08Bh, 0D1h, 052h
    db 08Dh, 044h, 024h, 014h, 089h, 04Ch, 024h, 00Ch, 050h, 06Ah, 000h, 06Ah, 000h, 06Ah, 001h, 0C7h
    db 044h, 024h, 02Ch, 000h, 000h, 000h, 000h, 0C7h, 044h, 024h, 028h, 000h, 000h, 000h, 000h, 0C7h
    db 044h, 024h, 024h, 000h, 000h, 000h, 000h
    call ?Clear@DX8Wrapper@@SAX_N00ABVVector3@@MMI@Z
    db 083h, 0C4h, 01Ch, 083h, 0C4h, 014h, 0C3h
?Rva007171F0@@YAXXZ ENDP
_TEXT ENDS
END
