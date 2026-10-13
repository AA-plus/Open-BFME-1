# 00925D10 grouped skin buffer provenance

Round35, model gpt-6-astra. Entry bank name is unchanged. The unchanged
ilt_oracle Python API at explicit integer RVA00925D10 returns UNTESTABLE;
this is not semantic identity proof or a promotion authorization.

## Allocation, population, ownership witnesses

- Matched MeshGeometryReadVertices.cpp (00927360/350): alternate-format
  branch allocates ShareBufferClass<Vector3>(VertexCount, ..., 0) at +34,
  zeroes Count*sizeof(Vector3), and copies each 12-byte W3dVectorStruct.
  +30 is the ordinary stream. +38 is a distinct float SOA scratch buffer,
  not an influence record. Keep +34 address-labelled: name_oracle lacks a
  BFME witness and its ZH VertexNorm suggestion conflicts with this loader.
- Matched MeshGeometryGetVertexNormals.cpp (00927230/171) allocates a
  ShareBufferClass<Vector3> at +44 for the alternate selector; ordinary
  normals are +40. MeshGeometryReadVertexNormals.cpp (009274C0/203) fills
  Vector3 records there and separately refreshes float SOA buffers+48/+4C.
  The ZH name_oracle hint VertexBoneLink at+40 is not a BFME witness.
- Matched MeshGeometryLoading.cpp read_vertex_influences (00925380/559)
  reads one8-byte record of four unsigned shorts per vertex into FOUR
  arrays: links[i], links[N+i], links[2N+i], links[3N+i]. Raw +26 pushes8
  to ChunkLoadClass::Read; +48/+51/+5C store the first three words into
  these independently indexed planes. This is SOA, not one interleaved
  weighted-influence struct. Native get_bone_links at009246B0 allocates
  ShareBufferClass<uint16> with4*N elements at owner+58.
- The same matched loader groups consecutive vertices with all four words
  equal. MeshGeometryInfluenceRuns.cpp (00924760/174) allocates ushort
  ShareBuffer at+5C with2*runCount elements. The loader stores first bone
  index then run length, two words/four bytes per run. The consumer uses
  the second word as the length and advances its link pointer by that many
  vertices; it fetches the other planes with VertexCount-scaled offsets.
- Matched Reset_Geometry at009268C0/800 releases both stream slots at+30,
  +38,+40,+48 in its two-iteration loop, then+58 and+5C. Matched destructor
 00927880/101 calls Reset_Geometry(0,0,true). These are shared refcounted
  buffers; the deformation routine borrows their arrays, not owner-local
  automatic buffer lifetimes.

The strongest typed caller is MeshClass::Get_Deformed_Vertices at0092C350
in mesh.cpp. The consumer has RET12 at+65F and INT3 begins+662, proving
1634B. Its only direct callee009371E0 is the matched void counter increment;
no ABI change or new pin is needed for this trial.

## One coherent native-type trial

Starting from the preferred bank, replace generic Rva00925D10Buf (padding
plus void* at+0C) with existing sharebuf.h types: Vector3 for both vertex
and normal streams, ushort for links and runs; use native Get_Array().
Keep all identifiers, algorithm, matrix expressions and function ABI intact.
No shared header, pin or production source was edited.

BUILD_POOL=1 probe baseline:1634B,3relocs,109nonreloc differences, first+322,
shape0.967/13structural differences. Native buffers:1634B,3relocs,92differences,
first+359,shape0.971/11structural differences. The earlier x87 window is fixed
by typed native buffer context; later x87 product ordering remains. No random
operand permutation or mechanical follow-up was attempted. Bank only after
normal re_log --stash measurement accepts this improvement.

Remaining work: reconcile production identity with matched caller evidence
before any promotion, and find independent native transform-source evidence
for the later weighted normal/vertex x87 scheduling. Do not substitute the
single-bone-link Zero Hour MeshGeometry layout for these BFME buffers.
