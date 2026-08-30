# COUPLED-AGENT-REPLAY-REV0 — coupled agent replay

## 中文摘要

- 研究机会：原设想是在 I0/I1 两条真实编码 Agent 分支间保持共享随机性，降低反事实效果估计的方差。
- 审查结论：冻结对象无法承载该问题。官方固定源码是 Agent Canvas 控制中心，不是定义 OpenHands 原生编码策略、首个工具动作与 agent state 的实现；实际 agent 由外部 Agent Server/后端提供。
- 为什么淘汰：若改用外部 SDK 或指定后端，exact object、状态边界和公平比较器都会变化，违反冻结合同；不改则不存在可定义的 complete agent-level coupling action 或 target-specific guarantee。
- 下一步：不进入 Stage 0。本 assignment 不建议在同一 Topic ID 下修补；任何后续方向必须由主线以新对象、新 ID 和独立身份冻结重新发起。

- Status: `DROP`
- Quality tier: `BELOW_Q2_STOP`
- Opportunity origins: `O7`
- Contribution route: `N2` (hypothesized, not established)
- Contribution type: `METHOD_ALGORITHM`
- Carrier kind: `IMPLEMENTATION_CARRIER_ONLY`

## Canonical disposition

`DROP__DIRECT_FATAL_GENERIC_COMPOSITION_OR_STRUCTURALLY_UNCLOSABLE`

The controlling reason is `STRUCTURAL_SAME_OBJECT_FAILURE`: `OpenHands/OpenHands@4bf8dd3aaf1217916b2ce8a6f9168fa7633a26f8` officially identifies itself as Agent Canvas rather than the frozen native coding-agent policy required by the estimand. This is independent of experiments, model availability, or result quality.

## Audit coordinates

- Exact-object: fail.
- Current-source reality check: closed with official tree, README and package manifest.
- Collision/guarantee review: stopped after the exact-object falsifier; CAR and token-level papers remain related comparators, not a completed agent-level construction.
- Full cost: cannot be made same-object because the branch runtime, model invocation, workspace/process reset and evaluator boundary are not defined by the frozen source.
- Stage 0 authority: none.
