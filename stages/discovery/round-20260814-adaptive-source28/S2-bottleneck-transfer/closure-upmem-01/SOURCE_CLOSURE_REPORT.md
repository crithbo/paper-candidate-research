# UPMEM source closure 01

Assignment: `DISCOVERY-S2-20260814-SOURCE28-UPMEM-SOURCE-CLOSURE01`  
Frozen family: `UPMEM_HOST_DPU_TRANSFER_TASKLET_CONSTRUCTOR`.

## Bounded route result

1. The official [UPMEM GitHub organization](https://github.com/upmem) is domain-verified and exposes the public `dpu_demo` example repository (Apache-2.0; listed as updated 2025-01-30) plus an LLVM fork. This establishes an official example/provenance route, not a version-pinned SDK runtime catalogue.
2. The official 2024 SDK presentation names host actions `dpu_prepare_xfer`, `dpu_push_xfer`, `dpu_launch(DPU_ASYNCHRONOUS)`, `dpu_sync`, callbacks and tasklet barriers. It is presentation material, not a current version/tagged SDK API reference.
3. The bounded fallback did not yield a current, version-pinned official SDK source/doc that enumerates transfer, tasklet, launch, memory and synchronization actions together with default/non-default runtime or compiler entries. A primary benchmark repository explicitly notes that `sdk.upmem.com` is deprecated; this is contrary transport/provenance evidence, not absence evidence about the platform.

## Decision

The unique missing field remains unclosed. No complete current native union may be claimed and no C0/deep review is authorized. The frozen family therefore remains `SOURCE_CLOSURE_QUEUE__NO_SCIENTIFIC_INFERENCE`; it is neither DROP nor a Stage0 proposal.

No build, install, benchmark, experiment, data download, or source execution occurred.
