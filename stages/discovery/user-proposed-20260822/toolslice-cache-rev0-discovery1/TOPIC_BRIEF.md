# TOOLSLICE-CACHE-REV0 — Dependency-certified cross-branch tool reuse

## 中文摘要

- 研究机会：用户提议在同版本 coding-agent SDK 的分歧分支间，为相同本地工具调用复用结果，并以依赖证书保证输出与工具后状态等价。
- 为什么可能值得做：它试图区分“分支历史不同”与“工具真正可观察输入不同”，并把复用成本纳入端到端分母。
- 为什么淘汰：提议的“observed read-set”不足以保证混合测试/构建/静态工具的通用语义等价；把它补强为完整依赖闭包时，构建子集已被 Bazel/Nix 类 hermetic action cache 直接覆盖，其他子集只剩通用动态跟踪/重放或保守执行，未冻结出非通用 N2 算法。
- 下一步：不送 Stage 0。若未来另立新对象，必须先固定一种具完备可观测依赖语义的特定工具，并给出非 Bazel/Nix/record-replay 的专门算法与保证；该题不得以改名复活。

- Status: `DROP`
- Quality tier: `BELOW_Q2_STOP`
- Opportunity origins: `O1 / O6`
- Domain tags: coding-agent SDK, workspace semantics, cache correctness, build systems
- Contribution route: `N2` (hypothesized; not admitted)
- Discovery date: 2026-08-22
- Discovery method revision: `RESEARCH_TOPIC_DISCOVERY_CURRENT_20260822`
- Discovery claim-pack mode: `OFF`
- Discovery RQ frontend mode/revision: `OFF`; staged RQ mode non-canonical
- Opportunity family ID: `TOOLSLICE_CACHE__DEPENDENCY_CERTIFIED_CROSS_BRANCH_TOOL_REUSE`
- Contribution type: `COMPILER_TOOL`
- Carrier kind: `NATURAL`

## Research question

Can an observed dependency certificate safely decide native execution versus cross-branch reuse for a local coding-agent tool while preserving native output/post-state and reducing total end-to-end cost?

## Canonical research claim package

- Exact object and same-function contract: same `OpenHands/software-agent-sdk@ddac55697c5d15cf8a34495b5ed6d46c86db092a`; divergent workspace histories; identical supported invocation; native output and observable post-state preserved.
- Natural scenario: divergent coding-agent workspaces running local tests, builds, static analysis or read-only queries.
- Atomic action: accept a certificate and reuse another branch’s result, otherwise execute natively.
- Candidate mechanism: executable/argv/environment/version/nondeterminism plus observed read-set certificate.
- Comparator/fairness: TVCACHE full-history state protection; Bazel and Nix hermetic action caches; ordinary memoization only as a weak control.
- Full cost: capture, certificate construction/validation, lookup/storage, invalidation, fallback and agent end-to-end time.
- Minimum falsifier: an unrecorded conditional dependency that changes native result/post-state despite a certificate match.

## Current collision classification

TVCACHE is a direct stateful-cache subtractor: its full exact tool history protects sandbox state, while stateless filtering relies on a correct annotation. Bazel directly covers the build subscope where the candidate supplies sound declared inputs, command and environment; its disk cache explicitly supports switching branches/multiple workspaces. Nix likewise represents a deterministic build as a precisely defined input/environment/process-state closure.

The candidate’s single observed read-set is not a complete dependency closure for the mixed admitted tool scope. A conditional dependency witness is sufficient to break its stated guarantee. Requiring a complete closure makes the build case a current hermetic cache action and leaves no specified target-specific construction for the remaining tools.

- `DIRECT_FATAL`: `TRUE` for the broad proposed guarantee / build subscope combination.
- `DIRECT_SUBTRACT`: TVCACHE and Nix.
- `SEARCH_BOUNDED_OPEN`: exact SDK-commit native cache/replay surface; this is not used as an absence claim.

## Fidelity closure plan

- Status: `STRUCTURALLY_UNCLOSABLE`
- Structural failure condition met: the guarantee requires information unavailable to the proposed observed-slice action, while the only sound completion is absorbed by generic current mechanisms.
- Stage A killer: construct the conditional hidden-dependency pair above; if the candidate weakens its guarantee to accept it, it fails same-function equivalence; if it captures it, compare its action description against Bazel/Nix/hermetic replay.

## Q1/Q2 sufficiency hypothesis

Not admitted. No finite Stage A plan can turn the frozen broad observed-read-set certificate into a non-generic, same-object N2 without changing the research object or guarantee.

## Non-relaxable quality audit

- Same-object: preserved in the evaluation; fails only when attempting a purported rescue.
- Latest collision: official/current Bazel and Nix, plus 2026 TVCACHE, checked.
- Strong baseline: present.
- Natural carrier: defined, but no run was authorized or performed.
- Full-cost: frozen; no claimed savings.
- Reproducibility: static counterexample and source routes recorded.
- Evidence honesty: no claim of SDK cache absence or empirical speedup.

