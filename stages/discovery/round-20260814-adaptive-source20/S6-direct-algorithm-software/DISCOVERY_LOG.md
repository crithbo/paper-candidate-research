# Source20 — S6 canonical discovery log

## Assignment and method

- Assignment: `DISCOVERY-S6-20260814-ADAPTIVE-SOURCE20-RECENT-LIMITATION-SOURCE-V4`
- Method: canonical v8.7, potential/readiness separated; `DISCOVERY_CLAIM_PACK_MODE=OFF`; V9 OFF.
- Safety exclusion applied: network security, vulnerabilities, attacks, exploits, protocol security, and malicious traffic.
- Search cutoff: 2026-08-14.  This was source-only research: no build, experiment, benchmark, installation, or large download.
- Funnel: 8 locators → 4 fresh raw records → 0 D1 → 0 candidate-grade deep reviews → 0 briefs.

## Independent limitation plus current-source screening

| Row | Recent external problem/limitation anchor | Current first-party reality check | Exact candidate object | D1 outcome | Final disposition |
|---|---|---|---|---|---|
| L1 | NITRO identifies static-model-inference limits in the then-current OpenVINO NPU path. [NITRO](https://arxiv.org/abs/2412.11053) | Current OpenVINO NPU documentation says compiler-in-plugin is the preferred path from 2026.1 and documents driver/plugin selection, compatibility and tile properties. [current NPU docs](https://docs.openvino.ai/2026/openvino-workflow/running-inference/inference-devices-and-modes/npu-device.html) | Fixed model plus NPU compiled artifact construction | Fail | `STRUCTURAL_DROP__PAPER_OWNED_CONSTRUCTOR_OR_CONFIGURATION` — the limitation is partly superseded, while the remaining choices are compiler/driver/tile configuration and the anchor paper already supplies its own framework. |
| L2 | Dato frames current programming models as unable to expose accelerator streaming and sharding adequately. [Dato](https://arxiv.org/abs/2509.06794) | The paper's task/layout mapping is itself the proposed complete constructor; no independent current native union was identified without treating its artifact as a baseline gap. | Dataflow accelerator task-to-fabric mapping | Fail | `STRUCTURAL_DROP__PAPER_OWNED_COMPLETE_CONSTRUCTOR` |
| L3 | CacheLib/FDP work documents lifetime mixing and device write amplification under flexible data placement. [primary paper](https://arxiv.org/abs/2503.11665) | CacheLib documents FDP as a device-layer capability to segregate BigHash and BlockCache IO, exposed through enabled-file-device configuration. [official FDP guide](https://cachelib.org/docs/Cache_Library_User_Guides/FDP_enabled_Cache/) | Fixed cache trace to FDP placement labels | Fail | `STRUCTURAL_DROP__CONTROLLER_OR_CHANGED_DEVICE_INTERFACE` — choosing reclaim-unit placement is an online policy/interface use; it is not a CPU same-object constructor independent of storage-device semantics. |
| L4 | The same CacheLib paper locates placement limitations, but does not establish a non-device-specific construction residual. | Navy is an SSD-optimized engine, turned on through `NavyConfig`; FDP is one supported option. [Navy overview](https://cachelib.org/docs/Cache_Library_Architecture_Guide/navy_overview/) | Navy SSD-object layout | Fail | `EXCLUDED_CONTAINED_BY_L3` |
| L5 | MIOpen's public Find API is a locator for convolution-algorithm selection pressure. | Official MIOpen documentation exposes Find/database solution discovery rather than a fixed writer/checker construction. [MIOpen docs](https://rocm.docs.amd.com/projects/MIOpen/en/latest/) | Fixed convolution descriptor to solution choice | Fail | `STRUCTURAL_DROP__EXISTING_POINT_SELECTOR` |
| L6 | CK's current public documentation is a useful accelerator-codegen locator. | CK exposes coordinate movement, thread mapping and memory-swizzle primitives. [CK docs](https://rocm.docs.amd.com/projects/composable_kernel/en/latest/) | CK-tile data-movement plan | Fail | `STRUCTURAL_DROP__GENERIC_LAYOUT_OR_PAPER_OWNED_CONSTRUCTOR` |
| L7 | PyTorch's current fusion discussion locates a known cross-kernel cost issue. [official post](https://pytorch.org/blog/why-is-pytorch-compile-so-fast-kernel-fusion/) | The resulting proposed action is generic kernel fusion/scheduling, excluded by contract and not a target-specific whole algorithm. | TorchInductor fusion grouping | Fail | `EXCLUDED__GENERIC_SCHEDULING` |
| L8 | gem5 remains a simulator/runtime locator only. | It was screened in Source19; no new exact problem/action identity is supplied here. | gem5 Ruby hierarchy | Fail | `EXCLUDED_HISTORICAL_REPEAT__SOURCE19` |

## Pre-outcome D1 result

Each raw record was checked before depth for an independent limitation anchor, a current native action union, an independent strongest subtractor, a same-object whole-algorithm promise, a natural carrier/oracle, and a finite falsifier.  None passed: L1–L2 are paper-owned or configuration-based, L3–L4 require a device-interface policy, and L5–L7 reduce to selectors or generic scheduling/layout.  Capacity therefore expires without backfill.

This does **not** infer that a missing implementation, missing result, unavailable resource, or AI readiness proves a negative scientific result.
