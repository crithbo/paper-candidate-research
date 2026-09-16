# Discovery Research Question Candidate

- RQ ID: `S4-107-RQ02`; seed: `S4-107-02`.
- Anchor: PyTorch `torch.compile` dynamic-shape documentation.
- Primary RQ: dynamic-shape specialization是否有不同于 native automatic dynamic、`mark_dynamic`、cache/recompile limits 和 explicit shape dispatch 的 single-GPU SLO action？
- Earliest falsifier: native documentation already exposes the same information/action contract.
- Pre-RQ result: `EARLY_FATAL`.

## Closure audit

- Exact object/action/claim endpoint: `torch.compile`/Inductor dynamic-shape compilation of one function; decide static/dynamic specialization and recompile response for a shape regime.
- Current source locus and version/date: `https://docs.pytorch.org/docs/main/user_guide/torch_compiler/torch.compiler_dynamic_shapes.html`, PyTorch `main`, accessed 2026-08-24.
- Direct coverage mapping: current docs define specialization/recompile on a new shape; automatic dynamic marks changed dimensions after recompile; `mark_dynamic`, `maybe_mark_dynamic`, dynamic/static source lists and `eager_then_compile` expose the same information/action choices.
- Contrary evidence: docs state forcing `dynamic=true` can create bugs, performance regressions and higher compilation time; this is the proposed cold/steady/full-cost tradeoff already named by the current system.
- Full-cost boundary: compile/recompile count, shape guards, specialization, dynamic-kernel execution and first-batch cost; excludes model-quality changes and unmeasured deployment costs.
- Query/stop boundary: one official dynamic-shapes current page, exact RQ action and its native alternatives; stop at direct current coverage. Result: `EARLY_FATAL` limited to generic dynamic-specialization action.
