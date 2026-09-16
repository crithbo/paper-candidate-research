# S6-JS-PREFIXBOUND Revision User Review Packet

## Current recommendation

`PASS_RECOMMENDED` only to an independent Stage A gate re-review. This is not a pipeline upgrade and does not request Stage B approval.

## What changed

- Fixed the executable to use the NDV formulas frozen in the original contract.
- Separately measured exact, full-vector quotient, compact quotient, future-equivalence audit and bound oracle.
- Counted every declared signature invocation, vector element, normalization, hash, comparison, lookup, write, retained payload byte and bound-oracle transition.
- Replayed the full experiment and compared every nonvolatile field.

## Decisive result

The full-vector representation is absorbed: it has negative work residual and retains 32.75 MB more canonical payload than exact. The preregistered rule therefore triggered the one allowed compact representation.

Compact preserved the exact optimum and exactly the same quotient classes, with zero bound overestimates. It reduced frozen canonical retained payload by `601,569 B` (`2.87%`) versus exact. However, its work residual is `−64,616,558` units after charging the bound oracle, and it was slower than exact in both runs.

Therefore the only positive result is a small persistent representation-size residual. There is no optimizer speedup, work reduction, cheap-bound or DBMS claim.

## Key numbers

| Item | Result |
|---|---:|
| Exact / compact states | 404,479 / 389,774 |
| Exact / compact transitions | 877,024 / 873,661 |
| Full-vector retained residual | −32,749,534 B |
| Compact retained residual | **+601,569 B** |
| Compact work residual incl. bound | −64,616,558 units |
| Optimum mismatches | 0 |
| Compact-equivalence mismatches | 0 |
| Bound overestimates | 0 / 404,479 |
| Dual replay nonvolatile match | true |

JOB 4a remains natural structure only: `29→24` states and `44→41` transitions at identical proxy-cost optimum. It is not natural performance evidence.

## What an independent gate should decide

The gate should decide whether a 2.87% deterministic persistent-payload residual, despite negative work/time and an expensive audit-only bound, is sufficient Stage A non-vacuity to justify user review of a possible Stage B route. The owner recommends yes only under the narrow finite evidence ceiling.

## Still missing before any paper-level claim

- unbounded future-equivalence/admissibility theorem;
- compact characterization that avoids full-vector construction;
- cheap bound with actual search value;
- executable DPomega fidelity;
- real JOB/TPC-DS/SYN-S statistics and full optimizer time/RAM;
- scale/topology/failure-region evidence and latest-collision closure.

## Authorization

- `PENDING_USER_STAGEB_REVIEW`: `false`
- `stageb_user_approval_id`: `null`
- Stage B authorized: `false`
- Next step: mainline mechanical acceptance, then independent Stage A gate re-review.

