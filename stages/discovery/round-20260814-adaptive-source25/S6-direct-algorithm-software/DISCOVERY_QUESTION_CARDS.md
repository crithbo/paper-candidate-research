# Source25 Question Cards after divergence convergence

## QC-01 — RISC-V vector configuration state construction

- **Seed provenance:** S01 / `BISOCIATION_STRUCTURAL_TRANSFER`, ISA finite-state-scope cluster.
- **Identity / carrier:** `RISCV_VSETVLI_STATE_CONSTRUCTION__OPENBLAS_0_3_33_RVV_KERNELS`; OpenBLAS 0.3.33, 2026-04-23, public RVV kernel release. [official release page](https://www.openmathlib.org/OpenBLAS/); `NATURAL`. Network-security exclusion: PASS.
- **Problem / insight:** Fixed RVV kernel compilation must preserve VL/VTYPE/vector numerical semantics while inserting configuration changes across a CFG.  A possible N2 would be a target-specific finite-state placement/construction rule that uses current legal VSETVLI transitions but gives a certified reduction in redundant transitions.
- **Contract:** fixed OpenBLAS kernel source and target RVV ISA/vector-length contract; same numerical output/tolerance and ABI.  Full cost includes compiler CPU/RSS/temp, emitted bytes and VSETVLI count plus kernel execution cost.
- **Evidence/opposition:** LLVM’s current pass collects VL/VTYPE effects, runs dataflow propagation, inserts VSETVLI, performs PRE, can mutate prior configuration, and coalesces VSETVLIs. [current source](https://www.llvm.org/docs/doxygen/RISCVInsertVSETVLI_8cpp_source.html)  This is the strongest current union and contrary evidence.
- **Falsifier / closure:** use a small CFG with two legal incoming VTYPE states, native assembler/object inspection and numerical kernel equality.  Stop if the action is already produced by current dataflow/PRE/coalescing or requires changing RVV semantics.
- **Audit:** COMPLETE; FRESH; `FRESH_RAW_OPPORTUNITY`; C0 YES.

## QC-02 — AArch64 SME streaming scope construction

- **Seed provenance:** S02 / `PROBLEM_REFRAMING`, ISA finite-state-scope cluster.
- **Identity / carrier:** public LLVM SME specification/ACLE-to-IR contract; `CANONICAL_FORMAL_ORACLE`.
- **Problem / insight:** compiler-inserted streaming-mode changes may appear to form a scope construction problem.
- **Evidence/opposition:** LLVM specifies PSTATE.SM/ZA function attributes, ABI transitions, and instruction legality by mode. [official SME documentation](https://www.llvm.org/docs/AArch64SME.html)
- **Audit:** INCOMPLETE; `LOCATOR_ONLY`.  No fixed natural program carrier and no same-object scope action are available without changing function attributes/ABI interface; it cannot enter C0.

## QC-03 — mixed-precision iterative-refinement state

- **Seed provenance:** S04 / `JANUSIAN_TENSION`; carrier candidate SuiteSparse Matrix Collection.
- **Audit:** INCOMPLETE; `LOCATOR_ONLY`.  The sketch lacks a target-specific non-generic state construction rather than solver/precision configuration.

## QC-04 — AArch64 load/store pair/addressing composition

- **Seed provenance:** S05 / `COMPOSE_DECOMPOSE_SIMPLIFY`; public AArch64 code artifact required.
- **Evidence:** current pass already generates pairs, folds updates/offsets, handles renaming, and exposes scan limits/defaults. [current source](https://llvm.org/doxygen/AArch64LoadStoreOptimizer_8cpp.html)
- **Audit:** INCOMPLETE; `LOCATOR_ONLY`.  No independent natural carrier/problem anchor was closed, and the sketch is a generic local peephole composition.

## QC-05 — accelerator trace overlap law

- **Seed provenance:** S07 / `PROBLEM_REFRAMING`.
- **Audit:** INCOMPLETE; `LOCATOR_ONLY`.  No exact versioned public trace, estimand, or noncontroller decision consequence was frozen.

No unselected seed was retroactively promoted after lookup.
