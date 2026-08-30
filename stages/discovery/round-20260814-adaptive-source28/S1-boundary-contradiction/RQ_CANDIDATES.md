# Pre-evidence research-question candidates

## RQ-S01 — RISC-V BF16 fixed semantic contract

- Tentative public object: one fixed RISC-V BF16-enabled program/ABI/ISA contract, with compiler code generation as producer and architectural/assembler semantics as consumer.
- Contribution type hypothesis: `COMPILER_TOOL`.

1. RQ-A: Under a fixed RISC-V BF16 conversion and rounding contract, can a target-specific construction choose BF16/base-form traces that reduce full cost without changing observable results?
2. RQ-B: For the same program and ABI, can cross-function placement of BF16 conversions give a finite guarantee on conversion count and code size while preserving the frozen numerical contract?
3. RQ-C: For the same program and ABI, is there a stable natural workload law predicting when BF16 form selection has no gain under the frozen contract?

- Selected/merged RQ: RQ-B, only if current source exposes at least two legal form/placement actions; otherwise it is excluded as ordinary instruction selection.
- Scope: fixed C/C++ or LLVM IR program, RISC-V BF16 extension state, ABI and observable FP outcomes. Out: altered precision, reassociation, error tolerance, generic ILP, compiler flag selection.
- FINER-lite: feasible `CONDITIONAL` through official ISA/LLVM paths; interesting `CONDITIONAL`; novelty threat `HIGH`; scope `PASS`; relevance `CONDITIONAL`.
- Earliest falsifier: current LLVM already represents the same interprocedural placement or no second legal action exists under exact FP semantics.
- Precommitted evidence: primary RISC-V BF16 spec + current LLVM RISC-V target source/docs; fallback official LLVM test/source mirror for transport only. No outcome-aware reformulation.
- Disposition: `RQ_READY_FOR_EVIDENCE_LOOKUP`.

## RQ-S02 — SPIR-V physical-storage-buffer ABI

- Tentative public object: one valid SPIR-V module using physical-storage-buffer addressing, fixed environment/version and device-address ABI, compiled by a fixed current producer/runtime pair.
- Contribution type hypothesis: `COMPILER_TOOL`.

1. RQ-A: Under a fixed SPIR-V physical-storage-buffer validity and device-address contract, can a target-specific compiler construction change representation while preserving all reader/runtime observations?
2. RQ-B: For the same valid module and ABI, can a joint pointer-layout/metadata construction give a static size or legality guarantee beyond existing lowering passes?
3. RQ-C: For a versioned public module corpus, is there a stable structural law predicting when the contract induces redundant runtime metadata?

- Selected/merged RQ: RQ-B, conditional on finding a non-generic construction distinct from a SPIR-V optimiser/validator wrapper.
- Scope: fixed module, SPIR-V environment, device-address ABI, validation and runtime semantics. Out: security, changed pointer semantics, validator postprocessing, generic layout solver.
- FINER-lite: feasible `CONDITIONAL` through official SPIR-V registry/LLVM source; interesting `CONDITIONAL`; novelty threat `UNKNOWN`; scope `PASS`; relevance `CONDITIONAL`.
- Earliest falsifier: the only action is existing producer flag/lowering or the module must change validity/ABI.
- Precommitted evidence: primary SPIR-V specification/registry + current LLVM SPIR-V source/documentation; fallback official Khronos tools source. No outcome-aware reformulation.
- Disposition: `RQ_READY_FOR_EVIDENCE_LOOKUP`.

