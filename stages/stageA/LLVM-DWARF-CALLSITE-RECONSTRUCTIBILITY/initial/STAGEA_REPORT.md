# LLVM-DWARF-CALLSITE-RECONSTRUCTIBILITY Stage A Report

## 中文摘要

- 关键风险是否得到支持：尚未测试；PRE_CLAIM 门因 exact LLVM/X86/Linux 资源缺失而 fail closed。
- 最重要的证据或反证：只有本地资产不足的机械证据，没有候选机制的支持或反证。
- 当前证据上限：`RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`。
- 下一步及是否需要用户操作：需要主线/用户在新的 `resume1` 提供或授权 exact-commit X86 toolchain 与 Linux 行为验证路线。

- Lane id: `CANDIDATE_EXECUTION_LANE_3`
- Assignment id: `STAGEA-L3-20260814-LLVM-DWARF-CALLSITE-RECONSTRUCTIBILITY-INITIAL-V8.7`
- Input freeze SHA-256: finalized and listed in `HASH_MANIFEST.sha256`
- Cross-assignment contamination declaration: no scientific fact, corpus, process, temporary output or environment was inherited; prior immutable assets were inspected only as version-mismatch resource candidates and were not run on the witness.
- Decision: `BLOCKED_USER_ACTION_REQUIRED`
- Quality tier: `TIER_B_Q2_VIABLE` preserved from independent Stage 0, not re-adjudicated
- Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`
- Novelty route: `N2`
- Stage semantics: no real pilot began; this package is a preclaim resource blocker, not completion or refutation of the paper claim.

## Pre-claim contract fidelity gate

- Gate status: `FAIL_CLOSED__RESOURCE_BLOCKED`
- Frozen atomic actions mapped to implementation paths: intended X86 RA/CSR/frame-CFI → compatible InstrRef/LiveDebugValues → DwarfDebug native observation mapping recorded, but not verified at the exact commit.
- Comparator implementation/parameter/semantic audit: complete union frozen; exact source/build/config audit not executable.
- Native codec/solver/trainer/checker/reader/format parity: no proxy used; exact native writer/readers unavailable.
- Metric denominator and unit parity: frozen prospectively in `EXPERIMENT_CONTRACT.yaml`; collectors untested.
- Full-cost dimensions and collection paths: reconstructibility, text/DWARF bytes, CSR/CFI/spill, compile CPU/wall/RSS, runtime, verification and fallback are all specified.
- Small legality/equivalence/object-identity witness: declarative input only; no native replay.
- Non-claim-bearing proxy/control outputs retained: local version/target inventory only.
- Claim-bearing run started only after PASS: `false`; no claim-bearing run started.

## Frozen contract

Exact LLVM `e72ba6cf…`, x86-64 Linux SysV, `-O2 -g` instruction-reference-compatible LiveDebugValues, same optimized MachineIR/call ABI/executable behavior and legal DWARF observation. Candidate action is target-specific allocation-time value retention with native CSR/CFI planning over the bounded debug-critical call cut. The guarantee is an exact Pareto frontier only for that frozen bounded class.

## Headroom or theoretical gap

The upstream Stage 0 static certificate remains at its original ceiling. Stage A obtained no executable headroom, residual-action, natural prevalence or theoretical strengthening.

## Minimal mechanism and strongest baselines

The mechanism and full current union are frozen in `EXPERIMENT_CONTRACT.yaml`. Neither was executed. A different LLVM release or an AMDGPU-only exact build was not substituted.

## Natural workload and mechanism-specific prediction

The minimum 30-function natural denominator was not frozen or run because the preclaim gate did not pass. The mechanism-specific prediction remains unresolved.

## Highest-risk probe result

- Risk-bearing premise: native same-MIR Plan A/Plan B reconstructibility divergence outside the complete current union at acceptable full cost.
- Probe/counterexample-search scope: zero; resource gate only.
- Negative-result meaning: none.
- Positive-result ceiling: not applicable; no observation.

## Directional increment

- Performance/quality/Pareto/complexity effect: unmeasured.
- Why it is not ordinary tuning or a weak-baseline artifact: not evaluated; the contract retains the complete current union and refuses weaker substitutes.

## Current critical-cost analysis

All dimensions are preregistered but no collector was tested. There is no omitted-cost scientific result because there is no result.

## AI execution ledger

- AI executability class: `AI_CORE_CONDITIONAL__EXACT_TOOLCHAIN_REQUIRED`
- Measured ai_core_fraction: not measured before the blocker.
- Reproducible commands/artifacts: input hashes, local asset inventory, gate and blocker documents.
- Human-only items: provide/authorize the exact toolchain and Linux route; no research judgment is requested yet.

## Literature collision update

No new literature or online source search was authorized. The exact upstream reality check is `NOT_CLOSED__RESOURCE_BLOCKED`; `SEARCH_BOUNDED_OPEN` remains. No absence inference is drawn.

## Stage B minimal prototype

Not initialized. A future plan cannot be activated without a successful Stage A, independent Stage A gate and explicit user approval.

## Q1/Q2 evidence-gap review

- Comparator file: `Q1_COMPARATOR_MATRIX.md`
- Updated reference set: none.
- Status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP__UPSTREAM_ONLY`
- Evidence already comparable: frozen contract/static certificate only.
- Executable Stage B gaps: all empirical gaps remain behind Stage A.
- Human/resource-dependent gaps: exact toolchain/target route.

## Non-relaxable quality audit

- Same-object: frozen, not executed.
- Latest collision: open; not inferred from missing resources.
- Strong fair baselines: complete union frozen, not run.
- Natural input/evidence: none.
- Full-cost: dimensions frozen, none measured.
- Reproducibility: blocker inventory reproducible; experiment `CANNOT_VERIFY`.
- Evidence/claim honesty: no PASS, STOP, reserve or paper claim.

## Supported and unsupported claims

Supported: the eight upstream hashes match and the authorized local environment lacks the exact executable route. Unsupported: every scientific claim about Plan A, Plan B, the candidate, current-union residual, natural data, cost or paper quality beyond the frozen conditional tier.

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
- Immutable failure directory: `stages\stageA\LLVM-DWARF-CALLSITE-RECONSTRUCTIBILITY\initial`
- Resume directory and frozen contract: new `resume1`; reuse assignment contract SHA-256 `4D4835AA13AF26189B3E19C086B091FA1E94CF20EB00863546679D125F93D924` unless mainline explicitly expands only the resource envelope.
- Blocker packet: `USER_BLOCKER_PACKET.md`
