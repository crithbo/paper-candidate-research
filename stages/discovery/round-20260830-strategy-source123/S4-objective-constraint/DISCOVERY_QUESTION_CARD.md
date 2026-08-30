# SOURCE123 S4 Discovery Research Question Card

## Identity

- Card ID: `S4-123-QC01`
- Discovery lane / assignment: `DISCOVERY_S4 / DISCOVERY-S4-20260830-SOURCE123`
- Source divergence seed ID/path: `S4-123-SEED-01 / DISCOVERY_DIVERGENCE_SEED_POOL.md`
- RQ candidate ID/path: `S4-123-RQ01 / DISCOVERY_RQ_CANDIDATE.md`
- Exact public identity: vLLM `v0.28.0`, release commit short ID `2cf0a69`, `CompilationConfig.cudagraph_capture_sizes` plus `CudagraphDispatcher`.
- Project / benchmark: `vllm-project/vllm`; official `vllm bench serve` with BurstGPT or held-out ShareGPT.
- Version / date: `v0.28.0`, released 2026-08-26; checked 2026-08-30.
- Carrier kind: `NATURAL` when BurstGPT timed trace is used; `CANONICAL_BENCHMARK_ONLY` for ShareGPT/random feature-regression panels.
- Network-security exclusion check: `PASS`.

## Global canonical identity preflight

- Frozen lookup surface: related `registry.yaml` snapshot `3FF841EA63E13F254EC4413B8652CCA7E3831A6589CC403EB0BD962F485D6383` plus plan Source123 dashboard.
- Prior canonical identity/certificate matched: none for CUDA Graph capture-size portfolio; plan only mentioned a broad earlier CUDA graph/compile-cache source rotation.
- Five-field relation — object: `NONE`.
- Five-field relation — action or estimand: `NONE`.
- Five-field relation — claim endpoint: `NONE`.
- Five-field relation — semantic guarantee: `NONE`.
- Five-field relation — full-cost boundary: `NONE`.
- Frozen direct current collision hit: `NO`.
- Mechanical identity disposition: `NO_MATCH`.
- Reminder: this is not novelty evidence.

## Two-sentence problem and insight

- Problem: Current vLLM eagerly prepares a fixed, dense set of CUDA Graph batch sizes; official source and documentation acknowledge that graph count trades startup time and GPU memory against replay performance, while the dispatcher pads an observed token batch upward to a captured size or falls back to eager execution.
- Proposed insight: A target-native capture-set selector may choose an ordered subset from a frozen calibration trace under startup and graph-memory budgets, minimizing finite-horizon padding/fallback service cost without changing model outputs or serving semantics.

## Research contract

- Exact object and immutable semantics: vLLM V1/MRv2 single-GPU model execution at `v0.28.0`; identical model/weights, device, request stream/order, sampling/decoding, attention backend and outputs.
- Same-object problem: select `cudagraph_capture_sizes` before serving; runtime dispatch remains the native `CudagraphDispatcher`.
- Decision affected: the finite ordered set of batch/token sizes captured for CUDA Graph replay.
- Contribution type: `COMPILER_TOOL` with `N2`; a supporting `MEASUREMENT_CHARACTERIZATION/N3` route is allowed only if a stable held-out law is observed later.
- Claim endpoint: target-native capture-set selection that improves the non-dominated full-cost frontier versus current vLLM defaults.
- Counterfactual consequence: under the same startup/memory budget and request trace, the selected set changes padding/fallback incidence and finite-horizon latency/throughput cost.
- Non-generic discriminator hypothesis: vLLM's one-sided next-size padding, `NONE` fallback, mode-dependent valid keys and size-by-LoRA/mode key multiplication create a target-native cost surface that a generic batch-size tuner does not model. This is supported by current `CompilationConfig` and dispatcher source, but still must survive the generic ordered-segmentation subtractor.
- Initial full-cost boundary: configuration/profiling overhead; CUDA Graph capture/warmup wall time; peak/resident graph memory; graph/key count; startup-to-ready time; TTFT/TPOT/P50/P99/E2E latency; throughput; padding and eager-fallback counts; held-out trace horizon; failures/OOM; implementation and replay overhead.

## RAW_REQUIRED evidence minimum

- Opportunity/problem anchor: official `v0.28.0` configuration source fixes a dense default pattern and explicitly notes startup/memory pressure; official memory docs recommend reducing captured sizes.
- One versioned current source locus: `v0.28.0/vllm/config/compilation.py` and current `vllm/v1/cudagraph_dispatcher.py`.
- Known direct-fatal check at this locus: `NONE_FOUND_WITHIN_BOUND`.
- Strongest skeptic objection: upstream RFC #20098 already proposes lazy capture and explicitly suggests fewer eager sizes; Foundry makes cold-start capture nearly disappear using offline context materialization; the remaining selector may be ordinary weighted segmentation/knapsack.
- Preliminary residual hypothesis: current vLLM has a fixed heuristic/manual knob but no integrated, held-out, budget-constrained size-set selector; the residual is the target-native selection rule and its full-cost validation, not the observation that fewer graphs start faster.
- Search boundary: 24 official-source search/open calls across current source/docs/releases/benchmark, upstream RFC/issues and arXiv primary papers; no global novelty claim.

## Cheapest decisive test

- Minimum falsifier: on a frozen small model and two held-out official carriers, either the current default/manual small-set baseline is Pareto-undominated under all registered budgets, or the candidate reduces only startup/memory by accepting proportional padding/fallback service loss with no stable full-cost advantage.
- Small witness/oracle: batch-token domain `1..64`, exact native upward-padding mapping, measured per-size capture cost/memory and replay/fallback cost, exhaustive subset oracle under two predeclared budgets.
- Finite closure route: static exact-tag source audit; implement a read-only profiler and offline selector in Stage A; validate against exhaustive small oracle; freeze calibration/held-out splits; run current default, official small set, eager, candidate and oracle ceiling.
- Stop/narrow condition: current-tag source contains an equivalent optimizer; Foundry or another current artifact directly dominates under the same offline/storage assumptions; no held-out frontier gain; or residual collapses to generic tuning.
- Missing evidence that is not itself scientific failure: exact `v0.28.0` dispatcher tag content transport, Linux/vLLM execution environment, actual per-size memory/capture measurements and main results.

## Bounded closure debt

- Complete default/non-default current union: `OPEN_BOUNDED` — exact tag dispatcher, related current PRs and all flags; owner `STAGE0`; failure can direct-subtract or stop.
- Strongest recent-paper/implementation subtractor: `OPEN_BOUNDED` — Foundry/Medusa artifact and same-assumption comparison; owner `STAGE0` then `STAGEA_PRECLAIM`.
- Complete genealogy/contrary route: `OPEN_BOUNDED` — lazy RFC and CUDA Graph materialization lineage; owner `STAGE0`.
- Small native/formal witness: `OPEN_BOUNDED` — exact subset oracle and legality checks; owner `STAGEA_PRECLAIM`.
- Checker/interface availability: `OPEN_BOUNDED` — official logging exposes padding/runtime-mode stats, but full capture memory/cost producer needs preclaim closure.
- Natural/canonical corpus: `OPEN_BOUNDED` — official BurstGPT/ShareGPT routes exist; exact immutable split and licensing/provenance must be frozen before resource action.
- Full-cost protocol: `OPEN_BOUNDED` — units and denominators specified above; exact producers pending Stage A.
- Q1/Q2 calibration: `OPEN_BOUNDED`; owner `STAGE0`.
- Maximum decisive source questions: three: equivalent optimizer, Foundry same-assumption dominance, and generic-kernel residual.
- Claim ceiling while open: `CONDITIONAL_TIER_B_SYSTEMS_TOOL_HYPOTHESIS__NO_PERFORMANCE_RESULT`.

## Source-closure recovery

- Missing single public artifact: exact `v0.28.0` dispatcher view; one open attempt returned a connector internal error, main-current source was available.
- Pre-RQ closure nomination: `ORDINARY_CLOSURE`.
- Model route: frozen lane Sol/high; no separate selective-depth packet.
- Packet result: `CLOSED_TO_TYPED_RQ`.
- Queue disposition: `NOT_NEEDED`; the tag-specific dispatcher check is bounded Stage 0 debt rather than an exhausted queue.
- Attempt counter: `24 search/open`; no routes remain within this assignment budget.
- Resource inventory reconciliation: `NOT_APPLICABLE` — connector content was not persisted and no resource root was created.

## Front-end disposition

- RQ audit: `RQ_COMPLETE`.
- RAW_REQUIRED audit: `COMPLETE`.
- Closure debt: `OPEN_BOUNDED`.
- Identity relation: `FRESH` within frozen registry surface, not a novelty claim.
- Disposition: `EVIDENCE_QUALIFIED_RAW`.
- Eligible for C0: `YES`.

