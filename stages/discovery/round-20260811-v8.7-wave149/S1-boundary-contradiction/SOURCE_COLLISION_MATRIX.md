# SOURCE_COLLISION_MATRIX

| Family | First-party paper/artifact | Current-upstream or direct subtractor checked | Collision/absorption result |
|---|---|---|---|
| TileLink | [MLSys/OpenReview paper](https://openreview.net/forum?id=ccjvBkTRRe) | NVIDIA stream/collective runtime is the necessary same-object comparator; no current author-native action API was established. | Unfrozen, not an absence claim. |
| KPerfIR | [OSDI paper](https://www.usenix.org/conference/osdi25/presentation/guan) | [Triton upstream](https://github.com/triton-lang/triton) compiler-pass model. | The paper's own pass mechanism absorbs a mere profiling pass. |
| FastTree | [MLSys paper](https://proceedings.mlsys.org/paper_files/paper/2025/hash/96894468eb44631a32d7ebd56f9892c7-Abstract-Conference.html), [artifact](https://github.com/PanZaifeng/FastTree-Artifact) | FastTree's kernel plus partition/split runtime. | Direct controller absorption. |
| CASS | [paper](https://arxiv.org/abs/2505.16968), [artifact](https://github.com/GustavoStahl/CASS) | CASS translation pipeline. | Different source/target object. |
| VOLT | [paper](https://arxiv.org/abs/2511.13751), [upstream](https://github.com/vortexgpgpu/vortex) | Current Vortex compiler/runtime sources. | Current completeness not frozen; no residual claim. |
| SIRIUS | [ATC artifact appendix](https://www.usenix.org/system/files/atc25-wang-jiali.pdf), [artifact](https://github.com/SiriusInfTra/Sirius) | Native memory-handover scheduler. | Controller-only residual. |

Latest-collision result: no Stage0 claim is made, so `SEARCH_BOUNDED_OPEN` is not used as a novelty conclusion.
