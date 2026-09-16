# S6-JS-PREFIXBOUND Revision1 Closing Precommitment

- Assignment: `STAGEA-G2-20260809-S6-JS-PREFIXBOUND-R1-CLOSING`
- Topic: `S6-JS-PREFIXBOUND`
- Reviewer role: long-lived Stage A gate lane 2
- Review mode: independent re-review of the frozen initial candidate, initial gate, and revision1 only
- Candidate execution: not performed
- Stage B execution: not performed and not authorized
- Revision remaining: `0`
- Mechanism pivot remaining: `0`

## Frozen decision rule

The initial gate's atomic revision gate is `CONTRACT_FAITHFUL_COSTED_NONVACUITY_GATE`. A positive closing decision requires all of the following within the frozen finite object:

1. the original cardinality and NDV formulas are implemented exactly;
2. exact, full-vector, compact, signature-audit, and bound-oracle costs are separated and charged;
3. exact optimum is preserved;
4. compact class ids reproduce the full-vector equality relation if the one allowed compact pivot runs;
5. the audited bound never overestimates;
6. the selected representation has either strictly positive deterministic work residual or strictly positive deterministic retained-payload residual;
7. the primary and replay agree on all nonvolatile fields.

The terminal triggers are frozen as follows:

| Observation | Closing action |
|---|---|
| Any optimum mismatch, compact-equivalence mismatch, future-equivalence counterexample, or bound overestimate | `STOP` |
| Full vector absorbed and the one allowed compact representation has no positive deterministic local residual | `STOP` |
| All correctness gates close and at least one predeclared deterministic residual remains | consider `PASS_RECOMMENDED`, subject to Tier B paper-shape review |
| Academic potential survives but the core route requires durable human-only capability | `RESERVE_RECOMMENDED` |
| Pre-observation resource failure prevents any claim-bearing observation | `BLOCKED_USER_ACTION_REQUIRED` |

No additional `REVISE_ONCE` or mechanism pivot is legal in this closing review.

