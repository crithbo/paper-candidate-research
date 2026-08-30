# CVC5-ALETHE-SHAREMAP Stage A Report

- Lane id: `CANDIDATE_EXECUTION_LANE_1`
- Assignment id: `STAGEA-L1-20260809-CVC5-ALETHE-SHAREMAP-INITIAL-V8.7`
- Input freeze SHA-256: `27CDF36933F93B0C096AA73DA6A9DC49505872B0D0A7A565EE959F5EF7331FA3` (`EXPERIMENT_CONTRACT.yaml`)
- Cross-assignment contamination declaration: `false`
- Decision: `BLOCKED_USER_ACTION_REQUIRED`
- Quality tier: inherited conditional `TIER_B_Q2_VIABLE`; not scientifically reassessed
- Evidence ceiling: `RESOURCE_FAILURE_ONLY__NATIVE_THRESHOLD_FAMILY_REPLAY_ESTABLISHED__CANDIDATE_BUILD_CARCARA_FULL_PRECLAIM_UNESTABLISHED__NO_SCIENTIFIC_INFERENCE`
- Novelty route: conditional `N2`
- Stage semantics: real pilot research on the highest-risk premise; no PASS/STOP or paper claim is formed.

## Pre-claim contract fidelity gate

- Gate status: `FAIL_CLOSED`
- Frozen atomic actions mapped to implementation paths: native threshold family maps to exact cvc5 1.3.4 `AletheProofPrinter/AletheLetBinding`; candidate is frozen as `SCOPE_FOREST_WEIGHTED_GLOBAL_SELECTION` and must execute in that printer-side path. The native mapping ran; the candidate mapping could not be built.
- Comparator implementation/parameter/semantic audit: all integer `dag-thresh=0..64` were executed twice on the fixed release-matched proof; seven behaviorally distinct outputs were found. Sharing disabled and the complete native envelope remain the comparator.
- Native codec/solver/trainer/checker/reader/format parity: cvc5 release parity passed. Candidate build and Carcara parity did not execute because the C/C++ and Rust toolchains are absent.
- Metric denominator and unit parity: frozen in `EXPERIMENT_CONTRACT.yaml`; no claim-bearing denominator was instantiated.
- Full-cost dimensions and collection paths: preregistered, but candidate/checker/RSS/I/O paths remain unavailable; fail closed.
- Small legality/equivalence/object-identity witness: native count replay passed (`@p_10=3`, `@p_12=2`), but printer-side `A*`, exact expanded AST equality, and Carcara acceptance were not executed; witness is incomplete.
- Non-claim-bearing proxy/control outputs retained: the initial incorrect fixed-tail guard and all native family outputs are retained under `results/preclaim/`.
- Claim-bearing run started only after PASS: `false`; no natural corpus run started.

## Frozen contract

The exact object is cvc5 1.3.4 commit `f3b21c4483d3b88dc63cb7cd3e5eb092eee5e341`, its fixed `qgu-fuzz-1-bool-sat.smt2` Alethe proof, Alethe named-term semantics, and Carcara 1.1.0. The candidate may only select native-eligible named terms and legal declaration sites in the same printer-side contract. The theorem, proof step order, premises, rules, fully expanded term ASTs, output format, and checker obligation are invariant.

## Headroom or theoretical gap

Stage0 statically identified `NAME_P12__EXPAND_P10` outside a uniform count-threshold chain. Stage A mechanically confirmed the native count order and complete raw output family, but did not execute the candidate, expanded-AST proof, or checker. The alleged residual therefore remains unvalidated and cannot support a claim.

## Minimal mechanism and strongest baselines

- Candidate: exact dynamic programming over a proof-scope forest with term-containment/name-dependency state, exact for active frontier width <=12 and native fallback otherwise.
- Strongest baseline: per-proof behaviorally complete cvc5 `dag-thresh` envelope plus sharing disabled.
- Prohibited collapses: threshold tuning, native-output selection, independent local byte ranking, emitter patch as contribution, postprocessing, or a generic solver wrapper without new structure/guarantee.

## Natural workload and mechanism-specific prediction

The contract reserves 60 public supported SMT-COMP/SMT-LIB UNSAT instances with a fixed pre-result inclusion rule. No corpus manifest was created and no instance ran because the preclaim gate did not pass.

## Highest-risk probe result

- Risk-bearing premise: a release-matched, checker-valid, globally coupled action/algorithm exists outside the complete native threshold family.
- Probe/counterexample-search scope: fixed official proof only, native output enumeration `0..64`, dual replay.
- Negative-result meaning: none; resource/toolchain failure occurred before the complete probe.
- Positive-result ceiling: not reached. The native mechanical subgate is not `NOT_FALSIFIED` or `PRELIMINARY_SUPPORT` for the candidate.

## Directional increment

No performance/quality/Pareto/complexity increment was measured. The only observed fact is reproducible native behavior required to continue the preclaim gate.

## Current critical-cost analysis

The fixed native enumeration cost was about 4.82 seconds summed child wall time for 130 runs. Candidate construction, release-matched candidate build, Carcara time/RSS, proof bytes under candidate, disk I/O, and p50/p90 full-cost costs are unavailable. Full-cost comparison is therefore undefined.

## AI execution ledger

- AI executability class: `AI_CORE_CONDITIONAL` at this host; Stage0's public route exists but local build/checker capability is absent.
- Measured ai_core_fraction: not scientifically measurable before implementation; no value promoted from Stage0.
- Reproducible commands/artifacts: `scripts/enumerate_fixed_native_family.mjs`, `scripts/validate_native_family_replay.mjs`, and `results/preclaim/`.
- Human-only items: provide/authorize the exact portable build/checker toolchain described in `USER_BLOCKER_PACKET.md`.

## Literature collision update

- Current upstream reality check: cvc5 1.3.4/full commit is frozen; current native Alethe sharing exists and permanently removes the original missing-sharing claim.
- Source symbols: `src/proof/alethe/alethe_printer.cpp`, `alethe_let_binding.cpp`, and common let-binding machinery.
- Flag: `dag-thresh`, with `0` disabling named sharing.
- Remaining non-tuning residual: only the unvalidated global scope-forest selection/guarantee outside the complete native family.

## Stage B minimal prototype

Not applicable while blocked and before an independent Stage A gate. StageB is `false`; `stageb_user_approval_id=null`.

## Q1/Q2 evidence-gap review

- Comparator file: `Q1_COMPARATOR_MATRIX.md`
- Status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP` inherited only as Stage0 potential; Stage A evidence remains resource-only.
- Evidence already comparable: current source collision and native fixed-proof family replay.
- Executable Stage B gaps: none authorized.
- Human/resource-dependent gaps: build-capable cvc5 environment and runnable pinned Carcara.

## Non-relaxable quality audit

- Same-object: frozen; candidate path unexecuted.
- Latest collision: current native sharing subtracted.
- Strong fair baselines: contractually complete; only native side executed.
- Natural input/evidence: not executed.
- Full-cost: not executed.
- Reproducibility: native subgate reproduced exactly; candidate not reproducible because absent.
- Evidence/claim honesty: blocker only; no scientific inference.

## Supported and unsupported claims

Supported: official release/source assets are frozen; the fixed native output count order and seven raw threshold behaviors reproduce exactly.

Unsupported: `A*` checker legality, expanded-AST equality, candidate native integration, global coupling, algorithmic guarantee in execution, natural action incidence, byte/checker benefit, p50/p90 frontier, Tier-B paper result, firstness, Stage A PASS/STOP, or Stage B readiness.

## Mandatory user gate before Stage B

- Independent Stage A gate decision: not requested while resource-blocked.
- User-facing evidence packet: `USER_REVIEW_PACKET.md` and `USER_BLOCKER_PACKET.md`.
- `PENDING_USER_STAGEB_REVIEW`: no
- Stage B user approval id/time: null
- Stage B authorized: false

## User-action blocker

- Claim-bearing observation obtained before failure: no
- Evidence ceiling: `RESOURCE_FAILURE_ONLY__NATIVE_THRESHOLD_FAMILY_REPLAY_ESTABLISHED__CANDIDATE_BUILD_CARCARA_FULL_PRECLAIM_UNESTABLISHED__NO_SCIENTIFIC_INFERENCE`
- Scientific revision consumed: no
- Immutable failure directory: `stages\stageA\CVC5-ALETHE-SHAREMAP`
- Resume directory and frozen contract: `stages\stageA\CVC5-ALETHE-SHAREMAP\resume1`; contract SHA-256 `27CDF36933F93B0C096AA73DA6A9DC49505872B0D0A7A565EE959F5EF7331FA3`
- Blocker packet: `USER_BLOCKER_PACKET.md`
