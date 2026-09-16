# DISCOVERY-S5-20260809-V8.4-WAVE2 — Discovery Log

- Lens: `O5_SCALE_ONLINE_APPROXIMATION`
- Assignment: `DISCOVERY-S5-20260809-V8.4-WAVE2`
- Search cut-off: 2026-08-09
- Method: accepted production Discovery `v2`, with accepted `v8.1` selection/audit policy.
- Method exclusion: TLS-blocked two-axis `v8.2r2` was not used, not treated as calibrated, and not cited as a production method.
- Scope: 2025–2026 genealogy and collision mapping for quantization/approximate computing, dynamic/streaming algorithms, sparse/compressed structures, and edge inference.  Non-CUDA CPU/solver/open-source routes were preferred.
- Explicit non-overlap: Wave 1 object families—dynamic ANN, dynamic AQP, and online index tuning—were not reconsidered.

## Search protocol

### Inclusion rules

- The exact object must need a nontrivial approximation, decomposition, hierarchy, dynamic, or online algorithm because exact/offline/small-scale treatment is non-deployable.
- The residual must preserve the output or quality function and name a current, fair, same-object strong baseline.
- The route must have natural public inputs/traces or a formal natural evidence object, a full-cost ledger, and a finite reproducible Stage A killer.
- A paper-level candidate must expose an N1, N2, or N3 mechanism—not a threshold change, parameter sweep, wrapper, controller, or benchmark swap.

### Search record

| Date (UTC+8) | Primary-source query family | Purpose | Result |
|---|---|---|---|
| 2026-08-09 | `edge inference quantization sparsity 2025 2026` | Edge/low-bit genealogy | Quantization, dynamic sparsity, and co-design mechanisms are dense; no unabsorbed same-object residual. |
| 2026-08-09 | `SSD sparse attention memory constrained PC 2026` | Long-context local inference | SolidAttention directly covers dynamic attention sparsity plus SSD storage coordination. |
| 2026-08-09 | `dynamic streaming graph approximation 2025 2026` | Stream/data-structure genealogy | DTC, HTCount, and current densest-subgraph work cover the immediate fully dynamic, budgeted, and semi-streaming objects. |
| 2026-08-09 | `sparse/compressed data structure LLM storage 2026` | Compression/data-structure seed | ZipLLM occupies model-family delta compression and tensor-level deduplication. |
| 2026-08-09 | `dynamic sparse attention online permutation 2025 2026` | Edge inference mechanism collision | S2O, Elastic Attention, SpargeAttn, and SolidAttention cover online token/block selection, adaptive ratios, filtering, and storage coupling. |

## 2025–2026 genealogy and competing-mechanism map

| Family | Scale/information change | Current mechanisms | Primary current anchors | Natural evidence/artifact status | Discovery disposition |
|---|---|---|---|---|---|
| Edge LLM inference under memory/power limits | On-device deployment needs to balance latency, energy, model quality, and capacity. | Model/hardware co-design; neuron-level partial loading/computation; integer-only compute-in-flash; dynamic attention + SSD coordination. | CLONE (ATC 2025); PartInfer (ICLR 2026 submission); LLM Inference in a Flash! (MLArchSys 2026); SolidAttention (FAST 2026). | Public edge platforms and common LLM evaluation corpora are available in principle; this does not create novelty. | `DROP_DIRECT_COLLISION` for generic adaptive quantization/sparsity or KV-offload formulations. |
| Online sparse attention / compressed KV | Long contexts cause quadratic attention and KV capacity/IO pressure. | Online permutation/early stopping; input-adaptive sparsity ratio; two-stage online attention filtering; block consolidation/prefetching for SSD. | S2O (2026); Elastic Attention (ICML 2026); SpargeAttn (2025); SolidAttention (FAST 2026). | Standard long-context LLM benchmarks exist; direct mechanisms and fair baselines are already defined by the literature. | `DROP_DIRECT_COLLISION`; an “online budget controller” would also violate the non-wrapper rule. |
| Dynamic/streaming graph approximation | Exact analytics becomes infeasible under arbitrary updates, deletion, high-rate arrival, and memory limits. | Single-pass distributed unbiased sampling; variable-sample reservoir under memory; semi-streaming approximation; fully dynamic orientation-style maintenance. | DTC (2025); HTCount (PACMMOD 2025); Mitrović et al. (2025); Li & Quanrud (2023). | DTC releases code/datasets; temporal graph corpora are natural. | `DROP_DIRECT_COLLISION` for generic dynamic counting/streaming-density routes. |
| Sparse/compressed model storage | Model hubs contain many related fine-tunes, so exact independent storage does not scale. | Family clustering, tensor-level deduplication, structured sparse delta compression, compatible compression layering. | ZipLLM (NSDI 2026). | Public Hugging Face model metadata supplies natural inputs. | `DROP_DIRECT_COLLISION` for model-family delta compression; online admission/placement would be a controller unless a new same-object data structure is established. |

## Three-pass convergence record

| Seed / exact object | Pass 1: genealogy and decision structure | Pass 2: current competing mechanism and same-object collision | Pass 3: artifact/natural input/AI execution | Decision |
|---|---|---|---|---|
| Edge LLM dynamic quantization or neuron sparsity under latency/energy budget | Candidate decision would select precision or active neurons per request. | CLONE performs model/system co-design for real-time energy; PartInfer performs partial loading and runtime partial computation.  This is not a new decision structure. | Natural LLM tasks and CPU/edge software are plausible, but AI readiness cannot rescue direct absorption. | `DROP_DIRECT_COLLISION` |
| SSD-resident long-context attention on memory-constrained PCs | Candidate decision would select retained/retrieved KV blocks under an IO budget. | SolidAttention already co-designs dynamic sparsity, block consolidation, speculative prefetch, and synchronization reuse while preserving accuracy. | Its same-object local-PC evidence makes it the fair current baseline; a new proposal would be a threshold or cache controller. | `DROP_DIRECT_COLLISION` |
| Online sparse-attention token/block selection | Candidate decision would choose tokens/blocks online to approximate attention. | S2O, Elastic Attention, and SpargeAttn cover online permutation, task/input-adaptive ratio, and online filtering. | Public model/benchmark routes exist, but no non-synonymous residual was frozen. | `DROP_DIRECT_COLLISION` |
| Fully dynamic graph-stream motif counting under memory cap | Candidate decision would allocate a bounded sample across updates/deletions. | DTC directly targets fully dynamic stream triangle counts; HTCount explicitly adapts reservoir size to available memory for hypergraph streams. | DTC names released code/datasets.  No new same-function guarantee or data-structure was established. | `DROP_DIRECT_COLLISION` |
| Directed densest-subgraph approximation in streams | Candidate decision would maintain an approximate dense subgraph with sublinear memory/update cost. | 2025 work gives deterministic single-pass semi-streaming and insertion-only dynamic algorithms; earlier fully dynamic work already provides near-optimal directed maintenance. | Temporal datasets are natural, yet any unverified sliding-window variant would be a new object without a grounded current baseline. | `DROP_INSUFFICIENT_GROUNDEDNESS` |
| LLM-family delta compression / sparse model storage | Candidate decision would encode related fine-tuned tensors while preserving loadability. | ZipLLM directly establishes structured sparse deltas, family clustering, and tensor-level deduplication on public hubs. | Natural public hub corpus exists; online policy extensions are controller-like, not a frozen N1/N2 structure. | `DROP_DIRECT_COLLISION` |

## Counter-evidence and decision discipline

- The open-looking gap “combine dynamic approximation with a resource budget” is not accepted as a contribution.  In this batch it would either restate a covered selector or replace the exact object with a new one.
- No source absence is interpreted as global novelty.  `SEARCH_BOUNDED_OPEN` is not used as a positive conclusion.
- No item is rejected for missing proprietary hardware, code, or low AI readiness.  Rejections are structural: direct collision, prohibited wrapper/controller form, or failure to freeze a same-object residual and fair baseline.

## Result

`0` grounded briefs and `0` `PROPOSE_STAGE0` recommendations.  No screened object met the required minimum structural potential of `TIER_B_Q2_VIABLE` after current collision checks.

