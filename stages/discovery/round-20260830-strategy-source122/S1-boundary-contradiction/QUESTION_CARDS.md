# Source122 S1 Question Cards

## QC-RQ02-03 — ORT EP assignment stability

- Exact public identity: current ONNX Runtime `GetCapability`/GraphPartitioner protocol, `session.record_ep_graph_assignment_info`, official session/FuseExecutionProvider fixtures and ONNX model/test carriers.
- Carrier kind: `CANONICAL_BENCHMARK_ONLY`.
- Object/contract: identical ONNX model semantics and inputs under result-independent semantics-preserving graph rewrites; output legality/quality cannot be relaxed.
- Problem/estimand: variation in EP-assigned subgraphs, boundary count and end-to-end full cost across equivalent variants, and whether that variation changes a precommitted EP/optimizer deployment decision.
- Contribution type/route: `BENCHMARK_DATASET / COMPILER_TOOL / MEASUREMENT_CHARACTERIZATION`, `N3` with optional N2 prioritization.
- Counterfactual: if assignment instability is decision-relevant, a deployment chosen from the unmutated graph or node-count coverage can be rejected or reranked on an equivalent representation.
- Non-generic discriminator: ORT-specific mapping of rewrite lineage to `OrtEpAssignedSubgraph`, provider priority, strict fallback, compile/fusion and runtime profile; output-only differential testing is insufficient.
- Current locus: official Python assignment-info API, EP interface and FuseExecutionProvider/session tests.
- Known direct fatal: `NONE_FOUND_WITHIN_BOUND`; OODTE and ModelMeta are direct subtractors/methodological adjacency.
- Strongest objection: partition variation is permitted and may be performance-beneficial; without a stable decision endpoint and lineage oracle the work collapses into generic metamorphic testing.
- Minimum falsifier: on a precommitted official-model panel, equivalent rewrites do not change any EP/optimizer choice after full cost, and assignment-aware features do not improve held-out decision prediction over native/node-count baselines.
- Full cost: rewrite/generation, output validation, session creation/EP compile/cache, assigned/fallback execution, copies/synchronization, runtime latency, artifact bytes, trace overhead and failed-cell denominator.
- Finite closure: freeze ORT/ONNX commits, 3-5 official models, 4-8 legality-preserving rewrites, CPU+CUDA/TensorRT or another available EP pair, lineage map, output oracle, assignment records and paired full-cost traces.
- Bounded debt: exact rewrite legality, current ModelMeta/full paper facet, EP availability, held-out panel breadth and observer effect. Owner Stage 0/Stage A preclaim; at most four decisive questions.
- Front-end disposition: `EVIDENCE_QUALIFIED_RAW`; eligible for C0 `YES`.

## Other RQs

| RQ | Disposition | Reason |
|---|---|---|
| RQ01 | `EXCLUDED_BEFORE_RAW__CURRENT_UNION` | `session.disable_cpu_ep_fallback` already provides the strict support decision; adding a wrapper is not a contribution. |
| RQ02 | `EVIDENCE_QUALIFIED_RAW__MERGED_WITH_RQ03` | Exact assignment carrier and same-object decision survive. |
| RQ03 | `EVIDENCE_QUALIFIED_RAW__MERGED_WITH_RQ02` | Official Fuse EP/session fixtures provide the oracle skeleton, not a separate paper family. |
| RQ04 | `EXCLUDED_BEFORE_RAW__ORDINARY_TUNING` | TensorRT min-subgraph threshold, partition iterations, engine cache and profiling are explicit current controls; no new algorithm survived. |
| RQ05 | `EXCLUDED_BEFORE_RAW__DIRECT_SUBTRACT` | EPContext compatibility status, recompile preference, strict fail and model-package variant selection now occupy the proposed endpoint. |
| RQ06 | `EXCLUDED_BEFORE_RAW__CONFIG_ENUMERATION` | OpenVINO device/plugin partition differences lack a non-generic action beyond the merged cross-EP benchmark. |
| RQ07 | `EXCLUDED_BEFORE_RAW__ORDINARY_SUPPORT_GAP` | XNNPACK quantized/operator coverage remains provider support/testing, already adjacent to ONNX backend tests. |
| RQ08 | `EXCLUDED_BEFORE_RAW__CURRENT_UNION_AND_PREDECESSOR` | Assignment-info/profiling/auto-selection are current, and a pure ranking study approaches the excluded ExecuTorch family; only assignment-stability residual is retained in RQ02/03. |

No RQ was added after source lookup began.
