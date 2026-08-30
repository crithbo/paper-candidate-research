# Source121 S5 divergence seed pool

## Metadata

- Assignment: `DISCOVERY-S5-20260830-SOURCE121`
- Topic identity: `SOURCE121-PORTFOLIO-S5`
- Frozen method: `RQ_REFINEMENT_STAGED_EVIDENCE_V1 / PRODUCTION`
- Model route: `gpt-5.6-sol / high`, temporary for this user command
- Generated before any Source121 S5 external source call: `YES`
- Seed ceiling: `10/12`
- Network-security exclusion: `PASS`
- Evidence status: every row is `SEED_NON_EVIDENCE`; none asserts novelty, current absence, Q2 quality, or feasibility.

## Frozen seeds

| ID | Exact public carrier candidate | S5 question sketch | Counterfactual decision | Main collapse risk |
|---|---|---|---|---|
| S5-121-01 | `NVIDIA/kvpress` + `lmsys/lmsys-chat-1m` | Do fixed KV-compression policies change rank over successive turns of the same public conversation under one frozen quality-loss ceiling? | A serving runtime would select or reject a fixed compression policy using sequence-level rather than one-shot evaluation. | Existing benchmark or paper already evaluates the same multi-turn estimand. |
| S5-121-02 | `NVIDIA/kvpress` + `lmsys/lmsys-chat-1m` | Can a history-only online allocator choose among existing presses per turn with bounded dynamic regret under a fixed KV-byte budget? | Runtime replaces a static press with an online allocator. | Generic bandit/controller shell or unavailable faithful replay semantics. |
| S5-121-03 | `mit-han-lab/streaming-llm` | Does attention-sink retention remain stable under natural multi-turn session growth rather than synthetic infinite text? | Runtime changes retained-token structure at turn boundaries. | Current streaming methods already cover the exact turn-aware action. |
| S5-121-04 | `FMInference/H2O` | Does heavy-hitter selection drift across turns enough to invalidate request-local eviction decisions? | Runtime maintains cross-turn heavy-hitter state. | Same action already present; only a new workload application remains. |
| S5-121-05 | `FasterDecoding/SnapKV` | Does prompt-time observation support fail when subsequent user turns alter head/layer importance under a fixed output-divergence ceiling? | Runtime triggers bounded re-observation or layer-specific reserve. | Ordinary retuning or direct absorption by adaptive compressors. |
| S5-121-06 | `Zefan-Cai/KVCache-Factory` | Are method rankings stable when the benchmark unit changes from isolated prompt to whole public conversation, with compaction cost included? | Benchmark conclusions and method-selection guidance change. | Existing factory already exposes this exact conversation-level panel. |
| S5-121-07 | `mit-han-lab/Quest` | Can page-level query-aware selection remain online when future turns are unknown without increasing full-cost latency? | Runtime changes page scoring/reuse schedule. | Current Quest algorithm already uses the same information contract. |
| S5-121-08 | `microsoft/MInference` | Does sparse-prefill structure interact with decode-time KV compaction across turns in a non-separable way? | Runtime jointly decides prefill sparsity and retained decode state. | Component Cartesian product without a target-specific coupling. |
| S5-121-09 | `kvcache-ai/Mooncake` | Can a public request trace define a canonical session-memory compaction estimand with arrival, length, and reusable-prefix state? | Measurement determines whether online compaction claims are externally valid. | Trace lacks session/prefix identity or duplicates Source120 cache-policy ranking. |
| S5-121-10 | `sgl-project/sglang` HiCache | Does hierarchical KV placement leave an online within-session compaction residual distinct from tier placement and prefix eviction? | Runtime adds a local compaction action only if current hierarchy cannot express it. | Direct current-union absorption or changed object. |

## Frozen convergence

- Primary seed: `S5-121-01`.
- Primary RQ: On a frozen public multi-turn conversation carrier replayed by one fixed decoder-only model, is the full-cost ranking of current KV-cache compression policies stable across turns under one predeclared output-divergence ceiling, compared with the uncompressed same-model run?
- Contribution-type hypothesis: `MEASUREMENT_CHARACTERIZATION / BENCHMARK_DATASET`.
- Carrier kind: `NATURAL` for public conversation inputs, with a conservative `CANONICAL_BENCHMARK_ONLY` ceiling if provenance or replay semantics do not support natural-deployment claims.
- Immutable object: within-session decoder KV state for one fixed model and conversation; not cross-request prefix-cache eviction, tier placement, or vLLM CachePolicy ranking.
- Counterfactual consequence: whether current one-shot KV-compression benchmark rankings are valid selection guidance for multi-turn session serving.
- Minimum falsifier: rankings remain stable across turns and sequence-level aggregation under the predeclared quality ceiling after charging compression latency and peak KV bytes.
- Strong alternative: any observed instability is fully explained by length/context distribution and disappears under length-matched isolated prompts.
- Precommitted source route: exact carrier pages in `EXACT_CARRIER_PORTFOLIO.md`; no carrier replacement after evidence appears.

