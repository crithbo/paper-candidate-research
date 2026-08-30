# Baseline action-space / collision matrix — S3 wave 7

## Frozen strongest union

| Component | Same-object information and action space | Full-cost boundary |
|---|---|---|
| Upstream LLVM/ROCm backend | Target-correct LLVM/AMDGPU IR/MIR; instruction selection, register allocation, machine scheduling, and encoding for a specified GFX target. | Compilation time, IR/MIR memory, generated-code legality/semantics, and target-specific metadata. |
| TPDE | SSA-IR analysis followed by a single combined instruction-selection/register-allocation/encoding pass. | Compiler time and generated-code quality as reported by the author work; any candidate must charge its analysis and representation costs. |
| TLX / ML-Triton | Blocked tensor program semantics with multi-level lowering; explicit multi-warp orchestration, data movement, synchronization, and layout information. | Compile time, representation/lowering overhead, generated code, synchronization/data-movement cost, and target semantics. |

## Residual audit

| Route | Exact object | Candidate atomic N2 | Union membership / direct subtractor | Why no `PROPOSE_STAGE0` brief |
|---|---|---|---|---|
| W7-LLVM-01 | LLVM-style SSA-to-machine-code backend compilation | Joint region representation for selection + allocation + encoding | Already inside TPDE’s combined backend action. | No new decision variable, constraint, or guarantee was frozen; rebranding the region granularity fails seed-distance. |
| W7-TRITON-01 | Triton-style blocked tensor lowering with warp-group orchestration | MIMW-like representation for movement/synchronization | Already inside TLX; multi-level layout/lowering is also represented by ML-Triton. | No union-external semantic primitive was identified.  GPU speedup alone would not create N2. |
| W7-LLVM-02 | LLVM whole-program optimization | IR fingerprint → pass-pipeline choice | A scheduling/selection action, not a data representation or algorithmic solver. | Explicitly prohibited selector, even though the official test-suite permits a finite CPU probe. |
| W7-AMDGPU-01 | Specified AMDGPU code generation | GFX-specific bank/dual-issue pairing | Target scheduler/RA action, with a public single issue rather than corpus-wide mechanism. | Single issue and target mapping; no lawful extrapolation across `gfx1250`, CDNA5, TDM/Tensor DMA, or NVIDIA TMA. |

## Evidence-honesty notes

- No union is treated as a magical universal baseline: it is used only where components keep the exact compiler object, information, semantics, and full-cost boundary compatible.
- The two author manuscripts are `DIRECT_SUBTRACT` evidence for their listed action spaces, not a claim that every compiler representation is covered.
- No row relies on a missing implementation or unrun benchmark.  Each stops because no atomic same-object residual action was specified.
