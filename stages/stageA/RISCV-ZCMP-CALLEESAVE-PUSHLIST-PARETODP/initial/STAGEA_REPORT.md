# RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP Stage A Report

## 中文摘要

- 关键风险是否得到支持：未测试。40 位 commit 与 blob pin 已闭合，但 exact native replay 环境缺失。
- 最重要的证据或反证：官方元数据确认完整 commit/13 个 blob；本地只有 11/13 exact source parity，且没有 exact RISC-V toolchain。这是资源证据，不是机制反证。
- 当前证据上限：`RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`。
- 下一步及是否需要用户操作：需要在新的 `resume1` 提供/授权 portable exact toolchain 和两个缺失 blob。

- Lane id: `CANDIDATE_EXECUTION_LANE_3`
- Assignment id: `STAGEA-L3-20260814-RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP-INITIAL-V8.7`
- Input freeze SHA-256: listed in `HASH_MANIFEST.sha256`
- Cross-assignment contamination declaration: no prior scientific result, corpus, process or environment was reused; other immutable assets were independently version/blob-checked only as resource candidates and not run on the witness.
- Decision: `BLOCKED_USER_ACTION_REQUIRED`
- Quality tier: `TIER_B_Q2_VIABLE` preserved from independent Stage 0, not re-adjudicated
- Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`
- Novelty route: `N2`
- Stage semantics: no real pilot began; this is a preclaim resource blocker.

## Pre-claim contract fidelity gate

- Gate status: `FAIL_CLOSED__RESOURCE_BLOCKED`
- Frozen atomic actions mapped to implementation paths: complete intended mapping from pre-RA coloring/spill through fixed Zcmp prefix/frame/CFI, late PushPop, expansion and native readers is pinned by blob IDs but not executable.
- Comparator implementation/parameter/semantic audit: complete union frozen; exact build/config enumeration not available.
- Native codec/solver/trainer/checker/reader/format parity: no proxy used; exact writer/verifier/assembler/linker/readers absent.
- Metric denominator and unit parity: frozen prospectively in `EXPERIMENT_CONTRACT.yaml`.
- Full-cost dimensions and collection paths: code/frame/spill/CFI, planner, compile CPU/wall/RSS, runtime-if-available, verification/fallback all specified; collectors untested.
- Small legality/equivalence/object-identity witness: declarative Plan P/Plan S input only; no native replay.
- Non-claim-bearing proxy/control outputs retained: official metadata and local version/blob inventory only.
- Claim-bearing run started only after PASS: `false`; no claim-bearing run started.

## Frozen contract

Full LLVM commit `ba5bccfe01368f76e74d6ff4c35f1330e155b4ba`, RV32IMAC+Zcmp/ILP32, same MachineFunction/behavior/psABI/CFI/unwind. Plan P uses `{ra,s0-s1}` with 16-byte frame and no spill; Plan S uses `{ra,s0}` with 32-byte frame and one native spill at `0(sp)`. The candidate is a target-specific bounded exact Pareto constructor, not generic RA or frame packing.

## Headroom or theoretical gap

The Stage 0 static bounded-grammar certificate remains at its original ceiling. No executable headroom, residual action or strengthened theorem was obtained.

## Minimal mechanism and strongest baselines

The mechanism and complete current union are frozen in `EXPERIMENT_CONTRACT.yaml`. Neither was executed. LLVM 22.1.8 was not substituted for the pinned commit.

## Natural workload and mechanism-specific prediction

Not started because the gate did not pass. No natural denominator was result-conditioned or synthesized.

## Highest-risk probe result

- Risk-bearing premise: both complete native plans are legal and a candidate frontier point remains outside the complete current union under full cost.
- Probe/counterexample-search scope: zero scientific runs; provenance/resource preflight only.
- Negative-result meaning: none.
- Positive-result ceiling: not applicable; no observation.

## Directional increment

- Performance/quality/Pareto/complexity effect: unmeasured.
- Why it is not ordinary tuning or a weak-baseline artifact: not evaluated; the contract keeps every current native action and refuses a non-exact baseline.

## Current critical-cost analysis

All dimensions are preregistered but no collector was tested. Metadata traffic was 111,029 successful JSON body bytes; no source/blob/archive/build cost occurred.

## AI execution ledger

- AI executability class: `AI_CORE_CONDITIONAL__EXACT_TOOLCHAIN_REQUIRED`
- Measured ai_core_fraction: not measured before blocker.
- Reproducible commands/artifacts: commit/tree/blob pins, hashes, local asset inventory, fidelity and blocker reports.
- Human-only items: provide or authorize the exact toolchain/two blobs; no scientific judgment requested.

## Literature collision update

No literature search was authorized. The current upstream source identity is pinned, but the exact executable union remains unclosed; `SEARCH_BOUNDED_OPEN` is retained. No absence inference is drawn.

## Stage B minimal prototype

Not initialized. Stage B remains unauthorized.

## Q1/Q2 evidence-gap review

- Comparator file: `Q1_COMPARATOR_MATRIX.md`
- Updated reference set: none.
- Status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP__UPSTREAM_ONLY`
- Evidence already comparable: frozen static bounded certificate and exact source metadata.
- Executable Stage B gaps: all empirical gaps remain behind Stage A.
- Human/resource-dependent gaps: exact native toolchain and two source blobs.

## Non-relaxable quality audit

- Same-object: frozen, not executed.
- Latest collision: open; no transport/resource inference.
- Strong fair baselines: complete union frozen, not run.
- Natural input/evidence: none.
- Full-cost: dimensions frozen, none measured scientifically.
- Reproducibility: provenance pin reproducible; experiment `CANNOT_VERIFY`.
- Evidence/claim honesty: no PASS, STOP, reserve or paper claim.

## Supported and unsupported claims

Supported only as resource/provenance facts: the short locator resolves to the stated full commit; 13 blob IDs are pinned; 11 local blobs match; the exact executable route is absent. Unsupported: Plan P/S native legality, same-object output equality, current-union residual, frontier benefit, natural prevalence, cost or publication result.

## Mandatory user gate before Stage B

- Independent Stage A gate decision: none; owner package is blocked.
- User-facing evidence packet: `USER_BLOCKER_PACKET.md`
- `PENDING_USER_STAGEB_REVIEW`: no
- Stage B user approval id/time: null
- Stage B authorized: false

## User-action blocker

- Claim-bearing observation obtained before failure: no
- Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`
- Scientific revision consumed: no
- Immutable failure directory: `stages\stageA\RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP\initial`
- Resume directory and frozen contract: new `resume1`; assignment contract SHA-256 `4E4CAEFE58CA335772C5DD80137F354543348BAFA8259BBEFA77D32ABFC90A51`.
- Blocker packet: `USER_BLOCKER_PACKET.md`

