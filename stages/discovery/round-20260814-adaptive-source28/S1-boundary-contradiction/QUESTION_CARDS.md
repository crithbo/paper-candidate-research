# Layered Question Card audit

## QC-S01 — RISC-V BF16 RQ-B

- Exact identity/selection: RISC-V BF16 extensions v1.0 (`Zfbfmin`, `Zvfbfmin`, `Zvfbfwma`) with a fixed BF16/FP32 numerical contract; LLVM current RISC-V target (`llvm/docs/RISCVUsage.rst` on main) is the current-source locus.
- Same-object problem/endpoint: one program/ABI/ISA semantics; hypothetical cross-function choice of BF16 conversion placement, judged by conversion count, code bytes, compile CPU/RSS and runtime while retaining rounding, exceptions, NaNs and subnormal behavior.
- Anchor/carrier: ratified BF16 specification plus the public `riscv-arch-test` route; carrier is a `CANONICAL_FORMAL_ORACLE`, not a natural-deployment claim.
- Counterfactual / discriminator: a valid contribution would need a target-specific state/constraint yielding legal choices beyond ordinary conversion selection.
- Minimum falsifier: show that the action is ordinary conversion placement or is already expressible by existing IR/target selection under the same semantics.
- Finite fidelity route (had it survived): pin one LLVM commit and BF16 test selection; enumerate legal conversion sites; use architectural oracle for numerical legality; account for compile time, code bytes, conversion count and runtime.
- Current evidence: spec fixes the semantic contract and LLVM lists `Zvfbfmin` as supported. No special action state survives after the RQ narrowing.
- Required-now audit: FAIL on non-generic discriminator/atomic action. This is a structural outcome, not a missing-implementation/result decision.
- Disposition: `EXCLUDED_BEFORE_RAW__GENERIC_KERNEL`.

## QC-S02 — SPIR-V physical-storage-buffer RQ-B

- Exact identity/selection: one valid SPIR-V 1.5+ module with `PhysicalStorageBuffer`/`PhysicalStorageBufferAddresses`, fixed environment and device-address ABI; official SPIR-V specification is the semantic anchor.
- Same-object problem/endpoint: choose a pointer-layout/metadata construction without changing module validity or consumer/runtime observation; cost would include module bytes, validation/compile CPU-RSS and runtime metadata.
- Anchor/carrier: Khronos specification plus SPIRV-Tools current source/tool route, which supplies a validator/optimizer and official implementation carrier.
- Counterfactual / discriminator: a valid contribution would need a target-specific compiler/runtime action not equal to validation, canonicalization, optimiser pass selection, or a changed pointer ABI.
- Minimum falsifier: current SPIRV-Tools and producer routes already express the transformation class, or the alleged alternative changes validity/ABI.
- Finite fidelity route (had it survived): pin a validator/producer commit, one public module slice and validation oracle; measure module bytes and producer/validator cost.
- Current evidence: the specification fixes physical addressing and explicit layout; SPIRV-Tools explicitly provides parser, validator and optimiser layers and records physical-storage-buffer validation support.
- Required-now audit: FAIL on non-generic discriminator/atomic action.
- Disposition: `EXCLUDED_BEFORE_RAW__GENERIC_WRAPPER_OR_SOLVER`.

Evidence-qualified raw: `0`. Complete union, strongest paper collision and full witness therefore do not become closure debt.

