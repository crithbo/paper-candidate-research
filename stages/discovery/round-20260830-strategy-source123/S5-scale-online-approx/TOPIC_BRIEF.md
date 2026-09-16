# VLLM-PREFIX-FUTURE-KV-RESERVATION-REV0 PrefixReserve：单 GPU continuous batching 的 prefix-aware future-KV admission contract

## 中文摘要

- 机会：vLLM V1 当前按本轮 token 需求增量分配 KV slots；分配失败时 preempt running request，并在 V1 以 RECOMPUTE 恢复。请求已有有限 `max_tokens`，prefix cache 又提供共享块结构，因此可以把“ admitted request 的最大剩余私有 KV 增长”冻结为显式 reservation contract。
- 贡献形状：联合 prefix refcount、private decode growth、prefill chunk/token budget 与 active-set admission，在不改变生成语义下保证 admitted finite-cap requests 不因 KV capacity 被 preempt；用在线 prefix-tree 算法降低静态 worst-case reservation 的利用率损失。
- 当前门：TOPAS、Preble、Sarathi、FastServe 是强 subtractors；Stage 0 必须独立闭合 output-length/admission paper union 与当前 KV manager source，防止 generic admission/knapsack collapse。
- 结论：`PROPOSE_STAGE0 / TIER_B_Q2_VIABLE`，不主张性能、新颖性或 current absence 已证明。

- Status: `PROPOSE_STAGE0`
- Quality tier: `TIER_B_Q2_VIABLE`
- Origin: `O5`
- Contribution: `N2`
- Type: `SYSTEM_ARCHITECTURE / METHOD_ALGORITHM`
- Method: `RQ_REFINEMENT_STAGED_EVIDENCE_V1 / PRODUCTION`; claim-pack `OFF`
- Family: `VLLM-PREFIX-FUTURE-KV-RESERVATION`
- Carrier: `IMPLEMENTATION_CARRIER_ONLY`, public serving benchmark/Mooncake trace route

## Research question

Can a prefix-tree-aware future-private-KV reservation policy select the single-GPU active set and prefill chunks using only finite request caps and current state, guaranteeing no KV-capacity recompute preemption for admitted requests while improving full-cost goodput/latency over current vLLM/SGLang and strongest paper baselines?

## Claim package

- Exact object: vLLM-like single-GPU active running/waiting batch, PagedAttention blocks, prefix-cache refcounts.
- Atomic action: reserve maximum remaining private blocks on admission; charge shared prefix blocks marginally; jointly choose feasible requests/chunks; release on early stop.
- Information: prompt/cap/prefix/current occupancy only; actual output length is oracle-only.
- Guarantee: identical token semantics and zero KV-capacity preemption for admitted finite-cap requests.
- Comparators: vLLM FCFS/priority/fixed caps/chunked prefill; static worst-case reservation; simple cap-sum greedy; SGLang LPM/DFS/LOF; Sarathi; FastServe; Preble; TOPAS; offline oracle.
- Full cost: used/reserved/stranded blocks, TTFT/ITL, throughput/goodput, queue delay, prefix lookup, preemptions and recompute tokens.
- No-gain region: loose/unbounded caps, no sharing/preemption, outputs reach caps, or static caps already optimal.
- Minimum falsifier: current/paper union implements the same object/action/guarantee, or simple baselines dominate after full cost.

## Current-upstream reality check

- Version/date: vLLM and SGLang current `main`, official docs, retrieved 2026-08-30; Stage 0 must pin commits.
- vLLM loci: `Scheduler.schedule` allocation/preemption loop; `SchedulerConfig` token/sequence/chunk/policy fields; official Preemption/Chunked Prefill docs; `SamplingParams.max_tokens`.
- SGLang loci: `CacheAwarePolicy.LPM/DFS_WEIGHT`; FCFS/LOF/random/routing-key; prefix matching and in-batch prefix handling.
- Support: inspected vLLM loop allocates current slots then preempts on failure; official docs recommend adjusting static caps/memory.
- Contrary: SGLang already exposes prefix/output queue order; TOPAS jointly schedules prefix states and ready work.
- Residual statement: no full-future private reservation was observed in these bounded loci. This is `SEARCH_BOUNDED_OPEN`, not an absence claim.

## Collision

- `DIRECT_SUBTRACT`: Sarathi chunked prefill; FastServe preemptive scheduling; Preble distributed prefix-aware scheduling; TOPAS agent-workflow prefix-state/admission joint search.
- Residual: single-GPU active-set feasibility with request-declared cap, prefix-refcount accounting, and hard no-capacity-preemption guarantee.
- Highest risk: TOPAS or an output-length-aware scheduler may contain the action after full-text/source review.

## Fidelity closure plan

- Status: `FINITE_FIDELITY_GAP`.
- Native action: actual vLLM scheduler + KV block/refcount manager; no synthetic cache substitute.
- Small witness: exact block-table/refcount/cap packet with exhaustive feasible-active-set oracle and token-output equivalence.
- Finite route: pin commits → complete current/paper union → freeze request schema and result-independent packet → simulator/oracle → native A0 control → separate claim run.
- Structural failure: cap missing/unbounded, semantics/truncation changes, direct absorption, or generic baseline wins.

## Evidence and quality route

- Natural/canonical: vLLM serving benchmark and Mooncake conversation/tool-agent trace family; Stage 0 must verify exact schema and prohibit output-length leakage.
- 72-hour evidence: static source closure + formal small-state oracle + native integration preflight, not a main result.
- Q2: new runtime contract, nontrivial online algorithm, exact implementation, public traces, strongest baselines, full cost.
- Q1: formal competitive bound plus multiple workloads/runtimes and SLO goodput.
- Resource realism: CPU simulator and single RTX 4070 route appears finite; no resource action was run.

## Integrity

- Same-object explicit; inactive cache replacement excluded.
- Strong baselines named.
- Full cost frozen.
- Exact semantics required.
- Current union/Q2 remain independent Stage 0 debt.
- No performance or novelty conclusion claimed.

