# ATOMIC-BRANCH-STATE-REV0 — Atomic cross-layer agent-branch checkpoint

## 中文摘要

- 研究机会：固定的 OpenHands SDK 锚点没有提供可原子绑定 transcript、workspace/process、tool 与 KV 的原生 branch action。
- 为什么不保留：把 Shepherd 的 branch trace、Crab 的 sandbox C/R、Atomix 的 epoch/frontier 事务和 KV-local restore 绑定为一个“新协议”后，剩下的线性化点只是普通多资源事务/检查点协调；同时该 SDK 自身不拥有 KV 或进程快照状态，不能给出同对象双合法动作见证。
- 决定性碰撞/残余：四项相邻机制分别已覆盖各状态平面；没有发现目标特异的跨层动作、决策变量或非通用保证。剩余仅是通用 2PC/checkpoint composition，属于本合同明确排除的 generic wrapper。
- 下一步：无。若未来另建题，必须先冻结一个真正集成的 agent+model-serving+sandbox runtime，并提出不同于通用协调的原子动作与有限保证；该新题不得继承本题状态。

- Status: `DROP`
- Quality tier: `BELOW_Q2_STOP`
- Opportunity origin: `O7`
- Domain tags: `agent-runtime`, `checkpoint-recovery`, `transactional-tool-use`, `KV-cache`
- Contribution route assessed: `N1 / N2`
- Discovery date: `2026-08-22`
- Discovery method revision: `RESEARCH_TOPIC_DISCOVERY_CURRENT_20260822`
- Discovery claim-pack / RQ modes: `OFF / OFF`
- Opportunity family ID: `ATOMIC-BRANCH-STATE-REV0`
- Contribution type: `SYSTEM_ARCHITECTURE`
- Front-end disposition: `EXCLUDED_BEFORE_RAW`

## Exact object and claimed action

The frozen object is one versioned agent branch binding transcript, agent state, filesystem/process/terminal state, tool transaction state and model KV state. The required action was atomic commit, abort, or restore with one linearization point and no mixed-epoch visibility after any failure.

## Fatal audit

| Requirement | Result |
|---|---|
| Native all-plane action in `software-agent-sdk@ddac556…` | absent from the anchored native action surface; the SDK exposes composable agents/tools/workspaces, not serving-KV and sandbox C/R ownership. |
| Same-object two-plan witness | cannot be formed without adding external serving and checkpoint substrates, which changes the frozen object. |
| Target-specific linearization / theorem | none survived: a durable epoch record coordinating resource managers is generic atomic transaction/checkpoint composition. |
| Strong current subtractors | Shepherd (reversible agent/environment traces), Crab (sandbox C/R), Atomix (tool epochs/frontiers), and KV transaction-local restore. |
| Natural carrier and full-cost plan | cannot be frozen for the claimed exact object; an integrated carrier would be a new object. |

## Claim ceiling and integrity

This is not a claim that no cross-layer branch protocol can ever be researched. It is a bounded conclusion that this exact anchor and action proposal cannot form a non-generic same-object Stage 0 candidate. No experiment, build, checkpoint, fault injection, model execution, or stopped-topic evidence was used.

