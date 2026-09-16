# Source122 S5 exact carrier portfolio

Frozen before the first external call. URLs and queries are locator candidates, not evidence. No result-aware replacement is allowed.

## Ordered exact carriers

| Order | Role | Frozen primary route | Precommitted question |
|---:|---|---|---|
| 1 | ANCHOR | `https://docs.pytorch.org/docs/stable/compile/programming_model.recompilation.html` | What are the exact recompilation triggers, limits, and fallback actions? |
| 2 | ANCHOR | `https://docs.pytorch.org/docs/stable/torch.compiler_dynamic_shapes.html` | How does automatic dynamic-shape generalization decide what becomes symbolic? |
| 3 | CURRENT | `https://github.com/pytorch/pytorch/blob/main/torch/_dynamo/cache_size.py` | What cache entries and limit predicates exist; is eviction/compaction implemented? |
| 4 | CURRENT | `https://github.com/pytorch/pytorch/blob/main/torch/_dynamo/convert_frame.py` | Where are cache lookup, guard failure, recompile, and fallback decisions made? |
| 5 | CURRENT | `https://github.com/pytorch/pytorch/blob/main/torch/_inductor/codecache.py` | Does `FXGraphCache` canonicalize or compact guarded static/dynamic artifacts? |
| 6 | CURRENT | `https://docs.pytorch.org/docs/stable/torch.compiler_cudagraph_trees.html` | What dynamic-shape recording, memory-pool, and replay constraints affect the same policy? |
| 7 | CURRENT | `https://github.com/pytorch/pytorch/blob/main/torch/_inductor/cudagraph_trees.py` | What current recording/cache state is versioned and retained? |
| 8 | CONTRARY | `https://docs.pytorch.org/docs/stable/generated/torch.compiler.set_stance.html` | Do current stances already express online profiling/admission/fallback? |
| 9 | CURRENT | `https://docs.pytorch.org/docs/stable/generated/torch.compile.html` | What dynamic/fullgraph/options contract is public and stable? |
| 10 | NATURAL/CANONICAL CARRIER | `https://github.com/pytorch/benchmark` | Is there a versioned, repeatable dynamic-shape workload/trace route? |

## Frozen calls 11–24

- 11–14: one official follow-up source/docs locus for carriers 1–4 when needed.
- 15–16: one official follow-up for Inductor cache and CUDA Graph Trees.
- 17: search query restricted to primary papers: `site:arxiv.org torch.compile dynamic shapes specialization cache recompilation`.
- 18: search query restricted to primary papers: `site:arxiv.org online compilation shape specialization cache deep learning compiler`.
- 19: search query restricted to primary papers: `site:dl.acm.org dynamic shape specialization deep learning compiler cache`.
- 20: search query restricted to primary papers: `site:openreview.net dynamic shape compilation specialization`.
- 21–22: open at most two exact primary papers returned by calls 17–20 that address the frozen object/action.
- 23–24: transport-only official fallback for an already frozen carrier or paper; no new seed/family.

## Budget

- Search/open calls maximum: `24`.
- Build/experiment/download: `0`.
- Result-aware carrier or family backfill: `FORBIDDEN`.
- Stop early on direct fatal, structurally unsafe guard coverage, or sufficient source-role closure.

