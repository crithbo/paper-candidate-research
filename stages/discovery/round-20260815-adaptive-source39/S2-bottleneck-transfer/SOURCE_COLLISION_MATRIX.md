# Current-union / relation matrix — Source39 S2

| family | relation to prior surface | current union result |
|---|---|---|
| OpenMP target map | Fresh object/action/endpoint | map/data-environment union, pre-raw exclusion |
| NVSHMEM tile collective | Related to Source38 NVSHMEM team/QP, but distinct tile action/collective endpoint | tile layout/algorithm/wait union, pre-raw exclusion |
| Level Zero image | Related to Source38 VM, but distinct image object/reader endpoint | custom layout would change reader or become generic packing, pre-raw exclusion |

No exact identity or terminal-containment exclusion was invoked; OFST and NVPTX tcgen05 were not reopened.
