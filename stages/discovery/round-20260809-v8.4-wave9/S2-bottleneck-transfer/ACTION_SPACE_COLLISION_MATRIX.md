# Action-space and collision matrix — WAVE9

## Frozen object and accounting

**Exact final object:** an on-demand serverless invocation restored from a persisted process or MicroVM snapshot, from restore request through first completed response.

**Semantic and information boundary:** the restore system may observe the snapshot image, its page/layout metadata, function runtime state and (where applicable) prior dirty-state/filesystem layers. It may not change the function's request semantics, silently substitute a warm instance, or compare against a different container/VM/function object.

**Full cost:** snapshot creation and storage footprint; compression/decompression CPU or accelerator occupancy; read/network transfer; page faults/prefetch and copies; VMA/process/filesystem metadata reconstruction; restore-to-first-response latency; steady-state request overhead; host memory/capacity and any required special hardware/networking.

## Same-object strong-work gate

| Work | Exact object / semantics / information | Atomic actions exposed | Natural workload / artifact | Collision role |
|---|---|---|---|---|
| Spice, OSDI 2026 | Process snapshot restored from disk to serve the same serverless function; accesses storage/virtual layout and process metadata | SHELF physical/virtual decoupling; sparse/reordered page overlay; prefetch; removal of needless I/O/copies/faults; bulk process-metadata restore | Java, Python and Node.js functions; official USENIX paper | Current strongest direct subtractor; covers the claimed post-optimization metadata residual. |
| Sabre, OSDI 2024 | Firecracker serverless MicroVM snapshot restored to avoid the same cold start; accesses snapshot pages and restore working set | Near-memory compression/decompression + snapshot page prefetch | Production-grade Firecracker and a broad serverless-app suite | Direct subtractor for data movement / compression / prefetch coupling. |
| REWIND, ATC 2024 | Same function container reset to pristine snapshot before next invocation; accesses page mappings, dirty state and filesystem layers | Kernel buddy page-table snapshot management; memory/process reset; OverlayFS restoration | OpenWhisk/Linux artifact and serverless workloads | Direct subtractor where the residual is reset, isolation or filesystem restore. |
| MITOSIS, OSDI 2023 | Same serverless function starts under a demand spike through remote fork; uses remote source state/RDMA | RDMA-codesigned remote fork/state transfer | FN integration and real-world serverless workloads | Adjacent compatible subtractor for remote materialization; it is not silently unioned with mechanisms requiring incompatible substrate. |

The first two rows satisfy the assignment's "at least two current strong works share exact object/semantics/information" entry condition. Rows three and four were then used only as compatible, scoped subtractors.

## Residual subtraction and action-gap decision

| Alleged bottleneck transfer | Strongest fair same-object baseline union action | Would-be new atomic joint action | Can union express it? | StageA action-gap certificate | Natural finite killer | Decision |
|---|---|---|---|---|---|---|
| Initialization → page movement | Sabre compresses and prefetches restore pages; Spice controls sparse/reordered restore layout and prefetch | Reorder/compress/prefetch pages jointly | Yes | Fails: no missing atom identified | Firecracker/Java/Python/Node suites exist, but cannot test a new atom | `DROP_DIRECT_COLLISION` |
| Initialization → VMA/process metadata | Spice co-designs physical/virtual layout and bulk-restores process metadata | Batch VMA/process-state reconstruction with page-layout coupling | Yes | Fails: the proposed atom is Spice's core action | Spice function suite exists, but would only repeat its mechanism | `DROP_DIRECT_COLLISION` |
| Initialization → reset/isolation filesystem metadata | REWIND restores memory, process and filesystem state in kernel | Dirty-layer/file-reset co-optimization | Yes, for the same reuse/reset semantics | Fails: no union-external atom | OpenWhisk workloads exist, but no independent action to falsify | `DROP_DIRECT_COLLISION` |
| Restore → remote transfer | MITOSIS has RDMA remote fork; Spice/Sabre cover local restore-side layout/prefetch | Choose a source, route, or retention level | No valid algorithmic gap: remaining action is an online controller/placement selector | Fails: a policy is forbidden and not an N1/N2 residual | Trace-based evaluation would test policy, not a new same-object mechanism | `DROP_FORBIDDEN_CONTROLLER` |

## Negative integrity checks

- No `SEARCH_BOUNDED_OPEN` label is used as a novelty claim.
- No proposed union crosses incompatible function/container/MicroVM semantics or hides hardware/network prerequisites.
- No result was dropped for lack of implementation, hardware, core results, resources, or AI readiness.
- No Wave1–8 S2 object is reused, and no existing in-flight topic is renamed.

**Outcome:** no action-gap certificate survives; therefore no `PROPOSE_STAGE0`, Tier label, structural-paper-potential or readiness claim is applicable to a candidate.
