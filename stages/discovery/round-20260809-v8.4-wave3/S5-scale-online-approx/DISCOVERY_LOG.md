# DISCOVERY-S5-20260809-V8.4-WAVE3 — Discovery Log

- Lens: `O5_SCALE_ONLINE_APPROXIMATION`
- Assignment: `DISCOVERY-S5-20260809-V8.4-WAVE3`
- Search cut-off: 2026-08-09
- Production method: calibrated Discovery `v2` with accepted `v8.1` selection/audit policy.
- Excluded method: TLS-blocked two-axis `v8.2r2` was not used or represented as calibrated.
- Result: `0` grounded briefs; no `PROPOSE_STAGE0` packet.

## Scope and exclusions

This wave searched for an algorithmic or representational residual across accuracy, memory, latency, update cost, and write/state-change cost.  A changing budget alone was not accepted as a decision structure.  The prior-wave families dynamic ANN, dynamic AQP, online index tuning, edge/KV sparse inference, general graph-stream counting, and model-hub delta compression were excluded from reseeding.

## Search protocol

| Date (UTC+8) | Primary-source query family | Decision use |
|---|---|---|
| 2026-08-09 | `streaming approximate data structure update memory latency` | Identified state-change-aware streaming complexity as a possible same-object representation axis. |
| 2026-08-09 | `streaming quantile write efficient / sliding-window quantile` | Tested whether a write-minimal dynamic quantile sketch has a nontrivial residual. |
| 2026-08-09 | `online vector quantization accuracy memory update` | Checked online quantizer mechanism; excluded because it re-enters Wave 1 dynamic ANN territory and has current direct work. |
| 2026-08-09 | `low-bit quantization accuracy memory latency update` | Checked optimizer/KV/LLM mechanisms; all yielded already-covered quantization or edge-KV objects rather than a new CPU/solver object. |

## Convergence record

| Seed / exact object | Genealogy and possible N-route | Current same-object mechanisms / fair baseline union | Natural input and finite Stage A killer | Verdict |
|---|---|---|---|---|
| Write-aware approximate quantiles over insertion-only telemetry streams | N2 would have to jointly optimize rank error, memory, update latency, and state changes (writes), not simply buffer updates. | Apache KLL is an established compact/lazy-compaction implementation; the 2024 state-change paper covers near-optimal state changes for moments, heavy hitters, sparse recovery, and entropy; 2025 PODS work strengthens heavy-hitter state-change bounds. | CPU replay is feasible with public telemetry; killer would be: prove a rank-error/write bound and beat KLL, KLL± window construction, DDSketch, and SplineSketch at equal error/memory. | `DROP_INSUFFICIENT_NONTRIVIAL_RESIDUAL`: no new compactor representation or bound was frozen; a write-log layer would be routine batching/parameterization. |
| Fixed-window dynamic quantile sketches | Candidate route would maintain rank accuracy with expiration and a bounded write count. | KLL± already supports bounded deletions and supplies an explicit three-overlapping-block construction for a fixed-size sliding window; Apache KLL supplies the current deployable baseline. | Natural latency/sensor traces are available in principle; the fastest killer is a counterexample where expiration causes the proposed bound to fail against KLL±. | `DIRECT_FATAL`: a generic dynamic/sliding quantile mechanism is already covered. |
| Data-oblivious online vector quantization | Could be N2 for online insertion without data-dependent rebuild. | TurboQuant has a data-oblivious online formulation with near-optimal distortion; streaming-update quantization work directly treats bounded disk IO and dynamic consistency for ANN. | Open code exists, but the exact target is vector search/ANN, explicitly excluded as Wave 1 territory. | `DROP_SCOPE_DUPLICATE_AND_DIRECT_COLLISION` |
| Online low-bit optimizer state representation | Candidate would change the optimizer-state representation under update/memory constraints. | QFT quantizes complete training state, and 2D Quantization targets 1.5/2-bit optimizer states; both are active direct mechanism families. | Natural training corpora exist, but any remaining bit allocation policy is a controller/parameter route. | `DROP_DIRECT_COLLISION` |
| Online KV vector quantization | Candidate would allocate bits/update codebooks at decode time. | TurboQuant uses data-oblivious online vector quantization; LLM Inference in a Flash! and prior-wave KV mechanisms cover storage and traffic costs. | Benchmark routes are public, but the object is previously screened edge/KV inference. | `DROP_SCOPE_DUPLICATE_AND_DIRECT_COLLISION` |

## Fair-baseline union frozen for the closest screened route

For a hypothetical write-aware sliding-window quantile sketch, a Stage 0 packet would have to compare, using exactly the same window, rank/relative-error contract, and CPU execution model:

1. Apache DataSketches KLL (current deployable insertion baseline);
2. KLL± with its bounded-deletion/sliding-window construction (closest dynamic-paper baseline);
3. DDSketch windowed implementation (relative-error practical baseline);
4. SplineSketch (recent accuracy/guarantee baseline);
5. exact window quantiles as an offline ceiling only.

No proposed mechanism survived this union.  Counting a buffered or delayed write as a new algorithm while leaving all compaction/expiration invariants intact would fail the method-name deletion test and would omit query-merge and recovery costs.

## Counter-evidence and claim boundary

- State-change cost is a legitimate algorithmic cost, not an administrative budget.  It could support an N2 contribution only with a new representation or a simultaneous approximation/space/write theorem.
- The papers found establish such results for other stream statistics, but no affirmative primary evidence was found here for a novel quantile representation.  This is recorded as `SEARCH_BOUNDED_OPEN` only inside the rejected seed, never as a novelty claim.
- No item was rejected because an implementation, hardware platform, or main experimental result is unavailable.  Each rejection is caused by direct same-object coverage, a prohibited scope duplicate, or the lack of a frozen non-routine residual.

## Result

No route reached `TIER_B_Q2_VIABLE` after the fair baseline union and nontriviality audit.  Zero proposals is therefore the valid batch result.

