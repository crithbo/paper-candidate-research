# GIT-PACK-FOREST Stage A Report

- Lane id: `CANDIDATE-EXECUTION-LANE-3`
- Assignment id: `STAGEA-L3-20260809-GIT-PACK-FOREST-INITIAL`
- Input freeze SHA-256: discovery `736638AED4B1C05137301A03C0D6FEF0FFA50E08CE7B11CA60AA5ADBC9980C12`; primary `5BE1D727E9904794272B7593475841A1DB645B6D836F82036766F45ECA59214A`; confirmation `712E5D2ADF5813C6B1E92D98100699892D7ECEA40264495F5B0BA2F9EC4D29B4`; corpus lock `22985F5747AC66717BF35557951FE542AEE43BB6FE4B141DCB819EB1B418A1DB`
- Cross-assignment contamination declaration: `NONE`; no other candidate evidence was read and no other assignment was accepted.
- Decision: `STOP`
- Quality tier: `BELOW_Q2_STOP`
- Evidence ceiling: `BOUNDED_NATURAL_20_REPOSITORY_GIT_2_55_NEGATIVE__NO_GENERAL_IMPOSSIBILITY_CLAIM`
- Novelty route: `N2`
- Stage semantics: real bounded highest-risk pilot; no paper main claim or Stage B execution.

## Pre-claim contract fidelity gate

- Gate status: `PASS_NATIVE_GIT_CODEC_AND_FULL_COST`
- Frozen atomic actions mapped to implementation paths:
  - action graph and actual native delta costs: `scripts/run_pilot.py::build_candidate_graph`;
  - global complete-manifest bounded-depth forest: `scripts/run_pilot.py::joint_constructor`;
  - locality-aware base-before-child legal order coupled back to the forest: the same `joint_constructor` fixed-point loop;
  - pack v2/SHA-1/self-contained REF_DELTA writer: `scripts/git_pack_lib.py::custom_pack_bytes`;
  - Git 2.55 delta and zlib semantics: `make_git_2_55_delta` and `git_native_zlib_compress`;
  - strict checker, canonical identity and access: `scripts/run_pilot.py::validate_pack`.
- Comparator implementation/parameter/semantic audit: ten individually realizable Git 2.55 configurations, two deterministic simple constructors, Edmonds+depth-repair+family-order, and tiny exact ceiling; no fictional universal combination.
- Native codec/solver/checker/reader/format parity: 38/38 delta and 38/38 zlib byte parity; Git strict reader/checker; pack v2/SHA-1/REF_DELTA; 20/20 repositories correct twice.
- Metric denominator and unit parity: residual denominator is exactly candidate selected useful delta edges; size is pack+index bytes for the identical manifest; time is seconds; memory/storage is bytes.
- Full-cost dimensions and collection paths: construction/index CPU/wall/RSS, graph/optimization, pack+index, strict verification, fixed cold/warm access, reconstruction span, workspace/failure/fallback ledger; see `results/FULL_COST.json`.
- Small legality/equivalence/object-identity witness: `results/PRECLAIM_WITNESS_NATIVE_CODEC.json`, 115/115 objects, legal depth-1 edge, final native compressor, strict checks and access measurement.
- Non-claim-bearing proxy/control outputs retained: `results/initial`, `native-*`, `claim-*`, `final-*`; classifications in `RESULTS.md`.
- Claim-bearing run started only after PASS: `true`; only `codec-final-initial` and `codec-final-replay`.

## Frozen contract

Input is one pinned public natural repository commit's complete reachable canonical object manifest. Output is one self-contained, non-thin, unfiltered Git pack v2 plus index, with SHA-1 object identity, Git 2.55 `diff-delta`, frozen Git zlib 1.3.2 level 6, unchanged object set/content and strict equality. Twenty frozen repositories cover 7/7/6 source-heavy, renamed/vendored and low-similarity strata.

## Headroom or theoretical gap

The hypothesized headroom was a set of useful delta-parent/write-order actions unavailable to any current Git 2.55 union member. The measured headroom is zero under the preregistered conservative action-space test: 0 outside edges among 832 selected useful edges in each run.

## Minimal mechanism and strongest baselines

The candidate iterates between a complete-manifest depth≤8 forest (explicit roots for nonselected objects) and a locality-aware legal priority order. Parent scores use current order distance; the next order uses selected parent representation cost and child-unlock savings. This is not a post-hoc traversal of a fixed branching. The comparator set and exact semantics are detailed in `EXPERIMENT_CONTRACT.yaml` and `Q1_COMPARATOR_MATRIX.md`.

## Natural workload and mechanism-specific prediction

Prediction: on renamed/vendored or naturally recurring source histories, the coupled constructor would choose at least 10% useful parent actions beyond normal/name/path/window Git actions and obtain a real pack-size or access benefit. Result: residual is zero in every stratum; benefit count is zero in both runs.

## Highest-risk probe result

- Risk-bearing premise: the candidate exposes a real action residual rather than combining known branching and write-order parts already covered by Git.
- Probe/counterexample-search scope: 20 public repositories, 7,016 complete reachable objects, 832 selected useful edges/run, full current union, two final runs.
- Negative-result meaning: strongest-union absorption of the defining N2 under the frozen scope; scientific STOP.
- Positive-result ceiling: not applicable; no positive candidate result. The Stage A maximum would have been `PRELIMINARY_SUPPORT`, never `MAIN_CLAIM_ESTABLISHED`.

## Directional increment

- Performance/quality/Pareto/complexity effect: no primary increment. Candidate size residual p50 is -55.2955% and p90 -6.8404%; cold/warm p50 are negative in both runs.
- Why it is not ordinary tuning or a weak-baseline artifact: the implementation is a real coupled constructor and differs from classic on 18/20 repositories, but the fair union still absorbs all useful actions. The negative result is therefore not based on a dummy candidate.

## Performance evidence chain

- Algorithm/data-structure change: capped natural-content action graph → complete bounded-depth forest ↔ locality-aware legal order.
- Intermediate mechanism metric: 832 selected useful edges; 0 outside the conservative union; forest differs from classic 18/20.
- End-to-end effect: no reproducible size or access benefit.
- Full-cost result: measured CPU 721.203125/769.859375 seconds; peak RSS 102,514,688/105,988,096 bytes; recorded pilot/control conservative CPU upper 7,773.765625 seconds; post-analysis/pre-manifest workspace checkpoint 3,039,633,317 bytes. Pre-claim network acquisition CPU was not individually instrumented and is disclosed separately.
- Generality region: frozen 20-repository SHA-1 Git-pack scope only.
- No-gain or regression region: all three corpus strata; renamed/vendored has the largest median size regression.

## Current critical-cost analysis

Candidate graph/precompute costs about 21.57/21.15 wall seconds summed across repositories. Candidate construction, including graph/optimization, pack writing and index creation, costs 121.53/121.47 wall seconds. Full cost does not rescue the candidate because it has no primary benefit and fails the earlier residual gate.

## AI execution ledger

- AI executability class: `AI_CORE_EXECUTABLE`
- Measured ai_core_fraction: `1.00` (6/6 claim-determining work packages—freeze, implementation, comparator, execution, verification, analysis—were AI-executed and artifacted).
- Reproducible commands/artifacts: `COMMAND_LOG.md`, `scripts/`, `inputs/`, `results/`, `EXPERIMENT_CONTRACT.yaml`.
- Human-only items: assignment authorization, future mainline/gate adjudication; no human core implementation or measurement.

## Mechanism pivot

No scientific `MECHANISM_PIVOT` and no scientific `REVISE_ONCE` were used. Pre-claim fidelity repairs only corrected implementation/instrumentation and retained every invalid control.

## Literature collision update

Latest bounded audit remains `SEARCH_BOUNDED_OPEN`: no direct paper was found that exactly implements the frozen coupled Git constructor. Boffa et al. JSS 2025, Ouyang WISE 2002, Finesse FAST 2019 and LoopDelta ATC 2023 subtract generic graph, similarity and locality claims. Stage A nevertheless stops the candidate because the current Git union absorbs its measured useful action space.

## Stage B minimal prototype

- Primary workload: not applicable after STOP.
- Required orthogonal validation: not applicable.
- Candidate Q1 venue family: systems/storage/software engineering calibration only; no Stage B or venue push is recommended.

## Q1/Q2 evidence-gap review

- Comparator file: `Q1_COMPARATOR_MATRIX.md`
- Updated reference set: Git 2.55; Boffa et al. JSS 2025; Ouyang WISE 2002; Finesse FAST 2019; LoopDelta ATC 2023.
- Status: `PARITY_NOT_PLAUSIBLE`
- Evidence already comparable: exact object, native codec, current union, 20 natural repos, full cost, strict checks and replay.
- Executable Stage B gaps: none for this stopped N2.
- Human/resource-dependent gaps: none relevant to the STOP.

## Non-relaxable quality audit

- Same-object: PASS, 20/20 twice, complete canonical equality.
- Latest collision: bounded open; no exact-object direct fatal imported.
- Strong fair baselines: PASS, current Git 2.55 union plus simple/classic/exact controls.
- Natural input/evidence: PASS, 20 pinned public histories.
- Full-cost: PASS after pre-claim RSS/index/native-compressor repairs.
- Reproducibility: scientific decision reproduced; byte hashes partial and explained.
- Evidence/claim honesty: invalid controls retained; ceiling is narrow; no general impossibility claim.

## Supported and unsupported claims

Supported: under this frozen 20-repository contract, the implemented coupled N2 has 0/832 useful action residual twice, no reproducible primary benefit, and should stop before Stage B.

Unsupported: no Git pack constructor can ever beat Git; all public repositories behave identically; generic delta forests are useless; a paper-level impossibility theorem; any Stage B conclusion.

## Mandatory user gate before Stage B

- Independent Stage A gate decision: not yet performed; owner recommends STOP handoff.
- User-facing evidence packet: `USER_REVIEW_PACKET.md`
- `PENDING_USER_STAGEB_REVIEW`: no
- Stage B user approval id/time: `null`
- Stage B authorized: `false`

## Human research reserve

Not applicable. This is a scientific strong-baseline STOP, not an AI-capability reserve or resource blocker.

## User-action blocker

Not applicable. Claim-bearing observations completed; evidence ceiling is scientific, not `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`.

## Lane state

`DELIVERY_COMPLETE_AWAITING_MAINLINE_ACCEPTANCE`. After mainline mechanically accepts the package, required reusable state is `IDLE_REUSABLE_AWAITING_MAINLINE`; no new assignment is accepted before that acknowledgement.
