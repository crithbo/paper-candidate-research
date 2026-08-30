# Stage A results

## Owner outcome

`RECOMMEND_STAGEA_STOP_TO_INDEPENDENT_GATE` / `BELOW_Q2_STOP`.

This is an owner recommendation, not a mainline or independent-gate final decision. The decisive registered killer is:

`NO_HELDOUT_P50_P90_PRIMARY_OR_FULL_COST_RESIDUAL_AGAINST_COMPLETE_EXECUTABLE_UNION`.

## Integrity and fidelity

- Pre-claim gate: `PASS` before any accepted natural result.
- Frozen natural corpus: 24 official TFLite Micro models at commit `18b9e6f2a8c5a9518e588f59c2ba16ef7ef9d551`; 11 train and 13 held-out, separated by model family before outcomes.
- Native arms: 8 per model, 192 outputs total.
- Stock verifier, generated reader, `TFL3` identifier, canonical values/presence/vector-key/identity digest and applicable reader-visible force alignment: `192/192 PASS`.
- Generated object-API `Pack` remained same-object on all 24 selected models and therefore is an eligible strong current-native baseline.
- The first post-gate one-model harness debug attempt emitted an ineligible equality-mismatched direct buffer because recursive graph extraction retained an invalidated vector reference. The result was rejected, the mechanical extractor bug was corrected without changing the object, action grammar, planner, beam width or metrics, and only the later 192 all-valid rows enter this analysis.

## Tiny exact ceiling

| Case | Exhaustive paths | Unique native byte images | Candidate state merges | Distinct-raw last-use merges | Exact frontier equality |
|---|---:|---:|---:|---:|---|
| alias/vtable/alignment | 192 | 60 | 182 | 182 | PASS |
| shared-string/alias | 432 | 12 | 88 | 44 | PASS |
| keyed-vector/force-align | 512 | 76 | 294 | 88 | PASS |
| total | 1,136 | 148 | 564 | 314 | PASS |

Every path used the pinned stock builder and passed the stock verifier/reader, identifier, identity and applicable alignment checks. Generated/direct default baselines also passed. This establishes implementation fidelity and exact-on-tiny quotient correctness, not a natural benefit.

## Natural mechanism observation

The quotient was not vacuous: 22/24 natural models produced at least one strict merge between distinct raw prefixes; the candidate observed 886 such merges over 156,163 expanded transitions. Two larger hello-world models hit the preregistered 20,000-transition cap and used the deterministic stable fallback. The raw merge incidence was 0.567% overall (0.763% on nonfallback runs). This ratio is reported as mechanism telemetry, not substituted for the separately defined useful residual-action fraction.

Thus the mechanism exists on natural objects, but its selected plans did not produce useful union residual.

## Complete-union residual

For every model, the comparator union includes generated default, stable legal topo, hot-first ready, applicable config arms, local field-order planning and the same-width/cap generic beam. Positive percentages below mean the candidate is worse than the best eligible union arm for that same model.

| Held-out metric, candidate minus best union | p50 | p90 | Direction |
|---|---:|---:|---|
| raw bytes | +2.362% | +4.180% | worse |
| frozen weighted address distance | +165.980% | +283.061% | worse |
| warm native reader | +0.499% | +1.154% | worse |
| cold/evicted native reader | +0.691% | +1.711% | worse |
| builder wall time | +49.454% | +78.125% | worse |

Across all 24 models the candidate had `0` raw-byte wins/ties and `0` weighted-distance wins/ties against the union. On held-out models it recorded 2 isolated warm-reader and 3 isolated cold-reader minima, but neither survived p50 or p90, and they coincided with worse bytes, distance, construction and nonzero planning cost. They are retained as noisy per-model observations, not promoted to a primary benefit.

Candidate planning cost on held-out models was 43.683 ms p50 / 104.179 ms p90 wall and 44.0 ms p50 / 104.2 ms p90 CPU; planner state labels were 393 p50 / 425 p90. Two of 13 held-out models fell back.

No candidate point meets the preregistered requirement of a real pack-size or access primary benefit at both held-out p50 and p90 with full costs included. Higher planner cost cannot manufacture Pareto novelty.

## Train/held-out consistency

| Split | Models | Byte delta p50/p90 | Warm-reader delta p50/p90 | Cold-reader delta p50/p90 | Builder delta p50/p90 |
|---|---:|---:|---:|---:|---:|
| train | 11 | +3.106% / +6.410% | +1.527% / +3.235% | +0.440% / +2.528% | +47.635% / +74.779% |
| held-out | 13 | +2.362% / +4.180% | +0.499% / +1.154% | +0.691% / +1.711% | +49.454% / +78.125% |

The negative direction is not confined to held-out families; it already appears in training families.

## Full-cost boundary

Measured per output: profile graph extraction, candidate/generic planning wall/CPU/RSS/states/transitions/backpointer proxy, fresh-builder wall/RSS/calls, raw bytes, stock verification, 5,000-repeat warm generated-reader access, 50-repeat 8 MiB eviction/cold generated-reader access, weighted-distance cache proxy, config arm and fallback. Workspace remained approximately 0.96 GB and all execution was public CPU only; the cumulative run was far below 4 CPU-hours.

The cold metric includes the fixed 8 MiB eviction traversal and is intentionally compared only under the identical denominator. No cache-miss counter or hardware claim is inferred from weighted distance.

## Decision logic

The candidate passed fidelity and exhibited strict natural quotient compression, so the result is not a resource failure, proxy failure, or proof that the mechanism cannot exist. It nevertheless fails the bounded Stage A scientific premise: the global reuse-closure planner yielded no required held-out p50/p90 raw-byte or measured-access residual against the complete executable union, while adding planning and construction cost. The frozen killer therefore fires.

Evidence ceiling: `BOUNDED_NATURAL_NATIVE_STAGEA_NEGATIVE__OWNER_NONFINAL`.
