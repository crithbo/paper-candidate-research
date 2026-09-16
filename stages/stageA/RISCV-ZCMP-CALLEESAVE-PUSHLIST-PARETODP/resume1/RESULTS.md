# Results

## Outcome

Owner recommendation: `STOP`, subject to independent Stage A gate review.

This is a bounded scientific negative, not a resource failure. The PRE_CLAIM gate passed before the natural result. The exact candidate and complete current union preserve the same RV32 MachineFunction behavior, target/features, ABI and native writer/reader chain.

## Denominator

- Official natural corpus: Embench-IoT `embench-1.0`, commit `0466a18e4f6b47e19598d7c6ba72916d54b68f65`, GPL-3.0.
- Canonical modules: 23; functions screened: 273.
- Initial result-independent eligibility: 5 functions.
- Exact single-function replay eligibility: 4 functions. `freeecc` was excluded before candidate-versus-union observation because its regenerated pre-greedy MIR had no scalar virtual register live across the call.
- Retained functions: `aes_invert_key`, `sha256_init`, `sglib_rbtree_add`, `sglib_rbtree_it_next`.

## Native execution

- Candidate: 11/11 legal plans passed MachineVerifier, assembly, relocatable linking and both readers.
- Strongest current union: 72/72 arms passed (18 arms × 4 functions).
- Small witness: Plan P and Plan S both pass; DP and independent oracle match for all widths `0..4`.
- Same-object failures: 0 among accepted natural points.

## Primary result

For every retained natural function, the best candidate point has exactly the same complete function text bytes and frame bytes as a point in the executable current union:

| Function | Candidate best text/frame | Union best text/frame | Candidate planner-inclusive CPU overhead |
|---|---:|---:|---:|
| `aes_invert_key` | 28 B / 16 B | 28 B / 16 B | +0.156250 s |
| `sha256_init` | 38 B / 16 B | 38 B / 16 B | +0.218750 s |
| `sglib_rbtree_add` | 28 B / 16 B | 28 B / 16 B | +0.156250 s |
| `sglib_rbtree_it_next` | 16 B / 16 B | 16 B / 16 B | +0.218750 s |

Paired candidate-minus-union p50/p90 are `0/0 B` for function text and `0/0 B` for frame. Planner-inclusive CPU is `+0.156250/+0.218750 s`; wall is `+0.176621/+0.255073 s`.

Eight of 11 candidate assemblies are hash-distinct from the finite union, but none has a strict registered primary benefit. The useful residual is therefore `0/4 = 0%`, below the preregistered `10%` minimum. Raw action distinctness (`8/11`) cannot substitute for useful residual.

## Interpretation boundary

Supported: in this frozen bounded one-call scalar class and canonical natural pilot, the candidate's best executable points are absorbed by the complete current union on primary metrics and add planning cost. This fires `CURRENT_UNION_COVERS_ALL_CANDIDATE_EXECUTABLE_POINTS`, `NATURAL_ELIGIBLE_RESIDUAL_BELOW_10_PERCENT`, and the no-primary-benefit full-cost rule.

Not supported: a theorem about arbitrary CFGs, all RISC-V programs, unbounded register allocation, runtime performance, or general Zcmp uselessness. Runtime was unavailable and not estimated. The owner does not make the final state transition.

Evidence ceiling: `BOUNDED_STAGEA_SCIENTIFIC_NEGATIVE__OWNER_RECOMMENDATION__INDEPENDENT_GATE_REQUIRED`.
