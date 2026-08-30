# SOURCE120-S5-VLLM-CACHE-POLICY-PANEL

## 中文摘要

- 研究机会：建立 vLLM 原生 KV offload policy 的跨 workload 排名有效性 panel，判断 synthetic prefix、ShareGPT 与 Mooncake timed trace 是否会给出相反的 policy 选择。
- 为什么值得做：vLLM 已提供 LRU、ARC、自定义 policy 与三种公开 benchmark carrier，但单一 workload 的最优策略可能不能迁移。
- 为什么保留：最近 benchmark 工作分别研究 semantic response cache 与 KV compression，尚未覆盖同一 vLLM prefix/offload policy object。
- 下一步：Stage0 独立重建碰撞与 Q2 形状；若通过，StageA 先闭合 policy adapter、相同容量/信息/成本合同和一个小型 deterministic replay。

- Status: `PROPOSE_STAGE0`
- Quality tier: `TIER_B_Q2_VIABLE`
- Opportunity origin: `O5 / O8`
- Contribution route: `N3`
- Contribution type: `BENCHMARK_DATASET / MEASUREMENT_CHARACTERIZATION`
- Carrier: `NATURAL + CANONICAL_BENCHMARK_ONLY`

## Research question

在相同 vLLM OffloadingConnector、相同 CPU/secondary-tier 容量、block size、信息与 full-cost 分母下，LRU、ARC 与一个预登记的简单 frequency/cost baseline 在 prefix-repetition、ShareGPT 和 Mooncake timed trace 上的排序是否稳定；若不稳定，什么最小 benchmark panel 能避免 policy 选择反转？

## Canonical claim package

- Exact object: current vLLM CPU/tiered offload `CachePolicy` evaluation.
- Action/estimand: cross-carrier policy rank stability and decision-reversing rank loss.
- Immutable guarantee: exact KV reuse; no model-output approximation.
- Named comparators: vLLM LRU, vLLM ARC, simple pre-registered LFU/GDSF-style adapter; Belady-style offline ceiling only when the same trace reveals future accesses.
- Mechanism hypothesis: reuse locality, one-touch pollution and transfer/recompute asymmetry differ across carriers, changing policy ordering.
- Null: policy ranking is stable once capacity and complete cost are matched.
- Full cost: trace preprocessing, warmup, lookup/policy overhead, CPU/FS capacity, store/load operations and bytes, transfer latency, TTFT/TPOT/E2E/goodput, hit/recovered tokens.
- Minimum falsifier: all pairwise rankings retain direction and uncertainty-overlap classification across the three carrier families and capacities.
- Failure region: large cache capacity or uniformly high reuse where all policies converge.

## Collision and evidence boundary

- `DIRECT_FATAL`: none found within bounded search.
- `DIRECT_SUBTRACT`: semantic-cache policy study (arXiv:2608.20280) and KV-compression benchmark (arXiv:2607.05399) subtract generic benchmarking novelty.
- `SEARCH_BOUNDED_OPEN`: current vLLM docs/source plus recent primary-paper queries through 2026-08-30.
- Claim ceiling: benchmark-validity hypothesis only; no performance gain or deployment generalization claimed.

## Fidelity closure plan

- Status: `FINITE_FIDELITY_GAP`.
- StageA preclaim: pin vLLM commit; verify LRU/ARC/custom policy interface; freeze exact trace versions, tokenizer and request scaling; implement only the minimal simple comparator; assert same information and capacity; define deterministic run/replay schema.
- Small witness: short synthetic stream where LRU and ARC have analytically checkable hits plus one 20-request slice from each carrier.
- Structural failure: policy metrics cannot be obtained without changing vLLM semantics, carrier timings cannot be aligned without fabricating arrivals, or all candidate policies collapse to the same native action.
- 72-hour probe: static interface closure plus deterministic small replay plan; no main-result requirement at Discovery.

## Q1/Q2 sufficiency hypothesis

The paper shape is a reproducible benchmark/measurement contribution with a decision-changing validity endpoint, public carriers, current native baselines and full-cost accounting. It is tentatively Q2-viable; Q1 potential would require broader independent stacks, real deployments and a stable explanatory law, none claimed here.

## AI/researcher boundary

AI can prepare adapters, manifests, deterministic replay and analysis. Human review remains necessary for venue choice, interpretation of external validity and any unpublished workload claims.
