# ILT lift thunks that borrowed another body's name

The 5-byte `__emit` lifts converted here are incremental-link `jmp rel32`
thunks. Each row's old name was a placeholder borrowed from a unit nearby; the
retail bytes (`e9 <rel32>`) only prove a jump to the destination listed in the
ledger row for that destination, which is independently matched by a real
source. The thunk itself carries no identity beyond its address, so it is
claimed as `?j_XXXXXXXX@@YAXXZ`, the repository's address-derived ILT name, and
its pin `rvaXXXXXXXXTarget` is checked with `tools/pin_consistency.py`.
Examples: 0x00002432 is named `W3DDisplay::W3DDisplay` but jumps to the matched
`W3DParticleSystemManager` constructor body at 0x006FA630; 0x0001002D is named
`BridgeScaffoldBehavior` but jumps to the matched `ParkingPlaceBehavior`
constructor at 0x005F59F0.
