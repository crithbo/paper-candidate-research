# Question Card S5-123-01

## Identity

- Assignment: `DISCOVERY-S5-20260830-SOURCE123`
- Exact object: single-GPU vLLM-like PagedAttention active-set admission and prefill chunking under finite request-declared generation caps.
- Exact public identity: vLLM V1 scheduler/config/sampling/optimization docs; SGLang schedule policy; retrieved 2026-08-30.
- Carrier: `IMPLEMENTATION_CARRIER_ONLY`; vLLM serving benchmark and Mooncake trace are bounded natural/canonical routes.
- Network-security exclusion: `PASS`.

## Identity preflight

- Frozen related registry: no exact/terminal five-field identity; ordinary cache replacement and TorchDynamo guard-cover are explicitly excluded.
- Relation: object `NONE`; action `NONE`; endpoint `NONE`; guarantee `NONE`; full cost `RELATED_ONLY`.
- Direct collision: `NO_KNOWN_FATAL_WITHIN_24_CALL_BOUND`.
- `NO_MATCH` is not novelty evidence.

## Research contract

- Problem: current vLLM source schedules incremental tokens, asks `allocate_slots`, and preempts a victim when slots cannot be allocated; official docs state V1 recomputes preempted requests. Public tuning uses memory fraction and fixed sequence/token caps.
- Atomic action: before admitting a waiting request or prefill chunk, reserve its maximum remaining private KV blocks; charge immutable shared prefix blocks once through refcounts; select a feasible active set under KV and per-step token budgets; release reservation as generation finishes.
- Contribution type: `SYSTEM_ARCHITECTURE / METHOD_ALGORITHM`, route `N2`.
- Endpoint: exact no-KV-capacity-preemption guarantee for admitted finite-cap requests plus a full-cost goodput/latency objective.
- Information: prompt length, finite `max_tokens`, prefix block identity/refcount, current occupancy, queue state; no actual future output length.
- Non-generic discriminator: the resource grows one paged block stream per sequence, immutable prefix blocks are shared, and prefill chunking consumes immediate compute while materializing future private state.
- Full cost: reserved/used blocks, stranded reservation, token budget, TTFT, ITL, throughput/goodput, queue delay, prefix matching, preemptions, discarded/recomputed tokens.

## RAW_REQUIRED evidence

- Current source locus: vLLM `allocate_slots`/preemption loop; scheduler config fields; `SamplingParams.max_tokens`.
- Current opposite evidence: SGLang has LPM/DFS-weight/LOF and in-batch prefix handling; TOPAS jointly schedules prefix states and ready work; Preble handles distributed prefix-aware scheduling.
- Preliminary residual: hard future-private-KV feasibility for a single active GPU, not prefix eviction/residency or distributed routing.
- Known direct fatal: `NONE_FOUND_WITHIN_BOUND`.
- Strong objection: worst-case reservation is a trivial static cap and loses too much utilization; TOPAS/output-length schedulers may already subsume it.

## Cheapest decisive test

- Minimum falsifier: pinned current source already reserves full remaining private growth; strongest paper implements the same single-GPU object/action/guarantee; or tuned `max_num_seqs/max_num_batched_tokens` matches policy after full cost.
- Small witness: two requests share a prefix and one independent request competes for a fixed block pool; current incremental admission preempts, while marginal prefix-aware reservation proves feasibility.
- Finite route: pin commits → expose block/refcount/cap ledger → implement pure scheduler simulator on exact request schema → exhaustive small-state oracle → only then native control.

## Bounded debt

- Complete current vLLM KV manager/scheduler union: `OPEN_BOUNDED`, owner Stage 0.
- Output-length/admission paper union beyond four subtractors: `OPEN_BOUNDED`, owner Stage 0.
- Exact benchmark/trace schema and no-future-leak contract: `OPEN_BOUNDED`, owner Stage 0/A0.
- Native hook and block accounting: `OPEN_BOUNDED`, owner Stage A preclaim.
- Q2 venue shape: `OPEN_BOUNDED`, owner Stage 0.
- Claim ceiling: no performance or global absence claim; proposal is conditional on independent closure.

## Disposition

- RQ: `COMPLETE`
- RAW_REQUIRED: `COMPLETE`
- Closure debt: `OPEN_BOUNDED`
- Identity: `SEARCH_BOUNDED_OPEN`
- Disposition: `EVIDENCE_QUALIFIED_RAW`
- Eligible for C0: `YES`

