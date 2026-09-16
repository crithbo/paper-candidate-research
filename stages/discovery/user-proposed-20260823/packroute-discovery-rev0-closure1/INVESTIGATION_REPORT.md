# PackRoute pre-topic source-closure report

## Disposition

`UNRESOLVED_BACKLOG__NO_SCIENTIFIC_INFERENCE`

## What closed

The public checkpoint locator is versioned and tagged as a compressed-tensors
NVFP4/W4A16 MoE artifact. Official source anchors for vLLM 0.25.1 and
FlashInfer 0.6.13 are available. The source audit also confirms that later
FlashInfer main has B12x W4A16 materialization APIs.

## Why no topic is created

The B12x API found on FlashInfer main cannot establish behavior for FlashInfer
0.6.13. In the exact vLLM tag, the inspected WNA16 implementation lacks the
declared B12x symbols and a direct B12x fused-MoE source path returned 404.
Consequently P0/P1 are not closed: this package cannot prove the same public
checkpoint reaches a common legal B12x/Marlin choice set under the frozen stack.

## Bounded debt and next condition

A new, separately frozen source-only task would need a version-consistent single
vLLM/FlashInfer source pair and three named loci (B12x selection, B12x
prepare/run ownership, Marlin legal route). It must not silently update the
checkpoint, checkpoint format, backends, or release pair. Measurements remain
a later bounded debt and are not requested here.

## Scope and claim ceiling

No raw, Topic ID, Stage 0 proposal, algorithm novelty claim, performance claim,
or resource blocker is created. QRefine/QNN/QPack/QGroup were not read or
modified.

