# S5-OCCUPANCY-CLIFF-JOINTCODEGEN Stage A Revision Report

- Decision: `RESERVE_RECOMMENDED`
- Quality tier: `TIER_B_Q2_VIABLE` structural potential, moved to `HUMAN_RESEARCH_RESERVE`
- Evidence ceiling: `RESOURCE_ACQUISITION_FAILURE_ONLY`
- Novelty route: `N2`
- Stage semantics: unique Stage A revision; no Stage B authority

## Frozen contract

`REVISION_EXPERIMENT_CONTRACT.yaml` and `SOURCE_MANIFEST.yaml` were frozen and hashed before acquisition. They lock exact LLVM commit `1f112d62e1fa2c4f1a04887abd72da1ed61cf791`, `amdgpu11.00`, explicit wave32, greedy RA, identical pre-scheduler MIR, 2,000 ms/method-region budget, 8–16 AMD-official natural kernels, verifier legality, double replay, 4 GiB storage, and 4 CPU-hours.

The pre-acquisition manifest verified all four frozen control files. None was overwritten after execution.

## Highest-risk revision result

The bootstrap asset download was truncated by 24,067 bytes and raised `ContentTooShortError`. Because publisher SHA-256 acceptance was mandatory, the partial file was rejected. The no-retry contract stopped the workflow before exact LLVM checkout/build.

- Exact toolchain: absent
- Natural MIR: 0
- Baseline/candidate/verifier/replay: not run
- Positive-result ceiling: not applicable
- Negative-result meaning: resource readiness failure, not falsification of the academic mechanism

## Why PASS is impossible

The explicit PASS rule requires at least one natural, verifier-legal, replayable candidate point that strictly improves real occupancy tier or spill count over exact current LLVM under the same budget. Every prerequisite is absent. Cycle proxy or an approximate release LLVM was explicitly forbidden and was not used.

## Why RESERVE rather than STOP

The failure is a bounded transfer/toolchain failure. It does not show that current LLVM reaches the ceiling, that the residual is absorbed, or that no legal non-dominated point exists. Project rules state that AI execution/resource readiness alone is not an academic STOP condition. The conditional Tier B paper shape therefore belongs in human research reserve after the unique automated revision is consumed.

## Algorithm and baseline honesty

The frozen minimal candidate would have selected a frontier among existing exact-LLVM scheduler configurations, each followed by the same greedy RA. Current source shows these knobs already exist. Even if the run had produced a tier/spill point, knob selection alone would remain vulnerable to the “routine tuning” objection and could supply only a Stage A premise check, not the final N2 contribution.

The mandatory production baseline remains exact current `GCNSchedStrategy + greedy`. It was not run and no proxy substituted for it.

## Full-cost and reproducibility

- Network received: 187,480,016 bytes
- Observed wall time to failure: approximately 60 seconds
- Candidate-directory peak: 187,497,398 bytes (178.81 MiB)
- Build/corpus/experiment CPU: none
- Failure record: `results/acquisition_failure.json`
- Exact command/stderr: `COMMAND_LOG.md`
- Automatic retry: none
- Double replay: explicitly recorded as skipped because no executable experiment existed

## Latest collision update

Bounded current-source scan preserves `SEARCH_BOUNDED_OPEN_WITH_DIRECT_SUBTRACT`:

- LLVM already has multi-stage occupancy-aware pressure scheduling, high-RP rescheduling, metric bias, and AMDGPU-specific pressure trackers.
- `llvm-calc-occupancy` is an exact-backend-math tool, making modeled occupancy substitutes unnecessary once a toolchain exists.
- No exact fixed-budget, multi-bank, joint schedule/allocation certificate was located; this remains open, not a global-first assertion.

## Q1/Q2 evidence-gap review

- Comparator: `REVISION_Q1_COMPARATOR_MATRIX.md`
- Status: `PARITY_NOT_PLAUSIBLE`
- Closed gaps: immutable design/source/budget contract and fail-closed acquisition record
- Core open gaps: exact executable baseline, natural MIR, legal candidate, tier/spill result, full compile cost, corpus statistics, orthogonal validation

## Non-relaxable quality audit

- Same-object: `FAIL_NOT_EXECUTED`
- Latest collision: `SEARCH_BOUNDED_OPEN_WITH_DIRECT_SUBTRACT`
- Strong fair baseline: `FAIL_NOT_EXECUTED`
- Natural input/evidence: `FAIL_ZERO_MIR`
- Full-cost: `PASS_FOR_FAILED_ACQUISITION_ONLY`
- Reproducibility: `PASS_FOR_FAILURE_RECORD`; experiment replay unavailable
- Evidence/claim honesty: `PASS`

## Supported and unsupported claims

Supported:

- the frozen acquisition path failed closed on a truncated asset;
- storage and time stayed inside the authorized budget;
- no approximate toolchain or GPU proxy was used.

Unsupported:

- any claim about actual LLVM occupancy, spills, compile time, legality, performance, natural headroom, algorithmic benefit, or paper-level contribution.

## Mandatory authority boundary

- Owner recommendation: `RESERVE_RECOMMENDED`
- `PENDING_USER_STAGEB_REVIEW`: no
- `stageb_user_approval_id`: null
- Stage B authorized: false
- Further automated Stage A revision: exhausted

