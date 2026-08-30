# Exceptional R3G results

## Outcome

Owner recommendation: `STOP_RECOMMENDED__NARROW_FROZEN_MECHANISM`.

The corrected fidelity contract produces a valid scientific negative. On both independent replays, all 20 frozen natural objects selected the same complete-family strongest-union point. The unchanged candidate planner exceeded its equal 120-second per-file selection budget on every object, so the preregistered fallback emitted that exact strongest-union point and charged the attempted candidate planning cost. There is therefore no candidate action, byte, latency or full-cost residual.

| Metric | Replay 1 | Replay 2 |
|---|---:|---:|
| Natural objects | 20 | 20 |
| Executable baseline points/file | 106 | 106 |
| Semantic-equivalent files | 20/20 | 20/20 |
| Candidate budget fallbacks | 20/20 | 20/20 |
| p50 improvement ≥10% | 0/20 | 0/20 |
| p90 candidate non-worse | 8/20 | 11/20 |
| size ratio ≤1.05 | 20/20 | 20/20 |
| median size ratio | 1.000000 | 1.000000 |
| strict full-cost residual | 0/20 | 0/20 |
| median candidate/union full-cost ratio | 6.7568297801× | 6.7330471630× |
| median p50 improvement | −1.1760% | +2.0963% |
| median p90 improvement | −0.9106% | +0.7202% |
| peak RSS conservative process-sum | 1,380,700,160 B | 1,356,062,720 B |

Across all 40 result records, the full-cost ratio range is `5.9975117232×–7.5564025755×`; no ratio is below 1. The small positive and negative Latin-timed query differences are noise around identical output bytes and hashes, not a candidate speedup.

## Fidelity and replay

- 40/40 selected-arm and fallback outputs pass Arrow/schema/row-group equivalence.
- 20/20 paired replay records match on all frozen non-timing fields.
- 20/20 union output hashes and 20/20 candidate output hashes match across replays.
- Within every file/replay, candidate fallback hash equals strongest-union hash.
- Exact source and output hashes are in `artifacts/exact_hashes.tsv`.
- Complete per-file timing/cost values are in `artifacts/per_file_summary.tsv`; full JSON is retained under each replay directory.

## Full-cost ledger

Shared preprocessing and shared verification are split 50/50. Complete-family enumeration/materialization/scoring/selection is charged only to union; the isolated unchanged DP/retention planner is charged only to candidate; each arm owns its deploy write and all Latin warmup/measured query cost. All baseline temporary materializations are counted even though deleted after hashing.

- completed claim-run CPU: `7,061,140,625,000 ns = 1.9614279514 h`;
- completed claim-run wall: `5,614,021,182,400 ns = 1.5594503284 h`;
- baseline temporary bytes written and deleted: `5,498,527,070 B`;
- conservative logical query-read upper bound: `11,522,287,040 B`;
- final on-disk package before reports/manifest: `113,954,403 B`;
- network: `0 B`; GPU/exclusive device: `false/false`.

Three fail-closed diagnostic executions preceded the final completed pair: serial family enumeration was stopped at the 120-second boundary; two-worker enumeration was likewise stopped; four-worker enumeration closed baseline selection but exposed the candidate 120-second overrun. They produced no `result.json`. Their exact CPU was not retained, so the package does not invent a point estimate; a conservative concurrency×wall bound is `<0.30 CPU-hours`. Completed runs plus this bound remain `<2.27 CPU-hours`, below 4 hours.

## Decision kernel

The negative is not based on small sample size, readiness, or resource failure. It is based on a contract-faithful same-object observation: complete current union selection finishes within the frozen selection budget, while the unchanged candidate does not; its required fallback is the selected union itself and adds roughly 120 seconds of charged planning. Consequently action rate is `0/0` after fallback, p50 gate is `0/20` in both replays, p90 gate fails, and strict full-cost residual is `0/20` in both replays.

