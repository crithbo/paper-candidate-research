# Discovery question card

## QC01 — multishot provided-buffer partial ownership

| field | frozen content |
|---|---|
| signature | `IO_URING_MULTISHOT_RECV__PROVIDED_BUFFER_INCREMENTAL_OWNERSHIP_CQE_ENDPOINT__FIXED_LIBURING_SEMANTICS__CPU_RSS_LATENCY` |
| exact identity | Current liburing multishot receive/provided-buffer APIs and upstream header flags. |
| same-object contract | Same multishot SQE, buffer group/ring, CQE flags/results, buffer ID and legal reuse/return semantics. |
| native action | Submit multishot receive with buffer select; consume CQEs; use provided buffer ring including `IOU_PBUF_RING_INC` when enabled. |
| current union | Current docs cover multishot CQEs (`MORE`), selected buffers, termination by error/cancel/exhaustion, incremental consumption (`BUF_MORE`), and return only after full consumption or error. The current header exposes the same flags. |
| strongest skeptic | The supposed action gap—partial buffer reuse and ring/CQ coordination—is already native. Any separate allocation policy is generic user-space scheduling; early reuse changes the fixed ownership endpoint. |
| minimum falsifier | One incremental buffer produces two CQEs, first with `BUF_MORE`; reusing it after the first CQE violates current documented ownership. |
| carrier/oracle | liburing public provided-buffer/multishot carrier; CQE flags and buffer IDs are native oracle. |
| full-cost | ring/CQE work, buffer RSS/residency, syscall/CPU, latency, and application allocator overhead. |
| finite route | 72h Stage0 could use the documented incremental two-CQE trace and source header; no experiment here. |
| identity preflight | Frozen registry/plan: `NO_MATCH__NOT_NOVELTY_PROOF`; related systems or buffers do not exclude. |
| disposition | `EXCLUDED_BEFORE_RAW__CURRENT_NATIVE_INCREMENTAL_BUFFER_UNION_OR_GENERIC_ALLOCATOR` |

Structural disposition only; no missing implementation, result, resource, hardware, or AI-readiness claim is used.
