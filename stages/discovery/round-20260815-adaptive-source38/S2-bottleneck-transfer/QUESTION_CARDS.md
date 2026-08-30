# Research Question Cards — Source38 S2

| card | exact object / endpoint | current official locus | decisive contrary | disposition |
|---|---|---|---|---|
| QC-S38-01 | fixed Level Zero context/program, reserved VA, physical contents and outputs / VM map-access result | Level Zero v1.17.24 core API and programming guide, accessed 2026-08-15 | reserve/create/map/unmap/access/residency/sparse-map calls already express the action; no target-specific guarantee frozen | `EXCLUDED_BEFORE_RAW__CURRENT_VM_API_COMPOSITION` |
| QC-S38-02 | fixed CUDA kernel, input/output and memory contract / pipeline copy completion | CUDA Programming Guide Cooperative Groups and pipeline primitives, accessed 2026-08-15 | current `memcpy_async`, commit, wait, release, barrier/pipeline stages already express copy staging; remainder is stage-count/configuration | `EXCLUDED_BEFORE_RAW__CURRENT_PIPELINE_PRIMITIVE_UNION` |
| QC-S38-03 | fixed NVSHMEM program, PE ordering and communication result / team-QP communication completion | NVSHMEM 3.7 API/Team docs, accessed 2026-08-15 | current team split/init, QP, RMA and ordering APIs already express the potential construction; no target-specific non-policy guarantee frozen | `EXCLUDED_BEFORE_RAW__CURRENT_TEAM_QP_UNION` |

Full-cost on a later externally evidenced reopen would include setup/compile CPU, GPU memory/RSS, transfer bytes, synchronization/ordering, device time and end-to-end latency. No experiment was run.
