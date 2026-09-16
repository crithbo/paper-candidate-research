# Source122 S1 Source Ledger

- Assignment: `DISCOVERY-S1-20260830-SOURCE122`
- Cutoff: `2026-08-30 Asia/Shanghai`
- Source calls: `24/24`
- Retrieval: official/primary search and open only; zero download, build, experiment or result-aware backfill.

## Call accounting

| Calls | Role | Main surfaces | Decision effect |
|---|---|---|---|
| 1-4 | ANCHOR | ORT strict CPU-fallback key, EP `GetCapability`, session tests, profiling | Confirmed the native fallback and capability contracts. |
| 5-8 | CURRENT | EPContext design/QNN, TensorRT threshold, profiling | Absorbed generic strict-mode, cache and threshold proposals. |
| 9-12 | CONTRARY/CURRENT | compiled-model compatibility, model-package variants, high-level partition design, academic adjacency | Current compatibility/selection APIs directly subtract RQ05 and much of RQ08. |
| 13-16 | CURRENT | QNN/OpenVINO/EPContext source and tests | EP-specific support gaps reduced to implementation/configuration work. |
| 17-20 | CURRENT/ESCAPE | assignment-info API, native Fuse EP test, OODTE, ModelMeta locator | Located exact assignment carrier and strongest adjacent differential/metamorphic work. |
| 21-24 | DECISIVE OPEN | assignment-info source, inference-session test, OODTE full abstract, ModelMeta open | Closed RQ02/03 residual; final ModelMeta open failed mechanically, so only its already verified primary-paper locator is used. |

## Decisive sources

1. [ORT session option keys](https://github.com/microsoft/onnxruntime/blob/main/include/onnxruntime/core/session/onnxruntime_session_options_config_keys.h) — default CPU fallback, strict disable-fallback, EPContext and compiled-model controls.
2. [ORT execution-provider interface](https://github.com/microsoft/onnxruntime/blob/main/include/onnxruntime/core/framework/execution_provider.h) — `GetCapability`, `ComputeCapability`, post-partition EP optimization and compile contract.
3. [ORT Python inference collection](https://github.com/microsoft/onnxruntime/blob/main/onnxruntime/python/onnxruntime_inference_collection.py) — provider priority/fallback and `get_provider_graph_assignment_info` guarded by `session.record_ep_graph_assignment_info=1`.
4. [ORT inference-session tests](https://github.com/microsoft/onnxruntime/blob/main/onnxruntime/test/framework/inference_session_test.cc) — official FuseExecutionProvider `GetCapability` fixture, transformation model and profile schema tests.
5. [ORT high-level design](https://onnxruntime.ai/docs/reference/high-level-design.html) — graph rewriting then EP partition/assignment model.
6. [ORT TensorRT EP documentation](https://onnxruntime.ai/docs/execution-providers/TensorRT-ExecutionProvider.html) — minimum subgraph threshold, fallback, build/profile/cache costs.
7. [ORT EPContext design](https://onnxruntime.ai/docs/execution-providers/EP-Context-Design.html) and [compiled-model compatibility API](https://onnxruntime.ai/docs/api/c/struct_ort_ep_factory.html) — current cache/compatibility union.
8. [ORT profiling tools](https://onnxruntime.ai/docs/performance/tune-performance/profiling-tools.html) — runtime trace carrier and EP profiling boundary.
9. [OODTE](https://arxiv.org/abs/2505.01892) — strongest ONNX-optimizer differential-testing subtractor; evaluates crash/output deviation, not ORT EP assignment/full-cost stability.
10. [ModelMeta](https://people.cs.umass.edu/~juanzhai/papers/issta25.pdf) — model-level metamorphic-testing locator across frameworks/ONNX; full same-object facet audit remains Stage 0 debt because the decisive open failed mechanically.

## Stopping rationale

RQ01 is native strict mode; RQ04 is a configurable TensorRT threshold; RQ05 is absorbed by EPContext/compatibility/model-package APIs; RQ06-RQ07 reduce to provider-specific support/configuration; RQ08 is largely absorbed by assignment-info, profiling and automatic selection. RQ02/03 merge into one bounded benchmark/tool family whose residual is the stability and decision-validity of ORT EP graph assignments under semantics-preserving rewrites. This is `SEARCH_BOUNDED_OPEN`, not a novelty claim.
