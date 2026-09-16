# WEBGRAPH-REFERENCE-FOREST Stage A Results

## Outcome

- Scientific recommendation: `REVISE_ONCE`
- Quality tier retained conditionally: `TIER_B_Q2_VIABLE`
- Evidence ceiling: `PRELIMINARY_NATIVE_SIZE_SUPPORT__NO_FULL_COST_DOMINANCE__RANDOM_ACCESS_REGRESSION__TWO_NATURAL_GRAPHS_ONLY`
- Claim-bearing observation obtained: `yes`
- Scientific revision consumed: `false` (this was the initial Stage A assignment)
- Stage B: `false`; approval id `null`

The exact complete-action frontier DP is real, same-object and strictly improves native output size on both frozen natural graphs. The initial Stage A acceptance condition nevertheless fails: construction time and peak RSS are higher, and repeated random-list access is slower. No optimizer-speed, full-cost-dominance or paper-main-claim statement is supported.

## Preclaim fidelity result

The nine-node witness passed all gate requirements before the first claim-bearing search:

- independent exhaustive enumeration: `38,372` legal forests;
- exhaustive/candidate/final-BvCompZ optimum: `148 / 148 / 148` bits;
- common reference vector: `0,0,0,0,1,1,0,4,0`;
- candidate visited states/transitions/max frontier: `671 / 2,473 / 256`;
- selected-action estimator→writer and summed-additivity assertions: pass;
- candidate/baseline `.graph`, `.offsets`, `.properties`: pairwise identical SHA-256;
- native sequential, offsets and random readers: pass with equal 4,096-query checksum.

The earlier missing-EF attempt is preserved as `tiny-candidate-audit-failed-before-ef.tsv` and carries no inference.

## Frozen structural killer

| Measure | Result |
|---|---:|
| Frozen cases completed | 2,048 / 2,048 |
| Strict non-tie native divergences | 531 (25.9277%) |
| Tie-only different vectors (excluded) | 45 |
| Identical vectors | 1,472 |
| Exact worse than BvCompZ | 0 |
| First strict case | `case-0043` |
| First-case bits | BvCompZ 561; exact 560 |
| Maximum saving per case | 16 bits |
| Sum of strict-case savings | 1,854 bits |
| Changed reference actions | 2,393 |
| DP states / transitions | 9,065,896 / 35,606,057 |

All input-manifest hashes and all candidate writer/read checks passed. Separate baseline writer replay of `case-0043` reproduced `561` bits; candidate reproduced `560`. Byte padding leaves both `.graph` files at 72 B, but graph and offsets hashes differ and properties record the exact lengths. This is a native structural/action result, not a size-deployment result by itself.

## Natural killer

| Corpus | Nodes / arcs | Strict chunks | BvCompZ bits | Exact bits | Native payload residual | End-to-end time ratio | Peak RSS delta |
|---|---:|---:|---:|---:|---:|---:|---:|
| LAW cnr-2000 native order | 325,557 / 3,216,152 | 2,053 / 2,544 | 9,319,309 | 8,763,554 | 72,793 B (4.897%) | 104.67× slower | +3,690,496 B |
| SNAP Wiki-Vote ascending ID | 7,115 / 103,689 | 54 / 56 | 876,503 | 875,555 | 135 B (0.114%) | 13.04× slower | +2,740,224 B |

`native payload` is `.graph + .offsets + .properties`; adding EF yields residuals of `77,129 B` and `143 B`. Audit-table sums exactly equal separately written BvCompZ/candidate graph-stream lengths. Every output passes native sequential equality, per-node random equality, offsets and stable checksums.

## Reader-only replay

Ten post-warmup repeats per native output show:

| Corpus | Sequential p50 ratio | Sequential p90 ratio | Random-100k p50 ratio | Random-100k p90 ratio |
|---|---:|---:|---:|---:|
| cnr-2000 | 0.975 | 0.897 | 1.094 | 1.083 |
| Wiki-Vote | 1.034 | 0.965 | 1.042 | 1.056 |

Sequential decode has no consistent regression. Random-list access is consistently slower on both graphs. Exact result and query checksums remain equal, so this is a performance tradeoff rather than a semantic defect.

## Acceptance-rule evaluation

| Frozen rule | Result | Reason |
|---|---|---|
| Same native object, legal actions, exact readers | PASS | all native assertions/readers/hashes closed |
| Strict structural native divergence | PASS | 531 non-tie cases |
| Strict persistent natural size residual | PASS | both graphs positive |
| Candidate action coverage | PASS | 25.93% structural cases; 80.70%/96.43% natural chunks strict |
| No build/RSS regression | FAIL | candidate slower and higher RSS on both graphs |
| No random-access regression outside noise | FAIL | repeated p50/p90 regression on both graphs |
| Frozen full-cost success | FAIL | registered no-worse-other-dimensions rule is not met |

The standard size/time Pareto interpretation would call the candidate a tradeoff point because size improves while construction/access worsen. The experiment contract deliberately froze a stricter acceptance rule. Results are interpreted under that rule, so `PASS_RECOMMENDED` is not issued.

## Recommended one revision

Mainline/independent gate should decide whether to authorize one same-object revision with no new corpus or configuration search:

`SCALABLE_DENSE_FRONTIER_AND_EXACT_OPTIMAL_ACCESS_TIEBREAK_GATE`

1. Replace `BTreeMap<Vec<depth>, full-reference-vector>` states with dense base-`D+1` state IDs, rolling cost arrays and compact backpointers while preserving the exact optimum and selected native bits.
2. Reproduce the existing tiny, structural-first-case and both natural exact bit totals/hashes; no new workload selection.
3. Among equal-bit exact optima only, use a preregistered depth/access-minimizing secondary tie-break; primary graph-bit objective cannot change.
4. Repeat the complete cost ledger. If construction remains impractical or random access still regresses beyond the preregistered tolerance, the narrow mechanism should be scientifically stopped under the original full-cost goal.

No revision was executed here.
