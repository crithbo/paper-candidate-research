# RQ candidate S5-121-01

- Assignment: `DISCOVERY-S5-20260830-SOURCE121`
- Seed: `S5-121-01`
- Exact anchor candidates: `NVIDIA/kvpress`; `lmsys/lmsys-chat-1m`
- Stable object: within-session decoder KV state of one fixed public decoder-only model replaying complete multi-turn conversations.
- Immutable quality envelope: identical model/tokenizer/decoding inputs; each compressed policy is compared to the uncompressed same-model reference under one predeclared output-divergence ceiling.
- Primary RQ: Is the full-cost ranking of current KV-cache compression policies stable across turns and at whole-conversation aggregation on a frozen public multi-turn conversation carrier?
- Contribution hypothesis: `MEASUREMENT_CHARACTERIZATION / BENCHMARK_DATASET`, not an algorithm claim.
- In scope: per-turn and sequence-level peak KV bytes, compression overhead, decode latency, and output-divergence-to-reference.
- Out of scope: cross-request prefix eviction, tier placement, vLLM CachePolicy ranking, distributed serving, build, experiment, or any result claim during Discovery.
- Precommitted null: length/context distribution alone explains any rank change; length-matched isolated prompts recover the same ordering.
- Minimum public route: official carrier repository/data card plus primary papers/docs for current presses.
- Pre-RQ closure: `ORDINARY_CLOSURE`; no selective-depth nomination requested.
- Disposition before evidence: `RQ_READY_FOR_ORDINARY_CLOSURE`.

