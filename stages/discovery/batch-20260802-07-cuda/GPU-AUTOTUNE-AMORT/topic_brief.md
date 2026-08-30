# GPU-AUTOTUNE-AMORT — lifetime-aware Triton autotuning cache portfolio

- Status: `DROP`
- Primary lane: CUDA compiler/runtime
- Discovery date: 2026-08-02

## Research question

Could a service-lifetime-aware policy retain or tune Triton kernel variants under a compile-time budget rather than selecting a single locally fastest configuration?

## Exact object and fair union

Triton kernels under dynamic PyTorch shapes, compared with Triton's existing autotuner/cache plus PyTorch dynamic-shape compilation and TensorRT dynamic-shape selection/layer/kernel caches. The apparent action is cache retention, compilation timing, and per-shape configuration choice.

## Competing mechanisms

- Local fastest-config autotuning.
- TensorRT-style shape-specialized selection/cache fallback.
- A budgeted portfolio/cache admission policy.
- Preferred mechanism: none retained.

## Collision subtraction and decisive falsifier

The residual is only ordinary cache/admission tuning: Triton already reports autotuned configurations and caches compiled kernels; PyTorch supports symbolic/dynamic shapes; TensorRT documents dynamic specialization and selection/layer/kernel caches. An aggregate budget does not create a distinct compiler decision or guarantee. This directly overlaps the history-closed ordinary admission family and is dropped before implementation.

## Executable evidence path

Artifacts are real and an AI could replay compile/configuration logs, but executability cannot repair the missing paper kernel.

## Dual-axis score

- Academic value: `40/70`
- AI executability bonus: `26/30`
- Total: `66/100`

## AI and researcher boundary

No further work authorized.
