# Source and direct-collision matrix

| Review | Official/current source evidence | Primary same-object paper/artifact evidence | Current-union result | Collision / decision |
|---|---|---|---|---|
| Faiss IVF/PQ | Faiss official [index factory](https://github.com/facebookresearch/faiss/wiki/The-index-factory), [index catalogue](https://github.com/facebookresearch/faiss/wiki/Faiss-indexes), and [auto-tuning route](https://github.com/facebookresearch/faiss/wiki/Indexing-1M-vectors) | [RAIRS: Optimizing Redundant Assignment and List Layout for IVF-Based ANN Search](https://arxiv.org/abs/2601.07183) | Composite IVF/PQ/refinement and search-parameter union is documented | Primary direct paper covers intended redundant-assignment/list-layout shape: `STRUCTURAL_DROP` |
| HiGHS LP basis/crash | [HiGHS official repository](https://github.com/ERGO-Code/HiGHS) and its official documentation link | No primary same-object collision is asserted because source/action closure is incomplete | Complete default/non-default crash/presolve/basis union not pinned | `NOT_ADMITTED_UNFROZEN`; no current-absence claim |

All web material was frozen as a source check on 2026-08-11. Paper limitations were not used as absence evidence.
