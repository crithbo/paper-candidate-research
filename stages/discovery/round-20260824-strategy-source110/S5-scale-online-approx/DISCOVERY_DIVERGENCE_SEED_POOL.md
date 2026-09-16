# Source110 S5 Seed Pool

| Seed | Carrier | denylist | Discriminator / disposition |
|---|---|---|---|
| 110-01 | MNN-LLM memory manager | RELATED_ONLY | only if native session state differs from generic KV lifecycle; selected RQ01 |
| 110-02 | MNN-LLM cache/session | EXACT_OR_CONTAINS | generic session lifecycle; invalid |
| 110-03 | llama.cpp CPU memory planning | EXACT_OR_CONTAINS | static CPU/GPU offload already denied; invalid |
| 110-04 | llama.cpp KV cache quantization | EXACT_OR_CONTAINS | low-bit/cache identity denied; invalid |
| 110-05 | MNN-LLM CPU memory planner measurement | RELATED_ONLY | requires fixed event/endpoint; selected RQ02 |
| 110-06 | OpenVINO/ExecuTorch fallback | EXACT_OR_CONTAINS | predecessor identity; invalid |

Generated offline before lookup. Exact/contains rows are excluded and not replaced.
