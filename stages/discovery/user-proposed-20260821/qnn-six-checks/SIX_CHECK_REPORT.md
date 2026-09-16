# QNN-KV-Handoff — six interface checks

Assignment: `DISCOVERY-S1-20260821-USER-QNN-SIX-INTERFACE-CHECKS`  
Mode: locator and interface closure only; not a Stage 0 review or performance experiment.

## Input integrity

- Archive SHA-256 matches the frozen value: `1F1696FBBF39C4C6810386E8472692EA1E434011B15D02E10F84A3C3F61E9B67`.
- Only the allowed `stage0_freeze_pack_2026-08-21/qnn/` entries were inspected.
- `closure_checklist.md`: `ECCDDA515FD2B904ADB92B2702914141E78F19504C1854C01D4C4243CF1E3D5C`.
- `branch_decision.yaml`: `8703F96405BFC75EA1E8D7F54D42FD16F8F747AFB99316E58CE2402FA45ED013`.
- `locator.yaml`: `82138D160664FEC18978C58543AF5D0157EAF1DD097BF28E904458B12665A51E`.

## Result

| Check | Required interface fact | Evidence observed in this assignment | Result |
|---|---|---|---|
| 1. Binary comparability | Same weights/encodings/runtime/target/partitioning and SHA-256s for 512 and 4096 binaries. | Locator leaves device, runtime, asset/job IDs and both binary hashes null; no accessible job/artifact exposes them. | `BLOCKED__BINARY_IDENTITIES_UNOBSERVED` |
| 2. External KV contract | Per-layer K/V dtype, encoding, shape, stride, axes, padding, offset and import/export/persistence descriptors. | No QNN context binary or descriptor API response is accessible. | `BLOCKED__KV_DESCRIPTORS_UNOBSERVABLE` |
| 3. Persistent buffer binding | Same device allocation can bind to both graph views without copy/materialization. | No supported connected device, QNN runtime, or existing job binding trace is accessible. | `BLOCKED__REQUIRED_DEVICE_RUNTIME_INACCESSIBLE` |
| 4. Stock switch data path | Position-512 trace and bytes/latency for stock graph switch. | No executable stock graph/device/job trace is accessible; no profiling job was created. | `BLOCKED__STOCK_SWITCH_TRACE_UNOBSERVABLE` |
| 5. Fusion feasibility | Remap is inside attention load with no full-history output or second scan. | Source locator expressly leaves fusion interface unclosed; no generated graph/descriptor exists to inspect. | `BLOCKED__FUSION_INTERFACE_UNOBSERVABLE` |
| 6. Benefit premise | 512 graph advantage versus 4096 graph on identical device/runtime/precision. | Same-device/runtime binary pair is unavailable, so no non-claim profiling trace may be performed. | `BLOCKED__COMPARABLE_BENEFIT_PREMISE_UNOBSERVED` |

The branch rule's D condition is directly met twice: required device/runtime is inaccessible and tensor descriptors/binding are not observable. This is a resource/interface blocker only; it is not a scientific rejection and does not establish native zero-copy absence, incompatibility, fusion feasibility, or performance benefit.

