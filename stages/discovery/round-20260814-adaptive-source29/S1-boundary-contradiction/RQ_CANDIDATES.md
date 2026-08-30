# Pre-evidence RQ candidates

## RQ-S01 — RISC-V Zfinx compiler/ABI boundary

1. RQ-A: Under a fixed Zfinx ISA and C/C++ floating-point outcome contract, can a target-specific construction choose integer-register FP value traces with lower full cost than current lowering?
2. RQ-B: For the same program, target and ABI, can interprocedural Zfinx value placement provide a finite guarantee on integer-register pressure and conversion traffic without changing the ABI?
3. RQ-C: For a public canonical ISA test corpus, is there a stable no-gain law for Zfinx lowering under fixed FP semantics?

- Selected RQ: RQ-B conditional on a target-specific action distinct from generic RA/ABI change.
- Scope: fixed program, target, ABI, rounding/exception outcome; out: ABI replacement, generic RA/ILP, precision relaxation, security.
- FINER-lite: feasible `CONDITIONAL`; interesting `CONDITIONAL`; novelty threat `HIGH`; scope `PASS`; relevant `CONDITIONAL`.
- Falsifier: current LLVM/GCC lowering contains no target-specific state beyond ordinary integer-register allocation.
- Precommitted route: RISC-V Zfinx spec → LLVM RISC-V current source/docs → official architectural test route; fallback GCC source/doc only for transport failure.
- Disposition: `RQ_READY_FOR_EVIDENCE_LOOKUP`.

## RQ-S02 — WebAssembly memory64 host ABI boundary

1. RQ-A: Under a fixed memory64 module and engine ABI, can a compiler/runtime representation action preserve all linear-memory observations while reducing boundary conversion cost?
2. RQ-B: For the same component and host ABI, can a joint memory64 pointer/offset construction guarantee bounds/representation legality beyond existing engine lowering?
3. RQ-C: In a versioned public module corpus, is there a stable structural condition identifying no-gain memory64 boundaries?

- Selected RQ: RQ-B conditional on a non-wrapper engine-native action.
- Scope: fixed module, memory64 feature, engine and host ABI; out: changed linear-memory semantics, bindings/adapters, generic pointer pass, security.
- FINER-lite: feasible `CONDITIONAL`; interesting `CONDITIONAL`; novelty threat `HIGH`; scope `PASS`; relevant `CONDITIONAL`.
- Falsifier: current engine/compiler already owns all pointer/offset representations, or any alternative changes memory64/host ABI observation.
- Precommitted route: Wasm memory64 proposal/spec → current Wasmtime source/docs → official test-suite/engine carrier; fallback WebAssembly spec repository.
- Disposition: `RQ_READY_FOR_EVIDENCE_LOOKUP`.

