# Discovery question card

## QC01 — MPI request free versus completion/error observability

| field | frozen content |
|---|---|
| signature | `MPI_REQUEST_FREE__ACTIVE_POINT_TO_POINT_HANDLE_RELEASE_COMPLETION_VISIBILITY__FIXED_MPI41_ENDPOINT__REQUEST_CPU_RSS_LATENCY` |
| exact identity | MPI-4.1 request-free semantics and Open MPI 5.0.x interface. |
| same-object contract | Same nonblocking point-to-point trace, handle state, buffer safety, completion/error observation, and message order. |
| native action | initiate nonblocking operation; call `MPI_Request_free`; continue MPI progress; optionally `MPI_Wait/Test` only while a valid handle remains. |
| current union | MPI-4.1 sets the handle to null and delays actual freeing for active point-to-point operations; Open MPI says communication completes but `Wait/Test` and subsequent error reporting are unavailable. Active receives must not be freed because safe buffer reuse cannot be verified. |
| skeptic/direct fatal | An external acknowledgement/tracker changes the completion/error endpoint or is a generic controller; a pool only changes ordinary allocation, not the fixed semantic primitive. |
| minimum falsifier | Free an active receive request then attempt buffer reuse or completion/error observation. Any proposed same-endpoint action that cannot retain these guarantees is falsified. |
| carrier/oracle | Public MPI C program with `MPI_Isend/Irecv`, `MPI_Request_free`, and peer reply; MPI's request handle and buffer safety are the native oracle. |
| full-cost | request metadata CPU/RSS, progress/communication latency, buffer residency, application tracking overhead, and error path. |
| finite route | 72h Stage0 could use the standard's sender/receiver trace before any performance test. No experiment occurred. |
| identity preflight | `NO_MATCH__NOT_NOVELTY_PROOF` on frozen registry/plan; related runtime records do not exclude. |
| disposition | `EXCLUDED_BEFORE_RAW__COMPLETION_OBSERVABILITY_CONTRACT_OR_GENERIC_APPLICATION_TRACKER` |

The exclusion is semantic/generic-kernel based, not due to missing implementation, result, resource, hardware, or AI readiness.
