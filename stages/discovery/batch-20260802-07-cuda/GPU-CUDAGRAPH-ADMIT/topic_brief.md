# GPU-CUDAGRAPH-ADMIT — conditional CUDA-graph capture and buffer admission

- Status: `DROP`
- Primary lane: CUDA runtime/compiler
- Discovery date: 2026-08-02

## Research question

Can an inference runtime admit conditional subgraphs into CUDA Graph capture using memory/lifetime forecasts?

## Exact object and fair union

CUDA Graph conditional capture with dynamic tensor lifetimes, compared with current CUDA Graph APIs, PyTorch graph compilation, graph-memory reuse, and GraCE-style graph capture systems.

## Competing mechanisms

- Eager/static graph capture.
- Conditional capture with automatic graph memory reuse.
- Admission policy using predicted lifetime/memory pressure.
- Preferred mechanism: none retained.

## Collision subtraction and decisive falsifier

The project history has already stopped GPU-GRAPHCAPTURE and GPU-CONDGRAPH: GraCE directly covers the main capture object, and removing graph-memory automatic lifetime/reuse leaves no independent conditional-buffer residual. An admission score is generic scheduling, while graph/domain fences and lifetime summaries are explicitly prohibited. DROP.

## Executable evidence path

CUDA Graph APIs and PyTorch compilation are public, but no new mechanism exists to test.

## Dual-axis score

- Academic value: `28/70`
- AI executability bonus: `25/30`
- Total: `53/100`

## AI and researcher boundary

No further work authorized.
