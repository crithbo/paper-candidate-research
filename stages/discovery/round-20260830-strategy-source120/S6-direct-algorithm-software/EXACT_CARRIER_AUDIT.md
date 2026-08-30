# Source120 S6 — Exact Carrier Audit Before RQ

## Carrier outcomes after 16/24 calls

| Carrier | Exact carrier status | Evidence boundary | RQ eligibility |
|---|---|---|---|
| C01 vLLM KV cache manager test | `CLOSED_WITH_RENAMED_CANONICAL_EQUIVALENT` | `tests/v1/core/test_kv_cache_utils.py` is current merged CPU test and imports `KVCacheManager`, `FreeKVCacheBlockQueue`, multi-group specs and hashing utilities. | YES |
| C02 SGLang radix-cache test | `CLOSED_TO_UNMERGED_PR_TEST_BUNDLE` | PR #35635 names exact unit suites, commits, default-disabled action, parity matrix and benchmark; PR remains open and CI states shown include failures. | YES, only as bounded replication/validity RQ; not current merged behavior |
| C03 TensorRT-LLM KV manager test | `UNRESOLVED_INTERNAL_ERROR` | frozen directory open returned internal error and no exact test locator was returned. | NO |
| C04 xFormers attention test | `CLOSED` | current `tests/test_mem_eff_attention.py` exists; exact file content was not extracted, but official benchmark/dispatch issue provide adjacent current loci. | YES |
| C05 PyTorch Inductor scheduler test | `UNRESOLVED_INTERNAL_ERROR` | frozen guessed path returned internal error; no replacement allowed. | NO |
| C06 MLX KV cache test | `UNRESOLVED_INTERNAL_ERROR` | frozen test path returned internal error; adjacent `mlx-lm/models/cache.py` cannot replace it. | NO |
| C07 MLC engine spec test | `CLOSED` | current `tests/python/serve/test_serve_engine_spec.py` exists with fixed prompt/request fixture and engine config surface. | YES |
| C08 OpenVINO continuous batching test | `UNRESOLVED_INTERNAL_ERROR` | CI workflow names the test, but direct frozen file open failed; docs/issues cannot replace the fixture. | NO |

No scientific negative is inferred from unresolved carriers. Four nonselected carriers remain mechanically unresolved; there is no result-aware replacement.
