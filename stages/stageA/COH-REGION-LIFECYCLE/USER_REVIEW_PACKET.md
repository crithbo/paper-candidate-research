# COH-REGION-LIFECYCLE — User Review Packet

## Recommendation

`PASS_RECOMMENDED` to an independent Stage A gate, at `TIER_B_Q2_VIABLE`, with evidence ceiling `ANALYTICAL_TRACE_SOFTWARE_ONLY`.

This does not authorize Stage B. Registry still has `stageb_user_approval_id: null`. Even if the independent gate passes, the topic must stop at `PENDING_USER_STAGEB_REVIEW` until you inspect this packet and explicitly approve this topic.

## What was actually established

- A public GH200 ATS/NUMA memory-mode contract and two immutable-after-init Altis programs were frozen.
- B0 system allocation, B1 demand UVM, B2 advice/prefetch UVM, B3 explicit copy, and B4 region-wise oracle were represented in one cold-path normalized ledger.
- A deterministic 6,912-point analytical counterexample search was executed twice and reproduced exactly.
- Both programs have at least one mixed lifecycle region outside every one uniform B0–B3 policy: `PRELIMINARY_SUPPORT` for non-empty decision space.

## What was not established

- No GH200 was available or used.
- The local RTX 4070 is not the same object and produced no candidate performance result.
- No elapsed time, speedup, PTE/fault, migration, C2C, energy, RTL, FPGA, PPA, or silicon claim exists.
- B4 absorbs the physical action union by construction. A simple deployable per-region selector may still absorb the proposed optimizer.

## Most important positive and negative evidence

| Program | Positive region | Counterexample region | Honest reading |
|---|---:|---:|---|
| Pathfinder | 1,032/3,456 (29.86%); max normalized residual 0.113% | 2,424/3,456 (70.14%) | non-empty but extremely fragile |
| BFS | 3,118/3,456 (90.22%); max 57.83% | 338/3,456 (9.78%) | strong model-conditioned structural heterogeneity |

These percentages are grid coverage, not probabilities. Residuals are normalized model units, not speedups.

## If the independent gate passes

Stage B should not start automatically. The minimum user decision would be whether to authorize:

- resource request `GH200-COH-RL-STAGEB-01`: one bare-metal GH200 ATS/NUMA node; 8 non-exclusive measurement hours plus up to 2 setup hours; CUDA 12.4/R550 or an approved re-freeze; user-space Nsight counters; <10 GiB scratch;
- a same-source Altis B0–B3 harness plus deployable simple region-selector baseline;
- one orthogonal GPU-initialized/reuse workload such as Qiskit Quantum Volume or SRAD.

Rollback: delete only the candidate-local build/results and release the node. If the same-mode contract fails, or tuned B2/B3/simple selector closes the full-cost residual on both workloads, the direction should `STOP`. If only hardware access is unavailable, prefer `HUMAN_RESEARCH_RESERVE`.

## Review pointers

- Main assessment: `STAGEA_REPORT.md`
- Exact frozen scope: `EXPERIMENT_CONTRACT.yaml`
- Detailed results and evidence ceiling: `RESULTS.md`
- Q1/Q2 gap calibration: `Q1_COMPARATOR_MATRIX.md`
- Exact commands and anomaly record: `COMMAND_LOG.md`
- Reproducibility: `results/validation.json`

