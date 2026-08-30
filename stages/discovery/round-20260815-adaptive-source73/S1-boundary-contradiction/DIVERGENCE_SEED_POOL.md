# Divergence seed pool (non-evidence)

| Seed | Engine | Conclusion-first test | Status |
|---|---|---|---|
| S73-01 | JANUSIAN_TENSION / runtime engineer | Address-local atomic semantics can be implemented with pooled shared wait state; a residual needs more than a global waiter-placement policy. | selected locator |
| S73-02 | CONSTRAINT_MANIPULATION | Wake correctness and space isolation may conflict in a library fallback path; only a same-object non-controller action is admissible. | RQ backlog |
| S73-03 | ABSTRACTION_LADDER | A standard atomic endpoint is fixed even if its OS wait primitive is not; a paper needs a library-specific mechanism. | RQ backlog |
| S73-04 | NEGATION_OR_INVERSION | If changing the wait pool only chooses an address hash or wake policy, it is not a target-specific semantic contribution. | RQ backlog |
| S73-05 | BISOCIATION_STRUCTURAL_TRANSFER | Shared waiter buckets resemble cache-set aliasing, but a structural analogy cannot substitute for a concrete action/guarantee. | RQ backlog |
| S73-06 | COMPOSE_DECOMPOSE_SIMPLIFY | Separate atomic objects must keep value-change wake semantics; a generic pool controller is insufficient. | RQ backlog |

Seeds were frozen offline before evidence lookup and do not count as raw/family/proposal items. No result-aware substitution occurred.
