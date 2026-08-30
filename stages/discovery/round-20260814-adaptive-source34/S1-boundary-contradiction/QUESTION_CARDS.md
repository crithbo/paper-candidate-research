# Evidence-qualified Question Cards

## RQ-S01-2 — RISC-V Ztso atomic lowering

| Field | Finding |
|---|---|
| Exact identity | Fixed C/C++ atomic program, language-level outcome, ABI, and Ztso target. |
| Atomic action | Choose legal fence/atomic lowering and schedule. |
| Current locus | Official Ztso v1.0; LLVM current RISC-V atomics ABI/tuning documentation. |
| Carrier / full cost | Public atomics tests; compile CPU/RSS, text bytes, fences, throughput, runtime. |
| Falsifier | Candidate only removes/rearranges fences through ordinary lowering/scheduling. |
| Decision | **EXCLUDED_BEFORE_RAW__GENERIC_WRAPPER_OR_SOLVER.** Ztso has no new instruction and the proposed action is generic lowering under a different memory model. |

## RQ-S02-2 — OpenCL mutable command-buffer grouping

| Field | Finding |
|---|---|
| Exact identity | Fixed command-buffer workload, completion/order semantics, and device-visible output. |
| Atomic action | Group/commit mutable commands between record/update/enqueue points. |
| Current locus | Official `cl_khr_command_buffer_mutable_dispatch` and OpenCL specification. |
| Carrier / full cost | Public OpenCL command-buffer workloads; host CPU/RSS, update/enqueue cost, device latency, memory. |
| Falsifier | The action is command update/replay controller logic. |
| Decision | **EXCLUDED_BEFORE_RAW__CONTROLLER_OR_SELECTOR.** The official primitive itself is a command-update control interface, so the proposed mechanism is disallowed rather than a new same-object contribution. |

`evidence_qualified_raw_count: 0`
