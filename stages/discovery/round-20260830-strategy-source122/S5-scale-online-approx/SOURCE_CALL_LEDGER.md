# Source122 S5 source-call ledger

- Assignment: `DISCOVERY-S5-20260830-SOURCE122`
- Frozen cap: `24`; used: `24/24`
- Build/experiment/download: `0`
- Result-aware backfill: `0`

| Call | Role | Target | Result | Use |
|---:|---|---|---|---|
| 1 | ANCHOR | PyTorch recompilation docs stable URL | REDIRECT | Official locus fixed. |
| 2 | ANCHOR | PyTorch dynamic-shapes docs stable URL | REDIRECT | Official locus fixed. |
| 3 | CURRENT | `pytorch/pytorch: torch/_dynamo/cache_size.py` | OPENED | Guarded cache linked-list and two count limits. |
| 4 | CURRENT | `pytorch/pytorch: torch/_dynamo/convert_frame.py` | OPENED | Current frame conversion/recompile locus. |
| 5 | ANCHOR FOLLOW-UP | PyTorch 2.13 recompilation docs | OPENED__ZERO_PARSED_LINES | Transport limitation recorded. |
| 6 | ANCHOR FOLLOW-UP | PyTorch 2.13 dynamic-shape docs | OPENED__ZERO_PARSED_LINES | Transport limitation recorded. |
| 7 | CURRENT | `torch/_inductor/codecache.py` | OPENED | Exact persistent cache implementation. |
| 8 | CURRENT | CUDA Graph Trees docs stable URL | REDIRECT | Conditional downstream cost locus. |
| 9 | CURRENT | `torch/_inductor/cudagraph_trees.py` | OPENED | Exact implementation carrier; no experiment. |
| 10 | CONTRARY | `torch.compiler.set_stance` docs | REDIRECT | Current public policy surface fixed. |
| 11 | CURRENT | `torch.compile` docs | REDIRECT | Public compile contract fixed. |
| 12 | CARRIER | `pytorch/benchmark` | OPENED | TorchBench canonical workload route. |
| 13 | FOLLOW-UP | raw recompilation RST guessed path | MECHANICAL_CACHE_MISS | Counted; no inference. |
| 14 | FOLLOW-UP | raw dynamic-shape RST guessed path | 404 | Counted; no inference. |
| 15 | CURRENT FOLLOW-UP | raw `torch/compiler/__init__.py` | OPENED | Exact stance definitions and guard-safety warning. |
| 16 | CURRENT FOLLOW-UP | find `class FxGraphCache` on GitHub HTML | NO_MATCH_TRANSPORT | Counted; raw fallback already frozen. |
| 17 | CONTRARY SEARCH | arXiv PyTorch dynamic-shape/recompile/cache query | SEARCHED | Returned DISC and related primary papers. |
| 18 | ESCAPE SEARCH | arXiv online dynamic-shape specialization query | SEARCHED | Returned Vortex and related works. |
| 19 | CONTRARY SEARCH | ACM dynamic-shape specialization/cache query | SEARCHED | No exact same-object result surfaced. |
| 20 | CONTRARY SEARCH | OpenReview dynamic-shape compilation query | SEARCHED | No exact same-object result surfaced. |
| 21 | CONTRARY DEEP | DISC, arXiv:2103.05288 | OPENED | Fully dynamic IR/runtime-flow and static-vs-dynamic compiler subtractor. |
| 22 | CONTRARY DEEP | Vortex, arXiv:2409.01075 | OPENED | Sample-free dynamic tensor-program compiler subtractor. |
| 23 | CURRENT DEEP | raw `torch/_inductor/codecache.py` | OPENED | Stable source text for cache details. |
| 24 | CURRENT DEEP | find `class FxGraphCache` in raw source | OPENED | GuardedCache/FxGraphCache behavior and source symbols closed. |

## Decisive primary loci

- `https://github.com/pytorch/pytorch/blob/main/torch/_dynamo/cache_size.py`
- `https://raw.githubusercontent.com/pytorch/pytorch/refs/heads/main/torch/_inductor/codecache.py`
- `https://raw.githubusercontent.com/pytorch/pytorch/main/torch/compiler/__init__.py`
- `https://arxiv.org/abs/2103.05288`
- `https://arxiv.org/abs/2409.01075`
- `https://github.com/pytorch/benchmark`

All current-`main` identities are bounded to retrieval date `2026-08-30`; Stage 0 must pin the exact upstream commit before making an absence claim.

