# Discovery log — Source15

Assignment: `DISCOVERY-S3-20260814-ADAPTIVE-SOURCE15`; canonical v8.7; V9 OFF; cutoff 2026-08-14.

## Checksum-pinned carrier discipline

Each row requires three adjacent immutable artifact revisions, a recorded upstream release/tag/commit plus SHA-256 of the acquired artifact before any future StageA analysis. Discovery did **not** download artifacts or fabricate their digests. A route without all three acquired checksums remains `NOT_ADMITTED_UNFROZEN`.

| ID | Version-triplet artifact route | Law and confounds | Same-object offline action | Status |
|---|---|---|---|---|
| S15-01 | Swift official release toolchain/source artifacts; source/release checksums to be recorded for three tags | Module/generic/resilience transition concentration, conditioned on target, optimization, standard-library version and package graph. | Compiler specialization/inlining partition. | raw: union/action not closed. |
| S15-02 | Zig official release source/toolchain checksums for three releases | Compile-time evaluation/comptime dependency transition law conditioned on target, optimization and build graph. | Offline codegen/layout decision. | raw: natural deployment corpus/action not closed. |
| S15-03 | ONNX release-tagged source/wheel artifacts with reproducible build/release identifiers | Operator/schema transition cohorts conditioned on opset, target backend and model graph class. | Offline compiler legalization/layout action. | raw: exact model carrier/action remains unclosed. |
| S15-04 | ONNX Model Zoo historical commit-pinned artifacts plus model/test-data hashes, if each artifact remains retrievable | Model revision topology/shape changes conditioned on operator set and test input. | Offline accelerator graph partition/memory layout construction. | deep: model zoo is historical-only/deprecated; no forward version panel. |
| S15-05 | Open Model Zoo commit-pinned model descriptors and downloaded artifact checksums, if release provenance is available | Model topology/shape transition cohorts conditioned on device and model family. | Offline GPU/NPU graph/memory mapping. | raw: Source13 OpenVINO mapping boundary and artifact identity risk. |
| S15-06 | Hailo Model Zoo commit-pinned ONNX/HEF artifact triplets and vendor checksums, if available | Model-to-compiled-artifact structural transition law conditioned on compiler/device/model family. | Offline accelerator partition/mapping. | deep: compiled HEF changes deployment object; same-object action not closed. |

Counts: six raw rows; six distinct opportunity signatures at screen level; two candidate-grade depth checks; zero briefs. No network-security, vulnerability, attack, traffic, replay or exploit topic was considered. No checksums were inferred, no artifact downloaded, and no experiment/build/E2/installation/downstream action was run.
