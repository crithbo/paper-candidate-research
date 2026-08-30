# Question cards

## Q39-01 — Zcmt table jump layout

- Exact object: fixed RISC-V indirect-control result, ABI and Zcmt target.
- Current locus: official Zc extension specification; LLVM main lists Zcmt as assembly support.
- Endpoint: same-program compiler full-cost improvement.
- Falsifier: only instruction selection/jump-table encoding or local layout tuning remains.
- Finite closure: LLVM source/test suite plus assembler/disassembler oracle; compile CPU/RSS, bytes, relocation and static front-end cost.
- C0: `LOCATOR_ONLY__ENCODING_SELECTION`; nontrivial whole constructor/guarantee is not frozen.

## Q39-02 — CUDA CDP2 nested grid

- Exact object: fixed parent/child grid output, device target and implicit nesting synchronization semantics.
- Current locus: CUDA Dynamic Parallelism guide (CDP2 default since CUDA 12).
- Endpoint: preserve nesting/visibility while changing a complete construction.
- Falsifier: action relies on concurrent execution/scheduling of grids.
- Finite closure: public CUDA dynamic-parallelism examples and runtime semantic oracle; full cost includes host/device launch overhead, CPU/RSS, child-grid resource use and GPU runtime.
- C0: `STRUCTURAL_DROP__DYNAMIC_CONTROL_AND_NO_CONCURRENCY_GUARANTEE`; CUDA explicitly says no new concurrency guarantee and unsafe reliance on concurrency is unsupported.
