# RQ candidates

## Primary RQ — S81-RQ-01

For a fixed set of RISC-V medlow, position-dependent ELF input objects, ABI, initialized values, symbol interfaces, and program tests, can a target-specific algorithm jointly select a legal `__global_pointer$` location and group-preserving static-data layout before stock LLD GP relaxation, improving the Pareto boundary of code bytes versus data/padding bytes while preserving stock-loader acceptance and program semantics?

The intended N2 is not a flag selector: it would take relocation groups, atomic data-group constraints, and eligible addresses as input; construct one legal layout plus GP point; then use the stock relaxation pass. A future proof would need an exact, FPT, approximation, or certified-Pareto result for this RISC-V constrained instance class.

The RQ deliberately excludes changed ISA, changed ABI, custom reader/loader, multi-GP calling convention, generic ILP as the contribution, and online selection.

No alternate RQ was frozen: the uncertainty is evidentiary, not a genuine same-object question ambiguity.
