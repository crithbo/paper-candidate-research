# DualFork Runtime — Current-Upstream and Collision Audit

Frozen review date: 2026-08-22. Sources are official project documentation/source or original author papers only. Web responses were not persisted as assignment resources.

## Current object reality check

| Surface | Pinned locus | What it establishes | What it does **not** establish |
|---|---|---|---|
| OpenHands SDK | user-frozen `OpenHands/software-agent-sdk@ddac55697c5d15cf8a34495b5ed6d46c86db092a`; current official `openhands-workspace/openhands/workspace/cloud/workspace.py` | a sandbox has `sandbox_id`, optional keep-alive and resume-existing-sandbox lifecycle | no evidence from the inspected locus of snapshot/checkpoint/branch-fork semantics shared with an inference KV request |
| vLLM v1 | official current [Automatic Prefix Caching](https://docs.vllm.ai/en/stable/design/prefix_caching/) and `vllm/v1/core/kv_cache_manager.py` on main | KV is managed as request-associated blocks; documented native operations are allocation, append, free and LRU eviction | no sandbox state or agent branch/checkpoint identity is part of the documented manager contract |
| SGLang | not selected to define the exact engine identity; attempted public-doc route was connector-rejected | vLLM's official document identifies SGLang as another prefix-caching framework | no current-absence or union conclusion is drawn from the unexecuted SGLang route |

The OpenHands source locus does contain a `sandbox_id` resume path, but `checkpoint` and `snapshot` searches at that exact current file were negative. This is a **file-scoped observation**, not a global absence claim.

## Same-object consequence

The narrow frozen pair supplies two identifiers — vLLM request/KV blocks and OpenHands sandbox IDs — but no common native branch identity or transition whose legality jointly constrains both. Issuing `allocate/free/evict` and `start/resume/delete` together is an orchestration sequence. Introducing a mediator that manufactures the pairing changes the native object; it does not reveal a new action already defined by this pair.

## Required contrary and collision sources

| Source | Role | Same-object facet result | Disposition |
|---|---|---|---|
| [Shepherd original paper](https://arxiv.org/abs/2605.10913) and [official repository](https://github.com/shepherd-agents/shepherd) | strongest integrated-runtime subtractor | records typed agent-environment traces and can fork/replay prior state; project states that it couples agent and environment in a CoW fork with prompt/KV reuse on replay | `DIRECT_SUBTRACT`; if DualFork broadens to this integrated trace object, its proposed coupling is absorbed |
| [Crab original paper](https://arxiv.org/abs/2604.28138) | sandbox-plane subtractor | semantics-aware sandbox checkpoint/restore, turn-boundary decisions and host coordination; no model KV lifecycle | `PARTIAL_PLANE_SUBTRACTOR` |
| [ForkKV original paper](https://arxiv.org/abs/2604.06370) | KV-plane subtractor | CoW/disaggregated KV architecture for multi-LoRA agent serving; its object is LoRA cache decomposition, not sandbox state | `PARTIAL_PLANE_SUBTRACTOR` |
| [TreeRL original paper](https://arxiv.org/abs/2506.11902) and [official code](https://github.com/THUDM/TreeRL) | tree-search contrary | branches LLM reasoning/RL trajectories; inspected project page has no sandbox state contract | `TREE_ONLY_SUBTRACTOR` |

## Generic-kernel attack

With only a user-level branch label, the proposed atomic action reduces to selecting a group of resource items per branch:

`b -> {KV_b, sandbox_b}; choose retain/park/evict subject to HBM, host-memory, storage and time capacities.`

The branch tree can parameterize value and recourse, but the stated action has no source-backed cross-plane validity rule. A same-information union can issue the KV and sandbox actions synchronously; any extra all-or-none grouping is ordinary multi-resource tree caching/knapsack or a utility controller. This attack is not resolved by reweighting latency, energy or capacity.

## Fastest killers

1. **Native-action killer (decisive):** a two-branch source-level witness must bind one native branch identifier to both `KVCacheManager` operations and OpenHands sandbox checkpoint/restore operations. The inspected object instead exposes separate request/KV and sandbox identifiers; a mediator would be a wrapper/changed object.
2. **Integrated-object killer (decisive):** if the object is changed to Shepherd's execution trace to obtain a genuine coupled CoW fork, Shepherd is already the same integrated mechanism; a residual must introduce a different target-native action, not merely a budget controller.
3. **Generic-kernel killer (decisive):** if the only state relation is a paired membership constraint, show a non-generic semantic/legality property that prevents re-expression as grouped multi-resource caching. None is frozen by the current sources.

## Claim ceiling

`SEARCH_BOUNDED_OPEN` applies only to global literature novelty. It does not rescue the local structural finding: the selected narrow object does not define the required paired native action, and the broadened object encounters a direct integrated subtractor. No claim is made that OpenHands, vLLM or SGLang globally lack a capability.
