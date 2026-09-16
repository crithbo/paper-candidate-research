# Source33 question cards

## QC-01: NVPTX tcgen05 tensor-memory allocation/copy protocol

- **Exact identity:** fixed NVPTX/CUDA kernel IR, tensor-memory operations,
  architecture feature set, input tensors, output tensors and launch-visible
  behavior.
- **Problem / endpoint:** construct a legal allocation-plus-copy protocol;
  endpoint is protocol feasibility together with a declared construction-cost
  frontier, not an unqualified throughput claim.
- **Counterfactual:** a legal alternative column/collective-mode/protocol plan
  can change tensor-memory reservation and synchronization state while keeping
  output tensors unchanged.
- **Current-source locus:** LLVM NVPTX usage documentation specifies
  `tcgen05.alloc`, column constraints and associated state; it is a bounded
  source locus, not a closed producer-union claim.
- **Non-generic discriminator:** target instruction constraints couple
  power-of-two column allocation, collective group choice, tensor-memory
  handle and asynchronous-copy/barrier state.
- **Carrier / oracle:** canonical formal GPU-IR carrier and stock NVPTX
  verifier/lowering semantics; a finite public LLVM NVPTX test subset is the
  Stage0/StageA carrier route.
- **Full-cost boundary:** construction time/space, generated code size,
  verifier/lowering cost, temporary storage, and (if later authorized)
  GPU execution/resource occupancy. Hardware effects are not claimed here.
- **Minimum falsifier:** source-level review shows the current producer union
  already enumerates equivalent joint plans, or target-specific coupling
  erases to generic allocation/scheduling.
- **Finite closure plan:** source-pin LLVM intrinsic/lowering paths and tests;
  enumerate legal protocol transitions; compare against current lowering and
  direct GPU tensor-memory literature; construct one legal two-plan witness.
- **Disposition:** `RAW__UNRESOLVED_BOUNDED`; not eligible for clean brief in
  this assignment because the native producer union and non-product guarantee
  are not yet closed.

## QC-02: NVPTX shared-symbol cross-block address folding (control)

- **Exact identity:** fixed NVPTX MachineFunction and shared-memory accesses.
- **Current-source locus:** `NVPTXAddressFolder.cpp` documents cross-block
  folding and explicitly leaves shared/shared-cluster symbol moves CSE-able;
  it records regressions from rematerializing them.
- **Disposition:** `STRUCTURAL_DROP__GENERIC_PRODUCT_OR_CURRENT_UNION_ABSORPTION`.
  Removing the address-space-specific presentation leaves ordinary CSE/address
  folding; no target-specific independent construction/guarantee survived.

