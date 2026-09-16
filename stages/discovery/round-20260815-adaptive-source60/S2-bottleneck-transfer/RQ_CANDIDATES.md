# RQ candidates — Source60 S2

| ID | Primary same-object RQ | Hypothesized type | Minimum falsifier | Pre-evidence route |
|---|---|---|---|---|
| RQ-S60-01 | For a fixed AF_XDP endpoint, can a target-specific UMEM/ring/metadata constructor reduce ownership-transition full cost while preserving stock packet and ownership semantics? | `SYSTEM_ARCHITECTURE`, possible N2 | Only choosing UMEM flags, ring sizes, zero-copy/copy mode or an XDP routing policy remains. | ORDINARY_CLOSURE |
| RQ-S60-02 | For fixed partitioned MPI data and completion semantics, can a target-specific partition construction plus readiness action improve full cost beyond the native request/ready interface? | `SYSTEM_ARCHITECTURE`, possible N2 | Candidate only decides when to invoke existing `MPI_Pready`. | ORDINARY_CLOSURE |
| RQ-S60-03 | For a fixed RDMA buffer/PD/access contract, can a target-specific registration/translation constructor improve registration plus transfer full cost beyond current MR/UMR actions? | `SYSTEM_ARCHITECTURE`, possible N2 | Candidate only selects current MR access/re-registration controls. | ORDINARY_CLOSURE |

No alternative RQs were generated. The RQs are not raw admissions or contribution claims.
