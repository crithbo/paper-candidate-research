# Candidate-grade deep review — D01

## Witness

For a RVC-compressible binary operation, low compressed-register assignment yields a 16-bit encoding. A different legal assignment can avoid a copy or spill but yield a 32-bit form. This is a genuine same-object cost tradeoff.

## Direct absorption

Fried, Stemmer-Grabow and Wachter, *Register Allocation for Compressed ISAs in LLVM* (CC’23), evaluates exactly LLVM’s RISC-V backend. It adapts four components of LLVM greedy RA: priority by potential compressibility, physical-register selection maximizing compressed instructions, spill choice based on compressibility, and copy-versus-compression weighting. These are precisely the requested joint decisions over RVC subset pressure, forms, spills and moves.

Current LLVM also has `RISCVMakeCompressible`, which identifies compressible uses, selects a register needed for compression and updates operands. Current RVC MC compression and assembler/linker relaxation complete the legal encoding pipeline. A proposed exact/FPT/Pareto formulation over the same decisions would either be a generic solver (forbidden), a scalar/model retuning, or a repackaging of the CC’23 algorithm; post-link rewriting is excluded.

## Current reality and finite oracle

The directly relevant actions are positively present in the paper/current source; no absence inference is used. A hypothetical 72-hour check would pin LLVM and binutils, run the public LLVM test-suite/Embench route, inspect assembler/objdump and relocations, and compare full compile/link CPU/RSS, bytes, copies/spills and static uops. It is unnecessary to run because direct same-object algorithmic absorption already decides admission.

## Verdict

`DROP__DIRECT_PAPER_AND_CURRENT_PIPELINE_ABSORPTION`.
