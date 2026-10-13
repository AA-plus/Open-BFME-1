# RVA 00896390: incoming handle lifetime

Round46, model=gpt-6-astra, lane=R, budget=30m. No production changes.

The generated row is an eligible 214-byte body. Retail starts at 00896390;
RET4 at 0089644E and the final jump at 00896464 end at 00896466.
The existing bank identifier `?release@Gen00896390Owner@@QAEXPAX@Z` has
oracle tier=placeholder and actual-integer-RVA verdict UNTESTABLE. Neither
this check nor the spelling proves a semantic method name.

The matched caller `Rva00896470RefHolderSubmit.cpp` passes a copied,
reference-counted BfmeRefHolder by value. Retail cleanup at 00896410 reads
the incoming stack word, clears its EH state, decrements the pointed-to
count, calls the full 144-byte BfmeDropObjectA destructor at 00895260 and
frees 0x18 bytes. The found path at 00896451 performs the same cleanup.
Thus the old bank's local BfmeDropObjectA buffer and result-output model
are not the caller's actual lifetime.

The entire 316-byte helper at 008961E0 accepts references to first, last,
and insertion-position iterators: it subtracts the first two pointees,
divides by four, grows the array when needed, and copies the reference
range. Its existing matched sibling in Gen00896320Append.cpp constructs
exactly these three iterator locals. At 008963EC/008963F4 the current
body forms incoming-parameter+4 and incoming-parameter addresses, hence
a one-element range, not two output structures.

One coherent structural trial used the existing BfmeRefVGO lifetime from
BfmeHolder95670.cpp and those three iterator references. The matched
caller uses the ABI-equivalent BfmeRefHolder spelling; this experiment
makes no claim that the two source types are one canonical identity.
Existing descriptive bank identifiers were preserved. No pins were added.

| Probe | Bytes | Non-relocation differences | First difference | Compiler quality |
|---|---:|---:|---:|---:|
| Preferred bank | 195 / 214 | 152 | +0 | 0.1121 |
| Corrected parameter lifetime | 184 / 214 | 136 | +25 | 0.0841 |

Quality uses the unchanged finish_measure parser, including twice the
size error. Fewer differing bytes alone are not improvement. The stronger
bank remains byte-for-byte unchanged, including its historical 0.29 author
estimate. The trial is not promoted or archived as a better bank.

The native trial recovers EH entry ordering through +25, then omits retail's
EDI save. Retail reloads the array base within the loop while the compiler
hoists the end pointer. No evidence yet identifies a native iterator/accessor
contract that explains this; do not substitute volatile fields or fake
output objects merely to force that reload.

Raw evidence remains in build/worker3-round46/{retail.txt,callees.txt,
base.cpp,base.log,native.cpp,native.log,measurements.json}. No scoped strict
build was warranted because neither body matches and game/ is unchanged.
