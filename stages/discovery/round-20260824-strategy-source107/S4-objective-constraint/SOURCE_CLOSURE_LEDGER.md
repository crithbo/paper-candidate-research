# Source107 S4 ordinary source-closure ledger

Public-source-only; CRFEPOCH Stage 0/chat and group repository were not read.

| RQ | Current primary source | Result | Raw |
|---|---|---|---|
| S4-107-RQ01 | https://docs.vllm.ai/en/latest/configuration/optimization/ | vLLM already exposes compile-cache validity, allocation and startup/steady tradeoff action | no |
| S4-107-RQ02 | https://docs.pytorch.org/docs/main/user_guide/torch_compiler/torch.compiler_dynamic_shapes.html | native dynamic/static/recompile/annotation actions cover frozen sketch | no |
| S4-107-RQ03 | https://docs.vllm.ai/en/latest/cli/bench/startup/ | native cold/warm startup measurement directly covers frozen endpoint | no |
| S4-107-RQ04 | https://docs.pytorch.org/devlogs/dynamic_shapes/2026-06-24-shapes-spec/ | explicit multi-specialization dispatcher/cache buckets cover action class | no |
| S4-107-RQ05 | current vLLM public benchmark/cache surface | cache-control benchmark route is a prior exact failure direction; no new endpoint frozen | no |

No raw/deep/brief, resource action, download, build, experiment, stage action, CRFEPOCH input or group-repository access occurred.

## Required direct-coverage audit

| RQ | Frozen object/action/endpoint | Current locus, version/date | Direct mapping and contrary evidence | Full-cost + stop boundary |
|---|---|---|---|---|
| RQ01 | vLLM repeated boot: compile-cache/KV-allocation action → readiness/steady configuration decision | vLLM Optimization and Tuning, `latest`, accessed 2026-08-24 | cache persistence/AOT failure, reproduced KV allocation, eager startup/steady-decode tradeoff; conservative allocation caps concurrency and optimistic allocation fails | compilation, graph estimation, profiling, allocation and concurrency; stop after this official page expresses all frozen actions |
| RQ02 | torch.compile shape policy → static/dynamic/recompile endpoint | PyTorch Dynamic Shapes `main`, accessed 2026-08-24 | automatic dynamic, annotations and static/dynamic source controls map the action; dynamic=true can regress performance and compile time | specialization, guards/recompile and dynamic kernel cost; stop at direct native alternatives |
| RQ03 | vLLM cold/warm timing → readiness benchmark endpoint | `vllm bench startup`, `latest`, accessed 2026-08-24 | cold/warmup/warm iteration controls and JSON result path are native; model/cache/compile configs are inputs | startup iteration and configuration boundary; stop at native cold/warm contract |
| RQ04 | ShapesSpec artifact cases → predicate dispatch/fallback endpoint | PyTorch ShapesSpec DevLog, 2026-06-24, accessed 2026-08-24 | multiple specialized artifacts, generic fallback and isolated recompilation are explicit; no different guarantee frozen | predicate, cache bucket, fallback path; stop at exact dispatcher coverage |
| RQ05 | vLLM APC warm reuse → serving benchmark-validity endpoint | Automatic Prefix Caching, dated 2026-04-28, accessed 2026-08-24 | native enable flag and workload carriers; docs limit benefit to prefill and identify long-output/no-prefix no-gain cases | prefill reuse plus decode/no-sharing cost; stop at exact generic warm-cache action |

Each `EARLY_FATAL` is limited to its listed object/action/claim endpoint. No row claims global absence or excludes `RELATED_ONLY` objects.
