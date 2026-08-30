# GPU-FP8-PHASE — phase-aware FP8 scale switching across operators

- Status: `DROP`
- Primary lane: CUDA quantization/compiler
- Discovery date: 2026-08-02

## Research question

Can an inference runtime choose FP8 scale granularity by prefill/decode phase across adjacent operators?

## Exact object and fair union

TorchAO FP8 quantization on CUDA models, compared against its supported dynamic configurations and the active `GPU-MXSCALEFLOW` candidate's exact cross-operator block-scale payload/metadata-flow object.

## Competing mechanisms

- Per-operator dynamic FP8 configuration.
- Static model-wide scale format.
- Cross-operator phase-aware scale/metadata propagation.
- Preferred mechanism: none retained.

## Collision subtraction and decisive falsifier

The proposed decision requires preserving or changing scales/metadata across operator boundaries. That is the active GPU-MXSCALEFLOW research object, merely using phase as a predicate. TorchAO additionally supplies current FP8 implementations and model recipes. The discovery task cannot create a parallel synonym or a competing Stage-0 path; therefore DROP.

## Executable evidence path

TorchAO is publicly executable, but no separate paper kernel remains.

## Dual-axis score

- Academic value: `35/70`
- AI executability bonus: `27/30`
- Total: `62/100`

## AI and researcher boundary

No further work authorized.
