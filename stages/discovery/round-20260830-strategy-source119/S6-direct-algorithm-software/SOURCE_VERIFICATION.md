# Source Verification — Source119 S6

## Overall assessment

- Sources used: official project repositories, source files, documentation, and project RFC/issues only.
- Fitness: Grade A for claims about current software API/source semantics; not evidence of performance benefit, novelty, Q2 quality, or natural headroom.
- Currency: current main/master views retrieved 2026-08-30; immutable commits were not exposed for all loci, so absence claims are prohibited.
- Conflict note: project-authored materials have intellectual/institutional interest in their own software; used only for native semantics and current mechanisms.

## Decisive source matrix

| Family | Source | Claim fitness | Limitation |
|---|---|---|---|
| RQ01 | DeepGEMM `csrc/apis/gemm.hpp` | A for grouped/masked API semantics | scheduler implementation not closed |
| RQ02 | FlashInfer `flashinfer/decode.py` | A for wrapper existence | incremental plan mutation not closed |
| RQ03 | PyTorch `flex_attention.py` | A for BlockMask structures/helpers | no canonical evolving-mask workload |
| RQ04 | FlashAttention official repo | C for anchor identity only | exact split scheduler locus absent |
| RQ05 | CUTLASS grouped scheduler docs | A for native scheduler modes/actions | implementation-specific performance not independently reproduced |
| RQ06 | llama.cpp `llama-graph.h` | A for current graph reuse semantics | no runtime measurement |
| RQ07 | TensorRT-LLM official repo | C for anchor identity only | exact overlap scheduler source absent |
| RQ08 | torchao RFC #391/current project source | A for layout abstraction intent/semantics | no exact composition carrier |

## Verification limitations

No DOI/programmatic bibliography verification was needed because no academic reference entered a brief. No performance or novelty claim is made. Search/open budget is exhausted at 24/24.
