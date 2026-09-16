# DUALFORK-RUNTIME-REV0 — DualFork Runtime

## 中文摘要

- 研究机会：用户提出的方向试图把一个分支的 KV 与 sandbox 状态作为一个联合在线资源决策。
- 结论：`DROP`。在冻结的 OpenHands SDK + vLLM 对象中，两平面没有被来源材料定义为同一原生 branch action；把它们同时调用只是外部编排。若扩大对象来获得真正的集成 CoW fork，则 Shepherd 已是强直接减项。
- 关键理由：剩余“联合”选择可被同信息的独立平面策略同步重放，或写成 group-based multi-resource tree caching/knapsack；没有来源支持的、不可替换的语义合法性或保证。
- 下一步：不创建 Stage0。只有新的、固定同对象来源能定义跨 KV 与 sandbox 的原生 branch transition，并给出非通用的合法性/保证，才可作为新对象重新提交。

- Status: `DROP`
- Quality tier: `BELOW_Q2_STOP`
- Opportunity origin: `O4`
- Domain tags: agent runtime; LLM inference; sandbox lifecycle; online resource management
- Contribution route examined: `N2`
- Discovery date: 2026-08-22
- Discovery method revision: `RESEARCH_TOPIC_DISCOVERY_CURRENT_20260822`
- Discovery claim-pack / RQ frontend modes: `OFF / OFF`
- Opportunity family ID: `DUALFORK-RUNTIME-REV0`
- Contribution type: `METHOD_ALGORITHM / SYSTEM_ARCHITECTURE`
- Front-end disposition: `EXCLUDED_BEFORE_RAW`
- Carrier kind: `IMPLEMENTATION_CARRIER_ONLY`

## Frozen claim package and why it fails

- Exact proposed object: one branch tree whose nodes pair a model KV state and sandbox state under fixed HBM, host-memory, storage and GPU-time caps.
- Same-function boundary: identical agent branch semantics, with full cost including KV transfer, sandbox restore/process/storage, GPU/CPU/I/O, scheduler overhead and abandoned branches.
- Proposed action: per-branch joint `retain / park / resume / evict / commit / abort`.
- Fair comparator: a deployable union of independent KV and sandbox policies with the same branch-tree information and the same full-cost denominator.
- Fatal structural observation: vLLM's native lifecycle is request/KV-block allocation, free and eviction; the inspected OpenHands lifecycle is sandbox start/resume/keep-alive. The contract has not identified a common native branch transition. A mediator that creates one is a wrapper and changes the object.

## Paper genealogy and collision position

- Current KV baseline: [vLLM Automatic Prefix Caching](https://docs.vllm.ai/en/stable/design/prefix_caching/), current official documentation/source locus.
- Strongest integrated subtractor: [Shepherd](https://arxiv.org/abs/2605.10913), whose official project describes CoW coupling of agent/environment forks and replay prompt/KV reuse.
- Sandbox-plane subtractor: [Crab](https://arxiv.org/abs/2604.28138).
- KV-plane subtractor: [ForkKV](https://arxiv.org/abs/2604.06370).
- Tree-search contrary: [TreeRL](https://arxiv.org/abs/2506.11902).
- Search boundary: only frozen official/current loci and the four named primary contrary sources; no global-first claim.

## Direct subtractor and strongest union

| Facet | Narrow OpenHands + vLLM pair | Shepherd / independent union | Result |
|---|---|---|---|
| Branch identity | separate sandbox ID and request/KV identity | integrated execution trace, or external synchronization | narrow pair lacks native paired action |
| KV action | allocate/append/free/evict blocks | ForkKV improves KV CoW; union can issue per-plane action | no surviving target-native joint action shown |
| Sandbox action | start/resume/keep-alive lifecycle | Crab C/R; Shepherd forks agent/environment | pairing needs external mediator |
| Whole-action semantics | proposed CoW pair | Shepherd supplies integrated fork/replay | broadening object is directly subtracted |
| Policy/guarantee | requested online/competitive claim | only generic group resource selection remains | generic multi-resource kernel/controller risk is decisive |

## Decisive falsifier and closure boundary

The fastest finite killer is a source-level two-branch witness: both planes must accept one shared native branch identifier, and a paired action must alter legal transitions or a fixed semantic guarantee. The checked loci instead factorize. This is a structural same-object/action failure, **not** a negative experimental result, hardware limitation, source-download failure or inherited STOP status.

## Reopen boundary

Do not reopen this ID by renaming or adding a utility weight. A future submission needs a new exact object and a primary source proving: (1) native cross-plane branch identity, (2) an action not reproducible by synchronized independent calls or generic group caching, and (3) a public versioned branch carrier with a finite full-cost falsifier.
