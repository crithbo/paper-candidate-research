# UNIQUE_OPPORTUNITY_FAMILIES

## U01 — RVV restart-state loop / call-boundary constructor

- **Exact object:** one RVV program containing a vector load or FOF loop, compiled under a fixed RVV ISA and the RISC-V standard or vector calling-convention variant, with identical normal result, memory effects and observable resumable-trap behavior.
- **Legal action space:** hardware may write `vstart` at a resumable vector trap; re-executing the faulting instruction starts from it and resets it on completion. FOF uses `vl` reduction for a later synchronous exception and uses `vstart` rather than `vl` reduction on an interrupt. Under psABI a procedure may assume `vstart=0` on entry and return; explicit nonzero use must be cleared before any call or return.
- **Initial action-divergence witness:** on a fixed implementation, a trap-resume execution and a noninterrupted execution can reach the same final vector/memory state. This is hardware restart semantics, not a choice available to an interprocedural compiler constructor.
- **Natural carrier / oracle:** the official FOF `strlen`-style data-dependent loop, plus a mapped/unmapped page boundary; ISA/psABI trace legality and Spike/QEMU differential state trace would be a finite StageA oracle if a legal candidate existed.
- **Full cost:** compile time, binary size, dynamic vector/scalar instructions, trap/restart work, emulated runtime, stack/RSS, and all exception-path work.
- **Result:** unique family deep-reviewed and structurally dropped; no same-ABI whole-loop/interprocedural action remains.

