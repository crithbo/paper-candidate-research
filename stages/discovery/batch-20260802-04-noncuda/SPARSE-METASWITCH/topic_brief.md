# SPARSE-METASWITCH Metadata-aware sparse dataflow switching

- Status: `PROPOSE_STAGE0`
- Primary lane: accelerator algorithm/approximation Pareto
- Discovery date: 2026-08-02

## Research question

Can a sparse-tensor accelerator choose representation, tile shape, and dataflow per density regime while charging re-encoding, metadata, and switching costs, so that its realized energy/latency Pareto frontier improves over a single static sparse format?

## Importance and group fit

Sparse accelerators often count zeros avoided but treat format metadata and regime transitions as free. The proposed object is a realizable distributional policy with explicit conversion cost, not an offline sweep of mapping knobs.

## Exact object

Sparseloop/Timeloop-modeled tensor operators with a finite set of encodings/dataflows, a density/shape trace, bounded format cache, and explicit encode/decode/metadata/switching ledger. Decision: partition trace regimes and select a resident format/dataflow policy.

## Strongest fair baseline

Sparseloop/Timeloop best fixed mapping per workload, fixed format chosen from the same menu, oracle per-instance mapping without switching feasibility, and a fair hysteresis cache baseline.

## Mechanism hypothesis

The useful state is a format-residency interval, not a per-layer best mapping: amortized metadata and re-encoding create a threshold structure that can yield a robust non-dominated policy.

## Competing mechanisms

- Mechanism A: amortized residency-threshold policy; prediction: fewer switches yet better realized Pareto points; counterexample: per-instance oracle is feasibly attainable.
- Mechanism B: metadata-capacity-aware encoding selection; prediction: capacity changes the selected representation, not just energy scaling; counterexample: metadata is always negligible.
- Mechanism C: robust density-bin coarsening; prediction: coarser regimes resist density-estimation error; counterexample: fine bins dominate after switching cost.
- Preferred mechanism and why: A supplies a falsifiable policy structure and prevents ordinary autotuning framing.

## Candidate paper claim

For public sparse tensor traces and a fixed accelerator model, residency-threshold selection produces a realized latency/energy/metadata Pareto point that static-format and unconstrained-oracle baselines cannot match under identical conversion accounting.

## Current collision subtraction

Sparseloop explicitly models sparse-feature savings and overhead, making it a strong `DEPLOYMENT_BASELINE`. Existing mixed-precision/quantization Pareto work is `METHODOLOGICAL_ADJACENT`. No bounded search result was found for the same stateful representation-residency decision; `SEARCH_BOUNDED_OPEN`.

## Decisive falsifier

Stop if sparsity/format variation in natural traces is too small, conversion cost eliminates every gain, or the simulator already represents the same stateful policy and a fixed/hysteresis baseline reproduces it.

## Executable evidence path

### 72-hour first evidence

Use Sparseloop examples and synthetic-then-public sparsity traces, implement the ledger/policy outside the simulator, and report realized versus ideal fronts for one operator family.

### AI core fraction and critical path

`AI_CORE_EXECUTABLE`, about 0.77. AI can reproduce mappings, code the policy and accountant, and run analytical evaluation; results must be labeled as modeled, not silicon PPA.

### Semantics-preserving open alternatives

Timeloop/Sparseloop is the intended same-object analytical substrate. An RTL implementation is not needed for the first mechanism gate.

## Dual-axis score

- Academic value: `56/70`
- AI executability bonus: `24/30`
- Total: `80/100`

## AI and researcher boundary

AI can complete the modeling/algorithm path; the researcher decides whether later RTL or hardware evidence justifies a broader claim.
