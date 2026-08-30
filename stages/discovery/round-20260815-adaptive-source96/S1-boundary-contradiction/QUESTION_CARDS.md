# S96-S1-QC01 — Java Cleaner cleanup visibility contract

- Identity/carrier: Java SE 25 Cleaner; `IMPLEMENTATION_CARRIER_ONLY`; network-security PASS.
- Endpoint: at-most-once action, explicit/automatic cleanup semantics, registration happens-before action, and compatible concurrent actions.

## Raw gate

- Current official locus: action executes at most once; explicit cleanup can occur before phantom reachability; registration happens-before the cleaner action; actions may run concurrently and must be compatible.
- Skeptic: any visibility/ordering change alters the fixed contract; retaining it leaves generic worker-queue placement/scheduling.
- Minimum falsifier: a same Cleaner/action-set two-action witness preserving all fixed effects yet demonstrating a target-specific, non-generic decision guarantee.
- Full-cost start: action CPU/RSS, queue wake latency, cleanup completion latency, worker lifetime and explicit-clean path cost.

## Disposition

RQ_COMPLETE; RAW_REQUIRED INCOMPLETE because no source-supported non-generic discriminator survives. `EXCLUDED_BEFORE_RAW__FIXED_CLEANUP_VISIBILITY_ENDPOINT_OR_GENERIC_WORKER_QUEUE_SCHEDULING`; no C0/deep. This is not based on missing implementation/result/resource/AI readiness.
