# Source122 S2 primary RQ

- Exact carrier: current vLLM `TieringOffloadingManager` and `TieringOffloadingSpec` official API/source loci.
- Exact mechanism: secondary-tier hits reserve CPU-primary slots immediately as in-flight, promotions are batched and submitted at schedule-end, and a full primary tier converts an otherwise reusable block into unavailable work.
- Primary RQ: Under a fixed single-GPU tiered-KV workload, can promotion-reservation pressure and expected batch transfer completion be incorporated into request admission so secondary-tier hits do not create avoidable recomputation or queue stalls when the CPU primary tier is saturated?
- Contribution type: `SYSTEM_ARCHITECTURE / METHOD_ALGORITHM`.
- Atomic action: defer or reorder admission using in-flight primary-slot demand and bounded promotion-completion estimates, without changing request semantics or cache contents.
- Comparator: current vLLM tiering manager with LRU/ARC primary policy and unchanged secondary tiers.
- Full-cost boundary: TTFT/TPOT, recomputed prefill tokens, promotion bytes/jobs/failures, primary-slot occupancy, queue delay, scheduler CPU time and peak host memory.
- Minimum falsifier: current scheduler already consumes the same promotion-pressure signal, or a current same-object system already implements this action under equivalent information and cost.
