# DISCOVERY-M1-20260809-V8.4-WAVE1 — Discovery log

## Assignment and boundary

- Assignment: `DISCOVERY-M1-20260809-V8.4-WAVE1`
- Lane: `DISCOVERY-M1-MEASUREMENT-OBSERVATORY`
- Discovery method: accepted production `v2/v8.1` only
- Explicitly excluded method: TLS-blocked `two-axis v8.2r2`
- Search and collision cutoff: `2026-08-09` (Asia/Shanghai)
- Result: `COMPLETE_ZERO_PROPOSALS`
- Candidate briefs created: `0 / 2`
- Experiments, downloads, traces, benchmarks, GPU/NPU/FPGA runs: `none`

This assignment is a source-and-metadata-only O8 observation. It does not assert a new empirical regularity. The purpose was to test whether publicly released natural serving traces and benchmark artifacts leave an unabsorbed measurement/characterization paper shape with a concrete utilization mechanism.

## Method gate

`registry.yaml` records the six production lenses of discovery method v2/v8.1 as independently calibrated. M1 is therefore operating under the accepted contribution-first paper-genealogy process, not the blocked two-axis method. That calibration validates only the discovery process; it is not evidence for either screened direction.

## Search protocol

### Inclusion

- Original paper pages (arXiv or proceedings) with a stated measurement object or serving mechanism.
- Official project repositories or first-party documentation that expose trace schema, replay capability, benchmark boundary, or released artifact metadata.
- Results relevant to one of two O8 shapes: natural agent-serving trace/evaluation, or phase-aware LLM inference energy/accelerator evaluation.

### Exclusion

- Blog-only performance claims, dashboards without source conditions, and unverified secondary summaries.
- New hardware names, backend renames, or a one-off benchmark replay without a new decision variable.
- Any proposal overlapping registered terminal kernels, especially the stopped CUDA/compiler/quantization topics.

### Queries and source families

- `LLM serving benchmark trace workload characterization`;
- `coding agent workload KV cache tool-call serving`;
- `LLM inference energy benchmark prefill decode`;
- `prefill decode accelerator evaluation`;
- official GitHub metadata for ServeGen, BurstGPT, Qwen-Bailian traces, vLLM benchmarking, and GenAI-Bench.

The search is `SEARCH_BOUNDED_OPEN`, not a claim of worldwide completeness. It was refreshed through `2026-08-09`; recently posted works were included rather than ignored.

## Screened O8 direction A — agentic-serving trace realism and tool-gap-aware KV policies

### Initial paper shape

A public, trace-driven benchmark that would characterize tool/human gaps, expose rankings distorted by synthetic or token-only traffic, and use the resulting gap class to select cache-retention, offload, or prefetch actions.

### Natural-source anchor

TraceLab releases coding-agent sessions with LLM-step and tool-call structure; its abstract already identifies tool-latency prediction and KV-cache treatment across human-paced gaps as system opportunities. ServeGen, BurstGPT and Qwen-Bailian supply independent public serving-trace/replay artifacts. These are legitimate natural evidence sources, not synthetic microcases.

### Collision result

`DIRECT_FATAL` for the proposed generic paper shape. CacheWise already combines real coding-agent trace characterization with prefix-aware scheduling and reuse-aware eviction driven by tool-call metadata. MORI ranks tool-call idleness and reallocates cache between HBM and DRAM; TokenCake performs predictive offload/upload during tool stalls; Continuum predicts tool-call durations for cache TTL and program scheduling. Thus the candidate's exact object (agentic LLM sessions with tool gaps), decision variables (retain/offload/prefetch/schedule KV cache using tool state or duration), evidence object (natural traces), and primary claim are already covered.

### Why no residual was manufactured

Changing the trace provider, coding-agent brand, cache backend, dashboard, or predictor family would not create a new research question. A possible residual would require a demonstrably distinct semantics-changing cache primitive or a new formal decision/guarantee, neither of which arose from this measurement-only scan. No candidate brief is created.

### Finite Stage A killer, if a later non-overlapping residual is proposed

Freeze TraceLab plus one independent public trace; compare only against CacheWise, MORI, TokenCake/Continuum, and a current vLLM baseline under identical model, cache tier, tool-delay replay, HBM/DRAM capacity, and end-to-end boundary. Kill the proposal if its action set is expressible by their tool-state/duration/idleness policies or if it lacks a retained-KV, TTFT, job-completion-time, and full transfer-cost residual on a held-out trace family.

## Screened O8 direction B — phase-aware energy/accelerator ranking correction

### Initial paper shape

A benchmark/characterization study asserting that aggregate tokens/s or joules/token obscures phase-dependent accelerator and energy rankings, then recommending phase-specific configuration or platform selection.

### Collision result

`DIRECT_FATAL` for the generic paper shape. TokenPowerBench already provides phase-aligned per-request prefill/decode energy attribution across model, prompt, engine, batch, context, parallelism and quantization. *The Illusion of Power Capping in LLM Decode* provides a phase-aware energy mechanism, controls DVFS confounds, and establishes architecture-dependent regimes. *Prefill/Decode-Aware Evaluation of LLM Inference on Emerging AI Accelerators* already makes phase-separated cross-accelerator ranking and heterogenous prefill/decode disaggregation its main object. A fresh aggregate-ranking correction or phase-aware platform selector would subtract to these results with no independent mechanism.

### Evidence limitation

No hardware or benchmark was run in this assignment. Therefore this log does not claim that a particular accelerator ranking reverses, nor that an energy regime applies beyond the cited conditions.

### Finite Stage A killer, if a later non-overlapping residual is proposed

Use TokenPowerBench's phase boundary and the emerging-accelerator paper's same-model contract. Require a predeclared new observable that is absent from both (for example, a semantically necessary end-to-end boundary), at least one recent reproducible baseline, and a mechanism-isolating ablation. Kill it if phase-aligned energy plus existing prefill/decode metrics explain the ranking without the new observable, or if host/transfer/fallback/measurement overhead erases the alleged decision difference.

## Outcome

Both screened directions were structurally absorbed by primary literature published before the cutoff. They are recorded as discovery DROPs, not as resource failures and not as revived versions of any terminal registry object. `PROPOSE_STAGE0` count remains zero.
