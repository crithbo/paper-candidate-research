# Source29 RQ Candidates

All variants were written before source lookup. They preserve the exact object and semantic contract within each candidate.

## RQ29-01 — AArch64 SME call-boundary state construction

- Seed / contribution hypothesis: `S29-01`; `COMPILER_TOOL`, `N2`.
- RQ-A: For a fixed SME-enabled LLVM MachineFunction and ABI, can bounded call-boundary state determine a Pareto-optimal legal placement of streaming/ZA preservation actions?
- RQ-B: Can the same fixed function admit an FPT constructor jointly choosing legal SME region boundaries and state restoration without altering caller-visible behavior?
- Selected RQ: RQ-B.
- Immutable boundary: same LLVM IR/MachineFunction, target features, AArch64 SME ABI, observable code behavior/unwind contract.
- Evidence route: official LLVM source + Arm architecture/ACLE material + LLVM regression/MIR carrier; stock compiler/object semantics oracle.
- FINER-lite: feasible `CONDITIONAL`; interesting `CLEAR`; novelty threat `HIGH`; scope `PASS`; relevant `CONDITIONAL`.
- Primary / fallback: LLVM official source/docs / official Git mirror only for transport failure.
- Disposition: `RQ_READY_FOR_EVIDENCE_LOOKUP`.

## RQ29-02 — RISC-V vector configuration transition construction

- Seed / contribution hypothesis: `S29-02`; `COMPILER_TOOL`, `N2`.
- RQ-A: For fixed RVV IR and vector semantics, can a whole-CFG plan reduce legal VTYPE/VL transitions beyond local configuration insertion?
- RQ-B: Does a bounded interface admit a target-specific certified Pareto algorithm jointly choosing configuration transitions and vector state materialization?
- Selected RQ: RQ-B.
- Immutable boundary: fixed LLVM IR, fixed RVV ISA semantics and target feature set, same output and trap behavior.
- Evidence route: LLVM current RISC-V codegen source + official RISC-V V spec + LLVM tests; stock compiler/assembler semantics oracle.
- FINER-lite: feasible `CLEAR`; interesting `CLEAR`; novelty threat `HIGH`; scope `PASS`; relevant `CLEAR`.
- Primary / fallback: LLVM official source/docs + RISC-V official spec / LLVM release source.
- Disposition: `RQ_READY_FOR_EVIDENCE_LOOKUP`.

## RQ29-03 — Ethos-U command/SRAM cascade construction

- Seed / contribution hypothesis: `S29-03`; `COMPILER_TOOL`, `N2`.
- RQ-A: For a fixed TFLite graph and Ethos-U target, can legal native cascade/SRAM alternatives be constructed with a target-specific approximation guarantee?
- RQ-B: Can bounded operator-interface state give an exact/FPT native command constructor while preserving interpreter-visible graph results?
- Selected RQ: RQ-B.
- Immutable boundary: fixed quantized graph, target NPU variant, tensor values and runtime outputs.
- Evidence route: official Vela source/CLI + TFLite interpreter carrier; source and target manual required.
- FINER-lite: feasible `UNCLEAR`; interesting `CLEAR`; novelty threat `MEDIUM`; scope `PASS`; relevant `CONDITIONAL`.
- Disposition: `RQ_READY_FOR_EVIDENCE_LOOKUP`.

## RQ29-04 — Cooperative-matrix region lowering

- Seed / contribution hypothesis: `S29-04`; `COMPILER_TOOL`, `N2`.
- RQ-A: For a fixed cooperative-matrix operation graph, can target-native fragment representation choices be jointly constructed across a region while preserving operation semantics?
- RQ-B: Is there a finite target-specific legality/cost frontier outside independent conversion lowering?
- Selected RQ: RQ-B.
- Immutable boundary: fixed IR operations, target extension and matrix operation semantics.
- Evidence route: current official implementation and ISA/spec; versioned public kernel carrier.
- FINER-lite: feasible `UNCLEAR`; interesting `CONDITIONAL`; novelty threat `HIGH`; scope `PASS`; relevant `CONDITIONAL`.
- Disposition: `RQ_READY_FOR_EVIDENCE_LOOKUP`.

## Pre-evidence rule

No selected RQ is an evidence-qualified raw, a novelty claim, or a proposal. Results may narrow or classify these four fixed locators, but may not substitute a new one.
