# Pre-evidence RQ candidates

## RQ-S66-01 — OpenCL command-buffer construction

For a fixed OpenCL command sequence, resources, kernel arguments, and observable device result, can a target-specific non-separable command-state constructor improve record/finalize/enqueue/reuse full cost without becoming an existing mutable-dispatch controller?

## RQ-S66-02 — SYCL graph finalization/update

For a fixed SYCL graph, queue/device, data dependencies, and observable result, can a target-specific graph-finalization/state constructor improve build/update/execute full cost beyond the native graph action union?

## RQ-S66-03 — CUDA memory-pool transition

For a fixed CUDA workload, allocation lifetimes, stream semantics, and output, can a target-specific pool-state constructor reduce allocation/reuse/trim plus execution full cost beyond a current stream-ordered allocation policy?

All three are primary RQs with stable object/guarantee boundaries, ready for ordinary source closure only.
