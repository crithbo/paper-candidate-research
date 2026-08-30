# Question cards — Source60 S2

## QC-S60-01 — AF_XDP UMEM/ring construction

- Exact semantics: same socket/netdev/queue, packet bytes, UMEM frame ownership and stock kernel/user completion behavior.
- Current action union: XDP_UMEM_REG, FILL/COMPLETION/RX/TX ring creation, shared UMEM, copy/zero-copy bind modes, fixed UAPI descriptor and TX metadata layout.
- Minimum falsifier: any proposed residual that only selects chunk/headroom/ring-size/bind mode or routes packets via existing XDP policy is a native configuration/controller.
- Full-cost boundary if a valid residual later existed: registration/setup CPU/RSS, pinned memory, descriptors/bytes, packet copy, completion and latency.
- Disposition: `LOCATOR_ONLY__RQ_BACKLOG`; no non-generic target-specific N2 action/guarantee is named.

## QC-S60-02 — MPI partition construction/readiness

- Exact semantics: same communicator, buffer values, partition count/count/datatype/destination/tag and completion behavior.
- Current union: a native partitioned request initialized by `MPI_Psend_init`, with each partition explicitly marked ready through `MPI_Pready`.
- Minimum falsifier: an alleged contribution that only chooses partition-ready call timing is a scheduler/controller, not a complete joint constructor.
- Full-cost if it survived: producer readiness, request setup, communication progress, bytes, memory and completion latency on a public MPI workload.
- Disposition: `EXCLUDED_BEFORE_RAW__GENERIC_SCHEDULER_CONTROLLER`.

## QC-S60-03 — RDMA MR registration/translation

- Exact semantics: same buffer values, protection domain, access rights and stock remote-access contract.
- Current union: official material documents MR registration coupled to a PD/access contract and existing translation/re-registration facilities.
- Minimum falsifier: selecting MR access or re-registration options does not create a new same-object algorithm/guarantee.
- Full-cost if it survived: registration/translation CPU/RSS, pinned memory, bytes, transfer latency and teardown/recovery.
- Disposition: `LOCATOR_ONLY__RQ_BACKLOG`; no absence or scientific negative claim.
