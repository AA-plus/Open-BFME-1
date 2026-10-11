# CloudTextureShader::set constructor visibility retry

## Result and retained body

The target remains unmatched at revision `4d34555fd5ba0ccb8f4ba7c20de283af6ace925b`. The preferred body remains `targets/game/reverse/attempts/0x007c34e0.cpp`, unchanged. Its independently compiled snapshot is `build/cloud-set-retry/baseline.cpp`, with the object and source hashes in `baseline-metrics.json`. It emits 2118 bytes against the complete 2117-byte retail extent, with 273 differing non-relocation bytes, one extra byte and 28 displaced relocation sites. The scoped byte gate fails with no unresolved calls. No source recovery, pin change or ledger change is claimed.

The first raw differing byte is at `+0x66B`, a branch displacement crossing the later mismatch. The first differing operation is at `+0x6A3`. Retail loads the string buffer into EDX, then the null character into AL and stores AL through EDX. The retained compiler output loads the character into DL, then the buffer into EAX and stores DL through EAX. The longer character load adds one byte. The second string initialization at retail `+0x767` also reverses the buffer and character registers. The complete side-by-side output is `build/cloud-set-retry/probe-baseline.txt`; the exact raw offsets and relocations are retained in `baseline-metrics.json`.

## Hypotheses and current declarations

The retry tested whether native string construction or the actual helper's visibility changes the two remaining string initializations. The supporting evidence is the single-pointer StringClass declaration in `wwstring.h`, its native inline constructor, the matched DX8 state helper in `dxwrapper.cpp`, and the neighbouring `ShroudTextureShaderSet.cpp` constructor views. The hypotheses would be refuted by a complete decode showing different fields or argument widths, or by real compiler experiments failing to improve the bank. The decoded fields agree, but none of the measured alternatives improves it.

The current rows and pins around the target and its callees supply the counted getter, native DX8 declarations, the noise update, StringClass allocation and cleanup, the texture accessor and reference release. These declarations already underlie the preferred bank. They supply no newly established field or ABI repair for the recorded snapshot-load blocker. The adjacent getter and shader sources were read directly. The getter donor's simple reference decrement was not adopted for destruction, because the complete owning destructor tail-calls the release routine.

## Complete boundary, identity and ABI checks

`retail-complete.txt` retains the complete target, the two ILT routes, the getter, noise update, both string helpers, value-name helper, Format, texture accessor, release routine, constructor, registration, reset, and the complete 61-byte virtual caller. `checked-target.txt` and `checked-helpers.txt` retain the required independent inventories. Every direct target branch remains internal and instruction-aligned. Its sole `ret 4` ends at `0x007C3D25`, followed by INT3 padding. The target has no outgoing tail jump. The value-name helper's outgoing Format jumps were followed to its complete body; its six indirect switch destinations were separately checked against instruction starts.

The constructor installs vtable VA `0x01128764`. Its four decoded ILT routes resolve to the target, CloudTextureShader reset, registration and the return-one method. The singleton contains this vptr, and the complete registration instructions install it at shader index eleven. The Zero Hour header calls that index `ST_CLOUD_TEXTURE`; its cloud projection body agrees with the target's matrices, noise update and state sequence. This supports the existing CloudTextureShader name independently of the compiler result. The registration writes runtime state; an initial value at that destination is not required or claimed.

The virtual caller places the indexed shader receiver in ECX, pushes one 32-bit pass and calls slot zero. The target stores the pass at receiver offset eight, returns integer one in EAX and removes four stack bytes. There is no receiver adjustment or hidden return object for this method. The noise update takes destination, inverse and a stack-word bool, with the singleton receiver in ECX, and ends with `ret 12`. Its complete field accesses support the existing slide, tick and offset declarations.

The getter writes only one pointer into hidden return storage, conditionally increments the low word at pointee offset four and returns the storage address in EAX. Its cdecl caller removes eight bytes. The complete owning destructor guards that pointer and tail-calls the 36-byte release body, which decrements the same word and conditionally dispatches through pointee slot `+0x20`. The accessor first dereferences handle storage, separately calls pointee slots `+0x28` and `+0x2C`, tests AL from the first call, and returns the device pointer through pointee offset `+0x14` and nested offset eight. The existing accessor's TextureBaseClass owner remains a shared declaration issue, as documented in `007c34e0-cloud-set.md`; this retry does not assert that the handle has TextureBaseClass layout or correct that owner.

The complete string allocation helper writes the receiver's sole pointer and buffer headers, accepts a length and stack-word bool and ends each path with `ret 8`. Free_String takes only the receiver and frees the temporary or heap buffer on its complete paths. The texture-stage naming helper accepts the string reference, state and value in three cdecl slots. The target's device calls independently establish their argument order and stdcall stack cleanup: view and texture transforms, texture-stage states, sampler states and texture binding. The external device implementations are unavailable for decoding; their return values are unused. There is no STL value-type inference in this target.

## Exception cleanup

`eh-retail.txt` and `complete-eh-and-setter.txt` retain all nine unwind states, complete cleanup actions and their jump routes. States zero through seven have predecessor minus one and receiver `ebp - 0x9C`; state eight has predecessor minus one and receiver `ebp - 0x94`. `audit-and-byte-gate.txt` independently checks the compiled table, each action's immediate relocation, each destructor's complete body and its immediate tail target. All eight string cleanups reach canonical Free_String; the handle cleanup has the complete null guard and release jump. These checks pass for the unchanged bank. They do not establish main-body equality.

## Measured rejected alternatives

Each trial source, full unedited probe and timestamp receipt remains under `build/cloud-set-retry/`. The measurements below are individual probes. The baseline shape was reproduced in separate compilations.

| Source | Emitted bytes | Non-relocation differences | Displaced relocation sites | Raw probe |
| --- | ---: | ---: | ---: | --- |
| `baseline.cpp` | 2118 | 273 | 28 | `probe-baseline.txt` |
| `native-base.cpp` | 2118 | 273 | 28 | `probe-native-base.txt` |
| `late-alphaarg2.cpp` | 2118 | 273 | 28 | `probe-late-alphaarg2.txt` |
| `visible-get-string.cpp` | 2118 | 273 | 28 | `probe-visible-get-string.txt` |
| `native-state-setter.cpp` | 2120 | 797 | 86 | `probe-native-state-setter.txt` |
| `donor-state-setter.cpp` | 2119 | 535 | 58 | `probe-donor-state-setter.txt` |
| `donor-alphaarg2.cpp` | 2118 | 273 | 28 | `probe-donor-alphaarg2.txt` |

The first two constructor trials exhaust this run's unchanged register experiments. Making the actual Get_String implementation visible as an inline, noinline member also leaves the target unchanged. That helper independently reproduces all 352 bytes modulo relocations in `probe-visible-helper.txt`. Routing the state operations through a typed inline boundary worsens the target. Using the matched helper's actual source body improves that alternative but still worsens the bank; restricting that donor to the first mismatching state restores the unchanged bank shape. No inferior alternative replaces it.

The EH generator's current finite choices are retained in `choices-eh.json`. The previous run already tested those exception choices without improvement, so they were not repeated. The non-EH generator reports no applicable source-level family transformation in `choices-family.json.stderr`. No assembly, new pin, baseline change or shared header edit was used.

Reopening requires new independently verified helper or inline-accessor context that changes the first mismatching operation, or a compiler observation that explains the two load schedules and improves the actual probe. Repeating constructor inheritance, the donor's late constructor, Get_String visibility or the measured state-helper boundaries does not supply that evidence.

## Checks and collection

`check-csv-final.txt`, `pin-consistency-final.txt` and `class-bank.txt` pass. `audit-and-byte-gate.txt` records the scoped byte failure with no unresolved calls and passing unwind and vtable checks. No shared header or landed source changed, so no full gate is required. The documented file-pair name-regression invocation is unsupported by this checkout's tool, which expects Git revisions; its raw refusal is `name-regression.txt`. No bank-to-source conversion or name change was made. The preferred bank's bytes were preserved. The sole final verdict cites this note. All scratch evidence is retained for collection.
