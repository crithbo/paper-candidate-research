# Candidate-grade deep reviews

These are admission investigations, not candidate briefs. `DISCOVERY_QUALITY_MODE=OFF`: no R7 collision-first or depth-redteam behavior was used to decide them. Current-doc/source records are frozen at 2026-08-11; when no open upstream repository/config surface was found in the bounded first-party search, that is recorded as `NOT_ADMITTED_UNFROZEN`, never as an absence claim or scientific DROP.

## MDK-SLO-DENSITY — NOT_ADMITTED_UNFROZEN

- Exact object: assign/reclaim memory for a fixed set of colocated datacenter jobs while preserving each frozen SLO contract.
- Atomic candidate action: choose a marginal reclaim amount for one job together with an admission slot for another under all current SLO budgets.
- Strongest same-information union: MDK's current SLO-driven density objective plus native job/memory reclamation actions. The official record establishes the changed objective, but the bounded source set does not expose an upstream atomic admission/reclamation interface, default policy, or nondefault configuration vocabulary.
- Six dimensions: decision and information are not yet separable from MDK's optimizer; resource includes reclaimed memory and interference; guarantee is all SLOs; full cost must include reclamation, job placement, performance loss and rejected capacity; generalization requires heterogeneous natural jobs. No complete second mechanism or fair finite union can yet be frozen.
- Current source/docs/flags: official OSDI '26 MDK presentation checked; no author/upstream source or default/nondefault flag contract found within the allowed first-party boundary. No absence claim is made.
- Natural carrier and finite closure: paper's datacenter job/SLO setting is a carrier; closure would require a public fixed job/SLO trace plus the native MDK action vocabulary and a small two-job legality witness.
- Fast killer if closure becomes available: enumerate one two-job witness; if every purported marginal action is an MDK admissible optimizer decision, direct absorption; if it relaxes an SLO, same-object failure.
- Structural paper potential: potentially `TIER_B_Q2_VIABLE` only if an action outside the native optimizer can be formalized. Current evidence readiness: `LOW__ACTION_AND_SOURCE_CONTRACT_UNFROZEN`, not a quality verdict.

## OBASE-OBJECT-TIERING — NOT_ADMITTED_UNFROZEN

- Exact object: a fixed concurrent unmanaged data structure whose observable operations remain linearizable while objects are placed/migrated across memory tiers.
- Atomic candidate action: move a maximal cold-object set to a cold tier while retaining a bounded hot-object page-density and lock-free operation guarantee.
- Strongest same-information union: OBASE pointer-instrumented access tracking, lock-free object migration, and unmodified page-tiering backends (kswapd/TMO/TPP/Memtis).
- Six dimensions: the exact migration selection may be a nontrivial N2 only if it differs from OBASE's current migration policy; it uses access/alias information, must charge pointer instrumentation, moves, page faults, tier bandwidth and backend work, and must keep linearizability. The available author record does not freeze the implementation's action/flag contract, so current absorption cannot honestly be resolved.
- Current source/docs/flags: author preprint and official OSDI '26 listing were checked. No official current repository, commit, default/nondefault migration control, or documented action API was found within first-party search; this is `NOT_ADMITTED_UNFROZEN`, not evidence that such controls do not exist.
- Natural carrier and finite closure: cited concurrent structures and production Meta/Twitter traces; a finite route is a small two-object alias/linearizability witness plus current implementation action extraction.
- Fast killer: if source reveals that a proposed cold-set choice is an existing OBASE policy parameter, direct subtract; if it needs a non-lock-free move, guarantee fails.
- Structural paper potential: possible `TIER_A/B` only for a new migration algorithm with a stated concurrency/approximation property. Current evidence readiness: `LOW__UPSTREAM_ACTION_CONTRACT_UNFROZEN`, not a DROP cause.

## REAL-EMULATION-PARTITION — DROP

- Exact object: emulate one fixed router topology/configuration using unmodified router containers and preserve the resulting vendor-specific control-plane behavior.
- Atomic proposed action: partition the router set into a sequence of resident subsets and iteratively converge each subset under a peak-memory budget.
- Strongest same-information union: REAL's lightweight data-plane boot path, two-phase convergence scheduling, and iterative convergence by network partitioning.
- Six dimensions: decision is exactly the resident subset/order; information is topology/configuration/convergence state; resources are containers, cache, CPU and peak memory; guarantee is vendor behavior; full cost includes boot, scheduling, convergence and reactivation; no-gain is a different partition threshold/order. The alleged action is already current.
- Current source/docs/flags: official NSDI '26 page and paper checked. The open paper specifies the constructor; no action-gap depends on code absence, so no unsupported flag absence is asserted.
- Natural carrier/fidelity/killer: fixed public router configurations plus container outputs; a one-partition witness would compare FIB/ACL equivalence. It fails immediately as current-action replay.
- Structural paper potential: `BELOW_Q2_STOP` for this proposed residual. Current readiness: source evidence is high and did not determine the drop.

## PD3-DPU-PREFETCH — NOT_ADMITTED_UNFROZEN

- Exact object: a fixed disaggregated-memory request stream served with identical returned values/consistency semantics, using the DPU/host boundary of the current system.
- Atomic candidate action: admit a request-derived remote prefetch only when a DPU queue/bandwidth cap and a no-pollution condition both hold.
- Strongest same-information union: PD3 request parsing, shortest-path remote fetch, RDMA/DMA offload and application-informed miss prediction.
- Six dimensions: the proposed decision risks reducing to PD3's prediction/dispatch policy; its information is request/application state; resources include DPU queues, RDMA/DMA, remote memory and cache; guarantee is identical response/consistency; full cost includes false fetches, DPU work and host savings; natural generalization needs the paper's applications/workloads. The public abstract does not expose a source-level default/nondefault action vocabulary.
- Current source/docs/flags: official NSDI '26 record checked; no official upstream repository or flag/threshold documentation found within the first-party bounded search. This blocks a fair action-gap claim, not the scholarly potential.
- Natural carrier/fidelity/killer: real applications/workloads cited by the official source; closure needs current code/config and a two-request same-value trace. If the action maps to PD3's existing predictor/dispatcher it is absorbed; otherwise test semantic equivalence before any performance claim.
- Structural paper potential: potentially `TIER_B_Q2_VIABLE` only if a new bounded online prefetch algorithm, rather than a policy retune, can be frozen. Current evidence readiness: `LOW__UPSTREAM_ACTION_CONTRACT_UNFROZEN`.

## SONIC-ORAM-EVICTION — NOT_ADMITTED_UNFROZEN (not a deep review)

The official Security '26 record provides an abstract but explicitly states that the final paper is embargoed. It documents RingORAM substitution, efficient batch evictions, and lock-free access/reshuffle/stash operations. A new eviction/batching action cannot be honestly subtracted without the final algorithm or an official upstream artifact. This is a source-access boundary: it is not a `DROP`, does not lower potential, and produces no brief.
