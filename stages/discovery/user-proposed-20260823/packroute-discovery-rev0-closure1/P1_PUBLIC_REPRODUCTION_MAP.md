# P1 — public path map

| Segment | Static evidence | Status |
|---|---|---|
| Public checkpoint identity | The Hugging Face artifact lists the exact revision `5a7eae3`, Apache-2.0, `compressed-tensors`, NVFP4/W4A16 and MoE tags; its tree contains a 22.5-GB safetensors model. | CLOSED_LOCATOR_ONLY |
| vLLM source anchor | Official vLLM tag `v0.25.1` exposes `moe_wna16.py` and the quantization tree, including a WNA16 MoE implementation. | CLOSED_SOURCE_ANCHOR |
| Declared vLLM B12x seam | The inspected WNA16 file has no `FlashInfer`, `Marlin`, or `process_weights_after_loading` string; the explicitly attempted `fused_moe/flashinfer_b12x.py` path at the tag returned 404. | UNRESOLVED_EXACT_SEAM |
| FlashInfer source anchor | Official FlashInfer `v0.6.13` exposes `fused_moe/core.py`. It has packed-weight and CUTLASS mixed-MoE surfaces. | CLOSED_SOURCE_ANCHOR |
| Declared FlashInfer B12x seam | The v0.6.13 core has no `B12xMoEWrapper`, `prepare_w4a16_packed_weights`, or `_W4A16_WEIGHT_CACHE` symbol. The current main API has a B12x W4A16 config, but is not a version-compatible substitute. | UNRESOLVED_EXACT_SEAM |

P0 is not closed: the public artifact may be a valid locator, but source evidence
does not establish that it reaches the stipulated frozen B12x preparation seam.
No download or runtime test was performed.

