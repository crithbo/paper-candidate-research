# DISCOVERY-S2-20260809-V8.4-WAVE9 — Discovery log

## Contract and result

- Assignment: `DISCOVERY-S2-20260809-V8.4-WAVE9`
- Method actually used: accepted production Discovery method `v2/v8.1`, with v8.4 two-layer judgment and baseline-residual-first. The TLS-blocked two-axis `v8.2r2` was not used.
- Cut-off / collision check: 2026-08-09.
- Scope: one final object only—on-demand serverless-function restore from a stored process/MicroVM snapshot, measured through restore-to-first-response latency and its full resource cost.
- Result: `COMPLETE_ZERO_PROPOSALS`; no `PROPOSE_STAGE0` and no brief are produced.

## Source lineage and search record

All technical evidence below is a primary conference paper/proceedings page or an upstream official artifact statement. Search was refreshed in this assignment; no earlier `SEARCH_BOUNDED_OPEN` result was treated as a novelty conclusion.

| UTC date | Query family / source checked | Result used |
|---|---|---|
| 2026-08-09 | `serverless snapshot restore cold start`, official USENIX OSDI/ATC pages | Identified three deployable same-object mechanisms: MITOSIS, Sabre, and Spice. |
| 2026-08-09 | `serverless snapshot metadata restore`, official USENIX OSDI 2026 page | Spice explicitly covers sparse/reordered page layout, prefetch, unnecessary I/O/copies/faults, and bulk process-metadata restoration. |
| 2026-08-09 | `serverless snapshot compression prefetch`, official USENIX OSDI 2024 page | Sabre covers compressed snapshot-page prefetching and end-to-end Firecracker integration. |
| 2026-08-09 | `serverless checkpoint restore file system`, official USENIX ATC 2024 paper/artifact appendix | REWIND covers kernel snapshot management plus memory, process and filesystem restoration on OpenWhisk/Linux and documents reproducible container artifacts. |

Primary sources:

- Holmes et al., *Rethinking Process Snapshots for Near-Warm Serverless Cold Starts* (OSDI 2026), official USENIX page: <https://www.usenix.org/conference/osdi26/presentation/holmes>.
- Lazarev et al., *Sabre: Hardware-Accelerated Snapshot Compression for Serverless MicroVMs* (OSDI 2024), official USENIX page: <https://www.usenix.org/conference/osdi24/presentation/lazarev>.
- Song et al., *A Secure, Fast, and Resource-Efficient Serverless Platform with Function REWIND* (USENIX ATC 2024), official proceedings/artifact appendix: <https://www.usenix.org/system/files/atc24-song.pdf>.
- Wei et al., *No Provisioned Concurrency: Fast RDMA-codesigned Remote Fork for Serverless Computing* (OSDI 2023), official USENIX page: <https://www.usenix.org/conference/osdi23/presentation/wei-rdma>.

## Baseline-residual-first decision

Two current strong works share the exact object, semantics and information boundary required by this assignment:

1. **Sabre (OSDI 2024)**: restores the same serverless MicroVM snapshot to avoid cold initialization; it knows the snapshot pages and the restore working set and can jointly compress and prefetch them in Firecracker.
2. **Spice (OSDI 2026)**: restores the same on-demand serverless process snapshot from disk; it knows the snapshot storage layout, virtual layout and process metadata, and jointly performs layout/restore-path co-design plus bulk metadata reconstruction.

REWIND is a further same-object same-semantic subtractor for reset/reuse: it restores an initial container snapshot, including filesystem state, under Linux/OpenWhisk. MITOSIS provides an adjacent same-service-scale remote-fork mechanism. These are compatible only where their semantics and deployment prerequisites match; the matrix deliberately does **not** assert a fictitious universal union.

Candidate residuals considered after the strongest compatible union were: (a) page/metadata restore ordering, (b) prefetch/compression/layout coupling, (c) filesystem reset coupling, and (d) remote materialization. Each is already an atom supplied by Spice, Sabre, REWIND, or MITOSIS respectively. The remaining variants are either parameter selection between those actions, admission/keep-warm/placement policy, or an incompatible object. They are forbidden controller/selector work or fail same-object.

## StageA-yield-aware gate

No retained mechanism can supply both mandatory certificates:

- **Action-gap certificate:** none. The compatible baseline union already expresses every identified atomic restore action: snapshot layout, page compression, page prefetch, bulk VMA/process-metadata restoration, container memory/filesystem reset, and remote fork/materialization.
- **Finite natural killer:** no independent candidate remains to test. The source papers already expose natural serverless application suites (Spice: Java/Python/Node.js functions; Sabre: Firecracker serverless applications; REWIND: OpenWhisk serverless workloads), but a finite corpus cannot falsify a non-existent action gap. Re-running those suites as a scheduling or parameter policy would not be a valid Stage A killer.

This is a structural collision/absorption conclusion, not an implementation, resource, benchmark, AI-readiness, or missing-results rejection.

## Final disposition

`COMPLETE_ZERO_PROPOSALS` — no target meets the mandatory same-object action-gap and finite-natural-killer conditions. Lane state: `IDLE_REUSABLE_AWAITING_MAINLINE`.
