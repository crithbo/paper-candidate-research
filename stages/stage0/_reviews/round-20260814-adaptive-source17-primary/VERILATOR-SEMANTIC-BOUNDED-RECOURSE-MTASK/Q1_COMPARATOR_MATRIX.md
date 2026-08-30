# VERILATOR-SEMANTIC-BOUNDED-RECOURSE-MTASK — Q1/Q2 comparator

- Stage: `STAGE0`
- Candidate venue family: EDA / RTL simulation / online scheduling
- Calibration status: `PARITY_CONDITIONAL`
- Quality tier: `TIER_B_Q2_VIABLE`
- Cutoff: 2026-08-14

## Reference set

| Role | Anchor | Status/source | Read scope | Calibration role |
|---|---|---|---|---|
| Contribution-shape anchor | Verilator multithreaded internals | official current internals | scheduler, partitioner, MTask, runtime schedule, TODOs | establishes the unusually strict semantic contract and the native gap |
| Evaluation anchor | Verilator Thread-PGO guide | official current guide | profile collection/re-Verilation/full model path | requires static PGO as a first-class baseline |
| Domain neighbor | Sarkar, *Partitioning and Scheduling Parallel Programs for Multiprocessors* (1989) | cited by current Verilator internals | partition/coarsening tradeoff | method ancestor, not same-object collision |
| Boundary anchor | Verilator “Efficient Dynamic Scheduling” / “Static Scheduling with Runtime Repack” TODOs | official current internals | runtime graph follower and repack boundary | documents the exact unimplemented action; it is not evidence of success |

## Comparator matrix

| Dimension | Candidate if gate closes | Anchor evidence | Gap | Disposition |
|---|---|---|---|---|
| Problem | fragmentation from predicted/actual MTask cost mismatch under exact SV semantics | native docs identify fragmentation and cost-estimate weakness | natural magnitude unmeasured | executable Stage A gap |
| Contribution | semantic bundle recourse algorithm + guarantee | static partitioner and PGO are current | must avoid generic ready-queue restatement | revision gate |
| Baseline | static partition + count grid + Thread-PGO | all native controls documented | full replay required | fair plan frozen |
| Correctness | exact trigger/active/NBA trace | `V3Sched`/`V3Order` semantics | two-plan proof absent | revision gate |
| Evidence | public RTL, source trace, full cost | Verilator/CVA6 route | results absent but not a Stage0 failure | Stage A |
| Generality | two public RTL carriers | current native framework | second carrier unchosen | bounded Stage A gap |
| Reproducibility | pinned code/action catalog | current master docs/source | immutable SHA missing due local TLS | revision gate |

## Reviewer-shape assessment

The paper shape is credible Q2 only if the contribution is a semantics-aware bounded-recourse constructor with a clear theorem or certified frontier, not a deployment controller. It is not yet near-Q1: breadth, theory and natural-result scale are unclosed. Missing output is a readiness fact, not a structural STOP.

- Status: `PARITY_CONDITIONAL`
- Invalidation: complete current native action catalog already permits equivalent runtime repacking, or the only algorithm is generic dynamic DAG scheduling.
