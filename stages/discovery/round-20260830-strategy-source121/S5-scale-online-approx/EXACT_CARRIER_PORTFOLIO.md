# Source121 S5 exact carrier portfolio

Frozen before the first external source call. URLs are locator candidates, not evidence. A wrong or unavailable URL is recorded as a mechanical miss and does not permit result-aware replacement.

## Ordered carrier set

| Order | Role | Frozen official/primary route | Question fixed before lookup |
|---:|---|---|---|
| 1 | ANCHOR | `https://github.com/NVIDIA/kvpress` | What methods, evaluation units, quality metrics, costs, and multi-turn support are implemented? |
| 2 | ANCHOR | `https://huggingface.co/datasets/lmsys/lmsys-chat-1m` | Does the dataset expose conversation/turn structure sufficient for exact replay, and what usage/license limits apply? |
| 3 | CURRENT | `https://github.com/mit-han-lab/streaming-llm` | What exact retained-state action and evaluation carrier are implemented? |
| 4 | CURRENT | `https://github.com/FMInference/H2O` | What heavy-hitter action, information contract, and benchmark unit are implemented? |
| 5 | CURRENT | `https://github.com/FasterDecoding/SnapKV` | What prompt-observation action and evaluation unit are implemented? |
| 6 | CURRENT | `https://github.com/Zefan-Cai/KVCache-Factory` | Does the current benchmark union already include multi-turn/session-level evaluation and full-cost accounting? |
| 7 | CONTRARY | `https://github.com/mit-han-lab/Quest` | Does query-aware sparsity directly absorb the proposed turn-varying measurement endpoint or online action? |
| 8 | ESCAPE | `https://github.com/microsoft/MInference` | Is a non-compression sparse-attention route a stronger explanation or comparator? |
| 9 | CARRIER CHECK | `https://github.com/kvcache-ai/Mooncake` | Does its public trace carry session/prefix identity relevant to this estimand without becoming Source120 cache-policy ranking? |
| 10 | CURRENT | `https://github.com/sgl-project/sglang` | Does current hierarchical cache management already expose within-session compaction with the same information contract? |

## Call budget and fallbacks

- Maximum source calls: `24`; counter increments before every search/open, including failure.
- Calls 1–10: open the ten frozen exact routes in order.
- Calls 11–18: at most one official paper/docs/data-card follow-up per carrier 1–8, only to close the frozen question.
- Calls 19–22: at most four mechanism-first searches restricted to primary sources for the exact primary RQ and strongest direct collision.
- Calls 23–24: transport-only fallback to an official paper/project page for an already frozen carrier; no new seed or carrier.
- Stop early on direct fatal, structurally unclosable replay semantics, or sufficient source-role closure.
- Result-aware seed/carrier backfill: `FORBIDDEN`.

