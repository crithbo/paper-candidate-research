# Pre-evidence RQ candidates

The following alternatives were frozen before external evidence retrieval.

## S01 — `RISCV_ZIHINTPAUSE__FIXED_CONCURRENCY_CONTRACT__SPINLOOP_CODEGEN_PLACEMENT`

1. Under fixed C/C++ atomic and forward-progress semantics, is there a target-specific construction for PAUSE placement in a spin loop that improves a specified static cost without selecting a runtime backoff policy?
2. Can PAUSE placement be characterized as an ABI-preserving code-generation problem with an exact or approximation guarantee, rather than a tuning heuristic?

## S02 — `OPENGL_SPIRV_SPECIALIZATION__FIXED_SHADER_RESULT_LAYOUT__MODULE_TO_DRIVER_CONSTRUCTION`

1. With fixed shader result, interface layout and OpenGL API semantics, is there a non-driver, non-postprocessor construction for specialization-constant realization with a formal artifact-size/compile-cost guarantee?
2. Does the module-to-driver specialization boundary retain a same-object whole-constructor residual after the stock API and toolchain union is considered?

Neither question is a claim that a residual exists.
