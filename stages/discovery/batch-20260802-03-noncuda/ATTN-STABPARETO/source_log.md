# ATTN-STABPARETO source log

检索日期：2026-08-02；查询族：`KV cache quantization adaptive precision attention stability`, `certified approximate attention`, `long context KV compression`。

| Source | Type | Relevance / collision class |
|---|---|---|
| [KVQuant paper](https://arxiv.org/abs/2401.18079) / [repo](https://github.com/squeezeailab/kvquant) | paper + artifact | direct subtract：低精度 KV cache baseline |
| [ConSmax](https://arxiv.org/abs/2402.10930) / [repo](https://github.com/ReaLLMASIC/ConSmax) | paper + artifact | methodological adjacent：softmax replacement/co-design |
| [Softermax](https://arxiv.org/abs/2103.09301) | paper | methodological adjacent：online low-precision softmax |
| [Approximate Attention Computation](https://openreview.net/pdf?id=PSaJZktut7) | theory paper | adjacent：attention approximation theory/stability assumptions |

检索未闭合 2025–26 adaptive KV work；因此不声称 novelty，Stage 0 应以同一 per-request/layer decision、quality contract 和 full overhead 做 collision gate。
