# Claim Matrix — LLVM DWARF Call-Site Revision 1

| Gate obligation | Static evidence supplied | Status | Falsifier / claim ceiling |
|---|---|---|---|
| Pin current LLVM, target/ABI/options/mode | LLVM main `e72ba6cf...`; x86-64 Linux SysV; `-O2 -g`; compatible instruction-reference/LDV configuration | PASS | any different target/mode is a new contract |
| Fixed pre-RA clobber MIR | `%sum`, non-entry `bb.1`, `$rdi` forwarding copy, fixed call-site-info input and SysV call regmask including RAX | PASS | altered source/call/ABI or entry-block fallback invalidates witness |
| Two complete native plans | caller-saved `RAX` vs saved/restored `RBX` with CFI | PASS | metadata-only or omitted CSR CFI fails |
| Identical executable/ABI/unwind semantics | both pass same argument in RDI; B restores RBX and emits CFI | PASS, static | Stage A must verify emitted object/unwind |
| Different valid reconstruction/full-cost coordinates | A unavailable; B native breg call-site parameter; B adds CSR/CFI cost | PASS, static | current grammar must be checked on pinned emitted MIR/object before claim |
| Current union mapping | full allocator + LDV + DwarfDebug + fixed configuration grid enumerated | PASS | any union reproduction removes point |
| Target-specific state | alias/clobber, CSR/CFI/frame, forwarding map and entry eligibility retained | PASS | scalar `(reg,cost)` state is insufficient and forbidden |
| Exact/FPT/certified guarantee | exact Pareto for bounded call-cut class, FPT in `w`; no general RA claim | PASS | arbitrary CFG/full RA extrapolation prohibited |
| Finite Stage A killer | tiny exhaustive witness then 30-function denominator/full-cost plan | PASS | no code/result claimed in Stage 0 |
| No generic/metadata pivot | catalog/exclusions and sentinel explicit | PASS | generic CP/ILP/emitter patch triggers terminal sentinel |

## Decision binding

The gate is closed only for the declared bounded native catalog. Closing review must reject any strengthening to general debug-aware RA, any changed DWARF grammar, or a claim of natural improvement before the frozen Stage A fidelity gate.
