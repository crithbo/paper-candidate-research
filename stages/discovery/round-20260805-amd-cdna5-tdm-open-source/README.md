# Discovery result: AMD CDNA5 / TDM open-source line

## Result

`ZERO_PROPOSALS` — no `TOPIC_BRIEF_<ID>.md` was produced and no Stage 0 is recommended.

The decisive boundary is not that the mechanism is uninteresting. It is that the public evidence has two different objects: AMD’s CDNA5 product/architecture documentation and the LLVM/Triton `gfx1250` (RDNA4) compiler route. The inspected official sources do not equate them. Treating `gfx1250` functionality as a CDNA5 result would violate same-object evidence.

On the executable `gfx1250` route, upstream Triton already contains the obvious contribution nucleus: AMD warp pipelining (#8586), warp specialization (#8947), and multi-CTA A/B tile multicast with accumulator partitioning (#9342). Rebranding these open implementations as a joint TDM/WMMA contribution would be a direct collision. The remaining model, verification, and portability concepts lack respectively natural headroom, a real fault, or a semantics-preserving, falsifiable residual.

Read in this order:

1. `OFFICIAL_FACT_BOUNDARY.md` — terminology and claim ceiling.
2. `SEARCH_LOG.md` — first-party search and collision scope.
3. `DIRECTION_MATRIX.md` — all six examined directions, baselines, full costs, counterexamples, and falsifiers.
4. `handoff.yaml` — machine-readable handoff for mainline acceptance.

No GPU runs, formal experiments, automatic code generation, Stage 0 creation, or modifications outside this directory were made.

