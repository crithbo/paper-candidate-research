# Source / collision matrix — Source71

| Family | Current/offical evidence | Strongest contrary explanation | Disposition |
|---|---|---|---|
| JDK jlink image | Official tool guide exposes module closure plus compression, string-sharing, endian and plugin options. | Any unfrozen image/index change is plugin choice or generic physical packing; no target-specific constructor/guarantee was named. | `STRUCTURAL_DROP` |
| rustc rmeta metadata | Official compiler guide describes `rustc_metadata`, query outputs, specialised encoding/decoding and byte-offset reuse. | A global metadata layout without a distinct semantic/complexity guarantee is generic serialization and is already represented by current encoder concepts. | `STRUCTURAL_DROP` |
| HIP code-object load | Official HIP guide/API describe bundling, one-time registration, loading, unloading and function binding. | Bundle ordering, module selection or API load policy is current union/generic packing; no separate complete action remains. | `STRUCTURAL_DROP` |

No current-absence claim or global novelty assertion is made. CUDA similarity is only `RELATED_ONLY`, not an identity exclusion.
