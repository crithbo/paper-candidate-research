# XLA-SHAPE-CACHE Shape-Bucket Compilation Cache

- Status: `DROP`
- Primary lane: npu_compiler_runtime

## Research question
Can shape bucketing and compilation-cache admission be a new dynamic-shape NPU runtime topic?

## Exact object and strongest fair baseline
XLA/PyTorch-XLA compilation cache behavior; baseline is standard compilation caching plus a complete bucket/evict policy.

## Mechanism hypothesis and falsifier
The proposal is a cache selector. It drops because its action is a native cache decision and it lacks a semantic guarantee beyond the policy union.

## Executable evidence path
Public XLA code exists; hardware absence is not the reason for drop.

## Dual-axis score
- Academic value: `30/70`
- AI executability bonus: `20/30`
- Total: `50/100`
