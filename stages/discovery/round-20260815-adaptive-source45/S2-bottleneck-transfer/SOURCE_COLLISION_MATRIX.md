# Current-union / subtractor matrix

| Family | Current native union | Same-object residual test | Result |
|---|---|---|---|
| Vulkan sparse binding | sparse queue capability and binding operations | needs a target-specific binding constructor/guarantee beyond legal page/bind/queue policy | generic resource binding; structural drop |
| OpenMP rectangular target transfer | rectangular/synchronous/asynchronous copy, allocation, association and dependency routines | needs an action other than composing copy shape and dependency calls | current API composition/generic scheduling; structural drop |
| Kokkos cross-space view | `View` layout/padding, mirror and deep-copy semantics | needs a target-specific action beyond compatible mirror/deep copy or packing | current union/generic packing; structural drop |

Paper collision status is `SEARCH_BOUNDED_OPEN`; this is not a novelty claim. The structural outcomes follow from the frozen native action contracts, not a missing implementation/result/resource claim.
