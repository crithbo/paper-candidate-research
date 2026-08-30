# Discovery Divergence Seed Pool

## Pool metadata

- Assignment / lane: `DMR-V1-PSHADOW-CYCLE-02-S6` / `DISCOVERY_S6_DIRECT_ALGORITHM_SOFTWARE`
- Frozen profile: `O7 direct algorithm/software`; `RQ_REFINEMENT_STAGED_EVIDENCE_V1`
- Seed ceiling: `<=12`; actual: `1`
- Network-security exclusion check: `PASS`
- Generation completed before evidence lookup: `YES`
- Freeze timestamp: `2026-08-30T01:40:00+08:00`

## Seed records

### `S6-02-SEED-01`

- Engine: `CONSTRAINT_MANIPULATION`
- Perspective role: `COMPILER_OR_BACKEND_ENGINEER`
- Starting anchor or hunch: `EricLBuehler/mistral.rs` current-main paged-attention/prefix-cache scheduler surface named by the frozen context.
- Intended source role: `ANCHOR`
- Two-sentence idea sketch: Under a fixed multimodal prefix-cache and decode semantic contract, fragmentation may create a decision about when and how live pages are relocated. The only admissible follow-up is whether a target-native compaction action exists that is distinct from eviction, admission, or a generic allocator policy.
- Conclusion-first test: If successful, the narrowest claim would concern a same-semantics page-relocation decision under a frozen topology and full-cost boundary; it would matter only if it changes a concrete caching/scheduling decision.
- Exact structural mapping, tension or manipulated constraint: preserve cache contents and decode semantics while changing physical page placement/timing.
- Counterfactual consequence if the idea were true: the native scheduler would select a relocation/compaction action rather than only retain, evict, or admit pages.
- Likely generic/current-union/changed-object risk: `HIGH`; native current code may already express the action, or the residual may collapse to a generic allocator/eviction wrapper.
- Evidence needed before it can become a locator: exact current scheduler/page representation, public multimodal prefix-cache carrier, named current action/configuration locus, and one finite non-generic discriminator.
- Relation to existing seed/family: `FRESH_SKETCH`
- Generic-shell noun-swap test: `PASS_PENDING_EVIDENCE`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

## Coverage-constrained convergence

| Selected seed | Why this preserves portfolio coverage | Intended object/problem boundary | RQ Candidate ID |
|---|---|---|---|
| `S6-02-SEED-01` | Direct software action under a fixed cache/decode contract; no alternate seed is needed before evidence closure. | Current `mistral.rs` paged-attention/prefix-cache scheduling, excluding changed eviction, model, or decoding semantics. | `S6-02-RQ01` |
