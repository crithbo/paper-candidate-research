# Question cards — Source61 S2

## QC-S61-01 — userfaultfd materialization

- Exact semantics: same virtual-memory contents, registered fault mode and stock mapping visibility after resolution.
- Current union: `UFFDIO_COPY`, `UFFDIO_ZEROPAGE` and `UFFDIO_CONTINUE` atomically resolve relevant faults; `DONTWAKE` separates wake timing.
- Cheapest falsifier: choosing a page-delivery ioctl or wake timing is a native primitive/controller, not a target-specific whole constructor.
- Full-cost if a residual later exists: fault-manager CPU/RSS, copied/mapped bytes, fault latency, wake latency and post-resolution access.
- Disposition: `LOCATOR_ONLY__RQ_BACKLOG`; no N2 action/guarantee is named, and no scientific negative inference is made.

## QC-S61-02 — THP collapse

- Exact semantics: fixed logical memory contents and ordinary virtual-memory reads/writes.
- Current union: THP global/process controls, `MADV_HUGEPAGE`, `MADV_COLLAPSE`, khugepaged and explicit collapse controls already establish the named promotion action and full resource tradeoff.
- Cheapest falsifier: policy/threshold choice does not constitute a new same-object N2 constructor.
- Full-cost if a residual existed: collapse/reclaim/compaction CPU, RSS, fault/access latency and memory footprint.
- Disposition: `EXCLUDED_BEFORE_RAW__GENERIC_POLICY_CONFIG`.

## QC-S61-03 — FUSE passthrough setup

- Exact semantics: same FUSE inode/backing-file bytes and stock direct read/write/splice/mmap behavior.
- Current union: kernel capability handshake, `FUSE_DEV_IOC_BACKING_OPEN`, backing ID, `FOPEN_PASSTHROUGH`, and `FUSE_DEV_IOC_BACKING_CLOSE` establish the native action bundle.
- Cheapest falsifier: selecting existing backing-file registration/open behavior is configuration/daemon control, not non-separable N2.
- Full-cost if it survived: registration/open CPU/RSS, direct I/O bytes, daemon/kernel crossings, cache effects and latency.
- Disposition: `LOCATOR_ONLY__RQ_BACKLOG`; no target-specific algorithm/guarantee has been named.
