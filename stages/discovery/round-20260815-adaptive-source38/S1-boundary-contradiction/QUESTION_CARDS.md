# Question cards

## Q38-01 — Zilsd form selection

- Exact object: fixed RV32 program/memory outcome, ABI and target with Zilsd; no altered memory semantics.
- Endpoint: compiler-side full-cost improvement with same behavior.
- Current locus: official Zilsd specification and LLVM main documentation, which marks Zilsd supported.
- Minimum falsifier: all legal choices are ordinary instruction selection, register allocation, or cost-table tuning.
- Natural carrier/closure: LLVM tests and RV32 load/store programs; assembler/disassembler and ABI oracle; compile CPU/RSS, code bytes, instruction/static-uop and runtime-memory costs. Finite Stage0 source pinning is possible.
- C0: `LOCATOR_ONLY__ORDINARY_FORM_SELECTION`; no nontrivial whole constructor or guarantee is named.

## Q38-02 — Programmatic dependent launch edge ports

- Exact object: fixed two-kernel dependency/visibility semantics in a CUDA graph, fixed graph edge/port and device target.
- Endpoint: a same-object construction guaranteeing useful early work without weakening visibility semantics.
- Current locus: CUDA Programming Guide PDL and CUDA Graph edge-data sections.
- Minimum falsifier: early execution is opportunistic and requires a driver scheduling decision or an unsafe assumption of concurrency.
- Natural carrier/closure: official CUDA graph samples and graph API legality; full cost includes graph construction/instantiation CPU/RSS, graph memory, kernel synchronization and GPU runtime. Stage0 can pin API and enumerate edge semantics.
- C0: `STRUCTURAL_DROP__OPPORTUNISTIC_CONTROLLER_SHAPE`. NVIDIA documents that concurrency is not guaranteed and reliance on it can deadlock; any remaining proposal is scheduling/control, not a preserved-guarantee N1/N2 mechanism.
