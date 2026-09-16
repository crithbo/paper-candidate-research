# Source121 S1 Deep Review

## RQ08 — measurement/benchmark anti-collapse review

### What is already native

ExecuTorch already provides backend-specific AOT partitioning, portable CPU fallback, quantization configuration, verbose delegated/nondelegated tables, ETRecord/ETDump, per-event performance data, delegation identity and numerical-gap comparison. Therefore “add a profiler”, “count delegated ops”, “benchmark XNNPACK”, or “compare quantized output” is directly subtracted.

### Surviving residual

The only retained residual is a pre-registered benchmark/measurement contract that asks whether proxy rankings are valid. It must jointly provide:

1. a same-model/configuration denominator and end-to-end cost ledger;
2. source→edge→runtime numerical validity, so fallback correctness is not inferred from an already-diverged edge golden;
3. explicit attribution of delegate/fallback boundaries and instrumentation overhead;
4. a held-out test of whether boundary-aware features predict configuration ranking better than delegated share or delegate-only time.

Removing any two of these pieces collapses the topic into native tooling or routine benchmarking.

### Hard gates

- Same object: `PASS` at Discovery contract level.
- Canonical carrier: `PASS_BENCHMARK_ONLY`; no natural deployment claim.
- Current collision: `SEARCH_BOUNDED_OPEN`; official system paper and current tools require independent Stage 0 audit.
- Strong comparator: delegated-node/share, delegate-only time, raw end-to-end timing, and current Inspector workflow on identical artifacts.
- Full cost: includes compilation/initialization/storage, runtime regions/boundaries, output validation and observer effect.
- Reproducibility: public source, exact configuration/model/input manifest and paired trace exports.
- Claim honesty: no ranking reversal, stable law or performance result observed.

### Q2 shape

Tier B is plausible only if the panel spans enough official models/configurations to support a held-out validity conclusion, produces decision-changing ranking reversals or a validated no-reversal boundary, and releases a reusable trace/manifest artifact. A single model, device, unsupported-op list, or profiler visualization is `BELOW_Q2_STOP`. Q1 potential is not claimed.

### Verdict

`PROPOSE_STAGE0 / TIER_B_Q2_VIABLE` with strict direct-fatal and minimum-breadth checks before any implementation.
