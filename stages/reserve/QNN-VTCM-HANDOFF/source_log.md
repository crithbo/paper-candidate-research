# QNN-VTCM-HANDOFF Stage 0 source and collision log

- Audit date: 2026-08-02
- Scope: current public QNN/ORT control surface and 2024–2026 collision-first scan. Absence is search-bounded, not novelty closure.
- Evidence classes: official documentation and public paper/artifact only. No device measurement was performed.

| ID | Source | Verified fact / audit use | Collision class |
|---|---|---|---|
| S1 | [ONNX Runtime QNN EP documentation](https://github.com/microsoft/onnxruntime-qnn/blob/main/docs/execution_providers/QNN-ExecutionProvider.md) | Current tested pairing states QNN EP 2.4.0 with QAIRT 2.48.40 and ORT 1.26.0; supports CPU, GPU and HTP backends. | Object anchor |
| S2 | [QNN EP provider/run options](https://github.com/microsoft/onnxruntime-qnn/blob/main/docs/execution_providers/QNN-ExecutionProvider.md#configuration-options) | Documents CSV/optrace profiling, `rpc_control_latency`, `vtcm_mb`, cross-session VTCM backup-buffer sharing (current `htp_share_resource_optimization`, legacy name documented; QAIRT >= 2.26; legacy incompatibility with context embed), spill/fill context-cache buffer, shared-memory allocator, CPU I/O quant/dequant offload, and per-run perf/RPC options. It does not document individual online VTCM lease/release or a per-request spill/fill action. | DIRECT_SUBTRACT / DEPLOYMENT_BASELINE / control-surface boundary |
| S3 | [QNN EP context cache and parallel prepare](https://github.com/microsoft/onnxruntime-qnn/blob/main/docs/execution_providers/QNN-ExecutionProvider.md#qnn-context-binary-cache-feature) | Context compilation/finalization/I/O setup and cache artifacts are explicit costs. Parallel prepare can add overhead for small graphs; those costs cannot be excluded from a handoff claim. | Deployment baseline |
| S4 | [QNN EP profiling documentation](https://github.com/microsoft/onnxruntime-qnn/blob/main/docs/execution_providers/QNN-ExecutionProvider.md#qnn-ep-profiling) | HTP profiling writes initialization, execution and de-initialization data to CSV; QAIRT >= 2.39 can generate optrace/QHAS-compatible artifacts. Granularity of unexposed allocator state is not promised. | Evidence-path boundary |
| S5 | [Qualcomm AI Engine Direct overview](https://www.qualcomm.com/developer/software/qualcomm-ai-engine-direct-sdk) | QNN/AI Engine Direct presents device, backend, context and graph abstractions and is used by ONNX Runtime; it is not an exposed dynamic VTCM-scheduling API. | Object anchor |
| S6 | [HaX-CoNN: shared-memory-contention-aware concurrent DNN execution](https://arxiv.org/abs/2308.05869) | Schedules layer groups across heterogeneous DSAs using transition and shared-memory contention models; it includes Snapdragon 865 evaluation. Its object is cross-accelerator layer mapping, not QNN-EP same-model session configuration bundles or VTCM backup sharing. | METHODOLOGICAL_ADJACENT / DIRECT_SUBTRACT for cost-ledger and contention-model ideas |
| S7 | [ORT spill/fill implementation change](https://github.com/microsoft/onnxruntime/pull/22853) | Public implementation history describes spill/fill as a context-binary generation setting intended to save RAM; it requires context-binary regeneration and is not a per-arrival/subgraph runtime action. | DIRECT_SUBTRACT / DEPLOYMENT_BASELINE |
| S8 | [ORT VTCM backup-sharing implementation](https://github.com/microsoft/onnxruntime/pull/24962) | Native implementation already enables a backup-buffer sharing feature; PR discussion ties it to reusable input/output buffers and creates required context binaries together. It does not publish an arrival-aware lease policy. | DIRECT_SUBTRACT / DEPLOYMENT_BASELINE |
| S9 | [V10: multi-tenant NPU scheduling](https://doi.org/10.1145/3579371.3589059) | Hardware-level multi-tenant NPU scheduling/preemption and fairness. It is not a commodity QNN EP context API, but subtracts generic multi-tenant NPU-scheduling story. | METHODOLOGICAL_ADJACENT |

## Collision conclusion

No source in the bounded scan gives the same QNN-EP object, finite configuration-bundle admission/dispatch decision, complete cold/warm/RPC/copy/sync/fallback ledger, and tail-latency/isolation claim. Native sharing and static spill/fill are already available and cannot be claimed as contributions. `HaX-CoNN` and V10 materially subtract generic contention/transition or multi-tenant-scheduling ideas; the residual must be limited to the public QNN session-portfolio boundary and a reproducible cost ledger. Status: `SEARCH_BOUNDED_OPEN`, not a novelty claim.

## Publicly verifiable now versus device-dependent

Publicly verifiable: option names/compatibility, source-level lifecycle and context-cache costs, CPU reference semantics on a compatible SDK install, report/parser/harness code, and static configuration manifests.

Device-dependent: actual HTP execution, contention under concurrent sessions, allocator behavior/effective VTCM capacity, shared-memory/RPC copy timing, warmup/cold behavior, spill/fill benefit, CPU fallback end-to-end cost, and any tail-latency or isolation result. Qualcomm-hosted tooling or a user-authorized device may help, but neither is assumed to expose the required concurrent-session trace.
