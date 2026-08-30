# Source109 S5 Seed Pool With Pre-Lookup Denylist Checks

| Seed | Anchor candidate | denylist check | Basis / discriminator | Valid selected? |
|---|---|---|---|---|
| S5-109-01 | TGI continuous batching allocator | DISTINCT | TGI allocator/queue carrier; not vLLM/SGLang session lifecycle | YES |
| S5-109-02 | TensorRT-LLM KV cache manager | RELATED_ONLY | distinct runtime but must prove action differs from generic KV lifecycle | YES, conditional |
| S5-109-03 | ONNX Runtime GenAI adapter/session | RELATED_ONLY | distinct API only; must expose non-generic state action | YES, conditional |
| S5-109-04 | llama.cpp CPU/GPU layer topology | EXACT_OR_CONTAINS | llama.cpp heterogeneous cache/offload already in predecessor hold | NO |
| S5-109-05 | TGI prefix-cache/session policy | EXACT_OR_CONTAINS | generic prefix/session lifecycle | NO |
| S5-109-06 | TensorRT-LLM speculative decode cache | EXACT_OR_CONTAINS | generic spec-decode/paged-KV policy | NO |
| S5-109-07 | TGI cold-start benchmark | RELATED_ONLY | only eligible with fixed carrier/event/decision endpoint | YES, conditional |

Offline pool complete before lookup. Exact/contains rows are invalid selected locators and will not be replaced in this assignment.
