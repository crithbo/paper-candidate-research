# COH-REGION-LIFECYCLE Stage A Report

- Decision: `PASS_RECOMMENDED`
- Quality tier: `TIER_B_Q2_VIABLE`
- Evidence ceiling: `ANALYTICAL_TRACE_SOFTWARE_ONLY`; no GH200/GPU performance, hardware, RTL, synthesis, FPGA, P&R, PPA, or silicon evidence
- Novelty route: `N2`
- Stage semantics: real pilot research on the highest-risk premise; PASS is not completion of the paper main claim.

## Frozen contract

`EXPERIMENT_CONTRACT.yaml` freezes GH200 ATS hardware-coherent mode, CUDA 12.4.0 / R550.54.14, 64 KiB pages, access-counter migration, disabled AutoNUMA, Altis commit `042e2926…`, Pathfinder size 1, BFS 65,536, same-function rules, B0–B4, normalized metrics, full-cost components, the deterministic grid, stop rules, and exact commands. CDMM, HMM, RTX 4070, multi-GPU, and oversubscription are outside the object.

## Headroom or theoretical gap

The direct GH200 anchor shows that CPU-initialized one-pass regions can favor system memory while GPU-initialized or repeatedly accessed regions can favor managed/device placement. The Stage A question is whether this heterogeneity survives a common ledger after planner cost. The executable probe found at least one positive mixed region in both locked programs, so the decision space is not empty in the frozen model. B4 absorbs all physical actions by construction; only an N2 selection/optimization residual remains.

## Minimal mechanism and strongest baselines

The minimal mechanism extracts a region/lifecycle tuple and exhaustively selects one of B0 system-first-use, B1 demand UVM, B2 advice/prefetch UVM, or B3 explicit copy per region. B4 is a per-region union oracle ceiling, not a deployable baseline. The candidate adds extraction/planning overhead and falls back to the best single policy when mixing is not beneficial.

## Natural workload and mechanism-specific prediction

- Pathfinder: large CPU-initialized one-pass wall should remain system-backed when C2C is cheap, while repeated ping-pong state should use managed/device-local behavior.
- BFS: immutable node/edge arrays should sometimes remain system-backed while repeated frontier/cost state and the alternating host-visible flag use a different policy.

Both predictions occurred in the model; both also have explicit counterexample regions.

## Highest-risk probe result

- Risk-bearing premise: one same-mode B0–B3 ledger is definable and contains non-uniform region plans outside any single uniform policy.
- Probe/counterexample-search scope: two Altis programs × 3,456 deterministic coefficient combinations = 6,912 points; full per-region enumeration; planner cost and B4 ceiling charged.
- Negative-result meaning: if neither program had a positive mixed residual, the direction would be killed; this did not occur. Pathfinder nevertheless loses or is absorbed in 70.14% of the grid, and BFS in 9.78%.
- Positive-result ceiling: `PRELIMINARY_SUPPORT` for non-empty model decision space; `NOT_FALSIFIED` for a future deployable advantage; never `MAIN_CLAIM_ESTABLISHED`.

## Directional increment

- Performance/quality/Pareto/complexity effect: no measured performance effect. Analytical normalized residual ranges are Pathfinder `[-2.293%, +0.113%]` and BFS `[-0.615%, +57.834%]`; these are model sensitivities, not speedups.
- Why it is not ordinary tuning or a weak-baseline artifact: the frozen question is a finite joint selection problem across representation, initializer legality, and lifecycle materialization, with B0–B3 and B4 explicitly represented. The result remains vulnerable to a deployable simple per-region selector, which is a mandatory Stage B baseline.

## Performance evidence chain, if applicable

- Algorithm/data-structure change: region/lifecycle extraction plus finite per-region action selection.
- Intermediate mechanism metric: selected action diversity, uniform-policy absorption, and oracle/planner gap.
- End-to-end effect: unavailable; no GH200 run.
- Full-cost result: analytical normalized ledger only; planner overhead can erase Pathfinder gains.
- Generality region: locked immutable-after-init Pathfinder and BFS structures within the ATS model.
- No-gain or regression region: 70.14% of Pathfinder and 9.78% of BFS grid points; B4 always dominates before equal planner overhead.

## Current critical-cost analysis

The decision turns on C2C remote cost, migration/prefetch/copy ratio, system/managed/device allocation overhead, fixed action/sync overhead, access-counter delay, and extraction/planning overhead. The most dangerous omitted terms are real PTE creation/fault replay, page-granular amplification, asynchronous overlap, context initialization, allocator teardown, capacity pressure, and driver-specific access-counter behavior. They are named blockers to a performance claim, not silently zeroed evidence.

## AI execution ledger

- AI executability class: `AI_CORE_CONDITIONAL`
- Measured ai_core_fraction: `0.62` of the full claim-critical path (100% of this Stage A software probe; GH200 harness, measurement, counter calibration, and final collision closure remain hardware/resource dependent)
- Reproducible commands/artifacts: `PROBE_SCRIPT.py`, `VALIDATE_SCRIPT.py`, `LOCKED_INPUTS.json`, two exact result trees, `COMMAND_LOG.md`, and SHA-256 manifest.
- Human-only items: GH200 access/scheduling, privileged/system mode confirmation, equipment policy, and any unpublished ownership/driver constraints.

## Mechanism pivot, if used

None. The object, metrics, and workloads remained unchanged.

## Literature collision update

- `DIRECT_SUBTRACT`: CUDA 12.4 access-counter migration and legal advice/prefetch are included in B0/B2; generic UVM placement is not claimed.
- `METHODOLOGICAL_ADJACENT`: TPP and HPCA 2026 ARIADNE provide principled/dynamic placement bars.
- `DEPLOYMENT_BASELINE`: system ATS, demand UVM, advised/prefetched UVM, explicit copy, plus a deployable simple region selector in Stage B.
- Same-platform narrower systems: MLSys 2026 SuperInfer and OSDI 2026 DirectKV subtract GH200 KV placement/zero-copy claims.
- CUDA 13.0+ CDMM is a distinct management-mode boundary and is excluded, not merged.
- Status: `SEARCH_BOUNDED_OPEN_WITH_DIRECT_SUBTRACT`; no `DIRECT_FATAL` same-object lifecycle solver was found in the bounded refresh, but Stage B must close the search.

## Stage B minimal prototype

- Primary workload: buildable Altis Pathfinder and BFS from the locked commit, with B0–B3 paths implemented in one source/harness on an authorized GH200 ATS/NUMA node.
- Required orthogonal validation: Qiskit Quantum Volume or SRAD GPU-initialized/reuse case; calibrated PTE/fault/migration/C2C counters; simple deployable per-region selector and B4 ceiling.
- Candidate Q1 venue family: ASPLOS/EuroSys/HPCA systems-mechanism family; no venue guarantee.

Conditional resource request `GH200-COH-RL-STAGEB-01`: one bare-metal GH200 ATS/NUMA node, 8 non-exclusive measurement hours plus up to 2 setup hours, CUDA 12.4/R550 image or a mainline-approved re-freeze, user-space Nsight Systems/Compute counters, <10 GiB scratch. Rollback is deletion of the candidate-local build/results directory and release of the node. Failure consequence is `RESERVE_RECOMMENDED` or `STOP` depending on whether the contract or residual fails. This request is not authorization to start Stage B.

## Q1/Q2 evidence-gap review

- Comparator file: `Q1_COMPARATOR_MATRIX.md`
- Updated reference set: TPP (ASPLOS 2023), Schieffer et al. (ICPP 2024), SuperInfer (MLSys 2026), ARIADNE (HPCA 2026), DirectKV (OSDI 2026).
- Status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP`
- Evidence already comparable: explicit object, finite baseline ledger, program-structure extraction, counterexamples, deterministic artifact.
- Executable Stage B gaps: scalable/deployable solver, same-source B0–B3 harness, simple-selector baseline, GH200 cold/steady ledger, counters, orthogonal workload, calibrated model.
- Human/resource-dependent gaps: GH200 hardware and system-image/counter permissions.

## Non-relaxable quality audit

- Same-object: frozen GH200 ATS/NUMA tuple; local RTX 4070 excluded.
- Latest collision: bounded refresh through 2026-08-09; direct subtractors retained; Stage B closure still mandatory.
- Strong fair baselines: B0–B3 mandatory, B4 ceiling, deployable simple selector added as Stage B obligation.
- Natural input/evidence: two public natural benchmark programs are source/input locked; current result is structural/analytical, not natural GH200 positive performance evidence.
- Full-cost: normalized ledger includes all named critical classes; real coefficients remain unmeasured.
- Reproducibility: two byte-identical replays and 11/11 invariant checks.
- Evidence/claim honesty: analytical/trace/software ceiling is explicit; no GPU/hardware performance claim.

## Supported and unsupported claims

Supported: two immutable-after-init public CUDA programs admit mixed region/lifecycle plans in the frozen analytical model; B0–B3 can be expressed under a common same-mode ledger; a narrow lifecycle-decision-space premise has `PRELIMINARY_SUPPORT`.

Unsupported: GH200 speedup, causal PTE/migration improvement, superiority to a tuned deployable region selector, cross-driver/CDMM generality, Q1 parity, energy/PPA, or main-paper completion.

## Mandatory user gate before Stage B

- Independent Stage A gate decision: pending
- User-facing evidence packet: `USER_REVIEW_PACKET.md`
- `PENDING_USER_STAGEB_REVIEW`: no (mainline may set only after independent gate PASS)
- Stage B user approval id/time: null until explicit approval
- Stage B authorized: false

## Human research reserve, if applicable

Not recommended at this gate because the highest-risk structural premise was not falsified and the Stage A software probe is complete. If authorized GH200 access cannot be obtained, or a same-mode B0–B3 harness cannot be built without object drift, `RESERVE_RECOMMENDED` is preferred over lowering the evidence standard.

