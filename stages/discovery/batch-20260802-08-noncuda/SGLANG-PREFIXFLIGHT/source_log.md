# Source log — SGLANG-PREFIXFLIGHT

检索日期：2026-08-02；未执行 artifact。

| Source | Role | Evidence / limitation |
|---|---|---|
| [SGLang repository](https://github.com/sgl-project/sglang) | Primary artifact | 项目列出 RadixAttention、continuous batching、prefill/decode disaggregation、paged attention 和多 LoRA；支持对象/可执行性，不证明新机制。 |
| [SGLang RadixAttention documentation](https://docs.sglang.io/advanced_features/radix_attention.html) | Object/baseline | 文档描述 radix trie、page alignment、cache-aware scheduling，并列出 LRU/LFU/FIFO/MRU/FILO/priority eviction 配置。URL 在检索时如迁移，以项目 docs 的 RadixAttention 页面为准。 |
| [SGLang RadixAttention concept page](https://sgl-project-sglang-93.mintlify.app/concepts/radix-attention) | Fallback official doc | 检索到页对齐与 policy source anchors；用于交叉确认公开控制面。 |

Collision result: `SEARCH_BOUNDED_OPEN`; 仍需 Stage 0 的近期论文 collision scan。
