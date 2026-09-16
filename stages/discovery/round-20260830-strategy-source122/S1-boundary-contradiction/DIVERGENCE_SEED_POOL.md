# Source122 S1 Exact-Carrier Seed Pool

## Metadata

- Assignment: `DISCOVERY-S1-20260830-SOURCE122`
- Lane: `DISCOVERY_S1 / BOUNDARY_CONTRADICTION`
- Frozen before first source call: `YES`
- Seeds: `10 <= 12`; selected RQs: `8 <= 8`
- Excluded predecessor families: `SOURCE121-S1-EXECUTORCH-QFALLBACK-RANK-VALIDITY`, `SOURCE120-S1-VHLO-SEMANTIC-COMPAT`
- Network-security exclusion: `PASS`
- These seeds are non-evidence sketches; they assert no novelty, current absence, fault, or Q2 quality.

| Seed | Exact official carrier candidate | Boundary hypothesis | Disposition |
|---|---|---|---|
| S122-S1-01 | ORT session config key `session.disable_cpu_ep_fallback` and session initialization checks | Default CPU fallback and strict no-fallback mode may define different conformance decisions for the same model/EP. | KEEP |
| S122-S1-02 | ORT `IExecutionProvider::GetCapability` contract and `GraphPartitioner` source | EP capability is reported as graph partitions; semantically equivalent graph forms may alter partition boundaries without changing model semantics. | KEEP |
| S122-S1-03 | ORT graph partitioner/session unit tests | Existing fixtures may permit a mutation-based robustness oracle for node assignment, compilation and fallback invariants. | KEEP |
| S122-S1-04 | TensorRT EP `trt_min_subgraph_size`/partition configuration and provider tests | Threshold-driven subgraph eligibility may trade compilation/transfer cost against fallback fragmentation under a fixed graph. | KEEP |
| S122-S1-05 | QNN EP capability/partition tests and EP-context model cache | Offline/context caching may freeze a partition that becomes semantically or operationally inconsistent with current fallback behavior. | KEEP |
| S122-S1-06 | OpenVINO EP supported-subgraph and partition test fixtures | Device/plugin configuration may change partition coverage and fallback while preserving graph semantics. | KEEP |
| S122-S1-07 | XNNPACK EP quantized/operator partition tests | Quantized operator constraints may change exact EP coverage even when ONNX semantics remain valid. | KEEP |
| S122-S1-08 | NNAPI/CoreML EP partition/support tests | Backend-specific support checks provide contrary carriers for whether one cross-EP oracle is possible without changing guarantees. | KEEP |
| S122-S1-09 | ORT profiling JSON/kernel events carrying execution-provider identity | Provider-tagged events may expose realized fallback cost but not compile-time rejected capability regions. | KEEP |
| S122-S1-10 | ORT optimized-model/EP-context serialization paths | Persisted optimized/context artifacts may hide or preserve partition decisions across sessions and versions. | BACKLOG |

## Frozen convergence

| Seed | Primary RQ |
|---|---|
| S122-S1-01 | RQ01 |
| S122-S1-02 | RQ02 |
| S122-S1-03 | RQ03 |
| S122-S1-04 | RQ04 |
| S122-S1-05 | RQ05 |
| S122-S1-06 | RQ06 |
| S122-S1-07 | RQ07 |
| S122-S1-09 | RQ08 |

S122-S1-08 and S122-S1-10 remain non-evidence backlog. No source result may trigger replacement or promotion.

## Advisory

- Engines: `BOUNDARY_OR_FAILURE`, `JANUSIAN_TENSION`, `CONSTRAINT_MANIPULATION`, `COMPOSE_DECOMPOSE_SIMPLIFY`
- Perspectives: EP implementer, model deployer, compiler maintainer, measurement reviewer
- Largest surface: ONNX Runtime EP partition/fallback
- Coverage advisory: `PASS`
