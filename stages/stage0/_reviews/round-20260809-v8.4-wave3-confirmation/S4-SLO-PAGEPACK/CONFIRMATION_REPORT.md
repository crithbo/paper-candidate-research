# S4-SLO-PAGEPACK — Independent Stage 0 Confirmation

- Assignment: `STAGE0-C1-20260809-S4-SLO-PAGEPACK-CONFIRM-V8.4`
- Role/mode: `STAGE0-CONFIRMATION-SENTRY`
- Review date/cutoff: 2026-08-09
- Scope: independent confirmation of the frozen Discovery and PRIMARY package. No solver, replay, implementation, trace download, hardware run, Stage A/B, or object/mechanism change was performed.

## Input integrity

- Discovery manifest: **4/4** artifacts independently recomputed and matched.
- PRIMARY manifest: **4/4** artifacts independently recomputed and matched.
- Provenance/file conflict: none observed.

## Verdict

**`CONFIRM`** — PRIMARY's `PASS_RECOMMENDED / TIER_B_Q2_VIABLE` is confirmed as a **conditional Stage 0 paper-potential** decision.

- Structural potential if the stated hypothesis succeeds: `TIER_B_Q2_VIABLE`.
- Current readiness: `LOW_TO_MODERATE__FINITE_CPU_ROUTE`.
- Research route: `N2_NEW_ALGORITHM_OR_OPTIMIZATION`.
- AI route: `AI_CORE_EXECUTABLE` for the first bounded CPU probe; no human-research reserve is indicated at Stage 0.
- `DIRECT_FATAL`: not established.
- Stage A/B, experiment, revision, or mainline-status authorization: **none**.

This is not a result PASS. It asserts neither a solver residual, a performance result, a concurrency-correct runtime, nor a natural-trace result.

## Exact object and pointer-safety boundary

The frozen object is closed enough for a conditional paper-shape decision: an epochal unmanaged pointer-based object heap, pointer-safe relocation, 4 KiB page-tiering backend, trace-defined GET/SET semantics, and a fixed slowdown/SLO cap. The claim fixes function (GET/SET outcome, update visibility, lifetime, and concurrent pointer validity), backend, page size, and cost boundary; it prohibits an admission/eviction controller, changed cache semantics, or changed backend.

The still-uninstantiated pointer/concurrency part is a Stage A instance-boundary issue, not an undefined research object. OBASE supplies a concrete, same-class feasibility envelope: guide-mediated annotated pointer fields, no hidden unmanaged aliases, no pointer arithmetic or physical-contiguity assumption for managed objects, and a concurrent relocation protocol. Stage A must freeze one CacheLib-compatible, OBASE-admissible object model and record which pointers/mobility fields are valid. It must not fabricate mobility from an operation trace alone or silently substitute trace-only pseudo-objects.

If such a same-object instance cannot be constructed from the selected public artifact, the correct consequence is an evidence ceiling or an executable blocker package—not a STOP and not a cross-object replacement. The candidate's conditional paper potential remains well posed.

## N2 residual versus strong collisions

The official OBASE paper is a strong direct subtractor: it continuously groups objects into `NEW/HOT/COLD` regions using observed temperature and a cold-threshold control loop; its allocator creates contiguous temperature heaps for page backends. It does not, in the reviewed source, formulate page-slot assignment and bounded migration selection as a joint optimization under a fixed SLO/full-cost target.

The official MDK paper is the constraint-side direct subtractor: it maximizes memory savings subject to windowed performance proxies and provides policy tools, MPCs, and an offline optimal policy. Its reviewed formulation operates on page-access/reclamation policies; it does not introduce the source object's object-to-page layout as a decision variable.

Therefore the surviving N2 kernel is narrow but non-empty *if successful*: constrained page composition plus a migration set jointly selected under capacity, pointer-safe mobility, migration credit, and SLO/full-cost constraints. It is not a new hotness threshold, controller, or policy selector. If its implementation reduces to any of those, the N2 claim disappears and the topic stops.

## OBASE-to-MDK composition baseline

`OBASE layout -> MDK SLO target/policy replay` is a valid, necessary strong baseline only under this concrete contract:

1. Use the current OBASE layout action (not an idealized or strengthened layout optimizer), with fixed version and OBASE-compatible object model.
2. Apply an online/deployable MDK-style target/policy to the post-layout page trace using the same epoch information and causal availability as the candidate. MDK's offline OPP remains a ceiling only.
3. Freeze the same initial layout, 4 KiB pages, backend, epoch boundaries, mobility eligibility, SLO definition, and object/page trace mapping.
4. Charge both components' complete instrumentation, relocation, validation/indirection, metadata, background CPU, migration, TLB/huge-page, page-fault/I/O, warm-up, and repacking costs.

This is a faithful composition to be implemented or emulated in Stage A, not a theoretical universal union. OBASE's temperature layout and MDK's page-policy action do not structurally prove that every migration-aware packing point is reachable. Consequently, the composition is a decisive falsifier, not current fatal absorption.

## Finite CPU Stage A killer

The proposed `EXACT_REDUCED_EPOCH_SOLVER_AND_FAITHFUL_COMPOSITION_REPLAY_HAS_NO_STRICT_FULL_COST_RECLAIMED_BYTE_RESIDUAL_AT_FIXED_SLO` is honest and finite if it is executed as follows:

- Freeze one natural CacheLib/cacheMon replay slice and its object-model/mobility derivation before solving.
- Form a reduced legal object graph, 4 KiB slot model, migration credits, SLO/full-cost ledger, and OBASE + MDK configuration.
- Compare original layout, OBASE, MDK policy on original layout, faithful OBASE-to-MDK composition, candidate packing, and an exact small-instance ceiling.
- Report both no-gain regions and any strict residual; a residual disappearing after pointer-safety, trace, or full-cost charges is a negative result.

This is a CPU-only, bounded counterexample search and can yield claim-bearing evidence. Its positive ceiling is only `NOT_FALSIFIED / PRELIMINARY_SUPPORT`; it cannot establish the full paper claim. If the faithful composition absorbs the candidate across the stipulated natural epochs, or if all residuals vanish under the fixed semantics/cost ledger, that is the appropriate later scientific STOP condition.

## Source-verification record

The following first-party sources were checked for the stated support scope:

- [OBASE official OSDI 2026 paper](https://www.usenix.org/system/files/osdi26-banakar.pdf): unmanaged object frontend; guide-mediated, concurrent relocation; temperature heaps and threshold policy; page-backend decoupling.
- [MDK official OSDI 2026 paper](https://www.usenix.org/system/files/osdi26-patel.pdf): SLO-constrained page reclamation, MPCs, online policy framework and offline ceiling; no object-layout decision in the reviewed formulation.
- [HADES official author PDF](https://research.cs.wisc.edu/adsl/Publications/dimes25-banakar.pdf): same-class pointer-based relocation and front-end/backend separation.
- [CacheLib official repository](https://github.com/facebook/CacheLib): C++ cache engine and CacheBench route.
- [cacheMon official dataset repository](https://github.com/cacheMon/cache_dataset): public request/object-scale traces; not, by itself, evidence of pointer-mobility metadata.

No source was used to claim a realized candidate result. The current collision finding remains `SEARCH_BOUNDED_OPEN_WITH_TWO_DIRECT_SUBTRACTORS`, not a global novelty proof.

## Handoff boundary

No atomic revision is required: the record already states a closed conditional object and a bounded Stage A route. The mandatory Stage A precondition is an evidence-instance freeze (one OBASE-admissible CacheLib model and faithful composition contract), not a change in research object or mechanism. The sentry returns to `IDLE_REUSABLE_AWAITING_MAINLINE`.