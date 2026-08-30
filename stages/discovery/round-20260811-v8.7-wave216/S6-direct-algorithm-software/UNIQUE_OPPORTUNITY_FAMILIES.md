# Unique opportunity family

## U1 — GNU hash joint dynsym permutation and table constructor

- Candidate action: jointly order valid export symbols within GNU-hash bucket constraints; regenerate `dynsym`, `.gnu.hash` bloom/bucket/chain arrays, `.gnu.version*` and all relocation/dynamic references while retaining the fixed DSO interface and loader behavior.
- Minimal legal witness: two exported symbols in the same GNU-hash bucket can exchange their contiguous suffix positions only after every dependent index and chain termination is regenerated. The bucket-order rule remains satisfied.
- Limitation: this proves a constrained representation action only. A deterministic within-bucket ordering, hash-size selection, or local postprocess is not a nontrivial N2.
- State: `NOT_ADMITTED_UNFROZEN`; complete current linker union and direct collision are not closed.
