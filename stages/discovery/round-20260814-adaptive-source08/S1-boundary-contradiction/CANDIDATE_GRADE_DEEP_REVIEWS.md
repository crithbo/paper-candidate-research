# Candidate-grade deep reviews

## D01 — LLVM DWARF call-site parameter reconstructibility

**Current reality and fair union.** LLVM states that debug instructions are intentionally separated from register allocation, then reattached after allocation; locations that are not live become undefined ([Source Level Debugging](https://llvm.org/docs/SourceLevelDebugging.html)). `LiveDebugValues` propagates locations/copies/spills after allocation, while `AsmPrinter` can form a call-site parameter entry value. Current first-party documentation and source also show instruction-reference and location-dataflow implementations ([InstrRef](https://llvm.org/docs/InstrRefDebugInfo.html), [LDV source](https://llvm.org/doxygen/LiveDebugValues_8cpp_source.html)). The fair baseline is this entire normal `-g` pipeline, including LiveDebugVariables, RA/spills, LiveDebugValues, `DwarfDebug` and the normal target hooks—not a weakened single pass.

**Attackable residual.** For a fixed MachineIR call graph and ABI, choose a bounded set of already legal retention actions (keep a value in a non-clobbered location, reuse an already necessary spill, or emit a legal entry/rematerialization expression) jointly with call-site expression emission. The proposed `CallSite-Reconstructibility Pareto DP` is over the call-site/clobber graph: it maximizes a weighted set of reconstructible parameters subject to code-byte, additional spill and compile-time budgets. It never changes the executable value, calling convention or DWARF legality.

**Witness.** A parameter reaches a call in a clobbered argument register. Stock output may legally emit an entry expression or no reconstructible call-site value; another legal codegen trace retains the value through an existing/selected spill or a proven legal expression. Both have the same executable result, but differ in a verifier-visible `DW_AT_call_site_parameter` reconstruction result and cost. The witness is a Stage0 attack target, not a claimed observation.

**Collision result.** `SEARCH_BOUNDED_OPEN`: the current LLVM dataflow is a direct subtractor for post-allocation propagation, but the bounded search did not locate a first-party implementation or primary paper establishing the stated joint Pareto objective over allocation-retention and call-site-DWARF legality. This is not an absence claim; Stage0 must independently redo the direct-paper/current-source audit.

**Disposition.** `READY_FOR_CANONICAL_BRIEF`; `FINITE_FIDELITY_GAP`. A finite closure is available, and the potential contribution is a nontrivial compiler-tool N2 rather than a flag or postprocessor.

## D02 — Wasm GC recursive-type group construction

The GC specification makes recursive groups semantic: members receive type indices and may declare subtype relations ([specification](https://webassembly.github.io/gc/core/syntax/types.html)). The proposed two partitions cannot be assumed to preserve type-index/subtyping observations. No finite static certificate was found that permits arbitrary rec-group re-partition while retaining the same validated module object. The remaining route would either alter the module’s semantic type structure or be a generic binary rewriter.

**Disposition:** `DROP` (same-object action does not survive).

## D03 — RISC-V Zacas versus LR/SC lowering

The ratified ISA exposes Zacas; current LLVM documents Zacas support and explicit atomics-ABI mappings ([ISA](https://docs.riscv.org/reference/isa/_attachments/riscv-unprivileged.pdf), [LLVM usage](https://github.com/llvm/llvm-project/blob/main/llvm/docs/RISCVUsage.rst)). The two-action witness is real, but a region-level mixture has no frozen constraint beyond normal atomic instruction selection, target feature use and existing memory-order legality. No target-specific guarantee separate from instruction-selection cost modelling was established.

**Disposition:** `DROP` (ordinary target lowering/cost tuning residual).

