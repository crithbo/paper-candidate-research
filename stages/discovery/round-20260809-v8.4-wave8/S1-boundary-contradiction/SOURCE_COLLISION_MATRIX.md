# S1 Wave8 semantic/deployment boundary residual matrix

- Assignment: `DISCOVERY-S1-20260809-V8.4-WAVE8`
- Cutoff: 2026-08-09.
- Method: accepted production `v2/v8.1`, with v8.4 two-layer judgment and baseline-residual-first. TLS-blocked `v8.2r2` is excluded.
- Result: `ZERO_PROPOSALS`.

| Real deployment assumption failure | Same exact public object | Strongest fair union and direct subtractor | Residual test | Decision |
|---|---|---|---|---|
| CPU-side KV offload assumes a PCIe staging-buffer path; this fails on coherent high-bandwidth CPU–GPU interconnects | Long-context LLM KV cache offloading on GH200/GB200-like heterogeneous CPU–GPU systems | [DirectKV, OSDI 2026](https://www.usenix.org/conference/osdi26/presentation/luo): CPU-resident KV direct access, no GPU staging buffer, CPU-memory-aware CUDA kernels, fusion, and warp pipelining; compares existing offloading systems. | A transport-aware cache placement rule, zero-copy path, fetch overlap, or buffer elimination lies inside DirectKV’s action union. Moving to PCIe changes deployment assumptions and does not by itself create a distinct mechanism/guarantee. | `DROP`—same-object union absorbs the residual. |
| Hardware idle passthrough assumes a vCPU’s idle state need not be visible to a hypervisor; oversubscription makes this false | `mwait` handling for oversubscribed cloud VMs | [mwait-sched, OSDI 2026 technical sessions](https://www.usenix.org/conference/osdi26/technical-sessions): deterministic timer emulation, idle-interval classification, multi-address proxy, and restored idle visibility; evaluated across nine workloads and production-scale regions. | Any proxy/classifier/controller that makes idle observable or schedules `mwait` is within the direct mechanism. A different cloud setting would be a deployment rename. | `DROP`—`DIRECT_FATAL`. |
| Process snapshot restoration assumes virtual-memory reconstruction should follow on-disk snapshot layout | Serverless Java/Python/Node process snapshot restore from disk | [Spice, OSDI 2026](https://www.usenix.org/conference/osdi26/presentation/holmes): SHELF representation, `spliceVMA`, sparse/reordered overlays, prefetch, and bulk process-metadata restore, compared with process/VM snapshot baselines. | Changing physical/virtual layout, page overlay, restore prefetch, or bulk metadata reconstruction is inside Spice’s union. A snapshot-format tweak is not an independent N1/N2/N3. | `DROP`—same-object strong-baseline absorption. |
| Object/page tiering assumes page hotness is a usable allocator unit; real object hotness fragmentation violates it | Concurrent unmanaged-language structures with page-aware tiering backends | [OBASE, OSDI 2026 technical sessions](https://www.usenix.org/conference/osdi26/technical-sessions): pointer instrumentation, concurrency-safe object migration, hot/cold address-space engineering, six unmodified backends and production Meta/Twitter traces. | Any object clustering/migration/frontend action is OBASE’s mechanism family. This object is additionally excluded because S4 pagepack is an active separate topic. | `DROP`—direct collision plus assignment exclusion. |

## Two-layer judgment record

No preserved lead has an independently defined exact object, atomic N1/N2/N3 mechanism, full-cost comparator, or finite Stage A falsifier outside the frozen union. Therefore each has `structural_paper_potential: BELOW_Q2_STOP` for this **new residual only**; `current_evidence_readiness` is `NOT_APPLICABLE_NO_RESIDUAL`, not a reason for rejection.

## AMD boundary

No AMD proposal is made. The registry’s official-source audit states that `gfx1250 = CDNA5` is unverified and forbidden. This batch does not equate AMD Tensor Data Mover/Tensor DMA with NVIDIA TMA, nor infer architecture identity from a toolchain target.
