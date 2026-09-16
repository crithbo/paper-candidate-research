# AIGER-DELTA-SCHEDULE Stage A Report

- Lane id: `CANDIDATE-EXECUTION-LANE-1`
- Assignment id: `STAGEA-L1-20260810-AIGER-DELTA-SCHEDULE-INITIAL-R3P0`
- Input freeze SHA-256: Discovery brief `179A41BFF132986FC37FC6E4FB71764B9F39A36CE7ACB7A4032B7370D344EC2A`; PRIMARY report `5DCFD38CBF13396EF11D2F6A5379DA8C31042CDAA6910D383B5C9A49D5CDF516`; confirmation report `6FE7D537142E474379FC971F3E68F8138EE592770525120038D62E08D3D4A382`
- Cross-assignment contamination declaration: `false`; no scientific fact, tool, corpus, result, score, or environment from the previous topic was reused.
- Decision: `BLOCKED_USER_ACTION_REQUIRED`
- Quality tier: `TIER_B_Q2_VIABLE` retained from Stage0; not scientifically reassessed.
- Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`
- Novelty route: `N2` proposed, not established.
- Stage semantics: Stage A risk pilot; no claim-bearing run occurred.

## Pre-claim contract fidelity gate

- Gate status: `FAIL_CLOSED`
- Frozen atomic actions mapped to implementation paths: the small exact prefix recurrence and binary control path are in `scripts/witness_control.js`; no scalable candidate path exists.
- Comparator implementation/parameter/semantic audit: frozen union is AIGER reference no-op/reencode/root DFS, Yosys complete same-object grid including `-no-sort`, and ABC default plus conditional `-u`. None could be executed because the exact native tools and compiler are absent.
- Native codec/checker/reader/format parity: `FAIL_RESOURCE_UNAVAILABLE`.
- Metric denominator and unit parity: preregistered in `EXPERIMENT_CONTRACT.yaml`; no claim result was measured.
- Full-cost dimensions and collection paths: graph extraction, scheduling/search, serialization, native parse/check, peak RSS, input/output/disk I/O, and fallback/failure are frozen.
- Small legality/equivalence/object-identity witness: independent non-native control passed 48/48 structural checks and reproduced 12B/13B; native validation is false.
- Non-claim-bearing proxy/control outputs retained: yes, under `artifacts/witness_control/`.
- Claim-bearing run started only after PASS: `false`; no claim-bearing run started.

## Frozen contract

The object is one standard binary AIGER 1.9 serialization of a fixed reachable AIG with fixed interface/property order, AND functions, adjacency, inversion and reset semantics. The only action is a legal whole-DAG topological bijection of fixed AND nodes to consecutive post-interface labels. Rewriting, merging, deletion, interface/property reordering, alternate codecs and `aig2` are excluded.

The primary mechanism metric is native ULEB128 AND-delta payload; whole-file bytes are the deployment denominator. The generic exact control recurrence is frozen and honestly exponential in the number of legal topological orders. A provisional live-frontier `n^O(w)` route is recorded only as future design work. No FPT, approximation, scalable algorithm, or N2 theorem is claimed.

## Headroom or theoretical gap

Not evaluated. The six-AND control confirms only the already frozen action divergence. It cannot establish natural headroom or an algorithmic contribution.

## Minimal mechanism and strongest baselines

- Minimal executed mechanism: complete enumeration on the six-AND control only.
- Required strongest baseline: exact pinned AIGER/Yosys/ABC current-native union.
- Status: baseline execution blocked before parity; therefore no candidate comparison exists.

## Natural workload and mechanism-specific prediction

The frozen carrier is a family-stratified public HWMCC binary-AIGER subset. Prediction: simultaneously ready sub-DAGs near base-128 delta thresholds may expose direction-sensitive choices. Natural object count is `0` because the preclaim gate failed before corpus acquisition.

## Highest-risk probe result

- Risk-bearing premise: a nontrivial whole-DAG algorithm and natural full-cost residual survive the complete native union.
- Probe scope: resource/preclaim audit plus non-native six-AND control.
- Negative-result meaning: none; missing resources are not scientific evidence.
- Positive-result ceiling: not applicable. The control is non-claim-bearing.

## Directional increment

No performance, quality, Pareto, or complexity increment was measured. The generic exact control does not establish that the mechanism is more than generic topological enumeration/emitter engineering.

## Performance evidence chain

- Algorithm/data-structure change: none claim-bearing.
- Intermediate metric: 12B versus 13B on the frozen synthetic control only.
- End-to-end effect: none on a natural object.
- Full-cost result: none.
- Generality/no-gain region: untested.

## Current critical-cost analysis

The control cost is 6.84 ms wall, 15 ms user CPU and 40.37 MB peak RSS. These numbers are not comparable to native baselines and do not answer the Stage A killer. The decision-changing missing costs are exact native build/runtime, current-union serialization and validation, scalable scheduling, and HWMCC I/O.

## AI execution ledger

- AI executability class: not reassessed under resource failure.
- Measured ai_core_fraction: not claimable.
- Reproducible commands/artifacts: contract, control script, binary artifacts, JSON result, command log and hashes are retained.
- Human-only item: supply/authorize an exact portable native toolchain or pinned prebuilt executable bundle.

## Mechanism pivot

None. Scientific revision consumed: `false`.

## Literature collision update

No new collision search was performed. The frozen current-upstream pins and option boundaries are preserved. Official GitHub endpoints were reachable only after the approved out-of-sandbox read-only probe; no sources were downloaded and no absence inference was made.

## Stage B minimal prototype

Not initialized. Stage B is unauthorized and approval remains `null`.

## Q1/Q2 evidence-gap review

- Comparator file: `Q1_COMPARATOR_MATRIX.md`
- Status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP`, now resource-blocked.
- Evidence comparable: none beyond Stage0 shape calibration and non-native witness control.
- Executable Stage B gaps: not applicable before Stage A resumes and independently passes.
- Human/resource-dependent gap: exact pinned native execution environment.

## Non-relaxable quality audit

- Same-object: frozen; native validation not executed.
- Latest collision: Stage0 bounded status only; no update.
- Strong fair baselines: specified but not run.
- Natural input/evidence: none.
- Full-cost: preregistered but unmeasured for claims.
- Reproducibility: blocker and control are reproducible; native path is not yet available.
- Evidence/claim honesty: no PASS, STOP, reserve, natural gain, scalability, FPT/approximation, full-cost superiority, or main claim is asserted.

## Supported and unsupported claims

Supported only as a non-native control: the local exhaustive script enumerates 48 legal schedules and produces structurally identical outputs with 12B/13B payload divergence. Unsupported: native acceptance, natural prevalence, current-union residual, nontrivial N2 algorithm, scalability, full-cost advantage, and paper conclusion.

## Mandatory user gate before Stage B

- Independent Stage A gate decision: not requested while blocked.
- User-facing evidence packet: `USER_REVIEW_PACKET.md` and `USER_BLOCKER_PACKET.md`.
- `PENDING_USER_STAGEB_REVIEW`: no.
- Stage B user approval id/time: `null`.
- Stage B authorized: `false`.

## User-action blocker

- Claim-bearing observation obtained before failure: no.
- Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`.
- Scientific revision consumed: no.
- Immutable failure directory: this `initial` directory.
- Resume directory and frozen contract: mainline must create `resume1` under the same topic and reuse `EXPERIMENT_CONTRACT.yaml`.
- Blocker packet: `USER_BLOCKER_PACKET.md`.
