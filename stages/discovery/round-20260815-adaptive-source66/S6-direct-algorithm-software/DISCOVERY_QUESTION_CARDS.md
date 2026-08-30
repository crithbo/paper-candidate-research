# Question card — QC-S66-01

## Frozen object

- Exact public identity: OpenJDK `master`, `src/hotspot/share/opto/superword.cpp` and `c2_globals.hpp`, with JEP 426 as official semantic context; accessed 2026-08-15.
- Carrier kind: `IMPLEMENTATION_CARRIER_ONLY` pending a separately frozen Java-loop carrier; no corpus or experiment was run.
- Same-object endpoint: identical Java loop semantics and C2 legality; proposed effect would need JIT compile cost/RSS/code size and steady-state performance in one full-cost boundary.
- Network-security exclusion: `PASS`.

## Raw-required audit

| Field | Outcome |
|---|---|
| exact source object | CLOSED |
| same-object contract and endpoint | CLOSED |
| initial full-cost boundary | CLOSED |
| current source locus | CLOSED: C2 SuperWord source and flags locus |
| minimum falsifier | CLOSED: distinguish target-specific construction from generic SLP packing |
| source-supported target-specific non-generic discriminator | FAILED |
| known direct-fatal/generic-kernel check | FOUND |

## Current and contrary result

JEP 426 describes HotSpot auto-vectorization as transforming scalar operations into SuperWord operations mapped to vector instructions. The current official repository contains the dedicated C2 `superword.cpp` producer and the C2 configuration locus. This confirms a real native construction surface, not an absence claim.

The proposed remaining operation—choosing scalar statements to pack into vectors under dependency and profitability constraints—is the general superword-level parallelism problem. The contrary source `goSLP: Globally Optimized Superword Level Parallelism Framework` expressly frames existing SLP as heuristic discovery and supplies globally optimized pack selection. A candidate that merely applies that kernel to C2 is an implementation relabel; changing loop/ISA semantics or adding a generic selector would violate the frozen target-specific contribution requirement.

- `RQ audit: RQ_COMPLETE`.
- `RAW_REQUIRED audit: INCOMPLETE` because the non-generic discriminator fails.
- `Disposition: EXCLUDED_BEFORE_RAW__STRUCTURAL_DROP__GENERIC_SLP_KERNEL_DIRECT_SUBTRACT`.
- No claim is made that all HotSpot vectorization work is absorbed; this is only the frozen joint pack-selection endpoint.
- No missing implementation, result, resource or AI readiness was used.

## Reopen boundary

Requires a new exact C2 object/endpoint and external primary evidence of a Java- or C2-semantic constraint not represented by general SLP pack selection. A heuristic threshold, vector-width flag, standard ISA cost model, or HotSpot-only implementation patch is insufficient.
