# Discovery Research Question Candidate

- RQ ID: `S4-107-RQ03`; seed: `S4-107-03`.
- Anchor: `vllm bench startup` current CLI.
- Primary RQ: cold/warm startup benchmark是否缺一个能改变 deployment selection的 phase-aware readiness endpoint？
- Earliest falsifier: native CLI already exposes cold iterations, warmup iterations, warm iterations and JSON output.
- Pre-RQ result: `EARLY_FATAL`.

## Closure audit

- Exact object/action/claim endpoint: `vllm bench startup` on a fixed model/config; benchmark and report cold, warmup and warm startup timing as a readiness decision endpoint.
- Current source locus and version/date: `https://docs.vllm.ai/en/latest/cli/bench/startup/`, accessed 2026-08-24 (`latest` current CLI reference).
- Direct coverage mapping: native options specify `--num-iters-cold`, `--num-iters-warmup`, `--num-iters-warm`, and `--output-json`; the default model/config are explicit CLI inputs.
- Contrary evidence: the same CLI exposes model, cache, scheduler and compilation configuration, so a phase-only timing endpoint without a different action is not a new same-object benchmark contract.
- Full-cost boundary: startup iterations, warmup, engine configuration and JSON timing output; excludes serving throughput, external download and model-quality claims.
- Query/stop boundary: one official current startup reference; stop when it exposes the proposed cold/warm endpoint and reproducible output route. Result: `EARLY_FATAL` for this exact benchmark action.
