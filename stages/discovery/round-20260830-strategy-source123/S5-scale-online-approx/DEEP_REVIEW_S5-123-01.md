# Type-specific deep review S5-123-01

## Atomic algorithm skeleton

`PrefixReserve` tracks two ledgers:

1. actual blocks: refcounted prefix blocks plus private prompt/decode blocks;
2. reservation blocks: each admitted finite-cap sequence's maximum remaining private growth.

At each scheduling step it selects waiting requests and prefill chunks subject to both KV feasibility and immediate token budget. Shared prefix blocks are charged by marginal refcount; future generated blocks are never shared. A request is admitted only if all currently admitted requests can reach their declared caps without KV-capacity preemption. Actual early stops release reservation.

A laminar prefix tree permits a tree-DP/offline oracle and a bounded online primal-dual or threshold policy. This is a proposed algorithmic route, not an achieved guarantee.

## Anti-collapse

- Not ordinary replacement: no decision concerns which inactive cache object to evict.
- Not only tuning: the action creates a per-request reservation contract and changes active-set feasibility.
- Not LPM/LOF: prefix benefit and future private growth enter one feasibility problem rather than independent queue sorting.
- Not Sarathi: chunk size is constrained by future memory reservation, not only per-step compute/latency balance.
- Not FastServe: the goal is preventing KV-capacity preemption for admitted requests, not making preemption cheap/fine-grained.
- Main generic-collapse risk: if reservation is equivalent to lowering `max_num_seqs` or an elementary knapsack with no prefix-specific theorem/implementation consequence, the topic fails Q2.

## Current union/subtraction

| Source | Covered | Residual |
|---|---|---|
| vLLM V1 | Incremental slot allocation, FCFS/priority, chunked prefill, RECOMPUTE preemption, fixed caps | No observed full-future private reservation in inspected scheduler loop. |
| SGLang | LPM, DFS-weight, FCFS, LOF, random, routing-key; in-batch prefix matching | No observed joint finite-cap reservation guarantee in inspected policy locus. |
| Sarathi-Serve | Chunked prefill and stall-free batching | Future KV feasibility residual. |
| FastServe | Token-level preemption plus state offload | Opposite preemption tradeoff baseline. |
| Preble | Distributed prefix-aware scheduling with E2/local scheduler | Single-GPU active-set guarantee residual. |
| TOPAS | Joint agent prefix residency and ready-request admission under shared memory | Different object includes workflow DAG/prefix keep; strongest direct subtractor. |

## Predictions and null

- Benefit: mixed shared-prefix workloads with heterogeneous finite caps where current incremental admission causes recompute.
- Signature: zero KV-capacity preemptions for admitted requests, lower recompute tokens and tail latency than current; better utilization than static worst-case `max_num_seqs` through marginal prefix accounting and released reservations.
- No gain: caps are loose/unbounded, no prefix sharing, no current preemption, or actual outputs nearly always reach caps.
- Strong null: tuned current caps or a simple cap-sum admission rule matches the proposed method.

## Fidelity closure

- Status: `FINITE_FIDELITY_GAP`.
- Native semantics: real vLLM request cap, KV block/refcount manager, current scheduler and prefix cache; no proxy-only result may support the claim.
- Small witness: exact block table and request completion equivalence against current runtime semantics.
- Finite steps: pin source → enumerate union → freeze request schema/packet → pure oracle/simulator → native nonclaim control → only later claim workload.
- Structural failure: cap unavailable for target requests, reservation changes outputs/truncates, current union absorbs action, or generic simple baseline dominates.

## Q2/Q1 hypothesis

- Q2: exact reservation abstraction + nontrivial prefix-tree online algorithm + vLLM implementation + public trace/benchmark + full-cost strongest baselines.
- Q1: provable competitive/goodput guarantee under justified prefix/cap distributions and broad traces/runtimes.
- Discovery label: `TIER_B_Q2_VIABLE`, conditional on Stage 0 current-union and generic-collapse review.

