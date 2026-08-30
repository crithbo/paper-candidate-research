# Pre-Claim Contract Fidelity Audit

## Disposition

`FAIL_CLOSED__STATEWISE_DETERMINISTIC_BACKPOINTER_EXACTNESS`

## Contract dimensions

| Dimension | Finding |
|---|---|
| Same object | PASS: fixed rows/schema, stock Arrow IPC reader/writer semantics, native cut/dictionary actions retained. |
| Candidate action completeness | No observed catalog miss in completed executions; not the failure kernel. |
| Native codec/reader/format parity | PASS on completed streams; no proxy codec substitution. |
| Both delta semantics | Present in the frozen contract; the observed mismatch is delta-disabled. A delta-enabled tie adversary remains mandatory. |
| Cost frontier exactness | PASS on the frozen mismatch at every reported difference boundary. |
| Final optimum | PASS on the frozen mismatch. |
| Final signature | PASS on the frozen mismatch. |
| Every-boundary deterministic backpointer exactness | FAIL at boundaries 10, 13, 14, 15, and 16. |
| Full-cost denominator | Frozen and broad, but aggregate evidence incomplete. |
| Natural evidence | Fail-closed after 11 completed windows; no support/STOP inference. |
| Reproducibility | PASS for the failure and diagnostic. |

## Why final equality is not sufficient

The frozen exactness statement includes a deterministic representative of every Pareto label at every boundary. Intermediate backpointers are not debugging metadata: they are the certificate that the implicit lower envelope represents the same value function and reconstructs the same native plan under the frozen tie-break. A later reconvergence of the final optimum does not repair an earlier statewise loss.

## Why this is not scientific STOP evidence

All cost frontiers at the difference boundaries remain equal and the final optimum/signature agree. The counterexample therefore attacks the implementation's signature-preserving pruning, not the existence of an exact cost-factorized representation. There is no same-object drift, illegal comparator, direct prior/current absorption, or full-cost negative result in this failure.

## Scientific-revision boundary

The correction occurs after 11 natural claim-bearing windows were observed. It may affect surviving rank `R`, pruning time/memory, and full-cost results. It must therefore consume the single Stage A scientific revision when first executed. It is not eligible for the pre-observation non-scientific correction category.
