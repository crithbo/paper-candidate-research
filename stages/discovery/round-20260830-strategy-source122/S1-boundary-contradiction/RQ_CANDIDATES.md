# Source122 S1 Frozen Primary RQs

- Freeze: before first official-source call.
- Object/semantic contract cannot change after lookup.
- No result-aware family backfill or replacement RQ is permitted.

## RQ01 — strict fallback conformance

Can `session.disable_cpu_ep_fallback` plus official ORT session fixtures define a canonical conformance decision that distinguishes “model runs with EP registered” from “all required nodes are actually supported by that EP,” without reducing correctness to session creation?

## RQ02 — partition robustness under semantic-preserving rewrites

For the ORT `GetCapability`/GraphPartitioner protocol, do result-independent semantics-preserving ONNX graph rewrites change EP partition/fallback structure enough to invalidate a fixed deployment decision under identical model outputs?

## RQ03 — graph-partitioner invariant benchmark

Can official graph-partitioner/session unit fixtures support a target-specific mutation oracle for assignment, compilation and fallback invariants whose failures change whether an EP integration is conformant?

## RQ04 — TensorRT minimum-subgraph threshold

Does the official TensorRT EP minimum-subgraph-size carrier admit a nontrivial threshold-selection or measurement result once compilation, transfer, engine-cache and CPU fallback costs are charged on one fixed model panel?

## RQ05 — QNN EP-context partition fidelity

Can official QNN EP/context-cache fixtures define a faithful same-model test of whether serialized EP partitions preserve current support/fallback semantics and full-cost decisions across reload?

## RQ06 — OpenVINO device/plugin partition stability

Do official OpenVINO EP support/partition fixtures expose a reproducible partition-stability boundary across current device/plugin configuration that changes a fixed deployability decision rather than merely enumerating supported operators?

## RQ07 — XNNPACK quantized partition conformance

Can official ORT XNNPACK EP quantized/operator fixtures define a non-generic conformance panel where ONNX-valid QDQ variations change EP coverage or fallback while preserving one immutable output-quality contract?

## RQ08 — compile-time capability versus realized fallback cost

Can ORT provider-tagged profiling events and partition metadata jointly define a same-model estimator whose error changes an EP-selection decision relative to node-count or EP-only timing proxies, without reproducing the excluded ExecuTorch ranking family?

## Precommitted source roles and stop conditions

| RQ | ANCHOR/CURRENT | CONTRARY | Early stop |
|---|---|---|---|
| RQ01-03 | ORT config/session/EP interface/GraphPartitioner/tests | current invariant tests and native strict-mode behavior | current union already expresses the same decision and oracle |
| RQ04 | TensorRT EP configuration/source/tests | native tuning/profile guidance and current engine-cache behavior | ordinary threshold tuning or current tool covers full-cost action |
| RQ05 | QNN EP context-cache/source/tests | current context validation/version contract | no same-object public route or only cache compatibility testing |
| RQ06 | OpenVINO EP support/partition source/tests | current device/plugin controls | configuration enumeration only |
| RQ07 | XNNPACK EP quantized tests/source | ONNX QDQ backend-test union | ordinary missing support or operator list only |
| RQ08 | ORT profiling/provider assignment surfaces | native profiling and excluded ExecuTorch family | five-field equivalent/contained or no ORT-specific endpoint |
