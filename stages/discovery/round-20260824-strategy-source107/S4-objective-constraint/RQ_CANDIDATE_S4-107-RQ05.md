# Discovery Research Question Candidate

- RQ ID: `S4-107-RQ05`; seed: `S4-107-11`.
- Anchor: vLLM public cache/benchmark sources.
- Primary RQ: warm cache state是否有不同于当前 benchmark reset/cache-control surfaces的同对象 benchmark-validity action？
- Earliest falsifier: current supported reset/cache record already controls the condition.
- Pre-RQ result: `EARLY_FATAL`.

## Closure audit

- Exact object/action/claim endpoint: vLLM automatic prefix caching in a fixed public long-document or multi-round conversation workload; decide whether warm cache reuse changes the reported serving outcome.
- Current source locus and version/date: `https://docs.vllm.ai/en/latest/features/automatic_prefix_caching/`, “Automatic Prefix Caching”, dated 2026-04-28 and accessed 2026-08-24.
- Direct coverage mapping: `enable_prefix_caching=True` enables native KV reuse for shared prefixes; the docs define both long-document and multi-round conversation carriers.
- Contrary evidence: the same page says reuse only reduces prefill, not decode, and gives explicit no-gain regions (long output or no shared prefix), which is the required counter-evidence/full-cost boundary for the frozen warm-cache sketch.
- Full-cost boundary: prefix eligibility, cached prefill work, decode work and output-length/no-sharing no-gain regions; excludes generic cache lifecycle policy, matching Source106/Source103 terminal holds.
- Query/stop boundary: one official current APC page, native enable flag, two public carrier classes and stated limits; stop at direct action/endpoint coverage. Result: `EARLY_FATAL` for generic warm-cache benchmark validity only.
