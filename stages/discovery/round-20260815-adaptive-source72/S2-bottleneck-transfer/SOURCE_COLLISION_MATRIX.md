# Source / collision matrix — Source72

| Family | Current / prior subtractor | Reason it closes | Disposition |
|---|---|---|---|
| IREE VMFB | Source54 fixed VMFB/current runtime review | Same VMFB module, stock loader and archive/runtime metadata endpoint; no external delta. | `EXCLUDED_REPEATED` |
| TensorRT serialized engine | Current NVIDIA builder/capabilities and runtime reader documentation | Complete build → serialized plan → deserialization/action surface, including config/tactics/cache/stream reader, is current union; alternate sketch is generic packing/configuration. | `STRUCTURAL_DROP` |
| GCC LTO partition | Source16 preflight plus current GCC optimize-options manual | Current LTO explicitly provides partition choices, default, cache and linker composition; exact previous partition identity lacks a new residual. | `EXCLUDED_REPEATED` |

No global novelty or current-absence conclusion is claimed.
