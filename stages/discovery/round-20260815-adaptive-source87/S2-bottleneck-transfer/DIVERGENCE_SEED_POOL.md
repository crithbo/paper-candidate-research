# Non-evidence seed pool

| Seed | Engine | Idea | Selected |
|---|---|---|---|
| Initialization/heap co-construction | phase inversion | Startup optimization transfers cost from class checks to image-heap footprint/locality | yes |
| Reachability/layout coupling | recombination | Reachability trimming changes static-state layout | no |
| Reflection metadata residency | adjacency | closed-world metadata planning can dominate after AOT code generation | no |
| Build/runtime initialization frontier | contradiction | build initialization saves runtime work but fixes image state | no |
| Object relocation/page locality | abstraction ladder | heap construction may affect cold start access cost | no |
| Class-init proof partition | constraint manipulation | semantic-safe initialization choices might couple with heap layout | no |

No seed establishes novelty, residual, or a candidate.
