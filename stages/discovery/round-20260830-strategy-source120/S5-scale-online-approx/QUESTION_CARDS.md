# Source120 S5 Question Cards

## C10 — evidence-qualified raw

- Exact identity: vLLM current main `docs/benchmarking/cli.md` and `docs/features/kv_offloading_usage.md`.
- Carrier kind: `NATURAL + CANONICAL_BENCHMARK_ONLY`.
- Contribution type: `BENCHMARK_DATASET / MEASUREMENT_CHARACTERIZATION` (`N3`).
- Claim endpoint: benchmark validity/coverage and policy-choice consequence.
- Non-generic discriminator: tests cross-workload rank stability of one native policy interface, not a dashboard or parameter sweep.
- Current source locus: built-in LRU/ARC/custom `CachePolicy`; official prefix-repetition, ShareGPT and Mooncake timed-trace modes.
- Known direct fatal: none found within bounded current/primary-paper search.
- Minimum falsifier: no decision-changing rank reversal under matched capacity/cost and uncertainty.
- Full cost: TTFT, TPOT/E2E/goodput, hit/recovered tokens, CPU/FS bytes, transfer/store operations, lookup/policy overhead, warmup and trace preprocessing.
- Disposition: `EVIDENCE_QUALIFIED_RAW`, eligible for C0/deep.

## C01/C02

Directly absorbed by `Robust KV Cache Management for LLM Serving under Output Token Length Uncertainty` (arXiv:2607.16892); excluded before raw.

## C03

Current/nearest union includes Preble, SAECache, PrefixShield, vLLM LRU/ARC/custom policy and session-aware RFC evidence; the frozen value-per-byte action has no non-generic residual. Excluded before raw.

## C09

Carrier complete, but Kareto, KVDrive and AsymCache absorb adaptive multi-tier placement/configuration/cost actions. Not admitted after subtractors.

## C04/C05/C06/C07/C08

Carrier fields do not define the frozen arrival-based online decision. `RQ_BACKLOG`, no scientific drop.
