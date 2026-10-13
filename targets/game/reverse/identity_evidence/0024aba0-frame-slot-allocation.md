# RVA 0024ABA0 frame-slot allocation, 2026-10-13

Best bank: 559/559 B, 12 relocations, 9 non-relocation bytes, shape 1.000
(pure stack-slot allocation). First divergence +0x192. Previous bank was
14 bytes (first +0x41); this session removed 5.

## What moved it

The residual frame in the old bank was

    _count$ = -16   _key$/-12 _objectID$/-12 _object$/-12
    _value$/-8  _values$/-8 (8B)  _version$ = +8 (dead-parameter slot)

Retail needs

    _version$ = -16   _count$ = -12   _object$ = -12 (shares count)
    _values$/-8 (8B)  _value$/-8   _key$ = -4   _objectID$ = +8

Two source changes produced measurable byte progress, confirmed by the
/facsc local tables (`build/0024aba0/*.cod`):

1. A 2-byte `Xfer::Version` local always lands in the +8 dead-parameter slot
   in this TU, whatever its scope or declaration position (probed: function
   scope, own block, moved to function top - all identical). Declaring the
   local inside a 4-byte wrapper (`struct { Version p; unsigned char pad[2]; }`)
   with a reference alias moves it to -16, matching retail's stores at +0x26
   and killing 3 of the 14 diffs. Retail's version slot is -16.
2. Wrapping `int count` (and the map save/load section that uses it) in its own
   block moves the +8 winner off `version`; with the wrapper in place the
   count block drops the residue 11 -> 9.

## Remaining 9 bytes

`count` sits at +8 where retail has -12; `key` sits at -12 where retail has
-4; the destroy-loop `object` spill sits at +8 where retail shares -12 with
`count`. The allocator gives the first 4-byte block-scoped local of the
*map/load side* (key) the -12 slot instead of count/object. Negative results
this session, all byte-identical to the bank unless noted: moving `count`'s
declaration to the function top; value-before-key in the load loop;
key/value hoisted to the else-block scope; single function-scope `objectID`
(forced a 0x14 frame, worse); version via returning-helper temporary (575 B);
one shared objectID with an init (560 B). Declaration order alone does not
move this residue - see shape_levers "A run of locals on the wrong slots".

## Identity (unchanged, previously established)

HordeSiegeEngineContain owner: ctor 0x0024A560 installs primary vtable
010B02A8, ILT 0003E99B slot +0C reaches this body; Snapshot caller 0x009D6410
passes Xfer* in ECX; complete 559-byte extent ends ret 4 at +0x22C, INT3
padding at +0x22D.
