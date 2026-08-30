# Source29 collision and current-union matrix

| Family | Exact object | Current official evidence | Strongest direct/contrary result | Current disposition |
|---|---|---|---|---|
| `AARCH64-SME-JOINT-TILE-ABI-CONSTRUCTION` | fixed ArmSME MLIR/LLVM CFG, call attributes, target features and ABI | LLVM SME documentation and current source expose ABI state, lazy-save predicates, streaming/ZA pass options and conversion-integrated tile allocation | `SEARCH_BOUNDED_OPEN`: the exact *joint certified tile-ID + ABI-state* constructor has not been checked against complete same-object literature; debt transferred to Stage0 | conditional `PROPOSE_STAGE0__FINITE_FIDELITY_GAP` |
| `RISCV-VTYPE-VL-TRANSITION-CONSTRUCTION` | fixed LLVM RVV MachineFunction / V semantics | `RISCVInsertVSETVLI` collects effects, runs cross-BB dataflow and inserts transitions; docs position it after allocation | direct current-union absorption kernel for the proposed configuration-state core | `STRUCTURAL_DROP` |
| `ETHOS_U_CASCADE_SRAM_COMMAND_CONSTRUCTION` | fixed quantized graph / target NPU / command output semantics | Vela public material exposes target and output controls | current source action union/oracle not closed; not an absence conclusion | `LOCATOR_ONLY` |
| `COOPERATIVE_MATRIX_REGION_LOWERING` | fixed cooperative matrix IR / target extension | SPIR-V fixes layouts and LLVM has related layout code | family identity overlaps historical GPU/SPIR-V surfaces without mainline-confirmed distinct signature | `LOCATOR_ONLY` |

## Current-upstream reality check

- SME: official docs, generated current source documentation, and MLIR `-streaming-mode`, `-za-mode`, `-if-required-by-ops` options were checked. The candidate does **not** claim that a stock primitive is absent; its claim is a possible joint N2 over state already represented by native passes.
- RVV: official current source and documentation show precisely the cross-block dataflow/insertion mechanism. This is direct evidence of absorption, not a resource/readiness inference.
- Vela and cooperative matrix: lack of a bounded current-source triad is recorded as locator/source closure debt, not absence.
